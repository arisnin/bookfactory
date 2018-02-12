/**
 * 키워드 페이지 관련 자바스크립트 - 최정은
 * 
 * 문제점 : 태그를 선택하고 다시클릭해 선택해제시 이벤트가 안됨.
 * 태그를 아무것도 선택하지않으면 선택하세요 이미지가 떠야하는데 안뜨고 선이 남아있음. - 에이잭스붙여봐야 알듯
 * 태그 최대 5개 선택시 태그선택한것 지우고 다시 다른태그추가하려고 하면 안됨
 * 전체해제 버튼 누를시 키워드 태그 선택이안됨.
 * 
 */

$(function(){
	//전체해제 버튼
	$(".keyword_top_head > button").click(function(){
		$(".keyword_top_list_button li").css({
			backgroundColor: "#f8f7ff"
		});
		$(".keyword_choice ul").remove();
		$(".keyword_not_choice").attr("style","display:table");
		$(".keyword_top_list_button li").off("click");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").css({
			display:"none"
		});
		$(".keyword_top_list_button li").on("click");
	});
	
	var maxTags=5;
	
	//키워드선택하기
	$(".keyword_top_list_button li").click(function(){
		maxTags=maxTags-1;
		
		if(maxTags==0){	
			//alert("2131 " +maxTags);
			//임시로 해놓음 데이터없을시 뿌려주는 화면
			$(".keyword_no_search").attr("style","display:table");
			$(".keyword_top_list_button li").off("click");
			$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").css({
				display:"none"
			});
			
		}else{
			//키워드 선택하면 밑에 책리스트 뿌려주기 
			$(".keyword_bottom_head, .keyword_bottom_book_list").css({
				display:"block"
			});
		}

		$(this).css({
			backgroundColor:"#fff"
		});
		
		$(".keyword_not_choice").attr("style","display:none");
		$(".keyword_choice").attr("style","display:block");
		
		var key=document.createElement("li");
		
		var button=document.createElement("button");
		button.innerHTML=$(this).children().text();
		key.append(button);
		
		var span=document.createElement("span");
		span.innerHTML="x";
		button.append(span);
		
		$(span).addClass("button_x");
		
		$(".keyword_choice ul").append(key);
		
		//선택된 키워드 x표시눌렀을때 사라지는 액션
		$(".keyword_choice ul").on("click", "li", function(){
			maxTags=maxTags+1;
			var txt=$(this).text();
			
			$(".keyword_top_list_button li").each(function(i, e){
				var child=$(".keyword_top_list_button li").eq(i).children().text()+"x";
				if(txt==child){
					$(this).css({
						backgroundColor:"#f8f7ff"
					});
				}
			});
			$(this).remove();
			
			if(maxTags>0){
				//alert("22 "+ maxTags);
				$(".keyword_no_search").attr("style","display:none");
				$(".keyword_top_list_button li").on("click");
			}else if(maxTags==5){
				$(".keyword_not_choice").attr("style","display:table");
				$(".keyword_choice").attr("style","display:none");
			}
		});
	});
//	}, function(){
//		alert("Ttt");
////		maxTags=maxTags+1;
////		$(this).css({
////			backgroundColor:"#f8f7ff"
////		});
////		
////		var text=$(this).children().text()+"x";
////		
////		$(".keyword_choice li").each(function(i, e){
////			//alert($(this).children().text());
////			if(text==$(this).children().text()){
////				$(this).remove();
////			}
////		});		
////		$(this).on("click");
////		
////		if(maxTags>0){
////			//alert("22 "+ maxTags);
////			$(".keyword_no_search").attr("style","display:none");
////			$(".keyword_top_list_button li").on("click");
////		}else if(maxTags==5){
////			$(".keyword_not_choice").attr("style","display:table");
////			$(".keyword_choice").attr("style","display:none");
////		}
//	});	
		
