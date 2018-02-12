<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" type="text/css" href="${root}/css/event/event.css">
<title>Insert title here</title>
</head>
<body>
	<div class="event">
		<div class="header_margin">
			<span class="header_span">OO 이벤트</span>
		</div>

		<div class="bf-service-type-menu event_header">
			<ul class="service-type-list">
				<li><a class="active">진행중인 이벤트</a></li>
				<li><a>지난 이벤트</a></li>
			</ul>
		</div>
		<c:forEach begin="1" end="5">
			<div class="event_main" onclick="javascript:alert('미구현')">
				<div class="event_main_img">
					<a><img width="320px" height="145px;"></a>
				</div>
				<div class="event_main_header">
					<h3>
						<a> [NEW] 책을 통해 능력을 얻은 남자</a>
					</h3>
				</div>
				<div class="event_main_text_ul-li">
					<ul>
						<li><span style="font-weight: bold;">기간</span> <span>2018.01.22
								~ 2018.02.28</span></li>
						<li><span style="font-weight: bold;">내용</span> <span
							class="event_main_text"><br>혜택1.포함 신작 2종 공개! <br>혜택2.
								신작 및 인기작 6종, 기간 한정 대여! <br>혜택3. 신작/인기작, 전권 대여 최대 50% 할인! <br>혜택4.
								신작/인기작, 전권 구매 10% 할인! </span></li>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>