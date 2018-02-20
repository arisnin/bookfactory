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
<link href="${root}/css/notice/content.css" type="text/css"
	rel="stylesheet">

<title>공지사항 내용</title>
</head>
<body>

	<div id="notice_content">

		<div class="bf-title-row title-type1">
			<h2>공지사항</h2>
		</div>
		<br />

		<div class="notice_">${NoticeDto.title }</div>
		<br />

		<div class="notice_box">
			<div class="notice_writeday">${NoticeDto.write_date }</div>
			<br />

			<div class="notice_content_read">${NoticeDto.content }
					안녕하세요 리디북스 입니다. <br/>
					리디북스 개인정보처리방침이 아래와 같이 일부 개정되어 사전 안내드립니다.<br/><br/>
					
					<strong>
					• 변경 적용일: 2017년 12월 1일
					
					<br/><br/>
					• 변경 내용
					</strong>
					
					<br/>
					
					1. 결제 대행 국내업체 추가: 개인정보의 처리 위탁<br/>
					 &nbsp;&nbsp;(주)카카오페이	: 결제, 구매안전서비스 제공 등 <br/><br/>
					2. 용어의 통일: 개인정보 '처리'<br/>
					&nbsp;&nbsp;(수정전)<br/>
					  &nbsp;&nbsp;리디북스는 상품 및 이벤트 경품 배송을 위해 성명, 주소, 연락처의 정보를 필요한 업무 내에서 아래 수탁자에게 제공하고 있으며, 제휴사가 안전하게 개인정보를
					취급할 수 있도록 규정하고 관리하고 있습니다.<br/><br/>
					&nbsp;&nbsp;(수정후)<br/>
					 &nbsp;&nbsp;리디북스는 상품 및 이벤트 경품 배송을 위해 성명, 주소, 연락처의 정보를 필요한 업무 내에서 아래 수탁자에게 제공하고 있으며, 제휴사가 안전하게 개인정보를 처리할 수 있도록
					규정하고 관리하고 있습니다.<br/><br/>
					
					리디북스 이용에 참고하여 주시기 바랍니다.<br/><br/>
					
					감사합니다.<br/><br/>
					
					*<a href="#">이동링크</a><br/>
					*<a href="#">이동링크</a>
			</div>
		</div>

		<div class="list">
			<a class="bf-button" href="${root }/notice/main.do">목록으로</a>
		</div>

	</div>

</body>
</html>