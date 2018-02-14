<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css"
	rel="stylesheet" />
<link href="${root}/css/serviceCenter/error_use_content.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</title>
</head>
<body>


	<jsp:include page="${root }/serviceCenter/main_header.jsp" />


	<div class="service_information_cn">

		<div class="service_FAQ_home_header">
			<div class="service_FAQ_home_header_left">
				<span>
				<a href="${root }/serviceCenter/main.jsp">리디북스 고객센터</a></span>
					<span>></span>
					<a href="${root }/serviceCenter/error_use.jsp">오류 / 활용 도움말</a>				
			</div>


			<div class="service_FAQ_home_header_right">
				<div class="bf-service-type-menu">
					<div class="search-box">
						<form method="get">
							<span class="material-icons">search</span> <input
								class="search-word" type="text" name="search-word"
								placeholder="검색" />
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="service_information_cn_cn">
		
			<div class="service_information_cn_cn_left">
				
					<div class="service_information_cn_cn_left_title">이 섹션의 문서</div>
					<ul>
						<li><a href="${root }/serviceCenter/error_use_content.jsp">도서정가제란 무엇인가요?</a></li>
						<li>연재도서는 단행본으로 교체가 가능한가요?</li>
						<li>안돼.</li>
						<li>가나다라마바사아자차타카파하</li>		
					</ul>				
			</div>
			
						
			<div class="service_information_cn_cn_right">
				<div class="service_information_cn_title">
					도서정가제란 무엇인가요?					
				</div>
		
						<div>
						<p>
						도서정가제란 온라인을 포함한 서점이 출판사 정가대로 서적을 판매하도록 의무화한 제도로 2014년 11월 21일부터 시행되었습니다.
						도서 정가의 할인 폭은 신간, 구간 모두 10%로 제한되어 있으며 경품, 마일리지, 적립금과 같은 부분은 추가로 5%까지 할인이 가능합니다.
						단, 출판사가 도서 출간 후 18개월이 지난 도서의 정가를 재조정 할 수 있습니다.<br/><br/>
						
						도서정가제에 따라 정가에서 이미 할인이 적용된 도서에는 추가로 10% 할인 쿠폰 적용이 불가합니다.
						<br/><br/>
						
						10%할인 쿠폰은 정가로 판매되는 도서에만 적용이 가능하며, 이 외에 다양한 이벤트로 고객님께서 합리적으로 도서를 구매하실 수 있도록 노력하겠습니다.						
						
						</p>						
						</div>
					</div>
			
			

		</div>

	</div>

</body>
</html>