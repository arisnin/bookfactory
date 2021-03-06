package com.bf.manager.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

/**
 * @이름: 전상헌
 * @날짜: 2018. 2. 13.
 * @설명: 관리자서비스 인터페이스 2번
 */

public interface ManagerServiceTwo {
	public void boardInsert(ModelAndView mav);

	public void boardInsertOk(ModelAndView mav);

	public void boardList(ModelAndView mav);
	
	public void boardContact(ModelAndView mav);
	
	public void boardDownLoad(ModelAndView mav);
	
	public void boardUpdate(ModelAndView mav);
	
	public void boardUpdateOk(ModelAndView mav);
	
	public void boardDelete(ModelAndView mav);


	public void managerNoticeInsert(ModelAndView mav);
	
	public void boardNoticeInsertOk(ModelAndView mav);
	
	public void memberList(ModelAndView mav);

	public void memberRegister(ModelAndView mav);

	public void memberRegisterOk(ModelAndView mav);
	
	public void memberDelete(ModelAndView mav);
	
	public void memberPay(ModelAndView mav);
	
	public void memberPayDetail(ModelAndView mav);
	
	public void managerReview(ModelAndView mav);
	
	public void managerReviewReport(ModelAndView mav);
	

	public void boardReply(ModelAndView mav);
	public void boardReplyOk(ModelAndView mav);

	public void memberPointInsert(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
