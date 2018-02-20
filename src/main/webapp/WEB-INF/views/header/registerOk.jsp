<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
</head>
<body>
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("회원가입이 완료되었습니다.");
		</script>
	</c:if>	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			alert("회원가입에 실패하였습니다.");
		</script>
	</c:if>	
	<script type="text/javascript">location.reload();</script>
</body>
</html>