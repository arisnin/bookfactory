<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리 책 판다!</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/header/register.css"/>
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/header/register.js"></script>
</head>
<body>
<!-- 헤더에서 회원가입 누를시 나오는 화면 - 염현우 -->
<div id="hw_register" class="hw_regi_modal" onclick="closeRegi()">
	<div class="hw_register_wrap hw_animate">
		<form class="modal-content">
			<div class="hw_regi_header">
				<div class="hw_regihead_text" align="center">회원가입</div>
				<span onclick="document.getElementById('hw_register').style.display='none'" class=	"hw_regi_close" title="Close Modal">×</span>
		    </div>
	
			<div class="hw_regi_container">
				<input class="sign_input" type="text" placeholder="아이디" name="id" required>
				<input class="sign_input" type="password" placeholder="비밀번호" name="psw" required>
				<input class="sign_input" type="password" placeholder="비밀번호 확인" name="psw-repeat" required style="border-bottom: 1px solid #ccc;">
				
				<input class="sign_input hw_sign_email" type="email" placeholder="이메일" name="email" required>
				<input class="sign_input hw_sign_phone" type="tel" placeholder="휴대폰번호" name="phone" required> 
				
				<input class="sign_input" type="text" placeholder="이름" name="name" required>
				<div class="other_data">
					<div class="hw_birth_wrap">
						<input class="sign_input" type="text" placeholder="출생년도" name="birth" required>
					</div>
					<div class="hw_gender_wrap">
						<input id="hw_gender" type="hidden" name="genderSelect" value="m" title="성별 남 선택" required>
						<label class="hw_gender_label" for="gender_men">남</label>
					</div>
					<div class="hw_gender_wrap">
						<label class="hw_gender_label" for="gender_girl">여</label>
					</div>
				</div>
			
			<div class="hw_list_wrapper">
	          	<div class="hw_agreement_wrapper">
	            	<ul id="signup_confirm">
						<li class="hw_checkbox_wrap" onclick="clickCheck(this)">
							<input id="check_all_confirm" name="check_all_confirm" class="hw_confirm_checkbox" type="checkbox" title="전체 약관 동의"/>
							<span class="hw_check_text">전체약관 동의</span>
						</li>
						<li class="hw_checkbox_wrap" onclick="clickCheck(this)">
							<input id="use_confirm" name="use_confirm" class="hw_confirm_checkbox" type="checkbox" title="이용약관 동의" required/>
							<span class="hw_check_text">이용약관 동의</span>
						</li>
						<li class="hw_checkbox_wrap" onclick="clickCheck(this)">
							<input id="privacy_confirm" name="privacy_confirm" class="hw_confirm_checkbox" type="checkbox" title="개인정보취급방침 및 위탁 동의" required/>
							<span class="hw_check_text">개인정보취급 및 위탁 동의</span>
						</li>
						<li class="hw_checkbox_wrap" onclick="clickCheck(this)">
							<input id="marketing_agreement_push" name="marketing_agreement_push_confirm" class="hw_confirm_checkbox" type="checkbox" title="선택항목 - 이벤트 혜택 알림 수신 동의">
							<span class="hw_check_text">이벤트 혜택 알람 수신동의(선택)</span>
						</li>
					</ul>
	      		</div>
	        </div>
	
	      	<div class="clearfix">
	        	<button type="submit" class="hw_signupbtn">가입 완료</button>
			</div>
	        
			</div>
		</form>
	</div>
</div>
</body>
</html>