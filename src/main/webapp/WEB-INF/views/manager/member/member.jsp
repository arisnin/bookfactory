<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" href="${root }/css/manager/member.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">

<title>회원관리 페이지</title>
</head>
<body>
	<div id="sh_member">
		<div class="sh_main_text">회원관리 페이지</div>
		
		<div id="sh_board_shadow">
			<div class="sh_member_header">
				<form method="get" onsubmit="return dateSearch(this)">
					<div class="sh_member_main">
						<div class="sh_member_search">
							<ul>
								<li><span class="material-icons">search</span></li>
								<li><input class="search-word" type="text" name="searchWord" placeholder="아이디를 입력하세요" value="${searchWord}"/></li>
							</ul>
						</div>
						<div class="sh_member_date">
							<ul>
								<li><input type="text" id="sh_date_start"  name ="startDate"  placeholder="시작 날짜" /></li>
								<li>~<input type="text" id="sh_date_end"  name ="endDate" placeholder="종료 날짜" /></li>
								<li><button type="button" class="bf-button bf-white-btn" id="sh_day1">하루</button></li>
								<li><button type="button" class="bf-button bf-white-btn" id="sh_day7">일주일</button></li>
								<li><button type="button" class="bf-button bf-white-btn" id="sh_day30">한달</button></li>
								<li><button type="submit" class="bf-button">검색</button></li>
							</ul>
						</div>
					</div>
				</form>
				

			</div>
			<div class="sh_member_content">
				<div class="sh_member_title">
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="전체선택" id="allCheck" /> <span class="all-mark"></span><span class="checkbox-label"></span>
						</label></li>
						<li>순번</li>
						<li>아이디</li>
						<li>이름</li>
						<li>연락처</li>
						<li>가입일</li>
						<li>최종방문일</li>
						<li>리뷰 수</li>
						<li>상세보기</li>
					</ul>
				</div>
			<form action="${root}/manager/memberRegister.do">
				<div class="sh_member_list">
					<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
					<!-- 첫번째 예제 -->
					<c:forEach var="memberDto" items="${memberDtoList}">
						<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span></label></li>
						<li>${memberDto.num}</li>
						<li>${memberDto.id} </li>
						<li>${memberDto.name}</li>
						<li>${memberDto.phone }</li>
						<li><fmt:formatDate value="${memberDto.register_date}" pattern="yyyy/MM/dd"/>
						<li><fmt:formatDate value="${memberDto.last_join }" pattern="yyyy/MM/dd"/>
						<li>3</li>
						<!-- 게시글 목록 넘어가기 -->
						<li><a href="${root}/manager/memberRegister.do?pageNumber=${pageNumber}&id=${memberDto.id}" class="bf-button">상세보기</a></li>
						</ul>
							
					</c:forEach>
				</div>
				</form>
			</div> 

			
			<input type="hidden" name="href">
			
			<div class="a_se_foot">
				<nav class="bf-pagination">
					<ul class="bf-animated-btn">
						<fmt:formatDate value="${startDate}" var="sDate" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${endDate}" var="eDate" pattern="yyyy-MM-dd"/>
						<c:if test="${startDate!=null && searchWord==null}">
							<c:set var="href" value="${root}/manager/memberMember.do?startDate=${sDate}&endDate=${eDate}&pageNumber="/>
						</c:if>
						<c:if test="${startDate==null && searchWord==null}">
							<c:set var="href" value="${root}/manager/memberMember.do?pageNumber="/>
						</c:if>
						<c:if test="${startDate!=null && searchWord!=null}">
							<c:set var="href" value="${root}/manager/memberMember.do?searchWord=${searchWord}&startDate=${sDate}&endDate=${eDate}&pageNumber="/>
						</c:if>
						<c:if test="${startDate==null && searchWord!=null}">
							<c:set var="href" value="${root}/manager/memberMember.do?searchWord=${searchWord}&pageNumber="/>
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
		</div>
	
	</div>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
	<script type="text/javascript" src="${root}/script/manager/member.js"></script>
	<script type="text/javascript">
		function goUpdate(url){
			location.href=url + $("input[name=href]").val();
		}
		//페이지 활성화
		$(".bf-animated-btn").find("li").each(function(){
			if($(this).text()=='${pageNumber}'){
				$(this).find("a").addClass("active");
			}
		});
		var before = location.href;
		if(before.indexOf('?') == -1){
			$("input[name=href]").val("");
		}else{
			$("input[name=href]").val("&"+ before.substring(before.indexOf('?')+1));
		}
	</script>
</body>
</html>