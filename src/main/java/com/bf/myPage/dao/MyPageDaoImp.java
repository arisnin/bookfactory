package com.bf.myPage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.member.model.MemberDto;
import com.bf.myPage.dto.MyPageCashChargeDto;
import com.bf.myPage.dto.MyPageCashPageDto;
import com.bf.myPage.dto.MyPagePointDto;
import com.bf.myPage.dto.MyPagePurchasedPageDto;
import com.bf.myPage.dto.MyPageRecentPageDto;
import com.bf.order.dto.OrderDto;

/**
 * @author	박성호
 * @date	2018. 2. 12.
 * @description	마이페이지 DAO 클래스 구현
 */
@Component
public class MyPageDaoImp implements MyPageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String nameSpace = "com.bf.mapper.MyPageMapper.";

	@Override
	public int pointInsert(MyPagePointDto myPagePointDto) {		
		return sqlSession.insert(nameSpace + "point_insert", myPagePointDto);
	}

	@Override
	public List<MyPagePointDto> myPointList(String id) {
		return sqlSession.selectList(nameSpace + "point_select_list", id);
	}
	
	@Override
	public int myPointExtinctionSelect(String id) {
		return sqlSession.selectOne(nameSpace + "point_select", id);
	}

	@Override
	public int cashChargeInsert(MyPageCashChargeDto myPageCashChargeDto) {
		return sqlSession.insert(nameSpace + "cash_charge_insert", myPageCashChargeDto);
	}

	@Override
	public List<MyPageCashPageDto> myCashPageList(String id) {
		return sqlSession.selectList(nameSpace + "cash_page_select_list", id);
	}

	@Override
	public List<MyPageRecentPageDto> MyRecentPageList(String id) {
		return sqlSession.selectList(nameSpace + "recent_page_select_list", id);
	}

	@Override
	public List<MyPagePurchasedPageDto> PurchasedPageList(String id) {
		return sqlSession.selectList(nameSpace + "all_purchased_page_select_list", id);
	}

	@Override
	public int PurchasedDelete(String id, List<String> book_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("book_num", book_num);
		
		return sqlSession.update(nameSpace + "purchased_delete", map);
	}

	@Override
	public int RecentDelete(String id) {
		return sqlSession.delete(nameSpace + "recent_delete", id);
	}

	@Override
	public OrderDto HistoryCashClick(String id, long order_num) {	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("order_num", order_num);
		
		return sqlSession.selectOne(nameSpace + "history_click_select", map);
	}

	@Override
	public List<MyPagePurchasedPageDto> PurchasedPageList(String id,
			String searchValue) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("searchValue", searchValue);
		
		return sqlSession.selectList(nameSpace + "search_purchased_page_select_list", map);
	}

	@Override
	public List<MyPagePurchasedPageDto> PurchasedPageFiveList(String id) {
		return sqlSession.selectList(nameSpace + "five_purchased_page_select_list", id);
	}

	@Override
	public List<MyPageRecentPageDto> MyRecentPageFiveList(String id) {
		return sqlSession.selectList(nameSpace + "five_recent_page_select_list", id);
	}

	@Override
	public int selectPointAvailable(String id) {
		return sqlSession.selectOne(nameSpace + "point-select-available", id);
	}

	@Override
	public int selectCashAvailable(String id) {
		return sqlSession.selectOne(nameSpace + "cash-select-available", id);
	}

	@Override
	public int selectPurchasedCount(String id) {
		return sqlSession.selectOne(nameSpace + "select-purchased-count", id);
	}

	@Override
	public String InfoOk(String id, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		
		return sqlSession.selectOne(nameSpace + "select_InfoOk", map);
	}

	@Override
	public MemberDto selectInfo(String id) {
		return sqlSession.selectOne(nameSpace + "select_info", id);
	}

	@Override
	public int infoUpdate(MemberDto memberDto) {
		return sqlSession.update(nameSpace + "update_info", memberDto);
	}

	
	
}