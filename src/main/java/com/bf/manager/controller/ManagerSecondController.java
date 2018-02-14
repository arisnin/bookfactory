package com.bf.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.manager.service.ManagerServiceTwo;

/**
 * @author YEOM HYUN WOO X JUN SANG HUN
 * @date 2018-02-13
 * @description start-url = /bookFactory/manager/index.do 
 * 				요청맵핑은(RequestMapping의 value를 뜻함) .do로 걸어준다 
 * 				layout 설정법 (ModelAndView의 페이지셋팅값을 뜻함) 
 * 				- content만 나오는 뷰는 .mge 
 * 				- header, menu, content, footer 다 나오는 뷰는 .mg로 맞춰준다
 * 				
 * 				- 상헌형 작업 컨트롤러
 */

@Controller
@RequestMapping(value = "/manager")
public class ManagerSecondController {
	@Autowired
	private ManagerServiceTwo managerService;
	
	// -------상헌이꺼--------------------------------------------------------------------

	@RequestMapping(value = "/boardContact.do", method = RequestMethod.GET)
	public ModelAndView boardContact(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("board/contact.mg");
		LogAspect.info("boardContact()");
		return mav;
	}

	@RequestMapping(value = "/boardDelete.do", method = RequestMethod.GET)
	public ModelAndView boardDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("board/delete.mg");
		LogAspect.info("boardDelete()");
		return mav;
	}

	@RequestMapping(value = "/boardInsert.do", method = RequestMethod.GET)
	public ModelAndView boardInsert(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("board/insert.mg");
		LogAspect.info("boardInsert()");
		mav.addObject("request", request);
		managerService.boardInsert(mav);
		return mav;
	}

	@RequestMapping(value = "/boardInsertOk.do", method = RequestMethod.POST)
	public ModelAndView boardInsertOk(HttpServletRequest request, HttpServletResponse response,
			BoardFrequencyDto boardFreDto) {
		ModelAndView mav = new ModelAndView("board/insertOk.mg");
		LogAspect.info("boardInsertOk()");
		mav.addObject("request", request);
		mav.addObject("boardFreDto", boardFreDto);
		managerService.boardInsertOk(mav);
		return mav;
	}

	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("board/list.mg");
		LogAspect.info("boardList()");
		mav.addObject("request",request);
		managerService.boardList(mav);
		return mav;
	}
	
	@RequestMapping(value = "/boardReply.do", method = RequestMethod.GET)
	public ModelAndView boardReply() {
		ModelAndView mav = new ModelAndView("board/reply.mg");
		LogAspect.info("boardReply()");
		return mav;
	}

	@RequestMapping(value = "/boardUpdate.do", method = RequestMethod.GET)
	public ModelAndView boardUpdate() {
		ModelAndView mav = new ModelAndView("board/update.mg");
		LogAspect.info("boardUpdate()");
		return mav;
	}

	@RequestMapping(value = "/memberMember.do", method = RequestMethod.GET)
	public ModelAndView memberMember() {
		ModelAndView mav = new ModelAndView("member/member.mg");
		LogAspect.info("memberMember()");
		return mav;
	}

	@RequestMapping(value = "/memberPay.do", method = RequestMethod.GET)
	public ModelAndView memberPay() {
		ModelAndView mav = new ModelAndView("member/pay.mg");
		LogAspect.info("memberPay()");
		return mav;
	}

	@RequestMapping(value = "/memberPayDetail.do", method = RequestMethod.GET)
	public ModelAndView memberPayDetail() {
		ModelAndView mav = new ModelAndView("member/payDetail.mg");
		LogAspect.info("memberPayDetail()");
		return mav;
	}

	@RequestMapping(value = "/memberRegister.do", method = RequestMethod.GET)
	public ModelAndView memberRegister() {
		ModelAndView mav = new ModelAndView("member/register.mg");
		LogAspect.info("memberRegister()");
		return mav;
	}

	@RequestMapping(value = "/reviewReview.do", method = RequestMethod.GET)
	public ModelAndView memberReview() {
		ModelAndView mav = new ModelAndView("review/review.mg");
		LogAspect.info("memberReview()");
		return mav;
	}

	@RequestMapping(value = "/reviewReport.do", method = RequestMethod.GET)
	public ModelAndView memberReport() {
		ModelAndView mav = new ModelAndView("review/report.mg");
		LogAspect.info("memberReport()");
		return mav;
	}

}
