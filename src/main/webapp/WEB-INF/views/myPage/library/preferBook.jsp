<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/cart/cart.css">
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/library/preferBook.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
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

	<div class="preferBook-container" style="width: 45rem;">
		<div>
			<div class="bf-title-row title-type4">
				<h3>연재 선호작품</h3>
			</div>
			<div class="bf-service-type-menu">
				<!-- 서비스타입 메뉴  -->
				<ul class="service-type-list">
					<li><a class="active">전체</a></li>
					<li><a>로맨스</a></li>
					<li><a>판타지</a></li>
					<li><a>만화</a></li>
					<li><a>BL</a></li>
				</ul>
			</div>
		</div>
		<div class="cart_content">
			<!-- -------------------------------------- -->
			<div class="cart_content_select">
				<div class="cart_content_sel_child">
					<label class="bf-custom-checkbox"> <input type="checkbox" title="구매목록 책 전체선택"> <span class="all-mark"></span> <span class="checkbox-label">전체선택</span>
					</label>
				</div>
				<div class="cart_content_sel_button">
					<button class="bf-button bf-white-btn">선택 삭제</button>
				</div>
			</div>
			<!-- -------------------------------------- -->
			<%-- <c:if test=${cartSize!=0 }> --%>
			<c:forEach begin="1" end="2">
				<div class="cart_content_book">
					<div class="book-thumbnail">
						<label class="bf-custom-checkbox cart_content_book_span"> <input type="checkbox"> <span class="all-mark"></span>
						</label> <img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/3103000001/large">
					</div>
					<div class="cart_content_book_content">
						<span>어느 날 공주가 되어버렸다 1화</span>
						<br>
						<div class="book-info">
							<span class="font_13">플루토스</span>
							<span class="font_13 first-category">로맨스</span>
							<span class="font_13 book-count">
								<strong>1화</strong>총218화
							</span>
						</div>
						<br>
						<button class="bf-button bf-white-btn">첫화보기</button>
					</div>
				</div>
				<div class="cart_content_book">
					<div class="book-thumbnail">
						<label class="bf-custom-checkbox cart_content_book_span"> <input type="checkbox"> <span class="all-mark"></span>
						</label> <img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/2057017014/large">
					</div>
					<div class="cart_content_book_content">
						<span>이세계로 전생했더니 식인식물</span>
						<br>
						<div class="book-info">
							<span class="font_13">기소반</span>
							<span class="font_13 first-category">판타지</span>
							<span class="font_13 book-count">
								<strong>1화</strong>총230화
							</span>
						</div>
						<br>
						<button class="bf-button bf-white-btn">첫화보기</button>
					</div>
				</div>
				<div class="cart_content_book">
					<div class="book-thumbnail">
						<label class="bf-custom-checkbox cart_content_book_span"> <input type="checkbox"> <span class="all-mark"></span>
						</label> <img class="cart_content_book_img" src="https://misc.ridibooks.com/cover/3026000077/large">
					</div>
					<div class="cart_content_book_content">
						<span>이스닐다</span>
						<br>
						<div class="book-info">
							<span class="font_13">리모란</span>
							<span class="font_13 first-category">로맨스</span>
							<span class="font_13 book-count">
								<strong>1화</strong>총77화<span class="badge-icon">완결</span>
							</span>
						</div>
						<br>
						<button class="bf-button bf-white-btn">첫화보기</button>
					</div>
				</div>
			</c:forEach>

			<%-- 			</c:if> --%>
			<!-- -------------------------------------- -->
			<%-- 			<c:if test=${cartSize==0 }> --%>
			<!-- 				<div class="cart_content_book">대여 할수 있는 책이 없습니다.</div> -->
			<%-- 			</c:if> --%>

			<div class="cart_content_select">
				<div class="float_left">
					<div class="cart_content_sel_child">
						<label class="bf-custom-checkbox"> <input type="checkbox" title="구매목록 책 전체선택"> <span class="all-mark"></span> <span class="checkbox-label">전체선택</span>
						</label>
					</div>
				</div>
				<div class="cart_content_sel_button">
					<button class="bf-button bf-white-btn cart_contet_sel_margin">선택 삭제</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>