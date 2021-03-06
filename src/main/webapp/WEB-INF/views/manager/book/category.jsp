<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="b_cate_in">
					<label>카테고리 대</label>
					<input id="b_cate_c1" type="text" placeholder="제목"/>
					<div align="right">
						<button type="button" class="bf-button" onclick="cate1('${root}')">등록</button>
						<button type="reset" class="bf-button">취소</button>
					</div>
				</div>
				<div class="b_cate_in">
					<label>카테고리 중</label>
					<div id="b_cate_1" class="hwdropdown">
						<button type="button" class="hwdropbtn">대분류</button>
						<div id="myDropdown" class="hwdropdown-content">
							<c:forEach items="${firstCateList}" var="firstCateDto">
								<span id="${firstCateDto.num}">${firstCateDto.name}</span>
							</c:forEach>
						</div>
					</div>
					<input type="hidden" name="secondCate1">
					<input id="b_cate_c2" type="text" placeholder="제목"/>
					<div align="right">
						<button type="button" class="bf-button" onclick="cate2('${root}')">등록</button>
						<button type="reset" class="bf-button">취소</button>
					</div>
				</div>
				<div class="b_cate_in">
					<label>카테고리 소</label>
					<div id="b_cate_11" class="hwdropdown">
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
					<input type="hidden" name="secondCate2">
					<input type="hidden" name="secondCate3">
					<input id="b_cate_c3" type="text" placeholder="제목"/>
					<div align="right">
						<button type="button" class="bf-button" onclick="cate3('${root}')">등록</button>
						<button type="reset" class="bf-button">취소</button>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script src="${root}/script/basic/commons.js"></script>
	<script src="${root}/script/manager/book/category.js"></script>
	<script type="text/javascript">
		//카테고리
		$("#b_cate_11 span").click(function(){
			var name = $(this);
			$.ajax({
			  url: "${root}/manager/bookCateOne.do",
			  method: 'get',
			  data: {name : name.text()},
			  success: function(arrCate){
			  		var secondCate = JSON.parse(arrCate);
			  		$("#b_cate_2").find(".hwdropbtn").text("중분류");
			  		var secondNode = $("#b_cate_2").find("#myDropdown");
			  		secondNode.empty();
			  		
			  		for(var i=0;i<secondCate.cate1.length;i++){
			  			secondNode.append("<span id='"+ secondCate.cate1[i].num +"'>"+secondCate.cate1[i].name+"</span>");
			  		}
			  		$("#b_cate_2 span").click(function (){
			  			$("input[name=secondCate3]").val($(this).attr("id"));
			  		});
			  	},
			  dataType: "text"
			});
		});
	</script>
</body>
</html>