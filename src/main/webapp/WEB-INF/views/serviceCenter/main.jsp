<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css"
	rel="stylesheet" />
<link href="${root}/css/serviceCenter/main.css" type="text/css"
	rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">	

	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>
</head>
<body>
	<div class="service_home">
		<div class="service_header">
					
	<jsp:include page="./main_header.jsp" />
	 					
					
			<div class="service_header_second">				
				<span class="service_header_second_title">궁금한 점이 있다면 </span><br/>
				<span>무엇이든 물어보세요.</span>
				<br/><br/>
				<div class="bf-service-type-menu">				
					<div class="search-box">
						<form method="get">
							<span class="material-icons">search</span> <input
								class="search-word" type="text" name="search-word"
								placeholder="검색" />
						</form>
					</div>
				</div>
				<br/>							
			</div>
		</div>
		<br/><br/>	
		
		<div class="service_content">
			<div class="service_notice">
				<div class="bf-title-row title-type1">
				<h2><a href="${root }/serviceCenter/information.do">고객센터 안내사항</a></h2>
				</div>
				<br/>
				
				<div class="service_notice_list">
					<div class="service_notice_list_1"><a href="${root }/serviceCenter/information_content1.do">
					[안내]설 연휴 고객센터 단축 근무 및 휴무, 페이퍼 택배 배송 일정</a></div>
					<div class="service_notice_list_2"><a href="#">[고객센터 운영 시간] 평일 10:00 ~ 19:00 (점심시간 12:50 ~ 14:00)</a></div>
					<div class="service_notice_list_3"><a href="#">[안내] 리디북스 서비스 사용 가능 뷰어 최소 버전 변경</a></div>					
				</div>
			</div>
			<br/><br/><br/>
			
			
			<div class="service_faq">
				<div class="bf-title-row title-type1">
				<h2><a href="${root }/serviceCenter/manyque.do">리디북스 자주 묻는 질문</a></h2>
				</div>
				<br/>
				
				<div class="service_faq_list">
					<div class="service_faq_list_1"><a href="${root }/serviceCenter/manyque_content.do">아이디(ID), 비밀번호를 잊어버렸어요. 어떻게 확인하나요?</a></div>
					<div class="service_faq_list_2"><a href="#">다운받은 책이 파일이 손상되었다며 열리지 않아요!(파일손상, 인코딩 오류)</a></div>
					<div class="service_faq_list_3"><a href="#">DRM문제로 책을 읽을 수 없습니다(104)</a></div>
				</div>
			</div>
			<br/>
			
			<div class="service_faq_cag">
				<a class="bf-button" href="${root }/serviceCenter/id_login.do">아이디 / 로그인</a>
				<a class="bf-button" href="${root }/serviceCenter/pay_refund.do">결제 / 환불</a>
				<a class="bf-button" href="${root }/serviceCenter/how_use.do">이용문의</a>
				<a class="bf-button" href="${root }/serviceCenter/error_use.do">오류 / 활용 도움말</a>
				<a class="bf-button" href="#">시스템 업데이트 안내</a>
			</div>	
		</div>
	</div>

</body>
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>


</html>