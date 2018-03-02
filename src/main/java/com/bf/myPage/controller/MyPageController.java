package com.bf.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.member.model.MemberDto;
import com.bf.myPage.dto.MyPagePointDto;
import com.bf.myPage.service.MyPageService;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description 
 */
@Controller
public class MyPageController {
	@Autowired
	private MyPageService mypageService;
	
	/**
	 * 메인 > 로그인 > 마이팩토리(마이 페이지)
	 */
	@RequestMapping(value="/myPage/home.do")
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("myPage()");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.home(mav);
		
		return mav;
	}
	
	// 마이페이지 > 책 목록 페이지 ////////////////////////////////////
	
	/**
	 * 마이페이지 > 구매목록
	 */
	@RequestMapping(value="/library/purchased.do")
	public ModelAndView purchased(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("purchased()");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.purchased(mav);
		
		return mav;
	}
	
	
	/**
	 * 마이페이지 > 구매목록 > 영구삭제
	 */
	@RequestMapping(value="/library/purchasedDelete.do")
	public ModelAndView purchasedDelete(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("purchasedDelete()");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.purchasedDelete(mav);
		
		return mav;
	}
	/**
	 * 마이페이지 > 알림센터
	 */
	@RequestMapping(value="/library/noticeCenter.do")
	public String noticeCenter(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("noticeCenter()");
		return "myPage/library/noticeCenter.my";
	}
	
	/**
	 * 마이페이지 > 신간알림
	 */
	@RequestMapping(value="/library/newRelease.do")
	public String newRelease(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("newRelease()");
		return "myPage/library/newRelease.my";
	}
	
	/**
	 * 마이페이지 > 최근본책
	 */
	@RequestMapping(value="/library/recentLookBook.do")
	public ModelAndView recentLookBook(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("recentLookBook()");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.recentLookBook(mav);
		
		return mav;
	}
	
	/**
	 * 마이페이지 > 최근본책 > 전체 삭제
	 */
	@RequestMapping(value="/library/recentLookBookDelete.do")
	public ModelAndView recentLookBookDelete(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("recentLookBook()");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.recentLookBookDelete(mav);
		
		return mav;
	}
	
	/**
	 * 마이페이지 > 연재선호작품
	 */
	@RequestMapping(value="/library/preferBook.do")
	public String preferBook(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("preferBook()");
		return "myPage/library/preferBook.my";
	}
	
	// 마이페이지 > 구매/혜택 목록 페이지 ////////////////////////////////////
	
	/**
	 * 마이페이지 > 결제내역
	 */
	@RequestMapping(value="/payment/orderhistory.do")
	public String orderhistory(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("orderhistory()");
		return "myPage/payment/orderhistory.my";
	}
	
	/**
	 * 마이페이지 > 결제내역 상세 정보
	 */
	@RequestMapping(value="/payment/orderhistoryClick.do")
	public String orderhistoryClick(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("orderhistory()");
		return "myPage/payment/orderhistoryClick.my";
	}
	
	/**
	 * 마이페이지 > 결제내역 취소정보
	 */
	@RequestMapping(value="/payment/orderhistoryCancel.do")
	public String orderhistoryCancel(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("orderhistory()");
		return "myPage/payment/orderhistoryCancel.my";
	}
	
	/**
	 * 마이페이지 > 마이캐시
	 * 
	 */
	@RequestMapping(value="/payment/myCash.do")
	public ModelAndView myCash(HttpServletRequest request, HttpServletResponse response, MyPagePointDto myPagePointDto) {
		LogAspect.info("MyCash()");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.myCash(mav);
		
		return mav;
	}
	
	/**
	 * 마이페이지 > 마이캐시 > 충전완료
	 */
	@RequestMapping(value="/payment/myCashOk.do")
	public ModelAndView myCashOk(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("MyCashOk()");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.myCashOk(mav);
		
		return mav;
	}
	
	/**
	 * 마이페이지 > 마이캐시 > 충전내역
	 */
	@RequestMapping(value="/payment/myCashHistoryCash.do")
	public ModelAndView myCashHistoryCash(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("MyCashHistoryCash()");
		request.getSession().setAttribute("userInfoId", "user");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.myCashHistoryCash(mav);
		
		return mav;
	}
	
	/**
	 * 마이페이지 > 마이캐시 > 충전내역 > 결제내역
	 */
	@RequestMapping(value="/payment/myCashHistoryCashClick.do")
	public ModelAndView myCashHistoryCashClick(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("MyCashHistoryCashClick()");
		request.getSession().setAttribute("userInfoId", "user");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.myCashHistoryCashClick(mav);
		
		return mav;
	}
	
	/**
	 * 마이페이지 > 마이포인트
	 */
	@RequestMapping(value="/payment/myPoint.do")
	public ModelAndView myPoint(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("MyPoint()");
		request.getSession().setAttribute("userInfoId", "user");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		mypageService.myPoint(mav);
		
		return mav;
	}
	
	/**
	 * 마이페이지 > 쿠폰
	 */
	@RequestMapping(value="/payment/coupon.do")
	public String coupon(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("coupon()");
		return "myPage/payment/coupon.my";
	}
	
	/**
	 * 마이페이지 > 이용권관리
	 */
	@RequestMapping(value="/payment/freepassTicket.do")
	public String freepassTicket(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("freepassTicket()");
		return "myPage/payment/freepassTicket.my";
	}
	
	// 마이페이지 > 개인 목록 페이지 ////////////////////////////////////
	
	/**
	 * 마이페이지 > 1:1 문의
	 */
	@RequestMapping(value="/nonImplementation01.do")
	public String nonImplementation01(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("nonImplementation01()");
		return null;
	}
	
	/**
	 * 마이페이지 > 내리뷰관리
	 */
	@RequestMapping(value="/personal/myReview.do")
	public String myReview(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("myReview()");
		return "myPage/personal/myReview.my";
	}
	
	/**
	 * 마이페이지 > 정보변경 비밀번호 확인
	 */
	@RequestMapping(value="/personal/myInfoCheck.do")
	public String myInfoCheck(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		LogAspect.info("myInfoCheck()");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		
		mypageService.myInfoCheck(mav);
		
		return "myPage/personal/myInfoCheck.my";
	}
	
	/**
	 * 마이페이지 > 정보변경
	 */
	@RequestMapping(value="/personal/myInfo.do", method=RequestMethod.POST)
	public String myInfo(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("myInfo()");
		
		return "myPage/personal/myInfo.my";
	}
	
	
	/**
	 * @author : 김동환
	 * @date : 2018. 2. 19.
	 * comment : 회원정보 변경 
	 */
	@RequestMapping(value="/member/update.do", method=RequestMethod.GET)
	public ModelAndView myInfoUpdate(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		LogAspect.info("마이리디 정보변경");
		
		ModelAndView mav = new ModelAndView();
				
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		
		mypageService.myInfoUpdate(mav);
		
		return mav;
	}
	
}
