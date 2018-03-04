<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가정보</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${root}/icon/css/fontello.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/book/plus.css" rel="stylesheet" type="text/css">
<link href="${root}/css/book/author.css" type="text/css" rel="stylesheet">
</head>
<body>
	<c:set var="anum" value="${param.anum == null ? 0 : param.anum}"/>
	<c:set var="onum" value="${param.onum == null ? 100 : param.onum}"/>
	<section class="wrap-container bf-author-info-box">
		<div class="wrap-container author-info">
			<div class="profile_ex">
				<div class="author">${authorDto.name}</div>

				<button class="add-notice">
					<span class="icon-plus"></span>
					작가 신간알림·소식
				</button>
				<ol class="content">
					<c:if test="${authorDto.country_name!='없음'}">
						<li><span>국적</span><span>${authorDto.country_name}</span></li>
					</c:if>
					<c:if test="${authorDto.birthday!='없음'}">
						<li><span>출생</span><span>${authorDto.birthday}</span></li>
					</c:if>
					<c:if test="${authorDto.education!='없음'}">
						<li><span>학력</span><span>${authorDto.education}</span></li>
					</c:if>
					<c:if test="${authorDto.debut!='없음'}">
						<li><span>데뷔</span><span>${authorDto.debut}</span></li>
					</c:if>
					<c:if test="${authorDto.career!='없음'}">
						<li><span>경력</span><span>${authorDto.career}</span></li>
					</c:if>
					<c:if test="${authorDto.awards!='없음'}">
						<li><span>수상내역</span><span>${authorDto.awards}</span></li>
					</c:if>
					<c:if test="${authorDto.link!='없음'}">
						<li><span>홈페이지</span><span>${authorDto.link}</span></li>
					</c:if>
				</ol>
				<div class="profile_date">
					<span class="update">
						<fmt:formatDate value="${authorDto.update_date}" pattern="yyyy년 MM월 dd일" />
					</span>
					<input class="bf-button bf-white-btn" type="button" value="정보수정요청" onclick="profilUpdate('${root}','${detailDto.author_num}')" />
				</div>
			</div>
			<c:if test="${authorDto.describe!='없음'}">
				<div class="describe">
					<p>${authorDto.describe}</p>
				</div>
			</c:if>
		</div>
		<div class="wrap-container author-book-info">
			<!-- 도서 검색 결과 -->
			<div class="bf-title-row title-type1">
				<h2><span class="search-word">검색어</span>&nbsp;도서 검색 결과</h2>
			</div>
			<div class="bf-service-type-menu">
				<!-- 정렬기준 메뉴 -->
				<ul class="order-type-list">
					<li><a class="${onum == 100 ? 'active':''}" href="?onum=100&anum=${anum}">최신순</a></li>
					<li><a class="${onum == 101 ? 'active':''}" href="?onum=101&anum=${anum}">별점순</a></li>
					<li><a class="${onum == 102 ? 'active':''}" href="?onum=102&anum=${anum}">리뷰평가순</a></li>
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
				<c:forEach var="categoryPageDto" items="${authorBookList}">
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
				<c:if test="${authorBookList.size() == 0 or authorBookList == null}">
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
				<c:if test="${pageCount > 1}">
					<span class="pagination-info hidden-block">${count}:${pageBlock}:${pageCount}:${startPage}:${endPage}</span>
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
					<input type="hidden" name="vType" value="portrait" />
					<input type="hidden" name="pnum" value="${pnum}" />
					<input type="hidden" name="onum" value="${onum}" />
					<input type="hidden" name="anum" value="${anum}" />
					<script type="text/javascript">
						function searchBookPageHref(pnum) {
							var cateForm = document.getElementById("search-pagination-form");
							cateForm.pnum.value = pnum;
							cateForm.vType.value = document.querySelector(".author-book-info > div.bf-service-type-menu > div.view-type-list > button.active").value;
							cateForm.submit();
						}
					</script>
				</c:if>
				</form>
			</section><!-- End : result-search-book-box -->
		</div>
		
	</section>
	<%-- 자바 스크립트 --%>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript">
		Array.prototype.forEach.call(document.querySelectorAll(".trigger-block"), function(e,i) {
			e.click();
		});
		
		function profilUpdate(root, author_num){
			window.open(root+"/authorProfilUpdate.do?author_num="+author_num, 'update', 'top=100px, left=100px, height=450px, width=370px');
		}
	</script>
</body>
</html>