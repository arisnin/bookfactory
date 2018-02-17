package com.bf.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @Date 2018. 2. 16.
 * @Author 박성호
 * @Description
 */
@Component
public class MemberDaoImp implements MemberDao {
	private final String namespace = "com.bf.mapper.MemberMapper.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public MemberDto getMemberById(String username) {
		return sqlSession.selectOne(namespace + "select-member", username);
	}
}
