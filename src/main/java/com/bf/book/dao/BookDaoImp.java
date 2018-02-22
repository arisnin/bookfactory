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
import com.bf.book.dto.DetailDto;
import com.bf.book.dto.HomeDto;
import com.bf.book.dto.NewBookDto;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 대분류별 보기 / 책 상세보기 관련 DAO 구현 클래스
 * 
 * @author choi jung eun
 * @date 2018. 2. 22.
 * @description 화면에 책정보 보여주기, 상세보기 등 구현 
 * 
 *   SELECT bm.img_path "img_path", bm.NAME "book_name", A.NAME "author_name", rs."star_point", rs."star_count" FROM bookm bm, (
  SELECT round(sum(star_point) / count(star_point), 1) "star_point", count(star_point) "star_count", book_num FROM review
  GROUP BY book_num
) rs, author a
WHERE bm.book_num = rs.book_num
AND bm.author_num = a.num;

책 정보 + 별점평균 + 별점평가수 같이 나오는 쿼리
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
	public List<NewBookDto> getNewBookList(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.bf.mapper.BookPlusMapper.getNewBookList",map);
	}
	
	@Override	//일반, 만화의 신간 책 권 수
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

	@Override	//카테고리 중복인 아이들 뽑아내기
	public int getOverlapThirdCate(long book_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getOverlapThirdCate", book_num);
	}

	@Override	//카테고리 중복인 아이들 이름 뽑아내기
	public List<String> getOverlapCateName(long book_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getOverlapCateName", book_num);
	}

	@Override	//카테고리 중복인 아이들 번호 뽑아내기
	public int getThirdCateNum(String third_cate_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getThirdCateNum", third_cate_name);
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

}
