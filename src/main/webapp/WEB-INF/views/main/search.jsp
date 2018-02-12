<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<div class="main-search-box">
		<!-- 검색 결과 내용 -->
		<div class="main-search-contents">
			<!-- 저자 검색 결과 -->
			<div class="bf-title-row title-type1">
				<h2><span class="search-word">검색어</span>&nbsp;저자 검색 결과<span class="author-count">8</span></h2>
			</div>
			<section class="result-search-author-box">
				<ul>
					<li>
						<button type="button" class="bf-button bf-transparent-btn">
							<span class="material-icons">person</span>
							<span class="author">조앤 페들러</span>
							<span class="book">내 아이가 미워질 때</span>
							<span class="more-count"></span>
						</button>
					</li>
					<li>
						<button type="button" class="bf-button bf-transparent-btn">
							<span class="material-icons">person</span>
							<span class="author">조앤 김</span>
							<span class="book">읽기만 해도 영어가 되는 책</span>
							<span class="more-count"></span>
						</button>
					</li>
					<li>
						<button type="button" class="bf-button bf-transparent-btn">
							<span class="material-icons">person</span>
							<span class="author">조앤.K.롤링</span>
							<span class="book">해리 포터와 마법사의 돌</span>
							<span class="more-count">외 8권</span>
						</button>
					</li>
					<!-- 축소/확장 영역 -->
					<li class="hidden-block">
						<button type="button" class="bf-button bf-transparent-btn">
							<span class="material-icons">person</span>
							<span class="author">조앤</span>
							<span class="book">어린 남자 2권 (완결)</span>
							<span class="more-count">외 12권</span>
						</button>
					</li>
					<li class="hidden-block">
						<button type="button" class="bf-button bf-transparent-btn">
							<span class="material-icons">person</span>
							<span class="author">조앤 플루크</span>
							<span class="book">블루베리 머핀 살인사건</span>
							<span class="more-count">외 18권</span>
						</button>
					</li>
					<li class="hidden-block">
						<button type="button" class="bf-button bf-transparent-btn">
							<span class="material-icons">person</span>
							<span class="author">조앤 락</span>
							<span class="book">나만을 위한 공연</span>
							<span class="more-count">외 11권</span>
						</button>
					</li>
					<li class="hidden-block">
						<button type="button" class="bf-button bf-transparent-btn">
							<span class="material-icons">person</span>
							<span class="author">조앤 베이커</span>
							<span class="book">일상적이지만 절대적인 양자역학지식 50</span>
							<span class="more-count"></span>
						</button>
					</li>
					<li class="hidden-block">
						<button type="button" class="bf-button bf-transparent-btn">
							<span class="material-icons">person</span>
							<span class="author">조앤킴</span>
							<span class="book">색스토리 1권</span>
							<span class="more-count">외 1권</span>
						</button>
					</li>
				</ul>
				<div class="search-more-button">
					<label class="bf-custom-checkbox checkbox-btn">
						<input type="checkbox" title="저자검색" onclick="collapseSearchBoxToggle(this)" />
						<span class="bf-button bf-transparent-btn">
							<span class="more-count">5</span>
							개 더보기
						</span>
					</label>
					<!-- <button type="button" class="bf-button bf-transparent-btn" value="true" onclick="collapseSearchBoxToggle(this)">
						<span class="more-count">5</span>
						개 더보기
					</button> -->
				</div>
			</section>
			<!-- 도서 검색 결과 -->
			<div class="bf-title-row title-type1">
				<h2><span class="search-word">검색어</span>&nbsp;도서 검색 결과</h2>
			</div>
			<div class="bf-service-type-menu">
				<!-- 정렬기준 메뉴 -->
				<ul class="order-type-list">
					<li><a class="active" href="#">최근 출간순</a></li>
					<li><a href="#">최근 출간숨</a></li>
					<li><a href="#">최근 출간숩</a></li>
				</ul>
				<!-- 보기방식 메뉴 -->
				<div class="view-type-list">
					<button class="" type="button" value="landscape" onclick="changeViewType(this)">
						<span class="material-icons">format_list_bulleted</span>
					</button>
					<button class="active" type="button" value="portrait" onclick="changeViewType(this)">
						<span class="material-icons">apps</span>
					</button>
				</div>
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
					<!-- ---------------------------------------------- -->
				</ul><!-- End : mf-book-list -->
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
			</section><!-- End : result-search-book-box -->
		</div>

		<!-- 검색 결과 목록 -->
		<div class="main-search-list">
			<h3 class="title">분야</h3>
			<ul>
				<li><button type="button" class="bf-button bf-transparent-btn active">전체(21)</button></li>
				<li><button type="button" class="bf-button bf-transparent-btn">역사/시대물 (13)</button></li>
				<li><button type="button" class="bf-button bf-transparent-btn">19+ (7)</button></li>
				<li><button type="button" class="bf-button bf-transparent-btn">판타지물 (6)</button></li>
				<li><button type="button" class="bf-button bf-transparent-btn">현대물 (3)</button></li>
				<li><button type="button" class="bf-button bf-transparent-btn">성인 (1)</button></li>
				<li><button type="button" class="bf-button bf-transparent-btn">액션 (1)</button></li>
				<li><button type="button" class="bf-button bf-transparent-btn">제2외국어 (1)</button></li>
				<li><button type="button" class="bf-button bf-transparent-btn">퓨전판타지 (1)</button></li>
			</ul>
		</div>
	</div>
	<%-- 자바 스크립트 --%>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript">
		document.querySelectorAll(".content-star-rate").forEach(function(item, index) {
			createStarIcon(item, 3.7);
		});
		
		function collapseSearchBoxToggle(event) {
			var searchList = document.querySelectorAll(".result-search-author-box > ul > li:nth-child(3) ~ li");
			searchList.forEach(function(e,i) {
				if (event.checked == true) {
					e.classList.remove("hidden-block");
				} else {
					e.classList.add("hidden-block");
				}
			});
		}
	</script>
</body>
</html>