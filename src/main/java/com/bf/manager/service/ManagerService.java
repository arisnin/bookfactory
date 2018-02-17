package com.bf.manager.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @이름: 염현우
 * @날짜: 2018. 2. 12.
 * @설명: 관리자서비스 인터페이스 
 */
public interface ManagerService {


	
	public void bookCategoryOk(ModelAndView mav);

	public void publisherInsertOk(ModelAndView mav);

	public void publisherNameCheck(ModelAndView mav);

	public void authorInsertOk(ModelAndView mav);

	public void authorInsert(ModelAndView mav);

	public void bookInsert(ModelAndView mav);

	public void bookCateOne(ModelAndView mav);

	public void bookCateTwo(ModelAndView mav);

	public void bookOpenPub(ModelAndView mav);

	public void autoUrl(ModelAndView mav);

	public void autoIlban(ModelAndView mav);

	public void autoRomance(ModelAndView mav);

	public void autoFantasy(ModelAndView mav);

	public void autoManhaw(ModelAndView mav);

	public void autoBL(ModelAndView mav);

}
