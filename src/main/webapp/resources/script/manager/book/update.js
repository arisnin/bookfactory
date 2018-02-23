/**
 * 
 */

$(function () {
	var keyword =$("input[name=keyword").val().split(",");
	if(keyword.length != 0){
		for(var i=0;i<keyword.length;i++){
			if(i == 5){
				$("#keywordLabel").append("<br>");
			}
			$("#keywordLabel").append("<a onclick='removeKeyword(this)'>#" + keyword[i] + "</a>");
		}
	}
	
	if($("input[name=rental_period]").val() == 'no'){
		$("#b_in_payType > label:nth-child(5) > span.checkbox-label").trigger("click");
	}
});

function bookUpdateOk(){
	//도서 유효성검사
		//도서제목 
		//도서부제목
		var sub_title = $("input[name=sub_title]");
		if(sub_title.val() == ""){
			sub_title.val("없음");
		}
		//출간일
		var write_date = $("input[name=write_date]");
		if(write_date.val()==""){
			write_date.val("없음");
		}
		
		//출판사
		var pub_num = $("input[name=pub_num]");
		if(pub_num.val() == "" || pub_num.val() == "없음"){
			pub_num.val(0);
		}
		
		//카테고리
		var cate1_num = $("input[name=cate1_num]");
		var cate2_num = $("input[name=cate2_num]");
		var cate3_num = $("input[name=cate3_num]");
		
		if(cate1_num.val()=="" && cate2_num.val()=="" && cate3_num.val()=="" ){
			
		}else if(cate1_num.val()=="" ||cate2_num.val()=="" ||cate3_num.val()=="" ){
			$("#b_cate_ok").focus();
			alertify.error("카테고리 입력하세요");
			return false;
		}
		
		//작가
		var author_num = $("input[name=author_num]");
		var illustrator_num = $("input[name=illustrator_num]");
		var translator_num = $("input[name=translator_num]");
		
		if(author_num.val()==""){
			author_num.val(0);
		}
		if(illustrator_num.val()==""){
			illustrator_num.val(0);
		}
		if(translator_num.val()==""){
			translator_num.val(0);
		}
		
		var supportBox = $("input[name=supportBox]:checked");
		var supportValue = "";
		for(var i=0;i<supportBox.length;i++){
			supportValue += $(supportBox[i]).val() + ",";
		}
		if(supportValue == ""){
			supportValue = "없음";
		}
		
		$("input[name=support]").val(supportValue);
		
		//이미지
		var img_path = $(".b_in_img").find("img").attr("src");
		$("input[name=img_path]").val(img_path);
		
		//도서소개
		var intro = $("textarea[name=intro]");
		if(intro.val()==""){
			intro.val("없음");
		}
		
		//출판사 서평
		var pub_intro = $("textarea[name=pub_intro]");
		if(pub_intro.val()==""){
			pub_intro.val("없음");
		}
		
		//책가격
		var price = $("input[name=price]");
		if(price.val() == ""){
			price.focus();
			return false;
		}
		
		//대여
		var rental_period = $("input[name=rent]:checked");
		var rentalStr = "";
		if(rental_period.length == 1){
			rentalStr = "대여";
			$("input[name=rental_price]").val(Math.round(parseInt(price.val()) * 0.8));
		}else{
			rentalStr = "no";
			$("input[name=rental_price]").val(0);
		}
		$("input[name=rental_period]").val(rentalStr);
		
		var payType = $("input[name=payType]:checked");
		var type = "";
		if(payType.length == 2){
			type = "paper";
		}else{
			type = "ebook";
		}
		$("input[name=type]").val(type);
}


