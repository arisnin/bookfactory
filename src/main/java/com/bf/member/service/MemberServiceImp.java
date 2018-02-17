package com.bf.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.member.model.MemberDao;

/**
 * @Date 2018. 2. 16.
 * @Author 박성호
 * @Description 
 */
@Component
public class MemberServiceImp implements MemberService {
	@Autowired
	private MemberDao memberDao;

}
