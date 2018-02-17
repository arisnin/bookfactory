package com.bf.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.util.StringUtils;

import com.bf.aop.LogAspect;

/**
 * @Date 2018. 2. 17.
 * @Author 박성호
 * @Description
 */
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private String targetUrlParam;
	private String defaultUrl;
	private boolean useReferer;
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	public LoginSuccessHandler() {
		targetUrlParam = "";
		defaultUrl = "/";
		useReferer = false;
	}

	public String getTargetUrlParam() {
		return targetUrlParam;
	}

	public void setTargetUrlParam(String targetUrlParam) {
		this.targetUrlParam = targetUrlParam;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	public boolean isUseReferer() {
		return useReferer;
	}

	public void setUseReferer(boolean useReferer) {
		this.useReferer = useReferer;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		
		Object user = authentication.getDetails();
		String targetUrl = "";
		
		LogAspect.info("RequestURL:"+request.getParameter("requestURL"));
		
		clearAuthenticationAttributes(request);
		
		request.getSession().setAttribute("userInfo", user);
		
		if (redirectAjax(request, response)) return;
		
		switch (routingRedirectStrategy(request, response)) {
		case 1:
			targetUrl = executeTargetUrl(request, response);
			break;
		case 2:
			targetUrl = executeSessionUrl(request, response);
			break;
		case 3:
			targetUrl = executeRefererUrl(request, response);
			break;
		default:
			targetUrl = executeDefaultUrl(request, response);
		}
		
		LogAspect.info("user: " + user);
		LogAspect.info("defaultUrl: " + defaultUrl);
		LogAspect.info("refererUrl: " + request.getHeader("referer"));
		LogAspect.info("redirectUrl: " + (requestCache.getRequest(request, response) == null ? "null" : requestCache.getRequest(request, response).getRedirectUrl()));
		LogAspect.info("redirectUrl: " + request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST"));
		LogAspect.info("targetUrl: " + request.getParameter(targetUrlParam));
		LogAspect.info("targetUrl: " + targetUrl);
		
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	private void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		if (session == null) return;
		
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

	private int routingRedirectStrategy(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		String refererUrl = request.getHeader("referer");
		if (useReferer && StringUtils.hasText(refererUrl)) {
			result = 3;
		}
		
		if (savedRequest != null) {
			result = 2;
		}
		
		if (!"".equals(targetUrlParam)) {
			String targetUrl = request.getParameter(targetUrlParam);
			
			if (StringUtils.hasText(targetUrl)) {
				result = 1;
			}
		}
		
		return result;
	}

	private String executeDefaultUrl(HttpServletRequest request, HttpServletResponse response) {
		return defaultUrl;
	}

	private String executeRefererUrl(HttpServletRequest request, HttpServletResponse response) {
		return request.getHeader("referer");
	}

	private String executeSessionUrl(HttpServletRequest request, HttpServletResponse response) {
		return requestCache.getRequest(request, response).getRedirectUrl();
	}

	private String executeTargetUrl(HttpServletRequest request, HttpServletResponse response) {
		if (requestCache.getRequest(request, response) != null) {
			requestCache.removeRequest(request, response);
		}
		return request.getParameter(targetUrlParam);
	}
	
	private boolean redirectAjax(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LogAspect.info("requestURL:" + request.getParameter("requestURL"));
		if ("ajax".equalsIgnoreCase(request.getParameter("requestURL"))) {
			// 메인페이지에서의 doModal 타입의 로그인 폼인 경우
			response.setContentType("application/json;charset=UTF-8");
			String data = org.apache.commons.lang.StringUtils.join(new String[] { " { \"response\" : {", " \"error\" : " , "false" , ", ", " \"message\" : \"", "Loggin success." , "\" ", "} } " });
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
			return true;
		}
		return false;
	}

}
