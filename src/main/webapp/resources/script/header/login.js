/**
 * 염현우
 */

var modal = document.getElementById('hw_login');

//When the user clicks anywhere outside of the modal, close it

function loginClose(){
	var login = document.getElementById("hw_login");
	
	if (event.target == login) {
		login.style.display = "none";
	}	
}

function remCheck() {
	if($(".hw_rem_check").prop("checked") == false){
		$(".hw_rem_check").prop("checked",true);
	}else{
		$(".hw_rem_check").prop("checked",false);
	}
}

/**
 * 로그인 함수(Ajax 구현)
 * 
 * @param root application root context
 * @returns
 *
 * @author 박성호
 * @date 2018. 2. 18.
 */
function doLogin(root) {
	var username = loginForm.username.value;
	var password = loginForm.password.value;
	$.post(root + "/member/loginOk.do", {username:username,password:password,requestURL:"ajax"}, function(data,status) {
		if (data.response.error) {
			var div = document.getElementById("login-message");
			div.innerHTML = data.response.message;
			div.style.display = "block";
		} else {
			location.reload();
		}
	});
	return false;
}