package com.bf.book.dao;

import java.util.HashMap;
import java.util.List;

import com.bf.book.dto.ReviewDto;
import com.bf.manager.dto.BookDto;
import com.bf.book.dto.HomeDto;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 대분류별 보기 / 책 상세보기 관련 DAO 인터페이스
 */
public interface BookDao {
	int insertReview(ReviewDto reviewDto);
	List<HomeDto> getHomeBookInfoList();
	int getFirstCate(String firstCateName);
	String getFirstCateName(String firstCate);
	List<BookDto> getNewBookList(HashMap<String, Object> map);
	int getNewBookCount(String firstCate);

}
