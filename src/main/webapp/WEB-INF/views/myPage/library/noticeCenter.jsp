<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이리디, 책, 알림센터</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/noticeCenter.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
</head>
<body>
	<div class="wrap-container">
		<section class="wrap-container mf-notice-center-box">
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4">
				<h3>알림센터</h3>
			</div>
			<!-- 알림리스트 -->
			<ul class="mf-book-list list-landscape" id="search-view-type">
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//misc.ridibooks.com/cover/1519000053/large" alt="image" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<p class="book-metadata-description"><strong>김도현</strong> 님이 보낸 <strong>&lt;삼국지 1 - 도원결의&gt;</strong> 선물이 도착했습니다. (<strong>2018년 2월 6일 16시 16분</strong>까지 수령 가능)</p>
						<span class="notice-time">5</span>
					</div>
				</li>
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//active.ridibooks.com/ridibooks_noti_icon/icon_noti_coupon.png" alt="image" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<p class="book-metadata-description">뉴스레터 수신 동의 고객님, <strong>알림으로도 10% 할인 쿠폰</strong>을 받으세요! <strong>알림을 누르면, 즉시 등록됩니다!</strong> (※ 단, 메일 등을 통해 이미 쿠폰을 받으신 경우, 중복 발급되지 않습니다.)</p>
						<span class="notice-time">5</span>
					</div>
				</li>
				<li class="mf-book-item">
					<div class="mf-book-thumbnail">
						<div class="mf-book-thumbnail-image">
							<img class="" src="//misc.ridibooks.com/cover/945038386/large" alt="image" />
						</div>
					</div>
					<div class="mf-book-metadata">
						<p class="book-metadata-description">신간알림 | <strong>형상준의 신간 &lt;책을 읽으면 경험이 쌓여!&gt;</strong>가 출간되었습니다.</p>
						<span class="notice-time">5</span>
					</div>
				</li>
				<li class="mf-book-item"></li>
			</ul>
		</section>
	</div>
	<!-- 자바 스크립트 -->
	<script type="text/javascript" src="${root}/script/myPage/myPage.js"> </script>
</body>
</html>