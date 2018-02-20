package com.bf.main.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.main.dao.MainDao;
import com.bf.main.dto.NoticeDto;
import com.bf.main.dto.RegisterDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
@Component
public class MainServiceImp implements MainService {
	@Autowired
	private MainDao mainDao;

	@Override
	public void register(ModelAndView mav) {
		RegisterDto registerDto = (RegisterDto)mav.getModelMap().get("registerDto");
		int check = mainDao.register(registerDto);
		System.out.println("logMsg========" + check);
		mav.addObject("check", check);
	}

	
	@Override
	public void noticeMain(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int boardSize = 10;		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage-1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		int count = mainDao.noticeMainCount();
		
		LogAspect.info("공지사항 메인리스트 확인 : " + count);
		
		/*
		
		List<NoticeDto> noticeList = null;
		
		if(count > 0) {
			noticeList = mainDao.noticeMain(startRow, endRow);
			LogAspect.info("공지사항 리스트 사이즈 : " + noticeMainCount.size());
		}
		
		mav.addObject("noticeList", noticeList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("notice/main");
		*/
		
		
	}
	
	
	/*
	@Override
	public void noticeRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		LogAspect.info("읽어오기 확인중");
		
	}
	*/
	
	
}
