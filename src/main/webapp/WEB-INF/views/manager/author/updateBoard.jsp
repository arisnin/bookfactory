<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
								<input type="checkbox" value="no">
								<span class="all-mark"></span>
								<span class="checkbox-label">미확인</span>
							</label>
						</li>
						<li>
							<label class="bf-custom-checkbox">
								<input type="checkbox" value="yes">
								<span class="all-mark"></span>
								<span class="checkbox-label">반영</span>
							</label>
						</li>
						<li>
							<label class="bf-custom-checkbox">
								<input type="checkbox" value="reject">
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
						<c:forEach items="${authorEditList}" var="authorEdit">
							<li>
								<span>${authorEdit.num }</span>
								<span>${authorEdit.name }</span>
								<span>${authorEdit.content }</span>
								<span><c:if test="${authorEdit.condition == 'no'}">미확인</c:if><c:if test="${authorEdit.condition == 'yes'}">반영</c:if> 
									<c:if test="${authorEdit.condition == 'reject'}">거절</c:if>
								</span>
								<button type="button" class="bf-button" onclick="location.href='${root}/manager/authorUpdateRead.do?num=${authorEdit.author_num}&editNum=${authorEdit.num }';">상세보기</button>
							</li>
						</c:forEach>
					</ul>
				</div>
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">
						<c:if test="${condition==null}">
							<c:set var="href" value="${root}/manager/authorUpdateBoard.do?pageNumber="/>
						</c:if>
						<c:if test="${condition!=null}">
							<c:set var="href" value="${root}/manager/authorUpdateBoard.do?condition=${condition}&pageNumber="/>
						</c:if>
						
						<li class="first"><a href="${href}1"><span></span></a></li>
						<c:if test="${count > 0}">
							<fmt:parseNumber var ="pageCount" value="${count/boardSize + (count % boardSize == 0?0:1)}" integerOnly="true"/>
							<c:set var ="pageBlock" value="${5}"/>
							<fmt:parseNumber var="rs" value="${(pageNumber-1)/pageBlock}" integerOnly="true"/>
							
							<c:set var="startPage" value="${rs*pageBlock + 1}"/>
							<c:set var="endPage" value="${startPage + pageBlock - 1}"/>
							
							<c:if test="${endPage > pageCount}">
							<c:set var="endPage" value="${pageCount}"/>
						</c:if>
						</c:if>
						
						<c:if test="${startPage > pageBlock}">
							<li class="prev"><a href="${href}${startPage-1}"><span></span></a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li><a href="${href}${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${endPage < pageCount}">
							<li class="next"><a href="${href}${endPage+1}"><span></span></a></li>
						</c:if>
						<li class="last"><a href="${href}${pageCount}"><span></span></a></li>
					</ul>
				</nav>
			</div>
		</section>
	</div>

	
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript">
		$("input[type=checkbox]").click(function(){
			location.href="${root}/manager/authorUpdateBoard.do?condition="+$(this).val();
		});
		
		$("input[type=checkbox]").each(function(){
			if($(this).val() == "${condition}"){
				$(this).prop("checked",true);
			}
		});
		
		$(".bf-animated-btn").find("li").each(function(){
			if($(this).text()=='${pageNumber}'){
				$(this).find("a").addClass("active");
			}
		});
	</script>
</body>
</html>
