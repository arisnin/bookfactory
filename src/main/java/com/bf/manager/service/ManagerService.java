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

}
