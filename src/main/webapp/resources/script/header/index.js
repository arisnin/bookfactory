/**
 * 헤더와 관련된 자바스크립트 - 염현우
 * ++ 자잘한 수정 - 최정은
 */

function goLogin() {
	document.getElementById('hw_login').style.display='block';
}

function goRegister() {
	document.getElementById('hw_register').style.display='block';
}

function allMenuOpen() {
	var allMenu = document.getElementById("hw_all_menu");
	allMenu.style.display = "block";
}

function allMenuClose() {
	var allMenu = document.getElementById("hw_all_menu");
	allMenu.style.display = "none";
}

//$(document).ready(function() {
function headerIndexInit(root) {
	var sosul = ['소설 전체','한국소설','영미소설','일본소설','중국소설','북유럽소설','독일소설','프랑스소설','기타국가소설','추리/미스터리/스릴러',
		'SF소설','국내판타지소설','해외판타지소설','국내역사소설','해외역사소설','대체역사소설','동양고전문학','서양고전문학'];
	
	for(var i=0;i<sosul.length;i++){
		var li = document.createElement('li');
		$(li).addClass("hw_sub_category_list");
		var a = document.createElement('a');
		$(a).addClass('hw_sub_category_link').attr("href", "#");
		$(a).text(sosul[i]);
		$(li).append(a);
		$(".hw_sub_category_wrapper:eq(0)").append(li);
	}
	var economi = ['경영/경제 전체','경영일반','경제일반','마케팅/세일즈','재테크/금융/부동산','CEO/리더십'];
	
	for(var i=0;i<economi.length;i++){
		var li = document.createElement('li');
		var a = document.createElement('a');
		$(li).addClass("hw_sub_category_list");
		$(a).addClass('hw_sub_category_link').attr("href", "#").text(economi[i]);
		$(li).append(a);
		$(".hw_sub_category_wrapper:eq(1)").append(li);
	}
	
	var history = ['인문/사회/역사 전체','인문','정치/사회','예술/문화','역사'];
	history.forEach(function (item,i) {
		var li = document.createElement('li');
		var a = document.createElement('a');
		$(li).addClass("hw_sub_category_list");
		$(a).addClass('hw_sub_category_link').attr("href", "#").text(item[i]);
		$(li).append(a);
		$(".hw_sub_category_wrapper:eq(2)").append(li);
	});
	
	var selfStudy =['자기계발 전체','성공/삶의자세','설득/화술/협상','취업/창업','여성','인간관계'];
	var essay = ['에세이/시 전체','에세이','시'];
	var tour = ['여행 전체','국내여행','해외여행'];
	var religion = ['종교 전체','종교일반','가톨릭','기독교(개신교)','불교','기타'];
	var fLang = ['외국어 전체','비즈니스영어','일반영어','제2외국어','어학시험'];
	var sience = ['과학 전체','과학일반','수학','자연과학','응용과학'];
	var study = ['진로/교육/교재 전체','공부법','특목고/자사고','대입 수시','대입 논술','대입 합격수기','진로 탐색','유학/MBA','교재/수험서'];
	var it = ['컴퓨터/IT 전체','IT 비즈니스','개발/프로그래밍','컴퓨터/앱 활용','IT자격증','IT해외원서'];
	var health =['건강/다이어트 전체','다이어트/운동/스포츠','스타일/뷰티','건강'];
	var life = ['가정/생활 전체','결혼/임신/출산','육아/자녀교육','취미/요리/기타'];
	var child = ['어린이/청소년 전체','유아','어린이','청소년'];
	var foreign =['해외도서 전체'];
	var magazine = ['잡지 전체','경영/재테크','문학/교양','여성/패션/뷰티','디자인/예술','건강/스포츠','취미/여행/요리','과학/IT','종교','만화','성인(19+)'];

	
	$(".hw_menu_title").mouseover(function(e) {
		$(".hw_sub_category_wrapper").css("display", "none");
		$(this).parent().find(".hw_sub_category_wrapper").css("display", "block");
		e.preventDefault();
	});
	
	//전체보기를 누르고 마우스를 가져다댔을때 이미지바뀌는것
	$(".all_menu_btn").hover(function(){
		$(".all_menu_icon").attr("src",root + "/img/index/213111-16_white.png");
	},function(){
		$(".all_menu_icon").attr("src",root + "/img/index/213111_gray.png");
	});
	
	//전체분야를 눌렀을때 로그인화면이나 회원가입화면을 누를시 전체분야가 꺼지는 제이쿼리
	$(".hw_top_content_right_login,.hw_top_content_right_register").click(function(){
		if($("#hw_all_menu").css("display")=="block"){
			$("#hw_all_menu").css("display","none");
		}
	});
	
	//카테고리의 active bar 움직임
	$(".sub_cate_element").click(function(){
		$(".sub_cate_element > span").removeClass();
		$(this).children().addClass("activeBar");
	});
	
}