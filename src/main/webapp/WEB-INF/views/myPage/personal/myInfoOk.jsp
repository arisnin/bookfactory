<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<title>myInfoCheck -> myInfoOk -> myInfo</title>
</head>
<body>
	<c:if test="${InfoOk != null}">
		<c:set var="id" value="${id}" scope="session"/>
		<c:set var="InfoOk" value="${InfoOk}" scope="session"/>
		<script type="text/javascript">
			$(location).attr("href", "${root}/personal/myInfo.do");
		</script>
	</c:if>
	<c:if test="${InfoOk == null}">
		<script type="text/javascript">
			alert('아이디와 비밀번호가 일치하지 않습니다.');
			$(location).attr("href", "${root}/personal/myInfoCheck.do");
		</script>
	</c:if>
</body>
</html>