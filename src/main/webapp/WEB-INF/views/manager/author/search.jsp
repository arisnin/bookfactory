<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  	<link rel="stylesheet" href="${root}/css/manager/author.css">
  	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<div id="b_se_wrapper">
		<section class="b_se_main">
			<div class="b_se_header"><h2>작가 검색</h2></div>
			<div class="b_se_content">
				<div class="bf-service-type-menu b_se_tt">
					<!-- 서비스타입 메뉴  -->			
					<ul class="service-type-list a_se_bar">
						<li><span>이름</span></li>
						<li><span>경력</span></li>
						<li><span>최근수상내역</span></li>
						<li><span>출판책개수</span></li>
					</ul>
					<!-- 검색박스  -->
					<div class="search-box b_se_ta">
						<form method="get">
							<span class="material-icons">search</span>
							<input class="search-word" type="text" name="searchWord" placeholder="책 제목 또는 저자명" value="${searchWord}"/>
							
						</form>
					</div>
				</div>
				<div class="a_se_list">
					<ul>
						<c:forEach items="${authorList}" var="author">
							<li>
								<span title="${author.name}">${fn:substring(fn:trim(author.name),0,10)}<c:if test="${fn:length(author.name) > 10}">..</c:if></span>
								<span title="${fn:replace(author.career,'<br>','')}">${fn:substring(fn:trim(fn:replace(author.career,'<br>','')),0,13)}<c:if test="${fn:length(author.career) > 13}">..</c:if></span>
								<span title="${fn:replace(author.awards,'<br>','')}">${fn:substring(fn:trim(fn:replace(author.awards,'<br>','')),0,13)}<c:if test="${fn:length(author.awards) > 13}">..</c:if></span>
								<span>${author.cnt}권</span>
								<span class="a_se_btn">
									<button type="button" class="bf-button" onclick="goUpdate('${root}/manager/authorRead.do?num=${author.num}')">상세보기</button>
									<button type="button" class="bf-button" onclick="alert('삭제')">삭제</button>
								</span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<input type="hidden" name="href">
			
			<div class="a_se_foot">
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">
						<c:if test="${searchWord==null}">
							<c:set var="href" value="${root}/manager/authorSearch.do?pageNumber="/>
						</c:if>
						<c:if test="${searchWord!=null}">
							<c:set var="href" value="${root}/manager/authorSearch.do?searchWord=${searchWord}&pageNumber="/>
						</c:if>
						
						<li class="first"><a href="${href}1"><span></span></a></li>
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
						
						<c:if test="${startPage > pageBlock}">
							<li class="prev"><a href="${href}${startPage-1}"><span></span></a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li><a href="${href}${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${endPage < pageCount}">
							<li class="next"><a href="${href}${endPage+1}"><span></span></a></li>
						</c:if>
						<li class="last"><a href="${href}${pageCount}"><span></span></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</div>
	
	
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript">
		function goUpdate(url){
			location.href=url + $("input[name=href]").val();
		}
		//페이지 활성화
		$(".bf-animated-btn").find("li").each(function(){
			if($(this).text()=='${pageNumber}'){
				$(this).find("a").addClass("active");
			}
		});
		var before = location.href;
		if(before.indexOf('?') == -1){
			$("input[name=href]").val("");
		}else{
			$("input[name=href]").val("&"+ before.substring(before.indexOf('?')+1));
		}
	</script>
	
</body>
</html>
