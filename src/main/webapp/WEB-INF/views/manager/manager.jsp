<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>관리자 홈페이지</title>
  <c:set var="root" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" href="${root}/resources/css/basic/reset.css">
  <link rel="stylesheet" href="${root}/resources/css/manager/manager.css">
</head>
<body>
  <div id="manager_wrapper">
    <header id="header">
      <div class="header_title">
        <h1><a href="#">관리자 페이지</a></h1>
      </div>
      <div class="header_menu">
        <ul>
          <li><a href="#">메인페이지</a></li>
          <li><a href="#">로그아웃</a></li>
        </ul>
      </div>
    </header>

    <section id="main">

      <!-- Thumbnails -->
      <section class="thumbnails">
        <div>
          <a href="${root}/manager/bookInsert.do">
              <img src="${root}/img/manager/books-stack-of-three.png"/>
              <span>도서개수:<strong>3</strong><br/>카테고리개수<strong>3</strong></span>
              <span>도서</span>
          </a>
          <a href="${root}/manager/publisherSearch.do">
             <img src="${root}/img/manager/publisher.png"/>
             <span>출판사수:<strong>3</strong><br/>잘나가는 출판사<strong>3</strong></span>
             <span>출판사</span>
         </a>
        </div>
        <div>
          <a href="${root}/manager/authorSearch.do">
             <img src="${root}/img/manager/author.png"/>
             <span>작가수:<strong>3</strong><br/>정보수정요청:<strong>3</strong></span>
             <span>작가</span>
         </a>
          <a href="${root}/manager/memberMember.do">
             <img src="${root}/img/manager/member.png"/>
             <span>회원수<strong>3</strong><br/>카테고리개수<strong>3</strong></span>
              <span>회원</span>
         </a>
          <a href="${root}/manager/reviewReview.do">
             <img src="${root}/img/manager/review.png"/>
             <span>최신리뷰:<strong>3</strong><br/>리뷰신고:<strong>3</strong></span>
             <span>리뷰</span>
         </a>
        </div>
        <div>
          <a href="${root}/manager/boardContact.do">
             <img src="${root}/img/manager/board.png"/>
             <span>최근 공지일:<strong>3</strong><br/>Q&amp;A:<strong>3</strong></span>
              <span>게시판</span>
         </a>
          <a href="${root}/manager/statPreference.do">
             <img src="${root}/img/manager/statistics.png"/>
             <span>오늘의 매출<strong>3</strong><br/>책판매수<strong>3</strong></span>
             <span>통계</span>
         </a>
        </div>
      </section>

    </section>
  </div>
</body>

</html>