package com.bf.book.dao;

import java.util.HashMap;
import java.util.List;

import com.bf.book.dto.ReviewDto;
import com.bf.manager.dto.BookDto;
import com.bf.member.model.User;
import com.bf.book.dto.HomeDto;
import com.bf.book.dto.NewBookDto;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 대분류별 보기 / 책 상세보기 관련 DAO 인터페이스
 */
public interface BookDao {
	int insertReview(ReviewDto reviewDto);
	List<HomeDto> getHomeBookInfoList(int firstCate);
	int getFirstCate(String firstCateName);
	String getFirstCateName(String firstCate);
	List<NewBookDto> getNewBookList(HashMap<String, Integer> map);
	int getNewBookCount(String firstCate);
	ReviewDto selectReviewSelf(int book_num, String username);
	List<ReviewDto> selectReviewList(int book_num);
	int updateReview(ReviewDto reviewDto);
	HomeDto getRecomList(int randomBookNum);
	List<Integer> getRandomBookNum(int firstCate);
	int getBookSecondCate(int firstCate);
	List<Integer> getPaperRandomBookNum(HashMap<String, Integer> map);
	List<HomeDto> getPaperHomeBookInfoList(HashMap<String, Integer> map);
	int getPaperNewBookCount(HashMap<String, String> cateMap);
	List<NewBookDto> getPaperNewBookList(HashMap<String, String> cateMap);

}
