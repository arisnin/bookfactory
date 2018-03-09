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
	<div id="hw_login" class="hw_login_modal " ${login == 'true' ? 'style="display:block;"' : 'onclick="loginClose()"'}>	
		<div class="hw_login_wrap hw_animate">
			<form class="hw_login_modal-content" name="loginForm" action="${root}/member/loginOk.do" method="post" onsubmit="">
				<div class="hw_login_container">
					<c:if test="${login == null }">
						<span onclick="$('#hw_login').css('display','none')"class="hw_login_close" title="Close Modal">&times;</span>
					</c:if>
					<input onkeyup="loginEnterCheck()" type="text" placeholder="아이디" name="username" required style="border-bottom: 0px;">
					<input onkeyup="loginEnterCheck()" type="password" placeholder="비밀번호" name="password" required>
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
						<button id="hw_login_btn" class="hw_login_button" type="submit">로그인</button>
					</c:if>
					<c:if test="${login == null}">
						<button id="hw_login_btn" class="hw_login_button" type="button" onclick="doLogin('${root}')">로그인</button>
					</c:if>					
				</div>
	
				<div class="hw_login_container hw_sign_div" align="center">
					<span class="hw_go_signin">아직 북팩토리 회원이 아니세요?&nbsp;<button type="button" class="bf-button bf-transparent-btn" style="color:#776BCE;" onclick="loginToRegister(this)">회원가입</button></span>
				</div>
				<input type="hidden" name="requestURL" value="${requestURL}"/>
				<input type="hidden" name="returnURL" value="${returnURL}" />
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function loginEnterCheck() {
			event.preventDefault();
		    if (event.keyCode === 13) {
		        document.getElementById("hw_login_btn").click();
		    }
		}
		
		function loginToRegister(active) {
			$('#hw_login').css('display','none');
			goRegister();
		}
	</script>
</body>
</html>