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
<link href="${root}/css/serviceCenter/id_login_content.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</title>
</head>
<body>


	<jsp:include page="./main_header.jsp" />

	<div class="service_information_cn">

		<div class="service_FAQ_home_header">
			<div class="service_FAQ_home_header_left">
				<span>
				<a href="${root }/serviceCenter/main.do">리디북스 고객센터</a></span>
					<span>></span>
					<a href="${root }/serviceCenter/id_login.do">아이디 / 로그인</a>
				
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

		<div class="service_information_cn_cn">
		
			<div class="service_information_cn_cn_left">
				
					<div class="service_information_cn_cn_left_title">이 섹션의 문서</div>
					<ul>
						<li><a href="${root }/serviceCenter/id_login_content.do">회원가입은 어떻게 하나요? 회원가입을 꼭 해야하나요?</a></li>
						<li>아이디(ID), 비밀번호를 잊어버렸어요.</li>
						<li>회원정보 변경은 어떻게 하나요?</li>
						<li>아이디(ID)나 이름 정보 변경이 가능한가요?</li>
						<li>성인인증 제한 나이는 어떻게 되나요?</li>
						<li>회원탈퇴는 어떻게 하나요?<li>	
					</ul>					
			</div>
			
						
			<div class="service_information_cn_cn_right">
				<div class="service_information_cn_title">
					회원가입은 어떻게 하나요? 회원가입을 꼭 해야하나요?					
				</div>
		
						<div>
						<p>회원가입은 PC의 인터넷 또는 모바일 기기에서 <span>리디북스 홈페이지(리디리디)를 통하여 가능합니다.</span>
						<br/><br/>
						
						(PC에서는 우측 상단의 [회원가입]버튼을 통하여, 모바일에서는 리디북스 서점 우측 상단의 [로그인]버튼을 누른 후 로그인 페이지 하단에 [회원가입]메뉴를 확인하실 수 있습니다.)
						<br/><br/>
						
						리디북스 애플리케이션에서는 회원가입이 제한되어 있으며, 리디북스 홈페이지에서만 가입이 가능합니다.
						<br/><br/>
						
						또한 결제(구매, 대여, 리디캐시 충전), 스크랩(독서노트)정보 저장 등을 위하여 반드시 회원가입 후 로그인하여 이용하여 주시기 바랍니다.
						</p>
						
						
						

						
						
						</div>
					</div>
			
			

		</div>

	</div>

</body>
</html>