<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<input type="hidden" name="count" value="${updateCount}"/>
	<c:set var="count" value="${updateCount}"/>
	<c:set var="orderListSize" value="${orderList.size()}"/>
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
						<c:forEach var="item" items="${orderList}">
							<li class="item">
								<fmt:formatNumber var="discount" value="${item.discount}" pattern="###" />
								<fmt:formatNumber var="discount2" value="${item.discount2}" pattern="###" />
								<fmt:formatNumber var="price" value="${item.price * (100 - discount) * (100 - discount2) / 10000}" pattern="###" />
								<fmt:formatNumber var="price" value="${price + (100 - (price % 100)) % 100}" pattern="###" />
								<span class="title"><strong class="main-style">${item.book_name}</strong>${item.author_name}</span>
								<span class="price">${price}</span>
								<c:set var="totalPrice" value="${totalPrice == 0 ? price : totalPrice + price}"/>
							</li>
						</c:forEach>
					</ul>
					<ul class="list total">
						<li class="item total">
							<span class="title">총${count == null ? orderListSize : count}권</span>
							<span class="price main-style">${totalPrice}원</span>
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