package com.bf.order.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.order.dao.OrderDao;

/**
 * @author	박성호
 * @date	2018. 2. 14.
 * @description	카트/위시리스트/구매 관련 서비스 구현 클래스
 */
@Component
public class OrderServiceImp implements OrderService {
	@Autowired
	private OrderDao orderDao;

	@Override
	public void cartWishList(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest)mav.getModelMap().get("request");

		int num = Integer.parseInt(request.getParameter("num"));
		int check = orderDao.cartWishList(num);
		System.out.println(check);
		mav.addObject("check", check);
		mav.setViewName("/cart.main");
	}

	@Override
	public void cartDelete(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest)mav.getModelMap().get("request");

		int num = Integer.parseInt(request.getParameter("num"));
		int check = orderDao.cartDelete(num);

		mav.addObject("check", check);
		mav.setViewName("/cart.main");
	}
}
