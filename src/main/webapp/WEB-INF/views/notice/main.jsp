<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet" />
<link href="${root}/css/notice/main.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root }/script/notice/notice.js"></script>
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
<title>공지사항</title>
</head>
<body>
	<div id="notice">
		<div class="bf-title-row title-type1">
		<h2>공지사항</h2>		
		</div>

		<div class="notice_list">			
			<ul class="notice_list_title">
				<li>등록일</li>
				<li>제목</li>
			</ul>			
			
			<c:if test="${count==0 }">
				<div>
					<div>공지사항 내용이 없습니당. 상헌이형</div>
				</div>
			</c:if>
			
			<!-- li는 한 블럭 라인? / div로 싹다 고치기 -->
		
			<c:if test="${count>0 }">
				<c:forEach var="noticeDto" items="${noticeList }"	>
					<ul class="notice_list_list">
						<li onclick="readFun('${root}','${noticeDto.num}','${currentPage}')"><fmt:formatDate value="${noticeDto.write_date}" pattern="yyyy-MM-dd" /></li>
						<li onclick="readFun('${root}','${noticeDto.num}','${currentPage}')">${noticeDto.title }</li>
					</ul>
				</c:forEach>				
			</c:if>
			
			
			<fmt:parseNumber var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1) }" integerOnly="true"></fmt:parseNumber>
			<c:set var="pageBlock" value="${5}"/>
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock}" integerOnly="true"/>
			<c:set var="startPage" value="${rs*pageBlock+1}"/>
			<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
			<c:if test="${endPage>pageCount }">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>
			
			
			<nav class="bf-pagination">
			<ul class="bf-animated-btn">
			<c:if test="${startPage>pageBlock}">
				<li class="prev"><a href="${root}/notice/main.do?pageNumber=${startPage-pageBlock}"><span></span></a></li>
			</c:if>	
			
			<c:forEach var="i" begin="${startPage }" end="${endPage}">
				<c:choose>
					<c:when test="${currentPage==i}">
						<li><a class="active" href = "${root}/notice/main.do?pageNumber=${i}" >${i}</a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href = "${root}/notice/main.do?pageNumber=${i}" >${i}</a></li>
					</c:otherwise>				
				</c:choose>
			</c:forEach>
			
			<c:if test="${endPage<pageCount}">
				<li class="next"><a href = "${root}/notice/main.do?pageNumber=${startPage+pageBlock}"><span></span></a></li>
			</c:if>			
				</ul>
			</nav>
				
		</div>
		
		
	</div>
	
</body>
</html>