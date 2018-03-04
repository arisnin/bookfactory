<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

					<div class="sh_board_contact_search">
						<ul>
							<li>사용문의</li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_total_search" checked="checked" /> <span class="all-mark"></span><span class="checkbox-label">전체</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" checked="checked" /> <span class="all-mark "></span><span class="checkbox-label">아이디/로그인</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" checked="checked" /> <span class="all-mark "></span><span class="checkbox-label">결제/환불</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" checked="checked" /> <span class="all-mark sh_choice_search"></span><span class="checkbox-label">이용문의</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" checked="checked" /> <span class="all-mark"></span><span class="checkbox-label">오류/활용</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" checked="checked" /> <span class="all-mark"></span><span class="checkbox-label">시스템업데이트</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" checked="checked" /> <span class="all-mark"></span><span class="checkbox-label">서비스제안</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_search" checked="checked" /> <span class="all-mark"></span><span class="checkbox-label">기타</span></label></li>
						</ul>
						<ul>
							<li>도서제안</li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_book_search" checked="checked" /> <span class="all-mark"></span><span class="checkbox-label">전체</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_book" checked="checked" /> <span class="all-mark sh_choice_search"></span><span class="checkbox-label">판타지/무협</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_book" checked="checked" /> <span class="all-mark "></span><span class="checkbox-label">로맨스</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_book" checked="checked" /> <span class="all-mark"></span><span class="checkbox-label">만화</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_book" checked="checked" /> <span class="all-mark "></span><span class="checkbox-label">일반</span></label></li>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_choice_book" checked="checked" /> <span class="all-mark"></span><span class="checkbox-label">BL(소설/만화)</span></label></li>
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
				<div class="sh_board_contact_title">
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="전체선택" id="allCheck" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
						<li>No</li>
						<li>제목</li>
						<li>상세설명</li>
						<li>질문유형</li>
						<li>연락처</li>
						<li>작성일</li>
						<li>작성자</li>
						<li>상세보기</li>
						<li>답변여부</li>
					</ul>
				</div>
				<div class="sh_board_contact_list">
					
					<c:forEach var="contactDto" items="${contactDtoList}">
					<form action="${root}/manager/boardReply.do" name ="board_contact_reply" method="post">
						<ul>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
							<li>${contactDto.num}</li>
							<li>${contactDto.title}</li>
							<li><c:out value="${fn:substring(contactDto.content,0,10)}"/>...</li>
							<li>${contactDto.q1_name}</li>
							<li>${contactDto.mem_phone}</li>
							<li><fmt:formatDate value="${contactDto.write_date}" pattern="yyyy-MM-dd"></fmt:formatDate></li>
							<li><a href="${root}/manager/memberRegister.do?id=${contactDto.id}">${contactDto.id}</a></li>
							<li><a href="#" class="bf-button bf-animated-btn" onclick="$(this).parent().parent().parent().submit()">상세보기</a></li>
							<li>${contactDto.reply_check}</li>
						</ul>
					
						<input type="hidden" value="${contactDto.num}" name ="num">
						<input type="hidden" value="${contactDto.title}" name ="title">
						<input type="hidden"value="${contactDto.content}" name ="content">
						<input type="hidden" value="${contactDto.q2_name}" name ="q2_name">
						<input type="hidden" value="${contactDto.id}" name ="id">
						<input type="hidden" value="${contactDto.category}" name ="category">
						<input type="hidden" value="${contactDto.reply_check}" name ="reply_check">
						<input type="hidden" value="${contactDto.reply_content}" name ="reply_content">
						<input type="hidden" value="${contactDto.mem_phone}" name ="mem_phone">
						<input type="hidden" value="${contactDto.file_name}" name ="file_name">
						<input type="hidden" value="${contactDto.file_size}" name ="file_size">
						<input type="hidden" value="${contactDto.file_path}" name ="file_path">
						<input type="hidden" value="${pageNumber}" name ="pageNumber">
					</form>
					</c:forEach>
				</div>
			</div>
			
		<input type="hidden" name="href">
			
			<div class="a_se_foot">
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">
						<c:if test="${search-word==null}">
							<c:set var="href" value="${root}/manager/boardContact.do?pageNumber="/>
						</c:if>
						<c:if test="${search-word!=null}">
							<c:set var="href" value="${root}/manager/boardContact.do?searchWord=${searchWord}&pageNumber="/>
						</c:if>
						
						<li class="first"><a href="${href}1"><span></span></a></li>
						<c:if test="${count > 0}">
							<fmt:parseNumber var ="pageCount" value="${count/boardSize + (count % boardSize == 0?0:1)}" integerOnly="true"/>
							<c:set var ="pageBlock" value="${5}"/>
							<fmt:parseNumber var="rs" value="${(pageNumber-1)/pageBlock}" integerOnly="true"/>
							
							<c:set var="startPage" value="${rs*pageBlock + 1}"/>
							<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
							
							<c:if test="${endPage > pageCount}">
							<c:set var="endPage" value="${pageCount}"/>
						</c:if>
						</c:if>
						
						<c:if test="${startPage > pageBlock}">
							<li class="prev"><a href="${href}${startPage-1}"><span></span></a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li><a href="${href}${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${endPage < pageCount}">
							<li class="next"><a href="${href}${endPage+1}"><span></span></a></li>
						</c:if>
						<li class="last"><a href="${href}${pageCount}"><span></span></a></li>
					</ul>
				</nav>
				</div>
		</div>
		
	</div>
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
	<script type="text/javascript" src="${root}/script/manager/board.js"></script>
		<script type="text/javascript">
		function goUpdate(url){
			location.href=url + $("input[name=href]").val();
		}
		//페이지 활성화
		$(".bf-animated-btn").find("li").each(function(){
			if($(this).text()=='${pageNumber}'){
				$(this).find("a").addClass("active");
			}
		});
		var before = location.href;
		if(before.indexOf('?') == -1){
			$("input[name=href]").val("");
		}else{
			$("input[name=href]").val("&"+ before.substring(before.indexOf('?')+1));
		}
	</script>
</body>
</html>