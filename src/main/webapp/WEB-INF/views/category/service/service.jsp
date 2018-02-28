<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체분야</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/category/service/category.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="wrap-container">
		<section class="wrap-container ca-category-box">
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4 main">
				<span class="material-icons">local_library</span>
				<h3 id="category-main-title">메인타이틀</h3>
				<h4 class="hidden-block">서브타이틀</h4>
			</div>
			
			<!-- 구매 서비스 타입  -->
			<div class="bf-service-type-menu">
				<ul class="service-type-list">
					<li><a href="?snum=100&cnum=${param.cnum}">홈</a></li>
					<li><a href="?snum=101&cnum=${param.cnum}">신간</a></li>
					<li><a href="?snum=102&cnum=${param.cnum}">베스트셀러</a></li>
					<li><a href="?snum=103&cnum=${param.cnum}">무료</a></li>
					<li><a href="?snum=104&cnum=${param.cnum}">전체</a></li>
				</ul>
			</div>
			
			<hr class="line">
			
			<!-- 도서 리스트 정렬 메뉴 -->
			<div class="bf-service-type-menu">
				<!-- 정렬기준 메뉴 -->
				<ul class="order-type-list">
					<li><a class="active" href="#">인기</a></li>
					<li><a href="#">최신순</a></li>
					<li><a href="#">평점순</a></li>
					<li><a href="#">리뷰 많은순</a></li>
				</ul>
				<!-- 보기방식 메뉴 -->
				<div class="view-type-list">
					<button class="${param.vType == 'landscape' ? 'active' : ''}" type="button" value="landscape" onclick="changeViewType(this)">
						<span class="material-icons">format_list_bulleted</span>
					</button>
					<button class="${param.vType == 'portrait' ? 'active' : (param.vType == null ? 'active' : '')}" type="button" value="portrait" onclick="changeViewType(this)">
						<span class="material-icons">apps</span>
					</button>
				</div>
			</div>
			<!-- 도서 검색 결과 리스트 -->
			<section class="result-search-book-box">
				<ul class="mf-book-list ${param.vType == 'landscape' ? 'list-landscape' : ''}" id="search-view-type">
				<c:forEach var="categoryPageDto" items="${categoryPageList}">
					<li class="mf-book-item">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="bookDetailLink('${root}','${categoryPageDto.book_num}')">
								<img class="" src="${categoryPageDto.img_path}" alt="image" />
							</div>
						</div>
						<div class="mf-book-metadata">
							<h3 class="book-metadata-text" onclick="bookDetailLink('${root}','${categoryPageDto.book_num}')">${categoryPageDto.book_name}</h3>
							<!-- 저자 -->
							<c:if test="${categoryPageDto.author_num != 0}">
								<p class="book-metadata-author">
									<a class="" title="저자" href="javascript:alert('${categoryPageDto.author_num}')">${categoryPageDto.author_name}</a>
								</p>
							</c:if>
							<!-- 역자 -->
							<c:if test="${categoryPageDto.trans_num != 0}">
								<p class="book-metadata-translator">
									<a class="" title="역자" href="javascript:alert('${categoryPageDto.trans_num}')">${categoryPageDto.trans_name}</a>
								</p>							
							</c:if>
							<!-- 일러스트레이터 -->
							<c:if test="${categoryPageDto.illur_num != 0}">
								<p class="book-metadata-illustrator">
									<a class="" title="역자" href="javascript:alert('${categoryPageDto.illur_num}')">${categoryPageDto.illur_name}</a>
								</p>							
							</c:if>
							<!-- 출판사 -->
							<c:if test="${categoryPageDto.pub_num != 0}">
								<p class="book-metadata-publisher">
									<a class="" title="출판사" href="javascript:alert('${categoryPageDto.pub_num}')">${categoryPageDto.pub_name}</a>
								</p>
							</c:if>
							<!-- 별점아이콘 생성을 위한 트리거 블록 -->
							<span class="trigger-block hidden-block" onclick="createStarIcon(this.nextElementSibling,${categoryPageDto.star_point})"></span>
							<div class="content-star-rate">
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
								<span class="count-field">&nbsp;${categoryPageDto.star_count}명</span>
							</div>
							<pre class="book-metadata-description">${categoryPageDto.intro}</pre>
							<c:if test="${categoryPageDto.rental_period != 'no'}">
								<p class="book-metadata-price">
									<fmt:formatNumber var="rental_price" value="${categoryPageDto.rental_price}" pattern=",###"/>
									<span class="price-rent">${categoryPageDto.rental_price == 0 ? '무료' : rental_price += ' 원'}</span>
								</p>
							</c:if>
							<c:if test="${categoryPageDto.price >= 0}">
								<p class="book-metadata-price">
									<fmt:formatNumber var="price" value="${categoryPageDto.price}" pattern=",###"/>
									<span class="price-purchase">${categoryPageDto.price == 0 ? '무료' : price += ' 원'}</span>
								</p>
							</c:if>
						</div>
					</li>
				</c:forEach>
				</ul>
				<!-- End : mf-book-list -->
				
				<!-- Pagination value -->
				<c:set var="pageBlock" value="5" />
				<fmt:parseNumber var="pageCount" value="${count/boardSize + (count%boardSize==0 ? 0:1)}" integerOnly="true" />
				<fmt:parseNumber var="rs" value="${(pnum-1)/pageBlock}" integerOnly="true" />
				<c:set var="startPage" value="${1+pageBlock*rs}" />
				<c:set var="endPage" value="${startPage+pageBlock-1}" />
				<c:if test="${endPage > pageCount}">${endPage=pageCount;""}</c:if>
				
				<form id="category-pagination-form" action="#" method="get">
					<nav class="bf-pagination">${count}:${pageBlock}:${pageCount}:${startPage}:${endPage}
						<ul class="bf-animated-btn">
							<li class="first"><a href="javascript:categoryPageHref('1')"><span></span></a></li>
							<!-- 이전 페이지 블록 이동 -->
							<c:if test="${startPage > pageBlock}">								
								<li class="prev"><a href="javascript:categoryPageHref('${startPage-1}')"><span></span></a></li>
							</c:if>
							<!-- 현재 페이지 블록 목록 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:choose>
									<c:when test="${pnum == i}">
										<li><a class="active" href="javascript:categoryPageHref('${i}')">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li><a class="" href="javascript:categoryPageHref('${i}')">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 다음 페이지 블록 이동 -->
							<c:if test="${endPage < pageCount}">
								<li class="next"><a href="javascript:categoryPageHref('${endPage+1}')"><span></span></a></li>
							</c:if>							
							<li class="last"><a href="javascript:categoryPageHref('${pageCount}')"><span></span></a></li>
						</ul>
					</nav>
					<input type="hidden" name="vType" value="portrait" />
					<input type="hidden" name="pnum" value="${pnum}" />
					<input type="hidden" name="snum" value="${param.snum}" />
					<input type="hidden" name="cnum" value="${param.cnum}" />
					<script type="text/javascript">
						function categoryPageHref(pnum) {
							var cateForm = document.getElementById("category-pagination-form");
							cateForm.pnum.value = pnum;
							cateForm.vType.value = document.querySelector("section.ca-category-box > div.bf-service-type-menu > div.view-type-list > button.active").value;
							cateForm.submit();
						}
					</script>
				</form>
			</section>
			<!-- End : result-search-book-box -->
		</section>
	</div>
	<!-- 자바 스크립트 -->
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript">
		Array.prototype.forEach.call(document.querySelectorAll(".trigger-block"), function(e,i) {
			e.click();
		});
		
		function bookDetailLink(root, book_num) {
			location.href = root + '/detail.do?book_num=' + book_num;
		}
	</script>
</body>
</html>