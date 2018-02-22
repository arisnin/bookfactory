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