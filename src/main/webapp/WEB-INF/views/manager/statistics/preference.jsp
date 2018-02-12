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
						<li><a class="active" href="javascript:alert('전체')">전체</a></li>
						<li><a href="javascript:alert('일반')">일반</a></li>
						<li><a href="javascript:alert('로맨스')">로맨스</a></li>
						<li><a href="javascript:alert('판타지')">판타지</a></li>
						<li><a href="javascript:alert('만화')">만화</a></li>
						<li><a href="javascript:alert('BL')">BL</a></li>
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
								<td class="sent bar"><p>18,450개</p><input type="hidden" value="111"></td>
							</tr>
							<tr class="qtr" id="q2">
								<th scope="row">로맨스</th>
								<td class="sent bar"><p>34,340개</p><input type="hidden" value="206"></td>
							</tr>
							<tr class="qtr" id="q3">
								<th scope="row">판타지</th>
								<td class="sent bar"><p>43,145개</p><input type="hidden" value="259"></td>
							</tr>
							<tr class="qtr" id="q4">
								<th scope="row">만화</th>
								<td class="sent bar"><p>18,415개</p><input type="hidden" value="110"></td>
							</tr>
							<tr class="qtr" id="q5">
								<th scope="row">BL</th>
								<td class="sent bar"><p>18,415개</p><input type="hidden" value="110"></td>
							</tr>
						</tbody>
					</table>
					
					<div id="ticks">
					<div class="tick" style="height: 59px;"><p>50000</p></div>
					<div class="tick" style="height: 59px;"><p>40000</p></div>
					<div class="tick" style="height: 59px;"><p>30000</p></div>
					<div class="tick" style="height: 59px;"><p>20000</p></div>
					<div class="tick" style="height: 59px;"><p>10000</p></div>
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
						<tr>
							<td>1</td>
							<td>나의머리는 금수저</td>
							<td>전상헌</td>
							<td>4.4</td>
							<td>222</td>
							<td>머릿속</td>
						</tr>
						<tr>
							<td>2</td>
							<td>IT샛별에게전하는말</td>
							<td>염현우</td>
							<td>3.6</td>
							<td>111</td>
							<td>집</td>
						</tr>
						<tr>
							<td>3</td>
							<td>정답은 없다</td>
							<td>염현우</td>
							<td>3.6</td>
							<td>111</td>
							<td>집</td>
						</tr>
						<tr>
							<td>4</td>
							<td>오늘도 힘들다</td>
							<td>염현우</td>
							<td>3.6</td>
							<td>111</td>
							<td>집</td>
						</tr>
						<tr>
							<td>5</td>
							<td>내일도 어렵다</td>
							<td>염현우</td>
							<td>3.6</td>
							<td>111</td>
							<td>집</td>
						</tr>
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