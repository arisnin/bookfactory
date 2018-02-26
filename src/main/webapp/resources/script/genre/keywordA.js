/**
 * 키워드 화면 이벤트 ajax 추가 - 최정은
 */
$(function(){
	//단행본, 연재 숨기는 이벤트
	$(".hw_sub_wrap").hide();
	
	var cateNum=$("input[name=firstCate]").val();
	var jsonFile="";
	
	if(cateNum==2){
		jsonFile="keyword_romance.json";
	}else if(cateNum==3){
		jsonFile="keyword_fantasy.json";
	}else if(cateNum==4){
		jsonFile="keyword_comic.json";
	}else if(cateNum==5){
		jsonFile="keyword_bl.json";
	}
	
	$.getJSON(jsonFile, function(data){ 
		$(".keyword_top_head > .title").text(data["title"]);
		
		var group=data.sets[0].groups;
		
		$(group).each(function(i, ex) {
            var fieldset=document.createElement("fieldset");
            $(fieldset).addClass("keyword_filed");
            $("#keyword_top_list").append(fieldset);
            
            var fieldDiv=document.createElement("div");
            $(fieldDiv).addClass("keyword_top_list_show wrap-container");
            fieldset.append(fieldDiv);
            
            var titleDiv=document.createElement("div");
            $(titleDiv).text(group[i].title);
            fieldDiv.append(titleDiv);
            
            var listDiv=document.createElement("div");
            $(listDiv).addClass("keyword_top_list_button wrap-container");
            fieldDiv.append(listDiv);
            
            var listUl=document.createElement("ul");
            listDiv.append(listUl);
            
            var tags=group[i].tags;
            $(tags).each(function(j, ext){
	            var listLi=document.createElement("li");
	            listUl.append(listLi);
	            
	            var label=document.createElement("label");
	            $(label).addClass("bf-custom-checkbox checkbox-btn");
	            listLi.append(label);
	            
	            var labelCheck=document.createElement("input");
	            $(labelCheck).attr("type","checkbox");
	            $(labelCheck).attr("title",tags[j].name);
	            label.append(labelCheck);
	            
	            var labelSpan=document.createElement("span");
	            $(labelSpan).addClass("bf-button bf-transparent-btn");
	            $(labelSpan).text(tags[j].name);
	            label.append(labelSpan);
            });
        });
	});
	
	var listCount=0;
	var sendData="tags=";
	
	//키워드 선택시 밑에 나오는 태그
	$("#keyword_top_list").on("click",".keyword_top_list_button label > input",function(){
		event.preventDefault();
		
		if (this.checked == true) {
// 			alert('true');
			$(this).parent().parent().css({
				backgroundColor : "#A59AF6"
			});
			
			$(".keyword_not_choice").attr("style","display:none");
			$(".keyword_choice").attr("style","display:inline-block");
			
			var key=document.createElement("li");
			
			var button = '<button type="button" class="bf-button keyword-btn">'+$(this).next().text()+'<span class="button_x">X</span></button>';
			key.innerHTML = button;

			$(".keyword_choice ul.tag-list").append(key);
			
			sendData+=$(this).next().text()+",";
// 			alert(sendData);
			
			listCount=listCount+1;
			display(listCount);
			
			var root=$("input[name=rootJS]").val();

			$.ajax({
				type:"get",
				url: root+"/keywordSearch.do",
				data:sendData,
				success: list,
				error:function(jqXHR, textStatus, errorThrown ) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
			    	alert(jqXHR);
			    	alert(textStatus);
			    	alert(errorThrown);
			    }
			});
		}
	});
	
	display(listCount);
});

function list(json){
	var obj = JSON.parse(json);
	alert(obj.tagList[0]);
}

function display(listCount){
	if(listCount==0){
		$(".keyword_no_search").attr("style","display:none");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").css({
			display:"none"
		});
	}else if(listCount==5){
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
