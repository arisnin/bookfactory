<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<title>마이팩토리, 마이캐시</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/myRidi.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/payment/ridicash.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/purchasedAll.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/payment/ridipoint.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/payment/ridicashhistorycash.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/rightarrow/css/fontello.css" type="text/css" rel="stylesheet">
</head>
<body>
	
	<div class="myridi-contents-page">
		<section class="wrap-container myridi-purchased-box">
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4">
				<h3>마이캐시</h3>
			</div>
			<!-- 마이캐시 충전  -->
			<div class="bf-service-type-menu">
				<ul class="service-type-list">
					<li><a href="${root}/payment/ridiCash.do">마이캐시 충전</a></li>
					<li><a href="javascript:alert('자동충전 미구현')">자동충전</a></li>
					<li><a class="active" href="${root}/payment/ridiCashHistoryCash.do">충전 내역</a></li>
					<li><a href="javascript:alert('입금 대기 미구현')">입금 대기</a></li>
				</ul>
			</div>
			<div class="mypoint_amount">
				<p class="mypoint_amount_title">
					내 마이캐시
					<span class="total_amount">
						<span>2,000</span>원
					</span>
				</p>
			</div>
			<div class="mypoint_history_table">
				<ul class="mypoint_history_table_title">
					<li class="default">충전일</li>
					<li class="division">구분</li>
					<li class="main_value">충전금액</li>
					<li class="status m-point">적립 포인트</li>
					<li class="default">결제수단</li>
				</ul>
				<ul class="mypoint_history_table_body" onclick="javasciprt:alert('결제내역')">
					<li class="default">2018.01.14 18:52</li>
					<li class="division">마이캐시 충전</li>
					<li class="main_value"><span>2,000</span>원</li>
					<li class="status"><span>60</span>원</li>
					<li class="default">네이버페이<span class = "icon-angle-right"></span></li>
				</ul>
			</div>
		</section>
	</div>
</body>
</html>