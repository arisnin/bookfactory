package com.bf.book.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.bf.book.dto.ReviewDto;
import com.bf.book.dto.ReviewPageDto;
import com.bf.main.dto.CategoryPageDto;
import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.BookDto;
import com.bf.member.model.User;
import com.bf.myPage.dto.MyPageRecentLookBookDto;
import com.bf.book.dto.DetailCateDto;
import com.bf.book.dto.DetailDto;
import com.bf.book.dto.ExampleDto;
import com.bf.book.dto.HomeDto;
import com.bf.book.dto.NewBookDto;
import com.bf.book.dto.ReplyDto;

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
	List<NewBookDto> getNewBookList(HashMap<String, Object> map);
	int getNewBookCount(HashMap<String, Object> map);
	ReviewPageDto selectReviewSelf(int book_num, String username);
	List<ReviewPageDto> selectReviewList(int book_num);
	int updateReview(ReviewDto reviewDto);
	HomeDto getRecomList(int randomBookNum);
	List<Integer> getRandomBookNum(int firstCate);
	int getBookSecondCate(int firstCate);
	List<Integer> getPaperRandomBookNum(HashMap<String, Object> map);
	List<HomeDto> getPaperHomeBookInfoList(HashMap<String, Integer> map);
	int getPaperNewBookCount(HashMap<String, String> cateMap);
	List<NewBookDto> getPaperNewBookList(HashMap<String, String> cateMap);
	DetailDto getBookAllInfo(long book_num);
	int getSecondCateNum(long book_num);
	String getSecondCateName(long book_num);
	String getPubName(long book_num);
	int getTagListCount(ArrayList<String> list);
	List<HomeDto> getTagBookList(HashMap<String, ArrayList<String>> listMap);
	List<ReplyDto> selectReplyList(int num);
	int insertReply(ReplyDto replyDto);
	int deleteReview(String id, int num);
	AuthorDto getAuthorInfo(long author_num);
	List<HomeDto> getAuthorBook(long author_num);
	List<DetailCateDto> getDetailCate(long book_num);
	List<String> getKeyword(long book_num);
	int recentLookBookInsert(MyPageRecentLookBookDto myPageRecentLookBookDto);
	List<HomeDto> getPopularList(int firstCate);
	String getThirdNameOverlap(long book_num);
	List<HomeDto> getBestSellerWeek(HashMap<String, Object> pMap);
	List<HomeDto> getBestSellerMonth(HashMap<String, Object> pMap);
	List<HomeDto> getBestSellerSteady(HashMap<String, Object> pMap);
	int getBestSellerWeekCount(HashMap<String, Object> pMap);
	int getBestSellerMonthCount(HashMap<String, Object> pMap);
	int getBestSellerSteadyCount(HashMap<String, Object> pMap);
	List<HomeDto> getBestSellerWeekPaper(HashMap<String, Object> pMap);
	int getFirstCateUseBookNum(String book_num);
	ExampleDto getExample(int first);
	List<CategoryPageDto> getAuthorBookList(int authorNum, int orderTypeNum, int startRow, int endRow);
	int getAuthorBookCount(int authorNum);
	List<HomeDto> getPopularListPaper(HashMap<String, Object> map);
	//염현우
	int insertAuthorEdit(int author_num, String content);

}
