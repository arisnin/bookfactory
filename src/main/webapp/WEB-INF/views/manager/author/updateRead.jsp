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
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
  	<link rel="stylesheet" href="${root}/css/manager/author.css">
  	<link rel="stylesheet" href="${root}/css/basic/jquery-ui.css">
</head>
<body>
	<div id="a_in_wrapper">
		<form action="${root}/manager/authorUpdateReadOk.do" method="post">
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
						<input type="text" placeholder="이름" value="${authorDto.name}" disabled="disabled"/>
					</div>
					<div>
						<label>국적</label>
						<select name="country_num" class="a_in_select">
							<c:forEach items="${countryList}" var="country">
								<c:if test="${country.country_num != authorDto.country_num}">
									<option value="${country.country_num}">${country.country_name}</option>							
								</c:if>
								<c:if test="${country.country_num == authorDto.country_num}">
									<option value="${country.country_num}" selected="selected">${country.country_name}</option>							
								</c:if>
							</c:forEach>
						</select>
					</div>
					<div>
						<label>출생년도</label>
						<div class="b_in_date">
						 	<input type="text" id="b_date" name="birthday" placeholder="YY-MM-DD" value="${authorDto.birthday}">
						</div>
					</div>
					<div>
						<label>데뷔</label>
						<div class="b_in_date">
						 	<input type="text" id="b_date2" name="debut" placeholder="YY-MM-DD" value="${authorDto.debut }">
						</div>
					</div>
					<div>
						<label>학력</label>
						<input type="text" placeholder="학력"/>
						<button id="education_btn" type="button" class="bf-button search">추가</button>
						<input type="hidden" name="education" value="${authorDto.education }">
					</div>
					<div class="a_in_list">
						<ul>
						</ul>
					</div>
					<div>
						<label>경력</label>
						<input type="text" placeholder="경력"/>
						<button id="career_btn" type="button" class="bf-button search">추가</button>
						<input type="hidden" name="career" value="${authorDto.career }">
					</div>
					<div class="a_in_list">
						<ul>
						</ul>
					</div>
					<div>
						<label>수상</label>
						<input type="text" placeholder="수상"/>
						<button id="awards_btn" type="button" class="bf-button search">추가</button>
						<input type="hidden" name="awards" value="${authorDto.awards }">
					</div>
					<div class="a_in_list">
						<ul>
						</ul>
					</div>
					<div>
						<label>링크</label>
						<span>${authorDto.link }</span>
					</div>
					<div class="a_in_textarea">
						<label>작가 소개</label>
						<textarea rows="" cols="" name="describe">${authorDto.describe }</textarea>
					</div>
					<div align="right">
						<button id="a_form_btn" type="submit" class="bf-button">수정</button>
						<button type="button" class="bf-button">취소</button>
					</div>
				</div>
			</section>
			<input type="hidden" name="num" value="${authorDto.num}">
		</form>
	</div>
	
	<script src="${root}/script/basic/jquery-ui.js"></script>
	<script src="${root}/script/manager/author/insert.js"></script>
	<script src="${root}/script/manager/author/updateRead.js"></script>
	
</body>
</html>