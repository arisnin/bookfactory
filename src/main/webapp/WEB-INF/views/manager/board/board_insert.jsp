<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/board_insert.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">

<title>게시판관리(자주하는 질문 등록)</title>
</head>
<body>
<div id="sh_board_insert">
			<div class="sh_board_insert_header">
			<div class ="sh_main_text">게시판관리(자주하는 질문 등록)</div>
			<div class ="sh_board_insert_main">
			
			<div class ="sh_board_insert_search">
				<ul>
					<li>제목 : <input type="text" size="90px;" placeholder =""></li>
					<li>
						<select>
							<option>아이디/로그인</option>
							<option>결제/환불</option>
							<option>이용문의</option>
							<option>오류/활용</option>
							<option>시스템업데이트</option>
							<option>기타</option>
						</select>
					</li>
				</ul>
			</div>
		
			</div>

		</div>
		<div class="sh_board_insert_content">
			<textarea rows="30" cols="125" style="border: 1px solid #776BCE;" ></textarea>
				<input type="reset" value="취소" class="bf-button"/>
			<button type="button" class="bf-button">수정</button>

	</div>
	</div>
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
<script type="text/javascript" src ="${root}/script/manager/total.js"></script>
	
</body>
</html>