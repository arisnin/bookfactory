/**
 * 일반 - 홈화면의 자바스크립트 - 최정은
 */

$(function(){
	//해당 큰 태그밑에(first_cate) 밑줄표시
	$(".sub_cate_element > span").removeClass();
	$(".hw_sub_cate li").eq(0).children("span").addClass("activeBar");
	
	
});