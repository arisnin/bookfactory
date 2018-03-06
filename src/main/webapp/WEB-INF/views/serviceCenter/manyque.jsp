<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet" />
<link href="${root}/css/serviceCenter/manyque.css" type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/FAQ.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript" src="${root }/script/serviceCenter/serviceCenter.js"></script>


<title>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</title>
</head>
<body>


	<jsp:include page="./main_header.jsp" />

	<div class="serviceCenter_manyque">

		<div class="service_FAQ_home_header">
			<div class="service_FAQ_home_header_left">
				<span><a
					href="${root }/serviceCenter/main.do">리디북스 고객센터</a>
				</span>
				<span>></span>
				리디북스 자주 묻는 질문
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

		<div class="serviceCenter_manyque_content">
			<div class="serviceCenter_manyque_right">
				<div class="serviceCenter_manyque_title">
					북팩토리 자주 묻는 질문
				</div>

				<div class="serviceCenter_manyque_list">
					<c:forEach var="questionDto" items="${questionList }"	>
						<div><a href="javascript:questionRead('${root}','${questionDto.num}')">${questionDto.title}</a></div>
					</c:forEach>				
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp" />
	
	

</body>
</html>