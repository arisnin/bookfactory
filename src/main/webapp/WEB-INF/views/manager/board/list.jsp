<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				
					<form action="${root }/manager/boardList.do">
						<div class="sh_board_list_search">
							<ul>
								<li><input type="text" name="search-word" class="search-word" placeholder="제목  검색하기" /></li>
								<li><button type="submit" class="bf-button sh_search">검색</button></li>
							</ul>
						</div>
					</form>
					<form action="${root }/manager/boardList.do">
					<div class="sh_board_list_date">
						<ul>
							<li><input type="text" id="sh_date_start" name ="startDate" placeholder="시작 날짜" /></li>
							<li>~<input type="text" id="sh_date_end"name ="endDate" placeholder="종료 날짜" /></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day1">하루</button></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day7">일주일</button></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day30">한달</button></li>
							<li><button type="submit" class="bf-button">검색</button></li>
						</ul>
					</div>
					</form>
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
						<li>내용</li>
						<li>등록일자</li>
						<li>상태</li>
					</ul>
				</div>
				<div class="sh_board_list_list">
					<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
					<c:forEach var="freDtoList" items="${freDtoList }">
						<ul>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
							<li>${freDtoList.num}</li>
							<li>${freDtoList.title}</li>
							<li><c:out value="${fn:substring(freDtoList.content,0,10)}" />...</li>
							<li><fmt:formatDate value="${freDtoList.write_date}" pattern="yyyy-MM-dd" /></li>
							<li><button type="button" class="bf-button" onclick="javascript:location ='${root}/manager/boardUpdate.do?pageNumber=${pageNumber}&num=${freDtoList.num}'">수정</button></li>
							<li><button type="button" class="bf-button sh_list_delete">삭제</button></li>
						</ul>
					</c:forEach>

				</div>
			</div>
			<div class="sh_board_list_footer">
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">

						<c:if test="${count > 0}">
							<li class="first"><a href="#0"><span></span></a></li>

							<fmt:parseNumber var="pageCount" value="${count/boardSize + (count % boardSize == 0?0:1)}" integerOnly="true" />
							<c:set var="pageBlock" value="${5}" />
							<fmt:parseNumber var="rs" value="${(pageNumber-1)/pageBlock}" integerOnly="true" />

							<c:set var="startPage" value="${rs*pageBlock + 1}" />
							<c:set var="endPage" value="${startPage + pageBlock - 1}" />

							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>

							<c:if test="${startPage > pageBlock}">
								<li class="prev"><a href="${root}/manager/boardList.do?pageNumber=${startPage-pageBlock}"><span></span></a></li>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<a href="${root}/manager/boardList.do?pageNumber=${i}">${i}</a>
							</c:forEach>

							<c:if test="${endPage < pageCount}">
								<li class="next"><a href="${root}/manager/boardList.do?pageNumber=${(startPage + pageBlock)}"><span></span></a></li>
							</c:if>


							<li class="last"><a href="#0"><span></span></a></li>
						</c:if>
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