<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체보기</title>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<link href="${root}/css/category/category.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
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
			
			// cnum로부터 메인(중분류) 번호와 서브(소분류) 번호를 추출하고, 해당 메뉴를 활성화 상태로 전환(CSS 강조 효과)
			var mainNumber = Math.round((cnum / 100)) * 100;
			var main = document.querySelector("a[data-second-cate='" + mainNumber + "']");
			main.classList.add("active");
	
			var sub = document.querySelector("a[data-third-cate='" + cnum + "']");
			sub.classList.add("active");
	
			// 타이틀 설정(메인 타이틀 + 서브 타이틀)
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
			
			// 홈 메뉴 화면에서 인기, 신간, 베스트셀러 항목의 서브 타이틀 설정
			var subTitleList = document.querySelectorAll(".title-type3.sub > h3 > span");
			Array.prototype.forEach.call(subTitleList, function(e,i) {
				if (cnum != mainNumber) {
					// 홈 이외의 메뉴
					e.innerHTML = sub.innerHTML;
				} else {
					// 홈 메뉴
					e.innerHTML = main.innerHTML;
				}
			});
		}
		
	</script>
</body>
</html>