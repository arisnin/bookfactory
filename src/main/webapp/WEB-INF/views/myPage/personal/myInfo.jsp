<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet" />
<link href="${root}/css/myPage/personal/myInfo.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<title>마이페이지, 내정보변경</title>
</head>
<body>
	<div class="myInfo_box">
		<form action="${root }/member/update.do" name="myInfo" method="get" onsubmit="" >
		<!-- 타이틀 -->
		<div class="bf-title-row title-type4">
			<h3>내 정보 변경</h3>
		</div>
		<div class="first">
			<div class="left">이름</div>
			<div class="right">
				<div class="right_first user-name">김동환</div>
				<div class="right_second">
					<a class="bf-button" href="#">회원탈퇴</a>
				</div>
			</div>
		</div>

		<div class="second">
			<div class="left">아이디</div>
			<div class="right">
				<div class="right_first user-id">유저 아이디</div>
			</div>
		</div>

		<div class="third">
			<div class="left">이메일</div>
			<div class="right_right">
				<div class="right_right_first user-email" >dongsu@naver.com</div>
				<div class="right_right_second"><span class="email_authentication">인증된 이메일 주소입니다.</span></div>
				<div class="right_right_third">
					<a class="bf-button" href="#">이메일변경</a>
				</div>
				
				<script type="text/javascript">
					function change(url){
						
					}
				</script>
			</div>
		</div>

		<div class="fourth">
			<div class="left">비밀번호 변경</div>
			<div class="right_right">
				<div class="right_right_first">
					<input name="password" type="password" placeholder="새 비밀번호" maxlength="12" />
				</div>
				<div class="right_right_first">
					<input name="passwordCheck" type="password" placeholder="새 비밀번호 확인" maxlength="12"/>
				</div>
				<div class="right_right_second">
					비밀번호 변경 시 유의사항
					<ul class="right_right_second_list">
						<li>8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력해주세요.</li>
						<li>연속된 3자 이상의 같은 문자는 제한합니다.</li>
						<li>ID와 같은 비밀번호는 사용할 수 없습니다.</li>
					</ul>
				</div>

			</div>
		</div>

		<div class="fifth">
			<div class="left">마케팅 정보 수신 관리</div>
			<div class="right">
				<label class="bf-custom-checkbox">
					<input type="checkbox" title="" />
					<span class="all-mark"></span>
					<span class="checkbox-label">이메일 구독</span>
				</label>
				<div class="fifth_text">
					<input name="email" type="text" placeholder="이메일" />
				</div>

				<div>(동의일 : 2018.01.01)</div>
			</div>
		</div>

		<div class="change_com" >
			<button class="bf-button" type="submit">변경 완료</button>
		</div>
		
		<input name="id" type="hidden" value="${userInfo.username}">
		
	</form>
	</div>

</body>
</html>