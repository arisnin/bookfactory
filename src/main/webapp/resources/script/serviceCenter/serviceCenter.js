/**
 * 
 */

function infoRead(root, num){
	var url = root + "/serviceCenter/information_content1.do?num=" + num;	
	//alert(url);	
	location.href=url;
}

function inquriyRead(root, num) {	
	var url = root + "/serviceCenter/inquriy_answer.do?num=" + num;	
	// alert(url);	
	location.href = url;
}

function questionRead(root, num) {	
	var url = root + "/serviceCenter/manyque_content.do?num=" + num;	
//	alert(url);	
	location.href = url;	
}

function idLoginRead(root, num) {
	var url = root + "/serviceCenter/id_login_content.do?num=" + num;
//	alert(url);
	location.href = url;
}

function payRefundRead(root, num) {
	var url = root + "/serviceCenter/pay_refund_content.do?num=" + num;
//	alert(url);
	location.href = url;
}

function howUseRead(root, num) {
	var url = root + "/serviceCenter/how_use_content.do?num=" + num;
//	alert(url);
	location.href = url;
}


function errorUseRead(root, num) {
	var url = root + "/serviceCenter/error_use_content.do?num=" + num;
//	alert(url);
	location.href = url;
}

function systemUpdateRead(root, num) {
	var url = root + "/serviceCenter/system_update_content.do?num=" + num;
//	alert(url);
	location.href = url;
}

function inquriy(obj){
	if(obj.title.value == ""){
		alert("제목을 입력해주세요.");
		obj.title.focus();
		return false;
	}
	
	if(obj.content.value == ""){
		alert("내용을 입력해주세요.");
		obj.content.focus();
		return false;
	}
	
	if(obj.category.value == "-"){
		alert("질문 유형을 선택해 주세요.");
		obj.title.focus();
		return false;
	}
	
	
}

function booksuggestion(obj){
	//alert("Ok");
	if(obj.category.value == "-"){
		alert("장르를 선택해주세요.");
		obj.category.focus();
		return false;
	}
	
	if(obj.book_name.value == ""){
		alert("도서명을 입력해주세요.");
		obj.book_name.focus();
		return false;
	}
		
	var check = document.querySelector('body > div > div.serviceCenter_book_suggestion > form > div.serviceCenter_book_suggestion_ex > div.serviceCenter_book_suggestion_ex_check > label > input[type="checkbox"]');
	
	if(check.checked==false){
		alert("도서 제안 이용 동의를 체크해주세요.");
		check.focus();
		return false;
	}

}