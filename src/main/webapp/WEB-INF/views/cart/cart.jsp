<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" type="text/css" href="${root}/css/cart/cart.css">
<link rel="stylesheet" type="text/css" href="${root}/css/order/order.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
</head>
<body>	
	<c:set var="purchaseListSize" value="${purchaseList == null ? 0 : purchaseList.size()}" />
	<c:set var="rentalListSize" value="${rentalList == null ? 0 : rentalList.size()}" />
	<div id="cart_main">
		<div class="bf-title-row title-type1">
			<h2>카트</h2>
		</div>
		<div class="cart_content">
			<!-- -------------------------------------- -->
			<div>
				<ul class="cart-content-menu">
					<li class="pay_accept active" onclick="purchaseRentalListToggle()">구매가능<span class="count">${purchaseListSize}</span></li>
					<li class="rent_accept " onclick="purchaseRentalListToggle()">대여가능<span class="count">${rentalListSize}</span></li>
				</ul>
			</div>
			<!-- -------------------------------------- -->
			<div class="cart_content_select">
				<div class="cart_content_sel_child">
					<label class="bf-custom-checkbox"> <input type="checkbox" title="구매목록 책 전체선택" checked="checked" onchange="updateTotalMenu()"><span class="all-mark"></span> <span class="checkbox-label">전체선택</span>
					</label>
				</div>
				<div class="cart_content_sel_button">
					<button type="button" class="bf-button bf-white-btn">선택 위시리스트로 이동</button>
					<button type="button" class="bf-button bf-white-btn">선택 삭제</button>
				</div>
			</div>
			<!-- -------------------------------------- -->
			<form id="cart-submit-form" action="${root}/order.do" method="post" onsubmit="return cartValidation(this)">
			<%-- <c:if test="${purchaseListSize != 0 }"> --%>			
				<!-- 구매 목록 -->
				<div id="purchase-list-box">
				<c:forEach items="${purchaseList}" var="cartList" varStatus="status">				
					<div class="cart_content_book">
						<div class="book-thumbnail">
							<label class="bf-custom-checkbox cart_content_book_span">
								<input name="bookList" type="checkbox" checked="checked" value="${cartList.book_num}" onchange="updateTotalMenu()" /> <span class="all-mark"></span>
							</label>
							<img class="cart_content_book_img" src="${cartList.img_path}">
						</div>
						<div class="cart_content_book_content">
							<span class="book-num" data-book-num="${cartList.book_num}">${cartList.book_name}</span>
							<br>
							<div class="book-info">
								<span class="font_13">${cartList.author_name}</span>
							</div>
							<div class="float_right">
								<!-- 구매 도서 장바구니 출력 수정(2018-03-05 박성호) -->
								<fmt:formatNumber var="discount" value="${cartList.discount}" pattern="###" />
								<fmt:formatNumber var="discount2" value="${cartList.discount2}" pattern="###" />
								<!-- 전자책 정가 = price * discount -->
								<c:set var="price" value="${cartList.price * (100 - discount) / 100}" />
								<fmt:formatNumber var="price" value="${price + (100 - (price % 100)) % 100}" pattern="###" />
								<span class="price" data-price="${price}">
									<fmt:formatNumber value="${price}" type="number" />
									원
								</span>
								<div class="dc-price-box">
									<!-- 판매가 = 전자책 정가 * discount2 -->
									<c:set var="price" value="${price * (100 - discount2) / 100}" />
									<fmt:formatNumber var="price" value="${price + (100 - (price % 100)) % 100}" pattern="###" />
									<span class="dc-price" data-dc-price="${price}">
										<fmt:formatNumber value="${price}" type="number" />
										원
									</span>
									<span class="count_percent ${discount2 == 0 ? 'no-discount' : ''}" data-discount="${discount2}">${discount2 == 0 ? '' : discount2}</span>
								</div>
							</div>
							<br>
							<button type="button" class="bf-button bf-white-btn">위시리스트로 이동</button>
							<button type="button" class="bf-button bf-white-btn delete-btn">삭제</button>
						</div>
					</div>
				</c:forEach>
				</div>
				<!-- 대여 목록 -->
				<div id="rental-list-box" class="hidden-block">
				<c:forEach items="${rentalList}" var="cartList" varStatus="status">		
					<div class="cart_content_book">
						<div class="book-thumbnail">
							<label class="bf-custom-checkbox cart_content_book_span"> <input name="bookList" type="checkbox" disabled="disabled" value="${cartList.book_num}" checked="checked" onchange="updateTotalMenu()" /> <span class="all-mark"></span>
							</label> <img class="cart_content_book_img" src="${cartList.img_path}">
						</div>
						<div class="cart_content_book_content">
							<span class="book-num" data-book-num="${cartList.book_num}">${cartList.book_name}</span>
							<br>
							<div class="book-info">
								<span class="font_13">${cartList.author_name}</span>
							</div>
							<div class="float_right">
								<!-- 구매 도서 장바구니 출력 수정(2018-03-05 박성호) -->
								<!-- 확인용 히든 -->
								<fmt:formatNumber var="discount" value="${cartList.discount}" pattern="###" />
								<fmt:formatNumber var="discount2" value="${cartList.discount2}" pattern="###" />
								<!-- 전자책 정가 = price * discount -->
								<c:set var="price" value="${cartList.price * (100 - discount) / 100}" />
								<fmt:formatNumber var="price" value="${price + (100 - (price % 100)) % 100}" pattern="###" />
								<span class="price" data-price="${price}">
									<fmt:formatNumber value="${price}" type="number" />
									원
								</span>
								<div class="dc-price-box">
									<!-- 판매가 = 전자책 정가 * discount2 -->
									<c:set var="price" value="${price * (100 - discount2) / 100}" />
									<fmt:formatNumber var="price" value="${price + (100 - (price % 100)) % 100}" pattern="###" />
									<span class="dc-price" data-dc-price="${price}">
										<fmt:formatNumber value="${price}" type="number" />
										원
									</span>
									<span class="count_percent ${discount2 == 0 ? 'no-discount' : ''}" data-discount="${discount2}">${discount2 == 0 ? '' : discount2}</span>
								</div>
							</div>
							<br>
							<button type="button" class="bf-button bf-white-btn">위시리스트로 이동</button>
							<button type="button" class="bf-button bf-white-btn delete-btn">삭제</button>
						</div>
					</div>
				</c:forEach>
				</div>
			<%-- </c:if> --%>
			<input type="hidden" name="totalPrice" value="0"/>
 			</form>
			<!-- -------------------------------------- -->
			<c:if test="${purchaseListSize == 0}">
				<div class="cart_content_book cart_content_book_no">등록된 책이 없습니다.</div>
			</c:if>

			<div class="cart_content_select">
				<div class="float_left">
					<div class="cart_content_sel_child">
						<label class="bf-custom-checkbox"> <input type="checkbox" title="구매목록 책 전체선택" checked="checked" onchange="updateTotalMenu()"> <span class="all-mark"></span> <span class="checkbox-label">전체선택</span>
						</label>
					</div>
				</div>
				<div class="cart_content_sel_button">
					<button type="button" class="bf-button bf-white-btn">선택위시리스트로 이동</button>
					<button type="button" class="bf-button bf-white-btn cart_contet_sel_margin">선택 삭제</button>
				</div>
			</div>
		</div>

		<div class="cart_right_menu" id="cart-total-menu">
			<div class="cart_right_menu_content">
				<span class="icon-ok-circled"></span>
				<label class="total-menu-title">총 <strong>${purchaseListSize}</strong>권을 선택하셨습니다.
				</label>
			</div>
			<div class="cart_right_menu_content">
				<span>총 상품금액</span>
				<span class="float_right">0원</span>
			</div>
			<div class="cart_right_menu_content">
				<span>할인 가격</span>
				<span class="float_right">0원</span>
			</div>

			<div class="cart_right_menu_content cart_right_menu_count">
				<span>합계</span>
				<span class="float_right">0원</span>
			</div>

			<div class="cart_button_div">
				<button type="submit" form="cart-submit-form" class="order_right_menu_paybutton bf-button bf-animated-btn">선택구매하기</button>
			</div>
		</div>
	</div>
	<!-- JavaScript -->
	<script type="text/javascript" src="${root}/script/cart/cart.js"></script>
	<script type="text/javascript">
		function CartList(root) {
			var cartForm = document.getElementById("cart-submit-form");
			var bookList = "";
			
			Array.prototype.forEach.call(cartForm.querySelectorAll("input[type=checkbox]"), function(e,i) {
				if (e.checked && !e.disabled) {
					bookList += e.value + ",";
				}
			});
			
			if (bookList == "") alert('구매할 도서를 한 개 이상 선택해 주세요');
			location.href=root+"/order.do?bookList="+bookList;
		}
		
		updateTotalMenu();
		
		function purchaseRentalListToggle() {
			var pl = document.getElementById("purchase-list-box");
			var rl = document.getElementById("rental-list-box");
			
			// 클래스가 추가되면 true, 삭제되면 false
			var pFlag = pl.classList.toggle("hidden-block");
			var rFlag = rl.classList.toggle("hidden-block");
			
			// 구매 목록
			Array.prototype.forEach.call(pl.querySelectorAll("input[type=checkbox]"), function(e,i) {
				if (pFlag) {
					e.setAttribute("disabled", "disabled");
				} else {
					e.removeAttribute("disabled");					
				}
			});
			
			// 대여 목록
			Array.prototype.forEach.call(rl.querySelectorAll("input[type=checkbox]"), function(e,i) {
				if (rFlag) {
					e.setAttribute("disabled", "disabled");
				} else {
					e.removeAttribute("disabled");
				}
			});
			
			var menu = document.querySelectorAll(".cart-content-menu li");
			menu[0].classList.toggle("active");
			menu[1].classList.toggle("active");
			
			updateTotalMenu();
		}
	</script>
</body>
</html>