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

