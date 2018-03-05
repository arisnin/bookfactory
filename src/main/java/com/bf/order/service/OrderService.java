package com.bf.order.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author	박성호
 * @date	2018. 2. 14.
 * @description 카트/위시리스트/구매 관련 서비스 인터페이스	
 */
public interface OrderService {

	public void cartWishList(ModelAndView mav);

	public void cartDelete(ModelAndView mav);

	public void wishListCart(ModelAndView mav);

	public void getCart(ModelAndView mav);

	public void cartInsert(ModelAndView mav);

	public void wishListInsert(ModelAndView mav);

	public void getWish(ModelAndView mav);

	public void payment(ModelAndView mav);

	public void getBookSelect(ModelAndView mav);

	public ModelAndView getCart2(ModelAndView mav);

}
