/**
 * 
 */

$(function () {
	var education = $("input[name=education]");
	var career = $("input[name=career]");
	var awards = $("input[name=awards]");
	
	removeBrAndSetting(education);
	removeBrAndSetting(career);
	removeBrAndSetting(awards);
});

function removeBrAndSetting(content){
	if(content.val() == "없음"){
		return ;
	}
	var value = content.val().split("<br>");
	for(var i=0;i<value.length;i++){
		content.parent().next().find("ul").append("<li>"+ value[i] +"<span onclick='removeLi(this)'>삭제</span></li>");
	}
}

$("#reject_btn").click(function(){
	$.ajax({
		  url: '/bookFactory/manager/authorEditReject.do',
		  method: 'get',
		  data: {editNum : $("input[name=editNum]").val()},
		  success: function(){
			  location.href='/bookFactory/manager/authorUpdateBoard.do';
		  },
		  dataType: "text"
	});
});

