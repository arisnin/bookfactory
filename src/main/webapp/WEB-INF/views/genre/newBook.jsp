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
<script type="text/javascript" src="${root}/script/genre/newBook.js"></script>
</head>
<body>
	<!-- 책상세보기로 요청 방식 :  onclick="location.href='${root}/detail.do'"
		작가 상세보기 요청방식 :  onclick="location.href='${root}/author.do'"
		출판사 클릭시 검색페이지로 : onclick="location.href='${root}/main.search.do'"
	 -->
	<!-- 18.01.24 최정은 = 신간을 눌렀을때 나오는 화면입니다. -->
	<input type="hidden" name="firstCateNum" value="${firstCate }"/>
	<input type="hidden" name="bookType" value="${bookType }"/>
	<input type="hidden" name="seconCate" value="${seconCate }"/>
	<input type="hidden" name="root" value="${root }"/>
	<input type="hidden" name="rental" value="${rental }"/>
	
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
						<input type="checkbox" title="" name="rentalCheck"/>
						<span class="all-mark"></span>
						<span class="checkbox-label">대여</span>
					</label>
				</li>
<!-- 				<li><label class="bf-custom-checkbox"> -->
<!-- 						<input type="checkbox" title="" /> -->
<!-- 						<span class="all-mark"></span> -->
<!-- 						<span class="checkbox-label">성인</span> -->
<!-- 					</label> -->
<!-- 				</li> -->
<!-- 				<li><label class="bf-custom-checkbox"> -->
<!-- 						<input type="checkbox" title="" /> -->
<!-- 						<span class="all-mark"></span> -->
<!-- 						<span class="checkbox-label">성인제외</span> -->
<!-- 					</label> -->
<!-- 				</li> -->
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
							<c:if test="${NewBookDto.author_num!=0}">
								<p class="book-metadata-author">
									<c:if test="${NewBookDto.author_num!=0}">
										<a class="" onclick="authorDetailHref('${root}','${NewBookDto.author_num}')">${NewBookDto.author_name }</a>
									</c:if>
									<c:if test="${NewBookDto.illur_num!=0}">
										<a class="" onclick="authorDetailHref('${root}','${NewBookDto.author_num}')">, ${NewBookDto.illur_name }</a>
									</c:if>
									<c:if test="${NewBookDto.trans_num!=0}">
										<a class="" onclick="authorDetailHref('${root}','${NewBookDto.author_num}')">, ${NewBookDto.trans_name }</a>
									</c:if>
								</p>
							</c:if>
							
							<c:if test="${NewBookDto.pub_num!=0}">
								<p class="book-metadata-publisher">
									<a class="" href="${root}/author.do?pub_num=${NewBookDto.pub_num}">${NewBookDto.publisher_name }</a>
								</p>
							</c:if>
							<!-- 별점아이콘 생성을 위한 트리거 블록 -->
							<span class="trigger-block hidden-block" onclick="createStarIcon(this.nextElementSibling,${NewBookDto.star_point == null ? 0 : NewBookDto.star_point})"></span>
							<div class="content-star-rate">
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span> <span class="count-field"> ${NewBookDto.star_count}명</span>
							</div>
							<pre class="book-metadata-description">
								${NewBookDto.intro }
							</pre>
							
							<c:choose>
								<c:when test="${NewBookDto.rental_price!=0 }">
									<p class="book-metadata-price">
										<span class="price-rent">${NewBookDto.rental_price}원</span>
									</p>
								</c:when>
								
								<c:when test="${NewBookDto.price!=0 }">
									<p class="book-metadata-price">
										<span class="price-purchase">${NewBookDto.price}원</span>
									</p>
								</c:when>
								
								<c:otherwise>
									<p class="book-metadata-price">
										<span class="price-purchase">무료</span>
									</p>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
				</c:forEach>
			</ul>
			<!-- End : mf-book-list 페이지이이~ -->
			<form id="newbook-pagination-form" action="#" method="get">
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
			</form>
		</section>
		<!-- End : result-search-book-box -->

	</div>
	<!-- 자바 스크립트 -->
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
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