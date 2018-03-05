<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리 책 판다!</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css" />
<link type="text/css" rel="stylesheet" href="${root}/css/myPage/home.css">
<link rel="stylesheet" type="text/css" href="${root}/css/header/index.css" />
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/header/index.js"></script>
</head>
<%-- mainPage header 염현우 --%>
<body id="team2_index_body">
	<input type="hidden" name="firstCate" value="${firstCate}">
	<div id="hw_header_wrap">
		<div class="hw_header_top">
			<div class="hw_header_top_content">
			
				<div class="hw_top_content_left">
					<span class="hw_font hw_mainlogo">
						<%--<img class="hw_logoimg" src="${root}/img/index/mainlogo.JPG" style="float: left;"/> --%>
						<a href="${root}/normal.do">북팩토리</a>
					</span>
					<div class="hw_main_search">
						<span class="hw_search_icon">
							<img src="${root}/img/index/searchIcon_purple.png" />
						</span>
						<form action="${root}/main/search.do" method="get">
							<input class="hw_search_input" type="text" name="keyword" placeholder="제목,저자,출판사 검색" onkeyup="suggestKeyword(this)" />
						</form>
						<span class="hw_del_icon">
							<img src="${root}/img/index/searchdel.JPG" />
						</span>
						<!-- 검색창 제안(suggest) 박스(2018-03-02 박성호) -->
						<div class="main-search-suggest-box hidden-block" id="main-search-suggest">
							<label class="author-title">저자/역자 검색</label>
							<ul class="suggest-author-list"></ul>
							<label class="book-title">도서 검색</label>
							<ul class="suggest-book-list"></ul>
						</div>
					</div>
				</div>
				<!-- 회원가입  -->
				<c:if test="${userInfo == null}">
					<div class="hw_top_content_right login">
						<span class="hw_font">
							<a class="hw_top_content_right_register" href="javascript:goRegister()">회원가입</a>
						</span>
						<span class="hw_font">
							<a class="hw_top_content_right_login" href="javascript:goLogin()">로그인</a>
						</span>
					</div>
				</c:if>
				<c:if test="${userInfo != null}">
					<div class="hw_top_content_right login_ok" style="display: inline-block;">
						<span class="hw_font">
							<a href="${root}/wishlist.do">위시리스트</a>
						</span>						
						<span class="hw_font">
							<a href="${root}/cart.do">카트</a>
						</span>
						<span class="hw_font my-factory-btn">
							<a href="${root}/myPage/home.do">마이팩토리</a>
						</span>
						<div class="bf-dropdown-menu user-my-menu">
							<div class="dropdown-row">
								<div class="account-info" onclick="location.href='${root}/myPage/home.do'">
									<h3 class="account-id">${userInfo.username}</h3>
									<p class="account-email font_13">${userInfo.memberDto.email}</p>
								</div>
								<a class="bf-button bf-white-btn logout-btn" href="${root}/member/logout.do">로그아웃</a>
							</div>
							<div class="dropdown-row">
								<ul class="asset-info-list">
									<!-- 마이캐시 -->
									<li class="asset-info-list-item">
										<div class="asset-info" onclick="location.href='${root}/payment/myCashHistoryCash.do'">
											<h4 class="asset-info-title">
												<span class="info-icon material-icons">&#xe90c;</span>
												<span class="info-title-text">마이캐시</span>
											</h4>
											<p class="asset-info-amount">
												<span class="info-amount" id="amount-cash"><fmt:formatNumber value ="${cashTotal}" pattern="#,###"/></span>
												원
											</p>
										</div>
									</li>
									<!-- 마이포인트 -->
									<li class="asset-info-list-item">
										<div class="asset-info" onclick="location.href='${root}/payment/myPoint.do'">
											<h4 class="asset-info-title">
												<span class="info-icon material-icons">&#xe54f;</span>
												<span class="info-title-text">마이포인트</span>
											</h4>
											<p class="asset-info-amount">
												<span class="info-amount" id="amount-point"><fmt:formatNumber value ="${pointTotal}" pattern="#,###"/></span>
												원
											</p>
										</div>
									</li>
									<!-- 쿠폰 -->
									<li class="asset-info-list-item">
										<div class="asset-info" onclick="alert('쿠폰(미구현)')">
											<h4 class="asset-info-title">
												<span class="info-icon material-icons">&#xe8b0;</span>
												<span class="info-title-text">쿠폰</span>
											</h4>
											<p class="asset-info-amount">
												<span class="info-amount" id="amount-coupon">0</span>
												개
											</p>
										</div>
									</li>
									<!-- 구매목록 -->
									<li class="asset-info-list-item">
										<div class="asset-info" onclick="location.href='${root}/library/purchased.do'">
											<h4 class="asset-info-title">
												<span class="info-icon material-icons">&#xe8b0;</span>
												<span class="info-title-text">구매목록</span>
											</h4>
											<p class="asset-info-amount">
												<span class="info-amount" id="amount-purchased"></span>
												개
											</p>
										</div>
									</li>
									<!-- 위시리스트 -->
									<li class="asset-info-list-item">
										<div class="asset-info" onclick="location.href='${root}/wishlist.do'">
											<h4 class="asset-info-title">
												<span class="info-icon material-icons">&#xe8b0;</span>
												<span class="info-title-text">위시리스트</span>
											</h4>
											<p class="asset-info-amount">
												<span class="info-amount" id="amount-wish"></span>
												개
											</p>
										</div>
									</li>
									<!-- 카트 -->
									<li class="asset-info-list-item">
										<div class="asset-info" onclick="location.href='${root}/cart.do'">
											<h4 class="asset-info-title">
												<span class="info-icon material-icons">&#xe8b0;</span>
												<span class="info-title-text">카트</span>
											</h4>
											<p class="asset-info-amount">
												<span class="info-amount" id="amount-cart"></span>
												개
											</p>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<!-- --------------------------- -->
		<div class="hw_header_middle">
			<div class="hw_middle_content">
				<nav class="hw_middle_left">
					<ul class="hw_middle_left">
						<li class="hw_mid_item list_all" style="padding: 0px 12px 0px 0px;" onclick="allMenuOpen()">
							<img class="hw_mid_icon" src="${root}/img/index/213111_gray.png"> <span class="hw_mid_font">전체분야</span>
						</li>
						<li class="hw_mid_item list_general" onclick="location.href='${root}/normal.do?firstCateNum=1'">
							<img class="hw_mid_icon" src="${root}/img/index/ilban.png"> <span class="hw_mid_font">일반</span>
						</li>
						<li class="hw_mid_item list_romance" onclick="location.href='${root}/romance.do?firstCateNum=2'">
							<img class="hw_mid_icon" src="${root}/img/index/love.png"> <span class="hw_mid_font">로맨스</span>
						</li>
						<li class="hw_mid_item list_fantasy" onclick="location.href='${root}/fantasy.do?firstCateNum=3'">
							<img class="hw_mid_icon" src="${root}/img/index/fantasi.png"> <span class="hw_mid_font">판타지</span>
						</li>
						<li class="hw_mid_item list_comic" onclick="location.href='${root}/comic.do?firstCateNum=4'">
							<img class="hw_mid_icon" src="${root}/img/index/manhwa.png"> <span class="hw_mid_font">만화</span>
						</li>
