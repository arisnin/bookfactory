package com.bf.main.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
public interface MainService {

	public ModelAndView register(ModelAndView mav) throws IOException;

	public void registerValidation(HttpServletRequest request, HttpServletResponse response) throws IOException;

	public void noticeMain(ModelAndView mav);

	public void noticeRead(ModelAndView mav);

	public ModelAndView category(ModelAndView mav);

	public ModelAndView mainSearch(ModelAndView mav);

	public void suggestKeyword(HttpServletRequest request, HttpServletResponse response) throws IOException;

	public void updateMymenu(HttpServletRequest request, HttpServletResponse response) throws IOException;

}
