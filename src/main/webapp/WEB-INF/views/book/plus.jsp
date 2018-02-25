<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 상세보기</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${root}/icon/css/fontello.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css">
<link rel="stylesheet" type="text/css" href="${root}/css/book/plus.css">
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<script type="text/javascript" src="${root}/script/book/plus.js"></script>
</head>
<body>
	<!-- 책상세보기로 요청 방식 :  onclick="location.href='${root}/detail.do'"
		작가 상세보기 요청방식 :  onclick="location.href='${root}/author.do'"
		출판사 클릭시 검색페이지로 : onclick="location.href='${root}/main/search.do'"
		장르 클릭시 장르검색페이지로  : onclick="location.href='${root}/category.do'"
		미리보기 페이지 : ${root}/book/example.do
	 -->
	<c:if test="${detailDto!=null}">
		<!-- 책 클릭했을때 나오는 상세보기  - 최정은 -->
		<div class="plus_All">
			<div id="content_head">
				<div class="head_left">
					<img src="${detailDto.img_path}"> <a
						href="${root}/book/example.do"> <span class="icon-book-open"></span>
						<span>미리보기</span>
					</a>
				</div>
	
				<div class="head_right">
					<!-- child(1) -->
					<div class="category">
						<!-- 주의! 카테고리는 중복이 가능하다. 예, '소설 > 해외소설 , 소설 > SF소설'  -->
						<c:if test="${detailDto.third_cate_num_a !=0}">
							<div class="category-item">
								<span class="main" onclick="location.href='${root}/category.do?${detailDto.second_cate_num}'">${detailDto.second_cate_name}</span>
								<span class="sub" onclick="location.href='${root}/category.do?${detailDto.third_cate_num_a}'">${detailDto.third_cate_name_a}</span>
							</div>
						</c:if>
						<c:if test="${detailDto.third_cate_num_b !=0}">
							<div class="category-item">
								<span class="main" onclick="location.href='${root}/category.do?${detailDto.second_cate_num}'">${detailDto.second_cate_name}</span>
								<span class="sub" onclick="location.href='${root}/category.do?${detailDto.third_cate_num_b}'">${detailDto.third_cate_name_b}</span>
							</div>
						</c:if>
						<c:if test="${detailDto.third_cate_num_c !=0}">
							<div class="category-item">
								<span class="main" onclick="location.href='${root}/category.do?${detailDto.second_cate_num}'">${detailDto.second_cate_name}</span>
								<span class="sub" onclick="location.href='${root}/category.do?${detailDto.third_cate_num_c}'">${detailDto.third_cate_name_c}</span>
							</div>
						</c:if>
					</div>
					<!-- child(2) -->
					<div class="main-title">${detailDto.book_name}</div>
					<!-- child(3) -->
					<c:if test="${detailDto.book_sub_title!=null}">
						<div class="sub-title">${detailDto.book_sub_title}</div>
					</c:if>
					
					<!-- child(4) -->
					<c:if test="${detailDto.author_num!=0 || detailDto.illu_num!=0 || detailDto.trans_num!=0}"></c:if>
					<div class="author-info">
						<!-- 소설, 판타지, 만화 등 종류에 따라서 글(원작자)만 있는 경우와 그림(일러스트레이터)가 있는 경우가 있음 -->
						<!-- 각 겨우마다 이름 뒤에 '저자' 또는 '그림' 이라는 단어가 붙음. 글과 그림이 동일인물일 경우는 '글/그림' 이라는 단어가 붙음 -->
						<!-- 글/그림 동일이물일 경우는 하나를 'hidden-block'처리하고 또 하나에 'author'와 'illustrator'를 동시에 추가한다 -->
						<!-- 필요없는 경우는 class 속성에 'hidden-block' 을 추가 -->
						<c:choose>
							<c:when test="${authorDto.num==illoDto.num}">
								<span class="author illustrator"><a href="${root}/author.do?${authorDto.num}">${authorDto.name}</a></span> 
							</c:when>
							
							<c:otherwise>
								<c:if test="${authorDto.num!=0}">
									<span class="author "><a href="${root}/author.do?${authorDto.num}">${authorDto.name}</a></span> 
								</c:if>
								<c:if test="${illoDto.num!=0}">
									<span class="illustrator "><a href="${root}/author.do?${illoDto.num}">${illoDto.name}</a></span>
								</c:if>
							</c:otherwise>
						</c:choose>
						
						<c:if test="${transDto.num!=0}">
							<span class="translator "><a href="${root}/author.do?${transDto.num}">${transDto.name}</a></span>
						</c:if>
					</div>
	
					<!-- child(5) -->
					<div class="content-star-rate">
						<span class="star-icon-field material-icons"></span><span
							class="non-star-icon-field material-icons"></span> <span
							class="count-field">100명</span>
					</div>
	
					<!-- child(6) -->
					<div class="event">
						<span class="icon-clock"></span> <span class="period">01월
							24일 (수) 12시 ~ 02월 22일 (목)</span>
					</div>
					<!--  -->
					<ul class="book-info">
						<li><span>도서정보</span>
							<ul>
								<li><p onclick="location.href='${root}/main/search.do?${detailDto.pub_num}'">${detailDto.pub_name}</p></li>
							</ul>
						</li>
	
						<li><span>출간정보</span>
							<ul>
								<li><p style="border-right: 0px;">${detailDto.write_date}</p></li>
							</ul></li>
	
						<li><span>지원기기</span>
							<ul>
								<li><span class="icon-tablet"></span>PAPER</li>
								<li><span class="icon-apple"></span>iOS</li>
								<li><span class="icon-android"></span>Android</li>
								<li><span class="icon-windows"></span>PC</li>
								<li><span class="icon-laptop"></span>Mac</li>
							</ul></li>
						<li><span>듣기기능</span>
							<ul>
								<li><span class="icon-headphones"></span>듣기가능</li>
							</ul></li>
					</ul>
	
					<div class="price-box">
						<!-- 'box-row'에 'hidden-block'추가하면 감추기 가능 -->
						<c:if test="${detailDto.rental_period!='no'}">
							<div class="box-row box-rental ">
								<div class="box_left">대여</div>
								<div class="box_right">
									<div>
										<span>${detailDto.rental_period}</span> 
										<c:if test="${detailDto.rental_price!=0}">
											<span class="paper">${detailDto.rental_price}</span>
										</c:if>
										<c:if test="${detailDto.rental_price==0}">
											<span class="paper">무료</span>
										</c:if>
									</div>
								</div>
							</div>
						</c:if>
						<div class="box-row">
							<div class="box_left">구매</div>
							<div class="box_right">
								<c:choose>
									<c:when test="${detailDto.book_price!=0}">
										<div>
											<span>종이책정가</span> <span class="paper">${detailDto.book_price}원</span>
										</div>
										<c:set var="sailPrice" value="${detailDto.book_price*(1-(detailDto.discount*0.01))}"/>
										<fmt:parseNumber var="sail" value="${sailPrice}" integerOnly="true"/>
										<fmt:parseNumber var="discount" value="${detailDto.discount}" integerOnly="true"/>
										<c:if test="${detailDto.discount!=0}">
											<div>
												<span>전자책정가</span> <span class="ebook">${sail}원
												<span class="sail">${discount}</span></span>
											</div>
										</c:if>
										<c:if test="${detailDto.discount==0}">
											<span>전자책정가</span> <span class="ebook">${detailDto.book_price}원</span>
										</c:if>
										
										<!-- 할인1,2가 다 존재 할 때 -->
										<c:if test="${detailDto.discount2!=0 && detailDto.discount!=0}">
											<div>
												<fmt:parseNumber var="sail2" value="${sail*(1-(detailDto.discount2*0.01))}" integerOnly="true"/>
												<fmt:parseNumber var="discount2" value="${detailDto.discount}" integerOnly="true"/>
											
												<span>판매가</span> <span class="sell">${sail2}
												<span class="sail">${discount2}</span></span>
											</div>
										</c:if>
										
										<!-- 할인 1은 존재 2는 미존재 -->
										<c:if test="${detailDto.discount2==0 && detailDto.discount!=0}">
											<div>
												<span>판매가</span> <span class="sell">${sail}원</span>
											</div>
										</c:if>
										
										<!-- 할인없을때 -->
										<c:if test="${detailDto.discount2==0 && detailDto.discount==0}">
											<div>
												<span>판매가</span> <span class="sell">${detailDto.book_price}원</span>
											</div>
										</c:if>
									</c:when>
									
									<c:otherwise>
										<div>
											<span>종이책정가</span> <span class="paper">무료</span>
										</div>
										
										<div>
											<span>전자책정가</span> <span class="ebook">무료
										</div>
										
										<div>
											<span>판매가</span> <span class="sell">무료</span>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<script>
						function cartInsert(bookNum,root) {
							var url = root+"/cartInsert.do?book_num="+bookNum;
							$.get(url, function(check) {
								if(check==1){
									alert("카트에 저장되었습니다.");
								}else{
									alert("중복된 도서목록이 있습니다.");
								}
							});
						}
						
						function wishInsert(bookNum, root){
							var url = root+"/wishInsert.do?book_num="+bookNum;
							$.get(url, function(check) {
								if(check==1){
									alert("내 위시리스트에 저장되었습니다.");
								}else{
									alert("중복된 도서목록이 있습니다.");
								}
							});
						}
		
					</script>
	
					<div class="head_bottom">
						<ol>
							<li><button type="button">
									<span class="icon-heart" onclick="wishInsert('${detailDto.book_num}','${root}')"></span>
								</button></li>
							<li><button type="button">
									<span class="icon-basket" onclick="cartInsert('${detailDto.book_num}','${root}')"></span>
								</button></li>
	
							<li><button type="button">
									<span class="icon-gift"
										onclick="javascript:location.href='${root}/present.do?book_num=${detailDto.book_num}'"></span>
								</button></li>
								
							<li><button type="button" onclick="javascript:location.href='${root}/order.do?book_num=${detailDto.book_num}'">구매하기</button></li>
						</ol>
					</div>
				</div>
			</div>
			<div id="bookIntroAll">
				<c:if test="${detailDto.intro!=null}">
					<div class="bookIntro">
						<div>
							<h3>책소개</h3>
						</div>
						<div class="bookIntro_con">
							<div class="readAll collapse">
								${detailDto.intro}
							</div>
							<button type="button">
								펼쳐보기<i class="material-icons">arrow_drop_down</i><i class="material-icons">arrow_drop_up</i>
							</button>
						</div>
					</div>
				</c:if>
				<c:if test="${detailDto.pub_intro!=null}">
					<div class="bookIntro">
						<div>
							<h3>출판사 서평</h3>
						</div>
						<div class="bookIntro_con">
							<div class="readAll collapse">
								${detailDto.pub_intro}
							</div>
							<button type="button">
								펼쳐보기<i class="material-icons">arrow_drop_down</i><i
									class="material-icons">arrow_drop_up</i>
							</button>
						</div>
					</div>
				</c:if>
