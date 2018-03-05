<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" type="text/css"
	href="${root}/css/present/present.css">
<link rel="stylesheet" type="text/css"
	href="${root}/css/present/presentOk.css">
<link rel="stylesheet" type="text/css"
	href="${root}/css/order/order.css">
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
<body>
	<div class="wrap-container" style="margin-top:-2rem;">
		<div class="present_backgroundColor">
			<div>
				<h2 class="present_header">nb211님에게 선물을 보냈습니다.</h2>
				<p class="present_header_text">아이디(nb211)로 김도현 님의 선물을 잘 전송했습니다.
				</p>
				<div class="present_header_img">
					<a><img width="200px" height="300px"
						src="https://misc.ridibooks.com/cover/1932000400/xxlarge"></a>
				</div>
				<div class="present_header_bookName">속자치통감 4권</div>
				<span class="font_16">필원</span>
			</div>
		</div>
		<div class="presentOk_text">
			<div class="presentOk_text_bottom">
				<p class="presentOk_text_letter_img">
					선물 메세지
				</p>
				<!-- <textarea class="presentOk_text_area" disabled="disabled"> 선물 보내는 메세지</textarea>-->
			</div>
			<div class="presentOk_tootip menu_notice_tip">
				<h3>선물 수신 확인</h3>
				<ul>
					<li>선물 받는 분이 선물을 수령하는 순간, 선물을 보낸 분에게 수신 확인 이메일이 자동 발송됩니다.</li>
				</ul>
				<h3>선물 취소</h3>
				<ul>
					<li>선물 받는 분이 선물을 수령한 후에는 구매 취소하거나 환불받을 수 없습니다.</li>
					<li>선물 받는 분이 14일 이내에 선물을 수령하지 않을 경우 구매가 자동 취소됩니다.<br>(휴대폰
						결제, 적립된 포인트를 사용한 경우 제외)
					</li>
				</ul>
			</div>
			<div class="present_bt">
				<button class="order_right_menu_paybutton bf-button bf-animated-btn" onclick="javascript:location.href='${root}/payment/orderhistory.do'">결제내역 보기</button>
			</div>
		</div>
	</div>
</body>
</html>