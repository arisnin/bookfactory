package com.bf.main.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description 
 */
public interface MainService {

	public void cartWishList(ModelAndView mav);

	public void cartDelete(ModelAndView mav);

	public void register(ModelAndView mav);

}
