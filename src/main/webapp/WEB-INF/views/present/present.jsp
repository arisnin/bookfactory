<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath }" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${root}/css/present/present.css">
<link rel="stylesheet" type="text/css"
	href="${root}/css/present/presentPay.css">
<link rel="stylesheet" type="text/css"
	href="${root}/css/order/order.css">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$(".present_receiver_id_input").attr("value", "리디북스 아이디를 입력해주세요.").css(
				"color", "#999");
		$(".present_msg_textarea").text("선물과 함께 보낼 메세지를 입력해주세요").css("color",
				"#999");

		$(".present_receiver_id_input").on("click", function() {
			$(this).attr("value", "").css("color", "black");
		});

		$(".present_msg_textarea").on("click", function() {
			$(this).text("").css("color", "black");
		});
	});
</script>
</head>
<body>
	<div class="wrap-container" style="margin-top:-2rem;">
		<div class="present_backgroundColor">
			<div>
				<h2 class="present_header">전자책 선물로 마음을 전하세요!</h2>
				<p class="present_header_text">
					좋은 책을 나누는 즐거움<br>문자, 이메일을 통해 간편하게 전자책을 선물하세요!
				</p>
				<div class="present_header_img">
					<a><img width="200px" height="300px"
						src="https://misc.ridibooks.com/cover/1932000400/xxlarge"></a>
				</div>
				<div class="present_header_bookName">속자치통감 4권</div><span class="font_16">필원</span>
			</div>
		</div>

		<div class="present_content">
			<div class="present_send">
				<div class="present_content_text">보내는 분</div>
				<div class="content-right">
					<input type="text" class="present_content_text_input" value="현재아이디" disabled="disabled">
				</div>
			</div>
			<div class="present_receiver">

				<div class="present_content_text">
					<div class="present_icon_sizeColor">
						<i class="material-icons">person</i>
					</div>
					선물 받는 분
				</div>
				<div class="content-right" style="overflow: hidden;">
					<input class="present_receiver_id_input" type="text">
				</div>

				<span class="present_receiver_id_tootip">받는 분이 가지고 있는 책은 선물 할
					수 없습니다.</span>
			</div>
			<div class="present_msg">

				<div class="present_content_text">
					<div class="present_icon_sizeColor">
						<i class="material-icons">edit</i>
					</div>
					선물 메시지
				</div>
				<div class="content-right">
					<textarea class="present_msg_textarea"></textarea>
				</div>
			</div>
			<div class="present_bt">
				<button class="order_right_menu_paybutton bf-button bf-animated-btn"
					onclick="javascript:location.href='${root}/presentPay.do'">결제하기가기</button>
			</div>
		</div>
	</div>
</body>
</html>