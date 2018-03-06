<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<style type="text/css">
.error-list-box {
    display: block;
    position: relative;
	width: 56.25rem;
    padding: 13rem;
}

.error-list {
	line-height: 2rem;
}

.error-list > li {
	text-align: center;
}
</style>
</head>
<body>
	<div class="wrap-container error-list-box" style="width:56.25rem">
		<ul class="mf-book-list error-list" >
			<li class="mf-book-item mf-book-empty">
				<div>
					<span class="material-icons">error</span>
				</div>
				<p>죄송합니다.<br />해당 페이지에 대한 접근 권한이 없는 계정입니다.</p>
			</li>
			<li>
				<button type="button" class="bf-button bf-white-btn" onclick="location.href='${root}/';">메인 페이지로</button>
				<button type="button" class="bf-button bf-white-btn" onclick="location.href='${returnURL}';">이전 페이지로</button>
			</li>
		</ul>
	</div>
</body>
</html>