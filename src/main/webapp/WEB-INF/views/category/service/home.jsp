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
				<h3 id="category-main-title">홈</h3>
				<h4 class="hidden-block">서브타이틀</h4>
			</div>
			
			<!-- 구매 서비스 타입  -->
			<div class="bf-service-type-menu">
				<ul class="service-type-list">
					<li><a class="active" href="?snum=100&cnum=${param.cnum}">홈</a></li>
					<li><a href="?snum=101&cnum=${param.cnum}">신간</a></li>
					<li><a href="?snum=102&cnum=${param.cnum}">베스트셀러</a></li>
					<li><a href="?snum=103&cnum=${param.cnum}">무료</a></li>
					<li><a href="?snum=104&cnum=${param.cnum}">전체</a></li>
				</ul>
			</div>
			<!-- -------------------------------------- -->
			<!-- 인기 신간 -->
			<div class="bf-title-row title-type3 sub">
				<h3><span>소설</span>&nbsp;인기 신간</h3>
				<div class="more-button-box">
					<button type="button" class="bf-button bf-black-btn bf-animated-btn" onclick="location.href='?snum=101&cnum=${param.cnum}';">전체보기</button>
				</div>
			</div>
			
			<!-- 인기 신간 리스트 -->
			<section class="result-search-book-box">
				<ul class="mf-book-list" id="search-view-type">
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
				<c:if test="${categoryPageList.size() == 0 or categoryPageList == null}">
					<li class="mf-book-item mf-book-empty">
						<div><span class="material-icons">library_books</span></div>
						<p>죄송합니다. 검색된 책이 없습니다.</p>						
					</li>
				</c:if>
				</ul>
			</section><!-- End : result-search-book-box -->
			<!-- -------------------------------------- -->
			<!-- 베스트셀러 -->
			<div class="bf-title-row title-type3 sub">
				<h3><span>소설</span>&nbsp;베스트셀러</h3>
				<div class="more-button-box">
					<button type="button" class="bf-button bf-black-btn bf-animated-btn" onclick="location.href='?snum=102&cnum=${param.cnum}';">전체보기</button>
				</div>
			</div>
			
			<!-- 베스트셀러 리스트 -->
			<section class="result-search-book-box">
				<ul class="mf-book-list" id="">
				<c:forEach var="categoryPageDto" items="${categoryPageBestList}">
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
				<c:if test="${categoryPageBestList.size() == 0 or categoryPageBestList == null}">
					<li class="mf-book-item mf-book-empty">
						<div><span class="material-icons">library_books</span></div>
						<p>죄송합니다. 검색된 책이 없습니다.</p>						
					</li>
				</c:if>
				</ul>
			</section><!-- End : result-search-book-box -->
			<!-- -------------------------------------- -->
			<!-- 무료책 -->
			<div class="bf-title-row title-type3 sub">
				<h3><span>소설</span>&nbsp;인기 무료책</h3>
				<div class="more-button-box">
					<button type="button" class="bf-button bf-black-btn bf-animated-btn" onclick="location.href='?snum=103&cnum=${param.cnum}';">전체보기</button>
				</div>
			</div>
			
			<!-- 무료책 리스트 -->
			<section class="result-search-book-box">
				<ul class="mf-book-list" id="">
				<c:forEach var="categoryPageDto" items="${categoryPageFreeList}">
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
				<c:if test="${categoryPageFreeList.size() == 0 or categoryPageFreeList == null}">
					<li class="mf-book-item mf-book-empty">
						<div><span class="material-icons">library_books</span></div>
						<p>죄송합니다. 검색된 책이 없습니다.</p>						
					</li>
				</c:if>
				</ul>
			</section><!-- End : result-search-book-box -->
		</section>
	</div>
	<!-- 자바 스크립트 -->
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript">
		Array.prototype.forEach.call(document.querySelectorAll(".trigger-block"), function(e,i) {
			e.click();
		});
	</script>
</body>
</html>