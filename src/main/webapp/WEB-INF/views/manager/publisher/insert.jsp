<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>도서 등록</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
  	<link rel="stylesheet" href="${root}/css/manager/pub.css">
</head>
<body>
	<div id="b_in_wrapper">
		<form id="pub_form" action="${root}/manager/publisherInsertOk.do" method="post">
			<section class="b_in_main">
				<div class="b_in_header"><h2>출판사 등록</h2></div>
				<div class="b_in_content p_in_center">
					<div>
						<label>출판사 명</label>
						<input type="text" placeholder="출판사 이름" name="name"/>
						<span class="p_in_check"></span>
					</div>
					<div>
						<label>출판사 사이트</label>
						<input type="text" placeholder="출판사 홈페이지" name="url"/>
						<span class="p_in_check">중복입니다 다시 입력하세요</span>
					</div>
					<div align="right">
						<button id="p_in_btn" type="button" class="bf-button">등록</button>
						<button type="reset" class="bf-button">취소</button>
					</div>
				</div>
			</section>
		</form>
	</div>
	<script type="text/javascript">
		$("#p_in_btn").click(function(){
			var name = $("input[name=name]");
			$.ajax({
				  url: "${root}/manager/publisherNameCheck.do",
				  method: 'get',
				  data: {name : $.trim(name.val())},
				  success: function(check){
				  		if(check > 0){
				  			name.next("span").text("중복입니다 다시 입력하세요");
				  			return;
				  		}else{
				  			$("#pub_form").submit();
				  		}
				  	},
				  dataType: "text"
			});
		});
	</script>
</body>
</html>