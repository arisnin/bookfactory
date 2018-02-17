package com.bf.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bf.aop.LogAspect;
import com.bf.member.model.MemberDao;
import com.bf.member.model.MemberDto;
import com.bf.member.model.User;

/**
 * @Date 2018. 2. 16.
 * @Author 박성호
 * @Description 로그인 인증(Authentication)/인가(Authorization)를 위한 스프링 시큐리티 유저정보 서비스
 *              구현 클래스
 */
@Service
public class UserDetailServiceImp implements UserDetailsService {
	@Autowired
	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		LogAspect.info("memberDao: " + memberDao);
		MemberDto memberDto = memberDao.getMemberById(username);

		if (memberDto == null) {
			throw new UsernameNotFoundException("No user found with username: " + username);
		}
		LogAspect.info("member Info: " + memberDto);
		List<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority(memberDto.getRole().toUpperCase()));

		return new User(username, memberDto.getPassword(), memberDto, roles);
	}

}
