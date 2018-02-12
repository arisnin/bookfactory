<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>관리자 홈페이지</title>
  <c:set var="root" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" href="${root}/resources/css/basic/reset.css">
  <link rel="stylesheet" href="${root}/resources/css/manager/manager.css">
</head>
<body>
	<header id="header">
		<div class="header_title">
			<h1>
				<a href="${root}/manager/index.do">Book Factory Manager Page</a>
			</h1>
		</div>
		<div class="header_menu">
			<ul>
				<li><a href="${root}/">메인페이지</a></li>
				<li><a href="#">로그아웃</a></li>
			</ul>
		</div>
	</header>
</body>
</html>