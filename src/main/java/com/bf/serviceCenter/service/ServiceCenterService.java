package com.bf.serviceCenter.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 고객센터 서비스 인터페이스
 */
public interface ServiceCenterService {
	
	void serviceCenterInfo(ModelAndView mav);

	void serviceCenterInfoRead(ModelAndView mav);

	void serviceCenterInformationDownLoad(ModelAndView mav);

	void inquriyWrite(ModelAndView mav);

	void inquriyWriteOk(ModelAndView mav);

	void inquriyList(ModelAndView mav);

	

}
