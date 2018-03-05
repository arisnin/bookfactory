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
<title>myInfo -> myInfoUpdate</title>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert('수정되었습니다.<br/><br/>2018년 03월 05일에 요청하신 북페이지 마케팅 정보수정(이메일 거부, 앱 푸시 거부, 야간 앱 푸시 거부)이 정상적으로 처리되었습니다.');
			$(location).attr("href", "${root}/myPage/home.do");
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
		alert('수정되었습니다.<br/><br/>2018년 03월 05일에 요청하신 북페이지 마케팅 정보수정(이메일 거부, 앱 푸시 거부, 야간 앱 푸시 거부)이 정상적으로 처리되었습니다.');
			$(location).attr("href", "${root}/myPage/home.do");
		</script>
	</c:if>
</body>
</html>