<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>도서 등록</title>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${root}/css/basic/bootstrap.css">
  	<link rel="stylesheet" href="${root}/css/basic/reset.css">
  	<link rel="stylesheet" href="${root}/css/basic/commons.css">
  	<link rel="stylesheet" href="${root}/css/manager/preference.css">
</head>
<body>
	<div id="s_pr_wrapper">
		<section class="s_pr_main">
			<div class="s_pr_header"><h2>선호도 조사</h2></div>
			<div class="s_pr_content">
				<div class="bf-service-type-menu">
					<ul class="service-type-list s_t_cate">
						<li><a class="active" href="${root}/manager/statPreference.do">전체</a></li>
						<li><a href="${root}/manager/ilbanPrefer.do">일반</a></li>
						<li><a href="${root}/manager/romancePrefer.do">로맨스</a></li>
						<li><a href="${root}/manager/fantasyPrefer.do">판타지</a></li>
						<li><a href="${root}/manager/manhwaPrefer.do">만화</a></li>
						<li><a href="${root}/manager/blPrefer.do">BL</a></li>
					</ul>
				</div>
				<div id="prefer-graph">
					<h3>전체 카테고리별 선호도</h3>
					<table id="q-graph">
						<thead>
							<tr>
								<th class="sent">선호된 수</th>
							</tr>
						</thead>
						<tbody>
							<tr class="qtr" id="q1">
								<th scope="row">일반</th>
								<td class="sent bar"><p>${countMap.ilban}개</p><input type="hidden" value="${heightMap.ilban}"></td>
							</tr>
							<tr class="qtr" id="q2">
								<th scope="row">로맨스</th>
								<td class="sent bar"><p>${countMap.romance}개</p><input type="hidden" value="${heightMap.romance}"></td>
							</tr>
							<tr class="qtr" id="q3">
								<th scope="row">판타지</th>
								<td class="sent bar"><p>${countMap.fantasy}개</p><input type="hidden" value="${heightMap.fantasy}"></td>
							</tr>
							<tr class="qtr" id="q4">
								<th scope="row">만화</th>
								<td class="sent bar"><p>${countMap.manhwa}개</p><input type="hidden" value="${heightMap.manhwa}"></td>
							</tr>
							<tr class="qtr" id="q5">
								<th scope="row">BL</th>
								<td class="sent bar"><p>${countMap.bl}개</p><input type="hidden" value="${heightMap.bl}"></td>
							</tr>
						</tbody>
					</table>
					
					<div id="ticks">
					<div class="tick" style="height: 59px;"><p>${maxCount}개</p></div>
					<div class="tick" style="height: 59px;"><p><fmt:formatNumber value="${maxCount * 0.8}" pattern="#"/>개</p></div>
					<div class="tick" style="height: 59px;"><p><fmt:formatNumber value="${maxCount * 0.6}" pattern="#"/>개</p></div>
					<div class="tick" style="height: 59px;"><p><fmt:formatNumber value="${maxCount * 0.4}" pattern="#"/>개</p></div>
					<div class="tick" style="height: 59px;"><p><fmt:formatNumber value="${maxCount * 0.2}" pattern="#"/>개</p></div>
					</div>
				</div>
				<div id="s_pr_info" class="s_pr_margin">
					<h3>선호도 TOP5</h3>
					<table class="table table-striped">
						<tr>
							<th><strong>전체순위</strong></th>
							<th>책제목</th>
							<th>작가</th>
							<th>평점</th>
							<th>선호수</th>
							<th>출판사</th>	
						</tr>
						<c:forEach items="${rankList}" var="rank">
							<tr>
								<td>${rank.rnum }</td>
								<td><a href="${root}/detail.do?book_num=${rank.book_num}">${rank.book_name }</a></td>
								<td>${rank.author_name }</td>
								<td>${rank.score }</td>
								<td>${rank.preference }</td>
								<td>${rank.pub_name }</td>
							</tr>						
						</c:forEach>
					</table>
				</div>
			</div>
		</section>
	</div>
	
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/manager/statistics.js"></script>
	<script src="${root}/script/basic/bootstrap.js"></script>
</body>
</html>

