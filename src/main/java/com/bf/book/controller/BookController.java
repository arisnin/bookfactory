package com.bf.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bf.aop.LogAspect;
import com.bf.book.service.BookService;

/**
 * @author	박성호
 * @date	2018. 2. 14.
 * @description	대분류별 보기 / 책 상세보기 관련 컨트롤러
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
}
