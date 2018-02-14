package com.bf.main.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.main.dto.RegisterDto;
import com.bf.main.dto.ReplyDto;
import com.bf.main.service.MainService;
import com.bf.main.dto.ReviewDto;

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
	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("login()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "category/category.main";
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
	 * 단행본 > 책 상세보기
	 */
	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public String bookPlus(HttpServletRequest request, HttpServletResponse response) {

		return "book/plus.main";
	}

	/**
	 * 책 상세 페이지 > 리뷰 작성
	 */
	@RequestMapping(value = "/review.do", method = RequestMethod.POST)
	public ModelAndView review(HttpServletRequest request, HttpServletResponse response, ReviewDto reviewDto) {
		LogAspect.info("review():" + request.getHeader("referer"));
		return mainService.review(new ModelAndView("book/review.solo").addObject("request", request).addObject("reviewDto", reviewDto));
	}

	/**
	 * 책 상세 페이지 > 리뷰 글 > 댓글 작성
	 */
	@RequestMapping(value = "review/reply.do", method = RequestMethod.POST)
	public String reviewReply(HttpServletRequest request, HttpServletResponse response, ReplyDto replyDto) {
		LogAspect.info("reviewReply():" + request.getHeader("referer"));
		return "book/review.solo";
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
	 * footer > 회사소개
	 */
	@RequestMapping(value = "/contact.do", method = RequestMethod.GET)
	public String companyIntro(HttpServletRequest request, HttpServletResponse response) {

		return "main/companyIntro.solo";
	}
	// 2018-02-07, 최정은 작업 끝

	/**
	 * event > event
	 * 
	 * 이벤트 페이지 추가(02-12)
	 */
	@RequestMapping(value = "/event.do", method = RequestMethod.GET)
	public String event(HttpServletRequest request, HttpServletResponse response) {
		return "event/event.main";
	}

	/**
	 * 회원가입 요청
	 * @throws ParseException SimpleDateFormat.parse()에서 발생하는 예외
	 */
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response, RegisterDto registerDto) throws ParseException {
		ModelAndView mav = new ModelAndView("genre/register.main");
		Date birthday = new SimpleDateFormat("yyMMdd").parse(request.getParameter("birth"));
		registerDto.setBirthday(birthday);
		registerDto.setIp(request.getRemoteAddr());
		mav.addObject("registerDto", registerDto);
		LogAspect.info(registerDto.toString());
		mainService.register(mav);
		return mav;
	}

	/**
	 * 로그아웃 요청(임시 기능)
	 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "genre/normal.main";
	}
}
