<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>베스트셀러</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/genre/newBook.css" />
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/genre/bestSeller.js"></script>
</head>
<body>
	<!-- 책상세보기로 요청 방식 :  onclick="location.href='${root}/detail.do'"
		  작가 상세보기 요청방식 :  onclick="location.href='${root}/author.do'"
		  출판사 클릭시 검색페이지로 : onclick="location.href='${root}/main/search.do'"
	 -->

	<!-- 18.01.24 최정은 = 베스트셀러를 눌렀을때 나오는 화면입니다. -->
	<input type="hidden" name="bookType" value="${bookType }"/>
	<input type="hidden" name="seconCate" value="${seconCate }"/>
	<input type="hidden" name="root" value="${root }"/>
	<input type="hidden" name="rental" value="${rental }"/>
	
	<div id="newBook">
		<div class="bf-title-row title-type1">
			<h2>${firstCateName} 베스트셀러</h2>
		</div>
		<div class="bf-service-type-menu">
			<ul class="order-type-list">
				<li class="diamond"><a class="active" href="${root}/best-sell.do?firstCateNum=${firstCate}&bestSeller=weekBest">주간 베스트셀러</a></li>
				<li class="diamond"><a href="${root}/best-sell.do?firstCateNum=${firstCate}&bestSeller=monthBest">월간 베스트셀러</a></li>
				<li class="diamond"><a href="${root}/best-sell.do?firstCateNum=${firstCate}&bestSeller=steady">스테디셀러</a></li>
			</ul>
			<ul class="category-filter-list">
				<li><label class="bf-custom-checkbox"> <input type="checkbox" title="" name="rentalCheck"/> <span class="all-mark"></span> <span class="checkbox-label">대여</span>
				</label></li>
