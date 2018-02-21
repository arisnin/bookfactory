/**
 * 염현우(최초작성)
 */

/**
 * 1차 수정. 전체동의 버튼 기능과 연동하기 시키기 위해 리턴값 추가
 * @param obj 이벤트가 발생한 요소
 * @returns 클릭 후 checkbox 상태(true or false)
 *
 * @Author	박성호
 * @Date	2018. 2. 18.
 */
function clickCheck(event){
	var span = event.children[1];
	var checkbox = event.children[0];
	
	span.classList.toggle("hw_accheck");
	checkbox.checked = !checkbox.checked;
	
	doConfirmCheck(event);
	return checkbox.checked;
}

/**
 * 회원가입에서 약관 전체동의 버튼 기능 구현
 * @param event 이벤트가 발생한 요소(전체동의 버튼임)
 * @returns 없음
 *
 * @Author	박성호(최초작성)
 * @Date	2018. 2. 18.
 */
function allCheck(event) {
	var state = clickCheck(event);
	
	if (state) {
		var checks = document.querySelectorAll("#signup_confirm > li:first-child ~ li");
		checks.forEach(function(e,i) {
			e.children[1].classList.add("hw_accheck");
			e.children[0].checked = true;
		});
	}
	doConfirmCheck(event);
}

function closeRegi(){
	var regi = document.getElementById("hw_register");

	window.onclick = function(event) {
		if (event.target == regi) {
			regi.style.display = "none";
		}
	}
}

$(document).ready(function() {
	//성별 클릭 이벤트
	$(".hw_gender_label").click(function() {
		var label = $(this);
		if(label.css("backgroundColor")!="rgba(0, 0, 0, 0)"){
			label.removeClass("hw_gender_select");
		}else{
			$(".hw_gender_label:not(this)").removeClass("hw_gender_select");
			
			$(".hw_gender_label").removeClass("hw_gender_select");
			label.addClass("hw_gender_select");
		}
		if (label.text().search("여") != -1) {
			$("#hw_gender").val('female');
		} else {
			$("#hw_gender").val('male');
		}
	});
});