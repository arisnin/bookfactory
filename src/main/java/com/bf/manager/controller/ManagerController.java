package com.bf.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.BookDto;
import com.bf.manager.dto.PublisherDto;
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
	
	@RequestMapping(value="/authorInsert.do",method=RequestMethod.GET)
	public ModelAndView authorInsert(HttpServletRequest request, HttpServletResponse response) {
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
	public ModelAndView authorSearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("author/search.mg");
		mav.addObject("request", request);
		managerService.authorSearch(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/authorRead.do", method = RequestMethod.GET)
	public ModelAndView authorRead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("author/read.mg");
		mav.addObject("request", request);
		managerService.authorRead(mav);
		return mav;
	}
	
	@RequestMapping(value = "/authorUpdate.do", method = RequestMethod.GET)
	public ModelAndView authorUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("author/update.mg");
		mav.addObject("request", request);
		managerService.authorUpdate(mav);
		return mav;
	}
	
	@RequestMapping(value = "/authorUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView authorUpdateOk(HttpServletRequest request, HttpServletResponse response,
			AuthorDto authorDto) {
		ModelAndView mav = new ModelAndView("author/updateOk.mg");
		mav.addObject("request", request);
		mav.addObject("authorDto", authorDto);
		managerService.authorUpdateOk(mav);
		return mav;
	}

	@RequestMapping(value = "/authorUpdateBoard.do", method = RequestMethod.GET)
	public ModelAndView authorUpdateBoard() {
		ModelAndView mav = new ModelAndView("author/updateBoard.mg");
		LogAspect.info("authorUpdateBoard()");
		return mav;
	}

	@RequestMapping(value = "/authorUpdateRead.do", method = RequestMethod.GET)
	public ModelAndView authorUpdateRead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("author/updateRead.mg");
		mav.addObject("request", request);
		managerService.authorUpdateRead(mav);
		return mav;
	}
	
	@RequestMapping(value = "/authorUpdateReadOk.do", method = RequestMethod.POST)
	public ModelAndView authorUpdateReadOk(HttpServletRequest request, HttpServletResponse response,
			AuthorDto authorDto) {
		ModelAndView mav = new ModelAndView("author/updateReadOk.mg");
		mav.addObject("authorDto", authorDto);
		managerService.authorUpdateReadOk(mav);
		return mav;
	}
	
	@RequestMapping(value = "/authorNameCheck.do", method = RequestMethod.GET)
	public ModelAndView authorNameCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		managerService.authorNameCheck(mav);
		return null;
	}
	
	@RequestMapping(value="/bookInsert.do",method=RequestMethod.GET)
	public ModelAndView bookInsert(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("book/insert.mg");
		managerService.bookInsert(mav);
		return mav;
	}
		
	@RequestMapping(value="/bookInsertOk.do",method=RequestMethod.POST)
	public ModelAndView bookInsertOk(HttpServletRequest request, HttpServletResponse response
			,BookDto bookDto) {
		ModelAndView mav = new ModelAndView("book/insertOk.mg");
		mav.addObject("request", request);
		mav.addObject("bookDto", bookDto);
		managerService.bookInsertOk(mav);
		return mav;
	}

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
	public ModelAndView bookCategory() {
		ModelAndView mav = new ModelAndView("book/category.mg");
		managerService.bookCategory(mav);
		return mav;
	}
	
	
	@RequestMapping(value="/bookCategoryOk.do",method=RequestMethod.GET)
	public ModelAndView bookCategoryOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("book/categoryCrawlOk.mg");
		managerService.bookCategoryOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/bookOpenPub.do",method=RequestMethod.GET)
	public ModelAndView bookOpenPub(HttpServletRequest request, HttpServletResponse response) {
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
	
	@RequestMapping(value = "/bookReadTwo.do", method = RequestMethod.GET)
	public ModelAndView bookReadTwo() {
		ModelAndView mav = new ModelAndView("book/readtwo.mg");
		LogAspect.info("bookReadTwo()");
		return mav;
	}

	@RequestMapping(value = "/bookSearch.do", method = RequestMethod.GET)
	public ModelAndView bookSearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("book/search.mg");
		mav.addObject("request", request);
		managerService.bookSearch(mav);
		return mav;
	}
	@RequestMapping(value = "/bookUpdate.do", method = RequestMethod.GET)
	public ModelAndView bookUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("book/update.mg");
		mav.addObject("request", request);
		managerService.bookUpdate(mav);
		return mav;
	}
	
	@RequestMapping(value = "/bookUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView bookUpdateOk(HttpServletRequest request, HttpServletResponse response
			,BookDto bookDto) {
		ModelAndView mav = new ModelAndView("book/updateOk.mg");
		mav.addObject("request", request);
		mav.addObject("bookDto", bookDto);
		managerService.bookUpdateOk(mav);
		return mav;
	}
	
	@RequestMapping(value = "/publisherSearch.do", method = RequestMethod.GET)
	public ModelAndView publisherSearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("publisher/search.mg");
		mav.addObject("request", request);
		managerService.publisherSearch(mav);
		return mav;
	}

	@RequestMapping(value = "/publisherInsert.do", method = RequestMethod.GET)
	public ModelAndView publisherInsert() {
		ModelAndView mav = new ModelAndView("publisher/insert.mg");
		LogAspect.info("publisherInsert()");
		return mav;
	}
	
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
	public ModelAndView publisherUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("publisher/update.mg");
		mav.addObject("request", request);
		managerService.publisherUpdate(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/publisherUpdateOk.do",method=RequestMethod.POST)
	public ModelAndView publisherUpdateOk(HttpServletRequest request, HttpServletResponse response
			,PublisherDto publisherDto) {
		ModelAndView mav = new ModelAndView("publisher/updateOk.mg");
		mav.addObject("publisherDto", publisherDto);
		managerService.publisherUpdateOk(mav);
		
		return mav;
	}

	@RequestMapping(value = "/statPreference.do", method = RequestMethod.GET)
	public ModelAndView statPreference(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("statistics/preference.mg");
		mav.addObject("request", request);
		managerService.statPreference(mav);
		
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
	
	@RequestMapping(value = "/auto.do", method = RequestMethod.GET)
	public ModelAndView auto() {
		ModelAndView mav = new ModelAndView("crawl/auto.mg");
		return mav;
	}
	
	@RequestMapping(value = "/autoInsertBook.do", method = RequestMethod.GET)
	public ModelAndView autoInsertBook(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		managerService.autoInsertBook(mav);
		return null;
	}
	
	@RequestMapping(value = "/autoUrl.do", method = RequestMethod.GET)
	public ModelAndView autoUrl(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		managerService.autoUrl(mav);
		return null;
	}
	
	@RequestMapping(value = "/bookInNameCheck.do", method = RequestMethod.GET)
	public ModelAndView bookInNameCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		managerService.bookInNameCheck(mav);
		return null;
	}
	
	@RequestMapping(value = "/bookInAuthorCheck.do", method = RequestMethod.GET)
	public ModelAndView bookInAuthorCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		managerService.bookInAuthorCheck(mav);
		return null;
	}
	
	@RequestMapping(value = "/bookUploadImg.do", method = RequestMethod.POST)
	public ModelAndView bookUploadImg(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		managerService.bookUploadImg(mav);
		return null;
	}
	
	@RequestMapping(value = "/insertCateOne.do", method = RequestMethod.GET)
	public ModelAndView insertCateOne(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("book/categoryOk.mg");
		mav.addObject("request", request);
		managerService.insertCateOne(mav);
		return mav;
	}
	
	@RequestMapping(value = "/insertCateTwo.do", method = RequestMethod.GET)
	public ModelAndView insertCateTwo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("book/categoryOk.mg");
		mav.addObject("request", request);
		managerService.insertCateTwo(mav);
		return mav;
	}
	
	@RequestMapping(value = "/insertCateThree.do", method = RequestMethod.GET)
	public ModelAndView insertCateThree(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("book/categoryOk.mg");
		mav.addObject("request", request);
		managerService.insertCateThree(mav);
		return mav;
	}
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("crawl/auto.mg");
		mav.addObject("request", request);
		managerService.test(mav);
		return mav;
	}
	
	@RequestMapping(value = "/randomPreference.do", method = RequestMethod.GET)
	public ModelAndView randomPreference(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("crawl/auto.mg");
		managerService.randomPreference(mav);
		return null;
	}
	
	@RequestMapping(value = "/ilbanPrefer.do", method = RequestMethod.GET)
	public ModelAndView ilbanPrefer(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("statistics/commonPrefer.mg");
		managerService.ilbanPrefer(mav);
		return mav;
	}
	
	@RequestMapping(value = "/romancePrefer.do", method = RequestMethod.GET)
	public ModelAndView romancePrefer(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("statistics/commonPrefer.mg");
		managerService.romancePrefer(mav);
		return mav;
	}
	
	@RequestMapping(value = "/fantasyPrefer.do", method = RequestMethod.GET)
	public ModelAndView fantasyPrefer(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("statistics/commonPrefer.mg");
		managerService.fantasyPrefer(mav);
		return mav;
	}
	
	@RequestMapping(value = "/manhwaPrefer.do", method = RequestMethod.GET)
	public ModelAndView manhwaPrefer(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("statistics/commonPrefer.mg");
		managerService.manhwaPrefer(mav);
		return mav;
	}
	
	@RequestMapping(value = "/blPrefer.do", method = RequestMethod.GET)
	public ModelAndView blPrefer(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("statistics/commonPrefer.mg");
		managerService.blPrefer(mav);
		return mav;
	}
	
}
