<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
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
							<li><p>${managerCashDto.member_name }</p> <span>(${managerCashDto.cash_id })님</span></li>
							<li><p>북팩 충전금</p> <span>${managerCashDto.cash_total } 원</span></li>
							<li><p>적립금</p> <span>${managerCashDto.point_total} point</span></li>
							<li><p>쿠폰</p> <span>3 장</span></li>
						</ul>
					</div>
					<div class="sh_member_detail_inf2">
						<span>적립금부여</span><input type="text">
						<button type="button" style="height: 2.2rem;" class="bf-button bf-white-btn sh_point" id ="point-add">적립</button>
					</div>
				</div>

				<div class="sh_member_detail_content">
					<div class="sh_member_detail">
						<ul>
							<li><a href="#sh_member_detail_list-1"><span>결제관리</span></a></li>
							<li><a href="#sh_member_detail_list-2"><span>충전관리</span></a></li>
							<li><a href="#sh_member_detail_list-3"><span>적립내역</span></a></li>
						</ul>
							
						<!--  결제관리페이지 -->
						<div class="sh_member_detail_list" id="sh_member_detail_list-1">
							<div class="sh_member_detail_title">
								<ul>
									<li>순번</li>
									<li>주문번호</li>
									<li>사용내역</li>
									<li>현금사용(충전금)</li>
									<li>포인트 사용</li>
									<li>등록일자</li>
								</ul>
							</div>
							<div class="sh_member_detail_ex">
								<c:forEach var="managerPayDto" items="${managerPayDtoList}">
									<ul>
									<li>${managerPayDto.num }</li>
									<li>${managerPayDto.order_num }</li>
									<li>${managerPayDto.book_name }</li>
									<li>${managerPayDto.direct_cash}원(${managerPayDto.cash_use}원)</li>
									<li>${managerPayDto.point_use}point</li>
									<li><fmt:formatDate value="${managerPayDto.payment_date}" pattern="yyyy-MM-dd"/></li>
								
								</ul>
								</c:forEach>						
				
							</div>
						</div>
						
						
						<div class="sh_member_detail_list" id="sh_member_detail_list-2">
								<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
								<!-- 적립금 페이지 제목-->
								<div class="sh_member_detail_title">
									<ul>
										<li>순번</li>
										<li>충전번호</li>
										<li>충전수단</li>
										<li>충전금액</li>
										<li>적립포인트</li>
										<li>충전일자</li>
									</ul>
								</div>
								<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
						
								<div class="sh_member_detail_ex">
								<c:forEach var="managerChargeDto" items="${managerChargeDtoList}">
									<ul>
										<li>${managerChargeDto.num }</li>
										<li>${managerChargeDto.order_num }</li>
										<li>${managerChargeDto.charge_type}</li>
										<li>${managerChargeDto.charge_cash }원</li>
										<li>${managerChargeDto.point}point</li>
										<li><fmt:formatDate value="${managerChargeDto.charge_date}" pattern="yyyy-MM-dd"/></li>
									</ul>
								</c:forEach>
								</div>
							</div>

				
							<!--  적립금 관리 페이지 -->
							<div class="sh_member_detail_list" id="sh_member_detail_list-3">
								<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
								<!-- 적립금 페이지 제목-->
								<div class="sh_member_detail_title">
									<ul>
										<li>순번</li>
										<li>주문번호</li>
										<li>적립구분</li>
										<li>적립금</li>
										<li>등록일자</li>
										<li>소멸일자</li>
									</ul>
								</div>
								<!-- for문으로 체크박스랑 등등 정보 돌려야함 . 임시적으로 두개 해놈 -->
								<!-- 첫번째 예제 -->
								<div class="sh_member_detail_ex">
									<c:forEach var="managerPointDto" items="${managerPointDtoList}">
									<ul>
										<li>${managerPointDto.num }</li>
										<li>${managerPointDto.order_num }</li>
										<li>${managerPointDto.point_type}</li>
										<li>${managerPointDto.point }point</li>
										<li><fmt:formatDate value="${managerPointDto.charge_date}" pattern="yyyy-MM-dd"/></li>
										<li><fmt:formatDate value="${managerPointDto.dstrory_date}" pattern="yyyy-MM-dd"/></li>
									</ul>
								</c:forEach>
								
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
</div>
		<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
		<script type="text/javascript" src="${root}/script/basic/jquery.js"></script> 
		<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
		<script type="text/javascript" src="${root}/script/basic/jquery-confirm.js"></script>
		<script type="text/javascript" src="${root}/script/manager/total.js"></script>
		<script type="text/javascript" src="${root}/script/manager/member.js"></script>
<script type="text/javascript">
	$(function() {
		$("#point-add").click(function(event){
			var input =$(".sh_member_detail_inf2").find("input").val()
			var aa= "${managerCashDto.cash_id}";
			alert(aa);
				$.confirm({
					title : '적립금',
					content : '적립금을 부여하시겠습니까?!',
					buttons : {
						confirm : function() {
							$.alert('적립금 부여 완료');
					 		var target = $(event.target);
					 		
							memberPointInsert(input,aa);
						},
						cancel : function() {
							$.alert('적립금을 부여하지않았습니다.');
						}

					},
					type : '#A59AF6'
				});
		})
	})
	function memberPointInsert(point,id) {
		$.post('${root}/manager/memberPointInsert.do',{point:point,id:id}, function(data,status){
			alert(data);	
		})
	}
</script>
</body>
</html>