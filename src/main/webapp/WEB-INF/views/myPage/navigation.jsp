<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>My RIDI, Navigation</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/navigation.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div id="bf-myridi-container" class="wrap-container">
		<h3 class="myridi-title">마이팩토리</h3>
		<nav class="myridi-menu-navi">
			<div class="myridi-menu-section">
				<a class="myridi-menu-title item-link" href="${root}/myPage/home.do" title="home">
					<span class="material-icons">home</span>
					<span class="menu-title-text">마이팩토리 홈</span>
				</a>
			</div>
			<!-- 메뉴:책 -->
			<div class="myridi-menu-section">
				<h4 class="myridi-menu-title">
					<span class="material-icons">import_contacts</span>
					<span class="menu-title-text">책</span>
				</h4>
				<ul class="myridi-menu-list">
					<li class="menu-list-item"><a class="item-link" href="${root}/library/purchased.do" title="purchased">구매목록</a></li>
					<li class="menu-list-item"><a class="item-link" href="${root}/library/noticeCenter.do">알림센터</a></li>
					<li class="menu-list-item"><a class="item-link" href="${root}/library/newRelease.do">신간알림</a></li>
					<li class="menu-list-item"><a class="item-link" href="${root}/library/nearbyRead.do">최근 본 책</a></li>
					<li class="menu-list-item"><a class="item-link" href="${root}/library/preferBook.do">연재 선호작품</a></li>
				</ul>
			</div>
			<!-- 메뉴:구매/혜택 -->
			<div class="myridi-menu-section">
				<h4 class="myridi-menu-title">
					<span class="material-icons">credit_card</span>
					<span class="menu-title-text">구매/혜택</span>
				</h4>
				<ul class="myridi-menu-list">
					<li class="menu-list-item"><a class="item-link" href="${root}/payment/orderhistory.do">결제내역</a></li>
					<li class="menu-list-item"><a class="item-link" href="${root}/payment/myCash.do">마이캐시</a></li>
					<li class="menu-list-item"><a class="item-link" href="${root}/payment/myPoint.do">마이포인트</a></li>
					<li class="menu-list-item"><a class="item-link" href="${root}/payment/coupon.do">쿠폰</a></li>
					<li class="menu-list-item"><a class="item-link" href="${root}/payment/freepassTicket.do">이용권 관리</a></li>
				</ul>
			</div>
			<!-- 메뉴:개인 -->
			<div class="myridi-menu-section">
				<h4 class="myridi-menu-title">
					<span class="material-icons">person</span>
					<span class="menu-title-text">개인</span>
				</h4>
				<ul class="myridi-menu-list">
					<li class="menu-list-item"><a class="item-link" href="javascript:alert('1:1문의 준비중')">1:1 문의</a></li>
					<li class="menu-list-item"><a class="item-link" href="javascript:alert('내 기기 관리 준비중')">내 기기 관리</a></li>
					<li class="menu-list-item"><a class="item-link" href="${root}/personal/myReview.do">내 리뷰 관리</a></li>
					<li class="menu-list-item"><a class="item-link" href="${root}/personal/myInfoCheck.do">정보변경</a></li>
				</ul>
			</div>
		</nav>
	</div>
</body>
</html>