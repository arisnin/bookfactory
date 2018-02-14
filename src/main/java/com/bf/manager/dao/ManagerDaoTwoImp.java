package com.bf.manager.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.manager.dto.BoardFrequencyDto;

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
		
		return sqlSession.selectOne("count");
	}

	@Override
	public List<BoardFrequencyDto> boardList(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow",endRow);
		return sqlSession.selectList("com.bf.manager.boardMapper.list",map);
	}
}
