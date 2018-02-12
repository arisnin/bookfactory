<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
  	<link rel="stylesheet" href="${root}/css/basic/reset.css">
  	<link rel="stylesheet" href="${root}/css/basic/commons.css">
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
  	<link rel="stylesheet" href="${root}/css/manager/pub.css">
  	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<div id="b_se_wrapper">
		<section class="b_se_main">
			<div class="b_se_header"><h2>출판사 검색</h2></div>
			<div class="b_se_content">
				<div class="bf-service-type-menu b_se_tt">
					<!-- 서비스타입 메뉴  -->			
					<ul class="service-type-list p_se_bar">
						<li><span>출판사</span></li>
						<li><span>사이트</span></li>
						<li><span>등록일</span></li>
						<li><span>등록한 도서수</span></li>
					</ul>
					<!-- 검색박스  -->
					<div class="search-box b_se_ta">
						<form method="get">
							<span class="material-icons">search</span>
							<input class="search-word" type="text" name="search-word" placeholder="출판사 명" />
						</form>
					</div>
				</div>
				<div class="p_se_list">
					<ul>
						<c:forEach begin="1" end="10">
							<li>
								<span><a href="javascript:alert('고민중')">아프니까 청춘이다</a></span>
								<span>bookfactory.com</span>
								<span>2018-01-23</span>
								<span>23개</span>
								<span class="p_se_btn">
									<button type="button" class="bf-button" onclick="location.href='${root}/manager/publisherUpdate.do'">수정</button>
									<button type="button" class="bf-button">삭제</button>
								</span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="p_se_foot">
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">
						<li class="first"><a href="#0"><span></span></a></li>
						<li class="prev"><a href="#0"><span></span></a></li>
						<li><a href="#0">1</a></li>
						<li><a href="#0">2</a></li>
						<li><a class="active" href="#0">3</a></li>
						<li><a href="#0">4</a></li>
						<li><a href="#0">5</a></li>
						<li class="next"><a href="#0"><span></span></a></li>
						<li class="last"><a href="#0"><span></span></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</div>

	
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	
</body>
</html>
