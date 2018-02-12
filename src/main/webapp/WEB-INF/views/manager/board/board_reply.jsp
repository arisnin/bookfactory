<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/board_reply.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">


<title>1:1문의 답장</title>
</head>
<body>
	<div id="sh_board_reply">
		<div class="sh_board_reply_header">
			<div class="sh_main_text">1:1 문의</div>
			<div class="sh_board_reply_title">
				<ul>
					<li>제목</li>
					<li><input type="text"size="93px" value ="안녕하세요 "></li>
					<li>유형</li>
					<li>
						<select>
							<option>결제/환불</option>	
							<option>이용문의</option>	
							<option>오류/활용</option>	
							<option>시스템업데이트</option>	
							<option>서비스제안</option>	
							<option>기타</option>	
						</select>
					</li>
					<li>작성일</li>
					<li><input type="text"size="35px" value ="2018/05/20 "></li>
					<li>작성자</li>
					<li><input type="text"size="35px" value ="전상헌(jeonsh1220)"></li>
					<li>연락처</li>
					<li><input type="text"size="35px" value ="010-4903-8834"></li>
					<li>내용</li>
					<li><textarea cols="100" rows="30" >야이ㅏㅇㄴㅇ라ㅣㅓㄴㅇ라ㅣㄴ얼</textarea></li> 
				</ul>
			</div>
			<div class="sh_board_reply_click">
				<button type="button" class="bf-button">답글</button>
				<button type="button" class="bf-button">취소</button>
			</div>
			
		</div>
	</div>
	
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
<script type="text/javascript" src ="${root}/script/manager/total.js"></script>
</body>
</html>