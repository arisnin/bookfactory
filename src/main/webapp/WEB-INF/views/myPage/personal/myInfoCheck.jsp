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
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
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
				<form action="${root}/personal/myInfoOk.do" method="post">
					<input type="hidden" name="id" value="${id}"/>
					<input type="hidden" name="userPassword" value="${userPassword}"/>
					<input class="search_box" name="password" type="password" maxlength="12"/>
					<button type="submit" class="bf-button">확인</button>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var input = $(":input[name=password]").val();
	</script>
</body>
</html>