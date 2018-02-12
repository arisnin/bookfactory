<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이리디, 책, 신간알림</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/payment/coupon.css" type="text/css" rel="stylesheet">
<style type="text/css">
</style>
</head>
<body>
	<div class="wrap-container">
		<section class="wrap-container mf-coupon-box">
			<!-- mf-notice-center-box -->
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4">
				<h3>쿠폰</h3>
			</div>
			<!-- 메뉴(서비스타입) -->
			<div class="bf-service-type-menu line-bottom">
				<ul class="service-type-list f-left">
					<li><a class="active" href="javascript:alert('사용가능')">사용가능<span class="book-count">2</span></a></li>
					<li><a href="javascript:alert('기만만료')">사용완료/기간만료<span class="book-count">1</span></a></li>
				</ul>
				<button type="button" class="bf-button" onclick="couponRegistDialog()">
					<span class="material-icons">add</span>
					쿠폰 등록
				</button>
			</div>
			<!-- 쿠폰 내역 -->
			<div class="history-list-box">
				<div class="row header">
					<div class="col15">등록일</div>
					<div class="col20">쿠폰명</div>
					<div class="col20">혜택</div>
					<div class="col20">사용조건</div>
					<div class="col15">사용기한</div>
					<div class="col10">선물</div>
				</div>
				<ul class="history-list">
					<li>
						<div class="row">
							<div class="col15"><span class="register-date">2018.01.03</span></div>
							<div class="col20"><span class="title">신규 가입 축하</span></div>
							<div class="col20"><span class="effect">포인트 상품권 1,000원</span></div>
							<div class="col20"><span class="requirement">4,000원 이상 도서 결제 시</span></div>
							<div class="col15"><span class="expiry-date">2018.01.10 23:59 까지</span></div>
							<div class="col10"><span class="present-coupon">-</span></div>
						</div>
					</li>
					<li>
						<div class="row">
							<div class="col15"><span class="register-date">2018.01.03</span></div>
							<div class="col20"><span class="title">신규 가입 축하</span></div>
							<div class="col20"><span class="effect">포인트 상품권 1,000원</span></div>
							<div class="col20"><span class="requirement">4,000원 이상 도서 결제 시</span></div>
							<div class="col15"><span class="expiry-date">2018.01.10 23:59 까지</span></div>
							<div class="col10"><span class="present-coupon">-</span></div>
						</div>
					</li>
				</ul>
			</div>
		</section>
		
		<!-- Coupon Registration Dialog -->
		<div id="regist-coupon-dialog" class="coupon-dialog">

			<!-- Modal content -->
			<div class="content">
				<span class="close" onclick="closeRegistDialog()">&times;</span>
				<h2 class="title">쿠폰 등록</h2>
				<p class="sub-title">쿠폰 번호를 입력하세요!</p>
				<div class="register-input">
					<form action="#">
						<input class="register-number" type="text" maxlength="20" placeholder="일련번호 20자리를 입력해주세요." spellcheck="false" />
						<button type="submit" class="bf-button">등록</button>
					</form>
				</div>
				<ul class="notice" style="list-style: initial;">
					<li>쿠폰 등록 후 기간, 혜택, 사용조건 등을 꼭 확인하세요.</li>
					<li>북팩토리 쿠폰은 등록 시 바로 사용할 수 있습니다.</li>
					<li>쿠폰번호 등록 시, 하이픈('-')은 안 넣으셔도 됩니다.</li>
					<li><strong>알파벳 O와 숫자 0을 명확히 구분하여 입력하세요.</strong></li>
				</ul>
			</div>

		</div>
	</div>
	<!-- 자바 스크립트 -->
	<script type="text/javascript">
		var modal = document.getElementById('regist-coupon-dialog');
		function couponRegistDialog() {
		    modal.style.display = "block";
		}
		
		function closeRegistDialog() {
		    modal.style.display = "none";
		}
		
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
	</script>
</body>
</html>