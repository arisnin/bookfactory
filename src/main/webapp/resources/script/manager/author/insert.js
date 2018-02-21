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
	$(obj).parent().remove();
}



