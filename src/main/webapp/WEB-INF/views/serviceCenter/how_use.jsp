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
<link href="${root}/css/serviceCenter/pay_refund.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</title>
</head>
<body>


	<jsp:include page="./main_header.jsp" />

	<div class="service_information">

		<div class="service_FAQ_home_header">
			<div class="service_FAQ_home_header_left">
				<span> <a
					href="${root }/serviceCenter/main.do">리디북스 고객센터</a></span>
					<span>></span>
									
					이용문의
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
					이용문의
				</div>

				<div class="service_information_list">
					<div><a href="${root }/serviceCenter/how_use_content.do">종이책으로 배송이 되나요?</a></div>
					<div>정호열이 정호열이 정호열</div>
					<div>호열이 호열이 호열이 호열이</div>
					<div>호여뤼 호여뤼 호여뤼 호여뤼 호호여뤼</div>					
				</div>
			</div>

		</div>





	</div>

</body>
</html>