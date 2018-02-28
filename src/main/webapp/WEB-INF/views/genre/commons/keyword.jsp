<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>키워드 검색</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/genre/keyword.css" />
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<%-- <script type="text/javascript" src="${root}/script/genre/keyword_check.js"></script> --%>
<script type="text/javascript" src="${root}/script/genre/keywordA.js"></script>
</head>
<body>
	<input type="hidden" name="rootJS" value="${root}"/>
	<input type="hidden" name="firstCate" value="${firstCate}"/>
	<input type="hidden" name="tags"/>
	
	<div class="keyword wrap-container">
		<div class="keyword_top">
			<div class="keyword_top_head">
				<span class="material-icons">search</span>
				<span class="title">키워드로 검색하기</span>
				<span class="sub-title">키워드로 마음에 드는 책을 찾아보세요!</span>
				<button type="button" class="bf-button bf-transparent-btn">전체 해제</button>
			</div>
			
			<form id="keyword_top_list"></form>
		</div>
		
		<div class="keyword_bottom">
			<div class="keyword_not_choice">
				<!-- 아무것도선택하지않았을때의 이미지 : 처음화면 -->
				<img src="${root}/img/arrow.PNG">
			</div>
			
			<div>	<!-- 태그를 선택하면 이 화면 나와야함 -->
				<div class="keyword_choice ">
					<ul class="tag-list">
					<!-- <li><button type="button" class="bf-button keyword-btn">
								키워드1
								<span class="button_x">X</span>
							</button>
						</li> -->
					</ul>
				</div>

				<!-- 해당되는 책이 없을때 나오는 화면 
				물어봐여함 책이없으면 키워드추가이벤트를 없애고 태그를 지울경우에 다시이벤트활성화
				-->
				<div class="keyword_no_search">
					<img src="${root}/img/sad.PNG">
				</div>
			</div>
				
			<div>
				<div class="keyword_bottom_head">
					<div>
						<span class="tagListCount">158</span>
						<span>건의 작품이 있습니다.</span>
					</div>
					<div class="keyword_bottom_view_choice">
						<ol>
<!-- 							<li><a href="#">평점순</a></li> -->
<!-- 							<li><a href="#">인기순</a></li> -->
							<li><a class="activeFont">최신순</a></li>
						</ol>
					</div>
				</div>
			</div>
				
			<div class="keyword_bottom_book_list wrap-container">
				<ul class="mf-book-list list-landscape" id="keywordTagList"></ul>
			</div>
			
		</div>
		<nav class="bf-pagination">
			<ul class="bf-animated-btn" id="bf-animated-btn">
<%-- 				<c:if test="${newCount>0 }">			 --%>
<%-- 					<fmt:parseNumber var="pageCount" value="${newCount/boardSize+(newCount%boardSize==0? 0:1)}" integerOnly="true"/> --%>
<%-- 					<c:set var="pageBlock" value="${10}"/> --%>
				
<%-- 					<fmt:parseNumber var="rs" value="${(pageNumber-1)/pageBlock}" integerOnly="true"/> --%>
<%-- 					<c:set var="startPage" value="${rs*pageBlock+1}"/> --%>
					
<%-- 					<c:set var="endPage" value="${startPage+pageBlock-1 }"/> --%>
					
<%-- 					<c:if test="${endPage>pageCount }"> --%>
<%-- 						<c:set var="endPage" value="${pageCount}"/> --%>
<%-- 					</c:if> --%>
					
<%-- 					<li class="first"><a href="${root}/new-book.do?pageNumber=1&firstCate=${firstCate}"><span></span></a></li> --%>
					
<%-- 					<c:if test="${startPage>pageBlock }"> --%>
<%-- 						<li class="prev"><a class="prev" href="${root}/new-book.do?pageNumber=${startPage-pageBlock}&firstCate=${firstCate}"><span></span></a></li> --%>
<%-- 					</c:if> --%>
					
<%-- 					<c:forEach var="i" begin="${startPage}" end="${endPage}"> --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${pageNumber==i}"> --%>
<%-- 								<li><a class="active" href="${root}/new-book.do?pageNumber=${i}&firstCate=${firstCate}">${i}</a></li> --%>
<%-- 							</c:when> --%>
							
<%-- 							<c:otherwise> --%>
<%-- 								<li><a href="${root}/new-book.do?pageNumber=${i}&firstCate=${firstCate}">${i}</a></li> --%>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<%-- 					</c:forEach> --%>
					
<%-- 					<c:if test="${endPage<pageCount }"> --%>
<%-- 						<li class="next"><a href="${root}/new-book.do?pageNumber=${startPage+pageBlock}&firstCate=${firstCate}"><span></span></a></li> --%>
<%-- 					</c:if> --%>
					
<%-- 					<li class="last"><a href="${root}/new-book.do?pageNumber=${pageCount}&firstCate=${firstCate}"><span></span></a></li> --%>
<%-- 				</c:if> --%>
			</ul>
		</nav>
	</div>
	
   	<script type="text/javascript">
      Array.prototype.forEach.call(document.querySelectorAll(".trigger-block"), function(e,i) {
         e.click();
      });
	</script>
</body>
</html>