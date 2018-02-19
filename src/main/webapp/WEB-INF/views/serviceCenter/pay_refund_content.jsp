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
<link href="${root}/css/serviceCenter/how_use_content.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</title>
</head>
<body>


	<jsp:include page="./main_header.jsp" />

	<div class="service_information_cn">

		<div class="service_FAQ_home_header">
			<div class="service_FAQ_home_header_left">
				<span>
				<a href="${root }/serviceCenter/main.do">리디북스 고객센터</a></span>
					<span>></span>
					<a href="${root }/serviceCenter/pay_refund.do">결제 / 환불</a>				
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
						<li><a href="${root }/serviceCenter/pay_refund_content.do">리디캐시와 리디포인트의 유효기간이 따로 있나요?</a></li>
						<li>리디캐시와 리디포인트는 무엇이 다른가요?</li>
						<li>리디캐시를 환불 받고 싶습니다.</li>
						<li>리디캐시란 무엇인가요?</li>		
					</ul>					
			</div>
			
						
			<div class="service_information_cn_cn_right">
				<div class="service_information_cn_title">
					리디캐시와 리디포인트의 유효기간이 따로 있나요?					
				</div>
		
						<div>
						<p>
						<span>리디캐시</span>는 마지막 사용일을 기준으로 60개월 (5년)동안 유효하며 60개월 후에는 자동으로 소멸됩니다.<br/><br/>
						(예를 들어 결제 후 59개월 되는 날, 보유하신 리디캐시의 일부를 사용하시면 사용일을 기준으로 다시 60개월이 갱신됩니다.)
						<br/><br/>
						
						<span>리디포인트</span>는 유효기간이 있는 <span>[기간 한정 포인트]</span>와 유효기간이 없는 <span>[일반 리디포인트]</span>가 있습니다.
						<br/><br/>						
						
						기간 한정 포인트는 이벤트 당첨 등의 이유로 지급되며 지정된 기간 내에서만 사용이 가능합니다.
						<br/>
						기간이 지나면 자동 소멸되며 <strong>[마이리디 > 리디포인트]</strong>에서 금액과 소멸예정일을 확인 하실 수 있습니다.
						<br/><br/>
						
						<a href="#">* 리디포인트 확인하러 바로가기 >></a>
						<br/><br/>
						
						결제시 기간 한정 포인트를 사용하시면 가장 유효기간이 짧게 남은 (소멸일이 가장 가깝게 임박한) 포인트가 먼저 사용되며
						기간 한정 포인트로 도서를 구매 하시고 소멸 예정일 이후에 결제 취소(환불) 하시는 경우에 해당 포인트는 복원되지 않습니다.
						<br/><br/>
						
						유효기간이 없는 일반 리디포인트는 리디캐시와 동일하게 60개월 후에 소멸됩니다.
						
						
						</p>						
						</div>
					</div>
			
			

		</div>

	</div>

</body>
</html>