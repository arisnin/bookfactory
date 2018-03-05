package com.bf.manager.dao;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.executor.statement.CallableStatementHandler;

import com.bf.manager.dto.AccuseDto;
import com.bf.manager.dto.BoardCate2Dto;
import com.bf.manager.dto.BoardContactDto;
import com.bf.manager.dto.BoardFrequencyDto;

import com.bf.manager.dto.ManagerNoticeDto;
import com.bf.manager.dto.ManagerPayDto;
import com.bf.manager.dto.ManagerPointDto;
import com.bf.manager.dto.ManagerCashDto;
import com.bf.manager.dto.ManagerChargeDto;
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
    public int fileboardUpdateOk(BoardFrequencyDto boardFrequencyDto);
    public int boardUpdateOk(BoardFrequencyDto boardFrequencyDto);
    public int listDelete(int num);
    //member
    public int memberCount(String searchWordDate, Date startDate,Date endDate);
    public int memberCount1();
    public List<MemberDto> memberList(int starRow,int endRow);
    public List<MemberDto> memberSearchList(String searchWord,int starRow,int endRow,Date startDate,Date endDate);
    public MemberDto register(String id);
    public int registerOk(MemberDto memberDto);
    public int registerDelete(String id);
    public List<ManagerCashDto> memberCashList(int startRow,int endRow);
    public List<ManagerCashDto> memberCashSearchList(String searchWord,int startRow,int endRow);
    public List<ManagerPayDto> payDetail(int startRow,int endRow,String id);
    public List<ManagerChargeDto> chargeDetail(int startRow,int endRow,String id);
    public List<ManagerPointDto> pointDetail(int startRow,int endRow,String id);
    public int pointInsert(int point,String pointType,String id	);
    public ManagerCashDto selectPay(String id);
    public int memberCashCount();
    public int memberCashCount1(String searchWord);
    public int payCount(String id);
	public int chargeCount(String id);
	public int pointCount(String id);
	
    
    
   //review
    public int reviewCount();
    public List<ReviewManagerDto> reviewList(int startRow,int endRow);
    public List<AccuseDto> accuseList(int num,int startRow,int endRow);
    public List<ReviewManagerDto> reviewSearchDate(int startRow,int endRow,Date startDate,Date endDate);
    
}
