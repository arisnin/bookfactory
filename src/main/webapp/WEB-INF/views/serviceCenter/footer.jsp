<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/serviceCenter/footer.css" type="text/css" rel="stylesheet">
<link href="${root}/css/order/order.css" type="text/css" rel="stylesheet">

<title>Footer section</title>
</head>
<body>
	<div class="footer_background">
		
		<div class="footer-content">
			<div class="left">
				<div class="row">
					<span class="contact-number">1644-0331</span>
					
					<ul class="order-type-list">
						<li><a href="${root }/serviceCenter/main.do">고객센터</a></li>
						<li><a href="${root }/serviceCenter/manyque.do">자주 묻는 질문</a></li>
						<li><a href="${root }/serviceCenter/FAQ.do">1:1 문의하기</a></li>						
												
						<c:if test="${id!=null}">							
							<li><a href="${root}/member/logout.do">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
				<div class="row">
					<p class="contact-address">3조 (주) / 팀장 박성호 / 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터<br>사업자등록번호 214-85-29296 <br>개인정보보호책임자 : 김도현</p>
				</div>
				<div class="row">
					<ul class="copyright">
						<li><a href="javascript:alert('준비중입니다.')">이용약관</a></li>
						<li><a href="javascript:alert('준비중입니다.')"><strong>개인정보처리방침</strong></a></li>
						<li><a href="javascript:alert('준비중입니다.')">청소년보호정책</a></li>
						<li><a href="javascript:alert('준비중입니다.')">사업자 정보 확인</a></li>
					</ul>
				</div>
				<div class="row">
					<span>© RIDI Corp.</span>
				</div>
			</div>
			<div class="right">
				<div class="row">
					<ul class="about">
						<li><strong>About</strong></li>
						<li><a onclick="javascript:location.href='${root}/contact.do'">회사소개</a></li>
						<li><a href="javascript:alert('준비중입니다.')">인재채용</a></li>
					</ul>
				</div>
				<div class="row">
					<ul class="service">
						<li><strong>서비스 이용</strong></li>
						<li><a href="${root }/payment/myCash.do">캐시 충전</a></li>
						<li><a href="${root }/notice/main.do">공지사항</a></li>
						<li><a href="${root }/serviceCenter/main.do">고객센터</a></li>
					</ul>
				</div>
				<div class="row">
					<ul class="award-list">
						<li>
							<div class="badge-img">
								<img src="https://static.ridibooks.com/books/dist/images/cert/first_brand.png" class="badge-img" alt="퍼스트브랜드 대상">
							</div>
							<div class="title">
								<span><strong>퍼스트브랜드 대상</strong></span>
								<span>전자책 부분 3년연속</span>
							</div>
						</li>
						<li>
							<div class="badge-img">
								<img src="https://static.ridibooks.com/books/dist/images/cert/clean_site.png" class="badge-img" alt="clean site">
							</div>
							<div class="title">
								<span><strong>CLEAN SITE</strong></span>
								<span>출판/만화 분야</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>