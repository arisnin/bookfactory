/**
 * 
 */
$("#b_date").datepicker({
			dateFormat : 'yy-mm-dd'
		});

var checkbox = $(".bf-custom-checkbox");

//디폴트 전체선택 클릭

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
	alert(root);
}

function bookInsertOk(){
	//도서 유효성검사
	//도서제목 
	/*var name = $("input[name=name]");
	if(name.val() == ""){
		name.focus();
		name.next().css("color","red").text("제목을 입력하시오");
		return false;
	}
	if(name.next().val() == "중복입니다 다시 입력하세요"){
		name.focus();
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
	}*/
	
	//카테고리
	/*var cate1_num = $("input[name=cate1_num]");
	var cate2_num = $("input[name=cate2_num]");
	var cate3_num = $("input[name=cate3_num]");
	
	if(cate1_num.val()=="" ||cate2_num.val()=="" ||cate3_num.val()=="" ){
		$("#b_cate_ok").focus();
		return false;
	}*/
	
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
	
	//이미지
	
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
	
	return false;
}


