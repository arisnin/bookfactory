<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/cart/cart.css">
<link rel="stylesheet" type="text/css" href="${root}/css/cart/wishlist.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/cart/cart.js"></script>
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
<script type="text/javascript">
	$(function() {
		$(".cart_content input[type='checkbox']").each(function() {
			$(this).prop("checked", false);
		});
	});
</script>
</head>
<body>
	<div class="wishlistMainContent">
		<div class="cart_content">
			<!-- -------------------------------------- -->
			<div class="title-menu">
				<div class="bf-title-row title-type1">
					<h2>위시리스트</h2>
				</div>
				<div class="bf-service-type-menu">
					<!-- 서비스타입 메뉴  -->
					<ul class="service-type-list">
						<li><a class="active">등록순</a></li>
						<li><a>인기순</a></li>
						<li><a>낮은 가격순</a></li>
						<li><a>할인중인 도서</a></li>
					</ul>
				</div>
			</div>
			<!-- -------------------------------------- -->
			<div class="cart_content_select">
				<div class="cart_content_sel_child">
					<label class="bf-custom-checkbox">
						<input type="checkbox" title="구매목록 책 전체선택">
						<span class="all-mark"></span>
						<span class="checkbox-label">전체선택</span>
					</label>
				</div>
				<div class="cart_content_sel_button">
					<button class="bf-button bf-white-btn">선택 카트로 이동</button>
					<button class="bf-button bf-white-btn">선택 삭제</button>
				</div>
			</div>
			<!-- -------------------------------------- -->
			<c:if test="${listSize!=0 }">
			<c:forEach items="${listWish}" var="wishList">
				<div class="cart_content_book">
					<div class="book-thumbnail">
						<label class="bf-custom-checkbox cart_content_book_span">
							<input type="checkbox">
							<span class="all-mark"></span>
						</label>
						<img class="cart_content_book_img" src="${wishList.img_path}">
					</div>
					<div class="cart_content_book_content">
						<span id="${wishList.book_num}">${wishList.bookName}</span>
						<br>
						<span class="font_13">${wishList.authorName}</span>
						<div class="float_right">
							<span class="price"></span>
							<div>
								<span class="dc-price">${wishList.rental_price}원</span>
								<span class="count_percent buy-type">구매</span>
							</div>
						</div>
						<br>
						<button class="bf-button bf-white-btn">카트로 이동</button>
						<button class="bf-button bf-white-btn">삭제</button>
					</div>
				</div>
				<div class="cart_content_book">
					<div class="book-thumbnail">
						<label class="bf-custom-checkbox cart_content_book_span">
							<input type="checkbox">
							<span class="all-mark"></span>
						</label>
						<img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/2416000006/large">
					</div>
					<div class="cart_content_book_content">
						<span>개정판 | 왕좌의 게임: 얼음과 불의 노래 제1부</span>
						<br>
						<span class="font_13">조지 R. R. 마틴</span>
						<div class="float_right">
							<span class="price"></span>
							<div>
								<span class="dc-price">25000원</span>
								<span class="count_percent buy-type">구매</span>
							</div>
						</div>
						<br>
						<button class="bf-button bf-white-btn">카트로 이동</button>
						<button class="bf-button bf-white-btn">삭제</button>
					</div>
				</div>
				<div class="cart_content_book">
					<div class="book-thumbnail">
						<label class="bf-custom-checkbox cart_content_book_span">
							<input type="checkbox">
							<span class="all-mark"></span>
						</label>
						<img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/2200011577/large">
					</div>
					<div class="cart_content_book_content">
						<span>달이 차오른다</span>
						<br>
						<span class="font_13">온누리</span>
						<div class="float_right">
							<span class="price"></span>
							<div>
								<span class="dc-price">3800원</span>
								<span class="count_percent buy-type">구매</span>
							</div>
						</div>
						<br>
						<button class="bf-button bf-white-btn">카트로 이동</button>
						<button class="bf-button bf-white-btn">삭제</button>
					</div>
				</div>
			</c:forEach>
			
			</c:if>
			<!-- -------------------------------------- -->
			<c:if test="${listSize==0 }">
				<div class="cart_content_book cart_content_book_no">등록된 책이 없습니다.</div>
			</c:if>

			<div class="cart_content_select">
				<div class="float_left">
					<div class="cart_content_sel_child">
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="구매목록 책 전체선택">
							<span class="all-mark"></span>
							<span class="checkbox-label">전체선택</span>
						</label>
					</div>
				</div>
				<div class="cart_content_sel_button">
					<button class="bf-button bf-white-btn">선택 카트로 이동</button>
					<button class="bf-button bf-white-btn cart_contet_sel_margin">선택 삭제</button>
				</div>
			</div>			
		</div><!-- End : cart_content -->
		<!-- -------------------------------------- -->
		<div class="cart_right_menu wishlist_head_top">
			<div class="cart_right_menu_content wishlist_header">
				<label>함께 판매된 인기책</label>
			</div>
			<!-- -------------------------------------- -->
			<div class="cart_content_book wishlist_middle">
				<div class="book-thumbnail">
					<img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/2066000298/xxlarge">
				</div>
				<div class="cart_content_book_content wishlist_content">
					<span>너의 췌장을 먹고 싶어</span>
					<br>
					<span class="font_13">스미노 요루</span>
				</div>
			</div>
			<!-- -------------------------------------- -->
			<div class="cart_content_book wishlist_middle">
				<div class="book-thumbnail">
					<img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/510000690/xxlarge">
				</div>
				<div class="cart_content_book_content wishlist_content">
					<span>아르테미스</span>
					<br>
					<span class="font_13">앤디 위어</span>
				</div>
			</div>
		</div>
	</div>

</body>
</html>