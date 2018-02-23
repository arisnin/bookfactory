<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책등록확인창</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<link rel="stylesheet" href="${root }/alert/alertify_core.css" />
	<link rel="stylesheet" href="${root }/alert/alertify_default.css" id="toggleCSS" />	
</head>
<body>
	<script src="${root }/alert/alertifymin.js"></script>

	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("책수정 완료");
			location.href = '${root}/manager/bookUpdate.do?book_num=${num}';
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("책수정 실패");	
			location.href = '${root}/manager/bookUpdate.do?book_num=${num}';
		</script>
	</c:if>
</body>
</html>