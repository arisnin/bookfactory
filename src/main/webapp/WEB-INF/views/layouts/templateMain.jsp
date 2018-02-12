<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북팩토리</title>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css">
</head>
<body>
	<!-- 헤더 -->
	<div>
		<tiles:insertAttribute name="header" />
	</div>

	<!-- 콘텐츠 -->
	<div style="margin-top:2rem;">
		<tiles:insertAttribute name="body" />
	</div>

	<hr class="line">
	
	<!-- 푸터 -->
	<div style="margin-top:2rem;">
		<tiles:insertAttribute name="footer" />
	</div>
	
</body>
</html>