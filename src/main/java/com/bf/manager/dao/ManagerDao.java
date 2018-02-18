package com.bf.manager.dao;

import java.util.List;

import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.manager.dto.BookDto;
import com.bf.manager.dto.BookFirstCateDto;
import com.bf.manager.dto.BookSecondCateDto;
import com.bf.manager.dto.BookThirdCateDto;
import com.bf.manager.dto.CountryDto;
import com.bf.manager.dto.PublisherDto;

/**
 * @이름: 염현우
 * @날짜: 2018. 2. 12.
 * @설명: 
 */
public interface ManagerDao {


	public int insertCategory(String name);

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


}
