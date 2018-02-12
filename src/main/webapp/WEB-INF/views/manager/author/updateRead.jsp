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
  	<link rel="stylesheet" href="${root}/css/manager/author.css">
</head>
<body>
	<div id="a_in_wrapper">
		<section class="a_in_main">
			<div class="a_in_header"><h2>작가 정보 수정 요청사항</h2></div>
			<div class="a_in_content a_ur_top">
				<div>
				  <label>요청아이디</label>
				  <div class="a_ur_ct">abc123</div>
				</div>
				<div>
				  <label>작가이름</label>
				  <div class="a_ur_ct">홍길동</div>
				</div>
				<div>
				  <label class="a_ur_d3">내용</label>
				  <div class="a_ur_ct">또한 추세 또는 사실을 파악하는 것이 훨씬 쉬울 것입니다. 예를 들어, 미국은 방글라데시 인구의 2 배, 중국은 러시아보다 10 배 더 많은 인구가 있습니다. 차트의 막대 길이를 보면 .

다양한 종류의 차트를 만드는 데 사용할 수있는 인기있는 라이브러리는 Chart.js 입니다. 이 시리즈에서는이 라이브러리의 모든 중요한 측면에 대해 배우게됩니다. HTML5 Canvas에서 멋지고 반응이 빠른 차트를 만드는 데 사용할 수 있습니다. </div>
				</div>
			</div>
			<div class="a_in_content">
				<div>
					<label>이름</label>
					<input type="text" placeholder="제목"/>
					<span class="b_in_check">중복입니다 다시 입력하세요</span>
				</div>
				<div>
					<label>경력</label>
					<input type="text" placeholder="경력"/>
					<button type="button" class="bf-button search">추가</button>
				</div>
				<div class="a_in_list">
					<ul>
						<li>남서울대 4년 재학</li>
					</ul>
				</div>
				<div>
					<label>수상</label>
					<input type="text" placeholder="수상"/>
					<button type="button" class="bf-button search">추가</button>
				</div>
				<div class="a_in_list">
					<ul>
						<li>쌍용 수료!</li>
					</ul>
				</div>
				<div class="a_in_textarea">
					<label>작가 소개</label>
					<textarea rows="" cols=""></textarea>
				</div>
				<div align="right">
					<button type="button" class="bf-button">수정</button>
					<button type="button" class="bf-button">취소</button>
				</div>
			</div>
		</section>
	</div>
	
</body>
</html>