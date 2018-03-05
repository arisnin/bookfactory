package com.bf.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bf.main.dto.CategoryPageDto;
import com.bf.main.dto.EventDto;
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

	public int selectCashAvailable(String id);

	public int selectPointAvailable(String id);

	public int selectPurchasedCount(String id);

	public List<Map<String, Integer>> selectCartWishCount(String id);

	public String getFirstCateName(String firstCate);

	public int getEventCount(HashMap<String, Object> map);

	public List<EventDto> getEventList(HashMap<String, Object> map);

	public EventDto getEventInfo(String num);

	public int getRandomBookNum(int f_num);

}
