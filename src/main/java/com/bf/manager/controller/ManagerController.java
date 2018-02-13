package com.bf.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
<<<<<<< HEAD
import com.bf.manager.dto.BoardFrequencyDto;
=======
import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.PublisherDto;
>>>>>>> 9c5eeb3d6c68dbaa4a05ac58c4abe11358136592
import com.bf.manager.service.ManagerService;

/**
 * @author YEOM HYUN WOO X JUN SANG HUN
 * @date 2018-02-07
 * @description start-url = /bookFactory/manager/index.do 요청맵핑은(RequestMapping의
 *              value를 뜻함) .do로 걸어준다 layout 설정법 (ModelAndView의 페이지셋팅값을 뜻함) -
 *              content만 나오는 뷰는 .mge - header, menu, content, footer 다 나오는 뷰는
 *              .mg로 맞춰준다
 */
@Controller
@RequestMapping(value = "/manager")
public class ManagerController {

	@Autowired
	private ManagerService managerService;

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public ModelAndView manager() {
		ModelAndView mav = new ModelAndView("manager.mge");
		LogAspect.info("manager()");
		return mav;
	}
<<<<<<< HEAD

	@RequestMapping(value = "/authorInsert.do", method = RequestMethod.GET)
	public ModelAndView authorInsert() {
=======
	
	@RequestMapping(value="/authorInsert.do",method=RequestMethod.GET)
	public ModelAndView authorInsert(HttpServletRequest request, HttpServletResponse response) {
>>>>>>> 9c5eeb3d6c68dbaa4a05ac58c4abe11358136592
		ModelAndView mav = new ModelAndView("author/insert.mg");
		managerService.authorInsert(mav);
		return mav;
	}
	
	@RequestMapping(value="/authorInsertOk.do",method=RequestMethod.POST)
	public ModelAndView authorInsertOk(HttpServletRequest request, HttpServletResponse response
			,AuthorDto authorDto) {
		ModelAndView mav = new ModelAndView("author/insertOk.mg");
		mav.addObject("authorDto", authorDto);
		managerService.authorInsertOk(mav);
		return mav;
	}

	@RequestMapping(value = "/authorSearch.do", method = RequestMethod.GET)
	public ModelAndView authorsearch() {
		ModelAndView mav = new ModelAndView("author/search.mg");
		LogAspect.info("authorsearch()");
		return mav;
	}

	@RequestMapping(value = "/authorUpdate.do", method = RequestMethod.GET)
	public ModelAndView authorUpdate() {
		ModelAndView mav = new ModelAndView("author/update.mg");
		LogAspect.info("authorUpdate()");
		return mav;
	}

	@RequestMapping(value = "/authorUpdateRead.do", method = RequestMethod.GET)
	public ModelAndView authorUpdateRead() {
		ModelAndView mav = new ModelAndView("author/updateRead.mg");
		LogAspect.info("authorUpdateRead()");
		return mav;
	}
<<<<<<< HEAD

	@RequestMapping(value = "/bookInsert.do", method = RequestMethod.GET)
	public ModelAndView bookInsert() {
=======
	
	@RequestMapping(value="/bookInsert.do",method=RequestMethod.GET)
	public ModelAndView bookInsert(HttpServletRequest request, HttpServletResponse response) {
>>>>>>> 9c5eeb3d6c68dbaa4a05ac58c4abe11358136592
		ModelAndView mav = new ModelAndView("book/insert.mg");
		managerService.bookInsert(mav);
		return mav;
	}
<<<<<<< HEAD

	@RequestMapping(value = "/bookCategory.do", method = RequestMethod.GET)
=======
	@RequestMapping(value="/bookCateOne.do",method=RequestMethod.GET)
	public ModelAndView bookCateOne(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		managerService.bookCateOne(mav);
		return null;
	}
	
	@RequestMapping(value="/bookCateTwo.do",method=RequestMethod.GET)
	public ModelAndView bookCateTwo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		managerService.bookCateTwo(mav);
		return null;
	}
	
	@RequestMapping(value="/bookCategory.do",method=RequestMethod.GET)
>>>>>>> 9c5eeb3d6c68dbaa4a05ac58c4abe11358136592
	public ModelAndView bookCategory() {
		ModelAndView mav = new ModelAndView("book/category.mg");
		return mav;
	}
	
	@RequestMapping(value="/bookCategoryOk.do",method=RequestMethod.GET)
	public ModelAndView bookCategoryOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("book/categoryCrawlOk.mg");
		managerService.bookCategoryOk(mav);
		return mav;
	}
<<<<<<< HEAD

