package com.bf.myPage.service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.member.model.MemberDto;
import com.bf.member.model.User;
import com.bf.myPage.dao.MyPageDao;
import com.bf.myPage.dto.MyPageCashChargeDto;
import com.bf.myPage.dto.MyPageCashPageDto;
import com.bf.myPage.dto.MyPagePointDto;
import com.bf.myPage.dto.MyPagePurchasedPageDto;
import com.bf.myPage.dto.MyPageRecentPageDto;
import com.bf.order.dto.OrderDto;

/**
 * @author	박성호
 * @date	2018. 2. 12.
 * @description	마이페이지 Service 클래스 구현
 * 리디캐시 들어가면 request에  input=radio 2개 value 값 받아온다.
 * 받아온 radio1의 통해서 point 값 얻어오고 point 값으로 MyPagePoint 테이블에 값들을 때려박자
 * id는 임시id인 "abc123"으로 num은 순차적으로 오르고 포인트 타입은 "마이캐시 충전 보너스 마이포인트"로 고정
 * 상태는 소멸 or 소멸예정 or - 중 택 1
 */

@Component
public class MyPageServiceImp implements MyPageService {
	@Autowired
	private MyPageDao myPageDao;

	/**
	 * @author : 정호열
	 * @date : 2018. 2. 20.
	 * comment : 마이캐시 충전 시, DB point 테이블에 데이터 저장.
	 */
	@Override
	public void myCashOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// menu_num : 첫 번째 라디오 타입 번호 / 해당 번호의 cash_charge_menu 테이블의 내용
		// type_num : 두 번째 라디오 타입 번호 / 해당 번호의 cash_charge_type 테이블의 내용
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		
		String menu_num = request.getParameter("menu_num");
		String type_num = request.getParameter("type_num");
		String point_type = "마이캐시 충전 보너스 마이포인트";
		String state = "on";
		
		LogAspect.info(menu_num + "," + type_num + "," + point_type);
		
		MyPagePointDto myPagePointDto = new MyPagePointDto();
		myPagePointDto.setId(id);
		// point에 request로 받아온 menu_num을 넣었습니다.
		myPagePointDto.setPoint(Integer.parseInt(menu_num));
		myPagePointDto.setPoint_type(point_type);
		myPagePointDto.setState(state);
		LogAspect.info(myPagePointDto.toString());
		// 선택된 id 계정에 포인트 테이블의 데이터를 넣어줘야함. point는 cash_charge_menu의 charge_cash와 percentage/100을 곱해서 넣어야함.
		
		int check1 = myPageDao.pointInsert(myPagePointDto);	
		LogAspect.info(check1);
		
		String cash_type = "마이캐시 충전";
		
		MyPageCashChargeDto myPageCashChargeDto = new MyPageCashChargeDto();
		myPageCashChargeDto.setId(id);
		// charge_cash와 percentage가 담겨있는 번호
		myPageCashChargeDto.setCharge_cash(Integer.parseInt(menu_num));
		// 결제수단이 담겨있는 번호
		myPageCashChargeDto.setCharge_type_num(Integer.parseInt(type_num));
		myPageCashChargeDto.setCash_type(cash_type);
		myPageCashChargeDto.setOrder_num(System.currentTimeMillis());
		LogAspect.info(myPageCashChargeDto.toString());
		
		int check2 = myPageDao.cashChargeInsert(myPageCashChargeDto);
		LogAspect.info(check2);
		
