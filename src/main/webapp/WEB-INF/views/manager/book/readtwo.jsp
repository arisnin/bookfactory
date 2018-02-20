<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 상세보기</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%-- <link rel="stylesheet" type="text/css" href="${root}/icon/css/fontello.css"> --%>
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" type="text/css" href="${root}/css/book/plus.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/manager/book.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/book/plus.js"></script>
<style type="text/css">
	.head_right{
		overflow: visible !important;
	}
	.price-box{
		position: relative;
	    left: -16rem;
	}
</style>
</head>
<body>
	<!-- 책상세보기로 요청 방식 :  onclick="location.href='${root}/detail.do'"
		작가 상세보기 요청방식 :  onclick="location.href='${root}/author.do'"
		출판사 클릭시 검색페이지로 : onclick="location.href='${root}/main/search.do'"
		장르 클릭시 장르검색페이지로  : onclick="location.href='${root}/category.do'"
		미리보기 페이지 : ${root}/book/example.do
	 -->
<div id="b_in_wrapper">
	<section class="b_in_main">
		<div class="b_in_header"><h2>도서 정보</h2></div>
		<div class="b_in_content">
		<!-- 책 클릭했을때 나오는 상세보기  - 최정은 -->
		<div class="plus_All">
			<div id="content_head">
				<div class="head_left">
					<img src="${root}/img/example/example1.PNG"> 
				</div>
	
				<div class="head_right">
					<!-- child(1) -->
					<div class="category">
						<!-- 주의! 카테고리는 중복이 가능하다. 예, '소설 > 해외소설 , 소설 > SF소설'  -->
						<div class="category-item">
							<span class="main" onclick="location.href='${root}/category.do'">메인1</span>
							<span class="sub" onclick="location.href='${root}/category.do'">서브1</span>
						</div>
						<div class="category-item">
							<span class="main" onclick="location.href='${root}/category.do'">메인2</span>
							<span class="sub" onclick="location.href='${root}/category.do'">서브2</span>
						</div>
						<div class="category-item">
							<span class="main" onclick="location.href='${root}/category.do'">메인3</span>
							<span class="sub" onclick="location.href='${root}/category.do'">서브3</span>
						</div>
	
					</div>
					<!-- child(2) -->
					<div class="main-title">책 제목 입력</div>
					<!-- child(3) -->
					<div class="sub-title">부 제목 입력</div>
	
					<!-- child(4) -->
					<div class="author-info">
						<!-- 소설, 판타지, 만화 등 종류에 따라서 글(원작자)만 있는 경우와 그림(일러스트레이터)가 있는 경우가 있음 -->
						<!-- 각 겨우마다 이름 뒤에 '저자' 또는 '그림' 이라는 단어가 붙음. 글과 그림이 동일인물일 경우는 '글/그림' 이라는 단어가 붙음 -->
						<!-- 글/그림 동일이물일 경우는 하나를 'hidden-block'처리하고 또 하나에 'author'와 'illustrator'를 동시에 추가한다 -->
						<!-- 필요없는 경우는 class 속성에 'hidden-block' 을 추가 -->
						<span class="author "><a href="${root}/author.do">저자이름</a></span> 
						<span class="illustrator "><a href="${root}/author.do">일러스트레이터이름</a></span>
					</div>
	
					<!-- child(5) -->
					<div class="content-star-rate">
						<span class="star-icon-field material-icons"></span><span
							class="non-star-icon-field material-icons"></span> <span
							class="count-field">100명</span>
					</div>
	
					<!-- child(6) -->
					<div class="event">
						<span class="icon-clock"></span> <span class="period">01월
							24일 (수) 12시 ~ 02월 22일 (목)</span>
					</div>
					<!--  -->
					<ul class="book-info">
						<li><span>도서정보</span>
							<ul>
								<li><p onclick="location.href='${root}/main/search.do'">출판</p></li>
								<li><p>EPUB</p></li>
								<li><p>33.5mb</p></li>
								<li><p style="border-right: 0px;">약11만자</p></li>
							</ul></li>
	
						<li><span>출간정보</span>
							<ul>
								<li><p style="border-right: 0px;">2017년 10월 27일 전자책, 종이책
										동시출간</p></li>
							</ul></li>
	
						<li><span>지원기기</span>
							<ul>
								<li><span class="icon-tablet"></span>PAPER</li>
								<li><span class="icon-apple"></span>iOS</li>
								<li><span class="icon-android"></span>Android</li>
								<li><span class="icon-windows"></span>PC</li>
								<li><span class="icon-laptop"></span>Mac</li>
							</ul></li>
						<li><span>듣기기능</span>
							<ul>
								<li><span class="icon-headphones"></span>듣기가능</li>
							</ul></li>
					</ul>
	
					<div class="price-box">
						<!-- 'box-row'에 'hidden-block'추가하면 감추기 가능 -->
						<div class="box-row box-rental ">
							<div class="box_left">대여</div>
							<div class="box_right">
								<div>
									<span>대여일수</span> <span class="paper">4000원</span>
								</div>
							</div>
						</div>
						<div class="box-row">
							<div class="box_left">구매</div>
							<div class="box_right">
								<div>
									<span>종이책정가</span> <span class="paper">15000원</span>
								</div>
								<div>
									<span>전자책정가</span> <span class="ebook">10000원<span
										class="sail">34</span></span>
								</div>
								<div>
									<span>판매가</span> <span class="sell">9000원<span
										class="sail">10</span></span>
								</div>
							</div>
						</div>
					</div>
					<script>
						function cartInsert(bookNum,root) {
							var url = root+"/cartInsert.do?book_num="+bookNum;
							$.get(url, function(check) {
								if(check==1){
									alert("카트에 저장되었습니다.");
								}else{
									alert("중복된 도서목록이 있습니다.");
								}
							});
						}
						
						function wishInsert(bookNum, root){
							var url = root+"/wishInsert.do?book_num="+bookNum;
							$.get(url, function(check) {
								if(check==1){
									alert("내 위시리스트에 저장되었습니다.");
								}else{
									alert("중복된 도서목록이 있습니다.");
								}
							});
						}
		
					</script>
				</div>
			</div>
			<div id="bookIntroAll">
				<div class="bookIntro">
					<div>
						<h3>책소개</h3>
					</div>
					<div class="bookIntro_con">
						<div class="readAll collapse">
							aaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaa<br>aaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa
						</div>
						<button type="button">
							펼쳐보기<i class="material-icons">arrow_drop_down</i><i
								class="material-icons">arrow_drop_up</i>
						</button>
					</div>
				</div>
	
				<div class="bookIntro">
					<div>
						<h3>출판사 서평</h3>
					</div>
					<div class="bookIntro_con">
						<div class="readAll collapse">
							aaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaa<br>aaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa
						</div>
						<button type="button">
							펼쳐보기<i class="material-icons">arrow_drop_down</i><i
								class="material-icons">arrow_drop_up</i>
						</button>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
</div>
	

	<script type="text/javascript">
		createStarIcon(document.querySelector(".content-star-rate"), 3.7);
	</script>
</body>
</html>
