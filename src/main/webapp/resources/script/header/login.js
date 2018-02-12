/**
 * 
 */


var modal = document.getElementById('hw_login');

//When the user clicks anywhere outside of the modal, close it

function loginClose(){
	var login = document.getElementById("hw_login");

	window.onclick = function(event) {
		if (event.target == login) {
			login.style.display = "none";
		}
	}
}

function remCheck() {
	if($(".hw_rem_check").prop("checked") == false){
		$(".hw_rem_check").prop("checked",true);
	}else{
		$(".hw_rem_check").prop("checked",false);
	}
}
