<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<link rel="stylesheet" href="${root}/css/manager/bookPlus/icon/css/fontello.css">
  	<link rel="stylesheet" href="${root}/css/basic/reset.css">
  	<link rel="stylesheet" href="${root}/css/manager/leftMenu.css">
  	<link rel="stylesheet" href="${root}/css/manager/fontelloicon/css/fontello.css">
</head>
<body>
	<div id="hw_menuWrapper">
		<button class="accordion">도서 관리<span class="i-i-plus"></span></button>
		<div class="panel">
		  <ul>
		  	<li><a href="#"><span class="i-i-angle-right"></span>도서 등록</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>도서 검색</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>카테고리 등록</a></li>
		  </ul>
		</div>
		
		<button class="accordion">출판사 관리<span class="i-i-plus"></span></button>
		<div class="panel">
		  <ul>
		  	<li><a href="#"><span class="i-i-angle-right"></span>출판사 등록</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>출판사 검색</a></li>
		  </ul>
		</div>
		
		<button class="accordion">작가 관리<span class="i-i-plus"></span></button>
		<div class="panel">
		  <ul>
		  	<li><a href="#"><span class="i-i-angle-right"></span>작가 등록</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>작가 검색</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>수정 요청 게시판</a></li>
		  </ul>
		</div>
		
		<button class="accordion">회원 관리<span class="i-i-plus"></span></button>
		<div class="panel">
		  <ul>
		  	<li><a href="#"><span class="i-i-angle-right"></span>회원 검색</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>회원 결제내역관리</a></li>
		  </ul>
		</div>
		
		<button class="accordion">리뷰 관리<span class="i-i-plus"></span></button>
		<div class="panel">
		  <ul>
		  	<li><a href="javascript:alert('구현중!ㅠㅠ')"><span class="i-i-angle-right"></span>리뷰 통계</a></li>
		  	
		  	<li><a href="/manager/review/review.jsp"><span class="i-i-angle-right"></span>리뷰 관리</a></li>
		  </ul>
		</div>
		
		<button class="accordion">고객 센터<span class="i-i-plus"></span></button>
		<div class="panel">
		  <ul>
		  	<li><a href="#"><span class="i-i-angle-right"></span>1:1 문의내역</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>자주하는 질문 등록</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>자주하는 게시판 관리</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>공지사항 등록</a></li>
		  </ul>
		</div>
		
		<button class="accordion">통계<span class="i-i-plus"></span></button>
		<div class="panel">
		  <ul>
		  	<li><a href="#"><span class="i-i-angle-right"></span>선호도</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>판매량</a></li>
		  	<li><a href="#"><span class="i-i-angle-right"></span>매출</a></li>
		  </ul>
		</div>
		<button class="accordion">자동 등록<span class="i-i-plus"></span></button>
		<div class="panel">
		  <ul>
		  	<li><a href="#"><span class="i-i-angle-right"></span>크롤링</a></li>
		  </ul>
		</div>
	</div>
	
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/manager/menu.js"></script>
</body>
</html>