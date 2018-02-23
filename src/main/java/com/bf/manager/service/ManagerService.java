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

	public void autoInsertBook(ModelAndView mav);

	public void bookInNameCheck(ModelAndView mav);

	public void bookInAuthorCheck(ModelAndView mav);

	public void bookCategory(ModelAndView mav);

	public void bookUploadImg(ModelAndView mav);

	public void bookInsertOk(ModelAndView mav);

	public void bookSearch(ModelAndView mav);

	public void bookUpdate(ModelAndView mav);

	public void insertCateOne(ModelAndView mav);

	public void insertCateTwo(ModelAndView mav);

	public void insertCateThree(ModelAndView mav);

	public void publisherSearch(ModelAndView mav);

	public void publisherUpdate(ModelAndView mav);

	public void publisherUpdateOk(ModelAndView mav);

	public void authorSearch(ModelAndView mav);

	public void authorRead(ModelAndView mav);

	public void authorUpdateRead(ModelAndView mav);

	public void authorUpdateReadOk(ModelAndView mav);

	public void authorUpdate(ModelAndView mav);

	public void authorUpdateOk(ModelAndView mav);

	public void authorNameCheck(ModelAndView mav);

	public void test(ModelAndView mav);

	public void bookUpdateOk(ModelAndView mav);

	
}
