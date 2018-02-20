/**
 * 
 */

function updateFun(name){
	if($(".p_in_check").text() == "중복입니다 다시 입력하세요"){
		alert("중복체크");
		return ;
	}
	$("#pubUpdateForm").submit();
}

//이름중복
function checkName(root) {
	var node = $("input[name=name]");
	var url = root + "/manager/publisherNameCheck.do";
	window.setTimeout(suggestToServer(url,node,pubName), 500);
}
var lastName = "";
//써제스트
function suggestToServer(url,node,callback) {
	var name = node;
	if(lastName != name){
		lastName = name.val();
		var url = url;
		$.ajax({
			  url: url,
			  method: 'get',
			  data: {name : lastName},
			  success: function(check){
				  callback(name,check);
			  	},
			  dataType: "text"
		});
	}
}

function pubName(name,check){
	if(check > 0){
		if(name.val() == $("input[name=original_name]").val()){
			name.next("span").text("");
			return ;
		}else{
			name.next("span").css("color","red").text("중복입니다 다시 입력하세요");
			name.focus();
			return;	
		}
	}else{
		name.next("span").css("color","blue").text("사용가능합니다");			
	}
}




