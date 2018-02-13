package com.bf.manager.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @이름: 염현우
 * @날짜: 2018. 2. 12.
 * @설명: 
 */
@Component
public class ManagerDaoImp implements ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertCategory(String name) {
		return sqlSession.insert("com.bf.mapper.BookMapper.insertCateSecond",name);
	}
	
}
