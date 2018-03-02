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

	void inquriyAnswer(ModelAndView mav);

	void serviceCenterQuestion(ModelAndView mav);

	void serviceCenterManyQuestionContent(ModelAndView mav);

	void serviceCenterMain(ModelAndView mav);

	void serviceCenterIdLogin(ModelAndView mav);

	void serviceCenterIdLoginContent(ModelAndView mav);

	void serviceCenterPayRefund(ModelAndView mav);

	void serviceCenterPayRefundContent(ModelAndView mav);

	void serviceCenterHowUse(ModelAndView mav);

	void serviceCenterHowUseContent(ModelAndView mav);

	void serviceCenterErrorUse(ModelAndView mav);

	void serviceCenterErrorUseContent(ModelAndView mav);

	void serviceCenterSystemUpdate(ModelAndView mav);

	void serviceCenterSystemUpdateContent(ModelAndView mav);

	void bookSuggestionWrite(ModelAndView mav);

	void bookSuggestionWriteOk(ModelAndView mav);

	

}
