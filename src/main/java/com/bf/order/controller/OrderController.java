package com.bf.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.order.service.OrderService;

/**
 * @author	박성호
 * @date	2018. 2. 14.
 * @description	카트/위시리스트/구매 관련 컨트롤러
 */
@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;

	/**
	 * 헤더 > 카트
	 */
	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public String cart(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("cart()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "cart/cart.main";
	}

	/**
	 * 헤더 > 위시리스트
	 */
	@RequestMapping(value = "/wishlist.do", method = RequestMethod.GET)
	public String wishlist(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("wishlist()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "cart/wishlist.main";
	}

	/**
	 * 헤더 > 카트 > 구매
	 */
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String order(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("order()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "order/order.main";
	}

	/**
	 * 헤더 > 카트 > 구매 완료
	 */
	@RequestMapping(value = "/orderOk.do", method = RequestMethod.GET)
	public String orderOk(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("orderOk()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "order/orderOk.main";
	}

	/**
	 * 선물 메인
	 */
	@RequestMapping(value = "/present.do", method = RequestMethod.GET)
	public String present(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("present()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "present/present.main";
	}

	/**
	 * 선물 완료
	 */
	@RequestMapping(value = "/presentOk.do", method = RequestMethod.GET)
	public String presentOk(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("presentOk()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "present/presentOk.main";
	}

	/**
	 * 선물 결제
	 */
	@RequestMapping(value = "/presentPay.do", method = RequestMethod.GET)
	public String presentPay(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("presentPay()");
		request.getSession().setAttribute("userInfoId", "manager");
		return "present/presentPay.main";
	}

	/**
	 * 카트의 책들을 위시리스트로 옮기는 요청
	 */
	@RequestMapping(value = "/cartWishList.do", method = RequestMethod.GET)
	public String cartWishList(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("cartWishList()");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		orderService.cartWishList(mav);
		return null;
	}

	@RequestMapping(value = "/cartDelete.do", method = RequestMethod.GET)
	public String cartDelete(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("cartDelete()");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		orderService.cartDelete(mav);
		return null;
	}
}
