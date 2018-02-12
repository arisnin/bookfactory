<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css"
	href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/review_report.css">
<link rel="stylesheet" href="${root}/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root}/css/basic/jquery-ui.theme.css">
<title>신고 관리페이지</title>
</head>
<body>
	<div id="sh_review_report">
	
		<div class="sh_review_report_header">
			<div class="sh_main_text">신고 관리 페이지</div>
			  <div id="sh_board_shadow">
			<div class="sh_review_report_main">
				<ul>
					<li><span>해당리뷰 번호 :</span>102번</li>
					<li><span>총 신고수 : </span> 5개</li>
					<li><button type="button" class="bf-button">리뷰로 돌아가기</button>
					</li>
				</ul>
			</div>

			<div class="sh_review_report_content">
				<!--  결제관리페이지 -->
				<div class="sh_review_report_list" id="sh_review_report_list-1">
					<div class="sh_review_report_title">
						<ul>
							<li>리뷰번호</li>
							<li>신고번호</li>
							<li>리뷰제목</li>
							<li>신고종류</li>
							<li>신고자</li>
							<li>신고일자</li>
						</ul>
					</div>
					<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
					<div class="sh_review_report_list">
						<!-- 1번예제 -->
						<ul>
							<li>102</li>
							<li>1</li>
							<!--책정보 넘어가기-->
							<li><a href="javascript:void(0)"
								class="sh_report_detail_button">정말 좋은책인 것 ...</a></li>
							<li>욕설/비속어</li>
							<li>전상헌</li>
							<li>18/01/22</li>
						</ul>
						<div class="collapsable-notice" id="sh_report_hidden"
							style="display: none;">
							<p>
								가볍게 읽기에 재밌다. 분량도 많지 않아서 두 시간 동안 뚝딱 읽어 낼 수 있다. 기존작이 떠오르는 스토리 라인에
								흥미가 돋았는데, 다 읽고 나서 해설을 보고 확실히 알게 되었다. 나미야잡화점도 라플라스의 마녀도 조금씩 생각난다.
								개인적인 취향으로는 장편이 훨씬 좋다. 주인공들의 기묘한 이야기들.. 상상력을 펼쳐 추리를 해야하는 부분들이
								매력적인 작가라서 그런지 단편은 너무 급하게 마무리 되는 느낌이라 아쉽다. 요즘 무슨 책 읽어보지? 라는 생각이
								든다면
								<그대 눈동자에 건배> 가볍게 추천! 장르 상관 없이 단숨에 읽을 수 있는 책이다. 
							</p>
						</div>
						<!-- 2번예제 -->
						<ul>
							<li>102</li>
							<li>2</li>
							<!--책정보 넘어가기-->
							<li><a href="javascript:void(0)"
								class="sh_report_detail_button">정말 좋은책인 것 ...</a></li>
							<li>타인/특정 종교 민족 계층 비방</li>
							<li>염현우</li>
							<li>18/01/20</li>
						</ul>
						<div class="collapsable-notice" id="sh_report_hidden"
							style="display: none;">
							<p>
								가볍게 읽기에 재밌다. 분량도 많지 않아서 두 시간 동안 뚝딱 읽어 낼 수 있다. 기존작이 떠오르는 스토리 라인에
								흥미가 돋았는데, 다 읽고 나서 해설을 보고 확실히 알게 되었다. 나미야잡화점도 라플라스의 마녀도 조금씩 생각난다.
								개인적인 취향으로는 장편이 훨씬 좋다. 주인공들의 기묘한 이야기들.. 상상력을 펼쳐 추리를 해야하는 부분들이
								매력적인 작가라서 그런지 단편은 너무 급하게 마무리 되는 느낌이라 아쉽다. 요즘 무슨 책 읽어보지? 라는 생각이
								든다면
								<그대 눈동자에 건배> 가볍게 추천! 장르 상관 없이 단숨에 읽을 수 있는 책이다. 
							</p>
						</div>
						<!-- 3번예제 -->
						<ul>
							<li>102</li>
							<li>3</li>
							<!--책정보 넘어가기-->
							<li><a href="javascript:void(0)"
								class="sh_report_detail_button">정말 좋은책인 것 ...</a></li>	
							<li>음란성/선정성</li>
							<li>정호열</li>
							<li>17/12/28</li>
						</ul>
						<div class="collapsable-notice" id="sh_report_hidden"
							style="display: none;">
							<p>
								가볍게 읽기에 재밌다. 분량도 많지 않아서 두 시간 동안 뚝딱 읽어 낼 수 있다. 기존작이 떠오르는 스토리 라인에
								흥미가 돋았는데, 다 읽고 나서 해설을 보고 확실히 알게 되었다. 나미야잡화점도 라플라스의 마녀도 조금씩 생각난다.
								개인적인 취향으로는 장편이 훨씬 좋다. 주인공들의 기묘한 이야기들.. 상상력을 펼쳐 추리를 해야하는 부분들이
								매력적인 작가라서 그런지 단편은 너무 급하게 마무리 되는 느낌이라 아쉽다. 요즘 무슨 책 읽어보지? 라는 생각이
								든다면
								<그대 눈동자에 건배> 가볍게 추천! 장르 상관 없이 단숨에 읽을 수 있는 책이다. 
							</p>
						</div>
					</div>
				</div>

			</div>
		</div>

	<div class="sh_review_report_footer">
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
	</div>
	</div>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
	<script type="text/javascript" src="${root}/script/manager/review_report.js"></script>
</body>
</html>