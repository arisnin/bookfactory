/*************
name : thinScrollbar.js
************/

(function($){

	var opt,ele;

	var scroll_w = 17; //브라우저 스크롤바 가로 길이
	var container_w = 0; //컨테이너 가로
	var container_h = 0; //컨테이너 높이
	var padding_r=0; //패딩오른쪽

	var tmphtml=""; //콘텐츠 임시 저장

	var scrollbarcolor = "#ddd";
	var slidercolor = "gray";

	var slider_h; //스크롤바 슬라이더 크기
	var slider_h_padding = 20; //스크롤바 슬라이더 크기(여분)




	$.fn.thinScrollbar = function(option){
		ele = $(this);
		if(typeof option != "undefined") {
			
			opt = option;	

			if(opt.scrollbarcolor) scrollbarcolor=opt.scrollbarcolor;
			if(opt.slidercolor) slidercolor=opt.slidercolor;
		}

		


		//컨테이너 생성
		container_w = $(ele).width();
		container_h = $(ele).height();
	
		padding_r = $(ele).css('padding-right').replace("px","");

		
		container_w = parseInt(container_w) + parseInt(scroll_w);


		tmphtml = $(ele).html();


		$(ele).empty();
		$(ele).css('overflow','hidden');

		$(ele).html("<div class='container' style='overflow-x:hidden; overflow-y:scroll; width: "+container_w+"px; height:"+container_h+"px;'>"+tmphtml+"</div>");

			
		$(ele).css('position','relative');

		$(ele).append("<div class='scrollbar' style='position:absolute; top:0px; right:0px; z-index:1; height:100%; width:5px; background:"+scrollbarcolor+"; top:0;'><div class='slider' style='position:absolute; width:100%; background:"+slidercolor+"; right:0; z-index:2; border-radius:5px;'></div></div>");


		if(padding_r>0) $(ele).children('.container').css('padding-right',padding_r+'px');
		
		
		

		//스크롤바 생성
		scrollbar_w = $(ele).children('.scrollbar').width();

		if(scrollbar_w>0){
			 $(ele).children('.container').width(($(ele).children('.container').width()-scrollbar_w)+'px');
		}

		
		slider_h = container_h*(container_h/ $(ele).children('.container')[0].scrollHeight)+slider_h_padding;

		
		$(ele).find('.slider').height(slider_h);

		



		//마우스 휠 동작

		$(ele).children('.container').scroll(function(e){

			container_scroll_top = $(this).scrollTop();
			
			rate = container_scroll_top/$(ele).children('.container')[0].scrollHeight;

			$(ele).find('.slider').css('top',container_h*rate+'px');

		 });


		

		//스크롤바 슬라이더 동작
		$(ele).find('.slider').mousedown(function(e) {
			
			action = false;
			first = e.screenY;

			if(e.which==1) action = true;
			
				a = parseInt($(ele).find('.slider').css('top').replace("px",""));
				if(!$.isNumeric(a)) a=0;
			

				$("html,body").mousemove(function(e2){
					if(action==true){

						movepx = a+(e2.screenY-first);

						if(movepx<0 || movepx>($(ele).children('.scrollbar').height()-(slider_h))) return false;

						
						$(ele).find('.slider').css('top',movepx+'px');

						rate2 = movepx/($(ele).children('.scrollbar').height()-(slider_h));
						

						$(ele).children('.container').scrollTop($(ele).children('.scrollbar').height()*rate2);
						
						
					
					}
				});


			 $("html,body").mouseup(function() {
				action = false;
			 });


		});
			
		
		// 콘텐츠 드래그 금지
		$(ele).children('.container').bind('dragstart',function(){return false;});	

		
	}
})(jQuery);