<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/order/orderOk.css">
<link rel="stylesheet" type="text/css" href="${root}/css/order/order.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
</head>
<body>
	<div class="orderOK">
		<div class="left-menu">
			<div class="margin">
				<span class="orderOk-icon">
					<i class="material-icons main-style">check_circle</i>
				</span>
				<span class="orderOk-text main-style">구매가 완료되었습니다.</span>
			</div>
			<div class="margin">
				<div class="orderOk-box">
					<ul class="list content">
						<!-- 구매목록 아이템(li) 추가 영역 -->
						<li class="item">
							<span class="title"><strong class="main-style">콘텐츠 4.0: 4차산업혁명과 콘텐츠의 미래</strong>한국콘텐츠진흥원</span>
							<span class="price">3000원</span>
						</li>
						<li class="item">
							<span class="title"><strong class="main-style">문제적 결혼 1권</strong>정희경</span>
							<span class="price">2500원</span>
						</li>
						<li class="item">
							<span class="title"><strong class="main-style">바람만이 아는 대답 1</strong>안정원</span>
							<span class="price">0원</span>
						</li>
						<li class="item">
							<span class="title"><strong class="main-style">개정판 | 왕좌의 게임: 얼음과 불의 노래 제1부</strong>조지 R. R. 마틴</span>
							<span class="price">25000원</span>
						</li>
						<li class="item">
							<span class="title"><strong class="main-style">개정판 | 왕들의 전쟁: 얼음과 불의 노래 제2부</strong>조지 R. R. 마틴</span>
							<span class="price">25000원</span>
						</li>
					</ul>
					<ul class="list total">
						<li class="item total">
							<span class="title">총5권</span>
							<span class="price main-style">55500원</span>
						</li>
					</ul>
				</div>
			</div>
			<div style="padding-bottom: 1rem;">
				<button class="purchased-btn bf-button bf-animated-btn main-style" onclick="javascript:location.href='${root}/library/purchased.do'">구매목록</button>
			</div>
		</div>

		<!-- 		<div> -->
		<!-- 			<div> -->
		<!-- 				<button class="bf-button">책 다운로드></button> -->
		<!-- 			</div> -->
		<!-- 			<div> -->
		<!-- 				<p>windows용 리디북스 뷰어로 읽어보세요.</p> -->
		<!-- 				<a>뷰어 다운로드</a> -->
		<!-- 			</div> -->
		<!-- 			<div> -->
		<!-- 				<div> -->
		<!-- 					<h2>스마트폰, 태블릿, PC에서도 볼 수 있습니다.</h2> -->
		<!-- 					<div>iPhone, iPad, Android, Windows, macOS에서도 리디북스 책을 즐길 수 -->
		<!-- 						있습니다.</div> -->
		<!-- 					<div>iOS|Android|Windows|macOS</div> -->
		<!-- 				</div> -->
		<!-- 				<div> -->
		<!-- 					<button class="bf-button">뷰어 다운로드 안내</button> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</div> -->
	</div>
</body>
</html>