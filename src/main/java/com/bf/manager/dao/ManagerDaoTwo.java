package com.bf.manager.dao;

import java.util.Date;
import java.util.List;

import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.manager.dto.MemberDto;

/**
 * @ 작성자 : 전상헌
 * @ 작성일  : 2018. 2. 14.
 * @ 주제 및 설명 : DAO
 */
public interface ManagerDaoTwo {
	public int BoardInsertOk(BoardFrequencyDto boardFreDto);
	public List<BoardFrequencyDto> catecorySearch();
	public List<BoardFrequencyDto> catecorySearch2();
	public int Boardcount();
    public List<BoardFrequencyDto> boardList(int startRow,int endRow);
    public List<BoardFrequencyDto> boardSearch(int startRow,int endRow,String word);
    public List<BoardFrequencyDto> boardSearchDate(int startRow,int endRow,Date startDate,Date endDate);
    //member
    public int memberCount();
    public List<MemberDto> memberList(int starRow,int endRow);
 

}
