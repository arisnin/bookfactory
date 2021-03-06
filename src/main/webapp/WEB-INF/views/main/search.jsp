<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Search</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/main/search.css" type="text/css" rel="stylesheet">
</head>
<body>
	<c:set var="cnum" value="${param.cnum == null ? 0 : param.cnum}"/>
	<c:set var="onum" value="${param.onum == null ? 100 : param.onum}"/>
	<c:set var="keyword" value="${param.keyword}" />
	<c:set var="authorListSize" value="${searchAuthorList == null ? 0 : searchAuthorList.size()}"/>
	<div class="main-search-box">
		<!-- 검색 결과 내용 -->
		<div class="main-search-contents">
			<!-- 저자 검색 결과 -->
			<div class="bf-title-row title-type1">
				<h2><span class="search-word">${param.keyword}</span>&nbsp;저자 검색 결과<span class="author-count">${searchAuthorList == null ? '' : authorListSize}</span></h2>
			</div>
			<section class="result-search-author-box">
				<ul>
				<c:forEach var="searchAuthorDto" items="${searchAuthorList}" varStatus="status">
					<li class="${status.count > 3 ? 'hidden-block' : ''}">
						<button type="button" class="bf-button bf-transparent-btn" onclick="authorDetailHref('${root}','${searchAuthorDto.author_num}')">
							<span class="material-icons">person</span>
							<span class="author">${searchAuthorDto.author_name}</span>
							<c:if test="${searchAuthorDto.count > 0}">
								<span class="book">&nbsp;${searchAuthorDto.book_name}</span>
								<span class="more-count ${searchAuthorDto.count == 1 ? 'hidden-block':''}">외&nbsp;${searchAuthorDto.count - 1}권</span>
							</c:if>
						</button>
					</li>
				</c:forEach>
				</ul>
				<div class="search-more-button ${authorListSize > 3 ? '' : 'hidden-block'}">
					<label class="bf-custom-checkbox checkbox-btn">
						<input type="checkbox" title="저자검색" onclick="collapseSearchBoxToggle(this)" />
						<span class="bf-button bf-transparent-btn collapse">
							<span class="more-count">${authorListSize - 3}</span>
							<span class="extra-word">개 더보기</span>
							<span class="extra-word hidden-block">접기</span>
						</span>
					</label>
				</div>
			</section>
			<!-- 도서 검색 결과 -->
			<div class="bf-title-row title-type1">
				<h2><span class="search-word">검색어</span>&nbsp;도서 검색 결과</h2>
			</div>
			<div class="bf-service-type-menu">
				<!-- 정렬기준 메뉴 -->
				<ul class="order-type-list">
					<li><a class="${onum == 100 ? 'active':''}" href="?onum=100&cnum=${cnum}&keyword=${keyword}">최신순</a></li>
					<li><a class="${onum == 101 ? 'active':''}" href="?onum=101&cnum=${cnum}&keyword=${keyword}">별점순</a></li>
					<li><a class="${onum == 102 ? 'active':''}" href="?onum=102&cnum=${cnum}&keyword=${keyword}">리뷰평가순</a></li>
					<li><a class="${onum == 103 ? 'active':''}" href="?onum=103&cnum=${cnum}&keyword=${keyword}">낮은가격순</a></li>
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
				<c:forEach var="categoryPageDto" items="${searchBookList}">
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
									<a class="" title="저자" href="javascript:authorDetailHref('${root}','${categoryPageDto.author_num}')">${categoryPageDto.author_name}</a>
								</p>
							</c:if>
							<!-- 역자 -->
							<c:if test="${categoryPageDto.trans_num != 0}">
								<p class="book-metadata-translator">
									<a class="" title="역자" href="javascript:authorDetailHref('${root}','${categoryPageDto.trans_num}')">${categoryPageDto.trans_name}</a>
								</p>
							</c:if>
							<!-- 일러스트레이터 -->
							<c:if test="${categoryPageDto.illur_num != 0}">
								<p class="book-metadata-illustrator">
									<a class="" title="역자" href="javascript:authorDetailHref('${root}','${categoryPageDto.illur_num}')">${categoryPageDto.illur_name}</a>
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
				<c:if test="${searchBookList.size() == 0 or searchBookList == null}">
					<li class="mf-book-item mf-book-empty">
						<div><span class="material-icons">library_books</span></div>
						<p>죄송합니다. 검색된 책이 없습니다.</p>						
					</li>
				</c:if>
				</ul>
				<!-- End : mf-book-list -->
				
				<!-- Pagination value -->
				<c:set var="pageBlock" value="5" />
				<fmt:parseNumber var="pageCount" value="${count/boardSize + (count%boardSize==0 ? 0:1)}" integerOnly="true" />
				<fmt:parseNumber var="rs" value="${(pnum-1)/pageBlock}" integerOnly="true" />
				<c:set var="startPage" value="${1+pageBlock*rs}" />
				<c:set var="endPage" value="${startPage+pageBlock-1}" />
				<c:if test="${endPage > pageCount}">${endPage=pageCount;""}</c:if>

				<form id="search-pagination-form" action="#" method="get">
				<span class="pagination-info hidden-block">${count}:${pageBlock}:${pageCount}:${startPage}:${endPage}</span>
				<c:if test="${pageCount > 1}">
					<nav class="bf-pagination">
						<ul class="bf-animated-btn">
							<li class="first"><a href="javascript:searchBookPageHref('1')"><span></span></a></li>
							<!-- 이전 페이지 블록 이동 -->
							<c:if test="${startPage > pageBlock}">
								<li class="prev"><a href="javascript:searchBookPageHref('${startPage-1}')"><span></span></a></li>
							</c:if>
							<!-- 현재 페이지 블록 목록 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:choose>
									<c:when test="${pnum == i}">
										<li><a class="active" href="javascript:searchBookPageHref('${i}')">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li><a class="" href="javascript:searchBookPageHref('${i}')">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 다음 페이지 블록 이동 -->
							<c:if test="${endPage < pageCount}">
								<li class="next"><a href="javascript:searchBookPageHref('${endPage+1}')"><span></span></a></li>
							</c:if>
							<li class="last"><a href="javascript:searchBookPageHref('${pageCount}')"><span></span></a></li>
						</ul>
					</nav>
					<script type="text/javascript">
						function searchBookPageHref(pnum) {
							var cateForm = document.getElementById("search-pagination-form");
							cateForm.pnum.value = pnum;
							cateForm.vType.value = document.querySelector(".main-search-contents > div.bf-service-type-menu > div.view-type-list > button.active").value;
							cateForm.submit();
						}
					</script>
				</c:if>
					<input type="hidden" name="vType" value="portrait" />
					<input type="hidden" name="pnum" value="${pnum}" />
					<input type="hidden" name="onum" value="${onum}" />
					<input type="hidden" name="cnum" value="${cnum}" />
					<input type="hidden" name="keyword" value="${keyword}" />
				</form>
			</section><!-- End : result-search-book-box -->
		</div>

		<!-- 검색 결과 목록 -->
		<div class="main-search-list">
			<h3 class="title">분야</h3>
			<ul>
				<li class="${cnum == null || cnum == 0 ? 'active' : ''}">
					<button type="button" class="bf-button bf-transparent-btn" onclick="searchBookCategory('${root}','0')">전체(${totalCount})</button>
				</li>
			<c:forEach var="searchBookCountDto" items="${searchBookCountList}">
				<li class="${cnum == searchBookCountDto.num ? 'active' : ''}">
					<button type="button" class="bf-button bf-transparent-btn" onclick="searchBookCategory('${root}','${searchBookCountDto.num}')">${searchBookCountDto.name}(${searchBookCountDto.count})</button>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
	<%-- 자바 스크립트 --%>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript">
		Array.prototype.forEach.call(document.querySelectorAll(".trigger-block"), function(e,i) {
			e.click();
		});
		
		function bookDetailLink(root, book_num) {			
			location.href = root + '/detail.do?book_num=' + book_num;
		}
		
		function searchBookCategory(root, thirdCateNum) {
			var cateForm = document.getElementById("search-pagination-form");
			location.href = '?onum=' + cateForm.onum.value + '&cnum=' + thirdCateNum + '&keyword=' + cateForm.keyword.value;
		}
		
		function collapseSearchBoxToggle(event) {
			var searchList = document.querySelectorAll(".result-search-author-box > ul > li:nth-child(3) ~ li");
			searchList.forEach(function(e,i) {
				if (event.checked == true) {
					e.classList.remove("hidden-block");
				} else {
					e.classList.add("hidden-block");
				}
			});
			var next = event.nextElementSibling;
				next.classList.toggle("collapse");
				next.firstElementChild.classList.toggle("hidden-block");
			var extra = next.querySelectorAll(".extra-word");
				extra[0].classList.toggle("hidden-block");
				extra[1].classList.toggle("hidden-block");
		}
	</script>
</body>
</html>