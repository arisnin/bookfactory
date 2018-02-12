package com.bf.manager.dao;

import java.util.ArrayList;

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
	public int insertCategory(ArrayList<String> cateList) {
		int check = 0;
		
		for(int i=0;i<cateList.size();i++) {
			String key = cateList.get(i);
			check = sqlSession.insert("com.bf.mapper.BookMapper.insertCateSecond",key);
		}
		
		return check;
	}
	
}
