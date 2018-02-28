<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/basic/reset.css" type="text/css"
	rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css"
	rel="stylesheet" />
<link href="${root}/css/serviceCenter/FAQ.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="${root}/css/serviceCenter/inquriy_answer.css"
	type="text/css" rel="stylesheet">


<title>Insert title here</title>
</head>
<body>

	<jsp:include page="./main_header.jsp" />


	<div class="service_FAQ_home_header">
		<div class="service_FAQ_home_header_left">
			<span> <a href="${root }/serviceCenter/main.do">리디북스
					고객센터</a>
			</span> <span>></span><span>내 활동</span>
		</div>
	</div>

	<div class="serviceCenter_inquriy_answer">
		<div class="serviceCenter_inquriy_answer_title">
			<div class="bf-title-row title-type1">
				<h2>${boardContactDto.title }</h2>
			</div>
		</div>
		
		<div class="serviceCenter_inquriy_answer_left">
			<div class="serviceCenter_inquriy_answer_writer">
				<div>${boardContactDto.id }</div>
				<div class="date">
					<fmt:formatDate value="${boardContactDto.write_date }" pattern="yyyy-MM-dd HH:mm:ss" />
				</div>

				<div>
					<p>${boardContactDto.content }</p>
				</div>
				
				<c:if test="${boardContactDto.file_size>0}">												
					<div><a href="${root }/serviceCenter/information_download.do?num=${boardContactDto.num}">파일명 : ${boardContactDto.file_name}</a></div>						
					<div>파일경로 : ${boardContactDto.file_path}</div>
				</c:if>
				
				
				
			</div>
			
			<c:if test="${boardContactDto.reply_content==null }">
				<div>문의글이 접수 되었습니다.</div>
			</c:if>


			<c:if test="${boardContactDto.reply_content!=null }">
			<div class="serviceCenter_inquriy_answer_answer">
				<div>북팩토리 고객센터</div>
				<div class="date">
					<fmt:formatDate value="${boardContactDto.reply_date }" pattern="yyyy-MM-dd HH:mm:ss" />
				</div>
				

				<div>
					<p>${boardContactDto.reply_content }</p>
				</div>
			</div>

			<div>
				<p>안내가 완료되었습니다. <br/> 추가로 문의(제안)하실 내용이 있는 경우 <a href="${root }/serviceCenter/FAQ.do">[문의등록]</a>을 이용해주세요.</p>
			</div>
			</c:if>
			
			



		</div>

		<div class="serviceCenter_inquriy_answer_right">
			
				<div class="line">
					<div>요청자</div>
					<div>${boardContactDto.id }</div>
				</div>

				<div class="line">
					<div>등록일</div>
					<div class="date">
						<fmt:formatDate value="${boardContactDto.write_date }" pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
				</div>

				<div class="line">
					<div>상태</div>
					<c:if test="${boardContactDto.reply_check==null }">
					<div class="answer">접수완료</div>
					</c:if>					
					<c:if test="${boardContactDto.reply_check!=null }">
					<div class="answer_complete">답변완료</div>
					</c:if>
				</div>

				<div class="line">
					<div>질문유형</div>
					<div>${boardContactDto.q2_name }</div>
				</div>

				<div class="line">
					<div>연락수단</div>
					<div>zz</div>
				</div>

				<div class="line">
					<div>연락처</div>
					<div>-</div>
				</div>				
		</div>




	</div>



</body>
</html>