<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/payment/orderhistoryCancel.css">
</head>
<body>
	<div class="orderhistory">
		<div class="bf-title-row title-type4">
			<h3>결재 내역</h3>
		</div>

		<div class="history-content">
			<ul class="orderhistory_leftside">
				<li>주문번호</li>
				<li>구분</li>
				<li>취소일</li>
				<li>주문금액</li>
				<li>쿠폰/포인트 상품권 사용액</li>
				<li>환불금액</li>
				<li>리디캐시</li>
				<li>리디포인트</li>
				<li>PG결제금액</li>
				<li>결제수단</li>
			</ul>
			<ul class="orderhistory_rightside">
				<li>2018011539796034<span class="notice-highliht">취소됨</span></li>
				<li><a class="title" href="#">앨리스 죽이기</a></li>
				<li><span>2018.01.18 13:34</span></li>
				<li><strong>0원</strong></li>
				<li><strong>0원</strong></li>
				<li><strong>0원</strong></li>
				<li><strong>0원</strong></li>
				<li><strong>0원</strong></li>
				<li><strong>0원</strong></li>
				<li>리디캐시</li>
			</ul>
		</div>
		<div class="notice">
			<ul class="notice-tip">
				<li class="cancelable hidden-block">구매 취소는 결제일로부터 7일 이내에 다운로드 또는 스트리밍으로 이용하지 않은 도서만 가능합니다.</li>
				<li class="canceled ">신용카드, 계좌이체 결제 취소 : 영업일 기준 3~5일이 소요됩니다.</li>
				<li class="canceled ">휴대폰 결제 취소 : 당월 결제 취소만 가능합니다.</li>
			</ul>
			<button class="bf-button bf-white-btn hidden-block" onclick="javascript:alert('미구현')">결제 취소</button>
		</div>
	</div>
</body>
</html>