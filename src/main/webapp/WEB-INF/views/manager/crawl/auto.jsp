<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자동 등록</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
</head>
<body>
	<div id="b_in_wrapper">
		<section class="b_in_main">
			<div class="b_in_header"><h2>자동 등록</h2></div>
			<div class="b_in_content">
				<div align="right">
					<button id="crawl" type="button" class="bf-button">카테고리등록</button>
				</div>
				<div class="b_cate_in">
					<label>출판사</label>
					<input name="publisher" class="b_crawinput" type="text" placeholder="url"/>
					<div align="right">
						<button id="b_publisher" type="button" class="bf-button">등록</button>
						<button type="button" class="bf-button">취소</button>
					</div>
				</div>
				<div class="b_cate_in">
					<label>작가</label>
					<input name="author" type="text" class="b_crawinput" placeholder="url"/>
					<div align="right">
						<button id="b_author"type="button" class="bf-button">등록</button>
						<button type="button" class="bf-button">취소</button>
					</div>
				</div>
				<div class="b_cate_in">
					<label>도서</label>
					<input name="b_book"type="text" class="b_crawinput" placeholder="url"/>
					<div align="right">
						<button id="b_b_book" type="button" class="bf-button">등록</button>
						<button type="button" class="bf-button">취소</button>
					</div>
				</div>
				
			</div>
		</section>
	</div>
	
	<script type="text/javascript">
		$("#crawl").click(function(){
			location.href='${root}/manager/bookCategoryOk.do';
		});
		
		$("#b_publisher").click(function(){
			var url = '${root}/manager/autoPublisher.do';
			var value = $("input[name=publisher]").val();
			$.ajax({
				  url: url,
				  method: 'get',
				  data: {value : value},
				  success: function(e){
				  		alert(e);
				  	},
				  dataType: "text"
				});
		});
		
		$("#b_author").click(function(){
			var url = '${root}/manager/autoAuthor.do';
			var value = $("input[name=author]").val();
			$.ajax({
				  url: url,
				  method: 'get',
				  data: {value : value},
				  success: function(size){
				  		alert(size+"입력완료");
				  	},
				  dataType: "text"
				});
		});
		
		$("#b_b_book").click(function(){
			var url = '${root}/manager/autoBook.do';
			var value = $("input[name=b_book]").val();
			$.ajax({
				  url: url,
				  method: 'get',
				  data: {value : value},
				  success: function(size){
				  		alert(size+"입력완료");
				  	},
				  dataType: "text"
				});
		}); 
	</script>
</body>
</html>