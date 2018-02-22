<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이리디, 책, 구매목록</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/purchased.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="wrap-container">
		<section class="wrap-container mf-purchased-box">
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4">
				<h3>구매목록<span class="book-count">5</span></h3>
			</div>
			
			<!-- 구매 서비스 타입  -->
			<div class="bf-service-type-menu">
				<ul class="service-type-list">
					<li><a class="active" href="javascript:alert('전체')">전체</a></li>
					<li><a href="javascript:alert('구매')">구매</a></li>
					<li><a href="javascript:alert('대여')">대여</a></li>
					<li><a href="javascript:alert('이용권')">이용권</a></li>
				</ul>
				<div class="search-box">
					<form method="get">
						<span class="material-icons">search</span>
						<input class="search-word" type="text" name="search-word" placeholder="책 제목 또는 저자명" />
					</form>
				</div>
			</div>
			<!-- 구매목록 기능  -->
			<div class="purchased-action-box">
				<div class="purchased-action-select">
					<label class="bf-custom-checkbox">
						<input type="checkbox" title="전체선택" onclick="checkAllToggle('.purchased-form-list-box input[type=checkbox]', this.checked)"/>
						<span class="all-mark"></span>
						<span class="checkbox-label">전체선택</span>
					</label>
				</div>
				<div class="purchased-action-button">
					<button class="bf-button bf-white-btn" type="button">영구삭제</button>
					<button class="bf-button" type="button" onclick="alert('미구현 기능입니다.')">다운로드</button>
				</div>
			</div>
			<!-- 구매목록 출력  -->
			<div class="purchased-form-list-box">
				<form name="purchased-form-list" method="post">
					<ul class="mf-book-list">
						<c:forEach var="myPurchasedPageDto" items="${myPagePurchasedPageDtoList}">
						<li class="mf-book-item">
							<div class="mf-book-checkbox">
								<label class="bf-custom-checkbox">
									<input type="checkbox" title="구매목록 책 선택" />
									<span class="all-mark"></span>
								</label>
							</div>
							<div class="mf-book-thumbnail">
								<div class="mf-book-thumbnail-image">
									<img class="" src="//misc.ridibooks.com/cover/111000138/large" alt="image" />
								</div>
							</div>
							<div class="mf-book-metadata">
								<h3 class="book-metadata-text">운현궁의 봄</h3>
								<p class="book-metadata-author">
									<a class="" href="javascript:alert('작가페이지')">김동인</a>
								</p>
							</div>
						</li>
						</c:forEach>
					</ul>
				</form>
			</div>
			<div class="purchased-form-delete-box"></div>
		</section>
	</div>
	<!-- 자바 스크립트 -->
	<script type="text/javascript" src="${root}/script/myPage/myPage.js"></script>
</body>
</html>