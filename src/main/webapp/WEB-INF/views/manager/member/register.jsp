<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css"
	href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/member_register.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

<title>회원관리</title>
</head>
<body>
	<div id="sh_register">
		<div class="sh_main_text">회원정보상세</div>
		<div id="sh_board_shadow">
		<form name="sh_register_form" action="${root}/manager/memberRegisterOk.do" method="post">
		
			<div class="sh_register_1">
				<ul>
					<li>회원정보</li>
					<li><img alt="회원 이미지" src="${root}/${img}"></li>
					<li><font>아이디</font></li>
					<li>${memberDto.id }</li>
					<li><font>이름(수정가능)</font></li>
					<li><input type ="text" value ="${memberDto.name}" name ="name"></li>
					<li><font>비밀번호(수정가능)</font></li>
					<li><input type ="text" value ="${memberDto.password}" name ="password"></li>
					<li><font>메일주소(수정가능)</font></li>
					<li><input type ="text" value ="${memberDto.email}" name ="email"></li>
					<li><font>생년월일</font></li>
					<li><fmt:formatDate value="${memberDto.birthday}" pattern="yyyy년 MM월 dd일"/></li>
					
				</ul>
				<input type="hidden" value="${memberDto.id }" name ="id">
				<input type="hidden" value="${pageNumber}" name ="pageNumber">
			</div>
			<div class="sh_register_2">
				<ul>
					<li style="font-size: 1.5rem;">활동</li>
					<li><font>가입일</font></li>
					<li><fmt:formatDate value="${memberDto.register_date}" pattern="yyyy년 MM월 dd일"/></li>
					<li><font>최근방문일</font></li>
					<li><fmt:formatDate value="${memberDto.last_join}" pattern="yyyy년 MM월 dd일"/></li>
					<li><font>댓글 : </font>1</li>
					<li><font>방문수 :</font>15</li>
					<li><font>등급 : </font>
						<c:if test="${memberDto.role=='role_admin'}">
							<span>관리자</span>
						</c:if>
						<c:if test="${memberDto.role=='role_user'}">
							<span>유저</span>
						</c:if>
						<select id="select-sh" style="padding: 0.2rem" name ="role">
							<option>role_admin</option>
							<option>role_user</option>
						</select>

					</li>
				</ul>
				
			</div>
			
			<div class="sh_register_3">
				<button type="button" class="bf-button sh_button_out">강제탈퇴</button>
				<button type="submit" class="bf-button">수정</button>
				<button type="button" class="bf-button"
					onclick="javascript:location ='${root}/manager/memberPayDetail.do?id=${memberDto.id}'">결제페이지</button>
				<button type="button" class="bf-button"
					onclick="javascript:location ='${root}/manager/memberMember.do'">목록</button>
			</div>
			</form>
		</div>


	</div>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
	

	<script type="text/javascript">
		$(function() {
			 $('.sh_button_out').click(function(event){
				 var txt;
				 var r = confirm("정말로 이 회원을 탈퇴 시키겠습니까?");	
				 if(r == true) {
				     javascript:location ="${root}/manager/memberDelete.do?id=${memberDto.id}";
				 }else {
					 alert("탈퇴가 시키지 않았습니다.");
					 javascript:location ="${root}/manager/memberRegister.do?id=${memberDto.id}";
				 }
			 });


			$("#select-sh").change(function() {
				var value = $(this).val();
			 	/* alert(value); */
			 	if(value=='role_admin'){
			 		$(".sh_register_2 li:last").find("span").text("관리자"); 
			 	}else{
			 		$(".sh_register_2 li:last").find("span").text("유저"); 
			 	}
				
			});
		});
	</script>
</body>
</html>