/**
 * 체크박스 버전(최정은)
 */

/**
 * 전체선택 버그 / 1. CSS 초기화만 되고 checkbox 선택 해제가 안 됨 > 수정(line20)
 * 키워드 생성 코드 수정(line42 ~ 52)
 * @Author	박성호	
 * @Date	2018. 2. 10.
 */

$(function() {
	var max=5;
	
	//키워드 전체해제 선택시
	$(".keyword_top_head > button").click(function(){
		max=5;
		$(".keyword_top_list_button li").css({
			backgroundColor : "#f8f7ff"
		}).find("input[type=checkbox]").prop('checked',false);
		$(".keyword_choice .tag-list > li").remove();
		
		display(max);
	});
	
	//키워드 선택시
	$(".checkbox-btn > input").click(function() {
		//alert(this);
		//alert(max);
		if (this.checked == true) {
			max=max-1;
			//alert('true');
			$(this).parent().parent().css({
				backgroundColor : "#A59AF6"
			});
			
			$(".keyword_not_choice").attr("style","display:none");
			$(".keyword_choice").attr("style","display:inline-block");
			
			var key=document.createElement("li");
			
//			var button=document.createElement("button");
//			button.innerHTML=$(this).next().text();
//			key.append(button);
			
			var button = '<button type="button" class="bf-button keyword-btn">'+$(this).next().text()+'<span class="button_x">X</span></button>';
			key.innerHTML = button;
			
//			var span=document.createElement("span");
//			span.innerHTML="x";
//			button.append(span);			
//			$(span).addClass("button_x");
			
			$(".keyword_choice ul.tag-list").append(key);
			
			display(max);
		} else {
			max=max+1;
			//alert('false');
			$(this).parent().parent().css({
				backgroundColor : "#f8f7ff"
			});
			
			var text=$(this).next().text()+"X";
			var check=$(".bf-custom-checkbox > input:checked").length+1;
			
			for(var i=0;i<check;i++){
				//alert($(".keyword_choice li").eq(i).children().text());
				if(text==$(".keyword_choice li").eq(i).children().text()){
					$(".keyword_choice li").eq(i).remove();
				}
			}
			display(max);
		}
	
	});
	
	//새로생긴 선택된 태그에서 삭제시도할때
	$(".keyword_choice ul").on("click","li", function(){
		var checkboxCount=$(".keyword_top_list_button input[type=checkbox]").length;
		for(var i=0;i<checkboxCount;i++){
			var text=$(".keyword_top_list_button li").eq(i).find(".bf-button").text()+"X";
			if(text==$(this).text()){
				$(".keyword_top_list_button li").eq(i).css({
					backgroundColor : "#f8f7ff"
				});
				$(this).remove();
			}
		}
		max=max+1;
		
		display(max);
	});
	
	display(max);
});

function display(max){
	if(max==0){
		$(".keyword_no_search").attr("style","display:table");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").css({
			display:"none"
		});
	}else if(max==5){
		$(".keyword_not_choice").attr("style","display:table");
		$(".keyword_choice").attr("style","display:none");
		$(".keyword_no_search").attr("style","display:none");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").attr("style","display:none");
	}else{
		$(".keyword_not_choice").attr("style","display:none");
		$(".keyword_no_search").attr("style","display:none");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").attr("style","display:inline-block")
	}
}