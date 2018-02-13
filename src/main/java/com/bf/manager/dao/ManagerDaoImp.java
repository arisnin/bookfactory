package com.bf.manager.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.manager.dto.PublisherDto;

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

	@Override
	public int insertBookCateSecond(String name, int cate1) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("cate1", cate1);
		int check = sqlSession.insert("com.bf.mapper.BookMapper.insertBookCateSecond", map);
		if(check == 0) {
			return -1;
		}
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getMaxNum");
	}

	@Override
	public int insertBookCateThird(String name, int cateNum) {
		//책의 소분류 카테고리
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("cateNum", cateNum);
		return sqlSession.insert("com.bf.mapper.BookMapper.insertBookCateThird", map);
	}

	@Override
	public int checkCategory() {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getMaxNum");
	}
	
	@Override
	public int publisherInsertOk(PublisherDto publisherDto) {
		return sqlSession.insert("com.bf.mapper.PublisherMapper.publisherInsert", publisherDto);
	}
}
