<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">
<title>북팩토리</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/companyIntro.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
</head>
<body id="mapBody">
<!-- 회사소개 페이지 - 최정은 -->
 <div id="map"></div>
    <script type="text/javascript">
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.2621562, lng: 127.1590843},
          zoom: 18,
          mapTypeId: 'roadmap'
        });
        
        //아이콘 이미지 수정해야함
        var iconBase= new google.maps.MarkerImage("${root}/img/icon2.png", null, null, null, new google.maps.Size(150,100));
        var marker = new google.maps.Marker({
            position: {lat: 37.2621562, lng: 127.1590843},
            map: map,
            icon:iconBase
          });
        marker.addListener('click', function(){
        	marker.setAnimation(google.maps.Animation.BOUNCE);
        });
      }
      
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDifisIGuPuuJg7sg8rWIueYcgldofv9yQ&callback=initMap"
    async defer></script>
	<div id="companyIntro">
		<div>
			<div class="company_right_click">
				<button class="company_title">프로젝트 연대기</button>
				<div><a href="${root}/normal.do">메인홈페이지로</a></div>
				<div class="click_event_absolute">
					<div class="event_stick"></div>
					<div class="event_start">프로젝트 시작 18.01.17<span></span></div>
					<div class="event_view">18.02.02 뷰 구현<span></span></div>
					<div class="event_db">데이터베이스 설계 18.02.09<span></span></div>
					<div class="event_func">18.03.05 기능 구현<span></span></div>
					<div class="event_pre">발표 18.03.06<span></span></div>
<!-- 					<div class="event_to">팀원</div> -->
<!-- 					<div class="event_to_tri"></div> -->
<!-- 					<div class="event_to_li"> -->
<!-- 						<ul> -->
<!-- 							<li>박성호</li> -->
<!-- 							<li>전상헌</li> -->
<!-- 							<li>김동환</li> -->
<!-- 							<li>염현우</li> -->
<!-- 							<li>김도현</li> -->
<!-- 							<li>정호열</li> -->
<!-- 							<li>최정은</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
				</div>
			</div>
			<div class="company_left">
				<div class="company_title">주소와 연락처</div>
				<div class="company_sub">경기도 용인시 기흥구 동백중앙로 73</div>
				<div class="company_sub_child">73, Dongbaekjungang-ro, Giheung-gu, Yongin-si</div>
				<div class="company_sub">마스코트 : 정호열 (tel) 010-3573-1927</div>
			</div>
			<div class="company_right_basic">
				<div class="company_title">오시는길</div>
				<div class="company_sub">지하철 <span class="company_sub_child">기흥역 → 초당역</span></div>
				<div class="company_sub">버스  <span class="company_sub_child">360(역삼역) → 직행버스 5003A(신논현역.주류성빌딩)</span></div>
				<div class="company_sub">자가용 오는길   <span class="company_sub_child">언주로 → 대왕판교로 → 신수로 → 석성로</span></div>
			</div>
		</div>
	</div>
</body>
</html>