package com.bf.serviceCenter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
		
	
	/**
	 * @author : 김동환
	 * @date : 2018. 2. 19.
	 * comment : 고객센터 연결
	 */
	@RequestMapping(value = "/serviceCenter/main.do" , method = RequestMethod.GET)
	public String serviceCenterMain(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("서비스 센터");
		return "serviceCenter/main.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/FAQ.do" , method = RequestMethod.GET)
	public String serviceCenterFaq(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("문의하기");
		return "serviceCenter/FAQ.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/inquriy_list2.do" , method = RequestMethod.GET)
	public String serviceCenterInquriyList(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("문의내역");
		return "serviceCenter/inquriy_list2.solo";
	}
		
	@RequestMapping(value = "/serviceCenter/inquriy_answer.do" , method = RequestMethod.GET)
	public String serviceCenterInquriyAnswer(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("문의내역 답변");
		return "serviceCenter/inquriy_answer.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/information.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterInformation(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("고객센터 안내사항");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterInfo(mav);
		
		//return "serviceCenter/information.solo";
		
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/information_content1.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterInformationContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("고객센터 안내사항_내용");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterInfoRead(mav);
		
		//return "serviceCenter/information_content1.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/manyque.do" , method = RequestMethod.GET)
	public String serviceCenterManyQuestion(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("자주 묻는 질문");
		return "serviceCenter/manyque.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/manyque_content.do" , method = RequestMethod.GET)
	public String serviceCenterManyQuestionContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("자주 묻는 질문_내용");
		return "serviceCenter/manyque_content.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/id_login.do" , method = RequestMethod.GET)
	public String serviceCenterIdLogin(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("아이디 / 로그인");
		return "serviceCenter/id_login.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/id_login_content.do" , method = RequestMethod.GET)
	public String serviceCenterIdLoginContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("아이디 / 로그인_내용");
		return "serviceCenter/id_login_content.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/pay_refund.do" , method = RequestMethod.GET)
	public String serviceCenterPayRefund(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("결제 / 환불");
		return "serviceCenter/pay_refund.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/pay_refund_content.do" , method = RequestMethod.GET)
	public String serviceCenterPayRefundContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("결제 / 환불_내용");
		return "serviceCenter/pay_refund_content.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/how_use.do" , method = RequestMethod.GET)
	public String serviceCenterHowUse(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("이용문의");
		return "serviceCenter/how_use.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/how_use_content.do" , method = RequestMethod.GET)
	public String serviceCenterHowUseContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("이용문의_내용");
		return "serviceCenter/how_use_content.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/error_use.do" , method = RequestMethod.GET)
	public String serviceCenterErrorUse(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("오류 / 활용 도움말");
		return "serviceCenter/error_use.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/error_use_content.do" , method = RequestMethod.GET)
	public String serviceCenterErrorUseContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("오류 / 활용 도움말_내용");
		return "serviceCenter/error_use_content.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/inquriy.do" , method = RequestMethod.GET)
	public String serviceCenterInquriy(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("북팩토리 문의");
		return "serviceCenter/inquriy.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/service_suggestion.do" , method = RequestMethod.GET)
	public String serviceCenterServiceSuggestion(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("서비스 제안");
		return "serviceCenter/service_suggestion.solo";
	}
	
	@RequestMapping(value = "/serviceCenter/book_suggestion.do" , method = RequestMethod.GET)
	public String serviceCenterBookSuggestion(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("도서 제안");
		return "serviceCenter/book_suggestion.solo";
	}
	
}
