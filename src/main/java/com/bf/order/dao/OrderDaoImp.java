package com.bf.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 카트/위시리스트/구매 관련 DAO 구현 클래스
 */
@Component
public class OrderDaoImp implements OrderDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int cartWishList(int num) {
		sqlSession.delete("com.bf.mapper.MainMapper.delete_cartWishtList", num);
		return sqlSession.update("com.bf.mapper.OrderMapper.insert_cartWishList", num);
	}

	@Override
	public int cartDelete(int num) {
		return sqlSession.delete("com.bf.mapper.OrderMapper.delete_cartWishtList", num);
	}
}
