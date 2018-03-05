<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" scope="application"></c:set>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root}/css/genre/bannerMain.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/genre/bannerMain.js"></script>
</head>
<body>
	<input type="hidden" name="firstCate" value="${firstCate}">
	<article class="article-block home-main-banner" style="width: 100%;">
		<h2 class="hidden-block">메인 홈 갤러리</h2>
		<div class="main-banner-content-box">

			<div class="main-banner-background"></div>
			<ul class="main-banner-content-list" id="content_list">
				<li class="main-banner-content"></li>
				<li class="main-banner-content"></li>
				<li class="main-banner-content"></li>
				<li class="main-banner-content"></li>
				<li class="main-banner-content"></li>
<!-- 				<li class="main-banner-content"></li> -->
			</ul>

			<div class="main-banner-list-box">
				<ul class="main-banner-list" id="serve_list">
					<li class="main-banner-list-item"></li>
					<li class="main-banner-list-item"></li>
					<li class="main-banner-list-item"></li>
					<li class="main-banner-list-item"></li>
					<li class="main-banner-list-item"></li>
<!-- 					<li class="main-banner-list-item"></li> -->
				</ul>

			</div>
		</div>

	</article>
	<div>
		<button type="button" onclick="first()"></button>
	</div>

</body>
</html>