<!-- 				<li><label class="bf-custom-checkbox"> <input type="checkbox" title="" /> <span class="all-mark"></span> <span class="checkbox-label">성인</span> -->
<!-- 				</label></li> -->
<!-- 				<li><label class="bf-custom-checkbox"> <input type="checkbox" title="" /> <span class="all-mark"></span> <span class="checkbox-label">성인제외</span> -->
<!-- 				</label></li> -->
				<li>
					<!-- 보기방식 메뉴 -->
					<div class="view-type-list">
						<button class="${param.vType == 'landscape' ? 'active' : ''}" type="button" value="landscape" onclick="changeViewType(this)">
							<span class="material-icons">format_list_bulleted</span>
						</button>
						<button class="${param.vType == 'portrait' ? 'active' : (param.vType == null ? 'active' : '')}" type="button" value="portrait" onclick="changeViewType(this)">
							<span class="material-icons">apps</span>
						</button>
					</div>
				</li>
			</ul>
		</div>
		<!-- 도서 검색 결과 리스트 -->
		<section class="result-search-book-box">
			<ul class="mf-book-list ${param.vType == 'landscape' ? 'list-landscape' : ''}" id="search-view-type">
				<c:forEach var="best" items="${bestDto}">
					<!-- ---------------------------------------------- -->
					<li class="mf-book-item">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="location.href='${root}/detail.do?book_num=${best.book_num}'" >
								<img class="" src="${best.img_path}" alt="image" />
							</div>
						</div>
						<div class="mf-book-metadata">
							<h3 class="book-metadata-text" onclick="location.href='${root}/detail.do?book_num=${best.book_num}'">${best.bookName}</h3>
							<c:if test="${best.author_num!=0}">
								<p class="book-metadata-author">
									<a class="" onclick="authorDetailHref('${root}','${best.author_num}')">${best.authorName}</a>
								</p>							
							</c:if>
							<span class="trigger-block hidden-block" onclick="createStarIcon(this.nextElementSibling,${best.star_point})"></span>
							<div class="content-star-rate">
								<span class="star-icon-field material-icons"></span>
								<span class="non-star-icon-field material-icons"></span>
								<span class="count-field"> ${best.star_count}명</span>
							</div>
							<c:if test="${best.intro!='없음'}">
								<pre class="book-metadata-description">
									${best.intro }
								</pre>
							</c:if>
							
							<c:choose>
								<c:when test="${best.rental_period!='no'}">
									<p class="book-metadata-price">
									<c:choose>
										<c:when test="${best.rental_price==0}">
											<span class="price-rent">무료</span>
										</c:when>
										
										<c:otherwise>
											<span class="price-rent">${best.rental_price}</span>
										</c:otherwise>
									</c:choose>
									</p>
								</c:when>
								
								<c:when test="${best.price !=0}">
									<p class="book-metadata-price">
									<c:choose>
										<c:when test="${best.price==0}">
											<span class="price-purchase">무료</span>
										</c:when>
										
										<c:otherwise>
											<span class="price-purchase">${best.price}</span>
										</c:otherwise>
									</c:choose>
									</p>
								</c:when>
								
								<c:when test="${best.price ==0 && best.rental_price==0}">
									<p class="book-metadata-price">
										<span class="price-purchase">무료</span>
									</p>
								</c:when>
							</c:choose>
						</div>
					</li>
				</c:forEach>
			</ul>
			<!-- End : mf-book-list -->
			<form id="newbook-pagination-form" action="#" method="get">
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">
						<c:if test="${bestDtoCount>0 }">			
							<fmt:parseNumber var="pageCount" value="${bestDtoCount/boardSize+(bestDtoCount%boardSize==0? 0:1)}" integerOnly="true"/>
							<c:set var="pageBlock" value="${10}"/>
						
							<fmt:parseNumber var="rs" value="${(pageNumber-1)/pageBlock}" integerOnly="true"/>
							<c:set var="startPage" value="${rs*pageBlock+1}"/>
							
							<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
							
							<c:if test="${endPage>pageCount }">
								<c:set var="endPage" value="${pageCount}"/>
							</c:if>
							
							<li class="first"><a href="javascript:newBookPageHref('1')"><span></span></a></li>
							
							<c:if test="${startPage>pageBlock }">
								<li class="prev"><a class="prev" href="javascript:newBookPageHref('${startPage-pageBlock}')"><span></span></a></li>
							</c:if>
							
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:choose>
									<c:when test="${pageNumber==i}">
										<li><a class="active" href="javascript:newBookPageHref('${i}')">${i}</a></li>
									</c:when>
									
									<c:otherwise>
										<li><a href="javascript:newBookPageHref('${i}')">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:if test="${endPage<pageCount }">
								<li class="next"><a href="javascript:newBookPageHref('${startPage+pageBlock}')"><span></span></a></li>
							</c:if>
							
							<li class="last"><a href="javascript:newBookPageHref('${pageCount}')"><span></span></a></li>
						</c:if>
					</ul>
				</nav>
				<input type="hidden" name="vType" value="portrait" />
				<input type="hidden" name="pageNumber" value="${pageNumber}" />
				<input type="hidden" name="firstCateNum" value="${firstCate}" />
				<input type="hidden" name="bestSeller" value="${bestSeller}" />
			</form>
		</section>
		<!-- End : result-search-book-box -->
	</div>
	
	<script type="text/javascript">
		/* Array.prototype.forEach.call(document.querySelectorAll(".trigger-block"), function(e,i) {
			e.click();
		}); */
		
		function newBookPageHref(pnum) {
			var cateForm = document.getElementById("newbook-pagination-form");
			cateForm.pageNumber.value = pnum;
			cateForm.vType.value = document.querySelector("#newBook > div.bf-service-type-menu div.view-type-list > button.active").value;
			cateForm.submit();
		}
	</script>

	<script type="text/javascript">
      Array.prototype.forEach.call(document.querySelectorAll(".trigger-block"), function(e,i) {
         e.click();
      });
   </script>

</body>
</html>