/**
 * 작성자 : 최정은
 * 최종수정일 : 2018.01.20
 * 설명 : 책 클릭했을때 나오는 상세페이지에 관련된 자바스크립트입니다.
 */

/**
 * 펼치기/접기 기능 수정
 * @Author	박성호	
 * @Date	2018. 2. 9.
 */
$(document).ready(function(){
	//책소개에서 펼처보기, 접기기능 
	$("#bookIntroAll .bookIntro_con > button").click(function(){
		$(this).prev().toggleClass("collapse");
		// 줄바꿈 처리는 필요하면 비즈니스 로직에서 합니다.
		// 내용이 양이 항상 같지 않기 때문에, 높이를 고정하면 안 됩니다.
		/*if($(this).text().substring(0,4)=="펼쳐보기"){
			$(this).prev().css({
				//나중에 overflow 바꾸는 방식으로
				height:"500"
			});
			
			$(this).html("접기<i class='material-icons'>arrow_drop_up</i>");
			
			var count=$(".readAll").match($(".readAll").replace(/(\n|\r\n)/g, '<br>'));
			alert(count);
			
		}else if($(this).text().substring(0,2)=="접기"){
			$(this).prev().css({
				height:"175"
			});
			$(this).html("펼쳐보기<i class='material-icons'>arrow_drop_down</i>");
			
			var count=$(".readAll").replace(/(\n|\r\n)/g, '<br>');
			alert(count);
		}*/
	
	});
	
	//저자프로필에서의 각각 이름 클릭시 이벤트
	$(".profile_click_event > div:nth-child(1) li > a").click(function(){
		$(".profile_click_event > div:nth-child(1) li > a span").removeClass();
		$(this).children().addClass("activeBar");
	});
	
	//저자프로필의 대표저서에서의 인기순/최신순/평점순 이벤트
	$(".profile_masterpiece > div:nth-child(1) li").click(function(){
		$(".profile_masterpiece > div:nth-child(1) li").removeClass();
		$(this).addClass("activeFont");
	});
});