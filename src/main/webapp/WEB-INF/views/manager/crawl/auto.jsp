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
				</div>
				<div class="b_cate_in">
					<label>리디북스 링크</label>
					<input name="url" class="b_crawinput" type="text" placeholder="url"/><br><br>
					<label>링크삽입후 카테고리부터 순서대로 등록버튼을 누른다</label>
					<div align="right">
						<button id="crawl" type="button" class="bf-button">카테고리등록</button>
						<button id="b_publisher" type="button" class="bf-button">출판사등록</button>
						<button id="b_author"type="button" class="bf-button">작가등록</button>
						<button id="b_b_book" type="button" class="bf-button">도서등록</button>
						<button type="reset" class="bf-button">취소</button>
					</div>
					<div align="right">
						<button id="urlSet" type="button" class="bf-button">맵핑 테스트</button>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script type="text/javascript">
	
		function cAjax(url, val){
			$.ajax({
				  url: url,
				  method: 'get',
				  data: {value : val},
				  success: function(response){
				  		alert(response);
				  	},
				  dataType: "text"
			});
		}
		
		$("#crawl").click(function(){
			location.href='${root}/manager/bookCategoryOk.do';
		});
		
		$("#b_publisher").click(function(){
			var url = '${root}/manager/autoPublisher.do';
			var value = $("input[name=url]").val();
			
			if(value==""){
				alert("주소를 입력하시오.");
				$("input[name=url]").focus();
				return;
			}
			
			cAjax(url,value);
			
		});
		
		$("#b_author").click(function(){
			var url = '${root}/manager/autoAuthor.do';
			var value = $("input[name=url]").val();
			
			if(value==""){
				alert("주소를 입력하시오.");
				$("input[name=url]").focus();
				return;
			}
			
			cAjax(url,value);
		});
		
		$("#b_b_book").click(function(){
			var url = '${root}/manager/autoBook.do';
			var value = $("input[name=url]").val();
			
			if(value==""){
				alert("주소를 입력하시오.");
				$("input[name=url]").focus();
				return;
			}
			cAjax(url,value);
		});
		
		$("#urlSet").click(function(){
			var url = '${root}/manager/autoUrl.do';
			var value = $("input[name=url]").val();
			
			if(value==""){
				alert("주소를 입력하시오.");
				$("input[name=url]").focus();
				return;
			}
			cAjax(url,value);
		});
		
	</script>
</body>
</html>