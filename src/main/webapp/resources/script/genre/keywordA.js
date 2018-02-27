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
            if(cateNum==3){
            	$(fieldset).addClass("fantasyKeyword");
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
				dataType:"json",
				data:sendData+"&pageNumber=1",
				success: list
//				error:function(jqXHR, textStatus, errorThrown ) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
//			    	alert(jqXHR);
//			    	alert(textStatus);
//			    	alert(errorThrown);
//			    }
			});
		}
	});
	
	display(listCount);
});

function list(json){
	$(".tagListCount").text(json.tagListCount);
//	alert(json.tagList[0][0].book_num);
	
	makeList(json);
}

function makeList(json){
	//innerHTML 버전
	var listLength=json.tagList.length;
//	alert(listLength);
	
	var abc=document.getElementById("keywordTagList");
	//함수 :  goDetail='location.href="'${root}/detail.do?book_num='+json.tagList[i][0].book_num+"'
	$(json.tagList).each(function(i,e){
		abc.innerHTML+=
			"<li class='mf-book-item'>" +
				"<div class='mf-book-thumbnail'>" +
					"<div class='mf-book-thumbnail-image' onclick='goDetail("+json.tagList[i][0].book_num+")'>" +
						"<img class='' src='"+json.tagList[i][0].img_path+"' alt='image' />" +
					"</div>" +
				"</div>" +
				"<div class='mf-book-metadata'>" +
					"<h3 class='book-metadata-text' onclick='goDetail("+json.tagList[i][0].book_num+")'>"+json.tagList[i][0].book_name +"</h3>" +
					"<p class='book-metadata-author'>" +
						"<a class='' href='${root}/author.do?authorNum="+json.tagList[i][0].authorNum+"'>"+json.tagList[i][0].authorName+"</a>" +
					"</p>" +
					"<p class='book-metadata-translator hidden-block'>" +
						"<a class='' href='${root}/author.do'></a>" +
					"</p>" +
					"<p class='book-metadata-publisher'>" +
						"<a class='' href='${root}/author.do?pun_num="+json.tagList[i][0].pub_num+"'>"+json.tagList[i][0].pub_name+"</a>" +
					"</p>" +
					"<span class='trigger-block hidden-block' onclick='createStarIcon(this.nextElementSibling,"+json.tagList[i][0].star_point+")'></span>" +
					"<div class='content-star-rate'>" +
						"<span class='star-icon-field material-icons'></span>" +
						"<span class='non-star-icon-field material-icons'></span>" +
						"<span class='count-field'>"+json.tagList[i][0].star_count+"</span>" +
					"</div>" +
					"<pre class='book-metadata-description'>" +json.tagList[i][0].intro+ "</pre>" +
					"<p class='book-metadata-price hidden-block'>" +
						"<span class='price-rent'></span>" +
					"</p>" +
					"<p class='book-metadata-price'>" +
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
	});
	
	
//	//책 정보 뿌려주기
////	alert(json.tagList.length);
//	$(json.tagList).each(function(i,e){
//		var liList=document.createElement("li");
//		$(liList).addClass("mf-book-item");
//		$(".mf-book-list").append(liList);
//		
//		var divFir=document.createElement("div");
//		$(divFir).addClass("mf-book-thumbnail");
//		liList.append(divFir);
//		
//		var divFirDiv=document.createElement("div");
//		$(divFirDiv).addClass("mf-book-thumbnail-image");
//		$(divFirDiv).attr("onclick","goDetail("+json.tagList[i][0].book_num+")");
//		divFir.append(divFirDiv);
//		
//		var divFirDivImg=document.createElement("img");
//		$(divFirDivImg).attr({
//			src:json.tagList[i][0].img_path,
//			alt:"image"
//		});
//		
//		var divSecond=document.createElement("div");
//		$(divSecond).addClass("mf-book-metadata");
//		liList.append(divSecond);
//		
//		var secondH3=document.createElement("h3");
//		$(secondH3).addClass("book-metadata-text");
//		$(secondH3).attr("onclick","goDetail("+json.tagList[i][0].book_num+")");
//		$(secondH3).text(json.tagList[i][0].book_name);
//		divSecond.append(secondH3);
//		
//		//작가이름
//		var secondP1=document.createElement("p");
//		$(secondP1).addClass("book-metadata-author");
//		divSecond.append(secondP1);
//		
//		var secondP1a=document.createElement("a");
//		$(secondP1a).attr("onclick","goAuthor("+json.tagList[i][0].authorNum+")");
//		$(secondP1a).text(json.tagList[i][0].authorName);
//		secondP1.append(secondP1a);
//		
//		//출판사이름
//		var secondP2=document.createElement("p");
//		$(secondP2).addClass("book-metadata-publisher");
//		divSecond.append(secondP2);
//		
//		var secondP2a=document.createElement("a");
//		$(secondP2a).attr("onclick","goAuthor("+json.tagList[i][0].pub_num+")");
//		$(secondP2a).text(json.tagList[i][0].pub_name);
//		secondP2.append(secondP2a);
//		
//		//별점
//		//
	}
//}

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
