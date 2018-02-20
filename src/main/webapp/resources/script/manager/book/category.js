/**
 * 
 */
//취소버튼 이벤트
var input1 = $("#b_cate_c1");
input1.next().find("button[type=reset]").click(function() {
	input1.val("");
});
var input2 = $("#b_cate_c2");
input2.next().find("button[type=reset]").click(function() {
	input2.val("");
});
var input3 = $("#b_cate_c3");
input3.next().find("button[type=reset]").click(function() {
	input3.val("");
});


//대분류 등록
function cate1(root){
	var url = root + "/manager/insertCateOne.do";
	var param = $("#b_cate_c1");
	if(param.val() == ""){
		alert("카테고리 이름을 입력하시오.");
		param.focus();
	}else{
		location.href=url + "?name="+param.val();
	}
}


//중분류 등록
$("#b_cate_1 span").click(function (){
	$("input[name=secondCate1]").val($(this).attr("id"));
});

function cate2(root){
	var url = root + "/manager/insertCateTwo.do";
	var param = $("#b_cate_c2");
	var cate1Val = $("input[name=secondCate1]").val();

	var cate1 = param.parent().find("#b_cate_1 > button").text();
	if(cate1 == "대분류"){
		alert("대분류를 입력하시오");
	}else if(param.val() == ""){
		alert("카테고리 이름을 입력하시오.");
		param.focus();
	}else{
		location.href=url + "?name="+param.val() +"&cate1="+cate1Val;
	}
}

//대분류 등록

$("#b_cate_11 span").click(function (){
	$("input[name=secondCate2]").val($(this).attr("id"));
});

function cate3(root){
	var url = root + "/manager/insertCateThree.do";
	var param = $("#b_cate_c3");
	var cate2Val = $("input[name=secondCate3]").val();

	var cate1 = param.parent().find("#b_cate_11 > button").text();
	var cate2 = param.parent().find("#b_cate_2 > button").text();
	if(cate1 == "대분류"){
		alert("대분류를 입력하시오");
	}else if(cate2 == "중분류"){
		alert("중분류를 입력하시오");
	}else if(param.val() == ""){
		alert("카테고리 이름을 입력하시오.");
		param.focus();
	}else{
		url = url + "?name="+param.val() +"&cate1="+cate2Val;
		location.href=url;
	}
}

