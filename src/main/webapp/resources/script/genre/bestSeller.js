/**
 * 베스트셀러 관련 자바스크립트 - 최정은
 */

$(function(){
	//해당태그 밑에 밑줄표시
	$(".sub_cate_element > span").removeClass();
	$(".hw_sub_cate li").eq(2).children("span").addClass("activeBar");
	
	var date=$("input[name=bestSeller]").val();
	var firstCate=$("input[name=firstCate]").val();

	$(".order-type-list a").removeClass();
//	alert(date);
	if(date=="monthBest"){
		$("#newBook > div.bf-service-type-menu > ul.order-type-list > li:nth-child(2) > a").addClass("active");
	}else if(date=="steady"){
		$("#newBook > div.bf-service-type-menu > ul.order-type-list > li:nth-child(3) > a").addClass("active");
	}else{
		$("#newBook > div.bf-service-type-menu > ul.order-type-list > li:nth-child(1) > a").addClass("active");
	}
});

