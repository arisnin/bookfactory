package com.bf.book.controller;

import java.io.IOException;

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

/**
 * @author 최정은
 * @date 2018. 2. 14.
 * @description 각각 서비스클래스와의 연결
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
		LogAspect.info("testBook():" + request.getHeader("referer"));
		return "book/author.main";
	}

	/**
	 * 메인 > 일반, 만화 > 홈 - 최정은
	 */
	@RequestMapping(value = {"/","/normal.do", "/comic.do","/bl.do"}, method = RequestMethod.GET)
	public ModelAndView normalHome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		bookService.normalHome(mav);
		
		return mav;
	}

	/**
	 * 메인 > 로맨스, 판타지, bl > 홈 - 최정은
	 */
	@RequestMapping(value = {"/romance.do","/fantasy.do"}, method = RequestMethod.GET)
	public ModelAndView homeRomance(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		bookService.romanceHome(mav);
		
		return mav;
	}
	
	/**
	 * 메인 > 카테고리들 > 신간 - 최정은
	 */
	@RequestMapping(value = "/new-book.do", method = RequestMethod.GET)
	public ModelAndView homeNewbook(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("genre/newBook.main");
		mav.addObject("request", request);
		
		bookService.homeNewbook(mav);
		
		return mav;
	}

	/**
	 * 메인 > 카테고리들 > 베스트셀러 - 최정은
	 */
	@RequestMapping(value = "/best-sell.do", method = RequestMethod.GET)
	public ModelAndView homeBestSeller(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("genre/bestSell.main");
		mav.addObject("request", request);
		
		bookService.homeBestSeller(mav);
		
		return mav;
	}

	/**
	 * 책(일반, 만화, 단행본) > 책 상세보기 - 최정은
	 */
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView bookDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("book/plus.main");
		mav.addObject("request", request);
		
		bookService.bookDetail(mav);
		
		return mav;
	}
		
	/**
	 * 책(일반, 만화, 단행본) > 책 상세보기 > 작가수정요청 버튼  - 최정은,염현우
	 */
	@RequestMapping(value = "/authorProfilUpdate.do", method = RequestMethod.GET)
	public ModelAndView authorProfilUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("book/authorProfilUpdate.solo");
		mav.addObject("author_num",request.getParameter("author_num"));
		
		return mav;
	}

	/**
	 * 연재 > 책 상세보기  - 최정은 // 데이터없음
	 */
	@RequestMapping(value = "/book/plusSerial.do", method = RequestMethod.GET)
	public String bookSerial(HttpServletRequest request, HttpServletResponse response) {

		return "book/plusSerial.main";
	}

	/**
	 * 책상세보기 > 미리보기버튼 - 최정은
	 */
	@RequestMapping(value = "/book/example.do", method = RequestMethod.GET)
	public ModelAndView bookExample(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("book/example.solo");
		mav.addObject("request", request);
		
		bookService.bookExample(mav);
		
		return mav;
	}

	/**
	 * 일반 제외 홈화면들 > 키워드검색 - 최정은
	 */
	@RequestMapping(value = "/keyword.do", method = RequestMethod.GET)
	public ModelAndView keyword(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("genre/commons/keyword.main");
		mav.addObject("request", request);

		bookService.keyword(mav);
		
		return mav;
	}
	
	/**
	 * 일반 제외 홈화면들 > 키워드 검색 ajax - 최정은
	 */
	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.POST)
	public ModelAndView keywordSearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		bookService.keywordSearch(mav);
		
		return null;
	}

	/**
	 * 책 상세 페이지 > 리뷰 작성
	 */
	@RequestMapping(value = "/review/write.do", method = RequestMethod.POST)
	public ModelAndView reviewWrite(HttpServletRequest request, HttpServletResponse response, ReviewDto reviewDto) {
		LogAspect.info("reviewWrite():" + request.getHeader("referer"));
		return bookService.reviewWrite(new ModelAndView("redirect:"+request.getHeader("referer")).addObject("request", request).addObject("reviewDto", reviewDto));
	}
	
	/**
	 * 책 상세 페이지 > 리뷰 수정
	 */
	@RequestMapping(value = "/review/update.do", method = RequestMethod.POST)
	public ModelAndView reviewUpdate(HttpServletRequest request, HttpServletResponse response, ReviewDto reviewDto) {
		LogAspect.info("reviewUpdate():" + request.getHeader("referer"));
		return bookService.reviewUpdate(new ModelAndView("book/reviewUpdateOk.solo").addObject("request", request).addObject("reviewDto", reviewDto));
	}

	/**
	 * 책 상세 페이지 > 리뷰 글 > 댓글 작성
	 * @throws IOException 
	 */
	@RequestMapping(value = "/review/reply.do", method = RequestMethod.POST)
	public void reviewReply(HttpServletRequest request, HttpServletResponse response, ReplyDto replyDto) throws IOException {
		LogAspect.info("reviewReply():" + request.getHeader("referer"));
		bookService.reviewReply(request, response, replyDto);
	}

	/**
	 * 책 상세 페이지 > 리뷰 리스트
	 */
	@RequestMapping(value = "/review/list.do", method = RequestMethod.GET)
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("reviewList():" + request.getHeader("referer"));		
		return bookService.reviewList(new ModelAndView("book/review.solo").addObject("request", request));
	}
	
	/**
	 * 책 상세 페이지 > 리뷰 삭제
	 * @throws IOException 
	 */
	@RequestMapping(value = "/review/delete.do", method = RequestMethod.GET)
	public void reviewDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LogAspect.info("reviewDelete():" + request.getHeader("referer"));
		bookService.reviewDelete(request, response);
	}
	
	/**
	 * 작가 정보 페이지
	 */
	@RequestMapping(value = "/author.do", method = RequestMethod.GET)
	public ModelAndView author(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("author():" + request.getHeader("referer"));		
		return bookService.author(new ModelAndView("book/author.main").addObject("request", request));
	}
	
	@RequestMapping(value = "/authorProfilUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView authorProfilUpdateOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView("book/authorProfilUpdateOk.solo");
		mav.addObject("request",request);
		bookService.authorProfilUpdateOk(mav);
		return mav;
	}
}
