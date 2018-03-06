/**
 * 
 */

//체크박스
$("input[type=checkbox]").click(function(){
	location.href="/bookFactory/manager/authorUpdateBoard.do?condition="+$(this).val();
});

var check = 0;
$("input[type=checkbox]").each(function(){
	if($(this).val() == $("input[name=condition]").val()){
		$(this).prop("checked",true);
		check = 1;
	}
});
if(check == 0){
	$("div.a_up_checkbox > ul > li:nth-child(1) > label > input[type='checkbox']").prop("checked",true);
}

//페이지번호 활성화
var pageNumber = $("input[name=pageNumber]").val();
$(".bf-animated-btn").find("li").each(function(){
	if($(this).text()==pageNumber){
		$(this).find("a").addClass("active");
	}
});