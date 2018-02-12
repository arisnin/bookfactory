<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체보기</title>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<link href="${root}/css/category/category.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="bf-category-all-box">
		<!-- 네비게이션 메뉴 영역 -->
		<div class="bf-left-menu">
			<jsp:include page="/WEB-INF/views/category/navigation.jsp" />
		</div>
		<!-- 메뉴 콘텐츠 영역 -->
		<div class="bf-right-contents">
			<c:choose>
				<c:when test="${param.snum == null}">
					<jsp:include page="/WEB-INF/views/category/service/home.jsp"/>
				</c:when>
				<c:when test="${param.snum == '100'}">
					<jsp:include page="/WEB-INF/views/category/service/home.jsp"/>					
				</c:when>
				<c:otherwise>
					<jsp:include page="/WEB-INF/views/category/service/service.jsp" />
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script type="text/javascript" src="${root}/script/category/category.js"></script>
	<script type="text/javascript">
		window.addEventListener("load", initCategoryAll('${root}','${param.cnum}','${param.snum}'));
		
		function initCategoryAll(root, cnum, snum) {
			if (cnum === "") {
				cnum = 100;
			}
			//console.log(root + "," + cnum + "," + snum);
			var mainNumber = Math.round((cnum / 100)) * 100;
			var main = document.querySelector("a[data-main-category-num='" + mainNumber + "']");
			main.classList.add("active");
	
			var sub = document.querySelector("a[data-sub-category-num='" + cnum + "']");
			sub.classList.add("active");
	
			// 타이틀 설정
			var title = document.getElementById("category-main-title");
			title.innerHTML = main.innerHTML;
			if (cnum != mainNumber) {
				title.classList.add("blur");
				title.nextElementSibling.classList.toggle("hidden-block");
				title.nextElementSibling.innerHTML = sub.innerHTML;
			}
	
			// 서비스 타입 메뉴 활성화
			if (Number.isInteger(Number(snum)) == true) {
				if ((snum < 100) || (snum > 104)) {
					snum = 100;
				}
				document.querySelectorAll(".ca-category-box > .bf-service-type-menu a")[snum - 100].classList.add("active");
			}
		}
		
	</script>
</body>
</html>