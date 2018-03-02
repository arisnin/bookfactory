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
<script type="text/javascript" src="${root }/script/serviceCenter/serviceCenter.js"></script>	

	
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
					<c:forEach var="mainNoticeDto" items="${mainNotice }">
						<div><a href="javascript:infoRead('${root}','${mainNoticeDto.num}')">${mainNoticeDto.title}</a></div>					
					</c:forEach>					
				</div>
			</div>
			<br/><br/><br/>
			
			
			<div class="service_faq">
				<div class="bf-title-row title-type1">
				<h2><a href="${root }/serviceCenter/manyque.do">북팩토리 자주 묻는 질문</a></h2>
				</div>
				<br/>
				
				<div class="service_faq_list">
					<c:forEach var="mainManyDto" items="${mainMany }">
						<div><a href="javascript:questionRead('${root}','${mainManyDto.num}')">${mainManyDto.title}</a></div>					
					</c:forEach>					
				</div>
			</div>
			<br/>
			
			<div class="service_faq_cag">
				<a class="bf-button" href="${root }/serviceCenter/id_login.do">아이디 / 로그인</a>
				<a class="bf-button" href="${root }/serviceCenter/pay_refund.do">결제 / 환불</a>
				<a class="bf-button" href="${root }/serviceCenter/how_use.do">이용문의</a>
				<a class="bf-button" href="${root }/serviceCenter/error_use.do">오류 / 활용 도움말</a>
				<a class="bf-button" href="${root }/serviceCenter/system_update.do">시스템 업데이트 안내</a>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>


</html>