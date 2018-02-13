<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>관리자 홈페이지</title>
  <c:set var="root" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" href="${root}/css/basic/reset.css">
  <link rel="stylesheet" href="${root}/css/basic/commons.css">
  <link rel="stylesheet" href="${root}/css/manager/manager.css">
  <link rel="stylesheet" href="${root}/css/manager/index.css">
  <script src="${root}/script/basic/jquery.js"></script>
  <script src="${root}/script/basic/commons.js"></script>
</head>
<body>
  	<div id="manager_wrapper">
		<tiles:insertAttribute name="header"/>
		
		<section id="main">
			<!-- menu -->
			<section id="m_i_menu">
				<%-- <jsp:include page="/manager/template/leftMenu.jsp"/> --%>
				<tiles:insertAttribute name="menu"/>
			</section>
			<!-- content -->
			<section id="m_i_content">
				<tiles:insertAttribute name="content"/>
				<c:if test="${param.pname == null}">
					<%-- <jsp:include page="/manager/book/book_insert.jsp" flush="false"/> --%>		
				</c:if>
				<c:if test="${param.pname != null}">
					<%-- <jsp:include page="${param.pname}" flush="false"/> --%>		
				</c:if>
			</section>
		</section>
		
		<footer id="foot">
			<tiles:insertAttribute name="footer"/>
				<%-- <jsp:include page="/template/footer/footer.jsp"/> --%>
		</footer>
	</div>
	
	<script src="${root}/script/manager/index.js"></script>
</body>

</html>