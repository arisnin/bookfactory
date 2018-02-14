package com.bf.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.main.dto.ReviewDto;

import com.bf.main.dto.RegisterDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
@Component
public class MainDaoImp implements MainDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReview(ReviewDto reviewDto) {
		return sqlSession.insert("com.bf.mapper.MainMapper.insert-review", reviewDto);
	}

	@Override
	public int register(RegisterDto registerDto) {
		return sqlSession.insert("com.bf.mapper.MainMapper.register", registerDto);
	}
}
