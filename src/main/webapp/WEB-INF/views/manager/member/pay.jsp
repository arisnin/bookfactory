<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/member_pay.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">


<title>회원 결제 관리 페이지</title>
</head>
<body>
	<div id="sh_member_pay">
		<div class="sh_main_text">회원 결제 관리 페이지</div>
		
		<form action="${root}/manager/memberPayDetail.do" method="post" >
			<div id="sh_board_shadow">
			<div class="sh_member_pay_header">
			
				<div class="sh_member_pay_main">

					<div class="sh_member_pay_search">
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
					<div class="sh_member_pay_date">
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

				<div class="sh_member_pay_select">
					<select>
						<option>등록일 순</option>
						<option>오래된 순</option>
					</select>
				</div>

			</div>
			<div class="sh_member_pay_content">
				<div class="sh_member_pay_title">
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="전체선택" id="allCheck" /> <span class="all-mark"></span><span class="checkbox-label"></span>
						</label></li>
						<li>순번</li>
						<li>아이디</li>
						<li>이름</li>
						<li>남은 캐시</li>
						<li>적립금</li>
						<li>마지막 충전일</li>
						<li>쿠폰</li>
						<li>상세보기</li>
					</ul>
				</div>

				<div class="sh_member_pay_list">
					<c:forEach var="cashDto" items="${cashDtoList }">
						<ul>
							<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
							<li>${cashDto.cash_num }</li>
							<li>${cashDto.cash_id }</li>
							<li>${cashDto.member_name}</li>
							<li>${cashDto.cash_total }원</li>
							<li>${cashDto.point_total }<br/>point</li>
							<li><fmt:formatDate value="${cashDto.last_date }" pattern="yyyy-MM-dd"/></li>
							<li>쿠폰미구현</li>
							<li><button type="submit" class="bf-button" >상세보기</button></li>						
						</ul>
							<input type="hidden" name="cash_num" value="${cashDto.cash_num}">
							<input type="hidden" name="cash_id" value="${cashDto.cash_id }">
							<input type="hidden" name="member_name" value="${cashDto.member_name }">
							<input type="hidden" name="cash_total" value="${cashDto.cash_total }">
							<input type="hidden" name="point_total" value="${cashDto.point_total }">
							<input type="hidden" name="cash_num" value="${cashDto.cash_num }">
							
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
								<li class="prev"><a href="${root}/manager/memberPay.do?pageNumber=${startPage-pageBlock}"><span></span></a></li>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<a href="${root}/manager/memberPay.do?pageNumber=${i}">${i}</a>
							</c:forEach>

							<c:if test="${endPage < pageCount}">
								<li class="next"><a href="${root}/manager/memberPay.do?pageNumber=${(startPage + pageBlock)}"><span></span></a></li>
							</c:if>


							<li class="last"><a href="#0"><span></span></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
		</form>
	</div>

	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
</body>
</html>