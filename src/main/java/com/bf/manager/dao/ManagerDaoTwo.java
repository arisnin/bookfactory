package com.bf.manager.dao;

import java.util.Date;
import java.util.List;


import com.bf.manager.dto.AccuseDto;
import com.bf.manager.dto.BoardCate2Dto;
import com.bf.manager.dto.BoardContactDto;
import com.bf.manager.dto.BoardFrequencyDto;

import com.bf.manager.dto.ManagerNoticeDto;
import com.bf.manager.dto.MemberDto;
import com.bf.manager.dto.ReviewManagerDto;

/**
 * @ 작성자 : 전상헌
 * @ 작성일  : 2018. 2. 14.
 * @ 주제 및 설명 : DAO
 */
public interface ManagerDaoTwo {
	//board
	public int BoardInsertOk(BoardFrequencyDto boardFreDto);
	public int BoardfileInsertOk(BoardFrequencyDto boardFreDto);
	
	public List<BoardFrequencyDto> catecorySearch();
	public List<BoardFrequencyDto> catecorySearch2();
	public int Boardcount();
    public List<BoardFrequencyDto> boardList(int startRow,int endRow);
    public List<BoardFrequencyDto> boardSearch(int startRow,int endRow,String word);
    public List<BoardFrequencyDto> boardSearchDate(int startRow,int endRow,Date startDate,Date endDate);
    public int BoardNoitceInsertOk(ManagerNoticeDto noticeDto);
    public int BoardContactcount();
    public List<BoardContactDto> boardContact(int startRow, int endRow);
    public int boardReplyOk(BoardContactDto boardContactDto);
    public BoardFrequencyDto selectBoard(int num);
    public BoardFrequencyDto catelist(int num,int cateNum); 

    //member
    public int memberCount();
    public List<MemberDto> memberList(int starRow,int endRow);
    public MemberDto register(String id);
    public int registerOk(MemberDto memberDto);
    public int registerDelete(String id);
    
    
   //review
    public int reviewCount();
    public List<ReviewManagerDto> reviewList(int startRow,int endRow);
    public List<AccuseDto> accuseList(int num,int startRow,int endRow);

}
