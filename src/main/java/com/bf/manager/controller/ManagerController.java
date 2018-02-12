package com.bf.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.manager.service.ManagerService;

/**
 * @author YEOM HYUN WOO X JUN SANG HUN
 * @date   2018-02-07
 * @description 
 *         start-url = /bookFactory/manager/index.do
 *         요청맵핑은(RequestMapping의 value를 뜻함) .do로 걸어준다
 *         layout 설정법 (ModelAndView의 페이지셋팅값을 뜻함)
 *         	- content만 나오는 뷰는 .mge
 *          - header, menu, content, footer 다 나오는 뷰는 .mg로 맞춰준다 
 */
@Controller
@RequestMapping(value="/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;

	@RequestMapping(value="/index.do",method=RequestMethod.GET)
	public ModelAndView manager() {
		ModelAndView mav = new ModelAndView("manager.mge");
		LogAspect.info("manager()");
		return mav;
	}
	
	@RequestMapping(value="/authorInsert.do",method=RequestMethod.GET)
	public ModelAndView authorInsert() {
		ModelAndView mav = new ModelAndView("author/insert.mg");
		LogAspect.info("authorInsert()");
		return mav;
	}
	
	@RequestMapping(value="/authorSearch.do",method=RequestMethod.GET)
	public ModelAndView authorsearch() {
		ModelAndView mav = new ModelAndView("author/search.mg");
		LogAspect.info("authorsearch()");
		return mav;
	}
	
	@RequestMapping(value="/authorUpdate.do",method=RequestMethod.GET)
	public ModelAndView authorUpdate() {
		ModelAndView mav = new ModelAndView("author/update.mg");
		LogAspect.info("authorUpdate()");
		return mav;
	}
	
	@RequestMapping(value="/authorUpdateRead.do",method=RequestMethod.GET)
	public ModelAndView authorUpdateRead() {
		ModelAndView mav = new ModelAndView("author/updateRead.mg");
		LogAspect.info("authorUpdateRead()");
		return mav;
	}
	
	@RequestMapping(value="/bookInsert.do",method=RequestMethod.GET)
	public ModelAndView bookInsert() {
		ModelAndView mav = new ModelAndView("book/insert.mg");
		LogAspect.info("bookInsert()");
		return mav;
	}
	
	@RequestMapping(value="/bookCategory.do",method=RequestMethod.GET)
	public ModelAndView bookCategory() {
		ModelAndView mav = new ModelAndView("book/category.mg");
		return mav;
	}
	
	@RequestMapping(value="/bookCateSecond.do",method=RequestMethod.GET)
	public ModelAndView bookCateSecond(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("book/category.mg");
		mav.addObject("request", request);
		managerService.bookCateSecond(mav);
		return mav;
	}
	
	@RequestMapping(value="/bookCategoryOk.do",method=RequestMethod.GET)
	public ModelAndView bookCategoryOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("book/category.mg");
		managerService.bookCategoryOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/bookOpenPub.do",method=RequestMethod.GET)
	public ModelAndView bookOpenPub() {
		ModelAndView mav = new ModelAndView("book/openPub.mge");
		LogAspect.info("bookOpenPub()");
		return mav;
	}
	
	@RequestMapping(value="/bookRead.do",method=RequestMethod.GET)
	public ModelAndView bookRead() {
		ModelAndView mav = new ModelAndView("book/read.mg");
		LogAspect.info("bookRead()");
		return mav;
	}
	
	@RequestMapping(value="/bookSearch.do",method=RequestMethod.GET)
	public ModelAndView bookSearch() {
		ModelAndView mav = new ModelAndView("book/search.mg");
		LogAspect.info("bookSearch()");
		return mav;
	}
	
	@RequestMapping(value="/publisherSearch.do",method=RequestMethod.GET)
	public ModelAndView publisherSearch() {
		ModelAndView mav = new ModelAndView("publisher/search.mg");
		LogAspect.info("publisherSearch()");
		return mav;
	}
	
	@RequestMapping(value="/publisherInsert.do",method=RequestMethod.GET)
	public ModelAndView publisherInsert() {
		ModelAndView mav = new ModelAndView("publisher/insert.mg");
		LogAspect.info("publisherInsert()");
		return mav;
	}
	
	@RequestMapping(value="/publisherUpdate.do",method=RequestMethod.GET)
	public ModelAndView publisherUpdate() {
		ModelAndView mav = new ModelAndView("publisher/update.mg");
		LogAspect.info("publisherUpdate()");
		return mav;
	}
	
	@RequestMapping(value="/statPreference.do",method=RequestMethod.GET)
	public ModelAndView statPreference() {
		ModelAndView mav = new ModelAndView("statistics/preference.mg");
		LogAspect.info("statPreference()");
		return mav;
	}
	
	@RequestMapping(value="/statSales.do",method=RequestMethod.GET)
	public ModelAndView statSales() {
		ModelAndView mav = new ModelAndView("statistics/sales.mg");
		LogAspect.info("statSales()");
		return mav;
	}
	
	@RequestMapping(value="/statTotal.do",method=RequestMethod.GET)
	public ModelAndView statTotal() {
		ModelAndView mav = new ModelAndView("statistics/total.mg");
		LogAspect.info("statTotal()");
		return mav;
	}
	
	@RequestMapping(value="/statGeneralTotal.do",method=RequestMethod.GET)
	public ModelAndView statGeneralTotal() {
		ModelAndView mav = new ModelAndView("statistics/generalTotal.mg");
		LogAspect.info("statGeneralTotal()");
		return mav;
	}
	//-------상헌이꺼--------------------------------------------------------------------

	@RequestMapping(value="/boardContact.do",method=RequestMethod.GET)
	public ModelAndView boardContact() {
		ModelAndView mav = new ModelAndView("board/contact.mg");
		LogAspect.info("boardContact()");
		return mav;
	}
	@RequestMapping(value="/boardDelete.do",method=RequestMethod.GET)
	public ModelAndView boardDelete() {
		ModelAndView mav = new ModelAndView("board/delete.mg");
		LogAspect.info("boardDelete()");
		return mav;
	}
	@RequestMapping(value="/boardInsert.do",method=RequestMethod.GET)
	public ModelAndView boardInsert() {
		ModelAndView mav = new ModelAndView("board/insert.mg");
		LogAspect.info("boardInsert()");
		return mav;
	}
	@RequestMapping(value="/boardList.do",method=RequestMethod.GET)
	public ModelAndView boardList() {
		ModelAndView mav = new ModelAndView("board/list.mg");
		LogAspect.info("boardList()");
		return mav;
	}
	@RequestMapping(value="/boardReply.do",method=RequestMethod.GET)
	public ModelAndView boardReply() {
		ModelAndView mav = new ModelAndView("board/reply.mg");
		LogAspect.info("boardReply()");
		return mav;
	}
	@RequestMapping(value="/boardUpdate.do",method=RequestMethod.GET)
	public ModelAndView boardUpdate() {
		ModelAndView mav = new ModelAndView("board/update.mg");
		LogAspect.info("boardUpdate()");
		return mav;
	}
	@RequestMapping(value="/memberMember.do",method=RequestMethod.GET)
	public ModelAndView memberMember() {
		ModelAndView mav = new ModelAndView("member/member.mg");
		LogAspect.info("memberMember()");
		return mav;
	}
	@RequestMapping(value="/memberPay.do",method=RequestMethod.GET)
	public ModelAndView memberPay() {
		ModelAndView mav = new ModelAndView("member/pay.mg");
		LogAspect.info("memberPay()");
		return mav;
	}
	@RequestMapping(value="/memberPayDetail.do",method=RequestMethod.GET)
	public ModelAndView memberPayDetail() {
		ModelAndView mav = new ModelAndView("member/payDetail.mg");
		LogAspect.info("memberPayDetail()");
		return mav;
	}
	@RequestMapping(value="/memberRegister.do",method=RequestMethod.GET)
	public ModelAndView memberRegister() {
		ModelAndView mav = new ModelAndView("member/register.mg");
		LogAspect.info("memberRegister()");
		return mav;
	}
	@RequestMapping(value="/reviewReview.do",method=RequestMethod.GET)
	public ModelAndView memberReview() {
		ModelAndView mav = new ModelAndView("review/review.mg");
		LogAspect.info("memberReview()");
		return mav;
	}
	@RequestMapping(value="/reviewReport.do",method=RequestMethod.GET)
	public ModelAndView memberReport() {
		ModelAndView mav = new ModelAndView("review/report.mg");
		LogAspect.info("memberReport()");
		return mav;
	}
	
	
}
