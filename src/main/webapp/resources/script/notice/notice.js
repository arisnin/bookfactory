/**
 * 
 */

function readFun(root, num, currentPage){
	var url = root + "/notice/content.do?num=" + num + "&pageNumber=" + currentPage;
	//alert(url);
	
	location.href=url;
}


