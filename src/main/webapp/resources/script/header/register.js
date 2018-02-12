/**
 * 
 */
//checkbox
function clickCheck(obj){
	var span = obj.children[1];
	var checkbox = obj.children[0];
	if(span.className=="hw_check_text"){
		span.className = "hw_check_text hw_accheck"
		checkbox.checked = true;
	}else{
		span.className = "hw_check_text";
		checkbox.checked = false;	
	}
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
		$("#hw_gender").val(label.text());
	});
});