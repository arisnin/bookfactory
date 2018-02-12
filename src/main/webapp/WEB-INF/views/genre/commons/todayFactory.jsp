<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Today Recommended book</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/genre/todayFactory.css" type="text/css" rel="stylesheet">
</head>
<body>
	<!-- 오늘의 추천(햄토리의 발견) -->
	<section class="home-main-banner">
		<article class="article-block">
			<h2 class="hidden-block">오늘의 추천(햄토리의 발견)</h2>
			<div class="today-recommended-box">
				<!-- 타이틀 -->
				<div class="today-recommended-title">
					<span class="recommended-title-deco material-icons">all_inclusive</span>
					<span class="recommended-title-text">오늘, 햄토리의 발견</span>
					<span class="recommended-title-deco material-icons">all_inclusive</span>
				</div>
				<!-- 책리스트 -->
				<div class="today-recommended-list" id="today-recommended-list"></div>
			</div>
		</article>
	</section>
	<!-- JavaScript -->
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/genre/todayFactory.js"></script>
	<script type="text/javascript">
		initRecList("today-recommended-list");
	</script>
</body>
</html>