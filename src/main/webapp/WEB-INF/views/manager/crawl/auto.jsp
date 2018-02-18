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
					<label>리디북스 책넣는방법</label><br><br>
					<!-- <input name="url" class="b_crawinput" type="text" placeholder="url"/><br><br> -->
					<label>1.카테고리 등록버튼 클릭</label><br><br>
					<label>2.넣고싶은 책분류 클릭</label><br><br>
					<label>3.에러가 날수도 있다 당황하지 말고 현우한테 말하자</label><br><br>
					<label>4.에러가 나도 이미 몇백권의 책은 들어갓으니 각자 테스트 하자</label><br><br>
					<div align="right">
						<button id="crawl" type="button" class="bf-button">카테고리등록</button>
						<button id="b_ilban" type="button" class="bf-button">일반</button>
						<button id="b_romance"type="button" class="bf-button">로맨스</button>
						<button id="b_fantasy" type="button" class="bf-button">판타지</button>
						<button id="b_manhaw" type="button" class="bf-button">만화</button>
						<button id="b_bl" type="button" class="bf-button">BL</button>
						<button id="urlSet" type="button" class="bf-button">ALL자동 테스트</button>
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
		
		$("#b_ilban").click(function(){
			var url = '${root}/manager/autoInsertBook.do';
			var value = '/WEB-INF/views/manager/crawl/ilban.properties';
			cAjax(url,value);
		});
		
		$("#b_romance").click(function(){
			var url = '${root}/manager/autoInsertBook.do';
			var value = '/WEB-INF/views/manager/crawl/romance.properties';
			cAjax(url,value);
		});
		
		$("#b_fantasy").click(function(){
			var url = '${root}/manager/autoInsertBook.do';
			var value = '/WEB-INF/views/manager/crawl/fantasy.properties';
			cAjax(url,value);
		});
		
		$("#b_manhaw").click(function(){
			var url = '${root}/manager/autoInsertBook.do';
			var value = '/WEB-INF/views/manager/crawl/manhaw.properties';
			cAjax(url,value);
		});
		
		$("#b_bl").click(function(){
			var url = '${root}/manager/autoInsertBook.do';
			var value = '/WEB-INF/views/manager/crawl/bl.properties';
			cAjax(url,value);
		});
		
		$("#urlSet").click(function(){
			var url = '${root}/manager/autoUrl.do';
			var value = '/WEB-INF/views/manager/crawl/ridiUrl.properties';
			
			$.ajax({
				  url: url,
				  method: 'get',
				  data: {value : value},
				  success: function(response){
				  		alert(response);
				  	},
				  dataType: "text"
			});
		});
		
	</script>
</body>
</html>