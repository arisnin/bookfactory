package com.bf.manager.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.manager.dto.BoardContactDto;
import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.manager.dto.MemberDto;
import com.bf.manager.dto.ReviewManagerDto;
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
		mav.addObject("request", request);
		managerService.boardContact(mav);
		return mav;
	}

	@RequestMapping(value = "/boardDelete.do", method = RequestMethod.GET)
	public ModelAndView boardDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("board/delete.mg");
		LogAspect.info("boardDelete()");
		mav.addObject("request", request);
		managerService.boardDelete(mav);
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
	
	@RequestMapping(value = "/boardReply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardReply(HttpServletRequest request, HttpServletResponse response,BoardContactDto boardContactDto) {
		ModelAndView mav = new ModelAndView("board/reply.mg");
		LogAspect.info("boardReply()");
		mav.addObject("boardContactDto",boardContactDto);
		mav.addObject("request",request);
		managerService.boardReply(mav);
		return mav;
	}
	@RequestMapping(value = "/boardReplyOk.do", method = RequestMethod.POST)
	public ModelAndView boardReplyOk(HttpServletRequest request, HttpServletResponse response,
			BoardContactDto boardContactDto) {
		ModelAndView mav = new ModelAndView("board/insertOk.mg");
		LogAspect.info("boardReplyOk()");
		mav.addObject("request", request);
		mav.addObject("boardContactDto", boardContactDto);
		managerService.boardReplyOk(mav);
		return mav;
	}

	@RequestMapping(value = "/boardUpdate.do", method = RequestMethod.GET)
	public ModelAndView boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("board/update.mg");
		LogAspect.info("boardUpdate()");
		mav.addObject("request",request);
		managerService.boardUpdate(mav);
		return mav;
	}
	@RequestMapping(value = "/boardUpdateOk.do", method =  RequestMethod.POST)
	public ModelAndView boardUpdateOk(HttpServletRequest request, HttpServletResponse response,BoardFrequencyDto boardFrequencyDto) {
		ModelAndView mav = new ModelAndView("board/updateOk.mg");
		LogAspect.info("boardUpdateOk()");
		mav.addObject("request",request);
		mav.addObject("boardFrequencyDto",boardFrequencyDto);
		managerService.boardUpdateOk(mav);
		return mav;
	}
	@RequestMapping(value="/boardDownload.do", method=RequestMethod.GET)
	public ModelAndView fileDownLoad(HttpServletRequest request , HttpServletResponse response) {
		ModelAndView mav =new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		
		managerService.boardDownLoad(mav);
		return null;
	}
//----------------------멤버----------------------------------------------
	@RequestMapping(value = "/memberMember.do", method = RequestMethod.GET)
	public ModelAndView memberMember(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("member/member.mg");
		LogAspect.info("memberMember()");
		mav.addObject("request",request);
		managerService.memberList(mav);
		return mav;

	}

	@RequestMapping(value = "/memberPay.do", method = RequestMethod.GET)
	public ModelAndView memberPay(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("member/pay.mg");
		LogAspect.info("memberPay()");
		mav.addObject("request",request);
		managerService.memberPay(mav);
		return mav;
	}

	@RequestMapping(value = "/memberPayDetail.do", method = RequestMethod.GET)
	public ModelAndView memberPayDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("member/payDetail.mg");
		LogAspect.info("memberPayDetail()");
	
		mav.addObject("request",request);
		managerService.memberPayDetail(mav);
		return mav;
	}

	@RequestMapping(value = "/memberRegister.do", method = RequestMethod.GET)
	public ModelAndView memberRegister(HttpServletRequest request, HttpServletResponse response,
			MemberDto memberDto) {
		ModelAndView mav = new ModelAndView("member/register.mg");
		LogAspect.info("memberRegister()");
		mav.addObject("request",request);
		mav.addObject("memberDto",memberDto);
		managerService.memberRegister(mav);
		return mav;
	}
	@RequestMapping(value = "/memberRegisterOk.do", method = RequestMethod.POST)
	public ModelAndView memberRegisterOk(HttpServletRequest request, HttpServletResponse response,
			MemberDto memberDto) {
		ModelAndView mav = new ModelAndView("member/registerOk.mg");
		LogAspect.info("memberRegisterOk()");
		mav.addObject("request",request);
		mav.addObject("memberDto",memberDto);
		managerService.memberRegisterOk(mav);
		return mav;
	}
	@RequestMapping(value = "/memberDelete.do", method = RequestMethod.GET)
	public ModelAndView memberDelete(HttpServletRequest request, HttpServletResponse response,
			MemberDto memberDto) {
		ModelAndView mav = new ModelAndView("member/delete.mg");
		LogAspect.info("memberDelete()");
		mav.addObject("request",request);
		mav.addObject("memberDto",memberDto);
		managerService.memberDelete(mav);
		return mav;
	}

	@RequestMapping(value = "memberPointInsert.do", method = RequestMethod.POST)
	public void memberPointInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LogAspect.info("memberPointInsert()");

		managerService.memberPointInsert(request, response);
	}

	@RequestMapping(value = "/reviewReview.do", method = RequestMethod.GET)
	public ModelAndView memberReview(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("review/review.mg");
		LogAspect.info("memberReview()");
		mav.addObject("request",request);
		managerService.managerReview(mav);
		return mav;
	}

	@RequestMapping(value = "/reviewReport.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberReport(HttpServletRequest request, HttpServletResponse response,ReviewManagerDto ReviewManagerDto) {
		ModelAndView mav = new ModelAndView("review/report.mg");
		LogAspect.info("memberReview()");
		mav.addObject("request",request);
		mav.addObject("ReviewManagerDto",ReviewManagerDto);
		managerService.managerReviewReport(mav);
		LogAspect.info("reviewReport()");
		return mav;
	}
	@RequestMapping(value = "/boardNoticeInsert.do", method = RequestMethod.GET)
	public ModelAndView memberReport(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("board/noticeInsert.mg");
		LogAspect.info("boardNoticeInsert()");
		mav.addObject("request",request);
		managerService.managerNoticeInsert(mav);
		return mav;
	}
	@RequestMapping(value = "/boardNoticeInsertOk.do", method = RequestMethod.POST)
	public ModelAndView boardInsertOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("board/insertOk.mg");
		LogAspect.info("boardNoticeInsertOk)");
		mav.addObject("request", request);
		managerService.boardNoticeInsertOk(mav);
		return mav;
	}

}
