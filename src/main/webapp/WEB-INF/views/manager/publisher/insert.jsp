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
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
  	<link rel="stylesheet" href="${root}/css/manager/pub.css">
</head>
<body>
	<div id="b_in_wrapper">
		<form id="pub_form" action="${root}/manager/publisherInsertOk.do" method="post">
			<section class="b_in_main">
				<div class="b_in_header"><h2>출판사 등록</h2></div>
				<div class="b_in_content p_in_center">
					<div>
						<label>출판사 명</label>
						<input type="text" placeholder="출판사 이름" name="name"/>
						<span class="p_in_check"></span>
					</div>
					<div>
						<label>출판사 사이트</label>
						<input type="text" placeholder="출판사 홈페이지" name="url"/>
					</div>
					<div align="right">
						<button type="button" class="bf-button" onclick="pubinFun('${root}')">등록</button>
						<button type="reset" class="bf-button">취소</button>
					</div>
				</div>
			</section>
		</form>
	</div>
	
	<script src="${root}/script/manager/publisher/insert.js"></script>
	
</body>
</html>



