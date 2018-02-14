/**
 * 연재페이지의 책 상세보기 제이쿼리 - 최정은
 */

//대여하기/구매하기버튼
var dataRP="";
function rentalOrPurchase(data){
	dataRP=data;
	if(dataRP=="rental"){
		$(".bookSerialChoice_division >div").eq(0).click(function(){
			$(".bookSerialChoice_division >div").eq(1).css({
				backgroundColor: "#eaeaea",
				borderBottom: "1px double #d1d5d9"
			});
			
			$(".bookSerialChoice_division >div").eq(0).css({
				backgroundColor: "white",
				borderBottom: "1px double white"
			});
			
			$(".bookSerialChoice_list_left > div:last-child >span:last-child").css("display","inline");
		});
	}else{
		$(".bookSerialChoice_division >div").eq(1).click(function(){
			$(".bookSerialChoice_division >div").eq(0).css({
				backgroundColor: "#eaeaea",
				borderBottom: "1px double #d1d5d9"
			});
			
			$(".bookSerialChoice_division >div").eq(1).css({
				backgroundColor: "white",
				borderBottom: "1px double white"
			});
			
			$(".bookSerialChoice_list_left > div:last-child >span:last-child").css("display","none");
		});
	}
}

$(function(){
	var totalCount=0;
	var totalCash=0;
	
	//전체선택
	$(".bookSerialChoice_button_left").on("click","input[type=checkbox]",function(){
		if($(".bookSerialChoice_button_left input[type=checkbox]").prop("checked") ==false){
			$(".bookSerialChoice_list .bf-custom-checkbox input[type=checkbox]").prop("checked", false);
			$(".bookSerialChoice_list li").css("backgroundColor","white");
			
			totalCount=0;
			totalCash=0;
			
		}else{
			$(".bookSerialChoice_list .bf-custom-checkbox input[type=checkbox]").prop("checked", true);
			$(".bookSerialChoice_list li").css("backgroundColor","#F3F0FA");
			
			var listCount=$(".bookSerialChoice_list li").length;
			
			totalCount=listCount;
			totalCash=0;
			
			for(var i=0;i<listCount;i++){
				var cash=parseInt($(".bookSerialChoice_list_left_cash").text());
				totalCash=totalCash+cash;
			}
		}
		
		$(".list_choice_count").text(totalCount);
		$(".list_choice_cash").text(totalCash);
	});
	
	//신간보기 버튼
	$(".bookSerialChoice_button_left").on("click","button",function(){
		if($(".bookSerialChoice_button_left .bf-button span").eq(1).text()=="신간부터"){
	    	  $(".bookSerialChoice_button_left .bf-button span").eq(1).text("1권부터");
	     }else{
	    	  $(".bookSerialChoice_button_left .bf-button span").eq(1).text("신간부터");
	     }
		
		var list, i, switching, b, shouldSwitch, dir, switchcount = 0;
		  list = document.getElementById("bookSerialChoice_list_sort");
		  switching = true;
		  // Set the sorting direction to ascending:
		  dir = "asc"; 
		  // Make a loop that will continue until no switching has been done:
		  while (switching) {
		    // Start by saying: no switching is done:
		    switching = false;
		    b = list.getElementsByTagName("LI");
		    // Loop through all list-items:
		    for (i = 0; i < (b.length - 1); i++) {
		      // Start by saying there should be no switching:
		      shouldSwitch = false;
		      /* Check if the next item should switch place with the current item,
		      based on the sorting direction (asc or desc): */
		      if (dir == "asc") {
		        if (b[i].innerHTML.toLowerCase() > b[i + 1].innerHTML.toLowerCase()) {
		          /* If next item is alphabetically lower than current item,
		          mark as a switch and break the loop: */
		          shouldSwitch= true;
		          break;
		        }
		      } else if (dir == "desc") {
		        if (b[i].innerHTML.toLowerCase() < b[i + 1].innerHTML.toLowerCase()) {
		          /* If next item is alphabetically higher than current item,
		          mark as a switch and break the loop: */
		          shouldSwitch= true;
		          break;
		        }
		      }
		    }
		    if (shouldSwitch) {
		      /* If a switch has been marked, make the switch
		      and mark that a switch has been done: */
		      b[i].parentNode.insertBefore(b[i + 1], b[i]);
		      switching = true;
		      // Each time a switch is done, increase switchcount by 1:
		      switchcount ++;
		      
		    } else {
		      /* If no switching has been done AND the direction is "asc",
		      set the direction to "desc" and run the while loop again. */
		      if (switchcount == 0 && dir == "asc") {
		        dir = "desc";
		        switching = true;
		      }
		    }
		  }
	});
	
	//더보기 버튼
	$(".bookSerialChoice_list_more").on("click","button",function(){
		//책 등록된수만큼 돌려서 붙이면됨 그리고 버튼은 사라짐
		
		for(var i=0;i<5;i++){
			var li=document.createElement("li");
			$("#bookSerialChoice_list_sort").append(li);
			
			var label=document.createElement("label");
			$(label).addClass("bf-custom-checkbox");
			li.append(label);
			
			var labelCheck=document.createElement("input");
			$(labelCheck).attr("type","checkbox");
			label.append(labelCheck);
			
			var labelSpan=document.createElement("span");
			$(labelSpan).addClass("all-mark");
			label.append(labelSpan);
			
			var divParent=document.createElement("div");
			$(divParent).addClass("bookSerialChoice_list_left");
			li.append(divParent);
			
			var divFirst=document.createElement("div");
			$(divFirst).text("상수리나무 아래 "+(i+3)+"화");
			divParent.append(divFirst);
			
			var divSecon=document.createElement("div");
			$(divSecon).text("2017.10.13일 | 약 3.3천자");
			divParent.append(divSecon);
			
			var divThird=document.createElement("div");
			divParent.append(divThird);
			
			var divThirdSpanFirst=document.createElement("span");
			$(divThirdSpanFirst).text((i+1)*200);
			divThird.append(divThirdSpanFirst);
			
			var divThirdSpanLast=document.createElement("span");
			$(divThirdSpanLast).text("원");
			divThird.append(divThirdSpanLast);
			
			if(dataRP=="rental"){
				var divThirdSpanRealLast=document.createElement("span");
				$(divThirdSpanRealLast).text("1일대여");
				divThird.append(divThirdSpanRealLast);
			}else{
				var divThirdSpanRealLast=document.createElement("span");
				divThird.append(divThirdSpanRealLast);
			}
			
			var divLast=document.createElement("div");
			$(divLast).addClass("bookSerialChoice_list_right");
			li.append(divLast);
			
			var divLastButton=document.createElement("button");
			$(divLastButton).addClass("bf-button");
			divLast.append(divLastButton);
			
			var buttonSpanFirst=document.createElement("span");
			$(buttonSpanFirst).addClass("icon-book-open");
			divLastButton.append(buttonSpanFirst);
			
			var buttonSpanSecond=document.createElement("span");
			$(buttonSpanSecond).text("구매");
			divLastButton.append(buttonSpanSecond);
			
		}
		
		//한개씩 선택
		$(".bookSerialChoice_list .bf-custom-checkbox").on("click","input[type='checkbox']",function(){
			if($(this).prop("checked")==false){
				$(this).parents("li").css("backgroundColor","white");
				totalCount=totalCount-1;
				var money=parseInt($(".bookSerialChoice_list_left div").eq(2).find("span").first().text());
				totalCash=totalCash-money;
			}else{
				$(this).parents("li").css("backgroundColor","#F3F0FA");
				totalCount=totalCount+1;
				var money=parseInt($(".bookSerialChoice_list_left div").eq(2).find("span").first().text());
				totalCash=totalCash+money;
			}
			
			$(".list_choice_count").text(totalCount);
			$(".list_choice_cash").text(totalCash);
			
			$(".bookSerialChoice_list input[type='checkbox']").each(function(){
				if($(this).prop("checked") == false){
					$(".bookSerialChoice_button_left input[type='checkbox']").prop("checked", false);
					$(this).css("backgroundColor","white");
				}
			});
		});
		
		$(".bookSerialChoice_list_more").css("display","none");
	});
	
	//한개씩 선택
	$(".bookSerialChoice_list .bf-custom-checkbox").on("click","input[type='checkbox']",function(){
		if($(this).prop("checked")==false){
			$(this).parents("li").css("backgroundColor","white");
			totalCount=totalCount-1;
			var money=parseInt($(".bookSerialChoice_list_left div").eq(2).find("span").first().text());
			totalCash=totalCash-money;
		}else{
			$(this).parents("li").css("backgroundColor","#F3F0FA");
			totalCount=totalCount+1;
			var money=parseInt($(".bookSerialChoice_list_left div").eq(2).find("span").first().text());
			totalCash=totalCash+money;
		}
		
		$(".list_choice_count").text(totalCount);
		$(".list_choice_cash").text(totalCash);
		
		$(".bookSerialChoice_list input[type='checkbox']").each(function(){
			if($(this).prop("checked") == false){
				$(".bookSerialChoice_button_left input[type='checkbox']").prop("checked", false);
				$(this).css("backgroundColor","white");
			}
		});
	});

	
});