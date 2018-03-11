<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유이용권</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/payment/freepassTicket.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<script type="text/javascript">alert('준비중입니다.');</script>
	<div class="wrap-container">
		<section class="wrap-container mf-freepass-ticket-box">
			<!-- mf-notice-center-box -->
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4">
				<h3>이용권 관리</h3>
			</div>
			<!-- 이용권 관리-->
			<article class="ticket-management">
				<!-- 판타지 이용권 -->
				<div class="ticket-box f-left">
					<div class="wrap-container">
						<div class="title">
							<span class="material-icons">payment</span>
							판타지 자유이용권
							<span class="badge-icon">ON</span>
						</div>
						<div class="description">
							<span class="text active">자유이용권을 사용중입니다.</span>
							<a class="bf-button bf-white-btn bf-animated-btn f-right" href="#">구매하기</a>
						</div>
					</div>
				</div>
				<!-- 코믹 이용권 -->
				<div class="ticket-box f-right">
					<div class="wrap-container">
						<div class="title">
							<span class="material-icons">payment</span>
							만화 자유이용권
							<span class="badge-icon">OFF</span>
						</div>
						<div class="description">
							<span class="text">자유이용권이 없습니다.</span>
							<a class="bf-button bf-white-btn bf-animated-btn f-right" href="#">구매하기</a>
						</div>
					</div>
				</div>
			</article>
			
			<hr class="line">
			
			<!-- 타이틀 -->
			<div class="bf-title-row title-type3 ticket-history">
				<h3>이용권 사용내역</h3>
			</div>
			<!-- 이용권 사용내역 -->
			<div class="history-list-box">
				<div class="row header">
					<div class="col30"><span>종류</span></div>
					<div class="col25"><span>구입일</span></div>
					<div class="col25"><span>만료일</span></div>
					<div class="col20"><span>상태</span></div>
				</div>
				<ul class="history-list">
					<li>
						<div class="row">
							<div class="col30"><span>만화 자유이용권</span></div>
							<div class="col25 start-date"><span>2017.12.15</span></div>
							<div class="col25 end-date"><span>2018.01.15</span></div>
							<div class="col20"><span>만료</span></div>
						</div>
					</li>
					<li>
						<div class="row">
							<div class="col30"><span>판타지 자유이용권</span></div>
							<div class="col25 start-date"><span>2018.01.03</span></div>
							<div class="col25 end-date"><span>2018.02.03</span></div>
							<div class="col20"><span>사용중</span></div>
						</div>
					</li>
					<li>
						<div class="row">
							
						</div>
					</li>
				</ul>
			</div>
		</section>
	</div>
</body>
</html>