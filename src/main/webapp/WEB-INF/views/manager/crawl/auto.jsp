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
  	<link rel="stylesheet" href="${root }/alert/alertify_core.css" />
	<link rel="stylesheet" href="${root }/alert/alertify_default.css" id="toggleCSS" />

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
					<label>1.카테고리 등록버튼 클릭</label><br><br>
					<label>2.넣고싶은 책분류 클릭</label><br><br>
					<label>3.실행도중 확인되지 않은 에러가 나타날 수 있습니다. 개발자에게 문의하세요</label><br><br>
					<div align="right">
						<button id="crawl" type="button" class="bf-button">카테고리 및 초기 키워드 등록</button>
						<button id="b_ilban" type="button" class="bf-button">일반</button>
						<button id="b_romance"type="button" class="bf-button">로맨스</button>
						<button id="b_fantasy" type="button" class="bf-button">판타지</button>
						<button id="b_manhaw" type="button" class="bf-button">만화</button>
						<button id="b_bl" type="button" class="bf-button">BL</button>
						<button id="urlSet" type="button" class="bf-button">ALL자동 테스트</button>
					</div>
					<hr>
					<div align="right">
						<button id="preference" type="button" class="bf-button">선호도 랜덤 주기 테스트</button>
						<button id="test" type="button" class="bf-button">테스트용</button>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script src="${root }/alert/alertifymin.js"></script>
	<script type="text/javascript">
	
		$("#preference").click(function(){
			var url ="${root}/manager/randomPreference.do";
			$.ajax({
				  url: url,
				  method: 'get',
				  success: function(){
					  alertify.success('선호도1000개 랜덤조작 완료');
				  },
				  dataType: "text"
			});
		});
	
		$("#test").click(function(){
			location.href="${root}/manager/test.do";
		});
	
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