<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 수정확인</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
</head>
<body>
	<c:if test="${checkReview <= 0}">
		<script type="text/javascript">
			// 리뷰 수정 실패
			alert('${error}');
		</script>
	</c:if>
	<script type="text/javascript">
		location.href = "${root}/review/list.do?book_num=${book_num}";
	</script>
</body>
</html>