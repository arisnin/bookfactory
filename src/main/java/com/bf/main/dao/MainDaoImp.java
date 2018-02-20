package com.bf.main.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.main.dto.RegisterDto;
import com.bf.member.model.MemberDto;

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
	public int register(MemberDto memberDto) {
		return sqlSession.insert(namespace + "register", memberDto);
	}

	@Override
	public String idCheck(String id) {
		return sqlSession.selectOne(namespace + "id-check", id);
	}
}