//		//돔을.. 왜해놨을까.. 
//		//몇건의작품이있습니다 뷰 뿌려주기
//		var divCount=document.createElement("div");
//		$(".keyword_bottom_head").append(divCount);
//		
//		var spanCount=document.createElement("span");
//		spanCount.innerHTML="144";
//		divCount.append(spanCount);
//		
//		var spanText=document.createElement("span");
//		spanText.innerHTML="건의 작품이 있습니다.";
//		divCount.append(spanText);
//		
//		//인기순 평점순 최신순 뿌려주기
//		var divActive=document.createElement("div");
//		$(divActive).addClass("keyword_bottom_view_choice");
//		$(".keyword_bottom_head").append(divActive);
//		
//		var olActive=document.createElement("ol");
//		divActive.append(olActive);
//		
//		var liActive1=document.createElement("li");
//		liActive1.innerHTML="리뷰많은순";
//		olActive.append(liActive1);
//		
//		var liActive2=document.createElement("li");
//		liActive2.innerHTML="인기순";
//		olActive.append(liActive2);
//		
//		var liActive3=document.createElement("li");
//		liActive3.innerHTML="최신순";
//		$(liActive3).addClass("activeFont");
//		olActive.append(liActive3);
//		
//		//책 정보 뿌려주기
//		var ulList=document.createElement("ul");
//		$(".keyword_bottom_book_list").append(ulList);
//		
//		for(var i=0;i<5;i++){
//			var liList=document.createElement("li");
//			ulList.append(liList);
//			
//			var divList=document.createElement("div");
//			$(divList).addClass("keyword_bottom_book");
//			liList.append(divList);
//			
//			var divImg=document.createElement("div");
//			divList.append(divImg);
//			
//			var aImg=document.createElement("a");
//			divImg.append(aImg);
//			
//			var imgImg=document.createElement("img");
//			aImg.append(imgImg);
//			
//			var divCon=document.createElement("div");
//			$(divCon).addClass("keyword_bottom_book_content");
//			divList.append(divCon);
//			
//			var divTitle=document.createElement("div");
//			divCon.append(divTitle);
//			
//			var aTitle=document.createElement("a");
//			aTitle.innerHTML="책 제목";
//			divTitle.append(aTitle);
//			
//			var divStar=document.createElement("div");
//			$(divStar).addClass("keyword_bottom_book_star");
//			divCon.append(divStar);
//			
//			var pStar1=document.createElement("p");
//			$(pStar1).addClass("content-star-rate");
//			divStar.append(pStar1);
//			
//			var spanStar1=document.createElement("span");
//			$(spanStar1).addClass("star-icon-field material-icons");
//			pStar1.append(spanStar1);
//			
//			var spanStar2=document.createElement("span");
//			$(spanStar2).addClass("non-star-icon-field material-icons");
//			pStar1.append(spanStar2);
//			
//			var spanStar3=document.createElement("span");
//			$(spanStar3).addClass("count-field");
//			spanStar3.innerHTML="100명"
//			pStar1.append(spanStar3);
//			
//			var pStar2=document.createElement("p");
//			divStar.append(pStar2);
//			
//			var aP1=document.createElement("a");
//			aP1.innerHTML="작가";
//			pStar2.append(aP1);
//			
//			var aP2=document.createElement("a");
//			aP2.innerHTML="출판사";
//			pStar2.append(aP2);
//			
//			var divIntro=document.createElement("div");
//			$(divIntro).addClass("keyword_bottom_book_intro");
//			divCon.append(divIntro);
//			
//			var aDivIntro=document.createElement("a");
//			aDivIntro.innerHTML="책소개 블라블라블라책소개 블라블라블라책소개 블라블라블라책소개 블라블라블라 책소개 블라블라블라책소개 블라블라블라책소개 블라블라블라책소개 블라블라블라 책소개 블라블라블라책소개 블라블라블라";
//			divIntro.append(aDivIntro);
//			
//			var divBuy=document.createElement("div");
//			$(divBuy).addClass("keyword_bottom_book_buy");
//			divCon.append(divBuy);
//			
//			var spanDivBuy1=document.createElement("span");
//			spanDivBuy1.innerHTML="구매";
//			divBuy.append(spanDivBuy1);
//			
//			var spanDivBuy2=document.createElement("span");
//			spanDivBuy2.innerHTML="가격";
//			divBuy.append(spanDivBuy2);
//			
//			var divKey=document.createElement("div");
//			$(divKey).addClass("keyword_bottom_book_hava_key");
//			divCon.append(divKey);
//			
//			var olKey=document.createElement("ol");
//			divKey.append(olKey);
//			
//			for(var j=0;j<20;j++){
//				var liKey=document.createElement("li");
//				olKey.append(liKey);
//				
//				var buttonKey=document.createElement("button");
//				buttonKey.innerHTML="#키워드"+j;
//				liKey.append(buttonKey);
//			}
//		}
	
});