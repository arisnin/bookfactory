package com.bf.manager.dao;

import java.util.List;

import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.BoardFrequencyDto;
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
	public int BoardInsertOk(BoardFrequencyDto boardFreDto);
	public List<BoardFrequencyDto> catecorySearch();
	public List<BoardFrequencyDto> catecorySearch2();
	public int Boardcount();
    public List<BoardFrequencyDto> boardList(int startRow,int endRow);

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



}
