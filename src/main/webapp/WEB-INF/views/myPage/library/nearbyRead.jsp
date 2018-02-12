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
<link href="${root}/css/myPage/library/nearbyRead.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="myridi-contents-page myridi-nearbyRead-box">
		<section class="wrap-container myridi-purchased-box">
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4">
				<h3>최근 본 책</h3>
			</div>
			<div class="purchased-action-button">
				<button class="bf-button bf-white-btn" type="button" onclick="javascript:alert('최근 본 책 전체삭제 미구현')">전체 삭제</button>
			</div>
		</section>
		<!-- 최근 본 책 목록 -->
		<div class="purchased-form-list-box">
			<form name="purchased-form-list" method="post">
				<ul class="ridi-book-list">
					<li class="ridi-book-item">
						<div class="ridi-book-thumbnail">
							<div class="ridi-book-thumbnail-image" onclick="javascript:alert('해당 도서 페이지 미구현')">
								<a class="ridi-book-thumbnail-link" href="javascript:alert('책 페이지')"><img class="" src="//misc.ridibooks.com/cover/111000138/large" alt="image" /></a>
							</div>
						</div>
						<div class="ridi-book-metadata">
							<h3 class="book-metadata-text">
								<a href="javascript:alert('책 페이지')">운현궁의 봄</a>
							</h3>
							<p class="book-metadata-author">
								<a class="book_metadata-author-link" href="javascript:alert('작가페이지')">김동인</a>
							</p>
							<p class="book-metadata-publisher">
								<a class="book-metadata-publisher-link" href="javascript:alert('출판사페이지')">문학사상</a>
							</p>
							<div class="content-star-rate">
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span> <span class="count-field"> 5명</span>
							</div>
						</div>
					</li>
					<li class="ridi-book-item">
						<div class="ridi-book-thumbnail">
							<div class="ridi-book-thumbnail-image" onclick="javascript:alert('해당 도서 페이지 미구현')">
								<img class="" src="//misc.ridibooks.com/cover/111014017/large" />
							</div>
						</div>
						<div class="ridi-book-metadata">
							<h3 class="book-metadata-text">
								<a href="javascript:alert('책 페이지')">추리 스릴러 길라잡이</a>
							</h3>
							<p class="book-metadata-author">
								<a class="book_metadata-writter" href="javascript:alert('작가페이지')">리디북스 콘텐츠팀</a>
							</p>
							<p class="book-metadata-publisher">
								<a class="book-metadata-publisher-link" href="javascript:alert('출판사페이지')">리디북스</a>
							</p>
							<div class="content-star-rate">
								<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
								<!-- 카운팅 숫자 표시는 필요없으면 빼도 됨 -->
								<span class="count-field"> 3명</span>
							</div>						</div>
					</li>
					<li class="ridi-book-item">
						<div class="ridi-book-thumbnail">
							<div class="ridi-book-thumbnail-image" onclick="javascript:alert('해당 도서 페이지 미구현')">
								<img class="" src="//misc.ridibooks.com/cover/682000659/large" />
							</div>
						</div>
						<div class="ridi-book-metadata">
							<h3 class="book-metadata-text">
								<a href="javascript:alert('책 페이지')">[체험판] 데프 보이스</a>
							</h3>
							<p class="book-metadata-author">
								<a class="book_metadata-writter" href="javascript:alert('작가페이지')">마루야마 마사키</a>
							</p>
							<p class="book-metadata-publisher">
								<a class="book-metadata-publisher-link" href="javascript:alert('출판사페이지')">황금가지</a>
							</p>
							<div class="content-star-rate">
								<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
								<!-- 카운팅 숫자 표시는 필요없으면 빼도 됨 -->
								<span class="count-field"> 19명</span>
							</div>
						</div>
					</li>
					<li class="ridi-book-item">
						<div class="ridi-book-thumbnail">
							<div class="ridi-book-thumbnail-image" onclick="javascript:alert('해당 도서 페이지 미구현')">
								<img class="" src="//misc.ridibooks.com/cover/945012245/large" />
							</div>
						</div>
						<div class="ridi-book-metadata">
							<h3 class="book-metadata-text">
								<a href="javascript:alert('책 페이지')">책을 읽으면 경험이 쌓여! 1화</a>
							</h3>
							<p class="book-metadata-author">
								<a class="book_metadata-writter" href="javascript:alert('작가페이지')">형상준</a>
							</p>
							<p class="book-metadata-book-count">
								<span class="book-count-num">총420화</span> <span class="series_complete"> <span class="svg_badge_complete_1">완결</span>
								</span>
							</p>
							<p class="book-metadata-publisher">
								<a class="book-metadata-publisher-link" href="javascript:alert('출판사페이지')">에피루스</a>
							</p>
							<div class="content-star-rate">
								<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
								<!-- 카운팅 숫자 표시는 필요없으면 빼도 됨 -->
								<span class="count-field"> 298명</span>
							</div>
						</div>
					</li>
					<li class="ridi-book-item">
						<div class="ridi-book-thumbnail">
							<div class="ridi-book-thumbnail-image" onclick="javascript:alert('해당 도서 페이지 미구현')">
								<img class="" src="//misc.ridibooks.com/cover/3026000001/large" />
							</div>
						</div>
						<div class="ridi-book-metadata">
							<h3 class="book-metadata-text">
								<a href="javascript:alert('책 페이지')">이스닐다 1화</a>
							</h3>
							<p class="book-metadata-author">
								<a class="book_metadata-writter" href="javascript:alert('작가페이지')">리모란</a>
							</p>
							<p class="book-metadata-book-count">
								<span class="book-count-num">총 77화</span>
							</p>
							<p class="book-metadata-publisher">
								<a class="book-metadata-publisher-link" href="javascript:alert('출판사페이지')">로즈엔</a>
							</p>
							<div class="content-star-rate">
								<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
								<!-- 카운팅 숫자 표시는 필요없으면 빼도 됨 -->
								<span class="count-field"> 111명</span>
							</div>
						</div>
					</li>
				</ul>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/jquery/jquery.js"></script>
	<script type="text/javascript">
		document.querySelectorAll(".content-star-rate").forEach(function(item, index) {
			createStarIcon(item, 3.7);
		});
	</script>
</body>
</html>