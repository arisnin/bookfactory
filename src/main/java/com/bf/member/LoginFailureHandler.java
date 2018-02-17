package com.bf.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;

import com.bf.aop.LogAspect;

/**
 * @Date 2018. 2. 18.
 * @Author 박성호
 * @Description 
 */
public class LoginFailureHandler implements AuthenticationFailureHandler {

	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException authenticationException) throws IOException, ServletException {
		LogAspect.info("requestURL:" + request.getParameter("requestURL"));
		
		String targetUrl = "/member/login.do?error=true";
		
		Object exp = request.getSession().getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
		if (exp != null) request.getSession().removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");
		
		if ("ajax".equalsIgnoreCase(request.getParameter("requestURL"))) {
			// 메인페이지에서의 doModal 타입의 로그인 폼인 경우
			response.setContentType("application/json;charset=UTF-8");
			String data = StringUtils.join(new String[] { " { \"response\" : {", " \"error\" : " , "true" , ", ", " \"message\" : \"", "Invalid username or password." , "\" ", "} } " });
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
			return;
		}
		
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

}
