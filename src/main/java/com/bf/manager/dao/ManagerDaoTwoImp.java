package com.bf.manager.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.book.dto.ReviewDto;
import com.bf.manager.dto.AccuseDto;
import com.bf.manager.dto.BoardCate2Dto;
import com.bf.manager.dto.BoardContactDto;
import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.manager.dto.BookDto;
import com.bf.manager.dto.ManagerNoticeDto;
import com.bf.manager.dto.ManagerPayDto;
import com.bf.manager.dto.ManagerPointDto;
import com.bf.manager.dto.ManagerCashDto;
import com.bf.manager.dto.ManagerChargeDto;
import com.bf.manager.dto.MemberDto;
import com.bf.manager.dto.ReviewManagerDto;

@Component
public class ManagerDaoTwoImp implements ManagerDaoTwo {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int BoardInsertOk(BoardFrequencyDto boardFreDto) {

		return sqlSession.insert("com.bf.manager.ManagerboardMapper.InsertOk", boardFreDto);
	}
	@Override
	public int BoardfileInsertOk(BoardFrequencyDto boardFreDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("com.bf.manager.ManagerboardMapper.fileInsertOk", boardFreDto);
	}

	@Override
	public List<BoardFrequencyDto> catecorySearch() {

		return sqlSession.selectList("com.bf.manager.ManagerboardMapper.select");
	}

	@Override
	public List<BoardFrequencyDto> catecorySearch2() {

		return sqlSession.selectList("com.bf.manager.ManagerboardMapper.select2");
	}

	@Override
	public int Boardcount() {

		return sqlSession.selectOne("com.bf.manager.ManagerboardMapper.count");
	}

	@Override
	public List<BoardFrequencyDto> boardList(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("com.bf.manager.ManagerboardMapper.list", map);
	}
	@Override
	public BoardFrequencyDto selectBoard(int num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.manager.ManagerboardMapper.selectBoard",num);
	}

	@Override
	public List<BoardFrequencyDto> boardSearch(int startRow, int endRow, String word) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("word", word);
		return sqlSession.selectList("com.bf.manager.ManagerboardMapper.listSearch", map);
	}

	@Override
	public List<BoardFrequencyDto> boardSearchDate(int startRow, int endRow, Date startDate, Date endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlSession.selectList("com.bf.manager.ManagerboardMapper.listSearchDate", map);
	}

	@Override
	public int BoardNoitceInsertOk(ManagerNoticeDto noticeDto) {

		return sqlSession.insert("com.bf.manager.ManagerboardMapper.noticeInsert", noticeDto);
	}

	@Override
	public int BoardContactcount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.manager.ManagerboardMapper.contactCount");
	}
	@Override
	public List<BoardContactDto> boardContact(int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		return sqlSession.selectList("com.bf.manager.ManagerboardMapper.boardContact",map);
	}
	@Override
	public int boardReplyOk(BoardContactDto boardContactDto) {
		
		
	return sqlSession.update("com.bf.manager.ManagerboardMapper.boardReplyUpdate",boardContactDto);
	}
	
	@Override
	public BoardFrequencyDto catelist(int num,int cateNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("num", num);
		map.put("cateNum", cateNum);
		
		return sqlSession.selectOne("com.bf.manager.ManagerboardMapper.catelist",map);
	}
	
	@Override
	public int fileboardUpdateOk(BoardFrequencyDto boardFrequencyDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.bf.manager.ManagerboardMapper.fileBoardUpdate",boardFrequencyDto);
	}
	@Override
	public int boardUpdateOk(BoardFrequencyDto boardFrequencyDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.bf.manager.ManagerboardMapper.boardUpdate",boardFrequencyDto);
	}
	@Override
	public int listDelete(int num) {
		// TODO Auto-generated method stub
		return sqlSession.delete("com.bf.manager.ManagerboardMapper.boardDelete",num);
	}
	
	// ------------member------------------
	@Override
	public int memberCount(String searchWord, Date startDate,Date endDate ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchWord", searchWord);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlSession.selectOne("com.bf.manager.ManagerMemberMapper.count",map);
	}
	@Override
	public int memberCount1() {

		return sqlSession.selectOne("com.bf.manager.ManagerMemberMapper.count1");
	}

	@Override
	public List<MemberDto> memberList(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("com.bf.manager.ManagerMemberMapper.list", map);
	}
	@Override
	public List<MemberDto> memberSearchList(String searchWord, int starRow, int endRow,Date startDate,Date endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", starRow);
		map.put("endRow", endRow);
		map.put("searchWord", searchWord);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlSession.selectList("com.bf.manager.ManagerMemberMapper.searchList", map);
	}
	

	@Override
	public MemberDto register(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.manager.ManagerMemberMapper.register", id);
	}

	@Override
	public int registerOk(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.bf.manager.ManagerMemberMapper.registerOk", memberDto);
	}

	@Override
	public int registerDelete(String id) {

		return sqlSession.delete("com.bf.manager.ManagerMemberMapper.delete", id);
	}
	
	@Override
	public List<ManagerCashDto> memberCashList(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return sqlSession.selectList("com.bf.manager.ManagerMemberMapper.cashList", map);
	}
	@Override
	public List<ManagerCashDto> memberCashSearchList(String searchWord, int startRow, int endRow, Date startDate,
			Date endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchWord", searchWord);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlSession.selectList("com.bf.manager.ManagerMemberMapper.cashsearchList", map);
	}
	
	
	@Override
	public List<ManagerPayDto> payDetail(int startRow,int endRow,String id) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("id",id);
		
		return sqlSession.selectList("com.bf.manager.ManagerMemberMapper.payDetail",map);
	}
	@Override
	public ManagerCashDto selectPay(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.manager.ManagerMemberMapper.selectPay",id);
	}
	
	@Override
	public List<ManagerChargeDto> chargeDetail(int startRow, int endRow, String id) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("id",id);
		
		return sqlSession.selectList("com.bf.manager.ManagerMemberMapper.chargeDetail",map);
	}
	@Override
	public List<ManagerPointDto> pointDetail(int startRow, int endRow, String id) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("id",id);
		
		return sqlSession.selectList("com.bf.manager.ManagerMemberMapper.pointDetail",map);
	}
	
	
	// -----------------리뷰---------------------------
	@Override
	public int reviewCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.bf.manager.ManagerReviewMapper.reviewCount");
	}

	@Override
	public List<ReviewManagerDto> reviewList(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("com.bf.manager.ManagerReviewMapper.reviewList", map);
	}

	@Override
	public List<AccuseDto> accuseList(int num, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("num", num);
		return sqlSession.selectList("com.bf.manager.ManagerReviewMapper.accuseList", map);
	}
	@Override
	public int pointInsert(int point,String pointType,String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("point", point);
		map.put("pointType", pointType);
		map.put("id", id);
		return sqlSession.insert("com.bf.manager.ManagerReviewMapper.pointInsert",map);
		
	}
	@Override
	public List<ReviewManagerDto> reviewSearchDate(int startRow, int endRow, Date startDate, Date endDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return sqlSession.selectList("com.bf.manager.ManagerboardMapper.reviewSearchDate", map);
	}

}
