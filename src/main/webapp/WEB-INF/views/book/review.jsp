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
			<div class="buyer-score-info" id="buyer-score-info-id">
				<h4 class="title">구매자 별점</h4>
				<span class="score"></span>
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
				<span class="score-rater-num"><c:out value="${buyerCount}" />명이 평가함</span>
			</div>
			<!-- 리뷰 작성 -->
			<div class="review-write-box">
				<h4 class="hidden-block"></h4>
				<!-- 리뷰 작성 폼 -->
				<form action="${reviewRequestUrl}" method="post" onsubmit="return reviewFormValidation(this)">
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
					<div class="review-write-form" onclick="asyncLoginCheck(this)">
						<c:if test="${reviewSelf != null}">
							<div>
								<p class="review-content ">
									<span class="update-tools">
										<span class="date"><fmt:formatDate value="${reviewSelf.write_date}" pattern="yy-MM-dd hh:mm"/></span>
										<button type="button" class="bf-button bf-transparent-btn" value="delete" onclick="deleteReview(this,'${root}','${reviewSelf.num}')">
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
						<button type="submit" class="bf-button disabled" title="write" id="review-submit-btn">리뷰 남기기</button>
						</c:if>
						<c:if test="${reviewSelf != null}">
							<button type="submit" class="bf-button disabled" title="update" id="review-submit-btn">수정하기</button>
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
					<input type="hidden" name="book_num" value="${param.book_num}"/>
					<c:if test="${reviewSelf.num != null}">
						<input type="hidden" name="num" value="${reviewSelf.num}"/>
					</c:if>
				</form>
			</div><!-- End : review-write-box -->
		</section><!-- End : bf-review-box -->
		<c:set var="reviewListSize" value="${reviewList == null ? 0 : reviewList.size()}" />
		<!-- 리뷰 목록 & 댓글 작성 -->
		<section class="bf-review-box">
			<!-- 리뷰 목록 메뉴 -->
			<div class="bf-service-type-menu line-bottom">
				<!-- 서비스타입 메뉴  -->
				<ul class="service-type-list f-left">
					<li><a class="active" href="javascript:void(0)" title="all" onclick="reviewListBuyerToggle(this)">전체<span class="book-count">${reviewListSize}</span></a></li>
					<li><a class="" href="javascript:void(0)" title="buyer" onclick="reviewListBuyerToggle(this)">구매자<span class="book-count">${buyerCount}</span></a></li>
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
			<ul class="review-list-box" id="review-list-box-id" data-remain-list="${reviewListSize > 10 ? reviewListSize - 10 : 0}">
			<c:forEach var="reviewDto" items="${reviewList}">
				<li class="review-list-item ${reviewDto.buyer} hidden-block" data-buyer="${reviewDto.buyer}">
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
												<p class="reply-info">${replyDto.id}&nbsp;<fmt:formatDate value="${replyDto.write_date}" pattern="yy-MM-dd hh:mm"/></p>
											</li>
										</c:forEach>
									</ul>
								</div>
								<!-- 댓글 작성 -->
								<form action="#" method="post" onsubmit="return writeReply(this,'${root}')">
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
			<c:if test="${reviewList == null}">
				<li class="review-list-item">
					<div class="review-contents review-empty">
						<div class="review-content review-spoiler" style="display: inline-block;">
							<span>
								<span class="material-icons">info</span>
								아직 등록된 리뷰가 없습니다.<br />첫 번째 리뷰를 남겨주세요!
							</span>
						</div>
					</div>
				</li>
			</c:if>
			</ul><!-- End : review-list-box -->
			<div class="review-more-button">
				<button type="button" class="bf-button bf-white-btn" onclick="appendReviewList(this)"><span class="more-count">${reviewListSize == 0 ? '' : (reviewListSize > 10 ? reviewListSize - 10 : 0)}</span> 개 더보기</button>
			</div>
			<button type="button" class="bf-button bf-notice-btn bf-transparent-btn bf-animated-btn" value="false" onclick="collapseViewToggle(this)">
				구매자 표시 기준은 무엇인가요?
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
	
	<c:if test="${scoreGraph == null}">
		<c:set var="scoreGraph" value="${a=[0,0,0,0,0,0]}" />
	</c:if>
	
	<%-- 자바 스크립트 --%>
	<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
	<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
	<script type="text/javascript" src="${root}/script/book/review.js"></script>
	<script type="text/javascript">
		setScoreGraph(${scoreGraph[1]},${scoreGraph[2]},${scoreGraph[3]},${scoreGraph[4]},${scoreGraph[5]});
		initReviewPage(${reviewListSize}, ${reviewSelf == null ? -1 : (reviewSelf.star_point - 1)});

		function writeReply(event, url) {
			var parameter = {
					content : event.content.value,
					review_num : event.review_num.value
			};
			
			$.post(url + "/review/reply.do", parameter, function(data,status) {
				if (data.type == 'ok') {
					// 댓글 달기 성공
					insertReplyNode(event.parentElement.firstElementChild.firstElementChild ,data);					
				} else {
					alert("에러(" + data.type + ") : " + data.error);
				}
			});
			
			return false;
		}
		
		function insertReplyNode(targetList, data) {
			var dFrag = document.createDocumentFragment();
			var listItem = document.createElement("li");
			
			// 새로운 li 요소 생성(최신 댓글)
			listItem.innerHTML = '<p class="reply-content" style="display:inline-block;">' + data.content + '</p><p class="reply-info">' + data.id + '&nbsp;' + data.write_date + '</p>';
			
			// fragment에 새로운 li 요소 추가
			dFrag.appendChild(listItem);
			
			// fragment에 기존 댓글 list 추가(최신 댓글에 이어서 추가하는 과정)
			Array.prototype.forEach.call(targetList.querySelectorAll("li"), function(e) {
				dFrag.appendChild(e);
			});
			
			// target-list(UL Element)에 댓글 list를 추가
			targetList.appendChild(dFrag);
		}
		
		function asyncLoginCheck(obj) {
			var str = event.target + '\n' + obj.nodeName;
			if (event.currentTarget == obj) alert('true\n' + str);
			else alert('false\n' + str);
		}
	</script>
</body>
</html>