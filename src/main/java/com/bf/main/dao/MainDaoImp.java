package com.bf.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.main.dto.NoticeDto;
import com.bf.main.dto.RegisterDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
@Component
public class MainDaoImp implements MainDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace = "com.bf.mapper.MainMapper.";

	@Override
	public int register(RegisterDto registerDto) {
		return sqlSession.insert("com.bf.mapper.MainMapper.register", registerDto);
	}

	@Override
	public int noticeMainCount() {
		return sqlSession.selectOne(namespace + "noticeMainCount");
	}
	
	/*@Override
	public int noticeMainCount(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectOne(namespace + "noticeMainCount", map);
	}*/

	
	/*
	@Override
	public List<NoticeDto> noticeMain(int startRow, int endRow) {
		Map<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		
		return sqlSession.selectList("com.bf.mapper.MainMapper.noticeMain", hMap);
	}
	*/
}
