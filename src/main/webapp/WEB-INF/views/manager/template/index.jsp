<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>관리자 홈페이지</title>
  <c:set var="root" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" href="${root}/css/basic/reset.css">
  <link rel="stylesheet" href="${root}/css/manager/manager.css">
  <link rel="stylesheet" href="${root}/css/manager/index.css">
</head>
<body>
  	<div id="manager_wrapper">
		<header id="header">
			<div class="header_title">
				<h1>
					<a href="manager.jsp">Book Factory Manager Page</a>
				</h1>
			</div>
			<div class="header_menu">
				<ul>
					<li><a href="#">메인페이지</a></li>
					<li><a href="#">로그아웃</a></li>
				</ul>
			</div>
		</header>

		<section id="main">
			<!-- menu -->
			<section id="m_i_menu">
				<%-- <jsp:include page="/manager/template/leftMenu.jsp"/> --%>
			</section>
			<!-- content -->
			<section id="m_i_content">
				<c:if test="${param.pname == null}">
					<%-- <jsp:include page="/manager/book/book_insert.jsp" flush="false"/> --%>		
				</c:if>
				<c:if test="${param.pname != null}">
					<%-- <jsp:include page="${param.pname}" flush="false"/> --%>		
				</c:if>
			</section>
		</section>
		
		<footer id="foot">
				<%-- <jsp:include page="/template/footer/footer.jsp"/> --%>
		</footer>
	</div>
	
	<input type="hidden" name="pname" value="${param.pname}"/>
	<script src="${root}/script/manager/index.js"></script>
</body>

</html>