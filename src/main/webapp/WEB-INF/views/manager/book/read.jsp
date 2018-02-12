<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/manager/bReadPlus.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/manager/book.css">
</head>
<body>
	<div id="b_in_wrapper">
		<section class="b_in_main">
			<div class="b_in_header"><h2>도서 정보</h2></div>
			<div class="b_in_content">
				<div id="content_head">
					<div class="head_left">
						<img src="">
					</div>
					
					<div class="head_right">
						<div>장르 > 소장르</div>
						<div>책제목</div>
						<div>책소개</div>
						
						<div><a href="">이름</a>&nbsp;저자</div>
						
						<ul class="b_up_list">
							<li>
								<span>도서정보</span>
								<ul>
									<li><p>출판</p></li>
									<li><p>EPUB</p></li>
									<li><p>33.5mb</p></li>
									<li><p>약11만자</p></li>
								</ul>
							</li>
							
							<li>
								<span>출간정보</span>
								<ul>
									<li><p>2017년 10월 27일 전자책, 종이책 동시출간</p></li>
								</ul>
							</li>
							
							<li>
								<span>지원기기</span>
								<ul>
									<li>
										<span class="icon-tablet"></span>PAPER
									</li>
									<li>
										<span class="icon-apple"></span>iOS
									</li>
									<li>
										<span class="icon-android"></span>Android
									</li>
									<li>
										<span class=icon-windows></span>PC
									</li>
									<li>
										<span class="icon-laptop"></span>Mac
									</li>
								</ul>
							</li>
							<li>
								<span>듣기기능</span>
								<ul>
									<li>
										<span class="icon-headphones"></span>듣기가능
									</li>
								</ul>
							</li>
						</ul>
						
						<span class="box_left">판매</span>
						<span class="box_right">
							<span>판매가</span>
							<span>15000원</span>
						</span>					
					</div>
				</div>
				
				<div id="bookIntroAll">
					<div class="bookIntro">
						<div>
							<h3>책소개</h3>
						</div>
						<div class="bookIntro_con">
							<div class="readAll">
								<img>
								aaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaa<br>aaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa
							</div>
						</div>
					</div>
					
					<div class="bookIntro">
						<div>
							<h3>출판사 서평</h3>
						</div>
						<div class="bookIntro_con">
							<div class="readAll">
								<img>
								aaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaa<br>aaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa
							</div>
						</div>
					</div>
					<div class="b_read_foot">
						<button type="button" class="bf-button">수정하기</button>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>