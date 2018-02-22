/**
 * 	작성자 염현우
 *  Author - insert.jsp 의 자바스크립트
 */

$("#b_date").datepicker({
	dateFormat : 'yy-mm-dd'
});
$("#b_date2").datepicker({
	dateFormat : 'yy-mm-dd'
});

$(".search").click(function(){
	var input = $(this).prev();
	
	if(input.val() == ""){
		alert("공백 입력 불가능");
		return;
	}
	var ul = $(this).parent().next().find("ul");
	ul.prepend("<li>"+input.val()+"<span onclick='removeLi(this)'>삭제</span></li>");
	input.val("");
});


$("#education_btn,#career_btn,#awards_btn").click(function () {
	var li = $(this).parent().next().find("li");
	var hidden = $(this).next();
	var value = "";
	li.each(function(i, element) {
		var num = $(element).text().indexOf('삭제');
		var text = $(element).text().substring(0,num);
		if(i != 0){
			value += "<br>" + text;
		}else{
			value += text;
		}
	});
	hidden.val(value);
});

function removeLi(obj){
	var ul = $(obj).parent().parent();
	$(obj).parent().remove();
	
	var hidden = ul.parent().prev().find("input[type=hidden]");
	var value = "";
	ul.find("li").each(function(i, element) {
		var num = $(element).text().indexOf('삭제');
		var text = $(element).text().substring(0,num);
		if(i != 0){
			value += "<br>" + text;
		}else{
			value += text;
		}
	});
	hidden.val(value);
}

$("#a_form_btn").click(function () {
	var url = "/bookFactory/manager/authorNameCheck.do";
	var lastName = $("input[name=name]").val();
	$.ajax({
		  url: url,
		  method: 'get',
		  data: {name : lastName},
		  success: function(check){
			  if(check > 0){
				 $(".a_in_content > div:nth-child(1) > span").text("중복입니다 다시 입력하세요");
				 $(".a_in_content > div:nth-child(1) > input[type=text]").focus();
				 return false;
			  }else if(check == -1){
				  $(".a_in_content > div:nth-child(1) > span").text("입력하세요");
				  $(".a_in_content > div:nth-child(1) > input[type=text]").focus();
				  return false;
			  }
		  	},
		  dataType: "text"
	});
});



