package com.bf.main.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tools.ant.filters.FixCrLfFilter.AddAsisRemove;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dto.DetailDto;
import com.bf.main.dao.MainDao;
import com.bf.main.dto.CategoryPageDto;
import com.bf.main.dto.EventDto;
import com.bf.main.dto.NoticeDto;
import com.bf.main.dto.SearchAuthorDto;
import com.bf.main.dto.SearchBookCountDto;
import com.bf.member.model.MemberDto;
import com.bf.member.model.User;
import com.sun.jmx.remote.security.NotificationAccessController;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */

@Component
public class MainServiceImp implements MainService {
	@Autowired
	private MainDao mainDao;

	/*
	 * 메인 검색 페이지 검색 기능 구현
	 * 1. 입력 키워드를 포함한 저자 리스트 출력
	 * 2. 입력 키워드를 포함한 도서 리스트 출력
	 * 도서 리스트는 전체 출력과 카테고리별 출력을 제공한다. 여기서 주의할 점은 검색 결과를 카운팅할 때, 전체 출력과 카테고리별 출력의 결과에 차이가 있다는 점이다.
	 * 전체 출력은 중복 카테고리를 가지고 있는 도서를 하나로 카운팅해서 검색하는 반면, 카테고리별 출력은 중복 카테고리를 가지는 도서를 각 카테고리에서 중복해서 카운팅하기 때문이다.
	 * 
	 * @author 박성호
	 * @date 2018. 2. 28.
	 * @see com.bf.main.service.MainService#mainSearch(org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public ModelAndView mainSearch(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest)mav.getModelMap().get("request");
		
		String keyword = request.getParameter("keyword");
		String cnum = request.getParameter("cnum");
		String onum = request.getParameter("onum");
		
		int thirdCateNum = cnum == null ? 0 : Integer.parseInt(cnum);
		int orderTypeNum = onum == null ? 100 : Integer.parseInt(onum);
		LogAspect.info("cnum/snum/keyword:" + thirdCateNum + "/" + orderTypeNum  + "/" + keyword);
		
		// Pagination 설정
		String pnum = request.getParameter("pnum");
		int pageNumber = pnum == null ? 1 : Integer.parseInt(pnum);

		int boardSize = 20;
		int endRow = pageNumber * boardSize;
		int startRow = endRow - boardSize + 1;
		int count = 0;
		int totalCount = 0;
		
		List<SearchBookCountDto> searchBookCountList = null;
		List<SearchAuthorDto> searchAuthorList = null;
		List<CategoryPageDto> searchBookList = null;
		
		if (keyword != null) {
			// 검색 결과 카운팅(카테고리별 카운팅, 전체 카운팅)
			searchBookCountList = mainDao.selectSearchBookByCategoryCount(keyword); 
			totalCount = mainDao.selectSearchBookCount(keyword);
			LogAspect.info(totalCount + " / " + searchBookCountList);
			
			// 선택된 카테고리의 카운팅 결과를 추출
			for(SearchBookCountDto e : searchBookCountList) {
				if (e.getNum() == thirdCateNum) {
					count = e.getCount();
					break;
				}
			}
			LogAspect.info("pnum/count/start/end:" + pageNumber + "/" + count + "/" + startRow + "/" + endRow);
			
			// 저자 검색
			searchAuthorList = mainDao.selectSearchAuthor(keyword);
			LogAspect.info(searchAuthorList.size());
			
			// 책(+출판사) 검색
			// thirdCateNum(소분류 카테고리): 0이면 전체검색, orderTypeNum(정렬기준): 최신순(100), 별점순(101), 리뷰평가순(102), 낮은가격순(103) 
			searchBookList = mainDao.selectSearchBook(keyword, thirdCateNum, orderTypeNum, startRow, endRow);
			LogAspect.info(searchBookList.size());
		}
		
		mav.addObject("pnum", pageNumber);
		mav.addObject("count", thirdCateNum == 0 ? totalCount : count);
		mav.addObject("totalCount", totalCount);
		mav.addObject("boardSize", boardSize);
		
		return mav.addObject("searchAuthorList", searchAuthorList)
				.addObject("searchBookList", searchBookList)
				.addObject("searchBookCountList",searchBookCountList);
	}

	/*
	 * 메인 검색창 제안(suggest) 기능 구현
	 *  
	 * @author 박성호
	 * @date 2018. 3. 1.
	 * @see com.bf.main.service.MainService#suggestKeyword(org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void suggestKeyword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String keyword = request.getParameter("keyword");
		String type = null;
		
		if (keyword == null) return;
		if (keyword.length() == 0) return;
		
		LogAspect.info("keyword:" + keyword);

		// keyword 검색 결과(저자 및 도서)
		List<Map<String,Object>> suggestAuthorList = mainDao.suggestKeyword(keyword);
		List<Map<String,Object>> suggestBookList = mainDao.suggestKeyword(keyword, "book");
		
		LogAspect.info("suggestAuthor:" + suggestAuthorList.size());
		LogAspect.info("suggestBook:" + suggestBookList.size());
		
		JSONObject json = new JSONObject();
		json.put("author", suggestAuthorList);
		json.put("book", suggestBookList);
		
		System.out.println(json.toJSONString());
		
		response.setContentType("application/x-json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//out.print(JSONValue.toJSONString(suggestAuthorList));
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}

	/*
	 * 전체보기 메뉴의 카테고리별 보기 페이지
	 * 
	 * @author 박성호
	 * @date 2018. 2. 27.
	 * @see com.bf.main.service.MainService#category(org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public ModelAndView category(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest)mav.getModelMap().get("request");
				
		String cnum = request.getParameter("cnum"); // 카테고리(중분류 + 소분류)
		String snum = request.getParameter("snum"); // 서비스타입(홈,신간,베스트셀러,무료,전체)
		
		// cnum으로부터 중분류(second), 소분류(third) 카테고리 번호 추출
		// cnum은 4자리 정수값. 상위 2자리는 중분류 번호이고, 하위 2자리는 소분류 번호이다.
		// cnum에서 소분류 번호는 0~99의 값을 가지고, 각기 속한 중분류 번호에 의해 관리되기 때문에 중복된 값이 존재한다.
		// 하지만, 소분류 번호는 실제 데이터베이스에서는 모든 번호가 통합 관리되어 1~127의 값을 가진다.
		
		// 100 단위 cnum -> 중분류 카테고리 전체 검색 -> secondCateNum = 1 ~ 24, thirdCateNum 없음
		// 그 외의 cnum -> 소분류 카테고리 검색 -> secondCateNum = 1 ~ 24, thirdCateNum = 1 ~ 127
		int groupBySecondCate[] = {0,17,5,4,6,2,2,5,4,4,8,5,3,3,3,1,10,8,3,8,4,13,4,2,3};
		int intCnum = cnum == null ? 100 : Integer.parseInt(cnum);
		int secondCateNum = intCnum / 100;
		int thirdCateNum = intCnum - secondCateNum*100;
		int serviceNum = snum == null ? 100 : Integer.parseInt(snum);
		
		// 소분류(third category) 번호 계산(0이면 해당 중분류 카테고리 전체검색)
		if (thirdCateNum > 0) {
			for (int i=1; i<secondCateNum; i++) {
				thirdCateNum += groupBySecondCate[i];
			}
		}
		
		LogAspect.info("cnum/snum:" + cnum + "/" + snum + " -> " + secondCateNum + "," + thirdCateNum + "/" + serviceNum);

		// Pagination 설정
		String pnum = request.getParameter("pnum");
		int pageNumber = pnum == null ? 1 : Integer.parseInt(pnum);
		
		int boardSize=20;
		int endRow = pageNumber * boardSize;
		int startRow = endRow -boardSize + 1;
		
		int count = mainDao.selectCategoryAllCount(secondCateNum, thirdCateNum, serviceNum);
		
		LogAspect.info("pnum/count/start/end:" + pageNumber + "/" + count + "/" + startRow + "/" + endRow);
		
		List<CategoryPageDto> categoryPageList = null;
		List<CategoryPageDto> categoryPageBestList = null;
		List<CategoryPageDto> categoryPageFreeList = null;
		
		// 서비스 타입 구분(신간=101, 베스트셀러=102, 무료=103, 전체=104)
		if (snum == null || "100".equals(snum)) {
			// 홈(신간, 무료 항목에서 각 10개씩. 베스트셀러는 5개)
			categoryPageList = mainDao.selectCategoryAll(secondCateNum, thirdCateNum, 101, 1, 10);
			categoryPageBestList = mainDao.selectCategoryAll(secondCateNum, thirdCateNum, 102, 1, 5);
			categoryPageFreeList = mainDao.selectCategoryAll(secondCateNum, thirdCateNum, 103, 1, 10);
			LogAspect.info("categoryPageList:" + categoryPageList.size() + "/" + categoryPageBestList.size() + "/" + categoryPageFreeList.size());
		} else {
			// 신간, 베스트셀러, 무료, 전체
			categoryPageList = mainDao.selectCategoryAll(secondCateNum, thirdCateNum, serviceNum, startRow, endRow);
			LogAspect.info("categoryPageList:" + categoryPageList.size());
		}
		
		mav.addObject("pnum",pageNumber);
		mav.addObject("count",count);
		mav.addObject("boardSize", boardSize);
	
		return mav.addObject("categoryPageList", categoryPageList)
				.addObject("categoryPageBestList", categoryPageBestList)
				.addObject("categoryPageFreeList", categoryPageFreeList);
	}

	@Override
	public ModelAndView register(ModelAndView mav) throws IOException {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		MemberDto memberDto = (MemberDto)map.get("memberDto");
		int check = 0;
		
		Date birthday;
		try {
			birthday = new SimpleDateFormat("yyMMdd").parse(request.getParameter("birthdayStr"));
			memberDto.setBirthday(birthday);
			
		} catch (ParseException e) {
			LogAspect.severe(e.getMessage());
			e.printStackTrace();			
			check = -1;
		}
		
		if (check == 0) {
			memberDto.setIp(request.getRemoteAddr());
			memberDto.setMarketing_check("yes");
			
			LogAspect.info(memberDto.toString());
			
			try {
				check = mainDao.register(memberDto);
			} catch (Exception e) {
				LogAspect.severe(e.getMessage());
				e.printStackTrace();
			}
			
			LogAspect.info("register check:" + check);
		}
		
		// Ajax request
		JSONObject json = new JSONObject();
		if ("ajax".equalsIgnoreCase(request.getParameter("requestURL"))) {
			switch(check) {
			case 0:
				json.put("type", "system");
				json.put("error", "시스템 에러로 가입에 실패하셨습니다.");
				break;
			case -1:
				json.put("type","birthday");
				json.put("error","생년월일 입력이 잘못되었습니다.");
				break;
			default:
				json.put("type", "ok");
				json.put("error", "");
				break;
			}
			
			LogAspect.info(json);
			
			response.setContentType("application/x-json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		}
		
		return null;
	}

	@Override
	public void registerValidation(HttpServletRequest request, HttpServletResponse response) throws IOException {		
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		
		if (type != null) {
			LogAspect.info("registerValidation(): " + type + "/" + keyword);
			String errMsg = "";
			
			int check = mainDao.registerValidation(type,keyword);
			
			if ("email".equalsIgnoreCase(type)) {
				errMsg = "이미 존재하는 이메일입니다.";
			} else if ("phone".equalsIgnoreCase(type)) {
				errMsg = "이미 존재하는 전화번호입니다.";
			} else if ("id".equalsIgnoreCase(type)) {
				errMsg = "이미 존재하는 아이디입니다.";
			}
			
			JSONObject json = new JSONObject();
			if (check > 0) {
				// 이미 존재하는 email(phone)
				json.put("type", "error");
				json.put("error", errMsg);
			} else {
				json.put("type", "ok");
			}
			
			response.setContentType("application/x-json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		}
	}

	/*
	 * 헤더 > 마이팩토리 버튼 마우스오버 > 마이메뉴 팝업
	 * @author 박성호
	 * @date 2018. 3. 4.
	 * @see com.bf.main.service.MainService#updateMymenu(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public void updateMymenu(HttpServletRequest request, HttpServletResponse response) throws IOException {
		User user = (User) request.getSession().getAttribute("userInfo");
		
		int cashTotal = 0, pointTotal = 0, purchasedTotal = 0;
		
		JSONObject json = new JSONObject();
		
		if (user != null) {
			String id = user.getUsername();
			
			// 마이캐시
			cashTotal = mainDao.selectCashAvailable(id);
			
			// 마이포인트
			pointTotal = mainDao.selectPointAvailable(id);
			
			// 쿠폰(미구현)
			
			// 구매목록
			purchasedTotal = mainDao.selectPurchasedCount(id);
			
			// TODO: 카트, 위시리스트 - [{count=1, type=wish}, {count=2, type=cart}]
			List<Map<String,Integer>> cartWishCount = mainDao.selectCartWishCount(id);
			for (Map e : cartWishCount) {
				if ("cart".equals(e.get("type"))) {
					json.put("cartTotal", e.get("count"));
				} else if ("wish".equals(e.get("type"))) {
					json.put("wishTotal", e.get("count"));
				}
			}
		}
		
		DecimalFormat df = new DecimalFormat("#,###");
		
		json.put("cashTotal", df.format(cashTotal));
		json.put("pointTotal", df.format(pointTotal));
		json.put("purchasedTotal", df.format(purchasedTotal));
		
		response.setContentType("application/x-json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @author : 김동환
	 * @date : 2018. 2. 20.
	 * comment : 공지사항
	 */
	
