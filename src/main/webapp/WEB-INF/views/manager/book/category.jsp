<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>카테고리 등록</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
</head>
<body>
	<div id="b_in_wrapper">
		<section class="b_in_main">
			<div class="b_in_header"><h2>카테고리 등록</h2></div>
			<div class="b_in_content">
				<div align="right">
					<button id="crawl2" type="button" class="bf-button">크롤링카테고리등록</button>
					<button id="crawl3" type="button" class="bf-button">크롤링등록</button>
				</div>
				<div class="b_cate_in">
					<label>카테고리 대</label>
					<input type="text" placeholder="제목"/>
					<div align="right">
						<button type="button" class="bf-button">등록</button>
						<button type="button" class="bf-button">취소</button>
					</div>
				</div>
				<div class="b_cate_in">
					<label>카테고리 중</label>
					<input type="text" placeholder="제목"/>
					<div align="right">
						<button type="button" class="bf-button">등록</button>
						<button type="button" class="bf-button">취소</button>
					</div>
				</div>
				<div class="b_cate_in">
					<label>카테고리 소</label>
					<input type="text" placeholder="제목"/>
					<div align="right">
						<button type="button" class="bf-button">등록</button>
						<button type="button" class="bf-button">취소</button>
					</div>
				</div>
				
			</div>
		</section>
	</div>
	
	<script type="text/javascript">
		$("#crawl2").click(function(){
			location.href='${root}/manager/bookCateSecond.do';
		});
		$("#crawl3").click(function(){
			location.href='${root}/manager/bookCategoryOk.do';
		});
	</script>
</body>
</html>