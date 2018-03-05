/**
 * 베스트셀러 관련 자바스크립트 - 최정은
 */

$(function(){
	$(".hw_sub_wrap").show();
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
	
	if($("input[name=rental]").val()=="" || $("input[name=rental]").val()=="no"){
		$(".category-filter-list input[type=checkbox]").prop('checked',false);
		$(".all-mark").removeClass(".bf-custom-checkbox input:checked+.all-mark:before");
	}else if($("input[name=rental]").val()=="yes"){
		$(".category-filter-list input[type=checkbox]").prop('checked',true);
		$(".all-mark").addClass(".bf-custom-checkbox input:checked+.all-mark:before");
	}
	
//	alert($("input[name=rental]").val());
	///best-sell.do?firstCateNum=${firstCate}&bestSeller=weekBest
	
	$(".category-filter-list input").click(function(){
		var sendData="firstCateNum="+$("input[name=firstCateNum]").val();
		sendData+="&bookType="+$("input[name=bookType]").val();
		sendData+="&seconCate="+$("input[name=seconCate]").val();
		sendData+="&bestSeller="+$("input[name=bestSeller]").val();
		
		if(this.checked==true){
//			alert("true");
			sendData+="&rental=yes";
		}else{
//			alert("false");
			sendData+="&rental=no";
		}
		
		var root=$("input[name=root]").val();
		
		location.href=root+"/best-sell.do?"+sendData;
	});
});

