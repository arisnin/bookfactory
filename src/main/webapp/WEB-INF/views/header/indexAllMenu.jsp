<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 메인화면의 헤더에서 전체보기를 눌렀을때 나오는 화면 - 염현우 -->
	<div id="hw_all_menu">
		<div class="all_menu_wrap wrap-container">
			<button class="all_menu_btn" type="button" onclick="allMenuClose()">
				<img class="all_menu_icon" src="${root}/img/index/213111_gray.png" /> 전체분야
			</button>
			<div class="hw_menu_box hw_menu_general" style="border-left: none;">
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="${root}/category.do">소설<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">경영/경제<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">인문/사회/역사<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub" style="border-bottom: 1px solid #e1e8ee;">
					<a class="hw_menu_title" href="#">자기계발<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">에세이/시<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">여행<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">종교<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">외국어<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">과학<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">진로/교육/교재<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">컴퓨터/IT<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">건강/다이어트<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">가정/생활<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">어린이/청소년<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">해외도서<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
				<div class="hw_general_sub">
					<a class="hw_menu_title" href="#">잡지<span class="hw_menu_tticon"></span></a>
					<ul class="hw_sub_category_wrapper">
					</ul>
				</div>
			</div>

			<div class="hw_menu_box hw_sub_g"></div>
			<div class="hw_menu_box hw_menu_etc">
				<div class="hw_box">
					<span>
						<a class="hw_menu_etc_title" href="">로맨스 단행본<span class="hw_menu_tticon" style="color: white;"></span></a>
					</span>
					<ul class="hw_etc_category_wrapper">
					</ul>
					<span>
						<a class="hw_menu_etc_title" href="">로맨스 연재<span class="hw_menu_tticon" style="color: white;"></span></a>
					</span>
					<ul class="hw_etc_category_wrapper">
					</ul>
				</div>
			</div>
			<div class="hw_menu_box hw_menu_etc">
				<div class="hw_box">
					<span>
						<a class="hw_menu_etc_title" href="">판타지 단행본<span class="hw_menu_tticon" style="color: white;"></span></a>
					</span>
					<ul class="hw_etc_category_wrapper">
					</ul>
					<span>
						<a class="hw_menu_etc_title" href="">판타지 연재<span class="hw_menu_tticon" style="color: white;"></span></a>
					</span>
					<ul class="hw_etc_category_wrapper">
					</ul>
					<!-- 					<div class="hw_fantasy_banner">
						<a class="hw_banner_link" href="">
							<span class="hw_banner_title">판타지</span><br/>
							자유이용권 도서
							<span class="hw_banner_icon_wrap">>></span>
						</a>
					</div> -->
				</div>
			</div>
			<div class="hw_menu_box hw_menu_etc">
				<div class="hw_box">
					<span>
						<a class="hw_menu_etc_title" href="">만화<span class="hw_menu_tticon" style="color: white;"></span></a>
					</span>
					<ul class="hw_etc_category_wrapper">
					</ul>
					<!-- <div class="hw_fantasy_banner">
						<a class="hw_banner_link" href="">
							<span class="hw_banner_title">만화</span><br/>
							자유이용권 도서
							<span class="hw_banner_icon_wrap">>></span>
						</a>
					</div> -->
				</div>
			</div>
			<div class="hw_menu_box hw_menu_etc">
				<div class="hw_box">
					<span>
						<a class="hw_menu_etc_title" href="">BL 단행본<span class="hw_menu_tticon" style="color: white;"></span></a>
					</span>
					<ul class="hw_etc_category_wrapper">
					</ul>
					<span>
						<a class="hw_menu_etc_title" href="">BL 연재<span class="hw_menu_tticon" style="color: white;"></span></a>
					</span>
					<ul class="hw_etc_category_wrapper">
					</ul>
					<span>
						<a class="hw_menu_etc_title" href="">라이트노벨<span class="hw_menu_tticon" style="color: white;"></span></a>
					</span>
					<ul class="hw_etc_category_wrapper">
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>