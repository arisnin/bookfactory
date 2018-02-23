<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Review</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/book/review.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="wrap-container" style="width:690px; padding: 0rem;">
		<div class="bf-title-row title-type2">
			<h3>리뷰</h3>
		</div>
		<!-- 리뷰 작성 -->
		<section class="bf-review-box">
			<!-- 구매자 별점 -->
			<div class="buyer-score-info">
				<h4 class="title">구매자 별점</h4>
				<span class="score">4.6</span>
				<div class="content-star-rate">
					<span class="star-icon-field material-icons"></span><span class="non-star-icon-field material-icons"></span>
				</div>
				<ul class="score-graph">
					<li><span class="material-icons">star</span>5
						<div class="score-bar-container">
							<div class="score-bar"></div>
						</div></li>
					<li><span class="material-icons">star</span>4
						<div class="score-bar-container">
							<div class="score-bar"></div>
						</div></li>
					<li><span class="material-icons">star</span>3
						<div class="score-bar-container">
							<div class="score-bar"></div>
						</div></li>
					<li><span class="material-icons">star</span>2
						<div class="score-bar-container">
							<div class="score-bar"></div>
						</div></li>
					<li><span class="material-icons">star</span>1
						<div class="score-bar-container">
							<div class="score-bar"></div>
						</div></li>
				</ul>
				<c:set var="listSize" value="${reviewList.size()}"/>
				<span class="score-rater-num"><c:out value="${listSize}" />명이 평가함</span>
			</div>
			<!-- 리뷰 작성 -->
			<div class="review-write-box">
				<h4 class="hidden-block"></h4>
				<!-- 리뷰 작성 폼 -->
				<form action="${reviewRequestUrl}" method="post" onsubmit="">
					<!-- 별점 평가 -->
					<div class="star-rate-box">
						<span>이 책을 평가해주세요!</span>
						<div id="star-rate-touch-box">
							<label class="star-field" >
								<input class="star-checkbox" type="radio" name="star_point" value="1" />
								<span class="star-icon material-icons">star</span>
								<span class="star-rate-tip"><span class="text">별로에요</span></span>
								<label class="star-field" >
									<input class="star-checkbox" type="radio" name="star_point" value="2" />
									<span class="star-icon material-icons">star</span>
									<span class="star-rate-tip"><span class="text">그저그래요</span></span>
									<label class="star-field" >
										<input class="star-checkbox" type="radio" name="star_point" value="3" />
										<span class="star-icon material-icons">star</span>
										<span class="star-rate-tip"><span class="text">보통이에요</span></span>
										<label class="star-field" >
											<input class="star-checkbox" type="radio" name="star_point" value="4" />
											<span class="star-icon material-icons">star</span>
											<span class="star-rate-tip"><span class="text">좋아요</span></span>
											<label class="star-field" >
												<input class="star-checkbox" type="radio" name="star_point" value="5" />
												<span class="star-icon last material-icons">star</span>
												<span class="star-rate-tip"><span class="text">최고에요</span></span>
											</label>
										</label>
									</label>
								</label>
							</label>
							<button type="button" class="bf-button bf-white-btn star-cancel" onclick="starCancel()">취소</button>
						</div>
					</div>
					<!-- 리뷰 내용 작성 -->
					<div class="review-write-form">
						<c:if test="${reviewSelf != null}">
							<div>
								<p class="review-content ">
									<span class="update-tools">
										<span class="date">${reviewSelf.write_date}</span>
										<button type="button" class="bf-button bf-transparent-btn" value="delete" onclick="deleteReview(this)">
											<span class="material-icons">delete</span>
										</button>
										<button type="button" class="bf-button bf-transparent-btn" value="edit" onclick="updateReview()">
											<span class="material-icons">mode_edit</span>
										</button>
									</span>
									${reviewSelf.content}
								</p>
							</div>
							<div>
								<textarea class="review-content hidden-block" id="review-textarea" name="content" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 비공개 될 수 있습니다.">${reviewSelfContent}</textarea>
							</div>
						</c:if>
						<c:if test="${reviewSelf == null}">
							<textarea class="review-content " id="review-textarea" name="content" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 사용하시면 비공개 될 수 있습니다."></textarea>
						</c:if>
					</div>
					<!-- 리뷰 확인 버튼 -->
					<div class="review-write-submit">
						<c:if test="${reviewSelf == null}">
						<button type="submit" class="bf-button disabled" id="review-submit-btn">리뷰 남기기</button>
						</c:if>
						<c:if test="${reviewSelf != null}">
							<button type="submit" class="bf-button disabled" id="review-submit-btn">수정하기</button>
							<button type="button" class="bf-button cancel-btn disabled" id="review-cancel-btn" onclick="updateReview()">취소</button>
						</c:if>
						<label class="bf-custom-checkbox">
							<input type="checkbox" name="spoiler" title="스포일러" />
							<span class="all-mark"></span>
							<span class="checkbox-label">스포일러가 있습니다.</span>
						</label>
						<button type="button" class="bf-button bf-notice-btn bf-white-btn" value="false" onclick="collapseViewToggle(this)">
							<span class="material-icons">warning</span>
							리뷰작성 유의사항
						</button>
						<div class="collapsable-notice" style="display:none;">
							<p>건전한 리뷰 정착 및 양질의 리뷰를 위해 아래 해당하는 리뷰는 비공개 조치될 수 있음을 안내드립니다.<br /><br /></p>
							<ol style="list-style:decimal;">
								<li>타인에게 불쾌감을 주는 욕설</li>
								<li>비속어나 타인을 비방하는 내용</li>
								<li>특정 종교, 민족, 계층을 비방하는 내용</li>
								<li>해당 도서의 줄거리나 리디북스 서비스 이용과 관련이 없는 내용</li>
								<li>의미를 알 수 없는 내용</li>
								<li>광고 및 반복적인 글을 게시하여 서비스 품질을 떨어트리는 내용</li>
								<li>저작권상 문제의 소지가 있는 내용</li>
								<li>다른 리뷰에 대한 반박이나 논쟁을 유발하는 내용</li>
							</ol>
							<p><br />* 결말을 예상할 수 있는 리뷰는 자제하여 주시기 바랍니다.<br />이 외에도 건전한 리뷰 문화 형성을 위한 운영 목적과 취지에 맞지 않는 내용은 담당자에 의해 리뷰가 비공개 처리가 될 수 있습니다.</p>
						</div>
					</div>
					<!-- ID 정보는 비즈니스 로직에서 유효세션으로부터 직접 가져다 써야합니다. -->
					<input type="hidden" name="book_num" value="${'3327'}"/>
					<c:if test="${reviewSelf.num != null}">
						<input type="hidden" name="num" value="${reviewSelf.num}"/>
					</c:if>					
				</form>
			</div><!-- End : review-write-box -->
		</section><!-- End : bf-review-box -->
		<!-- 리뷰 목록 & 댓글 작성 -->
		<section class="bf-review-box">
			<!-- 리뷰 목록 메뉴 -->
			<div class="bf-service-type-menu line-bottom">
				<!-- 서비스타입 메뉴  -->
				<ul class="service-type-list f-left">
					<li><a class="active" href="javascript:alert('구매자')">구매자<span class="book-count">3</span></a></li>
					<li><a href="javascript:alert('전체')">전체<span class="book-count">5</span></a></li>
				</ul>
				<!-- 정렬기준 메뉴 -->
				<ul class="order-type-list f-right">
					<li class="diamond"><a class="active" href="javascript:void(0)" title="recent" onclick="reviewListSort(this, 'recent')">최신순</a></li>
					<li class="diamond"><a href="javascript:void(0)" title="preference" onclick="reviewListSort(this, 'preference')">공감순</a></li>
					<li class="diamond"><a href="javascript:void(0)" title="descending" onclick="reviewListSort(this, 'descending')">별점높은순</a></li>
					<li><a href="javascript:void(0)" title="ascending" onclick="reviewListSort(this, 'ascending')">별점낮은순</a></li>
				</ul>
			</div><!-- End : bf-service-type-menu -->
			<!-- 리뷰 목록 -->
			<ul class="review-list-box" id="review-list-box-id" data-remain-list="${listSize - 10}">
			<c:forEach var="reviewDto" items="${reviewList}">
				<li class="review-list-item" >
					<!-- 리뷰글 시작(review-list-item) -->
					<!-- 리뷰 정보 -->
					<div class="review-info">
						<div class="content-star-rate review-info-row" data-star-point="${reviewDto.star_point}">
							<span class="star-icon-field material-icons"><c:forEach begin="1" end="${reviewDto.star_point}">&#xe838;</c:forEach></span><span class="non-star-icon-field material-icons"><c:forEach begin="1" end="${5 - reviewDto.star_point}">&#xe838;</c:forEach></span>
						</div>
						<div class="review-info-row">
							<span class="reviewer-id">${reviewDto.id}</span>
							<span class="badge-icon">구매자</span>
						</div>
						<div class="review-info-row">
							<span class="review-date" data-review-date="<fmt:formatDate value="${reviewDto.write_date}" pattern="yyMMdd"/>"><fmt:formatDate value="${reviewDto.write_date}" pattern="yy-MM-dd"/></span>
							<button type="button" class="bf-button bf-white-btn">신고</button>
						</div>
					</div>
					<!-- 리뷰 내용 -->
					<div class="review-contents">
						<c:if test="${reviewDto.spoiler eq 'on'}">
							<!-- 스포일러 -->
							<div class="review-content review-spoiler" style="display:inline-block;">
								<span><span class="material-icons">warning</span> 스포일러가 있는 리뷰입니다.</span>
								<hr class="line">
								<button type="button" class="bf-button bf-transparent-btn bf-animated-btn" onclick="collapseSpoilerView(this)">리뷰보기</button>
							</div>
							<!-- 리뷰 내용 -->
							<p class="review-content" style="display:none;">${reviewDto.content}</p>
						</c:if>
						<c:if test="${reviewDto.spoiler ne 'on'}">
							<div class="review-content review-spoiler" style="display:none;">
								<span><span class="material-icons">warning</span> 스포일러가 있는 리뷰입니다.</span>
								<hr class="line">
								<button type="button" class="bf-button bf-transparent-btn bf-animated-btn" onclick="collapseSpoilerView(this)">리뷰보기</button>
							</div>
							<!-- 리뷰 내용 -->
							<p class="review-content" style="display:inline-block;">${reviewDto.content}</p>
						</c:if>
						<!-- 리뷰 평가 버튼 -->
						<div class="review-status">
							<button type="button" class="bf-button bf-white-btn">
								<span class="material-icons">thumb_up</span>
								<span class="book-count" data-preference="${reviewDto.preference}">${reviewDto.preference}</span>
							</button>
							<button type="button" class="bf-button bf-white-btn" onclick="collapseViewToggle(this)">
								<span class="material-icons">textsms</span>
								댓글
								<span class="book-count">${reviewDto.replyList.size()}</span>
							</button>
							<!-- 댓글 컨트롤 -->
							<div class="reply-write-form" style="display:none;">
								<!-- 댓글 목록 -->
								<div class="reply-list-box">
									<ul>
										<c:forEach var="replyDto" items="${reviewDto.replyList}">
											<li>
												<p class="reply-content" style="display:inline-block;">${replyDto.content}</p>
												<p class="reply-info">${replyDto.id}&nbsp;${replyDto.write_date}</p>
											</li>
										</c:forEach>
										<!-- <li>
											<p class="reply-content" style="display:inline-block;">작가는 불교,동양철학에 심취해있다. 제목보고 낚였다. 제목은 가볍지만 내용은 그렇지 않다. 그리고 너무 본인의 생각을 강요 또는 일반화 시기키지 않나 생각이 든다. 마지막은 갑자기 무슨 소설 끝나는 장면 같다. 개인적으로 불교의 사상을 좋아하기 때문에 그냥 좋은글 한편 잘 읽은 가분이다</p>
											<p class="reply-info">dud***  2017.12.10 19:17</p>
										</li>
										<li>
											<p class="reply-content" style="display:inline-block;">좋은 리뷰 잘봤습니다~</p>
											<p class="reply-info">nb***  2017.12.15 20:17</p>
										</li> -->
									</ul>
								</div>
								<!-- 댓글 작성 -->
								<form action="${root}/review/reply.do" method="post" onsubmit="return replyValidation()">
									<textarea name="content"></textarea>
									<button type="submit" class="bf-button">댓글 달기</button>
									<!-- ID 정보는 비즈니스 로직에서 유효세션으로부터 직접 가져다 써야합니다. -->
									<input type="hidden" name="review_num" value="${reviewDto.num}"/>
								</form>
							</div>
						</div>
					</div>
					<!--  End : review-list-item -->					
				</li>
			</c:forEach>
			</ul><!-- End : review-list-box -->
			<div class="review-more-button">
				<button type="button" class="bf-button bf-white-btn" onclick="appendReviewList(this)"><span class="more-count">${listSize - 10}</span> 개 더보기</button>
			</div>
			<hr class="line block">
			<button type="button" class="bf-button bf-notice-btn bf-transparent-btn bf-animated-btn" value="false" onclick="collapseViewToggle(this)">
				리뷰작성 유의사항
			</button>
			<div class="collapsable-notice" style="display: none;">
				<p>‘구매자’ 표시는 유료 도서를 결제하고 다운로드 하신 경우에만 표시됩니다.<br /><br /></p>
				<ol style="list-style: decimal;">
					<li>무료 도서 (프로모션 등으로 무료로 전환된 도서 포함)<br />'구매자'로 표시되지 않습니다.<br /></li>
					<li>시리즈 도서 내 무료도서<br />'구매자’로 표시되지 않습니다. 하지만 같은 시리즈의 유료 도서를 결제한 뒤 리뷰를 수정하거나 재등록하면 '구매자'로 표시됩니다.<br /></li>
					<li>영구 삭제<br />도서를 영구 삭제해도 ‘구매자’ 표시는 남아있습니다.<br /></li>
					<li>결제 취소<br />‘구매자’ 표시가 자동으로 사라집니다.<br /></li>
				</ol>
			</div>
		</section><!-- End : bf-review-box -->
	</div>

	<%-- 자바 스크립트 --%>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/book/review.js"></script>
	<script type="text/javascript">
		reviewListSort(null, 'recent');
		function reviewListSort(event, type) {
			var dFrag = document.createDocumentFragment();
			var target = document.getElementById("review-list-box-id");
			
			// Create array list & Sorting
			var sorted = Array.prototype.slice.call(target.children,0).sort(function(a,b) {
				// compare method
				return compareWith(a,b,type);
			});
			
			// Clone?
			//sorted.forEach(e => dFrag.appendChild(e.cloneNode(true)));
			
			let countDisplayList = Number(sorted.length - target.getAttribute("data-remain-list"));
			// Move?
			sorted.forEach(function(e,i) {
				if (i > (countDisplayList-1)) {
					// 한 번에 10개씩 display 하므로 나머지는 display="none" 설정
					e.classList.add("hidden-block");
				} else {
					e.classList.remove("hidden-block");
				}
				dFrag.appendChild(e);
			});
			
			// Append Child to target element
			target.appendChild(dFrag);
			
			// 활성화된 메뉴 요소에 active 클래스 속성값 추가
			activeOrderMenu(event);
		}
		
		function activeOrderMenu(event) {
			if (event == null) return;
			var menus = document.querySelectorAll("section.bf-review-box > div.bf-service-type-menu > ul.order-type-list a");
			menus.forEach((e)=>e.classList.remove("active"));
			event.classList.add("active");
		}
		
		function compareWith(a,b,option) {
			switch (option) {
			case 'descending': // b - a
			{
				let aData = getAttributeFromSelector(a, ".review-info > .content-star-rate.review-info-row", "data-star-point");
				let bData = getAttributeFromSelector(b, ".review-info > .content-star-rate.review-info-row", "data-star-point");
				return bData - aData;
			}
			case 'ascending': // a - b
			{
				let aData = getAttributeFromSelector(a, ".review-info > .content-star-rate.review-info-row", "data-star-point");
				let bData = getAttributeFromSelector(b, ".review-info > .content-star-rate.review-info-row", "data-star-point");
				return aData - bData;
			}
			case 'preference':
			{
				let aData = getAttributeFromSelector(a, ".review-contents > .review-status > button:nth-child(1) > span.book-count", "data-preference");
				let bData = getAttributeFromSelector(b, ".review-contents > .review-status > button:nth-child(1) > span.book-count", "data-preference");
				return bData - aData;
			}
			default:
			{
				let aData = getAttributeFromSelector(a, ".review-info > div:last-child > .review-date", "data-review-date");
				let bData = getAttributeFromSelector(b, ".review-info > div:last-child > .review-date", "data-review-date");
				return bData - aData;
			}
			}
			return true;
		}
		
		function getAttributeFromSelector(target, selector, attribute) {
			return parseInt(target.querySelector(selector).getAttribute(attribute));
		}
	</script>
	<c:if test="${reviewSelf != null}">
		<script type="text/javascript">
			activateStarIcon(${reviewSelf.star_point - 1});
		</script>
	</c:if>
</body>
</html>