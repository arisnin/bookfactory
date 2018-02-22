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
				<span onclick="document.getElementById('hw_register').style.display='none'" class="hw_regi_close" title="Close Modal">&times;</span>
		    </div>
	
			<div class="hw_regi_container">
				<input class="sign_input" type="text" placeholder="아이디" name="id" required onchange="doValidationCheck(this,'${root}');" />
				<input class="sign_input" type="password" placeholder="비밀번호" name="password" maxlength="20" required onkeyup="doPasswordCheck(this);" />
				<input class="sign_input" type="password" placeholder="비밀번호 확인" name="psw-repeat" maxlength="20" required style="border-bottom: 1px solid #ccc;" onkeyup="doPasswordReCheck(this)" />
				<div class="error-msg-wrap">
					<span class="invalid-error-msg"></span>
				</div>
				
				<input class="sign_input hw_sign_email" type="email" placeholder="이메일" name="email" required onchange="doValidationCheck(this,'${root}');" />
				<input class="sign_input hw_sign_phone" type="tel" placeholder="휴대폰번호" name="phone" required onchange="doValidationCheck(this,'${root}');" />
				<div class="error-msg-wrap">
					<span class="invalid-error-msg"></span>
				</div> 
				
				<input class="sign_input hw_sign_name" type="text" placeholder="이름" name="name" maxlength="10" required onkeyup="doNameCheck(this)" />
				<div class="other_data">
					<div class="hw_birth_wrap">
						<input class="sign_input" type="text" placeholder="출생년도" name="birthday" required onkeyup="doBirthdayCheck(this)" />
					</div>
					<div class="hw_gender_wrap">
						<input id="hw_gender" type="hidden" name="gender" value="male" title="성별 남 선택" required />
						<label class="hw_gender_label" for="gender_men">남</label>
					</div>
					<div class="hw_gender_wrap">
						<label class="hw_gender_label" for="gender_girl">여</label>
					</div>
					<div class="error-msg-wrap">
						<span class="invalid-error-msg"></span>
					</div>
				</div>
			
			<div class="hw_list_wrapper">
	          	<div class="hw_agreement_wrapper">
	            	<ul id="signup_confirm">
						<li class="hw_checkbox_wrap" onclick="allCheck(this)">
							<input id="check_all_confirm" name="check_all_confirm" class="hw_confirm_checkbox" type="checkbox" title="전체 약관 동의" />
							<span class="hw_check_text" onclick="doConfirmCheck(this);">전체약관 동의</span>
						</li>
						<li class="hw_checkbox_wrap" onclick="clickCheck(this)">
							<input id="use_confirm" name="confirm-check" class="hw_confirm_checkbox" type="checkbox" title="이용약관 동의" required onchange="doConfirmCheck(this);"/>
							<span class="hw_check_text" onclick="doConfirmCheck(this);">이용약관 동의</span>
						</li>
						<li class="hw_checkbox_wrap" onclick="clickCheck(this)">
							<input id="privacy_confirm" name="confirm-check" class="hw_confirm_checkbox" type="checkbox" title="개인정보취급방침 및 위탁 동의" required/>
							<span class="hw_check_text" onclick="doConfirmCheck(this);">개인정보취급 및 위탁 동의</span>
						</li>
						<li class="hw_checkbox_wrap" onclick="clickCheck(this)">
							<input id="marketing_agreement_push" name="confirm-check" class="hw_confirm_checkbox" type="checkbox" title="선택항목 - 이벤트 혜택 알림 수신 동의">
							<span class="hw_check_text" onclick="doConfirmCheck(this);">이벤트 혜택 알람 수신동의(선택)</span>
						</li>
					</ul>
	      		</div>
	      		<div class="error-msg-wrap">
					<span class="invalid-error-msg"></span>
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
		function doNameCheck(event) {
			var msg = [];
			var nameFilter = /[^가-힣|^A-z]/;
			
			// Validate character
			if (event.value.match(nameFilter)) { msg.push(" 한글 및 영문자만"); }
			
			// Validate length
			if ((event.value.length < 2) || (event.value.length > 10)) { msg.push(" 2자 이상 10자 이하"); }
			
			if (msg.length > 0) {
				thirdMessageBox.innerHTML = "*" + msg;
				invalidProcess(event);
				return false;
			}
			
			thirdMessageBox.innerHTML = "";
			validProcess(event);
			return true;
		}
		
		var confirmCheck = document.querySelectorAll("input[name=confirm-check]");
		function doConfirmCheck(event) {		
			if (!confirmCheck[0].checked || !confirmCheck[1].checked || !confirmCheck[2].checked) {
				fourthMessageBox.innerHTML = "* 약관에 모두 동의하셔야 합니다.";
				invalidProcess(document.querySelector("#hw_register div.hw_agreement_wrapper"));
				return false;
			} else {
				fourthMessageBox.innerHTML = "";
				validProcess(document.querySelector("#hw_register div.hw_agreement_wrapper"));
			}
		}
		
		function doRegister(url) {
			
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
		
		function doValidationCheck(event, url) {
			var parameter = {
				type : event.name, 
				keyword : event.value
			};
			
			if (doEmptyCheck(event)) {
				secondMessageBox.innerHTML = "";
			} else {
				$.post(url + "/member/register/validation.do", parameter, function(data,status) {
					var msgBox = secondMessageBox;
					if (event.name == 'id') {
						msgBox = firstMessageBox;
					}
					if (data.type == 'error') {
						msgBox.innerHTML = "* " + data.error;
						invalidProcess(event);
					} else {
						msgBox.innerHTML = "";
						validProcess(event);
					}
				});
			}
		}
		
		var firstMessageBox = document.querySelectorAll(".invalid-error-msg")[0];
		var secondMessageBox = document.querySelectorAll(".invalid-error-msg")[1];
		var thirdMessageBox = document.querySelectorAll(".invalid-error-msg")[2];
		var fourthMessageBox = document.querySelectorAll(".invalid-error-msg")[3];
		
		function doPasswordCheck(event) {
			var msg = [];
			var lowerCaseLetters = /[a-z]/g;
			var upperCaseLetters = /[A-Z]/g;
			var numbers = /[0-9]/g;
			
			if (doEmptyCheck(event)) {
				firstMessageBox.innerHTML = "";
				return true;
			}
			
			// Validate lowercase letters
			if (!event.value.match(lowerCaseLetters)) { msg.push(" 소문자"); }		
			
			// Validate capital letters
			if (!event.value.match(upperCaseLetters)) { msg.push(" 대문자"); }

			// Validate numbers
			if (!event.value.match(numbers)) { msg.push(" 숫자"); }

			// Validate length
			if (event.value.length < 12) { msg.push(" 12자 이상 20자 이하"); }
			
			if (msg.length > 0) {
				firstMessageBox.innerHTML = "*" + msg;
				invalidProcess(event);
				return false;
			}

			firstMessageBox.innerHTML = "";
			validProcess(event);
			return true;
		}
		
		var passwordBox = document.querySelectorAll(".hw_regi_container > input[type=password]");
		
		function doPasswordReCheck(event) {
			if (!doPasswordCheck(passwordBox[0])) {
				return;
			}
			
			if (doEmptyCheck(event)) {
				firstMessageBox.innerHTML = "";
				return;
			}
			
			if (passwordBox[0].value != passwordBox[1].value) {
				firstMessageBox.innerHTML = "비밀번호가 일치하지 않습니다.";
				invalidProcess(event);
			} else {
				firstMessageBox.innerHTML = "";
				validProcess(event);
			}
		}
		
		function doEmptyCheck(event) {
			if (event.value == "") {
				event.classList.remove("valid","invalid");
				return true;
			}
			return false;
		}
		
		function invalidProcess(event) {
			event.classList.remove("valid");
			event.classList.add("invalid");
			event.focus();
		}
		
		function validProcess(event) {
			event.classList.remove("invalid");
			event.classList.add("valid");
		}		

		function doBirthdayCheck(event) {
			var msg = [];
			var input = event.value;
			var notNumber = /[^0-9]/g;
			var validFlag = false;
			
			if (doEmptyCheck(event)) {
				thirdMessageBox.innerHTML = "";
				return;
			}
			
			// Validate numbers
			if (input.match(notNumber)) {
				msg.push(" 숫자만");
			}
			
			// Validate length
			if (input.length != 8) {
				msg.push(" 8글자(예, 20180101)");
			}

			var nowYear = new Date(Date.now()).getFullYear();
			var inYear = input.substr(0, 4);
			var inMonth = input.substr(4, 2);
			var inDate = input.substr(6, 2);
			var inputFormat = inYear + "-" + inMonth + "-" + inDate;
			var inputFormatDate = new Date(inputFormat);

			// Validate correct date
			if ((inDate != inputFormatDate.getDate()) || (inputFormatDate < Date.parse("1900-01-01") || inputFormatDate > new Date(Date.now()))) {
				msg.push(" 유효하지 않은 날짜");
			}
			
			if (msg.length > 0) {
				thirdMessageBox.innerHTML = "*" + msg;
				invalidProcess(event);
				return;
			}

			thirdMessageBox.innerHTML = "";
			validProcess(event);
		}
	</script>
</div>
</body>
</html>