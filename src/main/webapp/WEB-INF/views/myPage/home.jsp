<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이리디, 홈</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/home.css" type="text/css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/myPage/myRidi.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/purchasedAll.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/recentLookBook.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
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
				<a class="account-logout-btn" href="${root}/member/logout.do">로그아웃</a>
			</div>
			<!-- 보유 자산 정보 -->
			<div class="home-asset-info-box">
				<ul class="asset-info-list">
					<!-- 마이캐시 -->
					<li class="asset-info-list-item">
						<div class="asset-info" onclick="location.href='${root}/payment/myCashHistoryCash.do'">
							<h4 class="asset-info-title">
								<span class="info-icon material-icons">&#xe90c;</span>
								<span class="info-title-text">마이캐시</span>
							</h4>
							<p class="asset-info-amount">
								<span class="info-amount" id="amount-cash"><fmt:formatNumber value ="${total1}" pattern="#,###"/></span>
								원
							</p>
						</div>
						<div class="asset-more-info">
							<a class="bf-button bf-transparent-btn bf-animated-btn" href="${root}/payment/myCash.do">마이캐시 충전</a>
						</div>
					</li>
					<!-- 마이포인트 -->
					<li class="asset-info-list-item">
						<div class="asset-info" onclick="location.href='${root}/payment/myPoint.do'">
							<h4 class="asset-info-title">
								<span class="info-icon material-icons">&#xe54f;</span>
								<span class="info-title-text">마이포인트</span>
							</h4>
							<p class="asset-info-amount">
								<span class="info-amount" id="amount-point"><fmt:formatNumber value ="${total2}" pattern="#,###"/></span>
								원
							</p>
						</div>
						<div class="asset-more-info mf-point">
							<a class="bf-button bf-transparent-btn" style="pointer-events: none;" href="javascript:alert('소멸 예정')">소멸 예정</a>
							<span class="period-point-sum"><fmt:formatNumber value ="${extinction}" pattern="#,###"/></span>
						</div>
					</li>
					<!-- 쿠폰 -->
					<li class="asset-info-list-item">
						<div class="asset-info" onclick="alert('쿠폰내역(미구현)')">
							<h4 class="asset-info-title">
								<span class="info-icon material-icons">&#xe8b0;</span>
								<span class="info-title-text">쿠폰</span>
							</h4>
							<p class="asset-info-amount">
								<span class="info-amount" id="amount-point">0</span>
								개
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
		<c:if test="${myPagePurchasedPageDtoFiveList.size() > 0}">
			<article class="mf-home-article">
				<div class="bf-title-row title-type3">
					<h3>구매목록<span class="book-count">${total3}</span></h3>
					<div class="more-button-box">
						<button type="button" class="bf-button bf-black-btn bf-animated-btn" onclick="location.href='${root}/library/purchased.do'">전체보기</button>
					</div>
				</div>
				<ul class="mf-book-list">
					<c:forEach var="myPurchasedPageDto" items="${myPagePurchasedPageDtoFiveList}">
						<li class="mf-book-item">
							<div class="mf-book-thumbnail">
								<div class="mf-book-thumbnail-image" onclick ="javascript:bookDetailLink('${root}', '${myPurchasedPageDto.book_num}')">
									<img class="" src="${myPurchasedPageDto.img_path}"/>
								</div>
							</div>
							<div class="mf-book-metadata">
								<h3 class="book-metadata-text" onclick ="javascript:bookDetailLink('${root}', '${myPurchasedPageDto.book_num}')">${myPurchasedPageDto.book_name}</h3>
							</div>
						</li>
					</c:forEach>
				</ul>
			</article>
		</c:if>
		
		<c:if test="${myPagePurchasedPageDtoFiveList.size() == 0}">
			<article class="mf-home-article">
				<div class="bf-title-row title-type3">
					<h3>구매목록<span class="book-count">${total3}</span></h3>
					<div class="more-button-box">
						<button type="button" class="bf-button bf-black-btn bf-animated-btn" onclick="location.href='${root}/library/purchased.do'">전체보기</button>
					</div>
				</div>
				<div class="home-ticket-box">
					<p class="ticket-empty-description">
						구매목록이 없습니다.<br/>
					</p>
				</div>
			</article>
		</c:if>

		<!-- 최근목록 -->
		<c:if test="${myPageRecentPageDtoFiveList.size() > 0}">
			<article class="mf-home-article">
				<div class="bf-title-row title-type3">
					<h3>최근 본 책</h3>
					<div class="more-button-box">
						<button type="button" class="bf-button bf-black-btn bf-animated-btn" onclick="location.href='${root}/library/recentLookBook.do'">전체보기</button>
					</div>
				</div>
				<ul class="mf-book-list">
					<c:forEach var="myRecentPageDto" items="${myPageRecentPageDtoFiveList}">
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
							</div>
						</li>
					</c:forEach>				
				</ul>
			</article>
		</c:if>
		
		<c:if test="${myPageRecentPageDtoFiveList.size() == 0}">
			<article class="mf-home-article">
				<div class="bf-title-row title-type3">
					<h3>최근 본 책</h3>
					<div class="more-button-box">
						<button type="button" class="bf-button bf-black-btn bf-animated-btn" onclick="location.href='${root}/library/recentLookBook.do'">전체보기</button>
					</div>
				</div>
				<div class="home-ticket-box">
					<p class="ticket-empty-description">
						최근 본 책이 없습니다.<br/>
					</p>
				</div>
			</article>
		</c:if>
	</div>
</body>
</html>