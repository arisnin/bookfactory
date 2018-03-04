<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>만화 홈화면</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/genre/home.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/genre/homeOther.css" />
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
</head>
<body>
	<!-- 책상세보기로 요청 방식 :  onclick="location.href='${root}/detail.do'"
		작가 상세보기 요청방식 :  onclick="location.href='${root}/author.do'"
		키워드 요청방식 : onclick="location.href='${root}/keyword.do'"
	 -->

	<!-- 각 배너는 각각 자신의 css와 자바스크립트를 가지고 있습니다. -->
	<jsp:include page="./commons/todayFactory.jsp" />
	<div></div>
	<jsp:include page="./commons/popularList.jsp" />
	<div></div>
	
	<div id="mainHome">
		<div class="keyword">
			<ul>
				<li><button type="button" class="bf-button bf-white-btn" onclick="location.href='${root}/keyword.do?firstCate=${firstCate}'">키워드로 검색하기</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do?firstCate=${firstCate}'">순정만화</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do?firstCate=${firstCate}'">학원물</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do?firstCate=${firstCate}'">동물</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do?firstCate=${firstCate}'">웹툰</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do?firstCate=${firstCate}'">캠퍼스</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do?firstCate=${firstCate}'">짝사랑</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do?firstCate=${firstCate}'">초능력</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do?firstCate=${firstCate}'">감동</button></li>
			</ul>
		</div>
		<div class="list0_head">
			<div class="bf-title-row title-type3">
				<h3>전체보기</h3>
				<button type="button" class="bf-button bf-black-btn bf-animated-btn" onclick="location.href='${root}/best-sell.do?firstCateNum=${firstCate}&bestSeller=weekBest'">전체보기</button>
			</div>
			<div class="bf-service-type-menu">
				<!-- li 요소에 diamond class를 추가하면 구분 아이콘 변경 -->
				<ul class="order-type-list">
					<li class="diamond"><a class="active" href="${root}/best-sell.do?firstCateNum=${firstCate}&bestSeller=weekBest">주간 베스트셀러</a></li>
					<li class="diamond"><a href="${root}/best-sell.do?firstCateNum=${firstCate}&bestSeller=monthBest">월간 베스트셀러</a></li>
					<li class="diamond"><a href="${root}/best-sell.do?firstCateNum=${firstCate}&bestSeller=steady">스테디셀러</a></li>
				</ul>
			</div>
		</div>
		<div class="list0_largeDiv">
			<c:forEach var="one" items="${bestDto}" begin="0" end="0">
				<div class="list_big">
					<div class="list_number">1</div>
					<div class="list_img">
						<img src="${one.img_path}" onclick="location.href='${root}/detail.do?book_num=${one.book_num}'">
					</div>
					<div class="list_book" onclick="location.href='${root}/detail.do?book_num=${one.book_num}'">${one.bookName}</div>
					<div class="list0_author" onclick="location.href='${root}/author.do?author_num=${one.author_num}'">${one.authorName}</div>
					<span class="trigger-block hidden-block" onclick="createStarIcon(this.nextElementSibling,${one.star_point})"></span>
					<div class="content-star-rate">
						<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
						<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
						<!-- 카운팅 숫자 표시는 필요없으면 빼도 됨 -->
						<span class="count-field"> ${one.star_count}명</span>
					</div>
				</div>
			</c:forEach>
			<c:set var="count" value="${1}"/>
			<c:forEach var="bestDto" begin="1" end="10" items="${bestDto}" >
				<div class="list0_midDiv">
					<div class="list_number">${count=count+1}</div>
					<div class="list0_img">
						<img src="${bestDto.img_path}" onclick="location.href='${root}/detail.do?book_num=${bestDto.book_num}'">
					</div>
					<div class="list0_book" onclick="location.href='${root}/detail.do?book_num=${bestDto.book_num}'">${bestDto.bookName}</div>
					<div class="list0_author" onclick="location.href='${root}/author.do?author_num=${bestDto.author_num}'">${bestDto.authorName}</div>
					<span class="trigger-block hidden-block" onclick="createStarIcon(this.nextElementSibling,${bestDto.star_point})"></span>
					<div class="content-star-rate">
						<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
						<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
						<!-- 카운팅 숫자 표시는 필요없으면 빼도 됨 -->
						<span class="count-field"> ${bestDto.star_count}명</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<script type="text/javascript">
      Array.prototype.forEach.call(document.querySelectorAll(".trigger-block"), function(e,i) {
         e.click();
      });
   </script>
</body>
</html>