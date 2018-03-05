<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Popular List</title>
<c:set var="root" value="${pageContext.request.contextPath}"
	scope="session" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/genre/popularList.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<!-- 테마메뉴:사람들이 지금 많이 읽는 책 -->
	<article class="article-block">
		<h2 class="hidden-block">사람들이 지금 많이 읽고 있는 책</h2>
		<div class="most-popular-box" id="most-popular-box">
			<!-- 타이틀 -->
			<div class="popular-title" onclick="extendMenu()">
				<span> <i class="material-icons" style="font-size: 1.25rem;">update</i>
					<time class="popular-time" datetime="" style="font-weight: bold">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="a hh:mm"/>
					</time> <span class="popular-text">사람들이 최근 많이 구매한 책</span>
				</span> <span class="popular-toggle"> <span>펼쳐보기</span> <span
					class="material-icons">arrow_drop_down</span>
				</span> <span class="popular-toggle" style="display: none;"> <span>접어보기</span>
					<span class="material-icons">arrow_drop_up</span>
				</span>
			</div>
			<!-- 책리스트 -->
			<div class="popular-list" id="popular-list">
				<ul id="popular-ul" class="popular-ul" style="top: 0px">
					<c:forEach items="${pop}" var="popular">
						<li class="popular-li" onclick="location.href='/bookFactory/detail.do?book_num=${popular.book_num}'">
							<h3 class="popular-list-title">${popular.bookName}</h3>
							<p class="popular-list-description">
								<span style="float: left;" onclick="authorDetailHref('${root}','${popular.author_num}')">
									<c:if test="${popular.author_num!=0}">
										${popular.authorName}
									</c:if>
								</span>
								<span style="float: right;">${popular.thirdCate}</span>
							</p>
							<div class="popular-thumbnail">
								<img alt="img"
									src="${popular.img_path}">
							</div>
							<button class="popular-thumbnail-btn" type="button"></button>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</article>
	<!-- JavaScript -->
	<script type="text/javascript"
		src="${root}/script/genre/popularList.js"></script>
	<script type="text/javascript">
		refreshPopularList();
	</script>
</body>
</html>