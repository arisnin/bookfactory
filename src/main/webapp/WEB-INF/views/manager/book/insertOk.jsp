<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책등록확인창</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("책등록 완료");
			location.href = '${root}/manager/bookInsert.do';
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("책등록 실패");	
			location.href = '${root}/manager/bookInsert.do';
		</script>
	</c:if>
</body>
</html>