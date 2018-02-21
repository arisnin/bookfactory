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
		<form action="${root}/manager/authorUpdateOk.do" method="post">
			<section class="a_in_main">
				<div class="a_in_header"><h2>작가 정보 수정</h2></div>

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
			<input type="hidden" name="searchWord" value="${param.searchWord}">
			<input type="hidden" name="pageNumber" value="${param.pageNumber}">
		</form>
	</div>
	
	<script src="${root}/script/basic/jquery-ui.js"></script>
	<script src="${root}/script/manager/author/insert.js"></script>
	<script src="${root}/script/manager/author/updateRead.js"></script>
	
</body>
</html>