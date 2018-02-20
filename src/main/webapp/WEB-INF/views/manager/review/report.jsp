<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/review_report.css">
<link rel="stylesheet" href="${root}/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root}/css/basic/jquery-ui.theme.css">
<title>신고 관리페이지</title>
</head>
<body>
	<div id="sh_review_report">

		<div class="sh_review_report_header">
			<div class="sh_main_text">신고 관리 페이지</div>
			<div id="sh_board_shadow">
				<div class="sh_review_report_main">
					<ul>
						<li><span>해당리뷰 번호 :</span></li>
						<li><span>총 신고수 : </span>${count }</li>
						<li><button type="button" class="bf-button">리뷰로 돌아가기</button></li>
					</ul>
		
				</div>

				<div class="sh_review_report_content">
					<!--  결제관리페이지 -->
					<div class="sh_review_report_list" id="sh_review_report_list-1">
						<div class="sh_review_report_title">
							<ul>
								<li>리뷰번호</li>
								<li>신고번호</li>
								<li>리뷰제목</li>
								<li>신고종류</li>
								<li>신고자</li>
								<li>신고일자</li>
							</ul>
						</div>
						<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
						<div class="sh_review_report_list">
							<c:forEach var="accuseDto" items="${accuseDtoList}">
								<!-- 1번예제 -->
								<ul>
									<li>${accuseDto.review_num}</li>
									<li>${accuseDto.rnum}</li>
									<li><a href="javascript:void(0)" class="sh_report_detail_button"><c:out value="${fn:substring(accuseDto.review_content,0,10)}" />...</a></li>
									<li>${accuseDto.description}</li>
									<li>${accuseDto.accuse_id}</li>
									<li><fmt:formatDate value="${accuseDto.write_date}" pattern="yyyy-MM-dd"/>
								</ul>
								<div class="collapsable-notice" id="sh_report_hidden" style="display: none;">
									<p>${accuseDto.review_content}</p>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="sh_review_report_footer">
			<nav class="bf-pagination">
				<ul class="bf-animated-btn">
				<c:if test="${searchWord==null}">
                     <c:set var="href" value="${root}/manager/reviewReport.do?pageNumber="/>
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
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
	<script type="text/javascript" src="${root}/script/manager/review_report.js"></script>
</body>
</html>