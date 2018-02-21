package com.bf.myPage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.member.model.MemberDto;
import com.bf.member.model.User;
import com.bf.myPage.dao.MyPageDao;
import com.bf.myPage.dto.MyPageCashChargeDto;
import com.bf.myPage.dto.MyPageCashPageDto;
import com.bf.myPage.dto.MyPagePointDto;

/**
 * @author	박성호
 * @date	2018. 2. 12.
 * @description	마이페이지 Service 클래스 구현
 * 리디캐시 들어가면 request에  input=radio 2개 value 값 받아온다.
 * 받아온 radio1의 통해서 point 값 얻어오고 point 값으로 MyPagePoint 테이블에 값들을 때려박자
 * id는 임시id인 "abc123"으로 num은 순차적으로 오르고 포인트 타입은 "마이캐시 충전 보너스 마이포인트"로 고정
 * 상태는 소멸 or 소멸예정 or - 중 택 1
 */

@Component
public class MyPageServiceImp implements MyPageService {
	@Autowired
	private MyPageDao myPageDao;

	@Override
	public void myCashOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void myInfoUpdate(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void myPoint(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void myCashHistoryCash(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void myCash(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

	


}
