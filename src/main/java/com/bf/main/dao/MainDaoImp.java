package com.bf.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
	public int cartWishList(int num) {
		sqlSession.delete("com.bf.mapper.MainMapper.delete_cartWishtList", num);
		return sqlSession.update("com.bf.mapper.MainMapper.insert_cartWishList", num);
	}
}
