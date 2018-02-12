<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이리디, 홈</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/home.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="wrap-container">
		<h2 class="hidden-block">마이팩토리 홈</h2>
		<!-- 기본정보(계정, 보유캐시/포인트/쿠폰) -->
		<article class="mf-home-article mf-home-header">
			<!-- 계정 정보 -->
			<div class="home-account-info-box">
				<div class="account-info">
					<h3 class="account-info-id">eclipse</h3>
					<p class="account-info-email">eclipse@naver.com</p>
				</div>
				<a class="account-logout-btn" href="javascript:alert('로그아웃');">로그아웃</a>
			</div>
			<!-- 보유 자산 정보 -->
			<div class="home-asset-info-box">
				<ul class="asset-info-list">
					<!-- 마이캐시 -->
					<li class="asset-info-list-item">
						<div class="asset-info" onclick="alert('캐시히스토리')">
							<h4 class="asset-info-title">
								<span class="info-icon material-icons">&#xe90c;</span>
								<span class="info-title-text">마이캐시</span>
							</h4>
							<p class="asset-info-amount">
								<span class="info-amount" id="amount-cash">0</span>
								원
							</p>
						</div>
						<div class="asset-more-info">
							<a class="bf-button bf-transparent-btn bf-animated-btn" href="javascript:alert('캐시충전')">마이캐시 충전</a>
						</div>
					</li>
					<!-- 마이포인트 -->
					<li class="asset-info-list-item">
						<div class="asset-info" onclick="alert('포인트내역')">
							<h4 class="asset-info-title">
								<span class="info-icon material-icons">&#xe54f;</span>
								<span class="info-title-text">마이포인트</span>
							</h4>
							<p class="asset-info-amount">
								<span class="info-amount" id="amount-point">0</span>
								원
							</p>
						</div>
						<div class="asset-more-info mf-point">
							<a class="bf-button bf-transparent-btn" style="pointer-events: none;" href="javascript:alert('소멸 예정')">소멸 예정</a>
							<span class="period-point-sum">0</span>
						</div>
					</li>
					<!-- 쿠폰 -->
					<li class="asset-info-list-item">
						<div class="asset-info" onclick="alert('쿠폰내역')">
							<h4 class="asset-info-title">
								<span class="info-icon material-icons">&#xe8b0;</span>
								<span class="info-title-text">쿠폰</span>
							</h4>
							<p class="asset-info-amount">
								<span class="info-amount" id="amount-point">0</span>
								원
							</p>
						</div>
						<div class="asset-more-info">
							<a class="bf-button bf-transparent-btn bf-animated-btn" href="javascript:alert('쿠폰등록')">쿠폰등록</a>
						</div>
					</li>
				</ul>
			</div>
		</article>

		<!-- 옵션 -->
		<article class="mf-home-article"></article>

		<!-- 정기이용권 -->
		<article class="mf-home-article">
			<div class="bf-title-row title-type3">
				<h3>사용중인 이용권</h3>
			</div>
			<div class="home-ticket-box">
				<p class="ticket-empty-description">
					사용중인 이용권이 없습니다.<br />
				</p>
				<a class="bf-button bf-transparent-btn bf-animated-btn" href="javascript:alert('자유이용권이란?')">자유이용권 알아보기</a>
			</div>
		</article>

		<!-- 구매목록 -->
		<article class="mf-home-article">
			<div class="bf-title-row title-type3">
				<h3>구매목록<span class="book-count">5</span></h3>
				<div class="more-button-box">
					<button type="button" class="bf-button bf-black-btn bf-animated-btn">전체보기</button>
				</div>
			</div>
			<ul class="mf-book-list">
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//misc.ridibooks.com/cover/111000138/large" alt="image" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<p class="book-metadata-text">운현궁의 봄</p>
					</div>
				</li>
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//misc.ridibooks.com/cover/111014017/large" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<p class="book-metadata-text">추리 스릴러 길라잡이</p>
					</div>
				</li>
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//misc.ridibooks.com/cover/682000659/large" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<p class="book-metadata-text">[체험판] 데프 보이스</p>
					</div>
				</li>
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//misc.ridibooks.com/cover/945012245/large" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<p class="book-metadata-text">책을 읽으면 경험이 쌓여! 1화</p>
					</div>
				</li>
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//misc.ridibooks.com/cover/3026000001/large" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<p class="book-metadata-text">이스닐다 1화</p>
					</div>
				</li>
			</ul>
		</article>

		<!-- 최근목록 -->
		<article class="mf-home-article">
			<div class="bf-title-row title-type3">
				<h3>최근 본 책</h3>
				<div class="more-button-box">
					<button type="button" class="bf-button bf-black-btn bf-animated-btn">전체보기</button>
				</div>
			</div>
			<ul class="mf-book-list">
				<li class="mf-book-item">
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
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//misc.ridibooks.com/cover/111014017/large" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<h3 class="book-metadata-text">추리 스릴러 길라잡이</h3>
						<p class="book-metadata-author">
							<a class="" href="javascript:alert('작가페이지')">리디북스 콘텐츠팀</a>
						</p>
					</div>
				</li>
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//misc.ridibooks.com/cover/682000659/large" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<h3 class="book-metadata-text">[체험판] 데프 보이스</h3>
						<p class="book-metadata-author">
							<a class="" href="javascript:alert('작가페이지')">마루야마 마사키</a>
						</p>
					</div>
				</li>
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//misc.ridibooks.com/cover/945012245/large" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<h3 class="book-metadata-text">책을 읽으면 경험이 쌓여! 1화</h3>
						<p class="book-metadata-author">
							<a class="" href="javascript:alert('작가페이지')">형상준</a>
						</p>
					</div>
				</li>
			</ul>
		</article>
	</div>
</body>
</html>