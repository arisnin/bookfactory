<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로맨스 홈화면</title>
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
				<li><button type="button" class="bf-button bf-white-btn" onclick="location.href='${root}/keyword.do'">키워드로 검색하기</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do'">판타지물</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do'">리뷰100개이상</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do'">평점4점이상</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do'">친구>연인</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do'">차원이동</button></li>
				<li><button type="button" class="bf-button keyword-btn" onclick="location.href='${root}/keyword.do'">전생/환생</button></li>
			</ul>
		</div>
		<div class="list0_head">
			<div class="bf-title-row title-type3">
				<h3>전체보기</h3>
				<button type="button" class="bf-button bf-black-btn bf-animated-btn" onclick="location.href='${root}/best-sell.do'">전체보기</button>
			</div>
			<div class="bf-service-type-menu">
				<!-- li 요소에 diamond class를 추가하면 구분 아이콘 변경 -->
				<ul class="order-type-list">
					<li class="diamond"><a class="active" href="${root}/book/plusSerial.do">주간 베스트셀러</a></li>
					<li class="diamond"><a href="${root}/book/plusSerial.do">월간 베스트셀러</a></li>
					<li class="diamond"><a href="${root}/book/plusSerial.do">스테디셀러</a></li>
				</ul>
			</div>
		</div>
		<div class="list0_largeDiv">
			<div class="list_big">
				<div class="list_number">1</div>
				<div class="list_img">
					<img src="" onclick="location.href='${root}/detail.do'">
				</div>
				<div class="list_book" onclick="location.href='${root}/detail.do'">모모</div>
				<div class="list0_author" onclick="location.href='${root}/author.do'">미하엘 엔데</div>
				<div class="content-star-rate">
					<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
					<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
					<!-- 카운팅 숫자 표시는 필요없으면 빼도 됨 -->
					<span class="count-field"> 9999명</span>
				</div>
			</div>
			<c:forEach var="i" begin="1" end="10">
				<div class="list0_midDiv">
					<div class="list_number">${i+1}</div>
					<div class="list0_img">
						<img src="" onclick="location.href='${root}/detail.do'">
					</div>
					<div class="list0_book" onclick="location.href='${root}/detail.do'">모모</div>
					<div class="list0_author" onclick="location.href='${root}/author.do'">미하엘 엔데</div>
					<div class="content-star-rate">
						<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
						<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
						<!-- 카운팅 숫자 표시는 필요없으면 빼도 됨 -->
						<span class="count-field"> 9999명</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<script type="text/javascript">
	document.querySelectorAll(".content-star-rate").forEach(function(e,i){
		createStarIcon(e, 3.7);
		
	})
	</script>
</body>
</html>