/**
 * 이벤트 관련 자바스크립트 - 최정은
 */

$(function(){
	//해당 태그밑에 밑줄긋기
	$(".sub_cate_element > span").removeClass();
	$(".hw_sub_cate li").eq(3).children("span").addClass("activeBar");
	
	var type=$("input[name=type]").val();
	$(".bf-service-type-menu li a").removeClass("active");
//	alert(type);
	if(type=="ago"){
		$(".bf-service-type-menu li a").eq(1).addClass("active");
	}else if(type=="now"){
		$(".bf-service-type-menu li a").eq(0).addClass("active");
	}
	
	
});

function eventDetail(root, num){
	location.href=root+"/eventDetail.do?num="+num;
}