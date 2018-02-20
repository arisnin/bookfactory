<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/noticeInsert.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">
<title>공지사항</title>
</head>
<body>
	<div id="sh_noticeInsert">
		<div class="sh_noticeInsert_header">
			<div class="sh_main_text">공지사항 등록</div>
						<form action="${root}/manager/boardNoticeInsertOk.do" method="post">
				<div class="sh_noticeInsert_title">
					<fmt:formatDate value="${noticeDto.write_date}" pattern="yyyy-MM-dd" var="date"/>
					<ul>
						<li><span>제목</span></li>
						<li><input type="text" size="90px" name="title"></li>
						<li><span>작성일</span></li>
						<li><input type="text" size="33px" name ="write_date" value="${date}" /></li>
						<li><span>작성자</span></li>
						<li><input type="text" size="33px" name ="id" value="${noticeDto.id }"></li>
						<li><span>내용</span></li>
						<li><textarea class="sh_noticeInsert_text" name ="content"></textarea></li>
						<li><input type="hidden" name ="num" value="${num }">
					</ul>
					<div class="sh_board_member_click">
						<button type="submit" class="bf-button">등록</button>
						<button type="button" class="bf-button">취소</button>
					</div>

				</div>
				</form>
			  </div>
			</div>	
		<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
		<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
		<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
		<script type="text/javascript" src="${root}/script/manager/total.js"></script>
</body>
</html>