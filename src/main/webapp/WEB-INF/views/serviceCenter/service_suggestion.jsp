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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/service_suggestion.css"
	type="text/css" rel="stylesheet">


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

	<div class="serviceCenter_service_suggestion">
		<div class="serviceCenter_service_suggestion_title">
			서비스 문의
		</div>

		<div class="serviceCenter_service_suggestion_name">
			<div>
				제목<span class="star">*</span>
			</div>
			<div>
				<input type="text" />
			</div>
		</div>

		<div class="serviceCenter_service_suggestion_det">
			<div>
				상세 설명<span class="star">*</span>
			</div>
			<div>
				<textarea></textarea>
			</div>
		</div>

		<div class="serviceCenter_service_suggestion_ex">
			<div class="serviceCenter_service_suggestion_ex_text">
				서비스 제안 이용 동의<span class="star">*</span>
			</div>
			<div class="serviceCenter_service_suggestion_ex_check">
				
					<label class="bf-custom-checkbox">
						<input type="checkbox" />
						<span class="all-mark"></span>
					</label>
				
				<div class="serviceCenter_service_suggestion_ex_check_text">
					<div>서비스 제안 시 제안 내용에 대해 별도로 답변 드리지 않습니다. <br/>답변이 필요한 경우   북팩토리 문의를 이용해 주세요.</div>
				</div>
			</div>
		</div>

		

		<div class="serviceCenter_service_suggestion_file">
			<div class="">첨부 파일</div>
				<div class="serviceCenter_service_suggestion_file_add">
					<label class="bf-custom-checkbox"> <input type="file"
						multiple="true" /> <span class="checkbox-label">파일 추가</span>
					</label>
				</div>
				<div>최대 20MB 크기의 파일을 첨부할 수 있습니다.</div>
			
		</div>


			<div class="serviceCenter_service_suggestion_sub">
				<a class="bf-button" href="#">제출</a>
			</div>
		
	</div>
	
	<jsp:include page="./footer.jsp" />



</body>
</html>