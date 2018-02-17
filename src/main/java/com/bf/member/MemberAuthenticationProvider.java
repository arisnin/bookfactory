package com.bf.member;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.bf.aop.LogAspect;
import com.bf.member.model.User;
import com.bf.member.service.UserDetailServiceImp;

/**
 * @Date 2018. 2. 16.
 * @Author 박성호
 * @Description
 */
@Component
public class MemberAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	private UserDetailsService userService;

	public void setUserService(UserDetailsService userService) {
		this.userService = userService;
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		Collection<? extends GrantedAuthority> authorities;
		String username = authentication.getName();
		String password = (String) authentication.getCredentials();
		User user;
		
		try {
			LogAspect.info("REQUEST Username:" + username + " / Password:" + password);
			
			user = (User) userService.loadUserByUsername(username);

			LogAspect.info("REQUIRE Username:" + user.getUsername() + " / Password:" + user.getPassword());

			if (!password.equals(user.getPassword())) throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");

			authorities = user.getAuthorities();

		} catch (UsernameNotFoundException e) {
			LogAspect.info(e.toString());
			throw new UsernameNotFoundException(e.getMessage());
		} catch (BadCredentialsException e) {
			LogAspect.info(e.toString());
			throw new BadCredentialsException(e.getMessage());
		} catch (Exception e) {
			LogAspect.info(e.toString());
			throw new RuntimeException(e.getMessage());
		}
		
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(username, password, authorities);
		result.setDetails(user);
		return result;
	}

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return true;
	}

}
