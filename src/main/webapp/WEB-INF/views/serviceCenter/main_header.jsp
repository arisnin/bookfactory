<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="/bookFactory/css/header/index.css">
<link href="${root}/css/serviceCenter/main.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css"
	rel="stylesheet" />
	
<title>북팩토리</title>

</head>
<body>

	<div class="service_header">
			<div class="service_header_first">
				<div class="header_left">
					<ul>
						<li><a class="logo" href="${root}/normal.do">북팩토리</a></li>
						<li><a class="header_text" href="${root }/serviceCenter/main.do">고객센터</a></li>
					</ul>
				</div>
				<div class="header_right">
					<ul>
						<li><a class="bf-button" href="${root }/serviceCenter/FAQ.do">문의하기</a></li>
						<li><a class="bf-button" href="${root }/serviceCenter/inquriy_list2.do">문의내역</a></li>
					</ul>
				</div>
			</div>
		</div>
	

</body>
</html>