<%-- 						<li class="hw_mid_item list_bl" onclick="location.href='${root}/bl.do?firstCateNum=5'"> --%>
<%-- 							<img class="hw_mid_icon" src="${root}/img/index/bl.png"> <span class="hw_mid_font">BL</span> --%>
<!-- 						</li> -->
					</ul>
				</nav>
				<ul class="hw_middle_right">
					<c:if test="${true}">
						<li class="hw_mid_item list_manager" onclick="location.href='${root}/manager/index.do'"><img class="hw_mid_icon" src="${root}/img/index/213111_gray.png"> <span class="hw_mid_font">관리자</span></li>
					</c:if>
					<li class="hw_mid_item list_cash" onclick="location.href='${root}/payment/myCash.do'"><img class="hw_mid_icon" src="${root}/img/index/213111_gray.png"> <span class="hw_mid_font">캐시충전</span></li>
				</ul>
				<!-- 전체메뉴 클릭시 나오는 뷰 -->
				<jsp:include page="indexAllMenu.jsp"/>
				<!-- 숨겨진 전체메뉴 끝 -->
			</div>
		</div>
		<!-- --------------------------- -->
		<!-- 홈화면 가는게 각각 카테에맞게 바뀌어야함으로 추가 -->
					<c:choose>
						<c:when test="${firstCate==1}">
							<c:set var="home" value="normal"/>
						</c:when>
						
						<c:when test="${firstCate==2}">
							<c:set var="home" value="romance"/>
						</c:when>
						
						<c:when test="${firstCate==3}">
							<c:set var="home" value="fantasy"/>
						</c:when>
						
						<c:when test="${firstCate==4}">
							<c:set var="home" value="comic"/>
						</c:when>
						
						<c:when test="${firstCate==5}">
							<c:set var="home" value="bl"/>
						</c:when>
						
						<c:otherwise>
							<c:set var="home" value="normal"/>
						</c:otherwise>
					</c:choose>
		<div class="hw_sub_wrap">
			<c:if test="${firstCate!=1 && firstCate!=4}">
				<div class="hw_sub_cate">
					<span>단행본</span>
					<ul>
						<li class="sub_cate_element" onclick="location.href='${root}/${home}.do?firstCateNum=${firstCate}&bookType=paper&seconCate=${seconCate}'">홈 <span class="activeBar"></span></li>
						<li class="sub_cate_element" onclick="location.href='${root}/new-book.do?firstCateNum=${firstCate}&bookType=paper&seconCate=${seconCate}'">신간<span></span></li>
						<li class="sub_cate_element" onclick="location.href='${root}/best-sell.do?firstCateNum=${firstCate}&bookType=paper&bestSeller=weekBest&seconCate=${seconCate}'">베스트셀러<span></span></li>
						<%-- <li class="sub_cate_element" onclick="location.href='${root}/normal.main'">맞춤추천<span></span></li> --%>
						<li class="sub_cate_element" onclick="location.href='${root}/event.do?firstCateNum=${firstCate}&bookType=paper'">이벤트<span></span></li>
					</ul>
