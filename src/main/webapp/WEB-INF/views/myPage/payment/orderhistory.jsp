<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/payment/orderhistoryCancel.css">
<link rel="stylesheet" type="text/css" href="${root}/css/fontello-af6ab2f4/css/fontello.css">
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
</head>
<body>
	<div class="orderhistory">
		<div class="bf-title-row title-type4">
			<h3>결재 내역</h3>
		</div>

		<div class="content">
			<div class="orderhistorysub1">
				<ul>
					<li>구매일</li>
					<li class="title">결재내역</li>
					<li class="price">주문금액</li>
					<li class="method">결재수단</li>
				</ul>
			</div>
			<c:forEach begin="1" end="4">
				<div class="orderhistorysub2" onclick="javascript:location.href='${root}/payment/orderhistoryClick.do'">
					<ul>
						<li>2017.12.25.14:14</li>
						<li class="title">블록체인 혁명(대여)</li>
						<li class="price content">0원</li>
						<li class="method">리디캐시</li>
						<li class="icon-angle-right" style="width: 3rem"></li>
					</ul>
				</div>
			</c:forEach>
			<div class="orderhistorysub2 cancel" onclick="javascript:location.href='${root}/payment/orderhistoryCancel.do'">
				<ul>
					<li>2017.12.25.14:14</li>
					<li class="title">블록체인 혁명(대여)</li>
					<li class="price">0원</li>
					<li class="method">리디캐시(취소됨)</li>
					<li class="icon-angle-right" style="width: 3rem"></li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>