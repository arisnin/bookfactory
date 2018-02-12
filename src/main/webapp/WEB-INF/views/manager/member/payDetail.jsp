<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/member_detail.css">
<link rel="stylesheet" href="${root}/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root}/css/basic/jquery-ui.theme.css">
<title>결제 관리 상세페이지</title>
</head>
<body>
	<div id="sh_member_detail">
		<div class="sh_member_detail_header">
			<div class="sh_main_text">개인 결제 관리 페이지</div>
			<div id="sh_board_shadow">
				<div class="sh_member_detail_main">
					<div class="sh_member_detail_inf">
						<ul>
							<li><p>전상헌</p> <span>(jeonsh1220) 님</span></li>
							<li><p>북팩 충전금</p> <span>70000 원</span></li>
							<li><p>적립금</p> <span>10000 point</span></li>
							<li><p>쿠폰</p> <span>3 장</span></li>
						</ul>
					</div>
					<div class="sh_member_detail_inf2">
						<span>적립금부여</span> <input type="text">
						<button type="button" style="height: 2.2rem;" class="bf-button bf-white-btn sh_point">적립</button>
					</div>
				</div>

				<div class="sh_member_detail_content">
					<div class="sh_member_detail">
						<ul>
							<li><a href="#sh_member_detail_list-1"><span>결제관리</span></a></li>
							<li><a href="#sh_member_detail_list-2"><span>적립금</span></a></li>
						</ul>

						<!--  결제관리페이지 -->
						<div class="sh_member_detail_list" id="sh_member_detail_list-1">
							<div class="sh_member_detail_title">
								<ul>
									<li>순번</li>
									<li>주문번호</li>
									<li>사용/충전내역</li>
									<li>사용/충전금액(적립금)</li>
									<li>남은금액</li>
									<li>등록일자</li>
								</ul>
							</div>
							<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
							<!-- 첫번째 예제 -->
							<div class="sh_member_detail_ex">
								<ul>
									<li>1</li>
									<li>2017221321</li>
									<li>BL-돈까스와의 사랑</li>
									<li>-9900원(100원)</li>
									<li>10000원</li>
									<li>2018/01/23</li>
								</ul>
								<!-- 두번째 예제 -->
								<ul>
									<li>2</li>
									<li>201566421</li>
									<li>1000원 충전</li>
									<li>1000원</li>
									<li>20000원</li>
									<li>2018/01/22</li>
								</ul>
								<!-- 세번째예제 -->
								<ul>
									<li>3</li>
									<li>20187451221</li>
									<li>만화-헬퍼</li>
									<li>-9900원(990원)</li>
									<li>19000원</li>
									<li>2018/01/21</li>
								</ul>

								<ul>
									<li>4</li>
									<li>2017221321</li>
									<li>BL-돈까스와의 사랑</li>
									<li>-9900원(100원)</li>
									<li>10000원</li>
									<li>2018/01/23</li>
								</ul>
								<!-- 두번째 예제 -->
								<ul>
									<li>5</li>
									<li>201566421</li>
									<li>1000원 충전</li>
									<li>1000원</li>
									<li>20000원</li>
									<li>2018/01/22</li>
								</ul>
								<!-- 세번째예제 -->
								<ul>
									<li>6</li>
									<li>20187451221</li>
									<li>만화-헬퍼</li>
									<li>-9900원(990원)</li>
									<li>19000원</li>
									<li>2018/01/21</li>
								</ul>
								<ul>
									<li>7</li>
									<li>2017221321</li>
									<li>BL-돈까스와의 사랑</li>
									<li>-9900원(100원)</li>
									<li>10000원</li>
									<li>2018/01/23</li>
								</ul>
								<!-- 두번째 예제 -->
								<ul>
									<li>8</li>
									<li>201566421</li>
									<li>1000원 충전</li>
									<li>1000원</li>
									<li>20000원</li>
									<li>2018/01/22</li>
								</ul>
								<!-- 세번째예제 -->
								<ul>
									<li>9</li>
									<li>20187451221</li>
									<li>만화-헬퍼</li>
									<li>-9900원(990원)</li>
									<li>19000원</li>
									<li>2018/01/21</li>
								</ul>
								<!-- 세번째예제 -->
								<ul>
									<li>10</li>
									<li>20187451221</li>
									<li>만화-헬퍼</li>
									<li>-9900원(990원)</li>
									<li>19000원</li>
									<li>2018/01/21</li>
								</ul>
							</div>
						</div>


						<div class="sh_member_detail_content">
							<!--  적립금 관리 페이지 -->
							<div class="sh_member_detail_list" id="sh_member_detail_list-2">
								<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
								<!-- 적립금 페이지 제목-->
								<div class="sh_member_detail_title">
									<ul>
										<li>순번</li>
										<li>주문번호</li>
										<li>상태</li>
										<li>적립구분</li>
										<li>적립금</li>
										<li>등록일자</li>
									</ul>
								</div>
								<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
								<!-- 첫번째 예제 -->
								<div class="sh_member_detail_ex">
									<ul>
										<li>1</li>
										<li>20180122111</li>
										<li>대기</li>
										<li>리뷰로 인한 적립금부여</li>
										<li>500원</li>
										<li>2018/01/22</li>
									</ul>
									<!-- 두번째 예제 -->
									<ul>
										<li>2</li>
										<li>20180123111</li>
										<li>승인</li>
										<li>적립금 사용</li>
										<li>-500원</li>
										<li>2018/01/23</li>
									</ul>
									<!-- 세번째예제 -->
									<ul>
										<li>3</li>
										<li>20180123111</li>
										<li>승인</li>
										<li>적립금 사용</li>
										<li>-500원</li>
										<li>2018/01/23</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="sh_member_detail_footer">
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

		<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
		<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
		<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
		<script type="text/javascript" src="${root}/script/manager/total.js"></script>
		<script type="text/javascript" src="${root}/script/manager/member.js"></script>
</body>
</html>