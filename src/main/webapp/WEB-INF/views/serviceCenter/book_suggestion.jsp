<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link href="${root}/css/serviceCenter/book_suggestion.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root }/script/basic/jquery.js"></script>	
<script type="text/javascript" src="${root }/script/serviceCenter/serviceCenter.js"></script>

<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="./main_header.jsp" />

	<div class="service_FAQ_home_header">
		<div class="service_FAQ_home_header_left">
			<span>
				<a href="${root }/serviceCenter/main.do">리디북스 고객센터</a>
			</span>
			<span>></span><span>문의등록</span>
		</div>
		<div class="service_FAQ_home_header_right">
			<div class="bf-service-type-menu">
				<div class="search-box">
					<form method="get">
						<span class="material-icons">search</span> <input
							class="search-word" type="text" name="search-word"
							placeholder="검색" />
					</form>
				</div>
			</div>
		</div>
	</div>
	

	<div class="serviceCenter_book_suggestion">
		<form action = "${root }/serviceCenter/book_suggestionOk.do" method="post"
		enctype="multipart/form-data" onsubmit="return booksuggestion(this)">
			
		<div class="serviceCenter_book_suggestion_title">
			도서 제안
		</div>
		
		<div class="serviceCenter_book_suggestion_genre">
			<div>장르<span class="star">*</span></div>
			<div>
				<select name="category">
					<option value="-">-</option>
					<option value="204">일반</option>
					<option value="202">로맨스</option>
					<option value="201">판타지/무협</option>
					<option value="203">만화</option>
					<option value="205">BL(소설/만화)</option>
				</select>
			</div>
		</div>
		
		<div class="serviceCenter_book_suggestion_bookname">
			<div>도서명<span class="star">*</span></div>
			<div>
				<input type="text"  name="book_name"/>
			</div>
			<div class="serviceCenter_book_suggestion_bookname_correct">정확한 도서명을 입력해주세요.</div>
		</div>	

		<div class="serviceCenter_book_suggestion_writer">
			<div>
				저자명
			</div>
			<div>
				<input type="text" name="book_writer"/>
			</div>
		</div>
		
		<div class="serviceCenter_book_suggestion_publisher">
			<div>
				출판사명
			</div>
			<div>
				<input type="text" name="publisher"/>
			</div>
		</div>

		

		<div class="serviceCenter_book_suggestion_ex">
			<div class="serviceCenter_book_suggestion_ex_text">
				도서 제안 이용 동의<span class="star">*</span>
			</div>
			<div class="serviceCenter_book_suggestion_ex_check">
				<label class="bf-custom-checkbox">
					<input type="checkbox" name="check" />
					<span class="all-mark"></span>
				</label>
				<div class="serviceCenter_book_suggestion_ex_check_text">
					<div>도서 제안 시 제안 내용에 대해 별도로 답변 드리지 않습니다. 답변이 필요한 경우   리디북스 문의를 이용해 주세요.</div>
				</div>
			</div>
		</div>

		
<!--
		<div class="serviceCenter_book_suggestion_file">
			<div class="">첨부 파일</div>
				<div class="serviceCenter_book_suggestion_file_add">
					<label class="bf-custom-checkbox"> <input type="file" /> <span class="checkbox-label">파일 추가</span>
					</label>
				</div>
				<div>최대 20MB 크기의 파일을 첨부할 수 있습니다.</div>			
		</div>
-->


			<div class="serviceCenter_book_suggestion_sub">
				<input type="submit" class="bf-button" value="제출하기"/>				
			</div>
			</form>
		
		<jsp:include page="./footer.jsp" />
	</div>
</body>
</html>