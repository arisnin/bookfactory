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
		<form id="pubUpdateForm" action="${root}/manager/publisherUpdateOk.do" method="post">
			<section class="b_in_main">
				<div class="b_in_header"><h2>출판사 수정</h2></div>
				<div class="b_in_content p_in_center">
					<div>
						<label>출판사 명</label>
						<input type="text" name="name" placeholder="출판사 이름" value="${publisherDto.name}" oninput="checkName('${root}')"/>
						<span class="p_in_check"></span>
					</div>
					<div>
						<label>출판사 사이트</label>
						<input type="text" name="url" placeholder="출판사 홈페이지" value="${publisherDto.url}"/>
					</div>
					<div align="right">
						<button type="button" class="bf-button" onclick="updateFun('${publisherDto.name}')">수정하기</button>
						<button type="button" class="bf-button" onclick="history.back()">뒤로가기</button>
					</div>
				</div>
				<input type="hidden" name="pub_num" value="${publisherDto.pub_num}">
				<input type="hidden" name="original_name" value="${publisherDto.name}">
			</section>
		</form>
	</div>
	<script src="${root}/script/basic/jquery.js"></script>
	<script src="${root}/script/basic/commons.js"></script>
	<script src="${root}/script/manager/publisher/update.js"></script>
	
</body>
</html>