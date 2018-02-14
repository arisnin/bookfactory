<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
  	<link rel="stylesheet" href="${root}/css/basic/reset.css">
  	<link rel="stylesheet" href="${root}/css/basic/commons.css">
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
  	<link rel="stylesheet" href="${root}/css/manager/pub.css">
  	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  	<link rel="stylesheet" href="${root}/css/manager/pubSub.css">
  	
</head>
<body>
	<div id="b_se_wrapper">
		<section class="b_se_main">
			<div class="b_se_header"><h2>출판사 검색</h2></div>
			<div class="b_se_content">
				<div class="bf-service-type-menu b_se_tt">
					<!-- 서비스타입 메뉴  -->			
					<ul class="service-type-list p_se_bar">
						<li><span>출판사</span></li>
						<li><span>사이트</span></li>
						<li><span>등록일</span></li>
					</ul>
					<!-- 검색박스  -->
					<div class="search-box b_se_ta">
						<form action="${root}/manager/bookOpenPub.do" method="get">
							<span class="material-icons">search</span>
							<input class="search-word" type="text" name="search-word" placeholder="출판사 명" />
						</form>
					</div>
				</div>
				<div class="p_se_list">
					<ul>
						<c:forEach items="${pubList}" var="publisher">
							<li>
								<span><a href="#${publisher.pub_num}">${publisher.name}</a></span>
								<span>${publisher.url}</span>
								<span><fmt:formatDate value="${publisher.join_date}" pattern="yyyy-MM-dd"/></span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="p_se_foot">
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">
						<li class="first"><a href="#0"><span></span></a></li>
						<li class="prev"><a href="#0"><span></span></a></li>
						   <c:if test="${count > 0}">
								<fmt:parseNumber var ="pageCount" value="${count/boardSize + (count % boardSize == 0?0:1)}" integerOnly="true"/>
								<c:set var ="pageBlock" value="${5}"/>
								<fmt:parseNumber var="rs" value="${(pageNumber-1)/pageBlock}" integerOnly="true"/>
								
								<c:set var="startPage" value="${rs*pageBlock + 1}"/>
								<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
								   
								<c:if test="${endPage > pageCount}">
								   <c:set var="endPage" value="${pageCount}"/>
								</c:if>
					        </c:if>
					        <c:forEach var="i" begin="${startPage}" end="${endPage}">
					        	<li><a href="${root}/manager/bookOpenPub.do?pageNumber=${i}">${i}</a></li>
					        </c:forEach>
						
						<li class="next"><a href="#0"><span></span></a></li>
						<li class="last"><a href="#0"><span></span></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</div>

	
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript">
		$(".p_se_list a").click(function(){
			var value = $(this).text();
			$(opener.document).find("input[name=publisher]").val(value);
			self.close();
		});
	</script>
</body>
</html>
