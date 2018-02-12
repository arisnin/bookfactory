<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<title>회원관리 페이지</title>
</head>
<body>
	<div id="sh_member_pay">
		<div class="sh_member_pay_header">
			<div class="sh_main_text">회원관리 페이지</div>
			<div class="sh_member_pay_main">

				<div class="sh_member_pay_search">
					<ul>
						<li><select style="height: 1.6rem; size: 2rem;">
								<option>전체</option>
								<option>성명</option>
								<option>아이디</option>
						</select></li>
						<li><input type="text" name="search-word" class="search-word"  placeholder="바로  검색하기" /></li>
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
					<li><label class="bf-custom-checkbox"> <input
							type="checkbox" title="전체선택" id="allCheck" /> <span
							class="all-mark"></span><span class="checkbox-label"></span>
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
				<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
				<!-- 첫번째 예제 -->
				<ul>
					<li><label class="bf-custom-checkbox"> <input
							type="checkbox" title="목록" class="sh_check" /> <span
							class="all-mark"></span><span class="checkbox-label"></span></label></li>
					<li>1</li>
					<li>jeonsh1220</li>
					<li>전상헌</li>
					<li>70000만원</li>
					<li>5000 point</li>
					<li>18/11/20</li>
					<li><a href="#">10</a></li>
					<li><a class="bf-button bf-animated-btn" href="javascript:linkA('/manager/member/member_pay_detail.jsp')">상세보기</a></li>
				</ul>
				<!-- 두번째 예제 -->
			<ul>
					<li><label class="bf-custom-checkbox"> <input
							type="checkbox" title="목록" class="sh_check" /> <span
							class="all-mark"></span><span class="checkbox-label"></span></label></li>
					<li>2</li>
					<li>jeonsh1220</li>
					<li>전상헌</li>
					<li>70000만원</li>
					<li>5000 point</li>
					<li>18/11/20</li>
					<li><a href="#">10</a></li>
							<li><a class="bf-button bf-animated-btn" href="${root }/manager/member/member_pay_detail.jsp">상세보기</a></li>
				</ul>
			</div>
		</div>

	<div class="sh_member_pay_footer">
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

<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
<script type="text/javascript" src ="${root}/script/manager/total.js"></script>
</body>
</html>