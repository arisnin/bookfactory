<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<title>마이리디, 마이포인트</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/myRidi.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/home.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/payment/purchasedAll.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/payment/ridipoint.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="myridi-contents-page">
		<section class="wrap-container myridi-purchased-box">
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4">
				<h3>마이포인트</h3>
			</div>
			<!-- mypoint_amount -->
			<div class="mypoint_amount">
				<p class="mypoint_amount_title">
					내 마이포인트
					<span class="total_amount">
						<span>60</span>원
					</span>
				</p>
				<div>
					<p class="expiring_amount_title">
					<img class="exclamation_mark_icon" src="${root}/img/exclamationmark.png" >
					소멸 예정
					<span class="expiring_amount">
						<span>0</span>원
					</span>
				</p>
				</div>
			</div>
			<!-- mypoint_history_table -->
			<div class="mypoint_history_table">
				<ul class="mypoint_history_table_title">
					<li class="default">적립일</li>
					<li class="division">적립 수단</li>
					<li class="main_value m-point">적립 포인트</li>
					<li class="status">소멸일시</li>
					<li class="default">상태</li>
				</ul>
				<ul class="mypoint_history_table_body">
					<li class="default">2018.01.14 18:52</li>
					<li class="division">마이캐시 충전 보너스 마이포인트</li>
					<li class="main_value"><span>60</span>원</li>
					<li class="status">-</li>
					<li class="default">-</li>
				</ul>
			</div>		
		</section>
	</div>
</body>
</html>