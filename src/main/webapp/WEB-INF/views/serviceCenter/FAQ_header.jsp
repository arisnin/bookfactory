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
<link href="${root}/css/serviceCenter/main.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>고객센터_문의하기</title>
</head>
<body>

	<div class="service_FAQ_home_header">
		<div class="service_FAQ_home_header_left">
			<span>
				<a href="${root }/serviceCenter/main.jsp">북팩토리 고객센터</a>
			</span>
			<span>
				 > 문의등록
			</span>
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
</body>
</html>