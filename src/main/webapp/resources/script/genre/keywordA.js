/**
 * 키워드 화면 이벤트 ajax 추가 - 최정은
 */
var listCount=0;

$(function(){
	//로딩버튼
	var loading = $('<div id="loading" class="loading"></div><img id="loading_img" alt="loading" src="http://cfile30.uf.tistory.com/image/27246646563AAE531717C3" style="max-width:100%;height:auto" width="50" height="50"/>').appendTo($(".keyword wrap-container")).hide();

	$(window).ajaxStart(function(){
		loading.show();
	}).ajaxStop(function(){
		loading.hide();
	});
	
	var root=$("input[name=rootJS]").val();
	var firstCate=$("input[name=firstCate]").val();
//	alert(root+", "+firstCate);
	
	//단행본, 연재 숨기는 이벤트
	$(".hw_sub_wrap").hide();
	
	var firstCate=$("input[name=firstCate]").val();
	var jsonFile="";
	
	if(firstCate==2){
		jsonFile="keyword_romance.json";
	}else if(firstCate==3){
		jsonFile="keyword_fantasy.json";
	}else if(firstCate==4){
		jsonFile="keyword_comic.json";
	}else if(firstCate==5){
		jsonFile="keyword_bl.json";
	}
	//키워드 리스트 가져오는 
	$.getJSON(jsonFile, function(data){ 
		$(".keyword_top_head > .title").text(data["title"]);
		
		var group=data.sets[0].groups;
		
		$(group).each(function(i, ex) {
			//카테고리마다 필드셋 너비가 다름
            var fieldset=document.createElement("fieldset");
            $(fieldset).addClass("keyword_filed");
            if(firstCate==3){
            	$(fieldset).addClass("fantasyKeyword");
            }else if(firstCate==4){
            	$(fieldset).addClass("comicKeyword");
        	}
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
	
	var sendData="";
	
	//키워드 선택시 밑에 나오는 태그
	$("#keyword_top_list").on("click",".checkbox-btn > input",function(){
//		event.preventDefault();
		
		if (this.checked == true) {
			sendData=$("input[name=tags]").val();
			
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
			
			$("input[name=tags]").val(sendData);
			
			listAjax(root, sendData, 1, firstCate);
		}else{
			$(this).parent().parent().css({
				backgroundColor : "#f8f7ff"
			});
			
			var text=$(this).next().text()+"X";
			var check=$(".bf-custom-checkbox > input:checked").length+1;
			
			for(var i=0;i<check;i++){
				//alert($(".keyword_choice li").eq(i).children().text());
				if(text==$(".keyword_choice li").eq(i).children().text()){
					$(".keyword_choice li").eq(i).remove();
					
					var res=$(this).next().text()+",";
//					alert(res);
					
					$("input[name=tags]").val($("input[name=tags]").val().replace(res,""));
				}
			}
			
			listAjax(root, "", 1, firstCate);
		}
	});
	
	//전체해제 버튼
	$(".keyword_top_head > button").click(function(){
		$(".keyword_top_list_button li").css({
			backgroundColor : "#f8f7ff"
		}).find("input[type=checkbox]").prop('checked',false);
		$(".keyword_choice .tag-list > li").remove();
		$("input[name=tags]").val("");
		listAjax(root, "", 1,firstCate);
	});
	
	//선택된 태그에서 삭제 
	$(".keyword_choice ul").on("click","li", function(){
		var checkboxCount=$(".keyword_top_list_button input[type=checkbox]").length;
		for(var i=0;i<checkboxCount;i++){
			var text=$(".keyword_top_list_button li").eq(i).find(".bf-button").text()+"X";
			if(text==$(this).text()){
				$(".keyword_top_list_button li").eq(i).css({
					backgroundColor : "#f8f7ff"
				});
				$(this).remove();
				
				var res=$(this).text().slice(0,-1)+",";
//				alert(res);
				
				$("input[name=tags]").val($("input[name=tags]").val().replace(res,""));
			}
		}
		listAjax(root, "", 1,firstCate);
	});
	
	display(listCount);
});

function list(json){
	$(".tagListCount").text(json.tagListCount);
	listCount=json.tagListCount;
	
//	alert(json.tagList[0][0].book_num);
	makeList(json);
	makePage(json);
	
	display(listCount);

}

function makePage(json){
	var root=$("input[name=rootJS]").val();
	var firstCate=$("input[name=firstCate]").val();
	
	//기존있던 페이지지움
	$("#bf-animated-btn").has("li").empty();
	
	//페이징
	var pageNumber=json.pageNumber;
	var boardSize=json.boardSize;
//	alert(pageNumber +","+ boardSize);

	var pageUl=document.getElementById("bf-animated-btn");
	if(listCount>0){
		var pageCount=parseInt(listCount/boardSize+(listCount%boardSize==0? 0:1));
		var pageBlock=10;
		
		var startPage=(parseInt((pageNumber-1)/pageBlock))*pageBlock+1;
		var endPage=startPage+pageBlock-1;
//		alert(startPage+", "+endPage);
		if(endPage>pageCount)	endPage=pageCount;
		
		pageUl.innerHTML+="<li class='first'><a onclick='listAjax(\""+root+"\","+0+","+1+","+firstCate+")'><span></span></a></li>";
		
		if(startPage>pageBlock)												
			pageUl.innerHTML+="<li class='prev'><a class='prev'onclick='listAjax(\""+root+"\","+0+","+(startPage-pageBlock)+","+firstCate+")'><span></span></a></li>";
		
		for(var a=startPage;a<=endPage;a++){						
			if(pageNumber==a){
				pageUl.innerHTML+="<li><a class='active' onclick='listAjax(\""+root+"\","+0+","+a+","+firstCate+")'>"+a+"</a></li>";
			}else{
				pageUl.innerHTML+="<li><a onclick='listAjax(\""+root+"\","+0+","+a+","+firstCate+")'>"+a+"</a></li>";
			}
		}
		
		if(endPage<pageCount)						
			pageUl.innerHTML+="<li class='next'><a onclick='listAjax(\""+root+"\","+0+","+(startPage+pageBlock)+","+firstCate+")'><span></span></a></li>";
		
		pageUl.innerHTML+="<li class='last'><a onclick='listAjax(\""+root+"\","+0+","+pageCount+","+firstCate+")'><span></span></a></li>";
		
	}
}

function makeList(json){
	var root=$("input[name=rootJS]").val();
	var firstCate=$("input[name=firstCate]").val();
	//innerHTML 버전
	var listLength=json.tagList.length;
//	alert(listLength);

	var abc=document.getElementById("keywordTagList");
	
	if($(keywordTagList).has(".mf-book-item"))	$(keywordTagList).has(".mf-book-item").empty();
	
	$(json.tagList).each(function(i,e){
		abc.innerHTML+=
			"<li class='mf-book-item'>" +
				"<div class='mf-book-thumbnail'>" +
					"<div class='mf-book-thumbnail-image' onclick='goDetail("+json.tagList[i][0].book_num+")'>" +
						"<img class='' src='"+json.tagList[i][0].img_path+"' alt='image' />" +
					"</div>" +
				"</div>" +
				"<div class='mf-book-metadata'>" +
					"<h3 class='book-metadata-text' onclick='goDetail("+json.tagList[i][0].book_num+")'>"+json.tagList[i][0].book_name +"</h3>"+
					"<p class='book-metadata-author'>" +
						"<a onclick=authorDetailHref('"+root+"',"+json.tagList[i][0].authorNum+")>"+json.tagList[i][0].authorName+"</a>" +
					"</p>"+
				"<p class='book-metadata-translator hidden-block'>" +
						"<a class='' href='"+root+"/author.do'></a>" +
					"</p>" +
					"<p class='book-metadata-publisher'>" +
						"<a class='' href='"+root+"/author.do?pun_num="+json.tagList[i][0].pub_num+"'>"+json.tagList[i][0].pub_name+"</a>" +
					"</p>" +
					"<span class='trigger-block hidden-block' onclick='createStarIcon(this.nextElementSibling,"+json.tagList[i][0].star_point+")'></span>" +
					"<div class='content-star-rate'>" +
						"<span class='star-icon-field material-icons'></span>" +
						"<span class='non-star-icon-field material-icons'></span>" +
						"<span class='count-field'>"+json.tagList[i][0].star_count+"명</span>" +
					"</div>" +
					"<pre class='book-metadata-description'>" +json.tagList[i][0].intro+ "</pre>"+
					"<p class='book-metadata-price'>" +
						"<span class='price-rent'>"+json.tagList[i][0].rental_price+"</span>" +
					"</p>" +
					"<p class='book-metadata-price'>" +
						"<span class='price-purchase'>"+json.tagList[i][0].price+"</span>" +
					"</p>" +
					"<p class='book-metadata-price hidden-block free'>" +
						"<span class='price-purchase'>무료</span>" +
					"</p>" +
					"<div class='keyword_bottom_book_hava_key keyword_choice'>" +
						"<ul id='getKeyTag"+i+"'>";
		
		var aaa=document.getElementById("getKeyTag"+i);
		for(j=0;j<json.tagList[i][0].keyword.length;j++){
			aaa.innerHTML+="<li><button type='button' class='bf-button keyword-btn'>"+json.tagList[i][0].keyword[j]+"</button></li>";
		}
		
		abc.innerHTML+="</ul>" +
					"</div>" +	
				"</div>" +
				"</li>";
		
		if(json.tagList[i][0].authorNum==0){
			$(".book-metadata-author").hide();
		}
		
		if(!(json.tagList[i][0].rental_price>0)){
			$(".price-rent").hide();
		}
		
		if(!(json.tagList[i][0].price>0))	$(".price-purchase").hide();
		if(json.tagList[i][0].price==0 && json.tagList[i][0].rental_price==0)	
			$(".free").css("display","block");
		
//		$(".trigger-block").eq(i).attr("onclick","createStarIcon("+$(".trigger-block").eq(i).nextElementSibling+","+json.tagList[i][0].star_point+")");
		
	});
	
	Array.prototype.forEach.call(document.querySelectorAll(".trigger-block"), function(e,i) {
		e.click();
	});
	
}

function display(listCount){
	if(listCount==0){
		$(".keyword_no_search").attr("style","display:none");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").css({
			display:"none"
		});
	}else if(listCount==10000){
//		alert($(".tag-list").text());
		if($(".tag-list").text()==""){
			$(".keyword_not_choice").attr("style","display:table");
			$(".keyword_no_search").attr("style","display:none");
		}else{
			$(".keyword_not_choice").attr("style","display:none");
			$(".keyword_no_search").attr("style","display:table");
		}
		
		$(".keyword_choice").attr("style","display:inline-block");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").attr("style","display:none");
	}else{
		$(".keyword_not_choice").attr("style","display:none");
		$(".keyword_no_search").attr("style","display:none");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").attr("style","display:inline-block");
	}
	
}

function listAjax(root, sendData, pageNumber, firstCate){
	//리스트받아오기
	sendData="tags="+$("input[name=tags]").val()+"&pageNumber="+pageNumber+"&firstCate="+firstCate;
	$.ajax({
		type:"post",
		url: root+"/keywordSearch.do",
		dataType:"json",
		data:sendData,
		success: list,
//		error:function(jqXHR, textStatus, errorThrown ) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
//	    	alert(jqXHR);
//	    	alert(textStatus);
//	    	alert(errorThrown);
//	    }
	});
}
//함수 :  goDetail='location.href="'${root}/detail.do?book_num='+json.tagList[i][0].book_num+"'
function goDetail(book_num){
	var root=$("input[name=rootJS]").val();
	
	location.href=root+"/detail.do?book_num="+book_num;
}
