package com.bf.book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dao.BookDao;
import com.bf.book.dto.ReviewDto;
import com.bf.manager.dto.BookDto;
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
	public ModelAndView reviewWrite(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ReviewDto reviewDto = (ReviewDto)map.get("reviewDto");

		// 책 번호(book_num)는 presentation단에서 넘어옵니다.

		// TODO: 아이디(id) 설정. 아이디는 유효세션으로부터 받아와야 합니다.
		reviewDto.setId("user");

		// 스포일러(spoiler)는 존재하면 'on', 존재하지 않으면 'off'입니다.
		if (!"on".equals(reviewDto.getSpoiler())) {
			reviewDto.setSpoiler("off");
		}
		// 공개여부(display)는 디폴트로 'on'만 설정하면 됩니다. 이 값은 관리자 메뉴에서 공개(on)/비공개(off) 전환 가능합니다.
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
		int firstCate=bookDao.getFirstCate("일반");

		List<HomeDto> homeList=bookDao.getHomeBookInfoList();
		//LogAspect.info(LogAspect.logMsg + homeList.toString());
		
		mav.addObject("homeList", homeList);
		mav.addObject("firstCate",firstCate);
	}

	@Override
	public void homeNewbook(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)mav.getModel().get("request");
		String firstCate=request.getParameter("firstCate");
		String bookType=request.getParameter("bookType");
		String pn=request.getParameter("pageNumber");
		if(pn==null)	pn="1";
		
		int pageNumber=Integer.parseInt(pn);
		
		String firstCateName=bookDao.getFirstCateName(firstCate);
		List<BookDto> newList=null;
		
		//페이징
		int boardSize=20;
		int newCount=bookDao.getNewBookCount(firstCate);
		int startRow=(pageNumber-1)*boardSize+1;
		int endRow=pageNumber*boardSize;
		
		//데이터가없어서 임시로 일반카테고리로 만들음.
		firstCate="2";
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("firstCate", firstCate);
		
		//작가이름, 출판사이름 이런거 다뽑아와야함 dto 새로파야함 
		
		if(newCount>0) {
			newList=bookDao.getNewBookList(map);
			
			if(newList!=null) {
				for(int i=0;i<newList.size();i++) {
					
				}
			}
		}
		
		mav.addObject("firstCateName", firstCateName);
		mav.addObject("newList", newList);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("newCount", newCount);
		mav.addObject("boardSize", boardSize);
	}
}
