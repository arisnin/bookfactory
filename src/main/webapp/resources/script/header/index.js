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

var thirdCategorySet = [100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,200,201,202,203,204,205,300,301,302,303,304,400,401,402,403,404,405,406,500,501,502,600,601,602,700,701,702,703,704,705,800,801,802,803,804,900,901,902,903,904,1000,1001,1002,1003,1004,1005,1006,1007,1008,1100,1101,1102,1103,1104,1105,1200,1201,1202,1203,1300,1301,1302,1303,1400,1401,1402,1403,1500,1600,1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1700,1701,1702,1703,1704,1705,1706,1707,1708,1800,1801,1802,1803,1900,1901,1902,1903,1904,1905,1906,1907,1908,2000,2001,2002,2003,2008,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2200,2201,2202,2203,2204,2300,2301,2302,2400,2401,2402,2403];

/**
 * 
 * @param root
 * @returns
 *
 * @author 염현우(최초작성)
 * 
 * @author 박성호(1차수정)
 * @date 2018. 2. 26.
 * @description 반복되는 로직을 반복문으로 한번에 처리하도록 수정
 */
function headerIndexInit(root) {
	var sourceList = [];
	sourceList[0] = ['소설 전체','한국소설','영미소설','일본소설','중국소설','북유럽소설','독일소설','프랑스소설','기타국가소설','추리/미스터리/스릴러','SF소설','국내판타지소설','해외판타지소설','국내역사소설','해외역사소설','대체역사소설','동양고전문학','서양고전문학'];
	sourceList[1] = ['경영/경제 전체','경영일반','경제일반','마케팅/세일즈','재테크/금융/부동산','CEO/리더십'];
	sourceList[2] = ['인문/사회/역사 전체','인문','정치/사회','예술/문화','역사'];
	sourceList[3] = ['자기계발 전체','성공/삶의자세','기획/창의/리더십','설득/화술/협상','취업/창업','여성','인간관계'];
	sourceList[4] = ['에세이/시 전체','에세이','시'];
	sourceList[5] = ['여행 전체','국내여행','해외여행'];
	sourceList[6] = ['종교 전체','종교일반','가톨릭','기독교(개신교)','불교','기타'];
	sourceList[7] = ['외국어 전체','비즈니스영어','일반영어','제2외국어','어학시험'];
	sourceList[8] = ['과학 전체','과학일반','수학','자연과학','응용과학'];
	sourceList[9] = ['진로/교육/교재 전체','공부법','특목고/자사고','대입 수시','대입 논술','대입 합격수기','진로 탐색','유학/MBA','교재/수험서'];
	sourceList[10] = ['컴퓨터/IT 전체','IT 비즈니스','개발/프로그래밍','컴퓨터/앱 활용','IT자격증','IT 해외원서'];
	sourceList[11] = ['건강/다이어트 전체','다이어트/운동/스포츠','스타일/뷰티','건강'];
	sourceList[12] = ['가정/생활 전체','결혼/임신/출산','육아/자녀교육','취미/요리/기타'];
	sourceList[13] = ['어린이/청소년 전체','유아','어린이','청소년'];
	sourceList[14] = ['해외도서 전체'];
	sourceList[15] = ['잡지 전체','경영/재테크','문학/교양','여성/패션/뷰티','디자인/예술','건강/스포츠','취미/여행/요리','과학/IT','종교','만화','성인(19+)'];
	
	var generalList = document.querySelectorAll(".hw_menu_general .hw_sub_category_wrapper");
	var count = 0;
	Array.prototype.forEach.call(generalList, function(e,i) { 
		insertGeneralMenu(e, count, sourceList[i]);
		count += sourceList[i].length;
	});
	
	sourceList = [];
	sourceList[0] = ['로맨스 단행본 전체','현대물','역사/시대물','판타지물','할리퀸소설','19+','TL소설','섹슈얼 로맨스','하이틴'];
	sourceList[1] = ['로맨스 연재 전체','현대물','역사/시대물','판타지물'];
	sourceList[2] = ['판타지 단행본 전체','정통판타지','퓨전판타지','현대판타지','게임판타지','대체역사물','스포츠물','신무협','전통무협'];
	sourceList[3] = ['판타지 연재 전체','정통판타지','퓨전판타지','현대판타지','무협소설'];
	sourceList[4] = ['만화 전체','국내순정','해외순정','드라마','성인','할리퀸','무협','학원','액션','판타지/SF','스포츠','코믹','공포/추리','만화잡지'];
	sourceList[5] = ['BL 단행본 전체','국내소설','해외소설','국내만화','해외만화'];
	sourceList[6] = ['BL 연재 전체','소설','만화'];
	sourceList[7] = ['라이트노벨 전체','남성향 라노벨','여성향 라노벨','TL'];
	
	var etcList = document.querySelectorAll(".hw_menu_etc .hw_etc_category_wrapper");
	Array.prototype.forEach.call(etcList, function(e,i) { 
		insertEtcMenu(e, count, sourceList[i]);
		count += sourceList[i].length;
	});
	
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
	
}

/**
 * 
 * @param target
 * @param count
 * @param source
 * @returns
 *
 * @author 박성호
 * @date 2018. 2. 25.
 */
function insertGeneralMenu(target, count, source) {
	source.forEach(function (e,i) {
		var li = document.createElement('li');
		var a = document.createElement('a');
		$(li).addClass("hw_sub_category_list");
		$(a).addClass('hw_sub_category_link').attr("href", "#").attr("title", thirdCategorySet[count++]).text(e);
		$(li).append(a);
		$(target).append(li);
	});
}

function insertEtcMenu(target, count, source) {
	source.forEach(function (e,i) {
		var li = document.createElement('li');
		var a = document.createElement('a');
		$(li).addClass("hw_menu_etc_li");
		$(a).addClass('hw_menu_etc_cate').attr("href", "#").attr("title", thirdCategorySet[count++]).text(e);
		$(li).append(a);
		$(target).append(li);
	});
}

$(function(){
	//작동제대로안되서 각 홈, 신간, 이런곳으로 변경
//	//카테고리의 active bar 움직임
//	$(".sub_cate_element").click(function(){
//		$(".sub_cate_element > span").removeClass();
//		$(this).children().addClass("activeBar");
//	});
	
	//대분야 카테고리 클릭시 글자색상이벤트
	var catenum=$("input[name=firstCate]").val();
	if(catenum==1){
		$(".list_general").css("color","#776bce");
	}else if(catenum==2){
		$(".list_romance").css("color","#776bce");
	}else if(catenum==3){
		$(".list_fantasy").css("color","#776bce");
	}else if(catenum==4){
		$(".list_comic").css("color","#776bce");
	}else if(catenum==5){
		$(".list_bl").css("color","#776bce");
	}
	
});