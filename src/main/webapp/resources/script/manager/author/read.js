/**
 * 
 */

function goUpdate(url){
	location.href=url + $("input[name=href]").val();
}

function goBack(url){
	var value = $("input[name=href]").val();
	location.href=url + value.substring(1);
}
if("${param.searchWord}" != ""){
	$("input[name=href]").val($("input[name=href]").val()+"&searchWord=${param.searchWord}");
}
if("${param.pageNumber}" != ""){
	$("input[name=href]").val($("input[name=href]").val()+"&pageNumber=${param.pageNumber}");
}

var before = location.href;
if(before.indexOf('?') == -1){
	$("input[name=href]").val("&pageNumber=1");
}else{
	$("input[name=href]").val("&"+ before.substring(before.indexOf('?')+1));
}