package com.bf.book.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.bf.book.dto.ReplyDto;

/**
 * @author	박성호
 * @date	2018. 2. 14.
 * @description	대분류별 보기 / 책 상세보기 관련 서비스 인터페이스
 */
public interface BookService {
	ModelAndView reviewWrite(ModelAndView mav);
	void normalHome(ModelAndView mav);
	void homeNewbook(ModelAndView mav);
	ModelAndView reviewList(ModelAndView mav);
	ModelAndView reviewUpdate(ModelAndView mav);
	void romanceHome(ModelAndView mav);
	void bookDetail(ModelAndView mav);
	void keyword(ModelAndView mav);
	void keywordSearch(ModelAndView mav);
	void reviewReply(HttpServletRequest request, HttpServletResponse response, ReplyDto replyDto) throws IOException;
	void reviewDelete(HttpServletRequest request, HttpServletResponse response) throws IOException;
	void homeBestSeller(ModelAndView mav);
}
