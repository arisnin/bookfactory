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
	
	//해당태그 밑에 밑줄표시
	$(".sub_cate_element > span").removeClass();
	$(".hw_sub_cate li").eq(1).children("span").addClass("activeBar");
	
//	alert($("input[name=rental]").val());
	
	if($("input[name=rental]").val()=="" || $("input[name=rental]").val()=="no"){
		$(".category-filter-list input[type=checkbox]").prop('checked',false);
		$(".all-mark").removeClass(".bf-custom-checkbox input:checked+.all-mark:before");
	}else if($("input[name=rental]").val()=="yes"){
		$(".category-filter-list input[type=checkbox]").prop('checked',true);
		$(".all-mark").addClass(".bf-custom-checkbox input:checked+.all-mark:before");
	}
	
//	alert($("input[name=rental]").val());
	
	$(".category-filter-list input").click(function(){
		var sendData="firstCateNum="+$("input[name=firstCateNum]").val();
		sendData+="&bookType="+$("input[name=bookType]").val();
		sendData+="&seconCate="+$("input[name=seconCate]").val();
		
		if(this.checked==true){
//			alert("true");
			sendData+="&rental=yes";
		}else{
//			alert("false");
			sendData+="&rental=no";
		}
		
		var root=$("input[name=root]").val();
		
		location.href=root+"/new-book.do?"+sendData;
	});
});