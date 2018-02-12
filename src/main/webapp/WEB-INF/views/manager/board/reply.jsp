<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/board_reply.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">
<script type="text/javascript">
	$(function() {
		$("#sh_member_reply_button").each(function(i, e) {
			$(e).click(function() {
				let target = $(".collapsable-notice").eq(i);
				if (target.css("display") == "none") {
					target.css("display", "inline-block");
				} else {
					target.css("display", "none");
				}
			});
		});
	});
</script>

<title>1:1문의 답장</title>
</head>
<body>
	<div id="sh_board_reply">
		<div class="sh_board_reply_header">
			<div class="sh_main_text">1:1 문의</div>
			<div class="sh_board_reply_title">
				<ul>
					<li><span>제목</span></li>
					<li><input type="text" size="90px" value="안녕하세요 "></li>
					<li><span>유형</span></li>
					<li><select>
							<option>결제/환불</option>
							<option>이용문의</option>
							<option>오류/활용</option>
							<option>시스템업데이트</option>
							<option>서비스제안</option>
							<option>기타</option>
					</select></li>
					<li><span>작성일</span></li>
					<li><input type="text" size="33px" value="2018/05/20 "></li>
					<li><span>작성자</span></li>
					<li><input type="text" size="33px" value="전상헌(jeonsh1220)"></li>
					<li><span>연락처</span></li>
					<li><input type="text" size="33px" value="010-4903-8834"></li>
					<li><span>내용</span></li>
					<li><textarea class ="sh_board_reply_text">
결제 20만원어치 했는데 10만원만 들어왔어여?!!!!!!!!
당장 해결해주세요!!!!!!!!!
뽀로로 봐야한단 말이예요!!!!!!!!!!!
					</textarea></li>

				</ul>
				
				<div class="sh_board_member_click">
					<button type="button" class="bf-button" onclick="javascript:void(0)" id="sh_member_reply_button">답글</button>
					<button type="button" class="bf-button">취소</button>
				</div>
				<div class="collapsable-notice" id="sh_member_hidden" style="display: none;">
					<textarea class="sh_board_reply_text">
결제 20만원어치 했는데 10만원만 들어왔어여?!!!!!!!!
당장 해결해주세요!!!!!!!!!
뽀로로 봐야한단 말이예요!!!!!!!!!!!
-------------------------------------------------------------------
안녕하세요. 북팩토리의 소중한 요묘누고객님

1:1문의 담당자 전상헌입니다.

항상 북팩토리를 이용해주시는 고객님께 감사 드리며,
보다 더 좋은 가격의 좋은 상품으로 만족을 드리는 북팩토리가 되겠습니다.
감사합니다.	
					</textarea>
					<div class="sh_board_reply_click">
					<button type="button" class="bf-button">확인</button>
					<button type="button" class="bf-button">취소</button>
					</div>
				</div>

			</div>

 
		</div>
	</div>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
</body>
</html>