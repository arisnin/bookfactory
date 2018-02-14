package com.bf.myPage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

	@Override
	public int pointInsert(MyPagePointDto myPagePointDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MyPagePointDto pointInsert(String id, String menu_num,
			String point_type) {
		// TODO Auto-generated method stub
		return null;
	}

	
}