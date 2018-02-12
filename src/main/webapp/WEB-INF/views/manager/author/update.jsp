<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
  	<link rel="stylesheet" href="${root}/css/basic/reset.css">
  	<link rel="stylesheet" href="${root}/css/basic/commons.css">
  	<link rel="stylesheet" href="${root}/css/manager/book.css">
  	<link rel="stylesheet" href="${root}/css/manager/author.css">
</head>
<body>
	<div id="b_se_wrapper">
		<section class="b_se_main">
			<div class="b_se_header"><h2>작가 정보 수정 요청사항</h2></div>
			<div class="b_se_content">
				<div class="a_up_checkbox">
					<ul class="category-filter-list">
						<li>
							<label class="bf-custom-checkbox">
								<input type="checkbox" title="구매목록 책 전체선택">
								<span class="all-mark"></span>
								<span class="checkbox-label">미확인</span>
							</label>
						</li>
						<li>
							<label class="bf-custom-checkbox">
								<input type="checkbox" title="구매목록 책 전체선택">
								<span class="all-mark"></span>
								<span class="checkbox-label">반영</span>
							</label>
						</li>
						<li>
							<label class="bf-custom-checkbox">
								<input type="checkbox" title="구매목록 책 전체선택">
								<span class="all-mark"></span>
								<span class="checkbox-label">거절</span>
							</label>
						</li>
					</ul>
				</div>
				<div class="bf-service-type-menu a_up_tt">
					<!-- 서비스타입 메뉴  -->			
					<ul class="service-type-list a_up_bar">
						<li><span>번호</span></li>
						<li><span>작가</span></li>
						<li><span>내용</span></li>
						<li><span>상태</span></li>
					</ul>
				</div>
				<div class="a_up_list">
					<ul>
						<c:forEach begin="1" end="10">
							<li>
								<span>1</span>
								<span>염현우</span>
								<span>현우경력은신입이다</span>
								<span>거절</span>
								<button type="button" class="bf-button" onclick="linkA('/manager/author/updateRead.jsp')">상세보기</button>
							</li>	
						</c:forEach>
					</ul>
				</div>
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">
						<li class="first"><a href="#0"><span></span></a></li>
						<li class="prev"><a href="#0"><span></span></a></li>
						<li><a href="#0">1</a></li>
						<li><a href="#0">2</a></li>
						<li><a class="active" href="#0">3</a></li>
						<li><a href="#0">4</a></li>
						<li><a href="#0">5</a></li>
						<li class="next"><a href="#0"><span></span></a></li>
						<li class="last"><a href="#0"><span></span></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</div>

	
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript">
		/* $('.hwdropbtn').text($('#myDropdown > .select').text()); */
		$('.hwdropdown').each(function (i,e) {
			var value = $(e).find('.select').text();
			$(e).find('.hwdropbtn').text(value);
		})
	</script>
</body>
</html>
