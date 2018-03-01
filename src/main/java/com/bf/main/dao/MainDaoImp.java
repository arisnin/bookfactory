package com.bf.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.main.dto.CategoryPageDto;
import com.bf.main.dto.NoticeDto;
import com.bf.main.dto.SearchAuthorDto;
import com.bf.main.dto.SearchBookCountDto;
import com.bf.member.model.MemberDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
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
	
}