	@RequestMapping(value = "/bookOpenPub.do", method = RequestMethod.GET)
	public ModelAndView bookOpenPub() {
=======
	
	@RequestMapping(value="/bookOpenPub.do",method=RequestMethod.GET)
	public ModelAndView bookOpenPub(HttpServletRequest request, HttpServletResponse response) {
>>>>>>> 9c5eeb3d6c68dbaa4a05ac58c4abe11358136592
		ModelAndView mav = new ModelAndView("book/openPub.mge");
		mav.addObject("request", request);
		managerService.bookOpenPub(mav);
		return mav;
	}

	@RequestMapping(value = "/bookRead.do", method = RequestMethod.GET)
	public ModelAndView bookRead() {
		ModelAndView mav = new ModelAndView("book/read.mg");
		LogAspect.info("bookRead()");
		return mav;
	}

	@RequestMapping(value = "/bookSearch.do", method = RequestMethod.GET)
	public ModelAndView bookSearch() {
		ModelAndView mav = new ModelAndView("book/search.mg");
		LogAspect.info("bookSearch()");
		return mav;
	}

	@RequestMapping(value = "/publisherSearch.do", method = RequestMethod.GET)
	public ModelAndView publisherSearch() {
		ModelAndView mav = new ModelAndView("publisher/search.mg");
		LogAspect.info("publisherSearch()");
		return mav;
	}

	@RequestMapping(value = "/publisherInsert.do", method = RequestMethod.GET)
	public ModelAndView publisherInsert() {
		ModelAndView mav = new ModelAndView("publisher/insert.mg");
		LogAspect.info("publisherInsert()");
		return mav;
	}
<<<<<<< HEAD

	@RequestMapping(value = "/publisherUpdate.do", method = RequestMethod.GET)
=======
	
	@RequestMapping(value="/publisherInsertOk.do",method=RequestMethod.POST)
	public ModelAndView publisherInsertOk(HttpServletRequest request, HttpServletResponse response, PublisherDto publisherDto) {
		ModelAndView mav = new ModelAndView("publisher/insertOk.mg");
		mav.addObject("publisherDto", publisherDto);
		managerService.publisherInsertOk(mav);
		
		return mav;
	}
	@RequestMapping(value="/publisherNameCheck.do",method=RequestMethod.GET)
	public ModelAndView publisherNameCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("publisher/insert.mg");
		mav.addObject("request", request);
		mav.addObject("response", response);
		managerService.publisherNameCheck(mav);
		
		return null;
	}
	
	
	@RequestMapping(value="/publisherUpdate.do",method=RequestMethod.GET)
>>>>>>> 9c5eeb3d6c68dbaa4a05ac58c4abe11358136592
	public ModelAndView publisherUpdate() {
		ModelAndView mav = new ModelAndView("publisher/update.mg");
		LogAspect.info("publisherUpdate()");
		return mav;
	}

	@RequestMapping(value = "/statPreference.do", method = RequestMethod.GET)
	public ModelAndView statPreference() {
		ModelAndView mav = new ModelAndView("statistics/preference.mg");
		LogAspect.info("statPreference()");
		return mav;
	}

	@RequestMapping(value = "/statSales.do", method = RequestMethod.GET)
	public ModelAndView statSales() {
		ModelAndView mav = new ModelAndView("statistics/sales.mg");
		LogAspect.info("statSales()");
		return mav;
	}

	@RequestMapping(value = "/statTotal.do", method = RequestMethod.GET)
	public ModelAndView statTotal() {
		ModelAndView mav = new ModelAndView("statistics/total.mg");
		LogAspect.info("statTotal()");
		return mav;
	}

	@RequestMapping(value = "/statGeneralTotal.do", method = RequestMethod.GET)
	public ModelAndView statGeneralTotal() {
		ModelAndView mav = new ModelAndView("statistics/generalTotal.mg");
		LogAspect.info("statGeneralTotal()");
		return mav;
	}
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
