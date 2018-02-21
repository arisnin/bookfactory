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
					<li><input type="text" size="90px" value="${boardContactDto.title } "></li>
					<li><span>유형</span></li>
					<li><select><option>${boardContactDto.q2_name }</option>
					</select></li>
					<li><span>작성일</span></li>
					<li><input type="text" size="33px" value=""></li>
					<li><span>작성자</span></li>
					<li><input type="text" size="33px" value="${boardContactDto.id}"></li>
					<li><span>연락처</span></li>
					<li><input type="text" size="33px" value="${boardContactDto.mem_phone}"></li>
					<li><span>파일첨부</span></li>
					<li><input type="file" class="bf-button bf-white-btn reply_file" value="${boardContactDto.file_name}"></li>
					<li><span>내용</span></li>
					<li><textarea class ="sh_board_reply_text">${boardContactDto.content}</textarea></li>
				</ul>
				<div class="sh_board_member_click">
					<button type="button" class="bf-button" onclick="javascript:void(0)" id="sh_member_reply_button">답글</button>
					<button type="button" class="bf-button">취소</button>
				</div>
				<div class="collapsable-notice" id="sh_member_hidden" style="display: none;">
					<textarea class="sh_board_reply_text sh_reply"></textarea>
					<div class="sh_board_reply_click">
					<button type="button" class="bf-button" onclick="javascript:location ='${root}/manager/boardReplyOk.do?id=${boardContactDto.id}'&pageNumber=${pageNumber}">확인</button>
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
	<script type="text/javascript"> 
	$(function () {
		$("#sh_member_reply_button").click(function() {
			var text = $(".sh_board_reply_text").text();
			var d = new Date();
			var m = d.getMonth()+1;
			var now = d.getFullYear()+ "-"+ m +"-" +d.getDate();
			
			
			$(".sh_reply").text(text+"\n"+"-----Original Message-----"+"\n"+
					"From: ${boardContactDto.id}"+"\n"+
					"To: 아이린"+"\n"+
					"Day:"+now+"\n"+
					"Subject:"+"\n");
		})

	});
	
	
	</script>
	
	
	
</body>
</html>