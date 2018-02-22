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
  	<link rel="stylesheet" href="${root}/css/basic/jquery-ui.css">
</head>
<body>
	<div id="b_in_wrapper">
		<form action="${root}/manager/bookInsertOk.do" method="post" onsubmit="return bookInsertOk()">
			<section class="b_in_main">
				<div class="b_in_header"><h2>도서 등록</h2></div>
				<div class="b_in_content">
					<div>
						<label>도서 제목</label>
						<input type="text" name="name" placeholder="제목" oninput="checkName('${root}')"/>
						<span class="b_in_check"></span>
					</div>
					<div>
						<label>도서 부제목</label>
						<input type="text" name="sub_title" placeholder="부제목"/>
					</div>
					<div>
						<label>출간일</label>
						<div class="b_in_date">
						 	<input type="text" id="b_date" name="write_date" placeholder="YY-MM-DD">
							<!-- <button type="button" class="bf-button search">추가</button>			 -->
							<!-- <span class="b_in_check">입력하세요!</span>	  -->
						</div>
						
					</div>
					<div>
						<label>출판사</label>
						<input type="text" name="publisher" placeholder="출판사"/>
						<button type="button" id="b_in_pub_open" class="bf-button search">검색</button>
					</div>
					<div>
						<label>카테 고리</label>
						<div id="b_cate_1" class="hwdropdown">
							<button type="button" class="hwdropbtn">대분류</button>
							<div id="myDropdown" class="hwdropdown-content">
								<c:forEach items="${firstCateList}" var="firstCateDto">
									<span id="${firstCateDto.num}">${firstCateDto.name}</span>
								</c:forEach>
							</div>
						</div>
						<div id="b_cate_2" class="hwdropdown">
							<button type="button" class="hwdropbtn">중분류</button>
							<div id="myDropdown" class="hwdropdown-content">
							</div>
						</div>
						<div id="b_cate_3" class="hwdropdown">
							<button type="button" class="hwdropbtn">소분류</button>
							<div id="myDropdown" class="hwdropdown-content">
							</div>
						</div>
						<span id="b_cate_ok" class="b_in_check">입력하세요!</span>
					</div>
					<div>
						<label>작가</label>
						<input type="text" name="author" placeholder="작가이름" oninput="checkAuthor('${root}','author')"/>
						<span class="b_in_check"></span>
						<div class="b_in_author_list">
							<ul></ul>
						</div>
						<input type="hidden" name="author_num">
					</div>
					<div>
						<label>일러스트</label>
						<input type="text" name="illustrator" placeholder="일러스트이름" oninput="checkAuthor('${root}','illustrator')"/>
						<span class="b_in_check"></span>
						<div class="b_in_author_list">
							<ul></ul>
						</div>
						<input type="hidden" name="illustrator_num">
					</div>
					<div>
						<label>번역가</label>
						<input type="text" name="translator" placeholder="번역이름" oninput="checkAuthor('${root}','translator')"/>
						<span class="b_in_check"></span>
						<div class="b_in_author_list">
							<ul></ul>
						</div>
						<input type="hidden" name="translator_num">
					</div>
					<div>
						<label>도서가격</label><input type="text" name="price" placeholder="가격"/>
					</div>
					<div id="b_in_support"><label>지원기기</label>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="전체선택" name="supportAll"/>
							<span class="all-mark"></span>
							<span class="checkbox-label">전체선택</span>
						</label>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="PAPER" name="supportBox" value="paper"/>
							<span class="all-mark"></span>
							<span class="checkbox-label">PAPER</span>
						</label>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="IOS" name="supportBox" value="ios"/>
							<span class="all-mark"></span>
							<span class="checkbox-label">IOS</span>
						</label>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="Android" name="supportBox" value="Android"/>
							<span class="all-mark"></span>
							<span class="checkbox-label">Android</span>
						</label>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="PC" name="supportBox" value="pc"/>
							<span class="all-mark"></span>
							<span class="checkbox-label">PC</span>
						</label>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="Mac" name="supportBox" value="mac"/>
							<span class="all-mark"></span>
							<span class="checkbox-label">Mac</span>
						</label>
					</div>
					<div id="b_in_payType"><label>판매종류</label>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="전체선택"/>
							<span class="all-mark"></span>
							<span class="checkbox-label">전체선택</span>
						</label>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="종이책" name="payType" value="paper"/>
							<span class="all-mark"></span>
							<span class="checkbox-label">종이책</span>
						</label>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="전자책" name="payType" value="ebook"/>
							<span class="all-mark"></span>
							<span class="checkbox-label">전자책</span>
						</label>
						<label class="bf-custom-checkbox">
							<input type="checkbox" title="대여" name="rent" value="대여"/>
							<span class="all-mark"></span>
							<span class="checkbox-label">대여가능</span>
						</label>
					</div>
					<div class="b_in_img">
						<label>도서 이미지</label>
						<div>
							<img src="${root}/img/manager/no_image.png">
							<button id="b_in_filebtn" type="button" class="bf-button">찾기</button>
						</div>
					</div>
					<div class="b_in_textarea">
						<label>도서 소개</label>
						<textarea name="intro" rows="" cols=""></textarea>
					</div>
					<div class="b_in_textarea">
						<label>출판사 서평</label>
						<textarea name="pub_intro" rows="" cols=""></textarea>
					</div>
					<div align="right">
						<button type="submit" class="bf-button">등록</button>
						<button type="reset" class="bf-button">취소</button>
					</div>
					
					<input type="hidden" name="pub_num">
					<input type="hidden" name="cate1_num">
					<input type="hidden" name="cate2_num">
					<input type="hidden" name="cate3_num">
					<input type="hidden" name="support">
					<input type="hidden" name="img_path">
					<input type="hidden" name="rental_period">
					<input type="hidden" name="rental_price">
					<input type="hidden" name="type">
				</div>
			</section>
		</form>
		
		<input id="b_in_fileinput" type="file" name="file" onchange="uploadImg('${root}')">		
		
		
		
	</div>

	<script src="${root}/script/basic/commons.js"></script>
	<script src="${root}/script/basic/jquery-ui.js"></script>
	<script src="${root}/script/manager/book/insert.js"></script>
	<script>
		$("#b_in_pub_open").click(function(){
			var url = "${root}/manager/bookOpenPub.do";
			open(url,"출판사 검색창","width=685,height=750,scroll=yes");
		});
		
		//카테고리
		$("#b_cate_1 span").click(function(){
			var name = $(this);
			$.ajax({
			  url: "${root}/manager/bookCateOne.do",
			  method: 'get',
			  data: {name : name.text()},
			  success: function(arrCate){
					$("#b_cate_ok").text("다 입력하세요");
					
				    var cate1 = name.attr("id");
				    $("input[name=cate1_num]").val(cate1);
				    $("input[name=cate2_num]").val("");
				     
			  		$("#b_cate_2").find(".hwdropbtn").text("중분류");
			  		$("#b_cate_3").find(".hwdropbtn").text("소분류");
			  		var secondNode = $("#b_cate_2").find("#myDropdown");
			  		secondNode.empty();
			  		
			  		var jsonCate2 = JSON.parse(arrCate);
			  		var cate2 = jsonCate2.cate1;
			  		for(var i=0;i<cate2.length;i++){
			  			secondNode.append("<span id='"+cate2[i].num+"'>"+cate2[i].name+"</span>");
			  		}
			  		
			  		$("#b_cate_2 span").click(function(){
						var name = $(this);
						$.ajax({
						  url: "${root}/manager/bookCateTwo.do",
						  method: 'get',
						  data: {name : name.text()},
						  success: function(arrCate){
							 	var cate2 = name.attr("id");
							    $("input[name=cate2_num]").val(cate2);
							    $("input[name=cate3_num]").val("");
							    $("#b_cate_ok").text("다 입력하세요");
							    
						  		$("#b_cate_3").find(".hwdropbtn").text("소분류");
						  		var secondNode = $("#b_cate_3").find("#myDropdown");
						  		secondNode.empty();
						  		
						  		var jsonCate3 = JSON.parse(arrCate);
						  		var cate3 = jsonCate3.cate2;
						  		for(var i=0;i<cate3.length;i++){
						  			secondNode.append("<span id='"+cate3[i].num+"'>"+cate3[i].name+"</span>");
						  		}
						  		
						  		$("#b_cate_3 span").click(function(e){
						  			var cate3 = $(e.target).attr("id");
								    $("input[name=cate3_num]").val(cate3);
								    $("#b_cate_ok").text("");
						  		});
						  	},
						  dataType: "text"
						});
					});
			  	},
			  dataType: "text"
			});
		});
	</script>
</body>
</html>