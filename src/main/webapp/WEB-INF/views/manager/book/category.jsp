<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>카테고리 등록</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
  	<link rel="stylesheet" href="${root}/css/basic/reset.css">
  	<link rel="stylesheet" href="${root}/css/basic/commons.css">
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
</head>
<body>
	<div id="b_in_wrapper">
		<section class="b_in_main">
			<div class="b_in_header"><h2>카테고리 등록</h2></div>
			<div class="b_in_content">
				<div>
					<label>카테고리 대</label>
					<input type="text" placeholder="제목"/>
				</div>
				<div>
					<label>카테고리 중</label>
					<input type="text" placeholder="제목"/>
				</div>
				<div>
					<label>카테고리 소</label>
					<input type="text" placeholder="제목"/>
				</div>
				<div>
					<label>크롤링으로 넣기</label>
					<input type="text" placeholder="URL" style="width: 20rem;"/>
					<button type="button" class="bf-button" style="float: right;">크롤링등록</button>
				</div>
				<div align="right">
					<button type="button" class="bf-button">등록</button>
					<button type="button" class="bf-button">취소</button>
				</div>
			</div>
		</section>
	</div>
</body>
</html>