package com.bf.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dto.ReplyDto;
import com.bf.book.dto.ReviewDto;
import com.bf.book.service.BookService;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 대분류별 보기 / 책 상세보기 관련 컨트롤러
 */
@Controller
public class BookController {
	@Autowired
	private BookService bookService;

	/**
	 * 테스트용 맵핑입니다.
	 */
	@RequestMapping(value = "/test/book.do", method = RequestMethod.GET)
	public String testBook(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("testBook()");
		return "present/present.main";
	}

	/**
	 * 메인 > 일반 > 홈
	 */
	@RequestMapping(value = {"/","/normal.do"}, method = RequestMethod.GET)
	public ModelAndView normalHome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("genre/normal.main");
		mav.addObject("request", request);
		
		bookService.normalHome(mav);
		
		return mav;
	}

	/**
	 * 메인 > 일반 > 신간
	 */
	@RequestMapping(value = "/new-book.do", method = RequestMethod.GET)
	public ModelAndView homeNewbook(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("genre/newBook.main");
		mav.addObject("request", request);
		
		bookService.homeNewbook(mav);
		
		return mav;
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
	 * 단행본 > 책 상세보기
	 */
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String bookPlus(HttpServletRequest request, HttpServletResponse response) {

		return "book/plus.main";
	}

	/**
	 * 연재 > 책 상세보기 //임시로 로맨스화면의 베스트셀러들에게 걸음
	 */
	@RequestMapping(value = "/book/plusSerial.do", method = RequestMethod.GET)
	public String bookSerial(HttpServletRequest request, HttpServletResponse response) {

		return "book/plusSerial.main";
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
	 * 책 상세 페이지 > 리뷰 작성
	 */
	@RequestMapping(value = "/review/write.do", method = RequestMethod.POST)
	public ModelAndView reviewWrite(HttpServletRequest request, HttpServletResponse response, ReviewDto reviewDto) {
		LogAspect.info("reviewWrite():" + request.getHeader("referer"));
		return bookService.review(new ModelAndView("book/review.solo").addObject("request", request).addObject("reviewDto", reviewDto));
	}

	/**
	 * 책 상세 페이지 > 리뷰 글 > 댓글 작성
	 */
	@RequestMapping(value = "/review/reply.do", method = RequestMethod.POST)
	public String reviewReply(HttpServletRequest request, HttpServletResponse response, ReplyDto replyDto) {
		LogAspect.info("reviewReply():" + request.getHeader("referer"));
		return "book/review.solo";
	}

	/**
	 * 책 상세 페이지 > 리뷰 리스트
	 */
	@RequestMapping(value = "/review/list.do", method = RequestMethod.GET)
	public String reviewList(HttpServletRequest request, HttpServletResponse response, ReplyDto replyDto) {
		LogAspect.info("reviewList():" + request.getHeader("referer"));
		return "book/review.solo";
	}
}
