<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<c:forEach begin="1" end="4">
			<div>
				<div class="myReview_main_content">
					<span class="myReview_main_content_title"><a href="#">무한의 마법사1권</a></span>
					<div class="content-star-rate">
						<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
						<span class="count-field">2018.01.19</span>
					</div>
					<p class="myReview_main_content_review" style="display: inline-block;">작가는 불교,동양철학에 심취해있다. 제목보고 낚였다. 제목은 가볍지만 내용은 그렇지 않다. 그리고 너무 본인의 생각을 강요 또는 일반화 시기키지 않나 생각이 든다. 마지막은 갑자기 무슨 소설 끝나는 장면 같다. 개인적으로 불교의 사상을 좋아하기 때문에 그냥 좋은글 한편 잘 읽은 가분이다. 작가는 불교,동양철학에 심취해있다. 제목보고 낚였다. 제목은 가볍지만 내용은 그렇지 않다. 그리고 너무 본인의 생각을 강요 또는 일반화 시기키지 않나 생각이 든다. 마지막은 갑자기 무슨 소설 끝나는 장면 같다. 개인적으로 불교의 사상을 좋아하기 때문에 그냥 좋은글 한편 잘 읽은 가분이다. 작가는 불교,동양철학에 심취해있다. 제목보고 낚였다. 제목은 가볍지만 내용은 그렇지 않다. 그리고 너무 본인의 생각을 강요 또는 일반화 시기키지 않나 생각이 든다. 마지막은 갑자기 무슨 소설 끝나는 장면 같다. 개인적으로 불교의 사상을 좋아하기 때문에 그냥 좋은글 한편 잘 읽은 가분이다</p>
					<div class="myReview_main_content_button">
						<button class="bf-button bf-white-btn" onclick="javascript:alert('미구현')">수정</button>
						<button class="bf-button bf-white-btn" onclick="javascript:alert('미구현')">삭제</button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/book/bookReview.js"></script>
	<script type="text/javascript">
		document.querySelectorAll(".content-star-rate").forEach(
				function(item, index) {
					createStarIcon(item, 3.7);
				});
	</script>
</body>
</html>
