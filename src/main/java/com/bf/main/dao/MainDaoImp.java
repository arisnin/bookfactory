package com.bf.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.myPage.dto.MyPageReviewDto;

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
	public int insertReview(MyPageReviewDto myPageReviewDto) {
		return sqlSession.insert("com.bf.mapper.MainMapper.insert-review", myPageReviewDto);
	}
}
