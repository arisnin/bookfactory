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

<title>고객센터_문의하기</title>
</head>
<body>
	

	<jsp:include page="./main_header.jsp" />
	
	<div class="service_FAQ_home">

		<div class="service_FAQ_home_header">
			<div class="service_FAQ_home_header_left">
				<span> <a
					href="${root }/serviceCenter/main.do">북팩토리 고객센터</a>
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



		<div class="service_FAQ_home_content">
			<div class="service_FAQ_home_content_title">
				문의 등록
			</div>
			<div class="service_FAQ_home_content_category">
				<a class="bf-button"
					href="${root }/serviceCenter/inquriy.do">북팩토리 문의</a>
				<!--<a class="bf-button"
					href="${root }/serviceCenter/service_suggestion.do">서비스
					제안</a>-->
				<a class="bf-button"
					href="${root }/serviceCenter/book_suggestion.do">도서
					제안</a>
			</div>
		</div>

		<div class="service_FAQ_home_footer">
			<div class="service_FAQ_home_footer_content">
				<span>고객님의 문의에 대해서는 24시간 내 답변드리고 있으나 주말, 공휴일 문의는 답변이 지연 될 수
					있는 점 양해 부탁드립니다.</span>
				<ul class="service_FAQ_home_footer_content_list">
					<li>전화번호 : 국내 1644-0331 해외 82-2-3453-0331</li>
					<li>운영시간 : 평일 10:00 ~ 19:00 (점심시간 : 12:50 ~ 14:00) 주말, 공휴일 휴무
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />

</body>
</html>