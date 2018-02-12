<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 미리보기</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/icon/css/fontello.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" type="text/css" href="${root}/css/book/example.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/book/example3.js"></script>
<script type="text/javascript" src="${root}/script/book/thinScrollbar_1.0.js"></script>
</head>
<body class="example_body">
	<!-- 상세보기에서 미리보기 버튼누를시 보이는 화면 -최정은 -->
	<div class="exampleAll">
		<div>
			<div class="example_left">
				<div class="example_left_head">
					<div class="example_left_head_title">
						<button onclick="location.href='${root}/detail.do'">&lsaquo;</button>
						<span>책제목</span>
					</div>
					<div class="example_left_head_button">
						<button class="bf-button bf-white-btn">글자축소</button>
						<button class="bf-button bf-white-btn">글자확대</button>
					</div>
				</div>
				<div class="example_left_content">
					<div>
						<button>&lsaquo;</button>
						<div>
							<img src="${root}/img/example/example1.PNG">
							<div class="textView">
								가상화폐 규제 논란 고마워!법무부와 금융위원회 등이 가상화폐 거래를 규제하겠다고 연일 ‘엄포’를 놔 사회적으로 논란이 일고 있는 가운데,
								블록체인 기술 개발 정책을 맡고 있는 과학기술정보통신부와 블록체인 기술 활용에 나선 시스템통합(SI) 사업자 등이 겉으로는 “기술 발전과 활용을 가로막을 수 있다”고
								불평하면서 속으로는 ‘미소’를 짓는 모습도 보여 주목된다.기정통부 관계자는 지난 18일 저녁 ‘출입기자 대상 블록체인 스터디’를 마친 뒤 따로 기자들을 만난 자리에서
								 “가상화폐 규제 문제로 시끄러웠던 덕에 많은 국민들이 블록체인이란 용어를 낮설어하지 않고, 블록체인 기술에 관심을 갖는 사람들도 많아졌다”고 말했다. 
								 가상화폐 규제 문제를 두고 사회적으로 논란이 벌어지고 있는 것은 아쉽지만, 국민들이 블록체인이란 용어와 기술에 관심을 갖게 하는 순기능도 있다는 얘기다.
								 다른 정부 관계자는 블록체인과 가상화폐 논란을 1990년대 후반에 있었던 초고속인터넷(ADSL)과 ‘○○의 비디오’ 논란에 비유하기도 했다. 이 관계자는 
								 “당시에도 국가정보화 추진과 관련해 초고속인터넷의 효용성과 조기 보급 필요성을 국민들에게 설명하는데 어려움을 겪고 있었는데, ‘○○의 비디오’란 게 유출돼 
								 사회적으로 이슈가 되는 과정에서 자연스럽게 해결됐다고 당시 경험을 털어놨다.시스템통합 사업자 등 정보기술(IT) 업체들도 속으로는 “나쁘지 않다”는 반응을 
								 보였다. 한 시스템통합 업체 임원은 “블록체인 기술을 앞세운지 오래 됐지만, 지금도 고객사 경영진이나 언론 등에 블록체인 기술을 설명하는데 어려움을 겪고 있다. 
								 그런데 가상화폐 논란 이후 방송사가 토론회까지 열어 블록체인 기술에 대해 설명을 해주니까 요즘은 최소한 용어를 낮설어하지는 않는다고 말했다. 
								 이 임원은 고객사 쪽이 블록체인 기술에 설명 좀 해달라고 요청해오기까지 한다고 덧붙였다.이에 블록체인 기술 활용이 빠르게 확산될 것으로 보인다. 
								 과기정통부는 이날 “기업, 금융기관, 지방자치단체, 정부기관 등이 블록체인 기술 적용에 잇따라 나서고 있다. 
								 서울시는 블록체인 기술을 활용해 미취업 청년 수당 지급 과정과 중고차 매매 과정의 투명성을 높이고,
								  경기도는 투명하고 신뢰성 있는 기부문화 정착을 위해 블록체인 기술을 활용하기로 했다고 밝히며 블록체인 기술 개발과 기술간 연동성 확보, 
								  표준화, 관련 법과 제도 정비 작업에 더욱 속도를 낼 것이라고 말했다.블록체인 기술을 활용하거나 가상화폐의 활용도를 높여주는 창업도 잇따르고 있다. 
								  스타트업 코인덕은 가상화폐 ‘이더리움’으로 물품을 사거나 숙박비를 결제할 수 있게 하는 서비스를 시작했다. 가맹점에 전자지갑 앱을 내밀면 5초만에 결제가 이뤄진다.
								   이 업체는 동계올림픽이 열리는 평창 지역의 숙박업소나 스키 장비 대여 매장 등을 중심으로 가맹점을 모으고 있다.
								   스타트업 글래스코는 블록체인 기술을 활용해 서울 노원구 안에서만 쓸 수 있는 지역화폐 ‘노원(NW)’을 개발했다. 
								   다음 달 선보일 예정인 노원은 사회적 가치를 경제적 가치로 바꾸는데 블록체인 기술을 활용했다. 
								   지역 안에서 자원봉사나 재능기부 등을 하면 노원 화폐를 받아 현금처럼 쓸 수 있다. 
								   블록체인을 활용한 지역화폐는 세계 최초 시도다.과기정통부에 딸린 정보통신기술센터의 박현제 미래성장동력 지능형사물인터넷 추진단장(공학박사)는 
								   “블록체인은 메인프레임, 클라이언트-서버, 클라우드의 뒤를 잇는 새로운 컴퓨팅 기술 성격이 짙다”며 “각각 앞서 지배력을 가졌던 기술의 단점과 
								   폐해에 대한 반성에서 등장했다는 점을 감안할 때, 블록체인이 클라우드의 뒤를 이어 새로운 산업과 시장을 만들어낼 것”이라고 말했다. 
								   그는 “중앙집중(메인프레임)에서 분산형(클라이언트-서버)으로 갔다가 다시 중앙화(클라우드)로 방향을 틀었다가 더욱 극단적인 분산화(블록체인)로 가는 
								   모습도 이채롭다”고 덧붙였다.";
								    지역 안에서 자원봉사나 재능기부 등을 하면 노원 화폐를 받아 현금처럼 쓸 수 있다. 
								   블록체인을 활용한 지역화폐는 세계 최초 시도다.과기정통부에 딸린 정보통신기술센터의 박현제 미래성장동력 지능형사물인터넷 추진단장(공학박사)는 
								   “블록체인은 메인프레임, 클라이언트-서버, 클라우드의 뒤를 잇는 새로운 컴퓨팅 기술 성격이 짙다”며 “각각 앞서 지배력을 가졌던 기술의 단점과 
								   폐해에 대한 반성에서 등장했다는 점을 감안할 때, 블록체인이 클라우드의 뒤를 이어 새로운 산업과 시장을 만들어낼 것”이라고 말했다. 
								   그는 “중앙집중(메인프레임)에서 분산형(클라이언트-서버)으로 갔다가 다시 중앙화(클라우드)로 방향을 틀었다가 더욱 극단적인 분산화(블록체인)로 가는 
								   모습도 이채롭다”고 덧붙였다.";
							 </div>
						</div>
						<button>&rsaquo;</button>
					</div>
				</div>
				<div class="example_left_bottom">
					<div class="bf-index-btn-form">
						<div class="index-of-page">
							<span class="current"></span>
							/
							<span class="total"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="example_right">
				<div class="example_right_head">
					<div class="example_right_head_title">
						<span>목차</span>
					</div>
				</div>
				<div class="example_right_content">
					<div>
						<ul>
							<li class="example_active">
								<button>프롤로그</button>
							</li>
							<li>
								<button>제1장</button>
							</li>
							<li class="no_view">
								<button>제2장</button>
							</li>
							<li class="no_view">
								<button>제3장</button>
							</li>
							<li class="no_view">
								<button>제4장</button>
							</li>
							<li class="no_view">
								<button>제5장</button>
							</li>
							<li class="no_view">
								<button>에필로그</button>
							</li>
						</ul>
					</div>
				</div>
				<div class="example_left_bottom"></div>
			</div>
		</div>
	</div>

</body>
</html>