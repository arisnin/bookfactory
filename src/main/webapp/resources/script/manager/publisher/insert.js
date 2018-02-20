/**
 * 
 * 출판사 유효성검사
 */

function pubinFun(root){
	var url = root + "/manager/publisherNameCheck.do";
	var name = $("input[name=name]");
	if(name.val()==""){
		name.next("span").text("출판사 이름을 입력하세요");
		name.focus();
		return ;
	}
	
	$.ajax({
		  url: url,
		  method: 'get',
		  data: {name : $.trim(name.val())},
		  success: function(check){
		  		if(check > 0){
		  			name.next("span").text("중복입니다 다시 입력하세요");
		  			name.focus();
		  			return;
		  		}else{
		  			$("#pub_form").submit();
		  		}
		  	},
		  dataType: "text"
	});
}