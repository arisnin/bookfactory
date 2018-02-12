<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/cart/cart.css">
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/library/preferBook.css">
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

	<div class="preferBook-container" style="width:45rem;">
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
		<div class="cart_content_select">
			<div class="cart_content_sel_child">
				<label class="bf-custom-checkbox"> <input type="checkbox"
					title="구매목록 책 전체선택"> <span class="all-mark"></span> <span
					class="checkbox-label">전체선택</span>
				</label>
			</div>
			<div class="cart_content_sel_button">
				<button class="bf-button" style="margin-right: 0.5rem;">선택
					삭제</button>
			</div>
		</div>
		<div class="cart_content_book preferBook_content"
			style="">
			<div style="float: left;">
				<label class="bf-custom-checkbox"
					style="position: relative; bottom: 40px;"> <input
					type="checkbox" title="구매목록 책 전체선택"> <span class="all-mark"></span>
				</label><img width="60px" height="90px" style="margin-left: 5px;">
			</div>
			<div class="cart_content_book_content">
				<span>책 제목</span><br> <br> <span style="font-size: 14px">작가<br>장르
				</span> <br> <span style="font-size: 14px">1화/총250화
					<!-- <button class="bf-button preferBook_finish">완결</button> -->
					<span class="badge-icon">완결</span>
				</span>
			</div>
			<div class="preferBook_firstView">
				<button class="bf-button">첫화 보기</button>
			</div>
		</div>
	</div>
</body>
</html>