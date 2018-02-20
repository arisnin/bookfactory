package com.bf.myPage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.myPage.dto.MyPageCashChargeDto;
import com.bf.myPage.dto.MyPagePointDto;

/**
 * @author	박성호
 * @date	2018. 2. 12.
 * @description	마이페이지 DAO 클래스 구현
 */
@Component
public class MyPageDaoImp implements MyPageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String nameSpace = "com.bf.mapper.MyPageMapper.";

	@Override
	public int pointInsert(MyPagePointDto myPagePointDto) {		
		return sqlSession.insert(nameSpace + "point_insert", myPagePointDto);
	}

	@Override
	public List<MyPagePointDto> myPointList(String id) {		
		return sqlSession.selectList(nameSpace + "point_select_list", id);
	}

	@Override
	public int cashChargeInsert(MyPageCashChargeDto myPageCashChargeDto) {
		return sqlSession.insert(nameSpace + "cash_charge_insert", myPageCashChargeDto);
	}

	@Override
	public List<MyPageCashChargeDto> myCashChargeList(String id) {
		return sqlSession.selectList(nameSpace + "cash_charge_select_list", id);
	}

	
	
}