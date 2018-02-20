/**
 * 염현우 
 * index.js에서 페이지 이동시 메뉴 자동선택
 * 2018-01-31
 */

/*pname이 없을경우*/
/*var content = $('input[name=pname]').val();
if(content == ""){
	content = '/manager/book/book_insert.jsp';
}*/

var content = document.location.href;
var num = content.lastIndexOf("/");
var num2 = content.indexOf("?");
if(num2 != -1){
	content = content.substring(num, num2);
}else{
	content = content.substring(num);	
}
/* 
 * 로딩시 자동으로 메뉴 선택이 된다 
 * 넣는 순서 ['페이지 주소',큰메뉴순서,작은메뉴순서]
 * 메뉴순서는 0부터 시작된다
 * pages는 왼쪽 메뉴만 넣어준다 다른 이동은 otherPage에 추가한다.
 * */



var pages = [ 
		['/bookInsert.do',0,0],['/bookSearch.do',0,1],['/bookCategory.do',0,2],
		['/publisherInsert.do',1,0],['/publisherSearch.do',1,1],
		['/authorInsert.do',2,0],['/authorSearch.do',2,1],['/authorUpdate.do',2,2],
		['/memberMember.do',3,0],['/memberPay.do',3,1],
		['/reviewReview.do',4,1],
		['/boardContact.do',5,0],['/boardInsert.do',5,1],['/boardList.do',5,2],['/boardNoticeInsert.do',5,3],
		['/statPreference.do',6,0],['/statTotal.do',6,1],['/statSales.do',6,2],
		['/auto.do',7,0]
	];
/*
 * 왼쪽 메뉴 외에 이동할 페이지를 넣어준다. 형식은 ['주소',해당큰메뉴,해당작은메뉴]
 * */

var otherPage = [
		['/bookRead.do',0,1],['/bookUpdate.do',0,1],
		['/publisherUpdate.do',1,1],
		['/authorUpdateRead.do',2,2],
		['/memberRegister.do',3,0],['/memberPayDetail.do',3,1],
		['/reviewReport.do',4,1],
		['/boardReply.do',5,0],['/boardDelete.do',5,2],['/boardUpdate.do',5,2]
	]

/*왼쪽 메뉴 이벤트 걸어주고 href값도 세팅한다*/
var menus = $('#hw_menuWrapper > .panel');
for(var i=0;i<pages.length;i++){
	var page = pages[i];
	addClickEvent(page);
	//Left Menu에 링크 걸어준다
	var url = "/bookFactory/manager" + page[0];
	menus.eq(page[1]).find(' a').eq(page[2]).attr("href", url);
}


for(var i=0;i<otherPage.length;i++){
	if(content == otherPage[i][0]){
		addClickEvent(otherPage[i]);
	}
}

function addClickEvent(page){
	/*넘어오는 페이지에 따라 구분하여 메뉴 활성화 한다.*/
	if(content == page[0]){
		var button = $("#hw_menuWrapper > button").eq(page[1]);
		$(button).trigger('click').next().find('a').eq(page[2]).addClass('active');
	}
}

/*이 함수를 사용하여 링크 걸어주면된다*/
/*function linkA(pname) {
	if(pname == "#"){
		alert('준비중');
		return;
	}
	var url = '/bookFactory/index.jsp?pname='+pname;
	location.href=url;
}*/
