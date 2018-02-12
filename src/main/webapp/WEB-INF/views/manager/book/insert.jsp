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
  	<link rel="stylesheet" href="${root}/css/basic/reset.css">
  	<link rel="stylesheet" href="${root}/css/basic/commons.css">
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
  	<link rel="stylesheet" href="${root}/css/basic/jquery-ui.css">
</head>
<body>
	<div id="b_in_wrapper">
		<section class="b_in_main">
			<div class="b_in_header"><h2>도서 등록</h2></div>
			<div class="b_in_content">
				<div>
					<label>도서 제목</label>
					<input type="text" placeholder="제목"/>
					<!-- <button type="button" class="bf-button search">중복체크</button> -->
					<span class="b_in_check">중복입니다 다시 입력하세요</span>	
				</div>
				<div>
					<label>도서 부제목</label>
					<input type="text" placeholder="부제목"/>
				</div>
				<div>
					<label>출간일</label>
					<div class="b_in_date">
					 	<input type="text" id="b_date" name="date" placeholder="YY-MM-DD">
						<!-- <button type="button" class="bf-button search">추가</button>			 -->
						<span class="b_in_check">입력하세요!</span>	 
					</div>
					
				</div>
				<div>
					<label>출판사</label>
					<input type="text" name="publisher" placeholder="출판사"/>
					<button type="button" id="b_in_pub_open" class="bf-button search">검색</button>
				</div>
				<div>
					<label>카테 고리</label>
					<div class="hwdropdown">
						<button class="hwdropbtn">대분류</button>
						<div id="myDropdown" class="hwdropdown-content">
							<span>ok</span>
							<span>ok</span>
							<span>ok</span>
							<span>ok</span>
						</div>
					</div>
					<div class="hwdropdown">
						<button class="hwdropbtn">중분류</button>
						<div id="myDropdown" class="hwdropdown-content">
							<span>ok</span>
							<span>ok</span>
							<span>ok</span>
							<span>ok</span>
						</div>
					</div>
					<div class="hwdropdown">
						<button class="hwdropbtn">소분류</button>
						<div id="myDropdown" class="hwdropdown-content">
							<span>ok</span>
							<span>ok</span>
							<span>ok</span>
							<span>ok</span>
						</div>
					</div>
				</div>
				<div><label>작가</label><input type="text" placeholder="작가이름"/></div>
				<div><label>도서가격</label><input type="text" placeholder="가격"/></div>
				<div><label>지원기기</label>
					<label class="bf-custom-checkbox">
						<input type="checkbox" title="전체선택"/>
						<span class="all-mark"></span>
						<span class="checkbox-label">전체선택</span>
					</label>
					<label class="bf-custom-checkbox">
						<input type="checkbox" title="PAPER"/>
						<span class="all-mark"></span>
						<span class="checkbox-label">PAPER</span>
					</label>
					<label class="bf-custom-checkbox">
						<input type="checkbox" title="IOS"/>
						<span class="all-mark"></span>
						<span class="checkbox-label">IOS</span>
					</label>
					<label class="bf-custom-checkbox">
						<input type="checkbox" title="Android"/>
						<span class="all-mark"></span>
						<span class="checkbox-label">Android</span>
					</label>
					<label class="bf-custom-checkbox">
						<input type="checkbox" title="PC"/>
						<span class="all-mark"></span>
						<span class="checkbox-label">PC</span>
					</label>
					<label class="bf-custom-checkbox">
						<input type="checkbox" title="Mac"/>
						<span class="all-mark"></span>
						<span class="checkbox-label">Mac</span>
					</label>
				</div>
				<div class="b_in_img">
					<label>도서 이미지</label>
					<img src="${root}/img/manager/books-stack-of-three.png">
					<button type="button" class="bf-button">찾기</button>
				</div>
				<div class="b_in_textarea">
					<label>도서 소개</label>
					<textarea rows="" cols=""></textarea>
				</div>
				<div class="b_in_textarea">
					<label>출판사 서평</label>
					<textarea rows="" cols=""></textarea>
				</div>
				<div align="right">
					<button type="button" class="bf-button">등록</button>
					<button type="button" class="bf-button">취소</button>
				</div>
			</div>
		</section>
	</div>

	
	<script src="${root}/script/basic/jquery.js"></script>
	<script src="${root}/script/basic/jquery-ui.js"></script>
	<script src="${root}/script/basic/commons.js"></script>
	<script>
		$("#b_date").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#b_in_pub_open").click(function(){
			var url = "${root}/manager/bookOpenPub.do";
			open(url,"출판사 검색창","width=685,height=750,scroll=yes");
		});
		var checkbox = $(".bf-custom-checkbox");
		
		checkbox.eq(0).find("input[type=checkbox]").click(function(e){
			if(this.checked){
				checkbox.find("input[type=checkbox]").each(function(){
					this.checked = true;
				});
			}else{
				checkbox.find("input[type=checkbox]").each(function(){
					this.checked = false;
				});				
			}
		});
		checkbox.not(":eq(0)").find("input[type=checkbox]").click(function(){
			
			checkbox.eq(0).find("input[type=checkbox]").prop("checked",false);
			var check = 0;
			checkbox.not(":eq(0)").find("input[type=checkbox]").each(function(){
				if($(this).prop("checked") == false){
					check = 1;
				}
			});
			if(check == 0){
				checkbox.eq(0).find("input[type=checkbox]").prop("checked",true);
			}
		});
	</script>
</body>
</html>