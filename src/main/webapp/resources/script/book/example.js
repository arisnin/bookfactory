/**
 * 책 상세보기 페이지에서 미리보기 버튼누를시 보이는 미리보기페이지 - 최정은
 * 초기버전
 */

$(function(){	
	//기본페이지작업
	var count=1;
	$(".index-of-page > .current").text(count);
	$(".index-of-page > .total").text($(".example_right_content li").length);
	
	//목록보기 클릭시 이벤트
	$(".example_right_content li").click(function(){
		$(".example_right_content li").removeClass("example_active");
		$(this).addClass("example_active");
		
		for(var i=0;i<$(".example_right_content li").length;i++){
			if($(this).text()==$(".example_right_content li").eq(i).text()){
				count=i+1;
				
				var root=$(".example_left_content > div > div > img").attr("src").substring(0,10);
				
				$(".example_left_content > div > div > img").attr({
					src: root+"img/example/example"+(i+1)+".PNG"
				});
				
				if(count>=$(".example_right_content li").length){
					$(".example_left_content > div > div > img").attr({
						src: root+"img/example/example"+($(".example_right_content li").length+1)+".PNG"
					});
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
			if(i==count){
				$(".example_right_content li").removeClass("example_active");
				$(".example_right_content li").eq(count-1).addClass("example_active");
				
				var root=$(".example_left_content > div > div > img").attr("src").substring(0,10);
				
				if(count<=1){
					$(".example_left_content > div > div > img").attr({
						src: root+"img/example/example"+(1)+".PNG"
					});
				}else{
					$(".example_left_content > div > div > img").attr({
						src: root+"img/example/example"+(i)+".PNG"
					});
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
				$(".example_right_content li").eq(count-1).addClass("example_active");
				
				var root=$(".example_left_content > div > div > img").attr("src").substring(0,10);
				
				if(count>=$(".example_right_content li").length){
					$(".example_left_content > div > div > img").attr({
						src: root+"img/example/example"+($(".example_right_content li").length+1)+".PNG"
					});
				}else{
					$(".example_left_content > div > div > img").attr({
						src: root+"img/example/example"+(i+1)+".PNG"
					});
				}
			}
		}
	});
	
});