package com.bf.main.dao;

import java.util.List;
import java.util.Map;

import com.bf.main.dto.CategoryPageDto;
import com.bf.main.dto.NoticeDto;
import com.bf.main.dto.SearchAuthorDto;
import com.bf.main.dto.SearchBookCountDto;
import com.bf.member.model.MemberDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
public interface MainDao {

	public int register(MemberDto memberDto);

	public int noticeMainCount();

	public int registerValidation(String type, String keyword);

	public List<NoticeDto> noticeMain(int startRow, int endRow);

	public NoticeDto noticeRead(int num);

	public List<CategoryPageDto> selectCategoryAll(int secondCateNum, int thirdCateNum, int serviceNum, int startRow, int endRow);

	public int selectCategoryAllCount(int secondCateNum, int thirdCateNum, int serviceNum);

	public List<SearchAuthorDto> selectSearchAuthor(String keyword);

	public List<CategoryPageDto> selectSearchBook(String keyword, int thirdCateNum, int orderTypeNum, int startRow, int endRow);

	public int selectSearchBookCount(String keyword);

	List<SearchBookCountDto> selectSearchBookByCategoryCount(String keyword);
	
	public List<Map<String, Object>> suggestKeyword(String keyword);

	public List<Map<String, Object>> suggestKeyword(String keyword, String string);
}
