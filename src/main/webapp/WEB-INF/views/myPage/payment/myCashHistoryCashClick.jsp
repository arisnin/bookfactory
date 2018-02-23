<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>충전 내역 클릭</title>
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
				<li>주문금액</li>
				<li>쿠폰 할인</li>
				<li>포인트 상품권</li>
				<li>리디캐시 사용액</li>
				<li>리디포인트 사용액</li>
				<li>결제수단</li>
				<li>적립 리디포인트</li>
			</ul>
			
			<ul class="orderhistory_rightside">
				<li>${orderDto.order_num}</li>
				<li><a class="title" href="#">${orderDto.cash_type}</a></li>
				<li><strong>${orderDto.price}원</strong></li>
				<li><strong>0원</strong></li>
				<li><strong>0원</strong></li>
				<li><strong>${orderDto.cash_use}원</strong></li>
				<li><strong>${orderDto.point_use}원</strong></li>
				<li>${orderDto.pay_type}</li>
				<li>${orderDto.point}원</li>
			</ul>
		</div>

		<div class="orderhistory_top">
			<button class="bf-button" onclick="javascript:alert('미구현')">영수증 인쇄</button>
			<button class="bf-button" onclick="javascript:alert('네이버페이 결제 건에 대한 신용카드 전표는 (네이버페이 > 결제내역)에서 확인해주세요.')">신용카드 전표 인쇄</button>
			
			<div class="notice">
			<ul class="notice-tip">
				<li class="cancelable">구매 취소는 결제일로부터 7일 이내에 다운로드 또는 스트리밍으로 이용하지 않은 도서만 가능합니다.</li>
				<li class="canceled hidden-block">신용카드, 계좌이체 결제 취소 : 영업일 기준 3~5일이 소요됩니다.</li>
				<li class="canceled hidden-block">휴대폰 결제 취소 : 당월 결제 취소만 가능합니다.</li>
			</ul>
			</div>
		</div>
	</div>
</body>
</html>