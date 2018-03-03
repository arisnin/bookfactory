<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/header/login.css"/>
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/header/login.js"></script>
</head>
<body>
<!-- 헤더에서 로그인 눌렀을시 나오는 화면 - 염현우 -->
	<c:if test="${login == 'true'}">
		<div id="hw_login" class="hw_login_modal" style="display:block;">
	</c:if>
	<c:if test="${login == null}">
		<div id="hw_login" class="hw_login_modal" onclick="loginClose()">
	</c:if>	
		<div class="hw_login_wrap hw_animate">
			<form class="hw_login_modal-content" name="loginForm" action="${root}/member/loginOk.do" method="post" onsubmit="">
				<div class="hw_login_container">
					<span onclick="$('#hw_login').css('display','none')"class="hw_login_close" title="Close Modal">&times;</span>
					<input type="text" placeholder="아이디" name="username" required style="border-bottom: 0px;">
					<input type="password" placeholder="비밀번호" name="password" required>
					<div class="hw_remember">
						<input class="hw_rem_check" type="checkbox">
						<label class="hw_remember_text" onclick="remCheck()">로그인 상태 유지</label>
						<a class="hw_finder" href="">아이디 찾기</a>
						<a class="hw_finder" href="">비밀번호 찾기</a>
					</div>
					<c:if test="${error != null}">
						<div id="login-message" class="login-message">${error}</div>
					</c:if>
					<div id="login-message" class="login-message" style="display:none;"></div>
					<c:if test="${login == 'true'}">
						<button class="hw_login_button" type="submit">로그인</button>
					</c:if>
					<c:if test="${login == null}">
						<button class="hw_login_button" type="button" onclick="doLogin('${root}')">로그인</button>
					</c:if>					
				</div>
	
				<div class="hw_login_container hw_sign_div" align="center">
					<span class="hw_go_signin">아직 할뚜이따 회원이 아니세요?&nbsp;<b style="color: #0077d9;">회원가입</b></span>
				</div>
				<input type="hidden" name="requestURL" value="${requestURL}"/>
				<input type="hidden" name="returnURL" value="${returnURL}" />
			</form>
		</div>
	</div>
</body>
</html>