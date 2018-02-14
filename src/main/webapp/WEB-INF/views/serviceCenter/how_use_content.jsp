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
<link href="${root}/css/serviceCenter/pay_refund_content.css"
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
					<a href="${root }/serviceCenter/pay_refund.jsp">결제 / 환불</a>				
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
						<li><a href="${root }/serviceCenter/how_use_content.jsp">종이책으로 배송이 되나요?</a></li>
						<li>정호열이 정호열이 정호열</li>
						<li>호열이 호열이 호열이 호열이</li>
						<li>호여뤼 호여뤼 호여뤼 호여뤼 호호여뤼</li>		
					</ul>
			</div>
			
						
			<div class="service_information_cn_cn_right">
				<div class="service_information_cn_title">
					종이책으로 배송이 되나요?					
				</div>
		
						<div>
						<p>
						현재 리디북스에서 판매되고 있는 전자책은 종이책과 달리  무형의 콘텐츠이기 때문에 별도로 종이책 배송은 되지 않습니다.
						<br/><br/>
						
						전자책으로 구매하여 리디북스 애플리케이션 및 PC뷰어를 통해서 도서 이용이 가능하며, 고객님의 아이디로 구매한 도서는 탈퇴 전까지
						다운로드 횟수에 제한 없이 지속적으로 이용이 가능합니다.					
						
						</p>						
						</div>
					</div>
			
			

		</div>

	</div>

</body>
</html>