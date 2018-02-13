package com.bf.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.main.service.MainService;
import com.bf.myPage.dto.MyPageReviewDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
@Controller
public class MainController {
	@Autowired
	private MainService mainService;

	/**
	 * 메인 > 전체분야 > 카테고리 페이지
	 */
	@RequestMapping(value = "/category.do")
	public String category(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("category()");
		return "category/category.main";
	}

	/**
	 * 메인 > 검색창 폼 > 검색 결과 페이지
	 */
	@RequestMapping(value = "/main/search.do")
	public String mainSearch(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("mainSearch()");
		return "main/search.main";
	}

	/**
	 * 메인 > 로그인
	 */
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("login()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "category/category.main";
	}

	/**
	 * 헤더 > 카트
	 */
	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public String cart(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("login()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "cart/cart.main";
	}

	/**
	 * 헤더 > 위시리스트
	 */
	@RequestMapping(value = "/wishlist.do", method = RequestMethod.GET)
	public String wishlist(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("login()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "cart/wishlist.main";
	}

	/**
	 * 헤더 > 카트 > 구매
	 */
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String order(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("login()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "order/order.main";
	}

	/**
	 * 헤더 > 카트 > 구매 완료
	 */
	@RequestMapping(value = "/orderOk.do", method = RequestMethod.GET)
	public String orderOk(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("login()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "order/orderOk.main";
	}

	/**
	 * 선물 메인
	 */
	@RequestMapping(value = "/present.do", method = RequestMethod.GET)
	public String present(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("login()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "present/present.main";
	}

	/**
	 * 선물 완료
	 */
	@RequestMapping(value = "/presentOk.do", method = RequestMethod.GET)
	public String presentOk(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("login()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "present/presentOk.main";
	}

	/**
	 * 선물 결제
	 */
	@RequestMapping(value = "/presentPay.do", method = RequestMethod.GET)
	public String presentPay(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("login()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "present/presentPay.main";
	}

	// 2018-02-07, 최정은 작업

	/**
	 * 메인 > 일반 > 홈
	 */
	@RequestMapping(value = "/normal.do", method = RequestMethod.GET)
	public String home(HttpServletRequest request, HttpServletResponse response) {

		return "genre/normal.main";
	}

	/**
	 * 메인 > 일반 > 신간
	 */
	@RequestMapping(value = "/new-book.do", method = RequestMethod.GET)
	public String homeNewbook(HttpServletRequest request, HttpServletResponse response) {

		return "genre/newBook.main";
	}

	/**
	 * 메인 > 일반 > 베스트셀러
	 */
	@RequestMapping(value = "/best-sell.do", method = RequestMethod.GET)
	public String homeBestSeller(HttpServletRequest request, HttpServletResponse response) {

		return "genre/bestSell.main";
	}

	/**
	 * 메인 > 로맨스 > 홈
	 */
	@RequestMapping(value = "/romance.do", method = RequestMethod.GET)
	public String homeRomance(HttpServletRequest request, HttpServletResponse response) {

		return "genre/romance.main";
	}

	/**
	 * 메인 > 판타지 > 홈
	 */
	@RequestMapping(value = "/fantasy.do", method = RequestMethod.GET)
	public String homeFantasy(HttpServletRequest request, HttpServletResponse response) {

		return "genre/fantasy.main";
	}

	/**
	 * 메인 > 만화 > 홈
	 */
	@RequestMapping(value = "/comic.do", method = RequestMethod.GET)
	public String homeComic(HttpServletRequest request, HttpServletResponse response) {

		return "genre/comic.main";
	}

	/**
	 * 메인 > bl > 홈
	 */
	@RequestMapping(value = "/bl.do", method = RequestMethod.GET)
	public String homeBl(HttpServletRequest request, HttpServletResponse response) {

		return "genre/bl.main";
	}

	/**
	 * 메인 > 책 상세보기
	 */
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String bookPlus(HttpServletRequest request, HttpServletResponse response) {

		return "book/plus.main";
	}
	
	/**
	 * 
	 */
	@RequestMapping(value = "/review.do", method = RequestMethod.POST)
	public ModelAndView review(HttpServletRequest request, HttpServletResponse response, MyPageReviewDto myPageReviewDto) {
		LogAspect.info("review():" + request.getHeader("referer"));
		return mainService.review(new ModelAndView("book/review.solo").addObject("request",request).addObject("myPageReviewDto",myPageReviewDto));
	}
	
	/**
	 * 
	 */
	@RequestMapping(value = "review/reply.do", method = RequestMethod.POST)
	public String reviewReply(HttpServletRequest request, HttpServletResponse response, MyPageReviewDto myPageReviewDto) {
		LogAspect.info("reviewReply():" + request.getHeader("referer"));
		return "book/review.solo";
	}

	/**
	 * 책상세보기 > 미리보기버튼
	 */
	@RequestMapping(value = "/book/example.do", method = RequestMethod.GET)
	public String bookExample(HttpServletRequest request, HttpServletResponse response) {

		return "book/example.solo";
	}

	/**
	 * 홈 > 키워드검색
	 */
	@RequestMapping(value = "/keyword.do", method = RequestMethod.GET)
	public String keyword(HttpServletRequest request, HttpServletResponse response) {

		return "genre/commons/keyword.main";
	}

	/**
	 * footer > 회사소개
	 */
	@RequestMapping(value = "/contact.do", method = RequestMethod.GET)
	public String companyIntro(HttpServletRequest request, HttpServletResponse response) {

		return "main/companyIntro.solo";
	}
	// 2018-02-07, 최정은 작업 끝

	/**
	 * event > event
	 */
	@RequestMapping(value = "/event.do", method = RequestMethod.GET)
	public String event(HttpServletRequest request, HttpServletResponse response) {
		return "event/event.main";
	}
	// 이벤트 페이지 추가(02-12)
}
