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
  	<link rel="stylesheet" href="${root}/resources/css/basic/reset.css">
  	<link rel="stylesheet" href="${root}/resources/css/basic/commons.css">
  	<link rel="stylesheet" href="${root}/resources/css/manager/book.css">
  	<link rel="stylesheet" href="${root}/resources/css/manager/author.css">
  	<link rel="stylesheet" href="${root}/css/basic/jquery-ui.css">
  	
</head>
<body>
	<div id="a_in_wrapper">
		<section class="a_in_main">
			<div class="a_in_header"><h2>작가 등록</h2></div>
			<div class="a_in_content">
				<div>
					<label>이름</label>
					<input type="text" placeholder="제목"/>
					<span class="b_in_check">중복입니다 다시 입력하세요</span>
				</div>
				<div>
					<label>국적</label>
					<input type="text" placeholder="나라"/>
				</div>
				<div>
					<label>출생년도</label>
					<div class="b_in_date">
					 	<input type="text" id="b_date" name="date" placeholder="YY-MM-DD">
						
					</div>
				</div>
				<div>
					<label>데뷔</label>
					<div class="b_in_date">
					 	<input type="text" id="b_date2" name="date" placeholder="YY-MM-DD">
					</div>
				</div>
				<div>
					<label>학력</label>
					<input type="text" placeholder="학력"/>
					<button type="button" class="bf-button search">추가</button>
				</div>
				<div class="a_in_list">
					<ul>
						<li>남서울대 4년 재학</li>
					</ul>
				</div>
				<div>
					<label>경력</label>
					<input type="text" placeholder="경력"/>
					<button type="button" class="bf-button search">추가</button>
				</div>
				<div class="a_in_list">
					<ul>
						<li>남서울대 4년 재학</li>
					</ul>
				</div>
				<div>
					<label>수상</label>
					<input type="text" placeholder="수상"/>
					<button type="button" class="bf-button search">추가</button>
				</div>
				<div class="a_in_list">
					<ul>
						<li>쌍용 수료!</li>
					</ul>
				</div>
				<div>
					<label>링크</label>
					<input type="text" placeholder="링크"/>
				</div>
				<div class="a_in_textarea">
					<label>작가 소개</label>
					<textarea rows="" cols=""></textarea>
				</div>
				<div align="right">
					<button type="button" class="bf-button">등록</button>
					<button type="button" class="bf-button">취소</button>
				</div>
			</div>
		</section>
	</div>

	
	<script src="${root}/resources/script/basic/jquery.js"></script>
	<script src="${root}/script/basic/jquery-ui.js"></script>
	<script src="${root}/resources/script/basic/commons.js"></script>
	<script type="text/javascript">
		$(".search").click(function(){
			var input = $(this).prev();
			
			if(input.val() == ""){
				alert("공백 입력 불가능");
				return;
			}
			
			var ul = $(this).parent().next().find("ul");
			ul.append("<li>"+input.val()+"</li>");
			input.val("");
		});
		$("#b_date").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#b_date2").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	</script>
</body>
</html>