package com.bf.order.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.book.dto.HomeDto;
import com.bf.order.dto.OrderDto;
import com.bf.order.dto.PointDto;

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
	public int cartWishList(int bookNum, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookNum", bookNum);
		map.put("id", id);
		sqlSession.update("com.bf.mapper.OrderMapper.insert_cartWishList", map);
		return sqlSession.delete("com.bf.mapper.OrderMapper.delete_cartWishtList", bookNum);
	}

	@Override
	public int cartDelete(int bookNum, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookNum", bookNum);
		map.put("id", id);
		return sqlSession.delete("com.bf.mapper.OrderMapper.delete_cartWishtList", map);
	}

	@Override
	public List<HomeDto> getCart(String id) {
		return sqlSession.selectList("com.bf.mapper.OrderMapper.getCart", id);
	}

	@Override
	public List<HomeDto> getWish(String id) {
		return sqlSession.selectList("com.bf.mapper.OrderMapper.getWish", id);
	}

	@Override
	public int cartInsert(int bookNum, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookNum", bookNum);
		map.put("id", id);
		System.out.println(bookNum + id);
		return sqlSession.insert("com.bf.mapper.OrderMapper.insertCart", map);
	}

	@Override
	public int wishListInsert(int bookNum, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookNum", bookNum);
		map.put("id", id);
		return sqlSession.insert("com.bf.mapper.OrderMapper.insertWishList", map);
	}

	@Override
	public int oneCart_Wish(String id, int bookNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bookNum", bookNum);
		map.put("id", id);
		// System.out.println(bookNum+id);
		if (sqlSession.selectList("com.bf.mapper.OrderMapper.oneCart_Wish", map).size() > 0) {
			return 0;
		} else {
			return 1;
		}
	}

	@Override
	public int paymentInsert(OrderDto orderDto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		PointDto pointDto = null;
		int rnum = 1;
		int remain = orderDto.getPoint_use();
		do {
			map.put("id", orderDto.getId());
			map.put("rnum", rnum);
			pointDto = sqlSession.selectOne("com.bf.mapper.OrderMapper.pointSelect", map);
			System.out.println(pointDto.toString());
			map.put("remain", Math.abs(remain));
			System.out.println(map.get("remain"));
			int check = sqlSession.update("com.bf.mapper.OrderMapper.updatePoint", map);
			System.out.println(check);
			pointDto = sqlSession.selectOne("com.bf.mapper.OrderMapper.pointSelect", map);
			System.out.println(pointDto.toString());
			remain = pointDto.getRemain();
			System.out.println(remain);
			if (remain > 0)
				break;
			else
				sqlSession.update("com.bf.mapper.OrderMapper.updateZero", pointDto.getNum());
			rnum++;
		} while (remain < 0);
		return sqlSession.insert("com.bf.mapper.OrderMapper.paymentInsert", orderDto);

	}

<<<<<<< HEAD
	@Override
	public HomeDto getBookSelect(int book_num) {
		return sqlSession.selectOne("com.bf.mapper.OrderMapper.getBookSelect",book_num);
	}

=======
>>>>>>> 80c0d57457a14a49ac7856c0fd68229ca9cd97d1
}
