package com.bf.manager.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.AuthorSearchDto;
import com.bf.manager.dto.BookCategoryDto;
import com.bf.manager.dto.BookDto;
import com.bf.manager.dto.BookFirstCateDto;
import com.bf.manager.dto.BookSearchDto;
import com.bf.manager.dto.BookSecondCateDto;
import com.bf.manager.dto.BookThirdCateDto;
import com.bf.manager.dto.CountryDto;
import com.bf.manager.dto.KeywordDto;
import com.bf.manager.dto.PublisherDto;
import com.bf.manager.dto.PublisherSearchDto;
import com.bf.manager.dto.StatPreferenceDto;

/**
 * @이름: 염현우
 * @날짜: 2018. 2. 12.
 * @설명:
 */
@Component
public class ManagerDaoImp implements ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

/*	@Override
	public int insertCategory(String name) {
		return sqlSession.insert("com.bf.mapper.BookMapper.insertCateSecond", name);
	}*/

	@Override
	public int insertBookCateSecond(String name, int cate1) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("cate1", cate1);
		int check = sqlSession.insert("com.bf.mapper.BookMapper.insertBookCateSecond", map);
		if (check == 0) {
			return -1;
		}
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getMaxNum");
	}

	@Override
	public int insertBookCateThird(String name, int cateNum) {
		// 책의 소분류 카테고리
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("cateNum", cateNum);
		return sqlSession.insert("com.bf.mapper.BookMapper.insertBookCateThird", map);
	}

	@Override
	public int checkCategory() {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getMaxNum");
	}

	@Override
	public int publisherInsertOk(PublisherDto publisherDto) {
		return sqlSession.insert("com.bf.mapper.PublisherMapper.publisherInsert", publisherDto);
	}

	@Override
	public int publisherNameCheck(String name) {
		return sqlSession.selectOne("com.bf.mapper.PublisherMapper.nameCheck", name);
	}

	@Override
	public List<CountryDto> getCountry() {
		return sqlSession.selectList("com.bf.mapper.AuthorMapper.getCountry");
	}

	@Override
	public int authorInsertOk(AuthorDto authorDto) {
		return sqlSession.insert("com.bf.mapper.AuthorMapper.insert", authorDto);
	}

	@Override
	public List<BookFirstCateDto> getFirstCate() {
		return sqlSession.selectList("com.bf.mapper.BookMapper.getFirstCate");
	}

	@Override
	public List<BookSecondCateDto> bookCateOne(String name) {
		int num = sqlSession.selectOne("com.bf.mapper.BookMapper.getCateOneNum", name);
		return sqlSession.selectList("com.bf.mapper.BookMapper.getCateTwoList", num);
	}

	@Override
	public List<BookThirdCateDto> bookCateTwo(String name) {
		int num = sqlSession.selectOne("com.bf.mapper.BookMapper.getCateTwoNum", name);
		return sqlSession.selectList("com.bf.mapper.BookMapper.getCateThreeList", num);
	}

	@Override
	public List<PublisherDto> getPublisherList(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("com.bf.mapper.PublisherMapper.getPublisher1", map);
	}

	@Override
	public List<PublisherDto> getPublisherList(String searchWord, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchWord", searchWord);
		return sqlSession.selectList("com.bf.mapper.PublisherMapper.getPublisher2", map);
	}
	
	@Override
	public List<BookSearchDto> getBookSearchList(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("com.bf.mapper.BookMapper.getBookSearchList1", map);
	}
	
	@Override
	public List<BookSearchDto> getBookSearchList(String searchWord, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchWord", searchWord);
		return sqlSession.selectList("com.bf.mapper.BookMapper.getBookSearchList2", map);
	}
	
	@Override
	public List<PublisherSearchDto> getPublisherSearchList(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("com.bf.mapper.PublisherMapper.getPublisherSearchList1", map);
	}
	
	@Override
	public List<PublisherSearchDto> getPublisherSearchList(String searchWord, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchWord", searchWord);
		return sqlSession.selectList("com.bf.mapper.PublisherMapper.getPublisherSearchList2", map);
	}
	
	@Override
	public List<AuthorSearchDto> getAuthorSearchList(int startRow, int endRow) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("com.bf.mapper.AuthorMapper.getAuthorSearchList", map);
	}
	
	@Override
	public List<AuthorSearchDto> getAuthorSearchList(String searchWord, int startRow, int endRow) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchWord", searchWord);
		return sqlSession.selectList("com.bf.mapper.AuthorMapper.getAuthorSearchList2", map);
	}
	
	@Override
	public int getAuthorCount() {
		return sqlSession.selectOne("com.bf.mapper.AuthorMapper.getAuthorCount");
	}
	
	@Override
	public int getAuthorCount(String searchWord) {
		return sqlSession.selectOne("com.bf.mapper.AuthorMapper.getAuthorCount2",searchWord);
	}
	
	@Override
	public int getBookCount() {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getCount");
	}
	
	@Override
	public int getBookCount(String searchWord) {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getCount2",searchWord);
	}
	
	@Override
	public AuthorDto getAuthor(int author_num) {
		return sqlSession.selectOne("com.bf.mapper.AuthorMapper.getAuthor", author_num);
	}
	
	@Override
	public PublisherDto getPublisher(int pub_num) {
		return sqlSession.selectOne("com.bf.mapper.PublisherMapper.getPublisher",pub_num);
	}

	@Override
	public int getPublisherCount() {
		return sqlSession.selectOne("com.bf.mapper.PublisherMapper.getCount");
	}
	
	@Override
	public int getPublisherCount(String searchWord) {
		return sqlSession.selectOne("com.bf.mapper.PublisherMapper.getCount2",searchWord);
	}

	@Override
	public String getCountry(String country) {
		return sqlSession.selectOne("com.bf.mapper.AuthorMapper.getCountryOne", country);
	}
	
	@Override
	public String getCountryName(String country_num) {
		return sqlSession.selectOne("com.bf.mapper.AuthorMapper.getCountryName", country_num);
	}
	
	@Override
	public List<BookDto> getBookList(int author_num) {
		return sqlSession.selectList("com.bf.mapper.BookMapper.getBookList", author_num);
	}

	@Override
	public int authorCheck(AuthorDto authorDto) {
		return sqlSession.selectOne("com.bf.mapper.AuthorMapper.authorCheck", authorDto);
	}

	@Override
	public int selectAuthorNum(String name) {
		if(sqlSession.selectOne("com.bf.mapper.AuthorMapper.getNum", name) == null) {
			return 0;
		}
		return sqlSession.selectOne("com.bf.mapper.AuthorMapper.getNum", name);
	}

	@Override
	public int getPublisherNum(String name) {
		if(sqlSession.selectOne("com.bf.mapper.PublisherMapper.getNum", name)==null) {
			return 0;
		}else {
			return sqlSession.selectOne("com.bf.mapper.PublisherMapper.getNum", name);			
		}
	}

	@Override
	public int checkBook(String img_path) {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.checkBook", img_path);
	}

	@Override
	public int insertBook(BookDto bookDto) {
		return sqlSession.insert("com.bf.mapper.BookMapper.insert", bookDto);
	}

	@Override
	public int checkCateOne() {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.checkCateOne");
	}
	
	@Override
	public int checkCateOne(String name) {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.checkCateOne2", name);
	}
	
	@Override
	public int checkCateTwo(String name) {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.checkCateTwo", name);
	}
	
	@Override
	public int checkCateThree(String name) {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.checkCateThree", name);
	}

	@Override
	public int insertCateOne(String name,int num) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("num", num);
		return sqlSession.insert("com.bf.mapper.BookMapper.insertCateOne", map);
	}
	
	@Override
	public int insertCateTwo(String name, int cate1, int num) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("num", num);
		map.put("cate1", cate1);
		return sqlSession.insert("com.bf.mapper.BookMapper.insertCateTwo", map);
	}
	
	@Override
	public int insertCateThree(String name, int cate1, int num) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("num", num);
		map.put("cate1", cate1);
		return sqlSession.insert("com.bf.mapper.BookMapper.insertCateThree", map);
	}

	@Override
	public int getZeroAuthor() {
		return sqlSession.selectOne("com.bf.mapper.AuthorMapper.getZeroAuthor");
	}

	@Override
	public int authorInsertInit(AuthorDto authorDto) {
		return sqlSession.insert("com.bf.mapper.AuthorMapper.authorInsertInit", authorDto);
	}

	@Override
	public int insertBookCategory(String cateName, int currentNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cateName", cateName);
		map.put("currentNum", currentNum);
		
		List<BookCategoryDto> checkSize = sqlSession.selectList("com.bf.mapper.BookMapper.checkBookCategorySize", map);
		if(checkSize.size() == 1) {
			return sqlSession.insert("com.bf.mapper.BookMapper.insertBookCategory", map);
		}else {
			return 	sqlSession.insert("com.bf.mapper.BookMapper.insertBookCategory2", map);
		}
	}
	
	@Override
	public void insertBookCategory(String cate2, String cate3, int currentNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cate2", cate2);
		map.put("cate3", cate3);
		map.put("currentNum", currentNum);
		
		sqlSession.insert("com.bf.mapper.BookMapper.insertBookCategory3", map);
	}

	@Override
	public int getMaxBookNum() {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getMaxBookNum");
	}
	
	@Override
	public int insertSeries(String name) {
		return sqlSession.insert("com.bf.mapper.BookMapper.insertSeries",name);
	}
	
	@Override
	public int getSeriesNum() {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getSeriesNum");
	}
	
	@Override
	public int getPublisherZero() {
		return sqlSession.selectOne("com.bf.mapper.PublisherMapper.getPublisherZero");
	}
	
	@Override
	public void publisherInsertZero(PublisherDto publisherDto) {
		sqlSession.insert("com.bf.mapper.PublisherMapper.publisherInsertZero",publisherDto);
	}

	@Override
	public int checkBookName(String name) {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.checkBookName", name);
	}
	
	@Override
	public List<AuthorDto> checkBookAuthor(String name) {
		return sqlSession.selectList("com.bf.mapper.AuthorMapper.checkBookAuthor", name);
	}

	@Override
	public int getCateOneCount() {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getCateOneCount");
	}
	
	@Override
	public int getCateTwoCount() {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getCateTwoCount");
	}
	
	@Override
	public int getCateThreeCount() {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getCateThreeCount");
	}

	@Override
	public int updatePublisher(PublisherDto publisherDto) {
		return 	sqlSession.update("com.bf.mapper.PublisherMapper.updatePublisher",publisherDto);
	}

	@Override
	public int updateAuthor(AuthorDto authorDto) {
		return sqlSession.update("com.bf.mapper.AuthorMapper.updateAuthor", authorDto);
	}

	@Override
	public int authorCheckName(String name) {
		return sqlSession.selectOne("com.bf.mapper.AuthorMapper.authorCheckName",name);
	}

	@Override
	public int insertKeyWord(String name) {
		return sqlSession.insert("com.bf.mapper.BookMapper.insertKeyWord",name);
	}
	
	@Override
	public int keyNameCheck(String keyName) {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.keyNameCheck",keyName);
	}
	
	@Override
	public int bookKeyWordCheck(String keyName, int currentNum) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("keyName", keyName);
		map.put("currentNum", currentNum);
		return sqlSession.selectOne("com.bf.mapper.BookMapper.bookKeyWordCheck",map);
	}
	
	@Override
	public void insertKeyWordList(String keyName, int currentNum) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		int keyNum = sqlSession.selectOne("com.bf.mapper.BookMapper.getKeyWordNum",keyName);
		map.put("keyNum", keyNum);
		map.put("currentNum", currentNum);
		sqlSession.insert("com.bf.mapper.BookMapper.insertKeyWordList",map);
	}

	@Override
	public BookDto getBook(int book_num) {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getBook",book_num);
	}
	
	@Override
	public List<KeywordDto> getKeywordList(int book_num) {
		return sqlSession.selectList("com.bf.mapper.BookMapper.getKeywordList",book_num);
	}
	
	@Override
	public int updateBook(BookDto bookDto) {
		return sqlSession.update("com.bf.mapper.BookMapper.updateBook", bookDto);
	}

	@Override
	public void updateRandomPreference(int value, int book_num) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("value", value);
		map.put("book_num", book_num);
		sqlSession.update("com.bf.mapper.BookMapper.updateRandomPreference", map);
	}

	@Override
	public List<StatPreferenceDto> getStatPreferenceList() {
		return sqlSession.selectList("com.bf.mapper.StatMapper.getStatPreferenceList");
	}

	@Override
	public int getPreferenceTotalCount(int cate_num) {
		return sqlSession.selectOne("com.bf.mapper.StatMapper.getPreferenceTotalCount",cate_num);
	}
	
	@Override
	public StatPreferenceDto getPreferenceTotalCount(int cate_num, int rnum) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("cate_num", cate_num);
		map.put("rnum", rnum);
		return sqlSession.selectOne("com.bf.mapper.StatMapper.getPreferenceTotalCount2",map);
	}
}
