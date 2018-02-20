<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출판사 업데이트체크</title>
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("수정 완료");
			location.href=document.referrer;
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("수정 실패");
			history.back();
		</script>
	</c:if>
</body>
</html>