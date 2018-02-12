<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>도서 등록</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
  	<link rel="stylesheet" href="${root}/css/basic/reset.css">
  	<link rel="stylesheet" href="${root}/css/basic/commons.css">
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
  	<link rel="stylesheet" href="${root}/css/manager/pub.css">
</head>
<body>
	<div id="b_in_wrapper">
		<section class="b_in_main">
			<div class="b_in_header"><h2>출판사 등록</h2></div>
			<div class="b_in_content p_in_center">
				<div>
					<label>출판사 명</label>
					<input type="text" placeholder="출판사 이름"/>
					<span class="p_in_check">중복입니다 다시 입력하세요</span>
				</div>
				<div>
					<label>출판사 사이트</label>
					<input type="text" placeholder="출판사 홈페이지"/>
					<span class="p_in_check">중복입니다 다시 입력하세요</span>
				</div>
				<div align="right">
					<button type="button" class="bf-button">등록</button>
					<button type="button" class="bf-button">취소</button>
				</div>
			</div>
		</section>
	</div>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	
</body>
</html>