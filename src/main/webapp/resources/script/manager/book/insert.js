/**
 * 
 */
function enter() {
	if(window.event.keyCode == 13){
		$("#keywordPush").trigger("click");
	}
}

//keyword추가 버튼
$("#keywordPush").click(function(){
	var input = $(this).prev();
	var span = $(this).next();
	
	if(input.val() == ""){
		alert('키워드를 입력하시오');
		input.focus();
		return ;
	}
	if((span.find("a").length%5) == 0){
		span.append("<br>");
	}
	span.append("<a onclick='removeKeyword(this)'>#" + input.val() + "</a>");		
	
	
	if($("input[name=keyword]").val() == ""){
		$("input[name=keyword]").val($("input[name=keyword]").val() + input.val());
	}else{
		$("input[name=keyword]").val($("input[name=keyword]").val() +","+ input.val());		
	}
	input.val("").focus();
});

function removeKeyword(obj){
	var value = "";
	$(obj).parent().find("a").not(obj).each(function(i, element) {
		if(value == "")
			value += $(element).text().substring(1);
		else
			value += "," + $(element).text().substring(1);
	});
	$("input[name=keyword]").val(value);
	$(obj).remove();
	
	var aSize = $("#keywordLabel > a").length/5;
	var brSize = $("#keywordLabel > br").length;
	if(aSize <= brSize){
		$("#keywordLabel > br").eq(brSize-1).remove();
	}
}

//파일버튼 클릭
$("#b_in_filebtn").click(function(){
	$("#b_in_fileinput").trigger("click");
});

//jquery datepicker
$("#b_date").datepicker({
	dateFormat : 'yy년 mm월 dd일 출간'
});

//이름중복
function checkName(root) {
	var node = $("input[name=name]");
	var url = root + "/manager/bookInNameCheck.do";
	window.setTimeout(suggestToServer(url,node,bookName), 500);
}

//작가중복
function checkAuthor(root,name){
	var node = $("input[name="+name+"]");
	var url = root + "/manager/bookInAuthorCheck.do";
	suggestToServer(url,node,bookAuthor);
}


//디폴트 전체선택 클릭
var support = $("#b_in_support > .bf-custom-checkbox");
setCheckbox(support);
var payType = $("#b_in_payType > .bf-custom-checkbox");
setCheckbox(payType);


function setCheckbox(checkbox){
	checkbox.eq(0).find("input[type=checkbox]").click(function(e){
		if(this.checked){
			checkbox.find("input[type=checkbox]").each(function(){
				this.checked = true;
			});
		}else{
			checkbox.find("input[type=checkbox]").each(function(){
				this.checked = false;
			});				
		}
	}).trigger('click');
	
	checkbox.not(":eq(0)").find("input[type=checkbox]").click(function(){
		
		checkbox.eq(0).find("input[type=checkbox]").prop("checked",false);
		var check = 0;
		checkbox.not(":eq(0)").find("input[type=checkbox]").each(function(){
			if($(this).prop("checked") == false){
				check = 1;
			}
		});
		if(check == 0){
			checkbox.eq(0).find("input[type=checkbox]").prop("checked",true);
		}
	});
	
}
var lastName ="";
//써제스트
function suggestToServer(url,node,callback) {
	var name = node;
	
	if(lastName != name){
		lastName = name.val();
		var url = url;
		$.ajax({
			  url: url,
			  method: 'get',
			  data: {name : lastName},
			  success: function(check){
				  callback(name,check);
			  	},
			  dataType: "text"
		});
	}
}

function bookName(node,check){
	if(check == 'yes'){
		node.next("span").css("color","blue").text("사용가능합니다");
	}else{
		node.next("span").css("color","red").text("중복입니다 다시 입력하세요");
	}
}

function bookAuthor(node,check) {
	var list = JSON.parse(check);
	var ul = node.parent().find("ul");
	ul.empty();
	if(list.author != null){
		for(var i=0;i<list.author.length;i++){
			var author = list.author[i];
			ul.append("<li id='"+author.num+"'>"+author.name+"</li>");
		}
		
		ul.find("li").click(function() {
			var num = $(this).attr("id");
			var name = $(this).text();
			var superParent = ul.parent(".b_in_author_list").parent();
			superParent.find("input[type=hidden]").val(num);
			superParent.find("input[type=text]").val(name);
			blurAuthor(superParent.find("input[type=text]"));
			
		});
	}
}


$("input[name=author]").focusin(function() {
	focusinAuthor($("input[name=author]"));
});
$("input[name=illustrator]").focusin(function() {
	focusinAuthor($("input[name=illustrator]"));
});
$("input[name=translator]").focusin(function() {
	focusinAuthor($("input[name=translator]"));
});

/* $("input[name=author]").focusout(function() {
	
	blurAuthor($("input[name=author]"));
}); */ 

function blurAuthor(node){
	$(node).parent().find("div").css("display","none");
}

function focusinAuthor(node){
	$(node).parent().find("div").css("display","block");
} 

function uploadImg(root){
	var url = root + "/manager/bookUploadImg.do";
	var formData = new FormData();
	formData.append('file', $("#b_in_fileinput")[0].files[0]);
	$.ajax({
        url: url,
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
        success: function(result){
        	alertify.success("이미지 업로드 성공");
        	$(".b_in_img").find("img").attr("src",root+result);
        }
    });
}

function bookInsertOk(){
	//도서 유효성검사
	//도서제목 
	var name = $("input[name=name]");
	if(name.val() == ""){
		name.focus();
		name.next().css("color","red").text("제목을 입력하시오");
		alertify.error("제목을 입력하시오");
		return false;
	}
	if(name.next().val() == "중복입니다 다시 입력하세요"){
		name.focus();
		alertify.error("중복입니다");
		return false;
	}
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
	if(pub_num.val() == ""){
		pub_num.val(0);
	}
	
	//카테고리
	var cate1_num = $("input[name=cate1_num]");
	var cate2_num = $("input[name=cate2_num]");
	var cate3_num = $("input[name=cate3_num]");
	
	if(cate1_num.val()=="" ||cate2_num.val()=="" ||cate3_num.val()=="" ){
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
