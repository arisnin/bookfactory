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
<script type="text/javascript">
	$(function() {
		$(".service-type-list a").click(function() {
			$(".active").removeClass();
			$(this).addClass("active");
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
			<%-- <c:if test=${cartSize!=0 }> --%>
			<c:forEach begin="1" end="2">
				<div class="cart_content_book">
					<div class="book-thumbnail">
						<label class="bf-custom-checkbox cart_content_book_span">
							<input type="checkbox">
							<span class="all-mark"></span>
						</label>
						<img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/2416000043/large">
					</div>
					<div class="cart_content_book_content">
						<span>개정판 | 왕들의 전쟁: 얼음과 불의 노래 제2부</span>
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
			
			<%-- </c:if> --%>
			<!-- -------------------------------------- -->
			<%-- <c:if test=${cartSize==0 }> --%>
			<!-- 	<div class="cart_content_book">대여 할수 있는 책이 없습니다.</div> -->
			<%-- </c:if> --%>

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
			<!-- -------------------------------------- -->
			<div class="cart_content_book wishlist_middle">
				<div class="book-thumbnail">
					<img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/593000369/xxlarge">
				</div>
				<div class="cart_content_book_content wishlist_content">
					<span>매스커레이드</span>
					<br>
					<span class="font_13">히가시노 게이고</span>
				</div>
			</div>
			<!-- -------------------------------------- -->
			<div class="cart_content_book wishlist_middle">
				<div class="book-thumbnail">
					<img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/2189000079/xxlarge">
				</div>
				<div class="cart_content_book_content wishlist_content">
					<span>죽여 마땅한 사람들</span>
					<br>
					<span class="font_13">피터 스완슨</span>
				</div>
			</div>
			<!-- -------------------------------------- -->
			<div class="cart_content_book wishlist_middle">
				<div class="book-thumbnail">
					<img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/593000426/xxlarge">
				</div>
				<div class="cart_content_book_content wishlist_content">
					<span>나미야 잡화점의 기적</span>
					<br>
					<span class="font_13">히가시노 게이고</span>
				</div>
			</div>
			<!-- -------------------------------------- -->
			<div class="cart_content_book wishlist_middle">
				<div class="book-thumbnail">
					<img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/606001670/xxlarge">
				</div>
				<div class="cart_content_book_content wishlist_content">
					<span>신경 끄기의 기술</span>
					<br>
					<span class="font_13">마크 맨슨, 두진욱</span>
				</div>
			</div>
		</div>
	</div>

</body>
</html>