<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" type="text/css" href="${root}/css/order/order.css">
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/payment/ridicash.css">
<link rel="stylesheet" type="text/css" href="${root}/css/present/present.css">
<link rel="stylesheet" type="text/css" href="${root}/css/present/presentPay.css">
</head>
<body>
	<div class="wrap-container" style="margin-top:-2rem;">
		<div class="present_backgroundColor">
			<div>
				<h2 class="present_header">전자책 선물로 마음을 전하세요!</h2>
				<p class="present_header_text">
					좋은 책을 나누는 즐거움<br>문자, 이메일을 통해 간편하게 전자책을 선물하세요!
				</p>
				<div class="present_header_img">
					<a><img width="200px" height="300px" src="https://misc.ridibooks.com/cover/1932000400/xxlarge"></a>
				</div>
				<div class="present_header_bookName">속자치통감 4권</div><span class="font_16">필원</span>
			</div>
		</div>
		<div class="presentPay wrap-container">
			<div class="presentPay_header">
				<div class="bf-title-row title-type2 presentPay_header_receiver">
					<h2 style="text-align: left;">선물 받는 분</h2>
				</div>
				<div class="presentPay_leftContent">
					<ul>
						<li>보내는 방법</li>
						<li>아이디</li>
					</ul>
					<ul>
						<li>리디북스 아이디</li>
						<li>nb211</li>
					</ul>
				</div>
			</div>
			<div class="order_right_menu">
				<div class="bf-title-row title-type1" style="float: left;">
					<h2>결제정보</h2>
				</div>
				<div class="order_right_menu_list first-line">
					<span>총 주문금액</span> <span class="right-item total">0원</span>
				</div>

				<div class="order_right_menu_list">
					<span style="padding-top: 0.1rem">할인 쿠폰</span> <span
						class="right-item">0원</span>
				</div>

				<div class="order_right_menu_list">
					<span>포인트 상품권</span> <span class="right-item">0원</span><br>
					<div class="order_right_menu_list_point">
						<!-- <span class="order_right_menu_pointintro">신규가입축하|1000원|3일</span> -->
						<!-- <span class="right-item"><button class="bf-button">변경</button></span> -->
					</div>
				</div>

				<div class="order_right_menu_list">
					<span>리디포인트</span> <span class="right-item">0원</span>
				</div>

				<div class="order_right_menu_list">
					<span>리디캐시</span>
					<button class="bf-button bf-white-btn">?</button>
					<span class="right-item">0원</span>
				</div>
				<div class="order_right_menu_count">
					<span>총 결재 금액<strong>15000원</strong></span>
					<span>적립 리디포인트 :<strong>150원</strong>(1%)</span>
				</div>
				
				<div class="order_right_menu_list">
					<div class="title">
						<span>결제 수단</span>
					</div>
					<div class="payment_list_wrapper">
						<ul class="list_wrapper order_right_menu_paylist">
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span class="payment_pay">네이버페이</span>
									</span>
									<img src="/bookFactory/img/ridicash/네이버페이.PNG">
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span class="payment_pay">카카오페이</span>
									</span>
									<img src="/bookFactory/img/ridicash/카카오페이.PNG">
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span class="payment_pay">삼성페이</span>
									</span>
									<img src="/bookFactory/img/ridicash/삼성페이.PNG">
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span class="payment_pay">페이코</span>
									</span>
									<img src="/bookFactory/img/ridicash/페이코.PNG">
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span class="payment_pay">페이나우</span>
									</span>
									<img src="/bookFactory/img/ridicash/페이나우.PNG">
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span>신용카드</span>
									</span>
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span>휴대폰</span>
									</span>
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span>유선전화</span>
									</span>
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span>계좌이체</span>
									</span>
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span>컬쳐랜드문화상품권</span>
									</span>
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span>도서문화상품권</span>
									</span>
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span>해피머니(모바일팝)</span>
									</span>
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span>해외 발행 신용카드</span>
									</span>
								</label>
							</li>
							<li class="payment_list">
								<label>
									<input type="radio" class="radio_input" name="radio_input">
									<span class="radio_mark"></span>
									<span class="payment_label">
										<span>무통장입금</span>
									</span>
								</label>
							</li>
						</ul>
					</div>
				</div>
				<br>
				<div class="wrap-container">
					<div style="padding-bottom: 0.5rem;">
						<span class="order_right_menu_agree">구매 동의</span>
					</div>
					<div style="padding-bottom: 1rem">
						<label class="bf-custom-checkbox agree">
							<input type="checkbox" title="구매목록 책 전체선택">
							<span class="all-mark"></span>
							<span class="checkbox-label order_right_menu_lift"><strong>이용 약관에 동의하며, 결제를 진행합니다.</strong><br />14일 이내에 선물을 수령하지 않을 경우 구매가 자동 취소됩니다. (휴대폰 결제, 적립된 포인트를 사용한 경우 제외) </span>
						</label>
						<a class="bf-button bf-notice-btn bf-transparent-btn bf-animated-btn" style="left: 1.25rem">선물하기 이용 약관</a>
					</div>
					<div style="text-align: center;">
						<button class="order_right_menu_paybutton bf-button bf-animated-btn" onclick="javascript:location.href='${root}/presentOk.do'">결제하기</button>
					</div>
					<div class="menu_notice_tip">
						<ul>
							<li>결제 취소는 결제일로부터 7일 이내에만 할 수 있습니다.</li>
							<li>다운로드하거나 (다운로드 시작 포함) 스트리밍으로 이용한 책은 구매 취소하거나 환불받을 수 없습니다.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>