	@Override
	public void noticeMain(ModelAndView mav) {		
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int boardSize = 10;		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage-1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		int count = mainDao.noticeMainCount();		
		LogAspect.info("공지사항 메인리스트 확인 : " + count);
		
		List<NoticeDto> noticeList = null;
		
		if(count > 0) {
			noticeList = mainDao.noticeMain(startRow, endRow);
			LogAspect.info("공지사항 리스트 사이즈 : " + noticeList.size());
		}
		
		mav.addObject("noticeList", noticeList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("notice/main.main");
		
		
	}
	
	@Override
	public void noticeRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		LogAspect.info("읽어오기 확인중 : " + num + ", " + pageNumber);
		
		NoticeDto noticeDto = mainDao.noticeRead(num);
		LogAspect.info("NoticeDto 확인 : " + noticeDto.toString());
		
				mav.addObject("noticeDto", noticeDto);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("notice/content.main");
	}

	@Override
	public void event(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) mav.getModel().get("request");
		String firstCate=request.getParameter("firstCateNum");
		String firstCateName=mainDao.getFirstCateName(firstCate);
		
		String type=request.getParameter("type");
		
		//페이지작업도 해줘야함.
		String pn=request.getParameter("pageNumber");
		if(pn==null)	pn="1";
		
		int pageNumber=Integer.parseInt(pn);
		
