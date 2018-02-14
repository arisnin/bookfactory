<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("크롤러 카테고리 자동세팅 이미완료");	
			location.href = '${root}/manager/auto.do';
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("크롤러 카테고리 완료");	
			location.href = '${root}/manager/auto.do';
		</script>
	</c:if>
	
</body>
</html>