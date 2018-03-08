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
import com.bf.manager.dao.ManagerDao;
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
	 * 카트 구매 도서 목록 - 수정버전(박성호)
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

	/*
	 * 2018-03-05 박성호 수정
	 * 삭제 요청이 책 한권 뿐만 아니라 여러권일 때도 처리할 수 있도록, arrBookList 배열을 이용해서 처리하도록 로직을 수정
	 * DAO에서는 동적 SQL를 사용하여, 다수의 책을 한 번에 삭제할 수 있도록 구현함
	 *  
	 * @see com.bf.order.service.OrderService#cartDelete(org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void cartDelete(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		int check = 0;
		
		String bookList = request.getParameter("bookList");
		
		if (bookList != null) { 
			String arrBookList[] = bookList.split(",");
			
			for (String s : arrBookList) {
				System.out.println(s);
			}
			
			User user = (User) request.getSession().getAttribute("userInfo");
			
			if (user != null) {
				String id = user.getUsername();
				check = orderDao.cartDelete(arrBookList, id);
			}
		}
		
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
		
		// 구매성공 시 카트에 있는 책 삭제하기(카트를 경유해서 구입한 책이 아니더라도 같은 책이 카트에 존재할 경우 삭제한다)
		if (bookList != null && check > 0) {
			orderDao.cartDelete(bookList, id);
		}
	}

	/*염현우*/
	@Override
	public void getBookSelect(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");

		//id정보
		User user = (User) request.getSession().getAttribute("userInfo");
		
		int point = orderDao.getPoint(user.getUsername());
		int cash = orderDao.getCash(user.getUsername());
		
		String bookList[] = request.getParameterValues("bookList");
		List<String> arrBookList = Arrays.asList(bookList);
		
		List<CategoryPageDto> orderList = orderDao.getOrderList(arrBookList);
		LogAspect.info(orderList.size());
		
		mav.addObject("cash", cash);
		mav.addObject("point", point);
		mav.addObject("orderList", orderList);
		mav.addObject("bookList", arrBookList);
	}

}
