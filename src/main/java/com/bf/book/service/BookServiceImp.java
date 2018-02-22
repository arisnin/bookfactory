package com.bf.book.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.weaver.tools.cache.AsynchronousFileCacheBacking.RemoveCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dao.BookDao;
import com.bf.book.dto.ReviewDto;
import com.bf.manager.dto.BookDto;
import com.bf.manager.dto.BookThirdCateDto;
import com.bf.member.model.User;
import com.bf.book.dto.HomeDto;
import com.bf.book.dto.NewBookDto;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 대분류별 보기 / 책 상세보기 관련 서비스 구현 클래스
 *
 * @author choi jung eun
 * @date 2018. 2. 20.
 * @description 각각의 홈화면, 신간 등 리스트뿌려주기, 상세보기 화면 담당
 */

@Component
public class BookServiceImp implements BookService {
	@Autowired
	private BookDao bookDao;
	
	//리뷰는 위에 해주세요 홈은 아래에다가 하겠습니다
	@Override
	public ModelAndView reviewWrite(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ReviewDto reviewDto = (ReviewDto)map.get("reviewDto");

		// 책 번호(book_num)는 presentation단에서 넘어옵니다.

		// TODO: 아이디(id) 설정. 아이디는 유효세션으로부터 받아와야 합니다.
		User user = (User) request.getSession().getAttribute("userInfo");
		reviewDto.setId(user.getUsername());

		// 스포일러(spoiler)는 존재하면 'on', 존재하지 않으면 'off'입니다.
		if (!"on".equals(reviewDto.getSpoiler())) {
			reviewDto.setSpoiler("off");
		}
		// 공개여부(display)는 디폴트로 'on'만 설정하면 됩니다. 이 값은 관리자 메뉴에서 공개(on)/비공개(off) 전환 가능합니다.
		reviewDto.setDisplay("on");
		reviewDto.setWrite_date(new java.util.Date());
		reviewDto.setContent(reviewDto.getContent().replace("\r\n", "<br />"));
		
		LogAspect.info(reviewDto);

		int check = bookDao.insertReview(reviewDto);

		return mav.addObject("checkReview", check).addObject("book_num",reviewDto.getBook_num());
	}

	@Override
	public ModelAndView reviewList(ModelAndView mav) {
		HttpServletRequest request=(HttpServletRequest)mav.getModel().get("request");
		String reviewRequestUrl = request.getContextPath() + "/review/write.do";
		
		if (request.getParameter("book_num") == null) {
			LogAspect.warning("요청 객체에 책 번호가 없습니다.");
		} else {
			int book_num = Integer.parseInt(request.getParameter("book_num"));
			LogAspect.info("book_num:" + book_num);

			User user = (User) request.getSession().getAttribute("userInfo");
			LogAspect.info("userInfo:" + user);
			
			// TODO: reviewSelf 생성
			if (user != null) {
				ReviewDto reviewSelf = bookDao.selectReviewSelf(book_num, user.getUsername());
				if (reviewSelf != null) reviewRequestUrl = request.getContextPath() + "/review/update.do";
				mav.addObject("reviewSelf",reviewSelf);
				mav.addObject("reviewSelfContent",reviewSelf.getContent().replace("<br />", "\r\n"));
				LogAspect.info("reviewSelf:" + reviewSelf);
			}
			
			// TODO: reviewList 생성
			List<ReviewDto> reviewList = bookDao.selectReviewList(book_num);
			mav.addObject("reviewList",reviewList).addObject("book_num",book_num);
			LogAspect.info("reviewList:" + reviewList.size());
		}
		
		return mav.addObject("reviewRequestUrl", reviewRequestUrl);
	}

	@Override
	public ModelAndView reviewUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ReviewDto reviewDto = (ReviewDto)map.get("reviewDto");

		// 책 번호(book_num)는 presentation단에서 넘어옵니다.
		
		// ID(username)
		User user = (User)request.getSession().getAttribute("userInfo");
		if (user == null) return mav.addObject("checkReview",-1).addObject("error","로그인 상태가 아닙니다.");
		
		reviewDto.setId(user.getUsername());

		// Spoiler
		if (!"on".equals(reviewDto.getSpoiler())) {
			reviewDto.setSpoiler("off");
		}
		
		// Content
		reviewDto.setContent(reviewDto.getContent().replace("\r\n", "<br />"));
		
		LogAspect.info(reviewDto);

		int checkReview = bookDao.updateReview(reviewDto);
		
		if (checkReview == 0) {
			mav.addObject("error","시스템 오류입니다.");
		}

