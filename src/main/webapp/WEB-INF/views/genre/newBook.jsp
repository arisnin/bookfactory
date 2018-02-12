<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
</head>
<body>
	<!-- 책상세보기로 요청 방식 :  onclick="location.href='${root}/detail.do'"
		작가 상세보기 요청방식 :  onclick="location.href='${root}/author.do'"
		출판사 클릭시 검색페이지로 : onclick="location.href='${root}/main.search.do'"
	 -->

	<!-- 18.01.24 최정은 = 신간을 눌렀을때 나오는 화면입니다. -->
	<div id="newBook">
		<div class="bf-title-row title-type1">
			<h2>신간</h2>
		</div>
		<div class="bf-service-type-menu">
			<ul class="order-type-list">
				<li class="diamond"><a class="active" href="#">주간 베스트셀러</a></li>
				<li class="diamond"><a href="#">월간 베스트셀러</a></li>
				<li class="diamond"><a href="#">스테디셀러</a></li>
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
				<c:forEach begin="1" end="4">
					<!-- ---------------------------------------------- -->
					<li class="mf-book-item">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="location.href='${root}/detail.do'" >
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
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span> <span class="count-field"> 9999명</span>
							</div>
							<pre class="book-metadata-description hidden-block">* 이 책은 Public Domain Books 입니다. Public Domain Books란 저작자 사후 일정 기간이 경과하여 저작권이 만료된 책을 의미합니다. 회원님께서는 인터넷 상의 기타 사이트를 통해서 이 책을 찾아보실 수도 있습니다.
	
	1933년 4월부터 1934년 2월까지 <조선일보>에 연재된 장편소설로 <대수양(大首陽)>과 더불어 김동인의 대표적인 역사소설로 꼽힌다.
							</pre>
							<p class="book-metadata-price hidden-block">
								<span class="price-rent"></span>
							</p>
							<p class="book-metadata-price">
								<span class="price-purchase">무료</span>
							</p>
						</div>
					</li>
					<li class="mf-book-item">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="location.href='${root}/detail.do'">
								<img class="" src="//misc.ridibooks.com/cover/111014017/large" />
							</div>
						</div>
						<div class="mf-book-metadata">
							<h3 class="book-metadata-text" onclick="location.href='${root}/detail.do'">추리 스릴러 길라잡이</h3>
							<p class="book-metadata-author">
								<a class="" href="${root}/author.do">리디북스 콘텐츠팀</a>
							</p>
							<p class="book-metadata-translator">
								<a class="" href="${root}/author.do">박성호</a>
							</p>
							<p class="book-metadata-publisher">
								<a class="" href="${root}/author.do">리디북스</a>
							</p>
							<div class="content-star-rate">
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span> <span class="count-field"> 9999명</span>
							</div>
							<pre class="book-metadata-description hidden-block">추리 스릴러물을 읽어보고 싶은데 어떤 작품부터 읽어야할지 고민된다면?
	초심자를 위한 추리스릴러 소설 길라잡이!
	
	추리 미스터리 스릴러, 라는 단어만 들으면 우리는 피가 난자한 살인사건이나 파이프를 물고 단서를 찾아 헤매는 탐정을 떠올린다. 맞다. 이 장르는 범죄가 일어나고 그 범죄를 '누가 어떻게 왜' 행했는지 파헤치는 장르다.</pre>
							<p class="book-metadata-price hidden-block">
								<span class="price-rent"></span>
							</p>
							<p class="book-metadata-price">
								<span class="price-purchase">15,000원</span>
							</p>
						</div>
					</li>
					<li class="mf-book-item">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="location.href='${root}/detail.do'">
								<img class="" src="//misc.ridibooks.com/cover/682000659/large" />
							</div>
						</div>
						<div class="mf-book-metadata">
							<h3 class="book-metadata-text" onclick="location.href='${root}/detail.do'">[체험판] 데프 보이스</h3>
							<p class="book-metadata-author">
								<a class="" href="${root}/author.do">마루야마 마사키</a>
							</p>
							<p class="book-metadata-translator">
								<a class="" href="${root}/author.do">정호열</a>
							</p>
							<p class="book-metadata-publisher">
								<a class="" href="${root}/author.do">황금가지</a>
							</p>
							<div class="content-star-rate">
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span> <span class="count-field"> 9999명</span>
							</div>
							<pre class="book-metadata-description hidden-block">‘아저씨는 우리 편? 아니면 적?’
	세상을 보는 시선을 뒤바꿀 가슴 벅찬 미스터리
	제18회 마쓰모토 세이초 상 최종 후보작
	
	청인은 절대 알지 못할 그 아름다운 목소리, ‘데프 보이스’를 알고 있는 사람들. 그 한없이 반짝이는 세계로 당신을 초대한다.―이길보라(「반짝이는 박수 소리」 감독)</pre>
							<p class="book-metadata-price">
								<span class="price-rent">900원</span>
							</p>
							<p class="book-metadata-price">
								<span class="price-purchase">11,000원</span>
							</p>
						</div>
					</li>
					<li class="mf-book-item">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="location.href='${root}/detail.do'">
								<img class="" src="//misc.ridibooks.com/cover/945012245/large" />
							</div>
						</div>
						<div class="mf-book-metadata">
							<h3 class="book-metadata-text" onclick="location.href='${root}/detail.do'">책을 읽으면 경험이 쌓여! 1화</h3>
							<p class="book-metadata-author">
								<a class="" href="${root}/author.do">형상준</a>
							</p>
							<p class="book-metadata-translator">
								<a class="" href="${root}/author.do">최정은</a>
							</p>
							<p class="book-metadata-publisher">
								<a class="" href="${root}/author.do">에피루스</a>
							</p>
							<div class="content-star-rate">
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span> <span class="count-field"> 9999명</span>
							</div>
							<pre class="book-metadata-description hidden-block">국내 최대 연재 사이트 유료 웹소설 부문 1위!
	
	「경험치북에 당신의 경험을 적으시겠습니까?」
	
	게임도 아니고, 책을 읽으면 경험치가 쌓인다고?
	……그런데, 그것이 실제로 일어났다!
	
	내 경험을 적으면 경험치가 쌓이고, 
	그 경험을 대가로 다른 필기자의 경험을 얻을 수 있다.
	
	우연히 집어든 책 한 권에 인생이 바뀐 소년의 이야기.</pre>
							<p class="book-metadata-price">
								<span class="price-rent">무료</span>
							</p>
							<p class="book-metadata-price">
								<span class="price-purchase">무료</span>
							</p>
						</div>
					</li>
					<li class="mf-book-item">
						<div class="mf-book-thumbnail">
							<div class="mf-book-thumbnail-image" onclick="location.href='${root}/detail.do'">
								<img class="" src="//misc.ridibooks.com/cover/3026000001/large" />
							</div>
						</div>
						<div class="mf-book-metadata">
							<h3 class="book-metadata-text" onclick="location.href='${root}/detail.do'">이스닐다 1화</h3>
							<p class="book-metadata-author">
								<a class="" href="${root}/author.do">리모란</a>
							</p>
							<p class="book-metadata-translator">
								<a class="" href="${root}/author.do">김동환</a>
							</p>
							<p class="book-metadata-publisher">
								<a class="" href="${root}/author.do">로즈엔</a>
							</p>
							<div class="content-star-rate">
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span> <span class="count-field"> 9999명</span>
							</div>
							<pre class="book-metadata-description hidden-block">부모님을 잃고 7년간 친척집에서 구박데기로 자란 고아 소녀 이스닐다.
	어느 날 아버지의 재산을 가로챘던 남자가 나타나 그녀에게 거액의 상속금을 넘긴다.
	하루아침에 억만장자가 되었으니 이제 꽃길만 걸으면 되는 줄 알았는데…?
	
	“어떤 남자가 좋아? 내가 맞추지, 뭐.”
	
	날 처음 보는 척하는 소꿉친구 기사에,</pre>
							<p class="book-metadata-price">
								<span class="price-rent">700원</span>
							</p>
							<p class="book-metadata-price">
								<span class="price-purchase">9,000원</span>
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
			<!-- End : mf-book-list -->
			<nav class="bf-pagination">
				<ul class="bf-animated-btn">
					<li class="first"><a href="#0"><span></span></a></li>
					<li class="prev"><a href="#0"><span></span></a></li>
					<li><a href="#0">1</a></li>
					<li><a href="#0">2</a></li>
					<li><a class="active" href="#0">3</a></li>
					<li><a href="#0">4</a></li>
					<li><a href="#0">5</a></li>
					<li class="next"><a href="#0"><span></span></a></li>
					<li class="last"><a href="#0"><span></span></a></li>
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