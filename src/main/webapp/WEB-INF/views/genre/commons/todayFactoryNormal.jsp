<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Today Recommended book</title>
<c:set var="root" value="${pageContext.request.contextPath}"
	scope="session" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/genre/todayFactory.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/genre/todayFactoryNormal.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
</head>
<body>
	<!-- 오늘의 추천(햄토리의 발견) -->
	<section class="home-normal-banner">
		<article class="article-block">
			<h2 class="hidden-block">오늘의 추천</h2>
			<div class="today-recommended-box">
				<!-- 타이틀 -->
				<div class="today-recommended-title">
					<span class="recommended-title-deco material-icons">all_inclusive</span>
					<span class="recommended-title-text">오늘의 추천도서</span> <span
						class="recommended-title-deco material-icons">all_inclusive</span>
				</div>
				<!-- 책리스트 -->
				<div class="today-recommended-list"
					id="today-recommended-list-normal">
					<c:forEach var="HomeDto" items="${homeList}">
						<div class="today-recommended-book" style="opacity: 1;">
							<div class="book-spotlight" style="opacity: 0;"></div>
							<div class="book-thumbnail-wrap">
								<div class="recommended-book-metadata">
									<p>
										${HomeDto.authorName }<br>${HomeDto.bookName}
									</p>
								</div>
								<div class="content-star-rate">
									<span class="star-icon-field material-icons">star_border</span><span
										class="non-star-icon-field material-icons"></span><span
										class="count-field"> 9999명</span>
								</div>
								<div class="recommended-book-thumbnail">
<!-- 									<img alt="img" -->
<!-- 										src="https://i.pinimg.com/736x/ff/9e/1e/ff9e1ee425118020df5323c87a82a6c7--reading-nooks-book-nooks.jpg"> -->
									<img alt="img" src="${HomeDto.img_path}"/>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</article>
	</section>
	<!-- JavaScript -->
	<%-- 	<script type="text/javascript" src="${root}/script/genre/todayFactory.js"></script>
	<script type="text/javascript">
		initRecList("today-recommended-list-normal");
	</script> --%>
</body>
</html>