package com.bf.main.service;

import java.io.IOException;

import org.springframework.web.servlet.ModelAndView;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
public interface MainService {

	public ModelAndView register(ModelAndView mav) throws IOException;

	public ModelAndView idCheck(ModelAndView mav) throws IOException;

	public ModelAndView emailPhoneCheck(ModelAndView mav) throws IOException;

}
