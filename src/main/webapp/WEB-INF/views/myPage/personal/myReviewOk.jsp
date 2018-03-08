<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>내 리뷰 수정</title>
</head>
<body>
	<c:choose>
		<c:when test="${check > 0}">
			<script type="text/javascript">
				//alert("리뷰 수정에 성공하였습니다.");
			</script>
		</c:when>
		<c:when test="${check == -1 }">
			<script type="text/javascript">
				alert("로그인이 필요한 서비스입니다.");
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("시스템 오류로 리뷰 수정에 실패하였습니다.");
			</script>
		</c:otherwise>
	</c:choose>
	<script type="text/javascript">
		location.href = '${root}/personal/myReview.do';
	</script>
</body>
</html>