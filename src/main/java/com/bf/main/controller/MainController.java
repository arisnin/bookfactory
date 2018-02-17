package com.bf.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dto.ReplyDto;
import com.bf.book.dto.ReviewDto;
import com.bf.main.dto.RegisterDto;
import com.bf.main.service.MainService;
import com.bf.member.model.User;
import com.bf.member.service.UserDetailServiceImp;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description 최초작성 / 카테고리, 검색결과 페이지, 로그인
 */

/**
 * @author 최정은
 * @date 2018. 2. 13.
 * @description 일반, 로맨스, 판타지, 만화, BL, 상세보기 페이지 / 회사소개 페이지
 */

/**
 * @author 김도현
 * @date 2018. 2. 13.
 * @description 회원가입, 로그아웃
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
	 * 로그인 성공 요청
	 * @throws IOException 
	 */
	@RequestMapping(value = "/member/loginSuccess.do")
	public void loginSuccess(HttpSession session) throws IOException {
		LogAspect.info("loginSuccess()");
		
//		User user = (User)SecurityContextHolder.getContext().getAuthentication().getDetails();		
//		LogAspect.info(user);		
//		session.setAttribute("userInfo", user.getMemberDto());
	}

	/**
	 * 로그아웃 요청
	 */
	@RequestMapping(value = "/member/logout.do")
	public void logout(HttpSession session) throws IOException {
		LogAspect.info("logout()");
		
		User user = (User)session.getAttribute("userInfo");
		LogAspect.info(user);
		
		session.invalidate();
	}
	
	/**
	 * 로그인 요청
	 * @param error 로그인 실패시 넘어오는 파라미터
	 * @param login 스프링 시큐리티에 의한 자동 로그인 요청임을 나타내는 파라미터
	 * @return 로그인 실패시에는 null, 스프링 시큐리티에 의한 자동 로그인 요청일 경우는 viewname
	 * @throws IOException
	 */
	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="error", required=false) String error,
			@RequestParam(value="login", required=false) String login) throws IOException {
		LogAspect.info("login()");
		
		ModelAndView mav = new ModelAndView();
		if (error != null) {
			mav.addObject("error", "Invalid username or password.");
		}
		
		mav.addObject("login", "true").setViewName("header/login.solo");
		
		return mav;		
	}

	/**
	 * footer > 회사소개
	 */
	@RequestMapping(value = "/contact.do", method = RequestMethod.GET)
	public String companyIntro(HttpServletRequest request, HttpServletResponse response) {

		return "main/companyIntro.solo";
	}

	/**
	 * event > event
	 * 
	 * 이벤트 페이지 추가(02-12, 김도현)
	 */
	@RequestMapping(value = "/event.do", method = RequestMethod.GET)
	public String event(HttpServletRequest request, HttpServletResponse response) {
		return "event/event.main";
	}

	/**
	 * 회원가입 요청
	 * 
	 * @throws ParseException
	 *             SimpleDateFormat.parse()에서 발생하는 예외
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
}
