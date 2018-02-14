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
<link href="${root}/css/serviceCenter/information.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<title>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</title>
</head>
<body>


	<jsp:include page="${root }/serviceCenter/main_header.jsp" />


	<div class="service_information">

		<div class="service_FAQ_home_header">
			<div class="service_FAQ_home_header_left">
				<span> <a
					href="${root }/serviceCenter/main.jsp">리디북스 고객센터</a></span>
					<span>></span>
				<span><a href="${root }/notice/main.jsp">공지사항</a></span>
					<span>></span>
					고객센터 안내사항
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

		<div class="service_information_content">
			<div class="service_information_content_right">
				<div class="service_information_title">
					고객센터 안내사항
				</div>

				<div class="service_information_list">
					<div><a href="${root }/serviceCenter/information_content1.jsp">[안내] 설 연휴 고객센터 단축 근무 및 휴무, 페이퍼 택배 배송 일정</a></div>
					<div>[고객센터 운영 시간] 평일 10:00~19:00(점심시간 12:50~14:00)</div>
					<div>[안내] 우리(체크)카드 결제 제한</div>
					<div>[안내] 리디북스 서비스 사용 가능 뷰어 최소 버전 변경</div>
					<div>연재 작품의 '선호작품'과 화별댓글' 기능 추가</div>
					<div>문화가 있는날 이벤트 종료</div>
					<div>개인정보처리방침 개정 안내(v2.2)</div>
					<div>리디북스 서점의 도서 평점순 정렬 기준</div>
					<div>구매자 배지 표시 기준 변경</div>
					<div>이용약관 개정 안내(v2.8)</div>
					<div>판타지 주간 뉴스레터 발송일 안내</div>
				</div>
			</div>

		</div>





	</div>

</body>
</html>