		mav.addObject("check1", check1);
		mav.addObject("check2", check2);
		mav.addObject("myPagePointDto", myPagePointDto);
		mav.addObject("myPageCashChargeDto", myPageCashChargeDto);
		mav.setViewName("myPage/payment/myCashOk.my");
	}

	/**
	 * @author : 김동환
	 * @date : 2018. 2. 19.
	 * comment : 회원정보 변경
	 */
	@Override
	public void myInfoUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		
		LogAspect.info(memberDto.toString());
		
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		
		LogAspect.info(password + ", " + email);
		
		
	}

	/**
	 * @author : 정호열
	 * @date : 2018. 2. 20.
	 * comment : 마이포인트 페이지에 데이터 순차적으로 출력.
	 */
	@Override
	public void myPoint(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		
		List<MyPagePointDto> myPagePointDtoList = myPageDao.myPointList(id);
		LogAspect.info(myPagePointDtoList.size());
		
		int total = 0;
		for(int i = 0; i < myPagePointDtoList.size(); i++){
			 total += myPagePointDtoList.get(i).getRemain();
		}
		
		int extinction = myPageDao.myPointExtinctionSelect(id);
		
		mav.addObject("myPagePointDtoList", myPagePointDtoList);
		mav.addObject("total", total);
		mav.addObject("extinction", extinction);
		mav.setViewName("myPage/payment/myPoint.my");
	}

	/**
	 * @author : 정호열
	 * @date : 2018. 2. 21.
	 * comment : 마이캐시히스토리캐시 페이지에 데이터 순차적으로 출력.
	 * 			  마이캐시히스토리캐시 페이지에 총 마이캐시 출력
	 */
	@Override
	public void myCashHistoryCash(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		
		List<MyPageCashPageDto> myPageCashPageDtoList = myPageDao.myCashPageList(id);
		LogAspect.info(myPageCashPageDtoList.size());
		
		int total = 0;
		for(int i = 0; i < myPageCashPageDtoList.size(); i++){
			 total += myPageCashPageDtoList.get(i).getCharge_cash();
		}
		
		mav.addObject("myPageCashPageDtoList", myPageCashPageDtoList);
		mav.addObject("total", total);
		mav.setViewName("myPage/payment/myCashHistoryCash.my");
	}

	/**
	 * @author : 정호열
	 * @date : 2018. 2. 21.
	 * comment : 마이캐시 페이지에 총 마이캐시 출력.
	 */
	@Override
	public void myCash(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		
		List<MyPageCashPageDto> myPageCashPageDtoList = myPageDao.myCashPageList(id);
		LogAspect.info(myPageCashPageDtoList.size());
		
		int total = 0;
		for(int i = 0; i < myPageCashPageDtoList.size(); i++){
			total += myPageCashPageDtoList.get(i).getCharge_cash();
		}
		
		mav.addObject("myPageCashPageDtoList", myPageCashPageDtoList);
		mav.addObject("total", total);
		mav.setViewName("myPage/payment/myCash.my");
	}

	/**
	 * @author : 정호열
	 * @date : 2018. 2. 22.
	 * comment : 최근 본 책 페이지에 데이터 순차적으로 출력.
	 */
	@Override
	public void recentLookBook(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		
		List<MyPageRecentPageDto> myPageRecentPageDtoList = myPageDao.MyRecentPageList(id);
		LogAspect.info(myPageRecentPageDtoList.size());
		LogAspect.info(myPageRecentPageDtoList.toString());
		
		mav.addObject("myPageRecentPageDtoList", myPageRecentPageDtoList);
		mav.setViewName("myPage/library/recentLookBook.my");
	}

	/**
	 * @author : 정호열
	 * @date : 2018. 2. 22.
	 * comment : 구매목록 페이지에 state가 'yes'로 되있는 데이터 순차적으로 출력.
	 */
	@Override
	public void purchased(ModelAndView mav) {	
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		
		List<MyPagePurchasedPageDto> myPagePurchasedPageDtoList = null;
		
		String searchValue = request.getParameter("searchWord");
		LogAspect.info(searchValue);
		int purchased_count = -1;
		if(searchValue != null){
			myPagePurchasedPageDtoList = myPageDao.PurchasedPageList(id, searchValue);
		}else{
			myPagePurchasedPageDtoList = myPageDao.PurchasedPageList(id);
			purchased_count = myPagePurchasedPageDtoList.size();
		}
		
		LogAspect.info(myPagePurchasedPageDtoList.size());
		
		if (purchased_count >= 0) mav.addObject("purchased_count", purchased_count);
		else mav.addObject("purchased_count",request.getParameter("purchased_count"));
		
		mav.addObject("myPagePurchasedPageDtoList", myPagePurchasedPageDtoList);
		mav.addObject("searchValue", searchValue);
		mav.setViewName("myPage/library/purchased.my");
	}

	/**
	 * @author : 정호열
	 * @date : 2018. 2. 22.
	 * comment : 구매목록 페이지에 check된 책 영구삭제 버튼 누르면 state가 'no'로 변경 및 화면상에서 사라짐.
	 */
	@Override
	public void purchasedDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		
		String[] book_num = request.getParameterValues("book_num");
		
		int check = myPageDao.PurchasedDelete(id, Arrays.asList(book_num));
		LogAspect.info(check);
		
		mav.addObject("check", check);
		mav.setViewName("myPage/library/purchasedDelete.my");
	}

	/**
	 * @author : 정호열
	 * @date : 2018. 2. 22.
	 * comment : 최근본책 페이지에 전체삭제 버튼 누르면 recent_lookbook 테이블의 모든 데이터가 지워져  화면상에서 사라짐.
	 */
	@Override
	public void recentLookBookDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		
		int check = myPageDao.RecentDelete(id);
		LogAspect.info(check);
		
		mav.addObject("check", check);
		mav.setViewName("myPage/library/recentLookBookDelete.my");
	}

	/**
	 * @author : 정호열
	 * @date : 2018. 2. 23.
	 * comment : 마이캐시 충전내역에서 선택하고자 하는 부분을 클릭하면 그 주문번호와 id에 맞는 데이터를 뽑아옴.
	 */
	@Override
	public void myCashHistoryCashClick(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		
		long order_num = Long.parseLong(request.getParameter("order_num"));
		
		OrderDto orderDto = myPageDao.HistoryCashClick(id, order_num);
		LogAspect.info(orderDto.toString());
		
		mav.addObject("orderDto", orderDto);
		mav.setViewName("myPage/payment/myCashHistoryCashClick.my");
	}

	
}
