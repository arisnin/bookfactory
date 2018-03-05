<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>마이리디, 최근 본 책</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/myRidi.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/purchasedAll.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/recentLookBook.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
</head>
<body>
	<div class="myridi-contents-page myridi-nearbyRead-box">
		<section class="wrap-container myridi-purchased-box">
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4">
				<h3>최근 본 책</h3>
			</div>
			<div class="purchased-action-button">
				<button class="bf-button bf-white-btn" type="button" onclick="allDelete()">전체 삭제</button>
			</div>
		</section>
		<!-- 최근 본 책 목록 -->
		<div class="purchased-form-list-box">
			<form name="purchased-form-list" method="post" action="${root}/library/recentLookBookDelete.do">
				<ul class="ridi-book-list">
					<c:forEach var="myRecentPageDto" items="${myPageRecentPageDtoList}">
					<li class="ridi-book-item">
						<div class="ridi-book-thumbnail">
							<div class="ridi-book-thumbnail-image" onclick="javascript:bookDetailLink('${root}', '${myRecentPageDto.book_num}')">
								<img class="" src="${myRecentPageDto.img_path}"/>
							</div>
						</div>
						<div class="ridi-book-metadata">
							<h3 class="book-metadata-text" onclick ="javascript:bookDetailLink('${root}', '${myRecentPageDto.book_num}')">${myRecentPageDto.book_name}</h3>
							<p class="book-metadata-author">
								<a class="book_metadata-author-link" href="javascript:authorDetailHref('${root}', '${myRecentPageDto.author_num}')">${myRecentPageDto.author_name}</a>
							</p>
							<p class="book-metadata-publisher">
								<a class="book-metadata-publisher-link" href="javascript:alert('출판사페이지')">문학사상</a>
							</p>
							<div class="content-star-rate">
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span> <span class="count-field">${myRecentPageDto.star_count}</span>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript">
		document.querySelectorAll(".content-star-rate").forEach(function(item, index) {
			createStarIcon(item, 3.7);
		});
		
		function allDelete(){
			$("form[name=purchased-form-list]").submit();
			
			var cf = confirm("최근 본 책 목록을 삭제하시겠습니까?");
			if(cf == false){
				$(location).attr("href", "${root}/library/recentLookBook.do");
			}else if(cf==true){
				alert("hello");
			}
			if(cf == null){
				alert("최근 본 책이 없습니다.");
			}
		}
	</script>
</body>
</html>