<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root}/css/manager/review.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${root}/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root}/css/basic/jquery-ui.theme.css">
<link rel="stylesheet" href="${root}/css/basic/jquery-confirm.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

<title>리뷰 관리자 페이지</title>
</head>
<body>
	<div id="sh_review">
		<div class="sh_main_text">리뷰 관리</div>
		<div id="sh_board_shadow">

			<div class="sh_review_header">
				<form method="get">
				<div class="sh_review_main">

					<div class="sh_review_search">
						<ul>
							<li>신고글</li>
							<li><input name="report" type="radio" checked="checked" value="all">전체</li>
							<li><input name="report" type="radio" value="report">신고건</li>
						</ul>

						<ul>
							<li>적립금</li>
							<li><input name="point" type="radio" checked="checked"value="all" >전체</li>
							<li><input name="point" type="radio" value="begin">예정</li>
							<li><input name="point" type="radio" value="end">완료</li>
						</ul>

					</div>
					
					<div class="sh_review_date">
						<ul>
							<li><input type="text" id="sh_date_start" placeholder="시작 날짜" /></li>
							<li>~<input type="text" id="sh_date_end" placeholder="종료 날짜" /></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day1">하루</button></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day7">일주일</button></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day30">한달</button></li>
							<li><button type="submit" class="bf-button">검색</button></li>
						</ul>
					</div>
				</div>
				</form>
			</div>
			<div class="sh_review_content">
				<div class="sh_review_title">
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="전체선택" id="allCheck" /> <span class="all-mark"></span><span class="checkbox-label"></span>
						</label></li>
						<li>No</li>
						<li>도서 명</li>
						<li>제 목</li>
						<li>작성자</li>
						<li>별점</li>
						<li>적립금</li>
						<li>작성일</li>
						<li>신고수</li>
						<li>비공개/삭제</li>
					</ul>
				</div>
				<div class="sh_review_list">
					<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
					<!-- 1번예제 -->
					<c:forEach var="reviewDto" items="${reviewDtoList}">
						<ul>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
							<li class="r_num">${reviewDto.r_num}</li>
							<li title="${reviewDto.b_name}"><c:out value="${fn:substring(reviewDto.b_name,0,10)}" />...</li>
							<li><a href="javascript:void(0)" class="sh_review_detail_button"><c:out value="${fn:substring(reviewDto.r_content,0,10)}" />...</a></li>
							<li><a href="${root}/manager/memberRegister.do?pageNumber=${pageNumber}&id=${reviewDto.r_id}">${reviewDto.r_id}</a></li>
							<li>
								<div class="content-star-rate review-info-row">
									<span class="star-icon-field material-icons"><c:forEach begin="1" end="${reviewDto.r_stat}">&#xe838;</c:forEach></span><span class="non-star-icon-field material-icons"><c:forEach begin="1" end="${5 - reviewDto.r_stat}">&#xe838;</c:forEach></span>
								</div>
							</li>
							
							<li><button type="button" value="${reviewDto.pcheck}" class="bf-button sh_button_point">적립금 100원</button></li>
							
							<li><fmt:formatDate value="${reviewDto.r_write_date}" pattern="yyyy/MM/dd" /></li>
					
							<li><a href="#" onclick="reviewPolice('${root}',this)">${reviewDto.count}</a></li>

							<li><button type="button" type="button" class="bf-button bf-white-btn sh_review_secret">비공개</button>
								<button type="button" type="button" class="bf-button bf-white-btn sh_review_open" style="display: none">공개</button>
								<button type="button" type="button" class="bf-button bf-white-btn sh_review_delete">삭제</button></li>
						</ul>
						<form name="sh_review_report_form" action="${root}/manager/reviewReport.do" method="post">
							<input type="hidden" value="${reviewDto.r_num}" name="r_num"> 
							<input type="hidden" value="${reviewDto.r_id}" name="r_id"> 
							<input type="hidden" value="${reviewDto.count}" name="count"> 
							<input type="hidden" value="${reviewDto.r_content}" name="r_content"> 
							<input type="hidden" value="${pageNumber}" name="pageNumber">
							<input type="hidden" name="pnum" value="${reviewDto.pnum}">
							<input type="hidden" name="prvpoint" value="${reviewDto.prvpoint}">
						</form>
						<script type="text/javascript">
							function reviewPolice(root, obj) {
								var url = root;
								var ul = $(obj).parent().parent();
								var form = ul.next("form");
								form.submit();
				 			}
						 	$(function() {
						 
						 		var button =  $(".sh_button_point");
						 		button.each(function(){
						 			if($(this).val() == "-1"){
						 				$(this).css("background-color", "gray");
						 				$(this).css("pointer-events", "none");	
						 			}
						 		});
						 	});
							
						</script>
						<div class="collapsable-notice" id="sh_review_hidden" style="display: none;">
							<p>${reviewDto.r_content}</p>
						</div>
					
					</c:forEach>
				</div>
			</div>
			<input type="hidden" name="href">

			<div class="a_se_foot">
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">
						<c:if test="${search-word==null}">
							<c:set var="href" value="${root}/manager/reviewReview.do?pageNumber=" />
						</c:if>
						<c:if test="${search-word!=null}">
							<c:set var="href" value="${root}/manager/reviewReview.do?searchWord=${searchWord}&pageNumber=" />
						</c:if>

						<li class="first"><a href="${href}1"><span></span></a></li>
						<c:if test="${count > 0}">
							<fmt:parseNumber var="pageCount" value="${count/boardSize + (count % boardSize == 0?0:1)}" integerOnly="true" />
							<c:set var="pageBlock" value="${5}" />
							<fmt:parseNumber var="rs" value="${(pageNumber-1)/pageBlock}" integerOnly="true" />

							<c:set var="startPage" value="${rs*pageBlock + 1}" />
							<c:set var="endPage" value="${startPage + pageBlock - 1}" />

							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
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
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-confirm.js"></script>
	<script type="text/javascript" src="${root}/script/manager/review.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
	<script type="text/javascript">
		function goUpdate(url) {
			location.href = url + $("input[name=href]").val();
		}
		//페이지 활성화
		$(".bf-animated-btn").find("li").each(function() {
			if ($(this).text() == '${pageNumber}') {
				$(this).find("a").addClass("active");
			}
		});
		var before = location.href;
		if (before.indexOf('?') == -1) {
			$("input[name=href]").val("");
		} else {
			$("input[name=href]").val(
					"&" + before.substring(before.indexOf('?') + 1));
		}
		
	</script>

</body>
</html>