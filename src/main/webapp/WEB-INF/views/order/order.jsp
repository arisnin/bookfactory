<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root}/css/order/order.css">
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/payment/ridicash.css">
<link rel="stylesheet" type="text/css" href="${root}/css/cart/cart.css">
</head>
<body>
	<div id="order_header">
		<div class="bf-title-row title-type1 order_header_child">
			<div class="order_header_content1">주문 목록</div>
			<div class="order_header_content2">결제 목록</div>
		</div>

		<div class="order_content ">
			<c:forEach begin="1" end="3">
				<div class="order_content_book_check cart_content_book">
					<div class="float_left">
						<!-- <label class="bf-custom-checkbox cart_content_book_span">
							<input type="checkbox" title="구매목록 책 전체선택">
							<span class="all-mark"></span>
						</label> -->
						<img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/593000658/xxlarge">
					</div>
					<div class="cart_content_book_content">
						<span>그대 눈동자에 건배</span>
						<br>
						<span class="font_13">히가시노 게이고</span>
						<div class="float_right">
							<span class="price hidden-block">10000원</span>
							<div>
								<span class="dc-price">9000원</span>
								<span class="count_percent">10</span>
							</div>
						</div>
						<span class="rental-period">
							<i class="material-icons">access_alarm</i>대여기간<strong>1일</strong>
						</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- End : order_content -->

		<div class="order_right_menu">
			<div class="order_right_menu_list first-line">
				<label class="bf-custom-checkbox benefit_cancel">
					<input type="checkbox" title="구매목록 책 전체선택">
					<span class="all-mark"></span>
					<span class="checkbox-label benefit_active">최대 혜택으로 적용되었습니다.</span>
				</label>
				<button class="bf-button bf-white-btn benefit_cancel float_right">해제</button>
			</div>
			<div class="order_right_menu_list">
				<span>총 주문금액</span>
				<span class="right-item total">0원</span>
			</div>

			<div class="order_right_menu_list">
				<span style="padding-top: 0.1rem">할인 쿠폰</span>
				<span class="right-item">0원</span>
			</div>

			<div class="order_right_menu_list">
				<span>포인트 상품권</span>
				<span class="right-item">0원</span>
				<br>
				<div class="order_right_menu_list_point">
					<!-- <span class="order_right_menu_pointintro">신규가입축하|1000원|3일</span> -->
					<!-- <span class="right-item"><button class="bf-button">변경</button></span> -->
				</div>
			</div>

			<div class="order_right_menu_list">
				<span>리디포인트</span>
				<span class="right-item">0원</span>
			</div>

			<div class="order_right_menu_list">
				<span>리디캐시</span>
				<button class="bf-button bf-white-btn">?</button>
				<span class="right-item">0원</span>
			</div>
			<div class="order_right_menu_count">
				<span>
					총 결재 금액<strong>15000원</strong>
				</span>
				<span>
					적립 리디포인트 :<strong>150원</strong>(1%)
				</span>
			</div>

			<div class="order_right_menu_list">
				<div class="title">
					<span>결제 수단</span>
				</div>
				<div class="payment_list_wrapper">
					<ul class="list_wrapper order_right_menu_paylist">
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span class="payment_pay">네이버페이</span>
								</span>
								<img src="/bookFactory/img/ridicash/네이버페이.PNG">
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span class="payment_pay">카카오페이</span>
								</span>
								<img src="/bookFactory/img/ridicash/카카오페이.PNG">
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span class="payment_pay">삼성페이</span>
								</span>
								<img src="/bookFactory/img/ridicash/삼성페이.PNG">
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span class="payment_pay">페이코</span>
								</span>
								<img src="/bookFactory/img/ridicash/페이코.PNG">
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span class="payment_pay">페이나우</span>
								</span>
								<img src="/bookFactory/img/ridicash/페이나우.PNG">
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span>신용카드</span>
								</span>
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span>휴대폰</span>
								</span>
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span>유선전화</span>
								</span>
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span>계좌이체</span>
								</span>
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span>컬쳐랜드문화상품권</span>
								</span>
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span>도서문화상품권</span>
								</span>
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span>해피머니(모바일팝)</span>
								</span>
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span>해외 발행 신용카드</span>
								</span>
							</label></li>
						<li class="payment_list"><label>
								<input type="radio" class="radio_input" name="radio_input">
								<span class="radio_mark"></span>
								<span class="payment_label">
									<span>무통장입금</span>
								</span>
							</label></li>
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
						<span class="checkbox-label order_right_menu_lift">
							<strong>상품, 가격, 할인정보, 유의사항 등을 확인 하였으며 구매에 동의합니다.</strong>
						</span>
					</label>
				</div>
				<div style="text-align: center;">
					<button class="order_right_menu_paybutton bf-button bf-animated-btn" onclick="javascript:location.href='${root}/orderOk.do'">결제하기</button>
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
</body>
</html>