package com.bf.order.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dto.HomeDto;
import com.bf.main.dto.CategoryPageDto;
import com.bf.member.model.User;
import com.bf.order.dao.OrderDao;
import com.bf.order.dto.OrderDto;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 카트/위시리스트/구매 관련 서비스 구현 클래스
 */
@Component
public class OrderServiceImp implements OrderService {
	@Autowired
	private OrderDao orderDao;
	
	/*
	 * 카트 구매 도서 목록(대여는 제외) - 수정버전(박성호)
	 * @see com.bf.order.service.OrderService#getCart2(org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public ModelAndView getCart2(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		
		User user = (User) request.getSession().getAttribute("userInfo");
		
		if (user == null) return mav;
		
		List<CategoryPageDto> purchaseList = orderDao.getCartPurchase(user.getUsername(), 0);
		List<CategoryPageDto> rentalList = orderDao.getCartPurchase(user.getUsername(), 1);
		
		LogAspect.info("purchaseList:"+purchaseList.size());
		LogAspect.info("rentalList:"+rentalList.size());
		
		mav.addObject("purchaseList", purchaseList);
		mav.addObject("rentalList", rentalList);
		
		return mav;
	}

	@Override
	public void cartWishList(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		LogAspect.info("cartWishList()");
		int num = Integer.parseInt(request.getParameter("book_num"));

		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();

		int check = orderDao.cartWishList(num, id);
		System.out.println(check);
		mav.addObject("check", check);
		mav.setViewName("/cart.main");
	}

	@Override
	public void wishListCart(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		LogAspect.info("wishListCart()");
		int num = Integer.parseInt(request.getParameter("num"));
		int check = orderDao.cartWishList(num, null);
		System.out.println(check);
		mav.addObject("check", check);
		mav.setViewName("/cart.main");
	}

	@Override
	public void cartDelete(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		LogAspect.info("cartDelete()");
		// TODO: 선택삭제 기능시에 NumberFormatException 발생
		int book_num = Integer.parseInt(request.getParameter("bookNum"));
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		int check = orderDao.cartDelete(book_num, id);

		mav.addObject("check", check);
	}

	@Override
	public void getCart(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		LogAspect.info("getCart()");
		User user = (User) request.getSession().getAttribute("userInfo");
		List<HomeDto> list = orderDao.getCart(user.getUsername());
		long totalPrice = 0;
		for (int i = 0; i < list.size(); i++) {
			HomeDto homeDto = list.get(i);
			totalPrice = homeDto.getPrice();
		}
		LogAspect.info(list.toString());
		mav.addObject("listCart", list);
		mav.addObject("totalPrice", totalPrice);
		mav.addObject("listSize", list.size());
	}

	@Override
	public void getWish(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		LogAspect.info("getCart()");
		User user = (User) request.getSession().getAttribute("userInfo");
		List<HomeDto> list = orderDao.getWish(user.getUsername());
		LogAspect.info(list.toString());
		LogAspect.info(list.size());
		mav.addObject("listWish", list);
		mav.addObject("listSize", list.size());
	}

	@Override
	public void cartInsert(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		int bookNum = Integer.parseInt(request.getParameter("book_num"));
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		int count = orderDao.oneCart_Wish(id, bookNum);
		// System.out.println(count);
		try {
			response.setContentType("application/text;charset=utf-8");
			if (count == 0) {
				response.getWriter().print(count);
			} else {
				int check = orderDao.cartInsert(bookNum, id);
				response.getWriter().print(check);
				System.out.println(check);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void wishListInsert(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		int bookNum = Integer.parseInt(request.getParameter("book_num"));
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		int count = orderDao.oneCart_Wish(id, bookNum);
		try {
			response.setContentType("application/text;charset=utf-8");
			if (count == 0) {
				response.getWriter().print(count);
			} else {
				int check = orderDao.wishListInsert(bookNum, id);
				response.getWriter().print(check);
				System.out.println(check);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		// System.out.println(check);
	}

	@Override
	public void payment(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String bookList[] = request.getParameterValues("bookList");
		OrderDto orderDto = (OrderDto)mav.getModelMap().get("orderDto");
		
		User user = (User) request.getSession().getAttribute("userInfo");
		String id = user.getUsername();
		
		orderDto.setId(id);
		orderDto.setOrder_num(System.currentTimeMillis());
		orderDto.setPresent_check("no");
		orderDto.setCancel_check("no");
		orderDto.setRental_state("no");
		orderDto.setFree_pass("no");
		orderDto.setState("yes");
		
		int check = 0;
		
		// 결재 업데이트
		if (bookList != null) {
			for (String s : bookList) {
				orderDto.setBook_num(Integer.parseInt(s));
				LogAspect.info(orderDto);
				check += orderDao.paymentInsert(orderDto);
			}
		}
		
		// 주문목록 생성
		List<CategoryPageDto> orderList = orderDao.getOrderList(Arrays.asList(bookList));
		LogAspect.info(orderList.size());
		
		mav.addObject("check", check).addObject("updateCount", check);
		mav.addObject("orderList", orderList);
	}

	@Override
	public void getBookSelect(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");

		String bookList[] = request.getParameterValues("bookList");
		List<String> arrBookList = Arrays.asList(bookList);
		
		List<CategoryPageDto> orderList = orderDao.getOrderList(arrBookList);		
		LogAspect.info(orderList.size());
		
		mav.addObject("orderList", orderList);
		mav.addObject("bookList", arrBookList);
	}

}
