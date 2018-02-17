package com.bf.book.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dao.BookDao;
import com.bf.book.dto.ReviewDto;
import com.bf.book.dto.HomeDto;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 대분류별 보기 / 책 상세보기 관련 서비스 구현 클래스
 */
@Component
public class BookServiceImp implements BookService {
	@Autowired
	private BookDao bookDao;

	@Override
	public ModelAndView review(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ReviewDto reviewDto = (ReviewDto)map.get("reviewDto");

		// 책 번호(book_num)는 presentation 단에서 넘어옵니다.
		// 스포일러(spoiler)는 존재하면 true, 존재하지 않으면 false입니다.
		// 공개여부(display)는 디폴트값만 설정해주면 되고, 디폴트값은 true(공개)입니다. 이 값은 관리자 메뉴에서 공개/비공개 전환
		// 가능합니다.

		// TODO: 아이디(id) 설정. 아이디는 유효세션으로부터 받아와야 합니다.
		reviewDto.setId("abc123");

		if ("on".equals(reviewDto.getSpoiler())) {
			reviewDto.setSpoiler("true");
		} else {
			reviewDto.setSpoiler("false");
		}
		reviewDto.setDisplay("true");
		reviewDto.setWrite_date(new java.util.Date());
		reviewDto.setContent(reviewDto.getContent().replace("\r\n", "<br />"));
		LogAspect.info(reviewDto);

		int check = bookDao.insertReview(reviewDto);

		return mav.addObject("checkReview", check);
	}

	@Override
	public void normalHome(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)mav.getModel().get("request");
		String catenum=request.getParameter("catenum");
		if(catenum==null) {
			catenum="1";
		}
		
		List<HomeDto> homeList=bookDao.getHomeBookInfoList();
		LogAspect.info(LogAspect.logMsg + homeList.toString());
		
		mav.addObject("homeList", homeList);
		mav.addObject("catenum",catenum);
	}
}
