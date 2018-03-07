<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/payment/orderhistoryCancel.css">
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
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
				<li>PG결제금액</li>
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
				<li>${orderDto.paytype}</li>
				<li>${orderDto.point}원</li>
			</ul>
		</div>
		<div class="notice">
			<ul class="notice-tip">
				<li class="cancelable">구매 취소는 결제일로부터 7일 이내에 다운로드 또는 스트리밍으로 이용하지 않은 도서만 가능합니다.</li>
				<li class="canceled hidden-block">신용카드, 계좌이체 결제 취소 : 영업일 기준 3~5일이 소요됩니다.</li>
				<li class="canceled hidden-block">휴대폰 결제 취소 : 당월 결제 취소만 가능합니다.</li>
			</ul>
			<button class="bf-button bf-white-btn" onclick="javascript:alert('미구현')">결제 취소</button>
		</div>

		<div class="orderhistory_top">
			<div class="orderhitory_gift">선물 정보</div>
			<div style="overflow: hidden;">
				<ul class="orderhistory_leftside">
					<li>선물 받는 아이디</li>
					<li>선물 메세지</li>
				</ul>
				<ul class="orderhistory_rightside">
					<li>김동수</li>
					<li>나의 책을 받아라!</li>
				</ul>
			</div>
			<div class="orderhistory_resubmit">
				<!-- <label>재전송은 최대 3번만 가능합니다.</label> -->
				<ul class="notice-tip">
					<li>재전송은 최대 3번만 가능합니다.</li>
				</ul>
				<button class="bf-button" onclick="javascript:alert('미구현')">재전송</button>
			</div>
		</div>
	</div>
</body>
</html>