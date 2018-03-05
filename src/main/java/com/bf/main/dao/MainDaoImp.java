package com.bf.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.main.dto.CategoryPageDto;
import com.bf.main.dto.EventDto;
import com.bf.main.dto.NoticeDto;
import com.bf.main.dto.SearchAuthorDto;
import com.bf.main.dto.SearchBookCountDto;
import com.bf.member.model.MemberDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */

/**
 * @author choi jung eun
 * @date 2018. 3. 4.
 * @description 이벤트 관련기능 추가 
 * 
 */
@Component
public class MainDaoImp implements MainDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace = "com.bf.mapper.MainMapper.";

	@Override
	public List<SearchAuthorDto> selectSearchAuthor(String keyword) {
		return sqlSession.selectList(namespace + "select-search-author", keyword);
	}

	@Override
	public List<CategoryPageDto> selectSearchBook(String keyword, int thirdCateNum, int orderTypeNum, int startRow, int endRow) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("thirdCateNum", thirdCateNum);
		map.put("orderTypeNum", orderTypeNum);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList(namespace + "select-search-book", map);
	}

	@Override
	public int selectSearchBookCount(String keyword) {
		return sqlSession.selectOne(namespace + "select-search-count", keyword);
	}

	@Override
	public List<SearchBookCountDto> selectSearchBookByCategoryCount(String keyword) {
		return sqlSession.selectList(namespace + "select-search-by-category-count", keyword);
	}

	@Override
	public List<Map<String,Object>> suggestKeyword(String keyword) {
		return sqlSession.selectList(namespace + "select-suggest-keyword", keyword);
	}

	@Override
	public List<Map<String, Object>> suggestKeyword(String keyword, String string) {
		return sqlSession.selectList(namespace + "select-suggest-book-keyword", keyword);
	}

	@Override
	public int register(MemberDto memberDto) {
		return sqlSession.insert(namespace + "register", memberDto);
	}

	@Override
	public List<CategoryPageDto> selectCategoryAll(int secondCateNum, int thirdCateNum, int serviceNum, int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("secondCateNum", secondCateNum);
		map.put("thirdCateNum", thirdCateNum);
		map.put("serviceNum", serviceNum);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList(namespace + "select-category-all", map);
	}

	@Override
	public int selectCategoryAllCount(int secondCateNum, int thirdCateNum, int serviceNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("secondCateNum", secondCateNum);
		map.put("thirdCateNum", thirdCateNum);
		map.put("serviceNum", serviceNum);
		return sqlSession.selectOne(namespace + "select-category-all-count", map);
	}

	@Override
	public int registerValidation(String type, String keyword) {
		return sqlSession.selectOne(namespace + type + "-check", keyword);
	}

	@Override
	public int selectCashAvailable(String id) {
		return sqlSession.selectOne("com.bf.mapper.MyPageMapper." + "cash-select-available", id);		
	}

	@Override
	public int selectPointAvailable(String id) {
		return sqlSession.selectOne("com.bf.mapper.MyPageMapper." + "point-select-available", id);		
	}

	@Override
	public int selectPurchasedCount(String id) {
		return sqlSession.selectOne("com.bf.mapper.MyPageMapper." + "select-purchased-count", id);		
	}

	@Override
	public List<Map<String, Integer>> selectCartWishCount(String id) {
		return sqlSession.selectList(namespace + "select-cart-wish-count", id);
	}

	@Override
	public int noticeMainCount() {
		return sqlSession.selectOne(namespace + "noticeMainCount");
	}
		
	@Override
	public List<NoticeDto> noticeMain(int startRow, int endRow) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList(namespace + "noticeMain", hMap);
	}

	@Override
	public NoticeDto noticeRead(int num) {
		return sqlSession.selectOne(namespace + "noticeRead", num);
	}

	@Override
	public String getFirstCateName(String firstCate) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.mapper.BookPlusMapper.getFirstCateName", firstCate);
	}

	@Override
	public int getEventCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getEventCount", map);
	}

	@Override
	public List<EventDto> getEventList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getEventList", map);
	}

	@Override
	public EventDto getEventInfo(String num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getEventInfo", num);
	}

	@Override
	public int getRandomBookNum(int f_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.mapper.MainMapper.getRandomBookNum", f_num);
	}

	@Override
	public List<NoticeDto> noticeMini() {
		return sqlSession.selectList(namespace + "noticeMini");
	}
	
}
