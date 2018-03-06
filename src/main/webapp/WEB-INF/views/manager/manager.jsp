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
          <li><a href="${root}/">메인페이지</a></li>
          <li><a href="${root}/member/logout.do">로그아웃</a></li>
        </ul>
      </div>
    </header>

    <section id="main">

      <!-- Thumbnails -->
      <section class="thumbnails">
        <div>
          <a href="${root}/manager/bookInsert.do">
              <img src="${root}/img/manager/books-stack-of-three.png"/>
              <span>도서개수:<strong>${bookCount}권</strong><br/>카테고리개수<strong>${cateCount}개</strong></span>
              <span>도서</span>
          </a>
          <a href="${root}/manager/publisherSearch.do">
             <img src="${root}/img/manager/publisher.png"/>
             <span>출판사수:<strong>${pubCount}개</strong></span>
             <span>출판사</span>
         </a>
        </div>
        <div>
          <a href="${root}/manager/authorSearch.do">
             <img src="${root}/img/manager/author.png"/>
             <span>작가수:<strong>${authorCount}명</strong><br/>정보수정요청:<strong>${authorEditCount}개</strong></span>
             <span>작가</span>
         </a>
          <a href="${root}/manager/memberMember.do">
             <img src="${root}/img/manager/member.png"/>
             <span>회원수:<strong>${memberCount}명</strong></span>
              <span>회원</span>
         </a>
          <a href="${root}/manager/reviewReview.do">
             <img src="${root}/img/manager/review.png"/>
             <span>최근 일주일 리뷰개수:<strong>${reviewCount }건</strong></span>
             <span>리뷰</span>
         </a>
        </div>
        <div>
          <a href="${root}/manager/boardContact.do">
             <img src="${root}/img/manager/board.png"/>
             <span>1대1 문의내역 수:<strong>${boardCount}건</strong><br/>Q&amp;A:<strong>3</strong></span>
             <span>게시판</span>
         </a>
          <a href="${root}/manager/statPreference.do">
             <img src="${root}/img/manager/statistics.png"/>
             <span>책판매수<strong>${saleCount}권</strong></span>
             <span>통계</span>
         </a>
        </div>
      </section>

    </section>
  </div>
</body>

</html>