package com.bf.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.myPage.dto.MyPageReviewDto;

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
	public int insertReview(MyPageReviewDto myPageReviewDto) {
		return sqlSession.insert("com.bf.mapper.MainMapper.insert-review", myPageReviewDto);
	}

	@Override
	public int cartWishList(int num) {
		sqlSession.delete("com.bf.mapper.MainMapper.delete_cartWishtList", num);
		return sqlSession.update("com.bf.mapper.MainMapper.insert_cartWishList", num);
	}

	@Override
	public int cartDelete(int num) {
		return sqlSession.delete("com.bf.mapper.MainMapper.delete_cartWishtList", num);
	}

	@Override
	public int register(RegisterDto registerDto) {
		return sqlSession.insert("com.bf.mapper.MainMapper.register", registerDto);
	}
}
