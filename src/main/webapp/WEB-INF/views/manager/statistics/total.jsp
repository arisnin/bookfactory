<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>누적판매수</title>
    <c:set var="root" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${root}/css/basic/bootstrap.css">
   	<link rel="stylesheet" href="${root}/css/basic/reset.css">
  	<link rel="stylesheet" href="${root}/css/basic/commons.css">
  	<link rel="stylesheet" href="${root}/css/manager/preference.css">
	<link rel="stylesheet" href="${root}/css/basic/jquery-ui.css">
	<link rel="stylesheet" href="${root}/css/basic/jquery-ui.theme.css">
</head>
<body>
<div id="s_tt_wrapper">
		<section class="s_tt_main">
			<div class="s_tt_header"><h2>누적 판매수</h2></div>
			<div class="s_tt_content">
				<div class="bf-service-type-menu">
					<ul class="service-type-list s_t_cate">
						<li><a class="active" href="javascript:alert('전체')">전체</a></li>
						<li><a href="javascript:alert('일반')">일반</a></li>
						<li><a href="javascript:alert('로맨스')">로맨스</a></li>
						<li><a href="javascript:alert('판타지')">판타지</a></li>
						<li><a href="javascript:alert('만화')">만화</a></li>
						<li><a href="javascript:alert('BL')">BL</a></li>
					</ul>
					<ul class="service-type-list s_t_cate">
						<li><a class="active" href="javascript:alert('일주일')">일주일</a></li>
						<li><a href="javascript:alert('1개월')">1개월</a></li>
						<li><a href="javascript:alert('3개월')">3개월</a></li>
						<li><a href="javascript:alert('6개월')">6개월</a></li>
						<li><a href="javascript:alert('1년')">1년</a></li>
					</ul>
				</div>
    			<!-- <div id="s_tt_chart"></div> -->
    			<div><canvas id="totalChart"></canvas></div>
    			<div id="s_pr_info">
					<h3>누적 판매수 상세도</h3>
					<table class="table table-striped">
						<tr>
							<th><strong>전체순위</strong></th>
							<th>1일</th>
							<th>2일</th>
							<th>3일</th>
							<th>4일</th>
							<th>5일</th>	
							<th>6일</th>
							<th>7일</th>
						</tr>
						<tr>
							<td>일반</td>
							<td>10</td>
							<td>15</td>
							<td>25</td>
							<td>44</td>
							<td>45</td>
							<td>60</td>
							<td>65</td>
						</tr>
						<tr>
							<td>만화</td>
							<td>19</td>
							<td>20</td>
							<td>43</td>
							<td>43</td>
							<td>43</td>
							<td>55</td>
							<td>60</td>
						</tr>
						<tr>
							<td>판타지</td>
							<td>19</td>
							<td>22</td>
							<td>35</td>
							<td>37</td>
							<td>44</td>
							<td>52</td>
							<td>53</td>
						</tr>
						<tr>
							<td>로맨스</td>
							<td>9</td>
							<td>18</td>
							<td>25</td>
							<td>33</td>
							<td>37</td>
							<td>50</td>
							<td>52</td>
						</tr>
						<tr>
							<td>BL</td>
							<td>5</td>
							<td>15</td>
							<td>20</td>
							<td>22</td>
							<td>25</td>
							<td>27</td>
							<td>50</td>
						</tr>
					</table>
				</div>
    		</div>
    		
		</section>
	</div>
    
    <script src="${root}/script/basic/jquery.js"></script>
	<script src="${root}/script/basic/jquery-ui.js"></script>
    <script src="${root}/script/manager/jquery.flot.js"></script>
<%-- 	<script type="text/javascript" src="${root}/script/manager/st_tt.js"></script>
 --%>	
 	<script src="${root}/script/basic/bootstrap.js"></script>
 	<script src="${root}/script/manager/Chart.js"></script>
 	<script>
 	
var label1 = ["일반","로맨스","판타지","만화","BL"];
var x = ['전체'/* ,2 *//* ,3,4,5,6,7 */];
var data = [
	['${ilban}'/* ,18 *//* ,25,33,37,50,100 */],
	['${romance}'/* ,22 *//* ,35,37,44,52,53 */],
	['${fantasy}'/* ,20 *//* ,43,43,43,55,68 */],
	['${manhwa}'/* ,15 *//* ,20,22,25,27,33 */],
	['${bl}'/* ,15 *//* ,20,22,25,27,50 */]
	];

var ctx = document.getElementById('totalChart').getContext('2d');

var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'bar',

    // The data for our dataset
    data: {
        labels: x,
        xAxisID : "asdasd",
        datasets: [{
            label: label1[0],
            backgroundColor: '#ff8ea6',
            borderColor: '#ffe0e6',
            data: data[0]
        },{
        	label: label1[1],
        	backgroundColor: '#E8800C',
            borderColor: '#E8800C',
            data: data[1]
        },{
        	label: label1[2],
        	backgroundColor: '#FF0000',
            borderColor: '#FF0000',
            data: data[2]
        },{
        	label: label1[3],
        	backgroundColor: '#860CE8',
            borderColor: '#860CE8',
            data: data[3]
        },{
        	label: label1[4],
        	backgroundColor: '#0D72FF',
            borderColor: '#0D72FF',
            data: data[4]
        }]
    },

    // Configuration options go here
    options: {
    	layout: {
            padding: {
                left: 30,
                right: 50,
                top: 50,
                bottom: 0
            }
        },
        title: {
            display: true,
            text: '카테고리별 누적판매수',
            fontSize : 20,
            fontFamily : '나눔바른고딕',
            fontColor : 'black'
        }
    }
});
</script>
</body>
</html>


