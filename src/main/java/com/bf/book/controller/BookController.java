package com.bf.book.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
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
		LogAspect.info(StringUtils.join(Arrays.asList(new String[]{"a1","a2","a3"}), ","));
		return "present/present.main";
	}

	/**
	 * 메인 > 일반, 만화 > 홈
	 */
	@RequestMapping(value = {"/","/normal.do", "/comic.do"}, method = RequestMethod.GET)
	public ModelAndView normalHome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		bookService.normalHome(mav);
		
		return mav;
	}

	/**
	 * 메인 > 로맨스, 판타지, bl > 홈
	 */
	@RequestMapping(value = {"/romance.do","/fantasy.do","/bl.do"}, method = RequestMethod.GET)
	public ModelAndView homeRomance(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		bookService.romanceHome(mav);
		
		return mav;
	}
	
	/**
	 * 메인 > 카테고리들 > 신간
	 */
	@RequestMapping(value = "/new-book.do", method = RequestMethod.GET)
	public ModelAndView homeNewbook(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("genre/newBook.main");
		mav.addObject("request", request);
		
		bookService.homeNewbook(mav);
		
		return mav;
	}

	/**
	 * 메인 > 카테고리들 > 베스트셀러
	 */
	@RequestMapping(value = "/best-sell.do", method = RequestMethod.GET)
	public String homeBestSeller(HttpServletRequest request, HttpServletResponse response) {

		return "genre/bestSell.main";
	}

	/**
	 * 책(일반, 만화, 단행본) > 책 상세보기
	 */
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView bookDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("book/plus.main");
		mav.addObject("request", request);
		
		bookService.bookDetail(mav);
		
		return mav;
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
	 * 일반 제외 홈화면들 > 키워드검색
	 */
	@RequestMapping(value = "/keyword.do", method = RequestMethod.GET)
	public ModelAndView keyword(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("genre/commons/keyword.main");
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		bookService.keyword(mav);
		
		return mav;
	}

	/**
	 * 책 상세 페이지 > 리뷰 작성
	 */
	@RequestMapping(value = "/review/write.do", method = RequestMethod.POST)
	public ModelAndView reviewWrite(HttpServletRequest request, HttpServletResponse response, ReviewDto reviewDto) {
		LogAspect.info("reviewWrite():" + request.getHeader("referer"));
		return bookService.reviewWrite(new ModelAndView("book/review.solo").addObject("request", request).addObject("reviewDto", reviewDto));
	}
	
	/**
	 * 책 상세 페이지 > 리뷰 작성
	 */
	@RequestMapping(value = "/review/update.do", method = RequestMethod.POST)
	public ModelAndView reviewUpdate(HttpServletRequest request, HttpServletResponse response, ReviewDto reviewDto) {
		LogAspect.info("reviewUpdate():" + request.getHeader("referer"));
		return bookService.reviewUpdate(new ModelAndView("book/review.solo").addObject("request", request).addObject("reviewDto", reviewDto));
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
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("reviewList():" + request.getHeader("referer"));		
		return bookService.reviewList(new ModelAndView("book/review.solo").addObject("request", request));
	}
}
