package com.bf.main.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
public interface MainService {

	public void register(ModelAndView mav);

	public void noticeMain(ModelAndView mav);

	//public void noticeRead(ModelAndView mav);

}