<!-- 					<h3 class="sub_cate_line">|</h3> -->
<!-- 					<span>연재</span> -->
<!-- 					<ul> -->
<!-- 						<li class="sub_cate_element">홈<span></span></li> -->
<!-- 						<li class="sub_cate_element">신작<span></span></li> -->
<!-- 						<li class="sub_cate_element">베스트셀러<span></span></li> -->
<!-- 						<li class="sub_cate_element">선호작품<span></span></li> -->
<!-- 						<li class="sub_cate_element">이벤트<span></span></li> -->
<!-- 					</ul> -->
				</div>
			</c:if>
			<c:if test="${firstCate==1 || firstCate==4}">
				<div class="hw_sub_cate">
					<ul>
						<li class="sub_cate_element" onclick="location.href='${root}/${home}.do?firstCateNum=${firstCate}'">홈 <span class="activeBar"></span></li>
						<li class="sub_cate_element" onclick="location.href='${root}/new-book.do?firstCateNum=${firstCate}'">신간<span></span></li>
						<li class="sub_cate_element" onclick="location.href='${root}/best-sell.do?firstCateNum=${firstCate}&bestSeller=weekBest'">베스트셀러<span></span></li>
						<%-- <li class="sub_cate_element" onclick="location.href='${root}/normal.main'">맞춤추천<span></span></li> --%>
						<li class="sub_cate_element" onclick="location.href='${root}/event.do?firstCateNum=${firstCate}'">이벤트<span></span></li>
					</ul>
				</div>
			</c:if>
		</div>
	</div>

	<!-- 로그인창 -->
	<jsp:include page="login.jsp" />
	<!-- 회원가입 창 -->
	<jsp:include page="register.jsp" />
	<script type="text/javascript">
		window.addEventListener("load", headerIndexInit('${root}'));
		
		/**
		 * 검색창 제안(suggest) 기능 구현을 위한 자바스크립트 코드
		 */
		var rootContext = '${root}';
		var suggestBox = document.getElementById("main-search-suggest");
		var suggestAuthorList = suggestBox.querySelectorAll("ul")[0];
		var suggestBookList = suggestBox.querySelectorAll("ul")[1];
		
		function suggestKeyword(event) {			
			if (false) {
				//secondMessageBox.innerHTML = "";
			} else {
				$.post(rootContext + "/main/search/validation.do", {keyword : event.value}, function(data,status) {
					// 기존 제안 내용 초기화
					deleteAllChilds(suggestAuthorList);
					deleteAllChilds(suggestBookList);
					// 검색어 제안 박스 활성화
					suggestBox.classList.remove("hidden-block");
					// 제안 내용 화면 출력
					if (data.author == null || data.author.length == 0) {
						appendSuggestEmpty('author');
					} else {
						appendSuggestAuthorList(data.author);
					}
					
					if (data.book == null || data.book.length == 0) {
						appendSuggestEmpty('book');
					} else {
						appendSuggestBookList(data.book);
					}
				});
			}
		}
		
		function appendSuggestAuthorList(data) {
			var target = suggestAuthorList;
			var dFrag = document.createDocumentFragment();
			
			data.forEach(function(e,i) {
				var li = document.createElement("li");
				
				let innerHTML = '<button type="button" class="bf-button bf-transparent-btn" onclick="alert(\''+ e.author_num +'\')"><span class="material-icons">person</span>';
				innerHTML += '<span class="author">' + e.author_name + '</span>';
				if (e.count > 0) {
					innerHTML += '<span class="book">&nbsp;' + e.book_name + '</span>';
					innerHTML += '<span class="more-count '+ (e.count == 1 ? 'hidden-block' : '') +'">외&nbsp;'+ (e.count - 1) +'권</span>';
				}
				innerHTML += '</button>';
				li.innerHTML = innerHTML;
				
				dFrag.appendChild(li);
			});
			
			target.appendChild(dFrag);
		}
		
		function appendSuggestBookList(data) {
			var target = suggestBookList;
			var dFrag = document.createDocumentFragment();
			
			data.forEach(function(e,i) {
				var li = document.createElement("li");
				
				let innerHTML = '<div class="book-thumbnail"><a href="'+rootContext+'/detail.do?book_num='+e.book_num+'"><img src="'+e.img_path+'"></a></div><div class="book-content">';
				innerHTML += '<a href="'+rootContext+'/detail.do?book_num='+e.book_num+'"><span class="title font_13" title="도서명">'+e.book_name+'</span></a><div class="book-info">';
				innerHTML += '<span class="author" title="작가" onclick="alert(\''+ e.author_num +'\')">'+e.author_name+'</span>';
				innerHTML += '<span class="publisher" title="출판사" onclick="alert(\''+ e.pub_num +'\')">'+e.pub_name+'</span></div></div>';
				li.innerHTML = innerHTML;
				
				dFrag.appendChild(li);
			});
			
			target.appendChild(dFrag);
		}
		
		function appendSuggestEmpty(type) {
			if (type == 'author') {
				let innerHTML = '<li><button type="button" class="bf-button bf-transparent-btn disabled"><span class="material-icons">info</span><span class="author">검색된 저자가 없습니다.</span></button></li>';
				suggestAuthorList.innerHTML = innerHTML;
			} else if (type == 'book') {
				let innerHTML = '<li><button type="button" class="bf-button bf-transparent-btn disabled"><span class="material-icons">info</span><span class="author">검색된 도서가 없습니다.</span></button></li>';
				suggestBookList.innerHTML = innerHTML;
			}
		}
		
		function deleteAllChilds(target) {
			while (target.firstChild) {
				target.removeChild(target.firstChild);
			}
		}
		
		window.addEventListener("click", function(e) {
			var e = e || window.event;
			if (!suggestBox.parentElement.contains(e.target)) {
				// 기존 제안 내용 초기화
				deleteAllChilds(suggestAuthorList);
				deleteAllChilds(suggestBookList);
				// 검색어 제안 박스 비활성화
				suggestBox.classList.add("hidden-block");
			}
			e.stopImmediatePropagation();
		}, false);
		
		
	</script>
	<c:if test="${userInfo != null}">
		<script type="text/javascript">
		function updateUserMyMenu() {
			$.post("${root}/member/myMenu.do", {}, function(data,status) {
				if (data) {
					document.getElementById("amount-cash").innerHTML = data.cashTotal; 
					document.getElementById("amount-point").innerHTML = data.pointTotal; 
					document.getElementById("amount-purchased").innerHTML = data.purchasedTotal;
					document.getElementById("amount-cart").innerHTML = data.cartTotal == null ? 0 : data.cartTotal;
					document.getElementById("amount-wish").innerHTML = data.wishTotal == null ? 0 : data.wishTotal;
				}
			});
		}
		updateUserMyMenu();
		</script>
	</c:if>
</body>
</html>