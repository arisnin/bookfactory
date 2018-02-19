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
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="${root}/css/serviceCenter/inquriy_answer.css"
	type="text/css" rel="stylesheet">


<title>Insert title here</title>
</head>
<body>

	<jsp:include page="./main_header.jsp" />


	<div class="service_FAQ_home_header">
		<div class="service_FAQ_home_header_left">
			<span> <a href="${root }/serviceCenter/main.do">리디북스
					고객센터</a>
			</span> <span>></span><span>내 활동</span>
		</div>
	</div>

	<div class="serviceCenter_inquriy_answer">
		<div class="serviceCenter_inquriy_answer_title">
			<div class="bf-title-row title-type1">
				<h2>화면 내용 중에 누락된 요소가 있어요</h2>
			</div>
		</div>
		
		<div class="serviceCenter_inquriy_answer_left">
			<div class="serviceCenter_inquriy_answer_writer">
				<div>작성자 ID</div>
				<div class="date">날짜</div>

				<div>
					<p>내용입니다. 가나다라 마바사 아자차타카파하  <a href="http://www.naver.com">아 바가지 </a>내용내용내용내용 가나다라 마바사 아자차타카파하 가나다라 마바사 아자차타캎하하 으헤으헤으허허</p>
				</div>
			</div>

			<div class="serviceCenter_inquriy_answer_answer">
				<div>관리자 ID</div>
				<div class="date">날짜</div>

				<div>
					<p>내용 입니당. 내용내용내용내용내용냉뇨애내용</p>
				</div>
			</div>

			<div>
				<p>안내가 완료되어 댓글을 추가하실수 없습니다. 추가로 문의(제안)하실 내용이 있는 경우 <br/> <a href="${root }/serviceCenter/FAQ.do">[문의등록]</a>을 이용해주세요.</p>
			</div>



		</div>

		<div class="serviceCenter_inquriy_answer_right">
			
				<div class="line">
					<div>요청자</div>
					<div>호열이</div>
				</div>

				<div class="line">
					<div>등록일</div>
					<div>2018년 01월 01일 23:40</div>
				</div>

				<div class="line">
					<div>상태</div>
					<div class="answer">답변완료</div>
				</div>

				<div class="line">
					<div>질문유형</div>
					<div>오류 신고</div>
				</div>

				<div class="line">
					<div>연락수단</div>
					<div>이메일</div>
				</div>

				<div class="line">
					<div>연락처</div>
					<div>-</div>
				</div>

				<div class="line">
					<div>희망 연락시간</div>
					<div>-</div>
				</div>
		</div>




	</div>



</body>
</html>