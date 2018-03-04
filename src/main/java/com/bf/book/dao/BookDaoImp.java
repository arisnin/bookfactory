package com.bf.book.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
 * @description 대분류별 보기 / 책 상세보기 관련 DAO 구현 클래스
 * 
 * @author choi jung eun
 * @date 2018. 2. 22.
 * @description 화면에 책정보 보여주기, 상세보기 등 구현 
 */

@Component
public class BookDaoImp implements BookDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace = "com.bf.mapper.BookPlusMapper.";

	@Override
	public List<CategoryPageDto> getAuthorBookList(int authorNum, int orderTypeNum, int startRow, int endRow) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("authorNum", authorNum);
		map.put("orderTypeNum", orderTypeNum);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList(namespace + "select-author-book", map);
	}

	@Override
	public int getAuthorBookCount(int authorNum) {
		return sqlSession.selectOne(namespace + "select-author-book-count", authorNum);
	}

	@Override
	public int insertReview(ReviewDto reviewDto) {
		return sqlSession.insert( namespace + "insert-review", reviewDto);
	}

	@Override	//일반, 만화에서 사용하는 홈화면 책정보가져오기 나중에 수정해야함 - 
	public List<HomeDto> getHomeBookInfoList(int firstCate) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("com.bf.mapper.BookPlusMapper.getHomeBookInfoList", firstCate);
	}

	@Override	//첫번째 카테고리 번호 얻기
	public int getFirstCate(String firstCateName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.mapper.BookPlusMapper.getFirstCate", firstCateName);
	}

	@Override	//첫번째 카테고리 이름 얻기
	public String getFirstCateName(String firstCate) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.mapper.BookPlusMapper.getFirstCateName", firstCate);
	}

	@Override	//일반, 만화의 신간 책 들고오기
	public List<NewBookDto> getNewBookList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.bf.mapper.BookPlusMapper.getNewBookList",map);
	}
	
	@Override	//일반, 만화의 신간 책 권 수
	public int getNewBookCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.mapper.BookPlusMapper.getNewBookCount", map);
	}

	@Override
	public ReviewPageDto selectReviewSelf(int book_num, String username) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("book_num", book_num);
		map.put("id", username);
		return sqlSession.selectOne(namespace + "select-review-self", map);
	}

	@Override
	public List<ReviewPageDto> selectReviewList(int book_num) {
		return sqlSession.selectList(namespace + "select-review-list", book_num);
	}

	@Override
	public int updateReview(ReviewDto reviewDto) {
		return sqlSession.update(namespace + "update-review", reviewDto);
	}

	@Override
	public List<ReplyDto> selectReplyList(int num) {
		return sqlSession.selectList(namespace + "select-reply-list", num);
	}

	@Override
	public int insertReply(ReplyDto replyDto) {
		return sqlSession.insert(namespace + "insert-reply", replyDto);
	}

	@Override
	public int deleteReview(String id, int num) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("num", num);
		return sqlSession.delete(namespace + "delete-review", map);
	}
	
	@Override	//추천도서 가져오기
	public HomeDto getRecomList(int randomBookNum) {
		return sqlSession.selectOne("com.bf.mapper.BookPlusMapper.getRecomList", randomBookNum);
	}

	@Override	//오늘의 추천에서 랜덤값 가져오는 아이 - 일반, 만화 해당
	public List<Integer> getRandomBookNum(int firstCate) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getRandomBookNum", firstCate);
	}

	@Override	//일반,만화 제외 홈 화면에서 연재인지 단행본인지 구별하는 아이
	public int getBookSecondCate(int firstCate) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getBookSecondCate", firstCate);
	}

	@Override	//오늘의 추천에서 랜덤값 가져오는 아이 - 로맨스, 판타지, 비엘 단행본 해당
	public List<Integer> getPaperRandomBookNum(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getPaperRandomBookNum", map);
	}

	@Override	//일반, 만화 제외 홈 화면 리스트 뿌리기
	public List<HomeDto> getPaperHomeBookInfoList(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getPaperHomeBookInfoList", map);
	}

	@Override	//일반, 만화 제외 신간 권 수 가져오기
	public int getPaperNewBookCount(HashMap<String, String> cateMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getPaperNewBookCount", cateMap);
	}

	@Override	//단행본인 아이들 신권 리스트 가져오기
	public List<NewBookDto> getPaperNewBookList(HashMap<String, String> cateMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getPaperNewBookList", cateMap);
	}

	@Override	//책 상세보기 정보 가져오기
	public DetailDto getBookAllInfo(long book_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getBookAllInfo", book_num);
	}

	@Override	//두번째 카테고리 번호가져오기
	public int getSecondCateNum(long book_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getSecondCateNum", book_num);
	}

	@Override	//두번째 카테고리 이름 가져오기
	public String getSecondCateName(long book_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getSecondCateName", book_num);
	}

	@Override	//출판사 이름 가져오기
	public String getPubName(long book_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getPubName", book_num);
	}

	@Override	//태그선택시 카운트수 가져오기
	public int getTagListCount(ArrayList<String> list) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getTagListCount", list);
	}

	@Override	//태그선택시 해당값에 맞는 책정보들고오기
	public List<HomeDto> getTagBookList(HashMap<String, ArrayList<String>> listMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getTagBookList", listMap);
	}

	@Override	//작가 정보가져오기
	public AuthorDto getAuthorInfo(long author_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getAuthorInfo", author_num);
	}

	@Override	//작가 대표저서 가져오기
	public List<HomeDto> getAuthorBook(long author_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getAuthorBook", author_num);
	}

	@Override	//상세보기에서의 카테고리들
	public List<DetailCateDto> getDetailCate(long book_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getDetailCate",book_num);
	}

	@Override	//키워드에서 가지고 있는 키워드들 받아옴
	public List<String> getKeyword(long book_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getKeyword", book_num);
	}

	// 도서 상세페이지 클릭하면 데이터들이 최근 본 책 페이지로 들어감
	@Override
	public int recentLookBookInsert(
			MyPageRecentLookBookDto myPageRecentLookBookDto) {
		return sqlSession.insert(namespace + "recent_look_book_insert", myPageRecentLookBookDto);
	}

	@Override	//최근많이읽는책
	public List<HomeDto> getPopularList(int firstCate) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getPopularList", firstCate);
	}

	@Override	//두번째 카테고리이름 가져오되 중복되어있을경우 위에 하나만 가져오는것
	public String getThirdNameOverlap(long book_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getThirdNameOverlap", book_num);
	}

	@Override
	public List<HomeDto> getBestSellerWeek(HashMap<String, Object> pMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getBestSellerWeek", pMap);
	}

	@Override
	public List<HomeDto> getBestSellerMonth(HashMap<String, Object> pMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getBestSellerMonth", pMap);
	}

	@Override
	public List<HomeDto> getBestSellerSteady(HashMap<String, Object> pMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getBestSellerSteady", pMap);
	}

	@Override
	public int getBestSellerWeekCount(HashMap<String, Object> pMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getBestSellerWeekCount", pMap);
	}

	@Override
	public int getBestSellerMonthCount(HashMap<String, Object> pMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getBestSellerMonthCount", pMap);
	}

	@Override
	public int getBestSellerSteadyCount(HashMap<String, Object> pMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getBestSellerSteadyCount", pMap);
	}

	@Override
	public List<HomeDto> getPopularList(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getPopularListPaper",map);
	}

	@Override
	public List<HomeDto> getBestSellerWeekPaper(HashMap<String, Object> pMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getBestSellerWeekPaper",pMap);
	}

	@Override
	public int getFirstCateUseBookNum(String book_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getFirstCateUseBookNum",book_num);
	}

	@Override
	public ExampleDto getExample(int first) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getExample", first);
	}

}
