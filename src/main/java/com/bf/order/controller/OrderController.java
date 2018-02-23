package com.bf.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.order.dto.OrderDto;
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
	 * 헤더 > 카트(cart.jsp 데이터 수집후 뿌리기)
	 */
	@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
	public ModelAndView cart(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("cart()");
		request.getSession().setAttribute("userInfoId", "manager");
		ModelAndView mav = new ModelAndView("cart/cart.main");
		mav.addObject("request", request);
		orderService.getCart(mav);
		return mav;
	}
	
	/**
	 * 헤더 > 위시리스트
	 */
	@RequestMapping(value = "/wishlist.do", method = RequestMethod.GET)
	public ModelAndView wishlist(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("wishlist()");
		request.getSession().setAttribute("userInfoId", "manager");
		ModelAndView mav = new ModelAndView("cart/wishlist.main");
		mav.addObject("request", request);
		orderService.getWish(mav);
		return mav;
	}

	/**
	 * 헤더 > 카트 > 구매
	 */
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public ModelAndView order(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("order()");
		ModelAndView mav = new ModelAndView("order/order.main");
		mav.addObject("request", request);
		orderService.getBookSelect(mav);
		return mav;
	}

	/**
	 * 헤더 > 카트 > 구매 완료, 구매목록 추가
	 */
	@RequestMapping(value = "/orderOk.do", method = RequestMethod.GET)
	public ModelAndView payment(HttpServletRequest request, HttpServletResponse response, OrderDto orderDto) {
		LogAspect.info("payment()");
		ModelAndView mav = new ModelAndView("order/orderOk.main");
		mav.addObject("request", request);
//		LogAspect.info(orderDto.toString());
		mav.addObject("orderDto", orderDto);
		orderService.payment(mav);
		return mav;
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
	
	/**
	 * 장바구니 비우기 
	 */
	@RequestMapping(value = "cart/cartDelete.do", method = RequestMethod.GET)
	public ModelAndView cartDelete(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("cartDelete()");
		ModelAndView mav = new ModelAndView("cart/cart.main");
		mav.addObject("request", request);
		orderService.cartDelete(mav);
		return mav;
	}
	
	/**
	 * 장바구니 추가
	 */
	@RequestMapping(value = "/cartInsert.do", method = RequestMethod.GET)
	public ModelAndView cartInsert(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("cartInsert()");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		orderService.cartInsert(mav);
		return null;
	}
	
	/**
	 * 위시리스트 추가
	 */
	@RequestMapping(value = "/wishInsert.do", method = RequestMethod.GET)
	public ModelAndView wishInsert(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("wishInsert()");
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		orderService.wishListInsert(mav);
		return null;
	}
	
	
}
