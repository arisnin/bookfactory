<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신간</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/genre/newBook.css" />
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/genre/newBook.js"></script>
<script type="text/javascript">
$(function(){
	//해당태그 밑에 밑줄표시
	$(".sub_cate_element > span").removeClass();
	$(".hw_sub_cate li").eq(1).children("span").addClass("activeBar");
});
</script>
</head>
<body>
	<!-- 책상세보기로 요청 방식 :  onclick="location.href='${root}/detail.do'"
		작가 상세보기 요청방식 :  onclick="location.href='${root}/author.do'"
		출판사 클릭시 검색페이지로 : onclick="location.href='${root}/main.search.do'"
	 -->
	<input type="hidden" value="${firstCate}" name="firstCate"/>
	<!-- 18.01.24 최정은 = 신간을 눌렀을때 나오는 화면입니다. -->
	<div id="newBook">
		<div class="bf-title-row title-type1">
			<h2>${firstCateName}신간</h2>
		</div>
		<div class="bf-service-type-menu">
			<ul class="order-type-list">
				<li class="diamond">최신순</li>
			</ul>
			
			<ul class="category-filter-list">
				<li><label class="bf-custom-checkbox">
						<input type="checkbox" title="" />
						<span class="all-mark"></span>
						<span class="checkbox-label">대여</span>
					</label>
				</li>
				<li><label class="bf-custom-checkbox">
						<input type="checkbox" title="" />
						<span class="all-mark"></span>
						<span class="checkbox-label">성인</span>
					</label>
				</li>
				<li><label class="bf-custom-checkbox">
						<input type="checkbox" title="" />
						<span class="all-mark"></span>
						<span class="checkbox-label">성인제외</span>
					</label>
				</li>
				<li>
					<!-- 보기방식 메뉴 -->
					<div class="view-type-list">
						<button class="" type="button" value="landscape" onclick="changeViewType(this)">
							<span class="material-icons">format_list_bulleted</span>
						</button>
						<button class="active" type="button" value="portrait" onclick="changeViewType(this)">
							<span class="material-icons">apps</span>
						</button>
					</div>
				</li>
			</ul>
		</div>
		<!-- 도서 검색 결과 리스트 -->
		<section class="result-search-book-box">
			<ul class="mf-book-list" id="search-view-type">
				<c:forEach var="NewBookDto" items="${newList}">
					<!-- ---------------------------------------------- -->
					<li class="mf-book-item">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="location.href='${root}/detail.do?book_num=${NewBookDto.book_num}'" >
								<img class="" src="${NewBookDto.img_path}" alt="image" />
							</div>
						</div>
						<div class="mf-book-metadata">
							<h3 class="book-metadata-text" onclick="location.href='${root}/detail.do?book_num=${NewBookDto.book_num}'">${NewBookDto.book_name}</h3>
							<p class="book-metadata-author">
								<a class="" href="${root}/author.do?author_num=${NewBookDto.author_num}">${NewBookDto.author_name }</a>
							</p>
							<c:if test="${NewBookDto.illur_num!=0}">
								<p class="book-metadata-translator">
									<a class="" href="${root}/author.do?author_num=${NewBookDto.illur_num}">, ${NewBookDto.illur_name }</a>
								</p>
							</c:if>
							<c:if test="${NewBookDto.trans_num!=0}">
								<p class="book-metadata-translator">
									<a class="" href="${root}/author.do?author_num=${NewBookDto.trans_num}">, ${NewBookDto.trans_name }</a>
								</p>
							</c:if>
							
							<p class="book-metadata-publisher">
								<a class="" href="${root}/author.do?pub_num=${NewBookDto.pub_num}">, ${NewBookDto.publisher_name }</a>
							</p>
							
							<div class="content-star-rate">
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span> <span class="count-field"> 9999명</span>
							</div>
							<pre class="book-metadata-description hidden-block">
								${NewBookDto.intro }
							</pre>
							<c:if test="${NewBookDto.rental_price!=0 }">
								<p class="book-metadata-price hidden-block">
									<span class="price-rent">${NewBookDto.rental_price}</span>원
								</p>
							</c:if>
							<c:if test="${NewBookDto.price!=0 }">
								<p class="book-metadata-price">
									<span class="price-purchase">${NewBookDto.price}</span>원
								</p>
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ul>
			<!-- End : mf-book-list 페이지이이~ -->
			<nav class="bf-pagination">
				<ul class="bf-animated-btn">
					<c:if test="${newCount>0 }">			
						<fmt:parseNumber var="pageCount" value="${newCount/boardSize+(newCount%boardSize==0? 0:1)}" integerOnly="true"/>
						<c:set var="pageBlock" value="${10}"/>
					
						<fmt:parseNumber var="rs" value="${(pageNumber-1)/pageBlock}" integerOnly="true"/>
						<c:set var="startPage" value="${rs*pageBlock+1}"/>
						
						<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
						
						<c:if test="${endPage>pageCount }">
							<c:set var="endPage" value="${pageCount}"/>
						</c:if>
						
						<li class="first"><a href="${root}/new-book.do?pageNumber=1&firstCate=${firstCate}"><span></span></a></li>
						
						<c:if test="${startPage>pageBlock }">
							<li class="prev"><a class="prev" href="${root}/new-book.do?pageNumber=${startPage-pageBlock}&firstCate=${firstCate}"><span></span></a></li>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:choose>
								<c:when test="${pageNumber==i}">
									<li><a class="active" href="${root}/new-book.do?pageNumber=${i}&firstCate=${firstCate}">${i}</a></li>
								</c:when>
								
								<c:otherwise>
									<li><a href="${root}/new-book.do?pageNumber=${i}&firstCate=${firstCate}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${endPage<pageCount }">
							<li class="next"><a href="${root}/new-book.do?pageNumber=${startPage+pageBlock}&firstCate=${firstCate}"><span></span></a></li>
						</c:if>
						
						<li class="last"><a href="${root}/new-book.do?pageNumber=${endPage}&firstCate=${firstCate}"><span></span></a></li>
					</c:if>
				</ul>
			</nav>
		</section>
		<!-- End : result-search-book-box -->

	</div>
	<script type="text/javascript">
	document.querySelectorAll(".content-star-rate").forEach(function(e,i){
		createStarIcon(e, 3.7);
		
	})
	</script>
</body>
</html>