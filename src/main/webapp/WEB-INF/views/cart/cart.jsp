<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<div id="cart_main">
		<div class="bf-title-row title-type1">
			<h2>카트</h2>
		</div>

		<div class="cart_content">
			<!-- -------------------------------------- -->
			<div>
				<ul>
					<li class="pay_accept pay_active">구매가능<span class="count">6</span></li>
					<li class="rent_accept">대여가능<span class="count">0</span></li>
				</ul>
			</div>
			<!-- -------------------------------------- -->
			<div class="cart_content_select">
				<div class="cart_content_sel_child">
					<label class="bf-custom-checkbox"> <input type="checkbox" title="구매목록 책 전체선택"> <span class="all-mark"></span> <span class="checkbox-label">전체선택</span>
					</label>
				</div>
				<div class="cart_content_sel_button">
					<button class="bf-button bf-white-btn">선택 위시리스트로 이동</button>
					<button class="bf-button bf-white-btn">선택 삭제</button>
				</div>
			</div>
			<!-- -------------------------------------- -->
			<c:if test="${listSize != 0 }">
			<c:forEach items="${listCart}" var="cartList">
				<div class="cart_content_book">
					<div class="book-thumbnail">
						<label class="bf-custom-checkbox cart_content_book_span"> <input type="checkbox"> <span class="all-mark"></span>
						</label> <img class="cart_content_book_img" src="${cartList.img_path}">
					</div>
					<div class="cart_content_book_content">
						<span id="${cartList.book_num}">${cartList.bookName}</span>
						<br>
						<div class="book-info"><span class="font_13">${cartList.authorName}</span></div>
						<div class="float_right">
							<span class="price">${cartList.price}</span>
							<div>
								<span class="dc-price">${cartList.rental_price}원</span>
								<span class="count_percent">50</span>
							</div>
						</div>
						<br>
						<button class="bf-button bf-white-btn">위시리스트로 이동</button>
						<button class="bf-button bf-white-btn">삭제</button>
					</div>
				</div>
			</c:forEach>
				<script type="text/javascript">
				function CartList(root){
					var bookList ="";
					var bookSize = document.getElementsByClassName("cart_content_book").length;
					for (var i = 0; i < bookSize; i++) {
					var bookNum = document.getElementsByClassName("cart_content_book_content")[i].children[0].getAttribute("id");
						bookList += bookNum+","
					}
					location.href=root+"/order.do?bookList="+bookList
				}
				</script>
						</c:if>
			<!-- -------------------------------------- -->
						<c:if test="${listSize==0 }">
							<div class="cart_content_book cart_content_book_no">대여 할수 있는 책이 없습니다.</div>
						</c:if>

			<div class="cart_content_select">
				<div class="float_left">
					<div class="cart_content_sel_child">
						<label class="bf-custom-checkbox"> <input type="checkbox" title="구매목록 책 전체선택"> <span class="all-mark"></span> <span class="checkbox-label">전체선택</span>
						</label>
					</div>
				</div>
				<div class="cart_content_sel_button">
					<button class="bf-button bf-white-btn">선택위시리스트로 이동</button>
					<button class="bf-button bf-white-btn cart_contet_sel_margin">선택 삭제</button>
				</div>
			</div>
		</div>

		<div class="cart_right_menu">
			<div class="cart_right_menu_content">
				<span class="icon-ok-circled"></span>
				<label>총 <strong>${listSize}권</strong>을 선택하셨습니다.
				</label>
			</div>
			<div class="cart_right_menu_content">
				<span>총 상품금액</span>
				<span class="float_right">0원</span>
			</div>
			<script type="text/javascript">
				$(function(){
					var abc = "";
					$(".cart_content_book").each(function(){
						abc = $(".float_right > .price").text();												
					});				
					alert(abc);
// 					alert($(".cart_right_menu_content:nth-child(2)").find("span").last().text(abc+"원"));
				});
			</script>
			<div class="cart_right_menu_content">
				<span>할인 가격</span>
				<span class="float_right">${accountPrice}</span>
			</div>

			<div class="cart_right_menu_content cart_right_menu_count">
				<span>합계</span>
				<span class="float_right">${totalPrice-accountPrice}원</span>
			</div>

			<div class="cart_button_div">
				<button class="order_right_menu_paybutton bf-button bf-animated-btn" onclick="CartList('${root}')">선택대여하기</button>
			</div>
		</div>
	</div>
<script type="text/javascript" src="${root}/script/cart/cart.js"></script>
</body>
</html>