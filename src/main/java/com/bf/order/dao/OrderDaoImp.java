package com.bf.order.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.book.dto.HomeDto;

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

	@Override
	public List<HomeDto> getCart(String id) {
		return sqlSession.selectList("com.bf.mapper.OrderMapper.getCart",id);
	}

	@Override
	public int cartInsert(int bookNum, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookNum", bookNum);
		map.put("id", id);
		return sqlSession.insert("com.bf.mapper.OrderMapper.insertCart", map);
	}

}
