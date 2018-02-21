<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<form name="registerForm" class="modal-content" action="${root}/member/register.do" method="post">
			<div class="hw_regi_header">
				<div class="hw_regihead_text" align="center">회원가입</div>
				<span onclick="document.getElementById('hw_register').style.display='none'" class="hw_regi_close" title="Close Modal">×</span>
		    </div>
	
			<div class="hw_regi_container">
				<input class="sign_input" type="text" placeholder="아이디" name="id" required onblur="doIdCheck('${root}')">
				<input class="sign_input" type="password" placeholder="비밀번호" name="password" required onkeyup="doPasswordCheck(this)">
				<input class="sign_input" type="password" placeholder="비밀번호 확인" name="psw-repeat" required style="border-bottom: 1px solid #ccc;" onkeyup="doPasswordReCheck(this)">
				<div class="error-msg-wrap">
					<span class="invalid-error-msg">약관에 동의하라2</span>
				</div>
				
				<input class="sign_input hw_sign_email" type="email" placeholder="이메일" name="email" required onblur="doEmailPhoneCheck('email','${root}')">
				<input class="sign_input hw_sign_phone" type="tel" placeholder="휴대폰번호" name="phone" required onblur="doEmailPhoneCheck('phone','${root}')">
				<div class="error-msg-wrap">
					<span class="invalid-error-msg">약관에 동의하라2</span>
				</div> 
				
				<input class="sign_input hw_sign_name" type="text" placeholder="이름" name="name" required>
				<div class="other_data">
					<div class="hw_birth_wrap">
						<input class="sign_input" type="text" placeholder="출생년도" name="birthday" required>
					</div>
					<div class="hw_gender_wrap">
						<input id="hw_gender" type="hidden" name="gender" value="male" title="성별 남 선택" required>
						<label class="hw_gender_label" for="gender_men">남</label>
					</div>
					<div class="hw_gender_wrap">
						<label class="hw_gender_label" for="gender_girl">여</label>
					</div>
					<div class="error-msg-wrap">
						<span class="invalid-error-msg">약관에 동의하라2</span>
					</div>
				</div>
			
			<div class="hw_list_wrapper">
	          	<div class="hw_agreement_wrapper">
	            	<ul id="signup_confirm">
						<li class="hw_checkbox_wrap" onclick="allCheck(this)">
							<input id="check_all_confirm" name="check_all_confirm" class="hw_confirm_checkbox" type="checkbox" title="전체 약관 동의"/>
							<span class="hw_check_text">전체약관 동의</span>
						</li>
						<li class="hw_checkbox_wrap" onclick="clickCheck(this)">
							<input id="use_confirm" name="confirm-check" class="hw_confirm_checkbox" type="checkbox" title="이용약관 동의" required/>
							<span class="hw_check_text">이용약관 동의</span>
						</li>
						<li class="hw_checkbox_wrap" onclick="clickCheck(this)">
							<input id="privacy_confirm" name="confirm-check" class="hw_confirm_checkbox" type="checkbox" title="개인정보취급방침 및 위탁 동의" required/>
							<span class="hw_check_text">개인정보취급 및 위탁 동의</span>
						</li>
						<li class="hw_checkbox_wrap" onclick="clickCheck(this)">
							<input id="marketing_agreement_push" name="confirm-check" class="hw_confirm_checkbox" type="checkbox" title="선택항목 - 이벤트 혜택 알림 수신 동의">
							<span class="hw_check_text">이벤트 혜택 알람 수신동의(선택)</span>
						</li>
					</ul>
	      		</div>
	      		<div class="error-msg-wrap">
					<span class="invalid-error-msg">약관에 동의하라1</span>
				</div>
	        </div>
	
	      	<div class="clearfix">
	        	<button type="button" class="hw_signupbtn" onclick="doRegister('${root}')">가입 완료</button>
	        	<!-- <button type="submit" class="hw_signupbtn">가입 완료</button> -->
			</div>
	        
			</div>
			<input type="hidden" name="requestURL" value="form" />
		</form>
	</div>
	<script type="text/javascript">
		function doRegister(url) {
			var confirmCheck = document.querySelectorAll("input[name=confirm-check]");
			if (!confirmCheck[0] || !confirmCheck[1] || !confirmCheck[2]) {
				alert('약관에 동의해라');
				return false;
			}
			var parameter = {
					id : registerForm.id.value,
					password : registerForm.password.value,
					email : registerForm.email.value,
					gender : registerForm.gender.value,
					birthdayStr : registerForm.birthday.value,
					phone : registerForm.phone.value,
					name : registerForm.name.value,
					requestURL : "ajax"
			};
			$.post(url + "/member/register.do", parameter, function(data,status) {
				if (data.type == 'ok') {
					location.reload();
				} else {
					alert("에러(" + data.type + ") : " + data.error);
				}
			});
			return false;
		}
		
		function doIdCheck(url) {
			var parameter = {
				id : registerForm.id.value
			};
			$.post(url + "/member/register/idCheck.do", parameter, function(data,status) {
				if (data.type == 'error') {
					registerForm.id.focus();
					firstMessageBox.innerHTML = "* " + data.error;
				} else {
					firstMessageBox.innerHTML = "";
				}
			});
		}
		
		function doEmailPhoneCheck(type, url) {
			var parameter = {
				type : type, 
				email : registerForm.email.value,
				phone : registerForm.phone.value
			};
			$.post(url + "/member/register/emailPhoneCheck.do", parameter, function(data,status) {
				if (data.type == 'error') {
					registerForm.id.focus();
					secondMessageBox.innerHTML = "* " + data.error;
				} else {
					secondMessageBox.innerHTML = "";
				}
			});
		}
		
		var firstMessageBox = document.querySelectorAll(".invalid-error-msg")[0];
		var secondMessageBox = document.querySelectorAll(".invalid-error-msg")[1];
		var thirdMessageBox = document.querySelectorAll(".invalid-error-msg")[2];
		
		function doPasswordCheck(event) {
			var msg = [];
			// Validate lowercase letters
			var lowerCaseLetters = /[a-z]/g;
			if (!event.value.match(lowerCaseLetters)) {
				// invalid
				msg.push(" 소문자");
			}		
			
			// Validate capital letters
			var upperCaseLetters = /[A-Z]/g;
			if (!event.value.match(upperCaseLetters)) {
				// invalid
				msg.push(" 대문자");
			}

			// Validate numbers
			var numbers = /[0-9]/g;
			if (!event.value.match(numbers)) {
				// invalid
				msg.push(" 숫자");
			}

			// Validate length
			if(event.value.length < 12) {
				// invalid
				msg.push(" 12자 이상");
			}
			
			if (msg.length > 0) {
				firstMessageBox.innerHTML = "*" + msg + "포함";
				event.focus();
				return false;
			}
			
			firstMessageBox.innerHTML = "";
			return true;
		}
		
		var passwordBox = document.querySelectorAll(".hw_regi_container > input[type=password]");
		
		function doPasswordReCheck(event) {
			if (!doPasswordCheck(passwordBox[0])) {
				return;
			}
			if (passwordBox[0].value != passwordBox[1].value) {
				firstMessageBox.innerHTML = "비밀번호가 일치하지 않습니다.";
			} else {
				firstMessageBox.innerHTML = "비밀번호가 일치하지 않습니다.";
			}
		}
	</script>
</div>
</body>
</html>