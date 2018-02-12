<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" href="${root }/css/manager/member.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">

<title>회원관리 페이지</title>
</head>
<body>
	<div id="sh_member">
		<div class="sh_main_text">회원관리 페이지</div>
		<div id="sh_board_shadow">
			<div class="sh_member_header">

				<div class="sh_member_main">

					<div class="sh_member_search">
						<ul>
							<li><select style="height: 1.6rem; size: 2rem;">
									<option>전체</option>
									<option>성명</option>
									<option>아이디</option>
							</select></li>
							<li><input type="text" name="search-word" class="search-word" placeholder="바로  검색하기" /></li>
							<li><button type="button" class="bf-button">검색</button></li>
						</ul>

					</div>
					<div class="sh_member_date">
						<ul>
							<li><input type="text" id="sh_date_start" placeholder="시작 날짜" /></li>
							<li>~<input type="text" id="sh_date_end" placeholder="종료 날짜" /></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day1">하루</button></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day7">일주일</button></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day30">한달</button></li>
							<li><button type="button" class="bf-button">검색</button></li>
						</ul>
					</div>
				</div>

				<div class="sh_member_select">
					<select>
						<option>등록일 순</option>
						<option>오래된 순</option>
					</select>
				</div>

			</div>
			<div class="sh_member_content">
				<div class="sh_member_title">
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="전체선택" id="allCheck" /> <span class="all-mark"></span><span class="checkbox-label"></span>
						</label></li>
						<li>순번</li>
						<li>아이디</li>
						<li>이름</li>
						<li>가입일</li>
						<li>최종방문일</li>
						<li>방문 수</li>
						<li>게시글 수</li>
						<li>상세보기</li>
					</ul>
				</div>
				<div class="sh_member_list">
					<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->

				</div>
				<div class="sh_member_list">
					<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
					<!-- 첫번째 예제 -->
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
						<li>1</li>
						<li>jeonsh1220</li>
						<!-- 회원정보상세페이지 넘어가기 -->
						<li>전상헌</li>
						<li><span>18/01/01</span></li>
						<li>18/01/02</li>
						<li>1</li>
						<li>10</li>
						<!-- 게시글 목록 넘어가기 -->
						<li><a href="${root}/manager/memberRegister.do" class="bf-button bf-animated-btn">상세보기</a></li>
					</ul>
					<!-- 두번째 예제 -->
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
						<li>2</li>
						<li>coco0525</li>
						<li>코코</li>
						<!-- 회원정보상세페이지 넘어가기 -->
						<li><span>16/05/25</span></li>
						<li>18/01/02</li>
						<li>2</li>
						<li>20</li>
						<!-- 게시글 목록 넘어가기 -->
						<li><a href="${root}/manager/memberRegister.do" class="bf-button bf-animated-btn">상세보기</a></li>
					</ul>
				</div>
			</div>


			<div class="sh_member_footer">
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
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
</body>
</html>