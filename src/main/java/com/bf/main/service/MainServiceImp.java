package com.bf.main.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.main.dao.MainDao;
import com.bf.main.dto.RegisterDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
@Component
public class MainServiceImp implements MainService {
	@Autowired
	private MainDao mainDao;

	@Override
	public void cartWishList(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int check = mainDao.cartWishList(num);
		System.out.println(check);
		mav.addObject("check", check);
		mav.setViewName("/cart.main");
	}

	@Override
	public void cartDelete(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int check = mainDao.cartDelete(num);
		
		mav.addObject("check", check);
		mav.setViewName("/cart.main");
	}

	@Override
	public void register(ModelAndView mav) {
		RegisterDto registerDto = (RegisterDto)mav.getModelMap().get("registerDto");
		int check = mainDao.register(registerDto);
		System.out.println("logMsg========"+check);
		mav.addObject("check", check);
	}
}
