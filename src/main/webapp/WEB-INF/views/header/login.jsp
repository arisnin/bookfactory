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
	<div id="hw_login" class="hw_login_modal" onclick="loginClose()">
		<div class="hw_login_wrap hw_animate">
			<form class="hw_login_modal-content" action="${root}/member/login.do" method="post" onsubmit="return loginTest()">
				<div class="hw_login_container">
					<span onclick="$('#hw_login').css('display','none')"class="hw_login_close" title="Close Modal">&times;</span>
					<input type="text" placeholder="아이디" name="uname" required style="border-bottom: 0px;">
					<input type="password" placeholder="비밀번호" name="psw" required>
					<div class="hw_remember">
						<input class="hw_rem_check" type="checkbox">
						<label class="hw_remember_text" onclick="remCheck()">로그인 상태 유지</label>
						<a class="hw_finder" href="">아이디 찾기</a>
						<a class="hw_finder" href="">비밀번호 찾기</a>
					</div>
					<button class="hw_login_button" type="submit">로그인</button>
				</div>
	
				<div class="hw_login_container hw_sign_div" align="center">
					<span class="hw_go_signin">아직 할뚜이따 회원이 아니세요?&nbsp;<b style="color: #0077d9;">회원가입</b></span>
				</div>
				<input type="hidden" name="requestURI" value="${pageContext.request.requestURL}"/>
			</form>
		</div>
	</div>
</body>
</html>