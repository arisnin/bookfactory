package com.bf.serviceCenter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bf.aop.LogAspect;
import com.bf.member.model.User;
import com.bf.serviceCenter.service.ServiceCenterService;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 고객센터 컨트롤러
 */
@Controller
public class ServiceCenterController {
	@Autowired
	private ServiceCenterService serviceCenterService;

	/**
	 * 테스트용 맵핑입니다.
	 */
	@RequestMapping(value = "/test/service.do", method = RequestMethod.GET)
	public String testService(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("testService()");
		User user = (User)request.getSession().getAttribute("userInfo");
		LogAspect.info(user);
		return "present/present.main";
	}
}
