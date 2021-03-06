<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가 정보 수정</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${root}/icon/css/fontello.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" type="text/css" href="${root}/css/book/plus.css">
<link rel="stylesheet" type="text/css" href="${root}/css/book/authorProfilUpdate.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/book/plus.js"></script>
<link rel="stylesheet" href="${root }/alert/alertify_core.css" />
<link rel="stylesheet" href="${root }/alert/alertify_default.css" id="toggleCSS" />
<script src="${root }/alert/alertifymin.js"></script>
</head>
<body>
	<!-- 받을때 작가 번호 받아옴. -->
	<div class="wrap-container bf-author-profile-update">
		<form id="atpOk" action="${root}/authorProfilUpdateOk.do" method="post">
			<div class="author">작가 정보 수정 요청</div>
			<input type="hidden" value="${author_num}" name="author_num" />
			<div class="profile_ex aut">
				<h2>추가사항 또는 변경요청사항이<br>있는곳만 입력하세요</h2>
				<ol class="content">
					<li><span>작가이름</span><span><input type="text" name="author_name"/></span></li>
					<li><span>국적</span><span><input type="text" name="author_contry"/></span></li>
					<li><span>출생</span><span><input type="text" name="author_birth"/></span></li>
					<li><span>학력</span><span><input type="text" name="author_edu"/></span></li>
					<li><span>데뷔</span><span><input type="text" name="author_debut"/></span></li>
					<li><span>경력</span><span><input type="text" name="author_career"/></span></li>
					<li><span>수상내역</span><span><input type="text" name="author_awards"/></span></li>
					<li><span>홈페이지</span><span><input type="text" name="author_link"/></span></li>
				</ol>
			</div>
			
			<button type="button" class="bf-button">전송하기</button>
		</form>
	</div>
</body>
	<script type="text/javascript">
		$(".bf-button").click(function(){
			var content = "";
			$(".content input").each(function(){
				content += $(this).val();
			});
			if(content == ""){
				alertify.error("하나라도 입력하시오");
				return false;
			}
			
			$("#atpOk").submit();
		});
	</script>
</html>


