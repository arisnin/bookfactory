<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>전체보기 네비게이션</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/category/navigation.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="wrap-container ca-navi-box">
		<div class="bf-title-row title-type3">
			<h3>전체분야</h3>
		</div>
		<nav class="navigation">
			<!-- 소설 -->
			<a class="bf-button bf-transparent-btn accordion " data-main-category-num="100" href="javascript:void(0)">소설</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="100" href="javascript:void(0)">소설 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="101" href="javascript:void(0)">한국소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="102" href="javascript:void(0)">영미소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="103" href="javascript:void(0)">일본소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="104" href="javascript:void(0)">중국소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="105" href="javascript:void(0)">북유럽소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="106" href="javascript:void(0)">독일소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="107" href="javascript:void(0)">프랑스소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="108" href="javascript:void(0)">기타국가소설</a></li>
				
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="109" href="javascript:void(0)">추리/미스터리/스릴러</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="110" href="javascript:void(0)">SF소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="111" href="javascript:void(0)">국내판타지소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="112" href="javascript:void(0)">해외판타지소설</a></li>
				
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="113" href="javascript:void(0)">국내역사소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="114" href="javascript:void(0)">해외역사소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="115" href="javascript:void(0)">대체역사소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="116" href="javascript:void(0)">동양고전문학</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="117" href="javascript:void(0)">서양고전문학</a></li>
			</ul>
			
			<!-- 경영/경제 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="200" href="javascript:void(0)">경영/경제</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="200" href="javascript:void(0)">경영/경제 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="201" href="javascript:void(0)">경영일반</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="202" href="javascript:void(0)">경제일반</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="203" href="javascript:void(0)">마케팅/세일즈</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="204" href="javascript:void(0)">재테크/금융/부동산</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="205" href="javascript:void(0)">CEO/리더십</a></li>
			</ul>
			
			<!-- 인문/사회/역사 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="300" href="javascript:void(0)">인문/사회/역사</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="300" href="javascript:void(0)">인문/사회/역사 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="301" href="javascript:void(0)">인문</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="302" href="javascript:void(0)">정치/사회</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="303" href="javascript:void(0)">예술/문화</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="304" href="javascript:void(0)">역사</a></li>
			</ul>
			
			<!-- 자기계발 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="400" href="javascript:void(0)">자기계발</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="400" href="javascript:void(0)">자기계발 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="401" href="javascript:void(0)">성공/삶의자세</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="402" href="javascript:void(0)">기획/창의/리더십</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="403" href="javascript:void(0)">설득/화술/협상</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="404" href="javascript:void(0)">취업/창업</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="405" href="javascript:void(0)">여성</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="406" href="javascript:void(0)">인간관계</a></li>
			</ul>
			
			<!-- 에세이/시 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="500" href="javascript:void(0)">에세이/시</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="500" href="javascript:void(0)">에세이/시 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="501" href="javascript:void(0)">에세이</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="502" href="javascript:void(0)">시</a></li>
			</ul>
			
			<!-- 여행 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="600" href="javascript:void(0)">여행</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="600" href="javascript:void(0)">여행 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="601" href="javascript:void(0)">국내여행</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="602" href="javascript:void(0)">해외여행</a></li>
			</ul>
			
			<!-- 종교 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="700" href="javascript:void(0)">종교</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="700" href="javascript:void(0)">종교 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="701" href="javascript:void(0)">종교일반</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="702" href="javascript:void(0)">가톨릭</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="703" href="javascript:void(0)">기독교(개신교)</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="704" href="javascript:void(0)">불교</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="705" href="javascript:void(0)">기타</a></li>
			</ul>
			
			<!-- 외국어 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="800" href="javascript:void(0)">외국어</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="800" href="javascript:void(0)">외국어 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="801" href="javascript:void(0)">비즈니스영어</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="802" href="javascript:void(0)">일반영어</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="803" href="javascript:void(0)">제2외국어</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="804" href="javascript:void(0)">어학시험</a></li>
			</ul>
			
			<!-- 과학 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="900" href="javascript:void(0)">과학</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="900" href="javascript:void(0)">과학 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="901" href="javascript:void(0)">과학일반</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="902" href="javascript:void(0)">수학</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="903" href="javascript:void(0)">자연과학</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="904" href="javascript:void(0)">응용과학</a></li>
			</ul>
			
			<!-- 진로/교육/교재 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="1000" href="javascript:void(0)">진로/교육/교재</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1000" href="javascript:void(0)">진로/교육/교재 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1001" href="javascript:void(0)">공부법</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1002" href="javascript:void(0)">특목고/자사고</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1003" href="javascript:void(0)">대입 수시</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1004" href="javascript:void(0)">대입 논술</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1005" href="javascript:void(0)">대입 합격수기</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1006" href="javascript:void(0)">진로 탐색</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1007" href="javascript:void(0)">유학/MBA</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1008" href="javascript:void(0)">교재/수험서</a></li>
			</ul>
			
			<!-- 컴퓨터/IT -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="1100" href="javascript:void(0)">컴퓨터/IT</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1100" href="javascript:void(0)">컴퓨터/IT 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1101" href="javascript:void(0)">IT 비즈니스</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1102" href="javascript:void(0)">개발/프로그래밍</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1103" href="javascript:void(0)">컴퓨터/앱 활용</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1104" href="javascript:void(0)">IT 자격증</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1105" href="javascript:void(0)">IT 해외원서</a></li>
			</ul>
			
			<!-- 건강/다이어트 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="1200" href="javascript:void(0)">건강/다이어트</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1200" href="javascript:void(0)">건강/다이어트 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1201" href="javascript:void(0)">다이어트/운동/스포츠</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1202" href="javascript:void(0)">스타일/뷰티</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1203" href="javascript:void(0)">건강</a></li>
			</ul>
			
			<!-- 가정/생활 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="1300" href="javascript:void(0)">가정/생활</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1300" href="javascript:void(0)">가정/생활 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1301" href="javascript:void(0)">결혼/임신/출산</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1302" href="javascript:void(0)">육아/자녀교육</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1303" href="javascript:void(0)">취미/요리/기타</a></li>
			</ul>
			
			<!-- 어린이/청소년 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="1400" href="javascript:void(0)">어린이/청소년</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1400" href="javascript:void(0)">어린이/청소년 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1401" href="javascript:void(0)">유아</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1402" href="javascript:void(0)">어린이</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1403" href="javascript:void(0)">청소년</a></li>
			</ul>
			
			<!-- 해외도서 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="1500" href="javascript:void(0)">해외도서</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1500" href="javascript:void(0)">해외도서 전체</a></li>
			</ul>
			
			<!-- 잡지 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="1600" href="javascript:void(0)">잡지</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1600" href="javascript:void(0)">잡지 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1601" href="javascript:void(0)">경영/재테크</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1602" href="javascript:void(0)">문학/교양</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1603" href="javascript:void(0)">여성/패션/뷰티</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1604" href="javascript:void(0)">디자인/예술</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1605" href="javascript:void(0)">건강/스포츠</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1606" href="javascript:void(0)">취미/여행/요리</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1607" href="javascript:void(0)">과학/IT</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1608" href="javascript:void(0)">종교</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1609" href="javascript:void(0)">만화</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1610" href="javascript:void(0)">성인(19+)</a></li>
			</ul>
			
			<!-- 로맨스 단행본 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="1700" href="javascript:void(0)">로맨스 단행본</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1700" href="javascript:void(0)">로맨스 단행본 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1701" href="javascript:void(0)">현대물</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1702" href="javascript:void(0)">역사/시대물</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1703" href="javascript:void(0)">판타지물</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1704" href="javascript:void(0)">할리퀸소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1705" href="javascript:void(0)">19+</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1706" href="javascript:void(0)">TL소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1707" href="javascript:void(0)">섹슈얼 로맨스</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1708" href="javascript:void(0)">하이틴</a></li>
			</ul>
			
			<!-- 로맨스 연재 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="1800" href="javascript:void(0)">로맨스 연재</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1800" href="javascript:void(0)">로맨스 연재 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1801" href="javascript:void(0)">현대물</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1802" href="javascript:void(0)">역사/시대물</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1803" href="javascript:void(0)">판타지물</a></li>
			</ul>
			
			<!-- 판타지 단행본 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="1900" href="javascript:void(0)">판타지 단행본</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1900" href="javascript:void(0)">판타지 단행본 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1901" href="javascript:void(0)">정통판타지</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1902" href="javascript:void(0)">퓨전판타지</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1903" href="javascript:void(0)">현대판타지</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1904" href="javascript:void(0)">게임판타지</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1905" href="javascript:void(0)">대체역사물</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1906" href="javascript:void(0)">스포츠물</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1907" href="javascript:void(0)">신무협</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="1908" href="javascript:void(0)">전통무협</a></li>
			</ul>
			
			<!-- 판타지 연재 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="2000" href="javascript:void(0)">판타지 연재 </a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2000" href="javascript:void(0)">판타지 연재 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2001" href="javascript:void(0)">정통판타지</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2002" href="javascript:void(0)">퓨전판타지</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2003" href="javascript:void(0)">현대판타지</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2008" href="javascript:void(0)">무협소설</a></li>
			</ul>
			
			<!-- 만화 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="2100" href="javascript:void(0)">만화</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2100" href="javascript:void(0)">만화 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2101" href="javascript:void(0)">국내순정</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2102" href="javascript:void(0)">해외순정</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2103" href="javascript:void(0)">드라마</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2104" href="javascript:void(0)">성인(19+)</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2105" href="javascript:void(0)">할리퀸</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2106" href="javascript:void(0)">무협</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2107" href="javascript:void(0)">학원</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2108" href="javascript:void(0)">액션</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2109" href="javascript:void(0)">판타지/SF</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2110" href="javascript:void(0)">스포츠</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2111" href="javascript:void(0)">코믹</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2112" href="javascript:void(0)">공포/추리</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2113" href="javascript:void(0)">만화잡지</a></li>
			</ul>
			
			<!-- 라이트노벨 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="2200" href="javascript:void(0)">라이트노벨</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2200" href="javascript:void(0)">라이트노벨 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2201" href="javascript:void(0)">남성향 라노벨</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2202" href="javascript:void(0)">여성향 라노벨</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2203" href="javascript:void(0)">TL</a></li>
			</ul>
			
			<!-- BL 단행본 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="2300" href="javascript:void(0)">BL 단행본</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2300" href="javascript:void(0)">BL 단행본 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2301" href="javascript:void(0)">국내소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2302" href="javascript:void(0)">해외소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2303" href="javascript:void(0)">국내만화</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2304" href="javascript:void(0)">해외만화</a></li>
			</ul>
			
			<!-- BL 연재 -->
			<a class="bf-button bf-transparent-btn accordion" data-main-category-num="2400" href="javascript:void(0)">BL 연재</a>
			<ul class="panel">
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2400" href="javascript:void(0)">BL 연재 전체</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2401" href="javascript:void(0)">소설</a></li>
				<li><a class="bf-button bf-transparent-btn " data-sub-category-num="2402" href="javascript:void(0)">만화</a></li>
			</ul>
		</nav>
	</div>
	<script type="text/javascript">		
		var categoryNavigationLink = document.querySelectorAll(".ca-navi-box > .navigation a.bf-button");
		categoryNavigationLink.forEach(function(e,i) {
			let root = '${root}';
			e.addEventListener("click", function() {
				let cnum = e.getAttribute("data-main-category-num");
				if (cnum == null) {
					cnum = e.getAttribute("data-sub-category-num");
				}
				pageLocation(root, cnum);
			});
		});
		
		function pageLocation(root, cnum) {
			var url = "${root}/category.do?cnum=" + cnum;
			location.href = url;
		}
	</script>
</body>
</html>