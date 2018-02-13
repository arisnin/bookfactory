<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 상세보기</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root}/icon/css/fontello.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" type="text/css" href="${root}/css/book/plusSerial.css">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/book/plusSerial.js"></script>
</head>
<body>
	<!-- 책상세보기로 요청 방식 :  onclick="location.href='${root}/detail.do'"
		작가 상세보기 요청방식 :  onclick="location.href='${root}/author.do'"
		출판사 클릭시 검색페이지로 : onclick="location.href='${root}/main/search.do'"
		장르 클릭시 장르검색페이지로  : onclick="location.href='${root}/category.do'"
		미리보기 페이지 : ${root}/book/example.do
	 -->

	<!-- 책 클릭했을때 나오는 상세보기  - 최정은 -->
	<div class="plus_All">
		<div id="content_head">
			<div class="head_left">
				<img src="${root}/img/example/example1.PNG"> <a href="${root}/book/example.do"> <span><i class="far fa-heart"></i></span> <span>위시리스트등록</span>
				</a>
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
					<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
					<span class="count-field">100명</span>
				</div>
				
				<!-- child(6) -->
				<div class="event">
					<span class="icon-clock"></span>
					<span class="period">01월 24일 (수) 12시 ~ 02월 22일 (목)</span>
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
							<li><p style="border-right: 0px;">2017년 10월 27일 전자책, 종이책 동시출간</p></li>
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
								
				<div class="head_bottom">
					<button type="button" class="bf-button">
						<span class="icon-book-open"></span>첫화보기
					</button>
				</div>
			</div>
		</div>
		
		<div class="bookSerialChoice">
			<div class="bookSerialChoice_division">
				<div onclick="rentalOrPurchase('rental')">대여하기</div>
				<div onclick="rentalOrPurchase('purchase')">구매하기</div>
			</div>
			<div class="bookSerialChoice_button">
				<div class="bookSerialChoice_button_left">
					<ul>
						<li>
							<label class="bf-custom-checkbox">
								<input type="checkbox" title="" />
								<span class="all-mark"></span>
								<span class="checkbox-label">전체 선택</span>
							</label>
						</li>
						
						<li>
							<button class="bf-button bf-white-btn">
								<span><i class="fas fa-arrows-alt-v"></i></span>
								<span>신간부터</span>
							</button>
						</li>
					</ul>
				</div>
				
				<div class="bookSerialChoice_button_right">
					<ul>
						<li>
							<a class="bf-button" href="#">선택구매</a>
						</li>
						
						<li>
							<button class="bf-button bf-white-btn">
								<span class="icon-basket"></span>
								<span>카트</span>
							</button>
						</li>
						
						<li>
							<span>
								<span>총</span>
								<span class="list_choice_count">0</span>
								<span>화</span>
							</span>
							<span>
								<span class="list_choice_cash">0</span>
								<span>원</span>
							</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="bookSerialChoice_list">
				<ul id="bookSerialChoice_list_sort">
					<li >
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="" />
							<span class="all-mark"></span>
						</label>
						<div class="bookSerialChoice_list_left">
							<div>상수리나무 아래 01화</div>
							<div>2017.10.13일 | 약 3.3천자</div>
							<div>
								<span>100</span>
								<span>원</span>
								<span>1일대여</span>
							</div>
						</div>
						<div class="bookSerialChoice_list_right">
							<button class="bf-button bf-white-btn">
								<span class="icon-book-open"></span>
								<span>보기</span>
							</button>
						</div>
					</li>
					
					<li>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="" />
							<span class="all-mark"></span>
						</label>
						<div class="bookSerialChoice_list_left">
							<div>상수리나무 아래 01화</div>
							<div>2017.10.13일 | 약 3.3천자</div>
							<div>
								<span>100</span>
								<span>원</span>
								<span>1일대여</span>
							</div>
						</div>
						<div class="bookSerialChoice_list_right">
							<button class="bf-button bf-white-btn">
								<span class="icon-book-open"></span>
								<span>보기</span>
							</button>
						</div>
					</li>
					
					<li>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="" />
							<span class="all-mark"></span>
						</label>
						<div class="bookSerialChoice_list_left">
							<div>상수리나무 아래 01화</div>
							<div>2017.10.13일 | 약 3.3천자</div>
							<div>
								<span>100</span>
								<span>원</span>
								<span>1일대여</span>
							</div>
						</div>
						<div class="bookSerialChoice_list_right">
							<button class="bf-button bf-white-btn">
								<span class="icon-book-open"></span>
								<span>보기</span>
							</button>
						</div>
					</li>
					
					<li>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="" />
							<span class="all-mark"></span>
						</label>
						<div class="bookSerialChoice_list_left">
							<div>상수리나무 아래 01화</div>
							<div>2017.10.13일 | 약 3.3천자</div>
							<div>
								<span>100</span>
								<span>원</span>
								<span>1일대여</span>
							</div>
						</div>
						<div class="bookSerialChoice_list_right">
							<button class="bf-button bf-white-btn">
								<span class="icon-book-open"></span>
								<span>보기</span>
							</button>
						</div>
					</li>
				</ul>
			</div>
			
			<div class="bookSerialChoice_list_more">
				<button type="button" class="bf-button bf-white-btn" onclick="">
					<span>더보기</span>
					<span><i class="material-icons">arrow_drop_down</i></span>
				</button>
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
						펼쳐보기<i class="material-icons">arrow_drop_down</i><i class="material-icons">arrow_drop_up</i>
					</button>
				</div>
			</div>

			<div id="profile">
				<div>
					<h3>저자 프로필</h3>
				</div>
				<div class="profile_click_event">
					<div>
						<ul>
							<li><span>저자</span><a>최정은 <span class="activeBar"></span></a></li>
							<li><span>그림</span><a>최정은 <span></span></a></li>
							<li><span>번역</span><a>최정은 <span></span></a></li>
						</ul>
					</div>
					<!-- 여기부분은 위의 태그의 이름클릭할때마다 값이 변해야함. 틀만잡음 -->
					<div class="profile_ex">
						<div class="author">
							마크 맨슨<span class="other-language">Mark Manson</span>
						</div>
						<button class="add-notice">
							<span class="icon-plus"></span>작가 신간알림·소식
						</button>
						<ol class="content">
							<li><span>국적</span><span>미국</span></li>
							<li><span>출생</span><span>1884년</span></li>
							<li><span>학력</span><span>보스턴 대학교 학사</span></li>
							<li><span>경력</span><span>Infinity Squared Media LLC 설립자</span></li>
						</ol>
						<div class="profile_date">
							<span class="update">2018.02.06</span>
							<input class="bf-button bf-white-btn" type="button" value="정보수정요청" />
						</div>
						<div class="profile_masterpiece">
							<div>
								<span>대표저서</span>
								<ol>
									<li>평점순</li>
									<li>최신순</li>
									<li class="activeFont">인기순</li>
								</ol>
							</div>
							<div class="list">
								<ul>
									<c:forEach begin="1" end="5">
										<li class="mf-book-item">
											<div class="mf-book-thumbnail">
												<div class="mf-book-thumbnail-image">
													<img class="" src="//misc.ridibooks.com/cover/111000138/large" alt="image" />
												</div>
											</div>
											<div class="mf-book-metadata">
												<h3 class="book-metadata-text">운현궁의 봄</h3>
												<p class="book-metadata-author">
													<a class="" href="javascript:alert('작가페이지')">김동인</a>
												</p>
												<p class="book-metadata-translator"></p>
												<div class="content-star-rate">
													<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
													<span class="count-field"> 9999명</span>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
							<!-- 대표저서가 5권 이하일 때는 버튼을 'hidden-block' 처리 해야함 -->
							<a class="bf-button bf-white-btn bf-animated-btn" href="${root}/author.do">출간작 전체보기</a>
						</div>
					</div>
				</div>
			</div>

			<div class="bookIntro">
				<div>
					<h3>저자 소개</h3>
				</div>
				<div class="bookIntro_con">
					<div class="readAll collapse">
						aaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaa<br>aaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa
					</div>
					<button type="button">
						펼쳐보기<i class="material-icons">arrow_drop_down</i><i class="material-icons">arrow_drop_up</i>
					</button>
				</div>
			</div>

			<!-- 	리뷰	 -->
		</div>
	</div>

	<script type="text/javascript">
		createStarIcon(document.querySelector(".content-star-rate"), 3.7);
	</script>
</body>
</html>