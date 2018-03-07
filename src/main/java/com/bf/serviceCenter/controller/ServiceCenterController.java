package com.bf.serviceCenter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dto.ReviewDto;
import com.bf.manager.dto.BoardContactDto;
import com.bf.member.model.User;
import com.bf.serviceCenter.dto.BookContactDto;
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
	public ModelAndView serviceCenterMain(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("서비스 센터");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterMain(mav);
		
		//return "serviceCenter/main.solo";
		return mav;
	}
		
	
	@RequestMapping(value = "/serviceCenter/FAQ.do" , method = RequestMethod.GET)
	public String serviceCenterFaq(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("문의하기");
		
		User user = (User)request.getSession().getAttribute("userInfo");
		
		LogAspect.info(user);
		
		return "serviceCenter/FAQ.solo";
		
	}
	
	@RequestMapping(value = "/serviceCenter/inquriy.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterInquriy(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("북팩토리 문의");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.inquriyWrite(mav);
				
		//return "serviceCenter/inquriy.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/inquriyOk.do" , method = RequestMethod.POST)
	public ModelAndView serviceCenterInquriyOk(HttpServletRequest request, HttpServletResponse response, BoardContactDto boardContactDto) {
		LogAspect.info("북팩토리 문의 작성완료");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("boardContactDto", boardContactDto);
		
		serviceCenterService.inquriyWriteOk(mav);
		
		//return "serviceCenter/inquriyOk.solo";
		return mav;
	}
	
//	@RequestMapping(value = "/serviceCenter/service_suggestion.do" , method = RequestMethod.GET)
//	public String serviceCenterServiceSuggestion(HttpServletRequest request, HttpServletResponse response) {
//		LogAspect.info("서비스 제안");
//		return "serviceCenter/service_suggestion.solo";
//	}
	
	@RequestMapping(value = "/serviceCenter/book_suggestion.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterBookSuggestion(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("도서 제안 작성");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.bookSuggestionWrite(mav);
		
		//return "serviceCenter/book_suggestion.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/book_suggestionOk.do" , method = RequestMethod.POST)
	public ModelAndView serviceCenterBookSuggestionOk(HttpServletRequest request, HttpServletResponse response, BookContactDto bookContactDto) {
		LogAspect.info("도서 제안 작성완료");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("bookContactDto", bookContactDto);
		
		serviceCenterService.bookSuggestionWriteOk(mav);
		
		//return "serviceCenter/book_suggestion.solo";
		return mav;
	}
	
	
	@RequestMapping(value = "/serviceCenter/inquriy_list2.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterInquriyList(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("문의내역");
		
		ModelAndView mav = new ModelAndView();
				
		mav.addObject("request", request);
		
		serviceCenterService.inquriyList(mav);
		
		//return "serviceCenter/inquriy_list2.solo";
		return mav;
		
	}
		
	@RequestMapping(value = "/serviceCenter/inquriy_answer.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterInquriyAnswer(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("문의내역 답변");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.inquriyAnswer(mav);
		
		//return "serviceCenter/inquriy_answer.solo";
		return mav;
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
	
	@RequestMapping(value = "/serviceCenter/information_download.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterInformationDownLoad(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("다운로드 시작");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		serviceCenterService.serviceCenterInformationDownLoad(mav);
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/serviceCenter/manyque.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterManyQuestion(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("자주 묻는 질문");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterQuestion(mav);
		
		//return "serviceCenter/manyque.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/manyque_content.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterManyQuestionContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("자주 묻는 질문_내용");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterManyQuestionContent(mav);
		
		//return "serviceCenter/manyque_content.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/id_login.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterIdLogin(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("아이디 / 로그인");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterIdLogin(mav);
		
		//return "serviceCenter/id_login.solo";
		return mav;
		
	}
	
	@RequestMapping(value = "/serviceCenter/id_login_content.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterIdLoginContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("아이디 / 로그인_내용");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterIdLoginContent(mav);
		
		//return "serviceCenter/id_login_content.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/pay_refund.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterPayRefund(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("결제 / 환불");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterPayRefund(mav);
		
		//return "serviceCenter/pay_refund.solo";
		
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/pay_refund_content.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterPayRefundContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("결제 / 환불_내용");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterPayRefundContent(mav);
		
		//return "serviceCenter/pay_refund_content.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/how_use.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterHowUse(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("이용문의");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterHowUse(mav);
		
		//return "serviceCenter/how_use.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/how_use_content.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterHowUseContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("이용문의_내용");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterHowUseContent(mav);
		
		//return "serviceCenter/how_use_content.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/error_use.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterErrorUse(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("오류 / 활용 도움말");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterErrorUse(mav);
		
		//return "serviceCenter/error_use.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/error_use_content.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterErrorUseContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("오류 / 활용 도움말_내용");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterErrorUseContent(mav);
		
		//return "serviceCenter/error_use_content.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/system_update.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterSystemUpdate(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("오류 / 활용 도움말");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterSystemUpdate(mav);
		
		//return "serviceCenter/error_use.solo";
		return mav;
	}
	
	@RequestMapping(value = "/serviceCenter/system_update_content.do" , method = RequestMethod.GET)
	public ModelAndView serviceCenterSystemUpdateContent(HttpServletRequest request, HttpServletResponse response) {
		LogAspect.info("오류 / 활용 도움말_내용");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		
		serviceCenterService.serviceCenterSystemUpdateContent(mav);
		
		//return "serviceCenter/error_use_content.solo";
		return mav;
	}
	

	
}
