<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/board_update.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>게시판관리(수정)</title>
</head>
<body>
	<div id="sh_board_update">
		<div class="sh_board_update_header">
			<div class="sh_main_text">게시판관리(자주하는 질문 등록)</div>
			<div class="sh_board_update_main">
				<div id="sh_board_shadow">
					<div class="sh_board_update_search">
						<ul>
							<li><span>제목</span></li>
							<li><input type="text" placeholder=" 제목입력"></li>
							<li><span>문의유형</span></li>
							<li><select id="sh_board_update_change">
									<option>대분류</option>
									<option value="member">회원/이용 관련</option>
									<option value="pay">결제관련</option>
									<option value="update">업데이트/오류</option>
							</select></li>
							<li><select id="sh_board_update_1">
									<option>중분류</option>
									<optgroup label="------------------------------------------------------------------" class="member" style="display: none;">
										<option>회원가입</option>
										<option>로그인/비밀번호</option>
										<option>성인인증</option>
										<option>회원탈퇴</option>
									</optgroup>
									<optgroup label="------------------------------------------------------------------" class="pay" style="display: none;">
										<option>적립금/포인트</option>
										<option>리디캐시</option>
										<option>쿠폰</option>
										<option>신용카드 결제</option>
										<option>휴대폰결제</option>
										<option>현금 결제</option>
									</optgroup>
									<optgroup label="------------------------------------------------------------------" class="update" style="display: none;">
										<option>인터넷오류</option>
										<option>성인인증오류</option>
										<option>화면 오류</option>
										<option>버튼 오류</option>
										<option>시스템 업그레이드 </option>
									</optgroup>
							</select></li>
							<li><span>파일첨부</span></li>
							<li><input type="file" class="bf-button bf-white-btn" style="width: 48rem; height: 1.9rem;"></li>
							<li><span>내용</span></li>
							<li><textarea class="sh_reply_text"></textarea></li>
						</ul>
					</div>
					<div class="sh_board_update_content">
						<button type="button" class="bf-button">등록</button>
						<input type="reset" value="취소" class="bf-button" />
					</div>

				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#sh_board_update_change").change(function() {
						var value = $(this).val();
						var me = $("#sh_board_update_1").find("." + value);
						me.css("display", "block");
						$("#sh_board_update_1 >optgroup").not(me).css("display","none");
						$("#sh_board_update_1 >option").prop("selected",true);
				}); 
			});

	</script>
</body>
</html>










