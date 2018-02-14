package com.bf.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.main.service.MainService;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description 
 */
@Controller
public class MyPageController {
	@Autowired
	private MainService mainService;

	/**
	 * 메인 > 로그인 > 마이팩토리(마이 페이지)
	 */
	@RequestMapping(value="/myPage/home.do")
	public String myPage(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("myPage()");
		return "myPage/home.my";
	}
	
	// 마이페이지 > 책 목록 페이지 ////////////////////////////////////
	
	/**
	 * 마이페이지 > 구매목록
	 */
	@RequestMapping(value="/library/purchased.do")
	public String purchased(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("purchased()");
		return "myPage/library/purchased.my";
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
	@RequestMapping(value="/library/nearbyRead.do")
	public String nearbyRead(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("nearbyRead()");
		return "myPage/library/nearbyRead.my";
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
	 */
	@RequestMapping(value="/payment/ridiCash.do")
	public String ridiCash(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("RidiCash()");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		
		
		return "myPage/payment/ridiCash.my";
	}
	
	/**
	 * 마이페이지 > 마이캐시 > 충전내역
	 */
	@RequestMapping(value="/payment/ridiCashHistoryCash.do")
	public String ridiCashHistoryCash(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("ridiCashHistoryCash()");
		return "myPage/payment/ridiCashHistoryCash.my";
	}
	
	/**
	 * 마이페이지 > 마이포인트
	 */
	@RequestMapping(value="/payment/ridiPoint.do")
	public String ridiPoint(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("ridiPoint()");
		return "myPage/payment/ridiPoint.my";
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
	public String myInfoCheck(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("myInfoCheck()");
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
}
