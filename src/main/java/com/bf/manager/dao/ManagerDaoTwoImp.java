package com.bf.manager.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.manager.dto.MemberDto;

@Component
public class ManagerDaoTwoImp implements ManagerDaoTwo {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int BoardInsertOk(BoardFrequencyDto boardFreDto) {
		
		return sqlSession.insert("com.bf.manager.boardMapper.InsertOk",boardFreDto);
	}

	@Override
	public List<BoardFrequencyDto> catecorySearch() {
		
		return  sqlSession.selectList("com.bf.manager.boardMapper.select");
	}
	@Override
	public List<BoardFrequencyDto> catecorySearch2() {
	
		return sqlSession.selectList("com.bf.manager.boardMapper.select2");
	}

	@Override
	public int Boardcount() {
		
		return sqlSession.selectOne("com.bf.manager.boardMapper.count");
	}

	@Override
	public List<BoardFrequencyDto> boardList(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow",endRow);
		return sqlSession.selectList("com.bf.manager.boardMapper.list",map);
	}
	 @Override
	public List<BoardFrequencyDto> boardSearch(int startRow, int endRow, String word) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("word",word);	
		return sqlSession.selectList("com.bf.manager.boardMapper.listSearch",map);
	}
	 @Override
	public List<BoardFrequencyDto> boardSearchDate(int startRow, int endRow, Date startDate, Date endDate) {
		 Map<String, Object> map = new HashMap<String, Object>();
			map.put("startRow",startRow);
			map.put("endRow", endRow);
			map.put("startDate",startDate);	
			map.put("endDate",endDate);	
			return sqlSession.selectList("com.bf.manager.boardMapper.listSearchDate",map);
	}
	 //------------member------------------
	@Override
	public int memberCount() {
		
		return sqlSession.selectOne("com.bf.manager.MemberMapper.count");
	}
	@Override
	public List<MemberDto> memberList(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow",endRow);
		return sqlSession.selectList("com.bf.manager.MemberMapper.list",map);
	}
	
}
