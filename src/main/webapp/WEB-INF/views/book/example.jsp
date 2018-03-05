<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 미리보기</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${root}/icon/css/fontello.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" type="text/css" href="${root}/css/book/example.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/book/example3.js"></script>
<script type="text/javascript" src="${root}/script/book/thinScrollbar_1.0.js"></script>
</head>
<body class="example_body">
	<!-- 상세보기에서 미리보기 버튼누를시 보이는 화면 -최정은 -->
	<div class="exampleAll">
		<div>
			<div class="example_left">
				<div class="example_left_head">
					<div class="example_left_head_title">
						<button onclick="location.href='${root}/detail.do?book_num=${ht.book_num}'">&lsaquo;</button>
						<span>${ht.bookName}</span>
					</div>
					<div class="example_left_head_button">
						<button class="bf-button bf-white-btn">글자축소</button>
						<button class="bf-button bf-white-btn">글자확대</button>
					</div>
				</div>
				<div class="example_left_content">
					<div>
						<button>&lsaquo;</button>
						<div>
							<img src="${ht.img_path}"/>
							<div class="textView">
								<!-- 내용 디비에서 가져와서 뿌림 -->
								${ex.intro}
							 </div>
						</div>
						<button>&rsaquo;</button>
					</div>
				</div>
				<div class="example_left_bottom">
					<div class="bf-index-btn-form">
						<div class="index-of-page">
							<span class="current"></span>
							/
							<span class="total"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="example_right">
				<div class="example_right_head">
					<div class="example_right_head_title">
						<span>목차</span>
					</div>
				</div>
				<div class="example_right_content">
					<div>
						<ul>
							<!-- 리스트 데베에서 가져와서 뿌려 -->
							${ex.list}
						</ul>
					</div>
				</div>
				<div class="example_left_bottom"></div>
			</div>
		</div>
	</div>
	
	
	<!-- insert문에 넣을애들 책표지는 책번호들고 각자 표지들고오게 내용은 동일하게 -->

<!-- 	<img src="//misc.ridibooks.com/cover/593000426/xxlarge" alt="나미야 잡화점의 기적"/> -->
<!-- 	<img src="//misc.ridibooks.com/cover/2200009093/xxlarge" alt="거기 서 겨울"/> -->
<!-- 	<img src="//misc.ridibooks.com/cover/425016047/xxlarge" alt="멸망 이후의 세계 1권"/> -->
<!-- 	<img src="//misc.ridibooks.com/cover/1019007890/xxlarge" alt="명탐정 코난 1권"/> -->
	
<!-- 	<img src="/storage/gallery/DIOojMi7hFo/pic_003_wNz0TFs9rAc..jpg" alt="원피스1"/> -->
<!-- 	<img src="/storage/gallery/DIOojMi7hFo/pic_004_XQBSzdK1mvU..jpg" alt="원피스2"/> -->
<!-- 	<img src="/storage/gallery/DIOojMi7hFo/pic_004_XQBSzdK1mvU..jpg" alt="원피스3"/> -->
<!-- 	<img src="/storage/gallery/DIOojMi7hFo/pic_006_TNkjihNOLRQ..jpg" alt="원피스4"/> -->
<!-- 	<img src="/storage/gallery/DIOojMi7hFo/pic_007_KiV5IWvqwas..jpg" alt="원피스5"/> -->
<!-- 	<img src="/storage/gallery/DIOojMi7hFo/pic_008_-JPnAqkvKbc..jpg" alt="원피스6"/> -->
<!-- 	<img src="/storage/gallery/DIOojMi7hFo/pic_009_BuFE0Jb9a_M..jpg" alt="원피스7"/> -->
</body>
</html>