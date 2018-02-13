<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" href="${root }/css/manager/board_insert.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.css">
<link rel="stylesheet" href="${root }/css/basic/jquery-ui.theme.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<title>게시판관리(자주하는 질문 등록)</title>
</head>
<body>

	<div id="sh_board_insert">
		<div class="sh_board_insert_header">
			<div class="sh_main_text">게시판관리(자주하는 질문 등록)</div>

			<form action="${root}/manager/boardInsertOk.do" method="post" enctype="multipart/form-data">
				<div id="sh_board_shadow">
					<div class="sh_board_insert_main">

						<div class="sh_board_insert_search">

							<ul>
								<li><span>제목</span></li>
								<li><input type="text" placeholder=" 제목입력" name="title"></li>
								<li><span>문의유형</span></li>
								<li><select id="sh_board_insert_change" name="catecory_1">
										<option>대분류</option>
										<c:forEach var="cate1" items="${cateList}">
											<option value="${cate1.num}">${cate1.name}</option>
										</c:forEach>

								</select></li>
								<li><select id="sh_board_insert_1" name="catecory_2">
										<option>중분류</option>
										<optgroup label="--------------------------------------" class="1" style="display: none;">
											<c:forEach var="cate2" items="${cateList2}" begin="1" end="4">
												<option value="${cate2.num}">${cate2.name}</option>
											</c:forEach>

										</optgroup>
										<optgroup label="--------------------------------------" class="2" style="display: none;">
											<c:forEach var="cate2" items="${cateList2}" begin="5" end="9">
												<option value="${cate2.num}">${cate2.name}</option>
											</c:forEach>
										</optgroup>
										<optgroup label="--------------------------------------" class="3" style="display: none;">
											<c:forEach var="cate2" items="${cateList2}" begin="10" end="15">
												<option value="${cate2.num}">${cate2.name}</option>
											</c:forEach>
										</optgroup>
								</select></li>
								<li><span>파일첨부</span></li>
								<li><input type="file" name="file" class="bf-button bf-white-btn" style="width: 48rem; height: 1.9rem;"></li>
								<li><span>내용</span></li>
								<li><textarea class="sh_reply_text" name="content"></textarea></li>
							</ul>
						</div>
						<input type="hidden" name="num" value="${num}"> <input type="hidden" name="pageNumber" value="${pageNumber}">

					</div>
					<div class="sh_board_insert_content">

						<button type="submit" class="bf-button">등록</button>
						<input type="reset" value="취소" class="bf-button"></input>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/basic/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script type="text/javascript" src="${root}/script/manager/total.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#sh_board_insert_change").change(
					function() {
						var value = $(this).val();
						var me = $("#sh_board_insert_1").find("." + value);
						me.css("display", "block");
						$("#sh_board_insert_1 >optgroup").not(me).css(
								"display", "none");
						$("#sh_board_insert_1 >option").prop("selected", true);
					});
		});
	</script>
</body>
</html>