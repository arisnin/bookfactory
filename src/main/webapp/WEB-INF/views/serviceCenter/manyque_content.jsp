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
<link href="${root}/css/serviceCenter/manyque_content.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</title>
</head>
<body>


	<jsp:include page="${root }/serviceCenter/main_header.jsp" />


	<div class="serviceCenter_manyque_cn">

		<div class="service_FAQ_home_header">
			<div class="service_FAQ_home_header_left">
				<span><a
					href="${root }/serviceCenter/main.jsp">리디북스 고객센터</a>
				</span>
				<span>></span>
				<a href="${root }/serviceCenter/manyque.jsp">리디북스 자주 묻는 질문</a>
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

		<div class="serviceCenter_manyque_cn_cn">
		
			<div class="serviceCenter_manyque_cn_cn_left">
				
					<div class="serviceCenter_manyque_cn_cn_left_title">이 섹션의 문서</div>
					<ul>
						<li><a href="${root }/serviceCenter/manyque_content.jsp">아이디(ID), 비밀번호를 잊어버렸어요. 어떻게 확인하나요?</a></li>
						<li>다운받은 책이 파일이 손상되었다며 열리지 않아요!</li>
						<li>DRM문제로 책을 읽을 수 없습니다(104)</li>
						<li>책은 어떻게 읽나요? - PC뷰어 이용 방법</li>
						<li>구매목록을 삭제할 수 있나요?</li>						
					</ul>
										
				
			</div>
			
						
			<div class="serviceCenter_manyque_cn_cn_right">
				<div class="serviceCenter_manyque_cn_title">
						<h2>아이디(ID), 비밀번호를 잊어버렸어요. 어떻게 확인하나요?</h2>
				</div>
		
						<div>
						<p>홈페이지에서 로그인버튼을 눌러 [아이디 찾기, 비밀번호 찾기]메뉴를 이용하면 확인이 가능합니다.</p>
						
						<p>아이디, 비밀번호 찾기 시 정상적으로 진행이 되지 않는다면 회원가입을 하지 않으셨거나 등록된 정보가 다른 경우일 수 있습니다.</p>
						
						<p>가입정보가 확인되지 않으나 이전에 이용 기록이 있는 경우, 고객센터로 문의하여 주시기 바랍니다.</p>
						
						
						</div>
					</div>
			
			

		</div>

	</div>

</body>
</html>