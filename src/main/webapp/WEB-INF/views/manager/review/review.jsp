<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root}/css/manager/review.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${root}/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root}/css/basic/jquery-ui.theme.css">
<link rel="stylesheet" href="${root}/css/basic/jquery-confirm.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">

<title>리뷰 관리자 페이지</title>
</head>
<body>
	<div id="sh_review">
		<div class="sh_main_text">리뷰 관리</div>
		
		<div id="sh_board_shadow">
			<div class="sh_review_header">

				<div class="sh_review_main">

					<div class="sh_review_search">
						<ul>
							<li>신고글</li>
							<li><input name="report" type="radio" checked="checked">전체</li>
							<li><input name="report" type="radio">신고건</li>
						</ul>

						<ul>
							<li>적립금</li>
							<li><input name="point" type="radio" checked="checked">전체</li>
							<li><input name="point" type="radio">예정</li>
							<li><input name="point" type="radio">완료</li>
						</ul>

					</div>
					<div class="sh_review_date">
						<ul>
							<li><input type="text" id="sh_date_start" placeholder="시작 날짜" /></li>
							<li>~<input type="text" id="sh_date_end" placeholder="종료 날짜" /></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day1">하루</button></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day7">일주일</button></li>
							<li><button type="button" class="bf-button bf-white-btn" id="sh_day30">한달</button></li>
							<li><button type="button" class="bf-button">검색</button></li>
						</ul>
					</div>
				</div>

				<div class="sh_review_select">
					<select>
						<option>최신글 순</option>
						<option>오래된 순</option>
						<option>신고 수</option>
						<option>별점 순</option>
					</select>
				</div>

			</div>
			<div class="sh_review_content">
				<div class="sh_review_title">
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="전체선택" id="allCheck" /> <span class="all-mark"></span><span class="checkbox-label"></span>
						</label></li>
						<li>No</li>
						<li>도서 명</li>
						<li>제 목</li>
						<li>작성자</li>
						<li>별점</li>
						<li>적립금</li>
						<li>작성일</li>
						<li>신고수</li>
						<li>비공개/삭제</li>
					</ul>
				</div>
				<div class="sh_review_list">
					<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
					<!-- 1번예제 -->
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span>
						</label></li>
						<li>1</li>
						<li><a href="#">아프니깐 청춘이다.</a></li>
						<!--책정보 넘어가기-->
						<li><a href="javascript:void(0)" class="sh_review_detail_button">정말 좋은책인 것 ...</a></li>
						<!-- 댓글페이지 넘어가기 -->
						<li><a href="${root}/manager/memberRegister.do">전상헌</a></li>
						<li>
							<div class="content-star-rate">
								<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
							</div> <!-- <div class="sh_content-star-rate1">
						<span class="star-icon-field material-icons"></span>
					</div> -->
						</li>
						<li><button type="button" class="bf-button sh_button_point">적립금 800원</button></li>

						<li>18/01/22</li>

						<!-- 회원정보로 넘어가기-->
						<li><a href="${root}/manager/reviewReport.do">2</a></li>
						<li><button type="button" type="button" class="bf-button bf-white-btn sh_review_secret">비공개</button>
					<button type="button" type="button" class="bf-button bf-white-btn sh_review_open" style="display: none">공개</button>
							<button type="button" type="button" class="bf-button bf-white-btn sh_review_delete">삭제</button></li>
					</ul>

					<div class="collapsable-notice" id="sh_review_hidden" style="display: none;">
						<p>
							가볍게 읽기에 재밌다. 분량도 많지 않아서 두 시간 동안 뚝딱 읽어 낼 수 있다. 기존작이 떠오르는 스토리 라인에 흥미가 돋았는데, 다 읽고 나서 해설을 보고 확실히 알게 되었다. 나미야잡화점도 라플라스의 마녀도 조금씩 생각난다. 개인적인 취향으로는 장편이 훨씬 좋다. 주인공들의 기묘한 이야기들.. 상상력을 펼쳐 추리를 해야하는 부분들이 매력적인 작가라서 그런지 단편은 너무 급하게 마무리 되는 느낌이라 아쉽다. 요즘 무슨 책 읽어보지? 라는 생각이 든다면
							<그대 눈동자에 건배> 가볍게 추천! 장르 상관 없이 단숨에 읽을 수 있는 책이다. 
						</p>
					</div>
					<!-- 2번예제 -->
					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="목록" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span>
						</label></li>
						<li>2</li>
						<li><a href="#">자바의 정석</a></li>
						<!--책정보 넘어가기-->
						<li><a href="javascript:void(0)" class="sh_review_detail_button">도움이정말 되었습니다.</a></li>
						<li><a href="${root}/manager/memberRegister.do">안주영</a></li>
						<li>
							<div class="content-star-rate">
								<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
							</div> <!-- <div class="sh_content-star-rate1">
						<span class="star-icon-field material-icons"></span>
					</div> -->
						</li>
						<li><button type="button" type="button" class="bf-button sh_button_point">적립금 300원</button></li>
						<li>18/01/11</li>
						<!-- 회원정보로 넘어가기-->
						<li><a href="${root}/manager/reviewReport.do">22</a></li>
						<li><button type="button" type="button" class="bf-button bf-white-btn sh_review_secret">비공개</button>
							<button type="button" type="button" class="bf-button bf-white-btn sh_review_open" style="display: none">공개</button>
							<button type="button" type="button" class="bf-button bf-white-btn sh_review_delete">삭제</button></li>
					</ul>
					<div class="collapsable-notice" id="sh_review_hidden" style="display: none;">
						<p>뒷부분이 좀 전형적인 권선징악인가 싶은 느낌이 들기도 하지만, 저자가 할머니에게 들은 옛날 얘기에 기반을 두고 쓴 것이라는 점을 염두에 둔다면 현대를 배경으로 한 훙미로운 각색이라고 생각됩니다. 유명 서양 전래동화의 다수가 본래 버전은 잔혹동화라고 하죠. 옛이야기의 그런 오리지널 느낌을 그대로 현대로 가져와 적절한 배경에서 새롭게 보여주는 이야기예요. 미리 스포를 다 알고 봤어도 흥미진진했어요.</p>
					</div>
					<!-- 3번예제 -->


					<ul>
						<li><label class="bf-custom-checkbox"> <input type="checkbox" title="구매목록 책 전체선택" class="sh_check" /> <span class="all-mark"></span><span class="checkbox-label"></span>
						</label></li>
						<li>3</li>
						<li><a href="#">인터페이스</a></li>
						<!--책정보 넘어가기-->
						<li><a href="javascript:void(0)" class="sh_review_detail_button">인터페이스</a></li>
						<li><a href="${root}/manager/memberRegister.do">김두한</a></li>
						<li>
							<div class="content-star-rate">
								<!-- 별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨-->
								<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
							</div> <!-- <div class="sh_content-star-rate1">
						<span class="star-icon-field material-icons"></span>
					</div> -->
						</li>
						<li><button type="button" type="button" class="bf-button sh_button_point">적립금 700원</button></li>
						<li>18/01/13</li>
						<!-- 회원정보로 넘어가기-->
						<li><a href="${root}/manager/reviewReport.do">55</a></li>
						<li><button type="button" type="button" class="bf-button bf-white-btn sh_review_secret">비공개</button>
							<button type="button" type="button" class="bf-button bf-white-btn sh_review_open" style="display: none">공개</button>
							<button type="button" type="button" class="bf-button bf-white-btn sh_review_delete">삭제</button></li>
					</ul>
					<div class="collapsable-notice" id="sh_review_hidden" style="display: none;">
						<p>2018.01.05 신고 잘 읽히는 편이기는하지만 일부러 자극적이게 표현하려는게 고루하다는 생각이 들었습니다. 약한 반전 이외에는 예상했던 대로 흘러가서 나중에는 흥미를 잃었습니다.</p>
					</div>

				</div>
			</div>
			<div class="sh_review_footer">
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
	<script type="text/javascript" src="${root}/script/basic/jquery-confirm.js"></script>
	<script type="text/javascript" src="${root}/script/manager/review.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>


	
</body>
</html>