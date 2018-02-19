package com.bf.book.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.book.dto.ReviewDto;
import com.bf.manager.dto.BookDto;
import com.bf.member.model.User;
import com.bf.book.dto.HomeDto;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 대분류별 보기 / 책 상세보기 관련 DAO 구현 클래스
 */
@Component
public class BookDaoImp implements BookDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace = "com.bf.mapper.BookPlusMapper.";

	@Override
	public int insertReview(ReviewDto reviewDto) {
		return sqlSession.insert("com.bf.mapper.BookPlusMapper.insert-review", reviewDto);
	}

	@Override
	public List<HomeDto> getHomeBookInfoList() {
		// TODO Auto-generated method stub
		int min=sqlSession.selectOne("getBookNumMin");
		
		return sqlSession.selectList("com.bf.mapper.BookPlusMapper.getHomeBookInfoList", min);
	}

	@Override
	public int getFirstCate(String firstCateName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.mapper.BookPlusMapper.getFirstCate", firstCateName);
	}

	@Override
	public String getFirstCateName(String firstCate) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.mapper.BookPlusMapper.getFirstCateName", firstCate);
	}

	@Override
	public List<BookDto> getNewBookList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.bf.mapper.BookPlusMapper.getNewBookList",map);
	}

	@Override
	public int getNewBookCount(String firstCate) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.mapper.BookPlusMapper.getNewBookCount", firstCate);
	}

	@Override
	public ReviewDto selectReviewSelf(int book_num, String username) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("book_num", book_num);
		map.put("id", username);
		return sqlSession.selectOne(namespace + "select-review-self", map);
	}

	@Override
	public List<ReviewDto> selectReviewList(int book_num) {
		return sqlSession.selectList(namespace + "select-review-list", book_num);
	}

	@Override
	public int updateReview(ReviewDto reviewDto) {
		return sqlSession.update(namespace + "update-review", reviewDto);
	}
}
