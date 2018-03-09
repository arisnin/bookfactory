<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" type="text/css" href="${root}/css/event/event.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css" />
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/genre/event.js"></script>
<title>Insert title here</title>
</head>
<body>
	<input name="firstCate" value="${firstCate}" type="hidden"/>
	<input name="type" value="${type}" type="hidden"/>
	<div class="event">
		<div>
			<div class="bf-title-row title-type4">
				<!-- 제목 클래스변경 -->
				<h3>${firstCateName }이벤트</h3>
			</div>

			<div class="bf-service-type-menu event_header">
				<ul class="service-type-list">
					<li><a href="${root }/event.do?firstCateNum=${firstCate}" class="active">진행중인 이벤트</a></li>
					<li><a href="${root }/event.do?type=ago&firstCateNum=${firstCate}">지난 이벤트</a></li>
				</ul>
			</div>
		</div>
		<c:forEach items="${el}" var="evlist">
			<div class="event_main">
				<div class="event_main_img" onclick="eventDetail('${root}','${evlist.num}')">
					<a>${evlist.short_img}</a>
				</div>
				<div class="event_main_header" onclick="eventDetail('${root}','${evlist.num}')">
					<h3>
						<a>${evlist.title}</a>
					</h3>
				</div>
				<div class="event_main_text_ul-li">
					<ul>
						<li>
							<span>기간</span> 
							<span>${evlist.time}</span>
						</li>
						<li>
							<span>내용</span> 
							<span class="event_main_text">
								${evlist.content}
							</span>
						</li>
					</ul>
				</div>	
			</div>
		</c:forEach>
	</div>
	
	<nav class="bf-pagination">
		<ul class="bf-animated-btn">
			<c:if test="${count>0 }">			
				<fmt:parseNumber var="pageCount" value="${count/boardSize+(count%boardSize==0? 0:1)}" integerOnly="true"/>
				<c:set var="pageBlock" value="${10}"/>
			
				<fmt:parseNumber var="rs" value="${(pageNumber-1)/pageBlock}" integerOnly="true"/>
				<c:set var="startPage" value="${rs*pageBlock+1}"/>
				
				<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
				
				<c:if test="${endPage>pageCount }">
					<c:set var="endPage" value="${pageCount}"/>
				</c:if>
				
				<li class="first"><a href="${root}/event.do?firstCateNum=${firstCate}&type=${type}&pageNumber=1"><span></span></a></li>
				
				<c:if test="${startPage>pageBlock }">
					<li class="prev"><a class="prev" href="${root}/event.do?firstCateNum=${firstCate}&type=${type}&pageNumber=${startPage-pageBlock}"><span></span></a></li>
				</c:if>
				
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:choose>
						<c:when test="${pageNumber==i}">
							<li><a class="active" href="${root}/event.do?firstCateNum=${firstCate}&type=${type}&pageNumber=${i}">${i}</a></li>
						</c:when>
						
						<c:otherwise>
							<li><a href="${root}/event.do?firstCateNum=${firstCate}&type=${type}&pageNumber=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<li class="next"><a href="${root}/event.do?firstCateNum=${firstCate}&type=${type}&pageNumber=${startPage+pageBlock}"><span></span></a></li>
				</c:if>
				
				<li class="last"><a href="${root}/event.do?firstCateNum=${firstCate}&type=${type}&pageNumber=${pageCount}"><span></span></a></li>
			</c:if>
		</ul>
	</nav>
</body>
</html>