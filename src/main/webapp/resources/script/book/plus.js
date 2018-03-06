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
		var str=$(this).text();
//		alert(str);
		if(str.substr(0,4)=='펼쳐보기'){
			$(this).html($(this).html().replace('펼쳐보기','접기'));
			$(this).prev().removeClass("collapse");
		}
		
		if(str.substr(0,2)=='접기'){
			$(this).html($(this).html().replace('접기','펼쳐보기'));
			$(this).prev().addClass("collapse");
		}
	});
	
	//저자프로필에서의 각각 이름 클릭시 이벤트
	$(".profile_click_event > div:nth-child(1) li:eq(0) > a").click(function(){
		$(".profile_click_event > div:nth-child(1) li > a span").removeClass();
		$(this).children().addClass("activeBar");
		$(".illo, .trans").css("display","none");
		$(".aut").css("display","block");
	});
	
	$(".profile_click_event > div:nth-child(1) li:eq(1) > a").click(function(){
		$(".profile_click_event > div:nth-child(1) li > a span").removeClass();
		$(this).children().addClass("activeBar");
		$(".aut, .trans").css("display","none");
		$(".illo").css("display","block");
	});
	
	$(".profile_click_event > div:nth-child(1) li:eq(2) > a").click(function(){
		$(".profile_click_event > div:nth-child(1) li > a span").removeClass();
		$(this).children().addClass("activeBar");
		$(".aut, .illo").css("display","none");
		$(".trans").css("display","block");

	});
	
//	//저자프로필의 대표저서에서의 인기순/최신순/평점순 이벤트
//	$(".profile_masterpiece > div:nth-child(1) li").click(function(){
//		$(".profile_masterpiece > div:nth-child(1) li").removeClass();
//		$(this).addClass("activeFont");
//	});
	
//	//홈, 신간, 베스트셀러 숨기는 이벤트
//	$(".hw_sub_wrap").hide();
	
	//실험용
//	$(".profile_ex > .author").click(function(){
//		var test=$("input[name=activeAuthor]").val();
//		alert(test);
//	});
	
});

function profilUpdate(root, author_num){
	window.open(root+"/authorProfilUpdate.do?author_num="+author_num, 'update', 'top=100px, left=100px, height=500px, width=400px');
}

