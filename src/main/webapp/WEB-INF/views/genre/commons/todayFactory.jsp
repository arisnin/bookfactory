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
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<script type="text/javascript">
$(function(){
	$(".today-recommended-book").click(function(){
		var booknum=$(this).children("input[name=bookNum]").val();
		location.href="/bookFactory/detail.do?book_num="+booknum;
	});
});
</script>
</head>
<body>
	<!-- 오늘의 추천(햄토리의 발견) -->
	<section class="home-main-banner">
		<article class="article-block">
			<h2 class="hidden-block">오늘의 추천</h2>
			<div class="today-recommended-box">
				<!-- 타이틀 -->
				<div class="today-recommended-title">
					<span class="recommended-title-deco material-icons">all_inclusive</span>
					<span class="recommended-title-text">오늘의 추천도서</span>
					<span class="recommended-title-deco material-icons">all_inclusive</span>
				</div>
				<!-- 책리스트 -->
				<div class="today-recommended-list" id="today-recommended-list">
					<c:forEach var="recom" items="${recomList}">
						<div class="today-recommended-book" style="opacity: 1;" onmouseover="mouseoverBook(this)" onmouseout="mouseoutBook(this)">
							<input type="hidden" name="bookNum" value="${recom.book_num}">
							<div class="book-spotlight" style="opacity: 0;"></div>
							<div class="book-thumbnail-wrap">
								<div class="recommended-book-metadata">
									<p>
										<c:if test="${recom.author_num!=0}">
											${recom.authorName}
										</c:if>
										<br>${recom.bookName}
									</p>
								</div>
								<span class="trigger-block hidden-block" onclick="createStarIcon(this.nextElementSibling,${recom.star_point})"></span>
								<div class="content-star-rate">
									<span class="star-icon-field material-icons">star_border</span><span class="non-star-icon-field material-icons"></span>
									<span class="count-field"> ${recom.star_count}명</span>
								</div>
								<div class="recommended-book-thumbnail">
									<img alt="img" src="${recom.img_path}"/>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</article>
	</section>
	
	<script type="text/javascript" src="${root}/script/genre/todayFactory.js"></script>
	<script type="text/javascript">
      Array.prototype.forEach.call(document.querySelectorAll(".trigger-block"), function(e,i) {
         e.click();
      });
   </script>
</body>
</html>