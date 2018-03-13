package com.bf.myPage.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author	박성호
 * @date	2018. 2. 12.
 * @description	마이페이지 Service 인터페이스
 */
public interface MyPageService {

	void myCashOk(ModelAndView mav);

	void myInfoUpdate(ModelAndView mav);

	void myPoint(ModelAndView mav);

	void myCashHistoryCash(ModelAndView mav);

	void myCash(ModelAndView mav);

	void recentLookBook(ModelAndView mav);

	void purchased(ModelAndView mav);

	void purchasedDelete(ModelAndView mav);

	void recentLookBookDelete(ModelAndView mav);

	void myCashHistoryCashClick(ModelAndView mav);

	void home(ModelAndView mav);

	void myInfoOk(ModelAndView mav);

	void myInfoCheck(ModelAndView mav);

	void myInfo(ModelAndView mav);

	void orderHistory(ModelAndView mav);

	ModelAndView myReview(ModelAndView mav);

	void reviewDelete(HttpServletRequest request, HttpServletResponse response) throws IOException;

	ModelAndView reviewUpdate(ModelAndView mav);

	ModelAndView orderHistoryClick(ModelAndView addObject);


}
