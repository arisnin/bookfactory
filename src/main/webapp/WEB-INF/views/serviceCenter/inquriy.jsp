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
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="${root}/css/serviceCenter/inquriy.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root }/script/serviceCenter/serviceCenter.js"></script>

<title>Insert title here</title>
</head>
<body>

	<jsp:include page="./main_header.jsp" />
	
			
	<div class="service_FAQ_home_header">
		<div class="service_FAQ_home_header_left">
			<span>
				<a href="${root }/serviceCenter/main.do">북팩토리 고객센터</a>
			</span>
			<span>></span><span>문의등록</span>
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

	
	<div class="serviceCenter_inquriy">
		<form action = "${root }/serviceCenter/inquriyOk.do" method="post"
		enctype="multipart/form-data" onsubmit="return inquriy(this)">
		
		<div class="serviceCenter_inquriy_title">
			북팩토리 문의
		</div>

		
		<div class="serviceCenter_inquriy_name">
			<div>제목<span class="star">*</span></div>
			<div>
				<input name="title" type="text" />
			</div>
		</div>

		<div class="serviceCenter_inquriy_det">
			<div>상세 설명<span class="star">*</span></div>
			<div>
				<textarea name="content"></textarea>
			</div>
		</div>

		<div class="serviceCenter_inquriy_ex">
			<div>질문 유형<span class="star">*</span></div>
			<div>
				<select name="category">
					<option value="-">-</option>
					<option value="100">아이디/로그인</option>
					<option value="101">결제/환불</option>
					<option value="102">이용문의</option>
					<option value="103">오류/활용</option>
					<option value="104">시스템업데이트</option>
					<option value="105">서비스제안</option>					
					<option value="106">기타</option>
				</select>
			</div>
		</div>
		
		<!-- 
		<div class="serviceCenter_inquriy_call">
			<div>연락 수단<span class="star"></span></div>
			<div class="serviceCenter_inquriy_call_list">
				<select name="call">
					<option>-</option>
					<option value="이메일">이메일</option>
					<option value="문자">문자</option>
					<option value="전화">전화</option>
				</select>
			</div>
			<div>안내 받으실 방법을 선택해 주세요.</div>
			<div class="serviceCenter_inquriy_call_email">
				<div>회신 이메일 : dongssu@nate.com</div>
				<div class="serviceCenter_inquriy_call_email_change">
					<a class="bf-button bf-transparent-btn bf-animated-btn" href="#">변경하기</a>
				</div>
			</div>
		</div>		
		 -->

		<div class="serviceCenter_inquriy_file">
			<div>첨부 파일</div>
			<div class="serviceCenter_inquriy_file_add">
				<label class="bf-custom-checkbox"> <input type="file" name="file"/>				
					<span class="checkbox-label">파일 추가</span>
				</label>
			</div>
			<div>최대 20MB 크기의 파일을 첨부할 수 있습니다.</div>
		</div>		
		

		<div class="serviceCenter_inquriy_sub">
			<input type="submit" class="bf-button" value="제출하기"/>
		</div>
		</form>
		</div>
		
		
		<jsp:include page="./footer.jsp" />
		



</body>
</html>