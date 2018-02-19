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
<link href="${root}/css/serviceCenter/inquriy_list.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</title>
</head>
<body>


	<jsp:include page="./main_header.jsp" />
	
	
	
	<div class="serviceCenter_inquriy_list">

		<div class="bf-title-row title-type1">
				<h2>문의 내역</h2>
			</div>

		<div class="serviceCenter_inquriy_list_search">

			<div class="service_header_second">
				<div class="bf-service-type-menu">
					<div class="search-box">
						<form method="get">
							<span class="material-icons">search</span> <input
								class="search-word" type="text" name="search-word"
								placeholder="요청 검색" />
						</form>
					</div>
				</div>
			</div>

			<div class="serviceCenter_inquriy_list_search_cd">
				<div class="serviceCenter_inquriy_list_search_cd_text">상태</div>
				<div>
					<select>
						<option>모든 상태</option>
						<option>접수완료</option>
						<option>처리중</option>
						<option>답변완료</option>
					</select>
				</div>
			</div>
		</div>

		<div class="serviceCenter_inquriy_list_list">
			<div class="serviceCenter_inquriy_list_title">
				<div>제목</div>
				<div>등록일</div>
				<div>상태</div>
			</div>
			
			<div class="serviceCenter_inquriy_list_answer">
				<div><a href="${root }/serviceCenter/inquriy_answer.do">내용내용</a></div>
				<div>2018년 1월 1일</div>
				<div class="answer">답변완료</div>
			</div>
		</div>

	</div>

</body>
</html>