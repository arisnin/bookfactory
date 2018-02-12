/**
 * 책 상세보기 페이지에서 미리보기 버튼누를시 보이는 미리보기페이지 - 최정은
	두번째버전 - 스크롤바있는거
 */

$(function(){
	//스크롤바 효과
	$('.textView').thinScrollbar({
		scrollbarcolor : '#eee', // 스크롤바 배경색을 결정 합니다. 헥사코드로 작성해야 하며 기본값은 #ddd 입니다.
	    slidercolor : '#555' // 스크롤바 색을 결정 합니다. 헥사코드로 작성해야 하며 기본값은 #555 입니다.
	});
	
	//기본페이지작업
	var count=1;
	$(".index-of-page > .current").text(count);
	$(".index-of-page > .total").text($(".example_right_content li").length);
	
	var test="abcabcabcabc abcabcabc abcabcabc abcabcabc abcabc abcabcabc abcabcabc abcabcabca bcabcabca bcabcabcab cabcabcabc abcabca bcabcabc abcabcabc abcab cabcabcab cabca bcabcabca bca  bcabcabca bcabcab cabcabcabca bcabcabc abcabcabca bcabc abcabcab cabcabc abcabcabcab cab cabcabcabcab cabcab cabcabcab cabcabca bcabcabca bcabca bcabcabcabc abcabcabc abcabcabc abcabcabcab cabcabcabcabcabcabcabcabcabcabcabcabcabcabca bcabcabcab cabcabcabcabcabca bcabcabcab cabcabcabcab cabcabcabcabc";
	
	//목록보기 클릭시 이벤트
	$(".example_right_content li").click(function(){
		$(".example_right_content li").removeClass("example_active");
		$(this).addClass("example_active");
		
		for(var i=0;i<$(".example_right_content li").length;i++){
			if($(this).text()==$(".example_right_content li").eq(i).text()){
				count=i+1;
				
				if(count==1){
					$(".example_left_content img").css({
						display:"block",
					});
					$(".textView").css("display","none");
				}else{
					$(".example_left_content img").css({
						display:"none"
					});
					
					$(".textView").css({
						display:"block",
						overflowY:"scroll"
					});
					
					$(".textView").text(test);
				}
			}
		}
		
		$(".index-of-page > .current").text(count);
		
		if($(".index-of-page > .current").text()>=$(".index-of-page > .total").text()){
			($(".index-of-page > .current").text($(".example_right_content li").length));
		}
		
	});
	
	//왼쪽 오른쪽버튼 누를시 이벤트
	$(".example_left_content button").eq(0).click(function(){
		count=count-1;
		$(".index-of-page > .current").text(count);
		
		if(count<=1){
			count=1;
			$(".index-of-page > .current").text(count);
		}
		
		for(var i=0;i<$(".example_right_content li").length;i++){
			if(count==i){
				$(".example_right_content li").removeClass("example_active");
				$(".example_right_content li").eq(i-1).addClass("example_active");
				
				if(1>=count){
					$(".example_left_content img").css({
						display:"block",
					});
					$(".textView").css("display","none");
	
				}else{
					$(".example_left_content img").css({
						display:"none"
					});
					
					$(".textView").css({
						display:"block",
						overflowY:"scroll"
					});
					
					$(".textView").text(test);
				
				}
			}
		}
	});
	
	$(".example_left_content button").eq(1).click(function(){
		count=count+1;
		$(".index-of-page > .current").text(count);
		
		if(count>=$(".index-of-page > .total").text()){
			count=$(".example_right_content li").length;
			$(".index-of-page > .current").text(count);
		}
		
		for(var i=0;i<=$(".example_right_content li").length;i++){
			if(i==count){
				$(".example_right_content li").removeClass("example_active");
				$(".example_right_content li").eq(i-1).addClass("example_active");
				
				if(1>=count){
					$(".example_left_content img").css({
						display:"block",
					});
					$(".textView").css("display","none");

				}else{
					$(".example_left_content img").css({
						display:"none"
					});
					
					$(".textView").css({
						display:"block",
						overflowY:"scroll"
					});
					
					$(".textView").text(test);
				
				}
			}
		}
	});
	
	//글자 축소 확대
	$(".example_left_head_button > button").click(function(){
		var fontSize=parseInt($(".textView").css("fontSize").substring(0,2));
		var size = parseInt($(this).val()) + fontSize;
		$(".textView").css("fontSize", size+"px");
		
		if($(this).val()=="-5"){
			
		}else if($(this).val()=="5"){
			
		}
	});
	
});
