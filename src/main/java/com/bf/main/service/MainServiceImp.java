package com.bf.main.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.main.dao.MainDao;
import com.bf.myPage.dto.MyPageReviewDto;

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
	public ModelAndView review(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MyPageReviewDto myPageReviewDto = (MyPageReviewDto)map.get("myPageReviewDto");
		
		// 책 번호(book_num)는 presentation 단에서 넘어옵니다.
		// 스포일러(spoiler)는 존재하면 true, 존재하지 않으면 false입니다.
		// 공개여부(display)는 디폴트값만 설정해주면 되고, 디폴트값은 true(공개)입니다. 이 값은 관리자 메뉴에서 공개/비공개 전환 가능합니다.
		
		// TODO: 아이디(id) 설정. 아이디는 유효세션으로부터 받아와야 합니다.
		myPageReviewDto.setId("abc123");
		
		if ("on".equals(myPageReviewDto.getSpoiler())) {
			myPageReviewDto.setSpoiler("true");
		} else {
			myPageReviewDto.setSpoiler("false");
		}
		myPageReviewDto.setDisplay("true");
		myPageReviewDto.setWrite_date(new java.util.Date());
		myPageReviewDto.setContent(myPageReviewDto.getContent().replace("\r\n", "<br />"));
		LogAspect.info(myPageReviewDto);
		
		int check = mainDao.insertReview(myPageReviewDto);
		
		return mav.addObject("checkReview",check);
	}
}
