<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet" />
<link href="${root}/css/serviceCenter/inquriy_list.css" type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/FAQ.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script type="text/javascript" src="${root }/script/serviceCenter/serviceCenter.js"></script>

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

			
		</div>

		<div class="serviceCenter_inquriy_list_list">
			<div class="serviceCenter_inquriy_list_title">
				<div>제목</div>
				<div>등록일</div>
				<div>상태</div>
			</div>
						
			<c:if test="${count==0 }">
				<div>
					<div>검색된 요청이 없습니다.</div>
				</div>
			</c:if>
			
			<c:if test="${count>0 }">
				<c:forEach var="BoardContactDto" items="${inquriyList }">
					<div class="serviceCenter_inquriy_list_answer">
						<div><a href="javascript:inquriyRead('${root}','${BoardContactDto.num}')">${BoardContactDto.title}</a></div>
						<div><fmt:formatDate value="${BoardContactDto.write_date}" pattern="yyyy-MM-dd" /></div>
						<c:if test="${BoardContactDto.reply_check==null }">
					<div class="answer">접수완료</div>
					</c:if>					
					<c:if test="${BoardContactDto.reply_check!=null }">
					<div class="answer_complete">답변완료</div>
					</c:if>
						
					</div>
				</c:forEach>
			</c:if>			
			
		</div>

	</div>
	
	<jsp:include page="./footer.jsp" />

</body>
</html>