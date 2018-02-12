package com.bf.myPage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author	박성호
 * @date	2018. 2. 12.
 * @description	마이페이지 DAO 클래스 구현
 */
@Component
public class MyPageDaoImp implements MyPageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