<%-- 				<c:if test="${authorDto!=null ||  illoDto!=null || transDto!=null}"> --%>
<!-- 					<div id="profile"> -->
<!-- 						<div> -->
<!-- 							<h3>저자 프로필</h3> -->
<!-- 						</div> -->
<!-- 						<div class="profile_click_event"> -->
<!-- 							<div> -->
<!-- 								<ul> -->
<%-- 									<c:if test="${authorDto.num!=0}"> --%>
<%-- 										<c:choose> --%>
<%-- 											<c:when test="${authorDto.num==illoDto.num}"> --%>
<%-- 												<li><span>글/그림</span><a>${authorDto.name} <span class="activeBar"></span></a></li> --%>
<%-- 											</c:when> --%>
											
<%-- 											<c:otherwise> --%>
<%-- 												<c:if test="${authorDto.num!=0}"> --%>
<%-- 													<li><span>저자</span><a>${authorDto.name} <span class="activeBar"></span></a></li> --%>
<%-- 												</c:if> --%>
<%-- 												<c:if test="${illoDto.num!=0}"> --%>
<%-- 													<li><span>그림</span><a>${illoDto.name} <span></span></a></li> --%>
<%-- 												</c:if>: --%>
<%-- 											</c:otherwise> --%>
<%-- 										</c:choose> --%>
<%-- 										<c:if test="${transDto.num!=0}"> --%>
<%-- 											<li><span>번역</span><a>${transDto.name} <span></span></a></li> --%>
<%-- 										</c:if> --%>
<%-- 									</c:if> --%>
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 							여기부분은 위의 태그의 이름클릭할때마다 값이 변해야함. 틀만잡음 -->
<%-- 							<input type="hidden" name="activeAuthor" value="${authorDto}"/> --%>
<!-- 							<div class="profile_ex"> -->
<%-- 								<c:if test="${authorDto.name!=null }"> --%>
<%-- 									<div class="author">${authorDto.name}</div> --%>
<%-- 								</c:if> --%>
<!-- 								<button class="add-notice"> -->
<!-- 									<span class="icon-plus"></span>작가 신간알림·소식 -->
<!-- 								</button> -->
<!-- 								<ol class="content"> -->
<%-- 									<c:if test="${authorDto.country_num!=0}"> --%>
<!-- 										<li><span>국적</span><span>{authorDto.country_name}</span></li> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${authorDto.birthday!=null}"> --%>
<%-- 										<li><span>출생</span><span>${authorDto.birthday}</span></li> --%>
<%-- 									</c:if> --%>
<%-- 									<c:if test="${authorDto.education!=null}"> --%>
<%-- 										<li><span>학력</span><span>${authorDto.education}</span></li> --%>
<%-- 									</c:if> --%>
<%-- 									<c:if test="${authorDto.debut!=null}"> --%>
<%-- 										<li><span>데뷔</span><span>${authorDto.debut}</span></li> --%>
<%-- 									</c:if> --%>
<%-- 									<c:if test="${authorDto.career!=null}"> --%>
<%-- 										<li><span>경력</span><span>${authorDto.career}</span></li> --%>
<%-- 									</c:if> --%>
<%-- 									<c:if test="${authorDto.awards!=null}"> --%>
<%-- 										<li><span>수상내역</span><span>${authorDto.awards}</span></li> --%>
<%-- 									</c:if> --%>
<%-- 									<c:if test="${authorDto.link!=null}"> --%>
<%-- 										<li><span>홈페이지</span><span>${authorDto.link}</span></li> --%>
<%-- 									</c:if> --%>
<!-- 								</ol> -->
<!-- 								<div class="profile_date"> -->
<%-- 									<span class="update">${authorDto.update_date}</span> <input --%>
<!-- 										class="bf-button bf-white-btn" type="button" value="정보수정요청" /> -->
<!-- 								</div> -->
<%-- 								<c:if test="${authorBook!=null}"> --%>
<!-- 									<div class="profile_masterpiece"> -->
<!-- 										<div> -->
<!-- 											<span>대표저서</span> -->
<!-- 											<ol> -->
<!-- 			<!-- 									<li>평점순</li> --> -->
<!-- 												<li>최신순</li> -->
<!-- 			<!-- 									<li class="activeFont">인기순</li> --> -->
<!-- 											</ol> -->
<!-- 										</div> -->
<!-- 										<div class="list"> -->
<!-- 											<ul> -->
<%-- 												<c:forEach var="auDto" items="${authorBook}"> --%>
<!-- 													<li class="mf-book-item"> -->
<!-- 														<div class="mf-book-thumbnail"> -->
<!-- 															<div class="mf-book-thumbnail-image"> -->
<%-- 																<img class="" src="${auDto.img_path}" alt="image" /> --%>
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 														<div class="mf-book-metadata"> -->
<%-- 															<h3 class="book-metadata-text">${auDto.bookName}</h3> --%>
<!-- 															<p class="book-metadata-author"> -->
<%-- 																<a class="" href="javascript:alert('작가페이지')">${auDto.authorName}</a> --%>
<!-- 															</p> -->
<!-- 															<p class="book-metadata-translator"></p> -->
<!-- 															<div class="content-star-rate"> -->
<!-- 																<span class="star-icon-field material-icons"></span><span -->
<!-- 																	class="non-star-icon-field material-icons"></span> <span -->
<!-- 																	class="count-field"> 9999명</span> -->
<!-- 															</div> -->
<!-- 														</div> -->
<!-- 													</li> -->
<%-- 												</c:forEach> --%>
<!-- 											</ul> -->
<!-- 										</div> -->
<!-- 										대표저서가 5권 이하일 때는 버튼을 'hidden-block' 처리 해야함 -->
<%-- 										<c:if test="${fn:length(authorBook)>5}"> --%>
<%-- 											<a class="bf-button bf-white-btn bf-animated-btn" href="${root}/author.do">출간작 전체보기</a> --%>
<%-- 										</c:if> --%>
<!-- 									</div> -->
<%-- 								</c:if> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</c:if> --%>
				<c:if test="${authorDto.describe!=null}">
					<div class="bookIntro">
						<div>
							<h3>저자 소개</h3>
						</div>
						<div class="bookIntro_con">
							<div class="readAll collapse">
								${authorDto.describe}
							</div>
							<button type="button">
								펼쳐보기<i class="material-icons">arrow_drop_down</i><i
									class="material-icons">arrow_drop_up</i>
							</button>
						</div>
					</div>
				</c:if>
	
<!-- 				<div class="bookIntro"> -->
<!-- 					<div> -->
<!-- 						<h3>목차</h3> -->
<!-- 					</div> -->
<!-- 					<div class="bookIntro_con"> -->
<!-- 						<div class="readAll collapse"> -->
<!-- 							aaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaa<br>aaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa<br>aaaaaaaaaaaaaaaa -->
<!-- 						</div> -->
<!-- 						<button type="button"> -->
<!-- 							펼쳐보기<i class="material-icons">arrow_drop_down</i><i -->
<!-- 								class="material-icons">arrow_drop_up</i> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
	
				<!-- 	리뷰	 -->
				<jsp:include page="review.jsp" />
			</div>
		</div>
	</c:if>

 	<script type="text/javascript">
		createStarIcon(document.querySelector(".content-star-rate"), 3.7);
	</script>
</body>
</html>