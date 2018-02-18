<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리 책 판다!</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css" />
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
						<form action="${root}/main/search.do" method="post">
							<input class="hw_search_input" type="text" name="indexSearch" placeholder="제목,저자,출판사 검색" />
						</form>
						<span class="hw_del_icon">
							<img src="${root}/img/index/searchdel.JPG" />
						</span>
					</div>
				</div>
				
				<c:if test="${userInfo == null}">
					<div class="hw_top_content_right login">
						<span class="hw_font">
							<a class="hw_top_content_right_login" href="javascript:goLogin()">로그인</a>
						</span>
						<span class="hw_font">
							<a class="hw_top_content_right_register" href="javascript:goRegister()">회원가입</a>
						</span>
					</div>
				</c:if>
				<c:if test="${userInfo != null}">
					<div class="hw_top_content_right login_ok" style="display: inline-block;">
						<span class="hw_font">
							<a href="${root}/myPage/home.do" style="margin-right:5px;">마이팩토리(${userInfo.username}, ${userInfo.memberDto.email})</a>
						</span>
						<span class="hw_font">
							<a href="${root}/cart.do">카트</a>
						</span>
						<span class="hw_font">
							<a href="${root}/wishlist.do">위시리스트</a>
						</span>
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
						<li class="hw_mid_item list_general" onclick="location.href='${root}/normal.do'">
							<img class="hw_mid_icon" src="${root}/img/index/ilban.png"> <span class="hw_mid_font">일반</span>
						</li>
						<li class="hw_mid_item list_romance" onclick="location.href='${root}/romance.do'">
							<img class="hw_mid_icon" src="${root}/img/index/love.png"> <span class="hw_mid_font">로맨스</span>
						</li>
						<li class="hw_mid_item list_fantasy" onclick="location.href='${root}/fantasy.do'">
							<img class="hw_mid_icon" src="${root}/img/index/fantasi.png"> <span class="hw_mid_font">판타지</span>
						</li>
						<li class="hw_mid_item list_comic" onclick="location.href='${root}/comic.do'">
							<img class="hw_mid_icon" src="${root}/img/index/manhwa.png"> <span class="hw_mid_font">만화</span>
						</li>
						<li class="hw_mid_item list_bl" onclick="location.href='${root}/bl.do'">
							<img class="hw_mid_icon" src="${root}/img/index/bl.png"> <span class="hw_mid_font">BL</span>
						</li>
					</ul>
				</nav>
				<ul class="hw_middle_right">
					<c:if test="${true}">
						<li class="hw_mid_item list_manager" onclick="location.href='${root}/manager/index.do'"><img class="hw_mid_icon" src="${root}/img/index/213111_gray.png"> <span class="hw_mid_font">관리자</span></li>
					</c:if>
					<li class="hw_mid_item list_cash" onclick="location.href='${root}/payment/ridiCash.do'"><img class="hw_mid_icon" src="${root}/img/index/213111_gray.png"> <span class="hw_mid_font">캐시충전</span></li>
				</ul>
				<!-- 전체메뉴 클릭시 나오는 뷰 -->
				<jsp:include page="indexAllMenu.jsp"/>
				<!-- 숨겨진 전체메뉴 끝 -->
			</div>
		</div>
		<!-- --------------------------- -->
		<div class="hw_sub_wrap">
			<div class="hw_sub_cate">
				<span>단행본</span>
				<ul>
					<li class="sub_cate_element" onclick="location.href='${root}/normal.do?firstCate=${firstCate}&bookType=paper'">홈 <span class="activeBar"></span></li>
					<li class="sub_cate_element" onclick="location.href='${root}/new-book.do?firstCate=${firstCate}&bookType=paper'">신간<span></span></li>
					<li class="sub_cate_element" onclick="location.href='${root}/best-sell.do?firstCate=${firstCate}&bookType=paper&bestSeller=weekBest'">베스트셀러<span></span></li>
					<%-- <li class="sub_cate_element" onclick="location.href='${root}/normal.main'">맞춤추천<span></span></li> --%>
					<li class="sub_cate_element" onclick="location.href='${root}/event.do?firstCate=${firstCate}&bookType=paper'">이벤트<span></span></li>
				</ul>
				<h3 class="sub_cate_line">|</h3>
				<span>연재</span>
				<ul>
					<li class="sub_cate_element">홈<span></span></li>
					<li class="sub_cate_element">신간<span></span></li>
					<li class="sub_cate_element">베스트셀러<span></span></li>
					<!-- <li class="sub_cate_element">선호작품<span></span></li> -->
					<li class="sub_cate_element">이벤트<span></span></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- 로그인창 -->
	<jsp:include page="login.jsp" />
	<!-- 회원가입 창 -->
	<jsp:include page="register.jsp" />
	<script type="text/javascript">
		window.addEventListener("load", headerIndexInit('${root}'));
	</script>
</body>
</html>