<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session"/>
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/myPage.css" type="text/css" rel="stylesheet">
</head>
<body>
	<!-- 헤더 -->
	<div>
		<tiles:insertAttribute name="header" />
	</div>

	<!-- 콘텐츠 -->
	<div style="margin-top: 2rem;">
		<div id="myfactory-contents-box">
			<!-- 네비게이션 메뉴 영역 -->
			<div class="myfactory-left-menu">
				<tiles:insertAttribute name="navigation" />
			</div>
			<!-- 메뉴 콘텐츠 영역 -->
			<div class="myfactory-contents-page">
				<tiles:insertAttribute name="content" />
			</div>
		</div>
	</div>

	<hr class="line">
	
	<!-- 푸터 -->
	<div style="margin-top:2rem;clear:both;">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>