		return mav.addObject("checkReview", checkReview).addObject("book_num",reviewDto.getBook_num());
	}
	
	//여기서부터 홈입니다.
	@Override
	public void normalHome(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)mav.getModel().get("request");
		String firstCateNum=request.getParameter("firstCateNum");
		
		if(firstCateNum==null)	firstCateNum="1";
		
		int firstCate=Integer.parseInt(firstCateNum);
		
		//오늘의 추천은 랜덤으로 뽑아옴
		int preBookNum=0;
		List<Integer> randomBookNum=bookDao.getRandomBookNum(firstCate);
		List<HomeDto> recomList=new ArrayList<HomeDto>();
		
		for(int i=0;i<randomBookNum.size();i++) {
			int random=randomBookNum.get(i);
			
			if(preBookNum!=random) {
				HomeDto dto=bookDao.getRecomList(random);
				recomList.add(dto);
			}
			
			preBookNum=randomBookNum.get(i);
		}
		
		//사람들이 지금 많이 읽는 책 => 나중에 어떤식으로들어갈지 모름
		
		//베스트셀러 - > 구매기능완성되면 잘팔린순으로 뽑아와야함
		
		List<HomeDto> homeList=bookDao.getHomeBookInfoList(firstCate);
		//LogAspect.info(LogAspect.logMsg + homeList.toString());
		
		mav.addObject("recomList", recomList);
		mav.addObject("homeList", homeList);
		mav.addObject("firstCate",firstCate);

		if(firstCate==1) {
			mav.setViewName("genre/normal.main");
		}else if(firstCate==4) {
			mav.setViewName("genre/comic.main");
		}
	}
	
	@Override
	public void homeNewbook(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)mav.getModel().get("request");
		String firstCate=request.getParameter("firstCate");
		String bookType=request.getParameter("bookType");
		String seconCate=request.getParameter("seconCate");
		
		String pn=request.getParameter("pageNumber");
		if(pn==null)	pn="1";
		
		int pageNumber=Integer.parseInt(pn);
		
		String firstCateName=bookDao.getFirstCateName(firstCate);
		List<NewBookDto> newList=null;
		
		int boardSize=20;
		int startRow=(pageNumber-1)*boardSize+1;
		int endRow=pageNumber*boardSize;
		int newCount=0;
		
		HashMap<String, String> cateMap=new HashMap<String, String>();
		cateMap.put("firstCate", firstCate);
		cateMap.put("seconCate", seconCate);
		cateMap.put("startRow", String.valueOf(startRow));
		cateMap.put("endRow", String.valueOf(endRow));

		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("firstCate", Integer.parseInt(firstCate));
		
		//일반, 나머지카테(단행, 연재 구분)
		//나중에 리뷰로 또 갈림 리뷰없으면 원래쿼리문 있으면 다른 질의문
		if(bookType==null) {
			newCount=bookDao.getNewBookCount(firstCate);
			
			if(newCount>0) {
				newList=bookDao.getNewBookList(map);
				
			}	
		}else if(bookType.equalsIgnoreCase("paper") || bookType.equalsIgnoreCase("serial")) {
			newCount=bookDao.getPaperNewBookCount(cateMap);
			
			if(newCount>0) {
				newList=bookDao.getPaperNewBookList(cateMap);
			}
		}
		
		mav.addObject("firstCate", firstCate);
		mav.addObject("firstCateName", firstCateName);
		mav.addObject("newList", newList);
		mav.addObject("bookType", bookType);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("newCount", newCount);
		mav.addObject("boardSize", boardSize);
	}

	@Override
	public void romanceHome(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)mav.getModel().get("request");
		String firstCateNum=request.getParameter("firstCateNum");
		
		int firstCate=Integer.parseInt(firstCateNum);
		
		//화면이 일반단행본인지, 연재인지로 구분되서 시작되어야함
		String type=request.getParameter("bookType");
		String secon=request.getParameter("seconCate");

		int seconCate=0;
		
		if(secon!=null) {
			seconCate=Integer.parseInt(secon);
		}
		if(type==null || type=="paper" || secon==null) {
			seconCate=bookDao.getBookSecondCate(firstCate);
		}else if(type=="serial") {
			//연재는 아직 데이터가없음
		}
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("firstCate", firstCate);
		map.put("seconCate", seconCate);
		
		//오늘의 추천은 랜덤으로 뽑아옴
		int preBookNum=0;
		List<Integer> randomBookNum=bookDao.getPaperRandomBookNum(map);
		List<HomeDto> recomList=new ArrayList<HomeDto>();
		
		for(int i=0;i<randomBookNum.size();i++) {
			int random=randomBookNum.get(i);
			
			if(preBookNum!=random) {
				HomeDto dto=bookDao.getRecomList(random);
				recomList.add(dto);
			}
			
			preBookNum=randomBookNum.get(i);
		}
		
		//키워드는 아직 어찌할지 모름
		
		//사람들이 지금 많이 읽는 책 => 나중에 어떤식으로들어갈지 모름
		
		//베스트셀러 - > 구매기능완성되면 잘팔린순으로 뽑아와야함
		
		List<HomeDto> homeList=bookDao.getPaperHomeBookInfoList(map);
//		LogAspect.info(LogAspect.logMsg + homeList.toString());
		
		System.out.println("firstCateNum" + firstCateNum);
		
		mav.addObject("recomList", recomList);
		mav.addObject("homeList", homeList);
		mav.addObject("firstCate",firstCate);
		mav.addObject("seconCate", seconCate);
		
		if(firstCate==2) {
			mav.setViewName("genre/romance.main");
		}else if(firstCate==3) {
			mav.setViewName("genre/fantasy.main");
		}else if(firstCate==5) {
			mav.setViewName("genre/bl.main");
		}
	}

}
