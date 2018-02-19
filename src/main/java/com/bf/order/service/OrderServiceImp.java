package com.bf.order.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dto.HomeDto;
import com.bf.member.model.User;
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
		LogAspect.info("cartWishList()");
		int num = Integer.parseInt(request.getParameter("num"));
		int check = orderDao.cartWishList(num);
		System.out.println(check);
		mav.addObject("check", check);
		mav.setViewName("/cart.main");
	}
	
	@Override
	public void wishListCart(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest)mav.getModelMap().get("request");
		LogAspect.info("wishListCart()");
		int num = Integer.parseInt(request.getParameter("num"));
		int check = orderDao.cartWishList(num);
		System.out.println(check);
		mav.addObject("check", check);
		mav.setViewName("/cart.main");
	}

	@Override
	public void cartDelete(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest)mav.getModelMap().get("request");
		LogAspect.info("cartDelete()");
		int num = Integer.parseInt(request.getParameter("num"));
		int check = orderDao.cartDelete(num);

		mav.addObject("check", check);
		mav.setViewName("/cart.main");
	}

	@Override
	public void getCart(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest)mav.getModelMap().get("request");
		LogAspect.info("getCart()");
		User user = (User) request.getSession().getAttribute("userInfo");
		List<HomeDto> list = orderDao.getCart(user.getUsername()); 
		LogAspect.info(list.toString());
		mav.addObject("listCart", list);
	}

	@Override
	public void cartInsert(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest)mav.getModelMap().get("request");
		int bookNum = Integer.parseInt(request.getParameter("book_num"));
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
//		System.out.println(id);
		int check = orderDao.cartInsert(bookNum, id);
		mav.addObject("check", check);
		mav.setViewName("/cart.main");
//		System.out.println(check);
	}
	
}
