<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<div id="b_se_wrapper">
		<section class="b_se_main">
			<div class="b_se_header"><h2>도서 검색</h2></div>
			<div class="b_se_content">
				<div class="bf-service-type-menu b_se_tt">
					<!-- 서비스타입 메뉴  -->			
					<ul class="service-type-list b_se_bar">
						<li><span>제목</span></li>
						<li><span>작가</span></li>
						<li><span>출판사</span></li>
					</ul>
					<!-- 검색박스  -->
					<div class="search-box b_se_ta">
						<form action="${root}/manager/bookSearch.do" method="get">
							<span class="material-icons">search</span>
							<input class="search-word" type="text" name="searchWord" placeholder="책 제목 또는 저자명" />
						</form>
					</div>
				</div>
				<div class="b_se_list">
					<ul>
						<c:forEach var="bookDto" items="${bookList}">
							<li>
								<span><a href="${root}/manager/bookRead.do?bnum=${bookDto.book_num}">${bookDto.book_name}</a></span>
								<span>
									<a href="${root}/manager/bookRead.do" title="${bookDto.author_name}">
										${fn:substring(bookDto.author_name,0,9)}<c:if test="${fn:length(bookDto.author_name)>9}">..</c:if>
									</a>
								</span>
								<span><a href="${root}/manager/publisherSearch.do?searchWord=${bookDto.pub_name}">${bookDto.pub_name}</a></span>
								<span class="b_se_btn">
									<button id="${bookDto.book_num}" type="button" class="bf-button">수정</button>
									<button type="button" class="bf-button">삭제</button>
								</span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- 페이징 -->
			<div class="b_se_foot">
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">
						<c:if test="${searchWord==null}">
							<c:set var="href" value="${root}/manager/bookSearch.do?pageNumber="/>
						</c:if>
						<c:if test="${searchWord!=null}">
							<c:set var="href" value="${root}/manager/bookSearch.do?searchWord=${searchWord}&pageNumber="/>
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
		$(".bf-animated-btn").find("li").each(function(){
			if($(this).text()=='${pageNumber}'){
				$(this).find("a").addClass("active");
			}
		});
		
		//수정버튼 클릭이벤트
		$(".b_se_btn").each(function(i,e) {
			$(e).find("button").eq(0).click(function() {
				location.href="${root}/manager/bookUpdate.do?book_num="+$(this).attr("id");
			});
		});
	</script>
</body>
</html>
