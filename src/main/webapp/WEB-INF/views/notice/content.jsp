<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css"
	rel="stylesheet" />
<link href="${root}/css/notice/content.css" type="text/css"
	rel="stylesheet">

<title>공지사항 내용</title>
</head>
<body>

	<div id="notice_content">

		<div class="bf-title-row title-type1">
			<h2>공지사항</h2>
		</div>
		<br />

		<div class="notice_">${noticeDto.title }</div>
		<br />

		<div class="notice_box">
			<div class="notice_writeday"><fmt:formatDate value="${noticeDto.write_date}" pattern="yyyy-MM-dd" /></div>
			<br />

			<div class="notice_content_read">${noticeDto.content }</div>
		</div>

		<div class="list">
			<a class="bf-button" href="${root }/notice/main.do">목록으로</a>
		</div>

	</div>

</body>
</html>