		int boardSize=10;
		int startRow=(pageNumber-1)*boardSize+1;
		int endRow=pageNumber*boardSize;
		int count=0;
		
		HashMap<String, Object> map=new HashMap<String,Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("firstCate", Integer.parseInt(firstCate));
		
		//진행중인것과 진행중이지 않은 아이들 구분
		if(type==null) {
			type="now";
		}
		
		map.put("type", type);
		
		count=mainDao.getEventCount(map);
		
		List<EventDto> el=null;
		if(count>0) {
			el=mainDao.getEventList(map);
		}
		
		mav.addObject("firstCate", firstCate);
		mav.addObject("firstCateName", firstCateName);
		mav.addObject("type",type);
		mav.addObject("el", el);
		mav.addObject("count", count);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("boardSize", boardSize);
		
	}

	@Override
	public void eventDetail(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) mav.getModel().get("request");
		String num=request.getParameter("num");
		
		EventDto dto=mainDao.getEventInfo(num);
		
		int random=mainDao.getRandomBookNum(dto.getF_num());
		
		mav.addObject("dto", dto);
		mav.addObject("random", random);
	}

	/**
	 * @author : 김동환
	 * @throws IOException 
	 * @date : 2018. 3. 5.
	 * comment : 공지사항 리스트 바뀌는것
	 */
	
	@Override
	public void noticeList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Map<String,Object>> noticeMini = mainDao.noticeMini();
		
		JSONArray json = new JSONArray();

		for (Map e : noticeMini) {
			json.add(e);
		}
		
		LogAspect.info(json);
		 
		
		response.setContentType("application/x-json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();

	}




	
}
