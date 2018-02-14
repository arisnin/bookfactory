<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css"
	rel="stylesheet" />
<link href="${root}/css/serviceCenter/id_login.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</title>
</head>
<body>


	<jsp:include page="${root }/serviceCenter/main_header.jsp" />


	<div class="service_information">

		<div class="service_FAQ_home_header">
			<div class="service_FAQ_home_header_left">
				<span> <a
					href="${root }/serviceCenter/main.jsp">리디북스 고객센터</a></span>
					<span>></span>
									
					아이디 / 로그인
			</div>


			<div class="service_FAQ_home_header_right">
				<div class="bf-service-type-menu">
					<div class="search-box">
						<form method="get">
							<span class="material-icons">search</span> <input
								class="search-word" type="text" name="search-word"
								placeholder="검색" />
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="service_information_content">
			<div class="service_information_content_right">
				<div class="service_information_title">
					아이디 / 로그인
				</div>

				<div class="service_information_list">
					<div><a href="${root }/serviceCenter/id_login_content.jsp">회원가입은 어떻게 하나요? 회원가입을 꼭 해야하나요?</a></div>
					<div>아이디(ID), 비밀번호를 잊어버렸어요.</div>
					<div>회원정보 변경은 어떻게 하나요?</div>
					<div>아이디(ID)나 이름 정보 변경이 가능한가요?</div>
					<div>성인인증 제한 나이는 어떻게 되나요?</div>
					<div>회원탈퇴는 어떻게 하나요?</div>					
				</div>
			</div>

		</div>





	</div>

</body>
</html>