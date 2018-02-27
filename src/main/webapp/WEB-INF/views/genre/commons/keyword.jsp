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
						<span>158</span>
						<span>건의 작품이 있습니다.</span>
					</div>
					<div class="keyword_bottom_view_choice">
						<ol>
							<li><a href="#">평점순</a></li>
							<li><a href="#">인기순</a></li>
							<li><a class="activeFont" href="#">최신순</a></li>
						</ol>
					</div>
				</div>
			</div>
				
			<div class="keyword_bottom_book_list wrap-container">
				<ul class="mf-book-list list-landscape">
 					<c:forEach begin="0" end="5">
						<li class="mf-book-item">
							<div class="mf-book-thumbnail">
								<div class="mf-book-thumbnail-image" onclick="location.href='${root}/detail.do'">
									<img class="" src="//misc.ridibooks.com/cover/111000138/large" alt="image" />
								</div>
							</div>
							<div class="mf-book-metadata">
								<h3 class="book-metadata-text" onclick="location.href='${root}/detail.do'">운현궁의 봄</h3>
								<p class="book-metadata-author">
									<a class="" href="${root}/author.do">김동인</a>
								</p>
								<p class="book-metadata-translator hidden-block">
									<a class="" href="${root}/author.do"></a>
								</p>
								<p class="book-metadata-publisher">
									<a class="" href="${root}/author.do">Public Domain Books</a>
								</p>
								<div class="content-star-rate">
									<span class="star-icon-field material-icons"></span>
									<span class="non-star-icon-field material-icons"></span>
									<span class="count-field"> 9999명</span>
								</div>
								<pre class="book-metadata-description">* 이 책은 Public Domain Books 입니다. Public Domain Books란 저작자 사후 일정 기간이 경과하여 저작권이 만료된 책을 의미합니다. 회원님께서는 인터넷 상의 기타 사이트를 통해서 이 책을 찾아보실 수도 있습니다.
	
	1933년 4월부터 1934년 2월까지 <조선일보>에 연재된 장편소설로 <대수양(大首陽)>과 더불어 김동인의 대표적인 역사소설로 꼽힌다.
							
								</pre>
								<p class="book-metadata-price hidden-block">
									<span class="price-rent"></span>
								</p>
								<p class="book-metadata-price">
									<span class="price-purchase">무료</span>
								</p>
								<div class="keyword_bottom_book_hava_key keyword_choice">
									<ul>
										<li>
											<button type="button" class="bf-button keyword-btn">갖고있는키워드뿌려주긔</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">11111</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2222222</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">3333</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">4444444</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">555555</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">23123</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2132</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">11111</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2222222</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">3333</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">4444444</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">555555</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">23123</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2132</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">11111</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2222222</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">3333</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">4444444</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">555555</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">23123</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2132</button>
										</li>
									</ul>
								</div>
							</div>
						</li>
						<!--  -------------------------------------------------------------------------- -->
					</c:forEach>
				</ul>
			</div>
			
		</div>
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
					
					<li class="last"><a href="${root}/new-book.do?pageNumber=${pageCount}&firstCate=${firstCate}"><span></span></a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	
	<script type="text/javascript">
	document.querySelectorAll(".content-star-rate").forEach(function(e,i){
		createStarIcon(e, 3.7);
		
	})
	</script>
</body>
</html>