<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이리디, 책, 신간알림</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/newRelease.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<div class="wrap-container">
		<section class="wrap-container mf-new-release-box">
			<!-- mf-notice-center-box -->
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4">
				<h3>신간알림</h3>
			</div>
			<!-- 메뉴(서비스타입) -->
			<div class="bf-service-type-menu">
				<ul class="service-type-list">
					<li><a class="active" href="javascript:alert('작가')">작가</a></li>
					<li><a href="javascript:alert('시리즈')">시리즈</a></li>
					<li><a href="javascript:alert('추천')">추천</a></li>
					<li><a href="javascript:alert('알림설정')">알림설정</a></li>
				</ul>
			</div>
			<!-- 메뉴(정렬기준) -->
			<div class="bf-service-type-menu">
				<ul class="order-type-list">
					<li><a class="active" href="#">최근 출간순</a></li>
					<li><a href="#">가나다순</a></li>
				</ul>
			</div>
			<!-- 알림리스트 -->
			<ul class="mf-book-list list-landscape" id="search-view-type">
				<li class="mf-book-item">
					<div class="author">
						<a class="bf-button bf-transparent-btn" href="#">형상준<span class="other-name"></span></a>
					</div>
					<div class="delete">
						<button type="button" class="bf-button bf-white-btn">삭제</button>
					</div> <!-- 최근 신작 3개까지만 표시(최신이 맨 아래) -->
					<div class="book">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="alert('상세페이지')">
								<img class="" src="//misc.ridibooks.com/cover/2200018396/large" alt="image" />
							</div>
						</div>
						<p class="title">낙방학사</p>
						<p class="release-date">2017.12.28</p>
					</div>
					<div class="book">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="alert('상세페이지')">
								<img class="" src="//misc.ridibooks.com/cover/945031321/large" alt="image" />
							</div>
						</div>
						<p class="title">무당제자</p>
						<p class="release-date">2017.12.28</p>
					</div>
					<div class="book">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="alert('상세페이지')">
								<img class="" src="//misc.ridibooks.com/cover/945038386/large" alt="image" />
							</div>
						</div>
						<p class="title">책을 읽으면 경험이 쌓여!</p>
						<p class="release-date">2018.01.19</p>
					</div>
				</li>
				
				<li class="mf-book-item">
					<div class="author">
						<a class="bf-button bf-transparent-btn" href="#">조앤.K.롤링<span class="other-name">Joan K. Rowling</span></a>
					</div>
					<div class="delete">
						<button type="button" class="bf-button bf-white-btn">삭제</button>
					</div> <!-- 최근 신작 3개까지만 표시(최신이 맨 아래) -->
					<div class="book">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="alert('상세페이지')">
								<img class="" src="//misc.ridibooks.com/cover/2200018396/large" alt="image" />
							</div>
						</div>
						<p class="title">낙방학사</p>
						<p class="release-date">2017.12.28</p>
					</div>
					<div class="book">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="alert('상세페이지')">
								<img class="" src="//misc.ridibooks.com/cover/945031321/large" alt="image" />
							</div>
						</div>
						<p class="title">무당제자</p>
						<p class="release-date">2017.12.28</p>
					</div>
					<div class="book">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="alert('상세페이지')">
								<img class="" src="//misc.ridibooks.com/cover/2409003900/large" alt="image" />
							</div>
						</div>
						<p class="title">개정판 | Harry Potter and the Cursed Child - Parts One and Two</p>
						<p class="release-date">2017.09.05</p>
					</div>
				</li>
				
				<li class="mf-book-item"></li>
			</ul>
		</section>
	</div>
	<!-- 자바 스크립트 -->
	<script type="text/javascript" src="${root}/script/myPage/myPage.js">
		
	</script>
</body>
</html>