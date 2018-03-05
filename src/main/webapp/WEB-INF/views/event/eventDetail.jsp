<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/event/event.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$(".sub_cate_element > span").removeClass();
	$(".hw_sub_cate li").eq(3).children("span").addClass("activeBar");
});
</script>
</head>
<body>
	<input name="firstCate" value="${dto.f_num}" type="hidden"/>
	<div class="eventDetail" onclick="javascript:location.href='${root}/detail.do?book_num=${random}&event=yes'">
		${dto.detail}
	</div>
</body>
</html>