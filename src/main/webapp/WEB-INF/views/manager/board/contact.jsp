<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" href="${root }/css/manager/board_contact.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">

<title>1:1 문의</title>
</head>
<body>
	<div id="sh_board_contact">
		<div class="sh_main_text">1:1문의</div>
		<div id="sh_board_shadow">
		<div class="sh_board_contact_header">
			
			
			<div class="sh_board_contact_main">
			
			<div class ="sh_board_contact_search">
				<ul>
					<li>질문유형</li>
					<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_total_search" /> <span class="all-mark"></span><span class="checkbox-label">전체</span></label></li>
					<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" /> <span class="all-mark "></span><span class="checkbox-label">아이디/로그인</span></label></li>
					<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" /> <span class="all-mark "></span><span class="checkbox-label">결제/환불</span></label></li>
					<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" /> <span class="all-mark sh_choice_search"></span><span class="checkbox-label">이용문의</span></label></li>
					<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" /> <span class="all-mark"></span><span class="checkbox-label">오류/활용</span></label></li>
					<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" /> <span class="all-mark"></span><span class="checkbox-label">시스템업데이트</span></label></li>
					<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" /> <span class="all-mark"></span><span class="checkbox-label">서비스제안</span></label></li>
					<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" /> <span class="all-mark"></span><span class="checkbox-label">기타</span></label></li>
				</ul>
				
			</div>
				<div class="sh_board_contact_date">
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

			<div class="sh_board_contact_select">
				<select>
					<option>최신글 순</option>
					<option>오래된 순</option>
				</select>
			</div>

		</div>
		<div class="sh_board_contact_content">
			<div class ="sh_board_contact_title">
				<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="전체선택" id="allCheck" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>No</li>
				<li>제목</li>
				<li>상세설명</li>
				<li>질문유형</li>
				<li>연락 수단</li>
				<li>작성일</li>
				<li>작성자</li>
				<li>상세보기</li>
				<li>답변여부</li>
				</ul>	
			</div>
			<div class="sh_board_contact_list">
			<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
			<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>1</li>
				<li>운영자님 너무 멋져요</li><!--책정보 넘어가기-->
				<li>안녕하세요 저는 1학년2반전상...</li><!-- 댓글페이지 넘어가기 -->
				<li>기타</li>
				<li>전화 (010-4903-8834)</li>
				<li>18/01/22</li>
				<li><a href="#">전상헌</a></li><!-- 회원정보로 넘어가기-->
				<li><a href="${root}/manager/boardReply.do" class="bf-button bf-animated-btn">상세보기</a></li>
				<li>X</li>
			</ul>
		<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>2</li>
				<li>로그인이 안돼!</li><!--책정보 넘어가기-->
				<li>운영자님 로그인이 안되는 이유가 뭘까요?..</li><!-- 댓글페이지 넘어가기 -->
				<li>로그인/아이디</li>
				<li>메일(ajffkdy90@naver.com)</li>
				<li>18/01/31</li>
				<li><a href="#">김삿갓</a></li><!-- 회원정보로 넘어가기-->
				<li><a href="${root}/manager/board/board_reply.jsp" class="bf-button bf-animated-btn">상세보기</a></li>
				<li>O</li>
			</ul>
			<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>3</li>
				<li>1+1이벤트언제하나요</li><!--책정보 넘어가기-->
				<li>작년 이 맘때쯔음에 1+1이벤트 했던 기억...</li><!-- 댓글페이지 넘어가기 -->
				<li>이벤트 문의</li>
				<li>문자(010-4903-1122)</li>
				<li>18/02/11</li>
				<li><a href="#">정유미</a></li><!-- 회원정보로 넘어가기-->
				<li><a href="${root}/manager/board/board_reply.jsp" class="bf-button bf-animated-btn">상세보기</a></li>
				<li>O</li>
			</ul>
				<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>3</li>
				<li>1+1이벤트언제하나요</li><!--책정보 넘어가기-->
				<li>작년 이 맘때쯔음에 1+1이벤트 했던 기억...</li><!-- 댓글페이지 넘어가기 -->
				<li>이벤트 문의</li>
				<li>문자(010-4903-1122)</li>
				<li>18/02/11</li>
				<li><a href="#">정유미</a></li><!-- 회원정보로 넘어가기-->
				<li><a href="${root}/manager/board/board_reply.jsp" class="bf-button bf-animated-btn">상세보기</a></li>
				<li>O</li>
			</ul>
				<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>3</li>
				<li>1+1이벤트언제하나요</li><!--책정보 넘어가기-->
				<li>작년 이 맘때쯔음에 1+1이벤트 했던 기억...</li><!-- 댓글페이지 넘어가기 -->
				<li>이벤트 문의</li>
				<li>문자(010-4903-1122)</li>
				<li>18/02/11</li>
				<li><a href="#">정유미</a></li><!-- 회원정보로 넘어가기-->
				<li><a href="${root}/manager/board/board_reply.jsp" class="bf-button bf-animated-btn">상세보기</a></li>
				<li>O</li>
			</ul>
				<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>3</li>
				<li>1+1이벤트언제하나요</li><!--책정보 넘어가기-->
				<li>작년 이 맘때쯔음에 1+1이벤트 했던 기억...</li><!-- 댓글페이지 넘어가기 -->
				<li>이벤트 문의</li>
				<li>문자(010-4903-1122)</li>
				<li>18/02/11</li>
				<li><a href="#">정유미</a></li><!-- 회원정보로 넘어가기-->
				<li><a href="${root}/manager/board/board_reply.jsp" class="bf-button bf-animated-btn">상세보기</a></li>
				<li>O</li>
			</ul>
				<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>3</li>
				<li>1+1이벤트언제하나요</li><!--책정보 넘어가기-->
				<li>작년 이 맘때쯔음에 1+1이벤트 했던 기억...</li><!-- 댓글페이지 넘어가기 -->
				<li>이벤트 문의</li>
				<li>문자(010-4903-1122)</li>
				<li>18/02/11</li>
				<li><a href="#">정유미</a></li><!-- 회원정보로 넘어가기-->
				<li><a href="${root}/manager/board/board_reply.jsp" class="bf-button bf-animated-btn">상세보기</a></li>
				<li>O</li>
			</ul>
				<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>3</li>
				<li>1+1이벤트언제하나요</li><!--책정보 넘어가기-->
				<li>작년 이 맘때쯔음에 1+1이벤트 했던 기억...</li><!-- 댓글페이지 넘어가기 -->
				<li>이벤트 문의</li>
				<li>문자(010-4903-1122)</li>
				<li>18/02/11</li>
				<li><a href="#">정유미</a></li><!-- 회원정보로 넘어가기-->
				<li><a href="${root}/manager/board/board_reply.jsp" class="bf-button bf-animated-btn">상세보기</a></li>
				<li>O</li>
			</ul>
				<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>3</li>
				<li>1+1이벤트언제하나요</li><!--책정보 넘어가기-->
				<li>작년 이 맘때쯔음에 1+1이벤트 했던 기억...</li><!-- 댓글페이지 넘어가기 -->
				<li>이벤트 문의</li>
				<li>문자(010-4903-1122)</li>
				<li>18/02/11</li>
				<li><a href="#">정유미</a></li><!-- 회원정보로 넘어가기-->
				<li><a href="${root}/manager/board/board_reply.jsp" class="bf-button bf-animated-btn">상세보기</a></li>
				<li>O</li>
			</ul>
				<ul>
			<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
				<li>3</li>
				<li>1+1이벤트언제하나요</li><!--책정보 넘어가기-->
				<li>작년 이 맘때쯔음에 1+1이벤트 했던 기억...</li><!-- 댓글페이지 넘어가기 -->
				<li>이벤트 문의</li>
				<li>문자(010-4903-1122)</li>
				<li>18/02/11</li>
				<li><a href="#">정유미</a></li><!-- 회원정보로 넘어가기-->
				<li><a href="${root}/manager/board/board_reply.jsp" class="bf-button bf-animated-btn">상세보기</a></li>
				<li>O</li>
			</ul>
			
		</div>
		</div>
		<div class="sh_board_contact_footer">
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
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script type="text/javascript" src ="${root}/script/manager/total.js"></script>
<script type="text/javascript" src ="${root}/script/manager/board.js"></script>
</body>
</html>