<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>도서 등록</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
  	<link rel="stylesheet" href="${root}/resources/css/manager/book.css">
  	<link rel="stylesheet" href="${root}/resources/css/manager/author.css">
</head>
<body>
	<div id="a_in_wrapper">
		<section class="a_in_main">
			<div class="a_in_header"><h2>작가 상세보기</h2></div>
			<div class="a_in_content">
				<div class="a_read_info_wrap">
					<div class="a_read_left">
						<div>
							<label>이름</label>
							<span>${authorDto.name }</span>
						</div>
						<div>
							<label>국적</label>
							<span>${fn:replace(country_name,'없음','-') }</span>
						</div>
						<div>
							<label>출생년도</label>
							<span>${fn:replace(authorDto.birthday,'없음','-')}</span>
						</div>
						<div>
							<label>데뷔</label>
							<span>${fn:replace(authorDto.debut,'없음','-')}</span>
						</div>
						<div>
							<label>학력</label>
							<span>${fn:replace(authorDto.education,'없음','-')}</span>
						</div>
						<div>
							<label>경력</label>
							<span>${fn:replace(authorDto.career,'없음','-')}</span>
						</div>
						<div>
							<label>수상</label>
							<span>${fn:replace(authorDto.awards,'없음','-')}</span>
						</div>
						<div>
							<label>링크</label>
							<span>${fn:replace(authorDto.link,'없음','-')}</span>
						</div>
					</div>
					<div class="a_read_right">
						<div>
							<label>보유한 책 권수</label>
							<span>${count}권</span>
						</div>
						<div>
							<label>보유책 리스트</label>
							<span>
								<c:forEach items="${bookList}" var="bookDto">
									<a href="#">${bookDto.name}</a><br>
								</c:forEach>
							</span>
						</div>
					</div>
				</div>
				<div class="a_in_textarea2">
					<label>작가 소개</label>
					<p>${fn:replace(authorDto.describe,'없음','-')}</p>
				</div>
				<div align="right">
					<button class="bf-button" onclick="goUpdate('${root}/manager/authorUpdate.do?num=${authorDto.num}')">수정하기</button>
					<button class="bf-button" onclick="goBack('${root}/manager/authorSearch.do?')">뒤로가기</button>
				</div>
			</div>
		</section>
	</div>
	<input type="hidden" name="href">
</body>
</html>
