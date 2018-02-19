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
<link href="${root}/css/serviceCenter/information_content.css"
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
				<span> <a
					href="${root }/serviceCenter/main.do">리디북스 고객센터</a></span>
					<span>></span>
				<span><a href="${root }/notice/main.do">공지사항</a></span>
					<span>></span>
					<a href="${root }/serviceCenter/information.do">고객센터 안내사항</a>
				
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
						<li><a href="${root }/serviceCenter/information_content1.do">[안내]설 연휴 고객센터 단축 근무 및 휴무, 페이퍼 택배 배송 일정</a></li>
						<li>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</li>
						<li>[안내] 리디북스 서비스 사용 가능 뷰어 최소 버전 변경</li>
						<li>[안내] 우리(체크)카드 결제 제한</li>
						<li>연재 작품의 '선호작품'과 '화별댓글'기능 추가</li>
						<li>문화가 있는 날 이벤트 종료</li>
						<li>개인정보처리방침 개정 안내(v2.2)</li>
						<li>리디북스 서점의 도서 평점순 정렬 기준</li>
						<li>구매자 배지 표시 기준 변경</li>
						<li>이용약관 개정 안내(v2.8)</li>
					</ul>
					
					<div class="service_information_cn_cn_left_more">
						<a href="${root }/serviceCenter/information.do">더보기</a>
					</div>
				
			</div>
			
						
			<div class="service_information_cn_cn_right">
				<div class="service_information_cn_title">
					[안내] 설 연휴 고객센터 단축 근무 및 휴무, 페이퍼 택배 배송 일정					
				</div>
		
						<div>
						<p>안녕하세요. 리디북스입니다.</p>
						
						<p>2018년 설을 맞이하여 아래와 같이 고객센터 단축 근무 및 휴무 일정, 페이퍼 택배 배송 일정을
						<br/>안내 드립니다.</p>
						
						
						<ul class="list">
							<li>고객센터 업무 종료일 : 2월 14일(금) 오후 5시</li>
							<li>고객센터 업무 재개일 : 2월 19일(월) 오전 10시</li>
							
							<li>페이퍼 구매 및 AS 택배 발송 마감일 : 2월 12일(월)</li>
							<li>페이퍼 구매 및 AS 택배 발송 재개일 : 2월 19일(월)</li>
						</ul>
						
						<p>해당기간 동안은 고객센터 전화 연결이 되지 않으므로 궁금하신 사항은 고객센터 홈페이지의 <br/>
						[자주 묻는 질문]을 참고해 주시거나, 고객센터 홈페이지를 통해 문의를 등록해주시면,
						설 연휴 이후 빠른 시일 내에 안내 드리도록 하겠습니다.</p>
						
						<p>* <a class="bf-button bf-transparent-btn bf-animated-btn"
								href="${root }/serviceCenter/main.do" >고객센터 바로가기</a></p>
						<p>자주 문의하시는  내용이나 리디북스 앱 사용방법에 대해서는 고객센터 홈페이지를  참고하여 주시기 <br/> 바랍니다.</p>
						<p>* <a class="bf-button bf-transparent-btn bf-animated-btn"
								href="${root }/serviceCenter/FAQ.do">고객센터 FAQ 바로가기</a></p>
								
						<p class="none">[참고사항]</p>
						
						<ul class="list">
							<li>설 연휴 하루 전 2월 14일은 오후 5시에 고객센터 업무가 종료되므로 이용에 참고 부탁드립니다.</li>
							<li>쇼핑몰에 따라 택배 발송 마감 시간(주문 결제 완료 시간 기준)이 다를 수 있습니다. <br/>정확한 시간은 각 쇼핑몰의 안내를 확인해주시기 바랍니다.</li>
							<li>리디북스 홈페이지를 통하여 페이퍼 및 액세서리를 주문하신 경우 2월 12일 (월) 오전 10시까지 접수된 주문 건에 한하여 당일 택배 발송이 이루어집니다. </li>
							<li>택배 발송 마감일 전에 발송되더라도 택배사 사정에 따라 배송이 지연되거나, 설 연휴 이후에  <br/> 배송될 수 있습니다.</li>
							<li>택배 배송 중단 기간 동안 누적된 판매 및 AS 제품은 배송 재개일부터 발송 시작되며, 물량에  <br/>따라 며칠 동안 순차 발송될 수 있습니다.</li>
						</ul>
						
						<p>&nbsp;</p>
						
						<p>2018년에도 저희 리디북스와 함께 행복한 도서 생활을 누리실 수 있도록 최선을 다하겠습니다.</p>
						<p>감사합니다. <br/> 리디북스 드림</p>

						</div>
					</div>

		</div>

	</div>

</body>
</html>