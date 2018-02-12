<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Factory, Main Page</title>
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/myPage.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div id="myfactory-contents-box">
		<!-- 네비게이션 메뉴 영역 -->
		<div class="myfactory-left-menu">
			<jsp:include page="/WEB-INF/views/myPage/navigation.jsp" />
		</div>
		<!-- 메뉴 콘텐츠 영역 -->
		<div class="myfactory-contents-page">
			<%-- <jsp:include page="/WEB-INF/view${param.myPage}"/> --%>
			<c:if test="${param.myPage == null}">
				<jsp:include page="/WEB-INF/views/myPage/home.jsp" />
			</c:if>
			<c:if test="${param.myPage != null}">
				<jsp:include page="/WEB-INF/views${param.myPage}" />
			</c:if>
		</div>
	</div>
	<!-- End : myfactory-contents-box -->
</body>
</html>