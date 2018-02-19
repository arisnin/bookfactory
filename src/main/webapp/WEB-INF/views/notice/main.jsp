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
<link href="${root}/css/notice/main.css" type="text/css"
	rel="stylesheet">

<title>공지사항</title>
</head>
<body>
	<div id="notice">
		<div class="bf-title-row title-type1">
		<h2>공지사항</h2>
		</div>
		<br />

		<div class="notice_list">			
			<ul class="notice_list_title">
				<li>등록일</li>
				<li>제목</li>
			</ul>
			
			
			<!-- li는 한 블럭 라인? / div로 싹다 고치기 -->
						
			<ul class="notice_list_list">
				<a href="${root }/notice/content.do">
				<li>2018.01.01</li>
				<li>[안내] 마케팅 수신 동의 설정 오류로 인한 쿠폰 발급 안내</li>
				</a>
			</ul>
			<ul class="notice_list_list">
				<a href="${root }/notice/content.do">
				<li>2018.01.01</li>
				<li>[업데이트] 안드로이드 앱 v8.8.5</li>
				</a>
			</ul>
			<ul class="notice_list_list">
				<li>2018.01.01</li>
				<li>[안내] 1월 1일(월) 시스템 점검 안내</li>
			</ul>
			<ul class="notice_list_list">
				<li>2018.01.01</li>
				<li>[안내] 1월 1일(월) 고객센터 단축근무</li>
			</ul>
			<ul class="notice_list_list">
				<li>2018.01.01</li>
				<li>[안내] 1월 1일(월) 시스템 점검 안내</li>
			</ul>
			<ul class="notice_list_list">
				<li>2018.01.01</li>
				<li>[업데이트] iOS 앱 v8.8.4</li>
			</ul>
			<ul class="notice_list_list">
				<li>2018.01.01</li>
				<li>[안내] 리디북스 서비스 사용 가능 뷰어 최소 버전 변경</li>
			</ul>
			<ul class="notice_list_list">
				<li>2018.01.01</li>
				<li>[안내] 개인정보처리방침 개정 안내(v2.6)</li>
			</ul>
			<ul class="notice_list_list">
				<li>2018.01.01</li>
				<li>[공지] 리디스토리-리디북스 연재 서비스 통합 안내</li>
			</ul>
			<ul class="notice_list_list">
				<li>2018.01.01</li>
				<li>[안내] 개인정보처리방침 개정 안내(v2.5)</li>
			</ul>
		</div>
		<nav class="bf-pagination">
		<ul class="bf-animated-btn">
			<li class="first"><a href="#0"><span></span></a></li>
			<li class="prev"><a href="#0"><span></span></a></li>
			<li><a href="#0">1</a></li>
			<li><a href="#0">2</a></li>
			<li><a class="active" href="#0">3</a></li>
			<li><a href="#0">4</a></li>
			<li><a href="#0">5</a></li>
			<li class="next"><a href="#0"><span></span></a></li>
			<li class="last"><a href="#0"><span></span></a></li>
		</ul>
		</nav>
	</div>
	
</body>
</html>