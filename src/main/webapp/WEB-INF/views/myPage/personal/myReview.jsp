<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/myPage/personal/myReview.css">
<script type="text/javascript" src="${root }/script/basic/commons.js"></script>
</head>
<body>
	<div class="myReview">
		<div class="bf-title-row title-type4">
			<h3>내 리뷰 관리</h3>
		</div>
		<div class="myReview_main">
			<div class="overflow_hidden">
				<span class="myReview_intro">총<span class="myReview_count">4</span> 개의 리뷰를 등록하셨습니다.</span>
			</div>
		</div>
		<c:forEach var="myReviewDto" items="${reviewList}">
			<div><form action="${root}/personal/myReview/update.do" method="post">
				<div class="myReview_main_content">
					<span class="myReview_main_content_title"><a href="javascript:bookDetailLink('${root}', '${myReviewDto.book_num}')">${myReviewDto.book_name}</a></span>
					<div class="content-star-rate">
						<span class="star-icon-field material-icons"><c:forEach begin="1" end="${myReviewDto.star_point}">&#xe838;</c:forEach></span><span class="non-star-icon-field material-icons"><c:forEach begin="1" end="${5 - myReviewDto.star_point}">&#xe838;</c:forEach></span>
						<span class="count-field"><fmt:formatDate value="${myReviewDto.write_date}" pattern="yy-MM-dd hh:mm"/></span>
					</div>
					<textarea class="review-content-edit hidden-block" name="content" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 비공개 될 수 있습니다."><c:out value="${fn:replace(myReviewDto.content, '<br />', '
')}"/></textarea>	
					<p class="myReview_main_content_review" style="display: inline-block;">${myReviewDto.content}</p>
					<div class="myReview_main_content_button">
						<button class="bf-button bf-white-btn" type="button" onclick="updateReview(this)">수정</button>
						<button class="bf-button bf-white-btn hidden-block" type="submit">수정하기</button>
						<button class="bf-button bf-white-btn" type="button" onclick="deleteReview(this,'${root}','${myReviewDto.num}')">삭제</button>
					</div>
				</div>
				<input type="hidden" name="num" value="${myReviewDto.num}" />
				<input type="hidden" name="star_point" value="${myReviewDto.star_point}" />
				<input type="hidden" name="spoiler" value="${myReviewDto.spoiler}" />
			</form></div>
		</c:forEach>
	</div>
	<script type="text/javascript">
		function deleteReview(event, url, review_num) {
			$.post(url + "/personal/myReview/delete.do", {review_num : review_num}, function(data,status) {
				if (data.type == 'ok') {
					// 댓글 달기 성공
					location.reload();					
				} else {
					alert("에러(" + data.type + ") : " + data.error);
				}
			});
		}
		
		function updateReview(event) {
			var target = event.parentElement.parentElement;
			
			// 출력용 화면과 수정용 화면 바꾸기
			target.querySelector(".review-content-edit").classList.toggle("hidden-block");
			var editFlag = target.querySelector(".myReview_main_content_review").classList.toggle("hidden-block");
			
			// 출력용 버튼과 수정용 버튼 바꾸기
			if (editFlag) event.innerHTML = '취소';
			else event.innerHTML = '수정';
			
			event.nextElementSibling.classList.toggle("hidden-block");
			event.nextElementSibling.nextElementSibling.classList.toggle("hidden-block");r
		}
	</script>
</body>
</html>
