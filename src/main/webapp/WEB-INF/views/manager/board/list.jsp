<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/board_list.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

<title>자주 묻는 질문 게시판</title>
</head>
<body>
	<div id="sh_board_list">
		<div class="sh_main_text">자주 묻는 질문 게시판</div>
		<div id="sh_board_shadow">
			<div class="sh_board_list_header">


				<div class="sh_board_list_main">

					<div class="sh_board_list_search">
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
					<div class="sh_board_list_date">
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

				<div class="sh_board_list_select">
					<select>
						<option>등록일 순</option>
						<option>오래된 순</option>
					</select>
				</div>

			</div>
			<div class="sh_board_list_content">
				<div class="sh_board_list_title">
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="전체선택" id="allCheck" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
						<li>No</li>
						<li>제목</li>
						<li>유형</li>
						<li>등록일자</li>
						<li>상태</li>
					</ul>
				</div>
				<div class="sh_board_list_list">
					<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
						<li>1</li>
						<li>아이디또는 로그인이 안되시는경우!</li>
						<!-- 제목 -->
						<li>로그인/아이디</li>
						<li>17/12/20</li>
						<li><button type="button" class="bf-button" onclick="javascript:location ='${root}/manager/boardUpdate.do'">수정</button></li>
						<li><button type="button" class="bf-button sh_list_delete">삭제</button></li>
					</ul>
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check"/> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
						<li>2</li>
						<li>어떻게 보나요</li>
						<!-- 제목 -->
						<li>기타</li>
						<li>13/12/21</li>
					<li><button type="button" class="bf-button" onclick="javascript:location ='${root}/manager/boardUpdate.do'">수정</button></li>
						<li><button type="button" class="bf-button" onclick="javascript:location ='${root}/manager/boardDelete.do'">삭제</button></li>
					</ul>
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
						<li>3</li>
						<li>책이 핸드폰에서 안열려요!!</li>
						<!-- 제목 -->
						<li>오류</li>
						<li>15/12/21</li>
						<li><button type="button" class="bf-button" onclick="javascript:location ='${root}/manager/boardUpdate.do'">수정</button></li>
						<li><button type="button" class="bf-button" onclick="javascript:location ='${root}/manager/boardDelete.do'">삭제</button></li>
					</ul>


				</div>
			</div>
			<div class="sh_board_list_footer">
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
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-confirm.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
	<script type="text/javascript" src="${root}/script/manager/board.js"></script>
</body>
</html>