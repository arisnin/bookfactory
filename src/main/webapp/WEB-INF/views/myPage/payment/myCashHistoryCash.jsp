<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="${root}/css/myPage/payment/mycash.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/purchasedAll.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/payment/mypoint.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/payment/mycashhistorycash.css" type="text/css" rel="stylesheet">
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
					<li><a href="${root}/payment/myCash.do">마이캐시 충전</a></li>
					<li><a href="javascript:alert('자동충전 미구현')">자동충전</a></li>
					<li><a class="active" href="${root}/payment/myCashHistoryCash.do">충전 내역</a></li>
					<li><a href="javascript:alert('입금 대기 미구현')">입금 대기</a></li>
				</ul>
			</div>
			<div class="mypoint_amount">
				<p class="mypoint_amount_title">
					내 마이캐시
					<span class="total_amount">
						<span><fmt:formatNumber value = "${total}" pattern="#,###"/></span>원
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
				<c:forEach var="myPageCashPageDto" items="${myPageCashPageDtoList}">
				<ul class="mypoint_history_table_body" onclick="${root}/myCashHistoryCashClick.do">
					<li class="default"><fmt:formatDate value = "${myPageCashPageDto.charge_date}" pattern="yyyy.MM.dd hh:mm"/></li>
					<li class="division">${myPageCashPageDto.cash_type}</li>
					<li class="main_value"><span><fmt:formatNumber value = "${myPageCashPageDto.charge_cash}" pattern="#,###"/></span>원</li>
					<li class="status"><span>${myPageCashPageDto.point}</span>원</li>
					<li class="default"><span class = "icon-angle-right">${myPageCashPageDto.charge_type}</span></li>
				</ul>
				</c:forEach>
			</div>
		</section>
	</div>
</body>
</html>