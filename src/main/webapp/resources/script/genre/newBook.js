/**
 * 신간, 베스트셀러에 적용되는 이벤트입니다.
 */
$(function(){
	$("#newBook .view-type-list > button:eq(0)").click(function(){
		//alert("불럼");
		$("#newBook .view-type-list > button:eq(1)").removeClass();
		$(this).addClass("active");
		$(".newBook_booklist_short").css("display","block");
		$(".newBook_booklist_long").css("display","none");
	});
	
	$("#newBook .view-type-list > button:eq(1)").click(function(){
		//alert("불럼");
		$("#newBook .view-type-list > button:eq(0)").removeClass();
		$(this).addClass("active");
		$(".newBook_booklist_short").css("display","none");
		$(".newBook_booklist_long").css("display","block");
	});
	
});