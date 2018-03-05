package com.bf.manager.dao;

import java.util.ArrayList;
import java.util.List;

import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.AuthorEditDto;
import com.bf.manager.dto.AuthorSearchDto;
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
public interface ManagerDao {


/*	public int insertCategory(String name);
*/
	public int insertBookCateSecond(String name, int cate1);

	public int insertBookCateThird(String name, int cateNum);

	public int checkCategory();

	public int publisherInsertOk(PublisherDto publisherDto);

	public int publisherNameCheck(String name);

	public List<CountryDto> getCountry();

	public int authorInsertOk(AuthorDto authorDto);

	public List<BookFirstCateDto> getFirstCate();

	public List<BookSecondCateDto> bookCateOne(String name);

	public List<BookThirdCateDto> bookCateTwo(String name);

	public List<PublisherDto> getPublisherList(int startRow, int endRow);

	public List<PublisherDto> getPublisherList(String searchWord,int startRow, int endRow);

	public int getPublisherCount();

	public String getCountry(String country);

	public int authorCheck(AuthorDto authorDto);

	public int selectAuthorNum(String name);

	public int getPublisherNum(String name);

	public int checkBook(String img_path);

	public int insertBook(BookDto bookDto);

	public int checkCateOne();

	public int insertCateOne(String string, int i);

	public int getZeroAuthor();

	public int authorInsertInit(AuthorDto authorDto);

	public int insertBookCategory(String cateName, int currentNum);

	public int getMaxBookNum();

	public int insertSeries(String name);

	public int getSeriesNum();

	public void insertBookCategory(String cate2, String cate3, int currentNum);

	public int getPublisherZero();

	public void publisherInsertZero(PublisherDto publisherDto);

	public int checkBookName(String name);

	public List<AuthorDto> checkBookAuthor(String name);

	public List<BookSearchDto> getBookSearchList(int startRow, int endRow);

	public List<BookSearchDto> getBookSearchList(String searchWord, int startRow, int endRow);

	public AuthorDto getAuthor(int author_num);

	public int getBookCount();

	public PublisherDto getPublisher(int pub_num);

	public int getBookCount(String searchWord);

	public int getCateOneCount();

	public int checkCateOne(String name);

	public int getCateTwoCount();

	public int checkCateTwo(String name);

	public int insertCateTwo(String name, int cate1, int num);

	public int getCateThreeCount();

	public int checkCateThree(String name);

	public int insertCateThree(String name, int cate1, int num);

	public int getPublisherCount(String searchWord);

	public List<PublisherSearchDto> getPublisherSearchList(int startRow, int endRow);

	public List<PublisherSearchDto> getPublisherSearchList(String searchWord, int startRow, int endRow);

	public int updatePublisher(PublisherDto publisherDto);

	public List<AuthorSearchDto> getAuthorSearchList(int startRow, int endRow);

	public List<AuthorSearchDto> getAuthorSearchList(String searchWord, int startRow, int endRow);

	public int getAuthorCount();

	public int getAuthorCount(String searchWord);

	public String getCountryName(String country_num);

	public List<BookDto> getBookList(int author_num);

	public int updateAuthor(AuthorDto authorDto);

	public int authorCheckName(String name);

	public int insertKeyWord(String name);

	public int keyNameCheck(String keyName);

	public int bookKeyWordCheck(String keyName, int currentNum);

	public void insertKeyWordList(String keyName, int currentNum);

	public BookDto getBook(int book_num);

	public List<KeywordDto> getKeywordList(int book_num);

	public int updateBook(BookDto bookDto);

	public void updateRandomPreference(int value, int book_num);

	public List<StatPreferenceDto> getStatPreferenceList();

	public int getPreferenceTotalCount(int cate_num);

	public StatPreferenceDto getPreferenceTotalCount(int cate_num, int rnum);

	public List<AuthorEditDto> getAuthorEditList(int startRow, int endRow);

	public int getAuthorEditCount();

	public int getAuthorEditCount(String condition);

	public List<AuthorEditDto> getAuthorEditList(String condition, int startRow, int endRow);

	public AuthorEditDto getAuthorEditOne(int editNum);

	public void updateAuthorEdit(int editNum);

	public int getMemberCount();

	public int getSaleCount();

	public int getStatTotalCount(int i);

	public void insertBookCategoryOne(int book_num, int cate1_num, int cate2_num, int cate3_num);

	public void deleteBookCategory(int book_num);

	public int deleteBook(int book_num);

	public void rejectAuthorEdit(int num);

}
