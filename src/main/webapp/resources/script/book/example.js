/**
 * 책 상세보기 페이지에서 미리보기 버튼누를시 보이는 미리보기페이지 - 최정은
 * 세번째버전 텍스트에 따른 페이지이동 - 현재 적용되어있는 스크립트
 */

$(function(){
	//총 height 수
	var height=parseInt($(".example_left_content .textView").css("height").substring(0,4));
	
	//각 페이지마다 height수를 750씩만줘서 페이지 나눔
	var allPage=parseInt(height/750)+2;
	$(".example_left_bottom .total").text(allPage);
	
	var page=1;
	$(".example_left_bottom .current").text(page);
	
	//글자 크기 축소, 확대
	var newFontSize=parseInt($(".example_left_content .textView").css("fontSize").substring(0,2));
	
	$(".example_left_head_button button").eq(0).click(function(){
		newFontSize=newFontSize-1;
		
		if(newFontSize<=24){
			newFontSize=24;
		}
		
		$(".example_left_content .textView").css({
			fontSize:newFontSize+"px"
		});
	});
	
	$(".example_left_head_button button").eq(1).click(function(){
		newFontSize=newFontSize+1;
		
		if(newFontSize>=28){
			newFontSize=28;
		}
		
		$(".example_left_content .textView").css({
			fontSize:newFontSize+"px"
		});
	});
	
	
	//페이지에 따른 이미지나 텍스트 보여주기
	$(".example_left_content button").eq(0).click(function(){
		if(page<=1){
			page=1;
		}else{
			page=page-1;
		}
		
		if(page<=1){
			$(".example_left_content img").css({
				display:"block"
			});
			
			$(".example_left_content .textView").css({
				display:"none",
				fontSize:newFontSize+"px"
			});
			
			$(".example_right_content li:eq(0), .example_right_content li:eq(1)").removeClass();
			$(".example_right_content li").eq(0).addClass("example_active");
		}else{
			$(".example_left_content img").css({
				display:"none"
			});
			
			$(".example_left_content .textView").css({
				display:"block",
				fontSize:newFontSize+"px"
			});
			
			$(".example_right_content li:eq(0), .example_right_content li:eq(1)").removeClass();
			$(".example_right_content li").eq(1).addClass("example_active");
			
			for(var i=0;i<=allPage;i++){
				if(i==page){
					var px=(i-2)*700;
					if(height>=px){
						$(".example_left_content .textView").css({
							top:-px+"px"
						});
						//alert(allPage);
					}
				}
			}
		}
		$(".example_left_bottom .current").text(page);	
		
	});

	
	$(".example_left_content button").eq(1).click(function(){
		if(page>=allPage){
			page=allPage;
		}else{
			page=page+1;
		}
		
		if(page<=1){
			$(".example_left_content img").css({
				display:"block"
			});
			
			$(".example_left_content .textView").css({
				display:"none",
				fontSize:newFontSize+"px"
			});
			
			$(".example_right_content li:eq(0), .example_right_content li:eq(1)").removeClass();
			$(".example_right_content li").eq(0).addClass("example_active");
		}else{
			$(".example_left_content img").css({
				display:"none"
			});
			
			$(".example_left_content .textView").css({
				display:"block",
				fontSize:newFontSize+"px"
			});
			
			$(".example_right_content li:eq(0), .example_right_content li:eq(1)").removeClass();
			$(".example_right_content li").eq(1).addClass("example_active");
			
			for(var i=0;i<=allPage;i++){
				if(i==page){
					var px=(i-2)*700;
					if(height>=px){
						$(".example_left_content .textView").css({
							top:-px+"px"
						});
						//alert(allPage);
					}
				}
			}
			$(".example_left_bottom .current").text(page);
		}
	});
	
	$(".example_right_content li").click(function(){
		if($(this).text()==$(".example_right_content li").eq(0).text()){
			page=1;
			
			$(".example_right_content li:eq(0), .example_right_content li:eq(1)").removeClass();
			$(".example_right_content li").eq(0).addClass("example_active");
			
			$(".example_left_content img").css("display","block");
			$(".example_left_content .textView").css("display","none");
		}else{
			page=2;
			
			$(".example_right_content li:eq(0), .example_right_content li:eq(1)").removeClass();
			$(".example_right_content li").eq(1).addClass("example_active");
			
			$(".example_left_content img").css("display","none");
			$(".example_left_content .textView").css("display","block");
		}
		
		$(".example_left_bottom .current").text(page);
	});
		
});
