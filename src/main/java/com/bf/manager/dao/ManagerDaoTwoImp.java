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
import com.bf.manager.dto.BoardContactDto;
import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.manager.dto.BookDto;
import com.bf.manager.dto.ManagerNoticeDto;
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
	// ------------member------------------
	@Override
	public int memberCount() {

		return sqlSession.selectOne("com.bf.manager.ManagerMemberMapper.count");
	}

	@Override
	public List<MemberDto> memberList(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("com.bf.manager.ManagerMemberMapper.list", map);
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

	// -----------------리뷰
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

}
