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

