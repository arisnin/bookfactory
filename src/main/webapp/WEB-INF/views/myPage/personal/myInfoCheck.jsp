<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet" />
<link href="${root}/css/myPage/personal/myInfoCheck.css" type="text/css" rel="stylesheet">
<title>마이페이지, 내정보변경</title>
</head>
<body>
	<div class="myInfoCheck">
		<div class="bf-title-row title-type4">
			<h3>정보 변경</h3>
		</div>

		<div class="content_title">보안을 위해 비밀번호를 한번 더 입력해 주세요.</div>
		<div class="content">
			<div>
				<form action="${root}/personal/myInfo.do" method="post">
					<input class="search_box" type="password" maxlength="12" />
					<button type="submit" class="bf-button">확인</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>