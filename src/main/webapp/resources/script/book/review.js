/**
 * 책 상세페이지 - 리뷰, 댓글용 자바스크립트 파일
 * 
 * @author 박성호(최초작성)
 * @date 2018.01.23
 */

var reviewSubmitBtn = document.getElementById("review-submit-btn");
var targetReviewList = null;
var lastOrderType = null;
var reviewListSize = 0;
var buyerListSize = 0;

/**
 * 리뷰작성은 12자 이상만 가능하게 하는 유효성 체크 함수
 */
document.getElementById("review-textarea").onkeyup = function() {
	// Validate length
	if (this.value.length >= 12) {
		reviewSubmitBtn.classList.remove("disabled");
	} else {
		reviewSubmitBtn.classList.add("disabled");
	}
}

/**
 * 리뷰 작성 폼의 유효성 검사를 하는 함수
 * @param event 이벤트 발생 요소(form element)
 * @returns 검사 결과가 유효하면 true, 아니면 false
 *
 * @author 박성호
 * @date 2018. 2. 25.
 */
function reviewFormValidation(event) {
	var validationFlag = false;
	
	event.star_point.forEach(function(e, i) {
		if (e.value == true) validationFlag = true;
	});
	
	return validationFlag;
}

/**
 * 리뷰글의 스포일러 영역을 없애고, 글 영역을 보이게 하는 함수  
 * @param active 이벤트가 발생한 버튼 요소
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 1. 23.
 */
function collapseSpoilerView(active) {
	var target = active.parentElement;
	if (target.style.display != "none") {
		target.style.display = "none";
		target.nextElementSibling.style.display = "inline-block";
	}
}

/**
 * 리뷰목록 개수를 확장하는 함수.(리뷰 목록은 한번에 10개씩만 확장 가능)
 * @param event 이벤트가 발생한 요소
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 1. 23.(최초)
 * @date 2018. 2. 23.(수정)
 */
function appendReviewList(event) {
	var targetList = targetReviewList.children;
	var remain = Number(targetReviewList.getAttribute("data-remain-list"));
	var count = 10;

	// remain list의 시작 위치
	var begin = targetList.length - remain;
	
	// 출력 후에 남는 remain list의 개수와 실제 출력한 list 개수 계산
	if (remain > count) {
		remain -= count;
	} else {
		count = remain;
		remain = 0;
	}
	
	// 출력할 list의 끝 offset
	var end = begin + count;

	for (let i=begin; i < end; i++) {
		targetList[i].classList.remove("hidden-block");
	}
	
	targetReviewList.setAttribute("data-remain-list", remain);
	event.querySelector(".more-count").innerHTML = remain;
	
	if (remain == 0) {
		event.classList.add("hidden-block");
	}
}

/**
 * 설정된 별점 평가를 초기화시키는 함수
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 13.
 */
function starCancel() {
	var stars = document.getElementById("star-rate-touch-box").querySelectorAll(".star-field");
	Array.prototype.forEach.call(stars, function(e,i) {
		e.classList.remove("active"); 
	});
}

/**
 * 별점 평가의 별 아이콘을 클릭했을 시, 해당 점수의 별 아이콘을 활성화(색깔 변화) 시키는 함수
 * @param element forEach문의 element 값(각 별 아이콘에 대응하는 radio 컨트롤 요소)
 * @param count forEach문의 인덱스 값
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 13.
 */
Array.prototype.forEach.call(document.querySelectorAll("#star-rate-touch-box input"), function(element,count) {
	element.addEventListener("click", function() {
		activateStarIcon(count);
		if (reviewSubmitBtn.getAttribute("title") =="update") {
			reviewSubmitBtn.classList.remove("disabled");
		}
	});
});

/**
 * 평가한 별점만큼 리뷰 작성 폼에 있는 별점 아이콘을 활성화 시키는 함수
 * (이 기능은 해당 도서에 대한 리뷰를 작성한 로그인 상태인 회원에 대해서만 동작합니다.)
 * 
 * @param count 평가된 별점(zero-based count)
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 16.
 */
function activateStarIcon(count) {
	var stars = document.getElementById("star-rate-touch-box").querySelectorAll(".star-field");
	
	Array.prototype.forEach.call(stars, function(e,i) {
		if (i > count) {
			e.classList.remove("active");
		} else {
			e.classList.add("active");
		}
	});
}

/**
 * 리뷰를 수정가능한 상태로 활성화 또는 비활성화 시키는 함수
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 16.
 */
function updateReview() {
	var targets = document.querySelectorAll(".review-write-form .review-content");
	if (targets.length > 0) {
		targets[0].classList.toggle("hidden-block");
		targets[1].classList.toggle("hidden-block");
	}
	
	document.getElementById("review-cancel-btn").classList.toggle("disabled");
}

function deleteReview(event, url, review_num) {
	$.get(url + "/review/delete.do", {review_num : review_num}, function(data,status) {
		if (data.type == 'ok') {
			// 댓글 달기 성공
			insertReplyNode(event.parentElement.firstElementChild.firstElementChild ,data);					
		} else {
			alert("에러(" + data.type + ") : " + data.error);
		}
	});
}

/**
 * 리뷰 목록을 기준에 맞게 정렬하는 함수
 * 
 * 리뷰 목록은 List Element 객체들로 이루어져 있고, 이 객체들로 구성된 Array List를 생성해서 기준에 맞게 정렬(sort)를 수행합니다.
 * 정렬된 리스트는 documentFragment 객체를 이용해서 DOM으로부터 분리시킨뒤, 원래 위치에 다시 append 시킵니다.
 * 
 * 리뷰 목록은 전체를 화면에 출력하지 않고, 일부만(상위 n개) 화면에 출력하기 때문에 정렬을 수행할 때마다 이에 대한 처리도 동행되어야 합니다.
 * 또한 선택한 정렬 메뉴의 활성화(CSS 처리)도 필요합니다. 
 * 
 * @param event 이벤트가 발생한 (버튼) 요소
 * @param type 정렬 기준(recent|descending|ascending|preference)
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 23.
 * @date 2018. 2. 24.(1차 수정 - 서비스타입 기능 추가)
 */
function reviewListSort(event, type) {
	var dFrag = document.createDocumentFragment();
	
	initReviewList();
	
	// 서비스타입: 구매자 리스트? 전체 리스트?
	var serviceType = document.querySelector(".bf-review-box > .bf-service-type-menu > .service-type-list a.active");
	
	var targetList;
	// 리뷰 목록은 기본적으로 모두 display("none") 상태입니다. 이 중에서 화면에 출력할 대상 리스트를 서비스타입에 맞게 선별합니다.
	if (serviceType.getAttribute("title") == "all") {
		// 전체 리스트 선택
		targetList = targetReviewList.children;
	} else {
		// 구매자 리스트만 선택
		targetList = targetReviewList.querySelectorAll("li.review-list-item.on");
	}
	
	// Create array list & Sorting
	var sorted = Array.prototype.slice.call(targetList,0).sort(function(a,b) {
		// compare method
		return compareWith(a,b,type);
	});
	
	// targetList 중에서 화면에 출력할 리스트의 개수 계산
	let countDisplayList = Number(sorted.length - targetReviewList.getAttribute("data-remain-list"));
	
	// Clone?
	//sorted.forEach(e => dFrag.appendChild(e.cloneNode(true)));
	
	// Move?
	sorted.forEach(function(e,i) {
		if (i > (countDisplayList-1)) {
			// 화면에 출력할 개수만큼을 제외하고는 모두 display("none") 처리
			e.classList.add("hidden-block");
		} else {
			e.classList.remove("hidden-block");
		}
		dFrag.appendChild(e);
	});
	
	// Append Child to target element(HTML UL Element)
	targetReviewList.appendChild(dFrag);
	
	// 활성화된 메뉴 요소에 active 클래스 속성값 추가
	activeOrderMenu(event);
	
	// 마지막 정렬 타입 요소 저장
	lastOrderType = event;
}

/**
 * 리뷰 목록을 재정렬 할때 수행하는 설정 초기화 함수
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 24.
 */
function initReviewList() {
	Array.prototype.forEach.call(targetReviewList.querySelectorAll("li.review-list-item"), function(e) {
		e.classList.add("hidden-block");
	});
}

/**
 * 최초 페이지 로드시 수행되는 페이지 설정 초기화 함수
 * @param size 리뷰 목록 전체 개수
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 24.
 */
function initReviewPage(size, selfStarPoint) {
	targetReviewList = document.getElementById("review-list-box-id");
	lastOrderType = document.querySelector(".bf-review-box > .bf-service-type-menu > .order-type-list a.active");
	buyerListSize = targetReviewList.querySelectorAll("li.review-list-item.on").length;
	reviewListSize = size;
	reviewListSort(lastOrderType, 'recent');
	
	if (selfStarPoint >= 0) {
		document.querySelectorAll("#star-rate-touch-box input")[selfStarPoint].click();
	}
	
	if (size == 0) {
		document.querySelector(".bf-review-box .review-more-button > .bf-button").classList.add("hidden-block");
	}
	reviewSubmitBtn.classList.add("disabled");
}

/**
 * 서비스타입 버튼을 클릭할 때, 수행하는 토글 함수
 * 
 * @param event 이벤트가 발생한 요소
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 24.
 */
function reviewListBuyerToggle(event) {
	var serviceTypes = document.querySelectorAll(".bf-review-box > .bf-service-type-menu > .service-type-list a");
	var appendListBtn = document.querySelector(".bf-review-box .review-more-button > .bf-button");
	
	serviceTypes[0].classList.toggle("active");
	serviceTypes[1].classList.toggle("active");
	
	let nRemain = 0;
	
	// data-remain-list 초기값 계산
	if (serviceTypes[0] == event) {
		// 전체 목록
		nRemain = reviewListSize > 10 ? reviewListSize - 10 : 0;
	} else {
		// 구매자 목록
		nRemain = buyerListSize > 10 ? buyerListSize - 10 : 0;
	}
	
	// data-remain-list 재설정
	targetReviewList.setAttribute("data-remain-list",nRemain);
	appendListBtn.querySelector("span.more-count").innerHTML = nRemain;
	
	// 목록 확정 버튼 비활성화
	if (nRemain == 0) {
		appendListBtn.classList.add("hidden-block");
	} else {
		appendListBtn.classList.remove("hidden-block");
	}
	
	// 목록 재정렬
	reviewListSort(lastOrderType,lastOrderType.getAttribute("title"));
}

/**
 * 선택한 정렬 메뉴를 활성화시키는 함수
 * (활성화는 선택된 메뉴를 강조처리하고, 마우스 포인터에 대한 이벤트 처리를 비활성화시키는 것을 뜻함)
 * 
 * @param event 이벤트가 발생한 요소(선택된 메뉴 요소임)
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 23.
 */
function activeOrderMenu(event) {
	if (event == null) return;
	var menus = document.querySelectorAll("section.bf-review-box > div.bf-service-type-menu > ul.order-type-list a");
	Array.prototype.forEach.call(menus, function(e) {
		e.classList.remove("active");
	});
	event.classList.add("active");
}

/**
 * 리스트 정렬(sorting)시에 비교 기준을 제공하는 함수
 * 
 * @param a current element(비교 대상 1)
 * @param b next element(비교 대상 2)
 * @param option 정렬 기준
 * @returns 양수이면 b -> a 순서로 정렬, 음수이면 a -> b 순서로 정렬, 0이면 같은 순서
 *
 * @author 박성호
 * @date 2018. 2. 23.
 */
function compareWith(a,b,option) {
	switch (option) {
	case 'descending': // b - a, 별점 내림차순 정렬 기준
	{
		let aData = getAttributeFromSelector(a, ".review-info > .content-star-rate.review-info-row", "data-star-point");
		let bData = getAttributeFromSelector(b, ".review-info > .content-star-rate.review-info-row", "data-star-point");
		return bData - aData;
	}
	case 'ascending': // a - b, 별점 오름차순 정렬 기준
	{
		let aData = getAttributeFromSelector(a, ".review-info > .content-star-rate.review-info-row", "data-star-point");
		let bData = getAttributeFromSelector(b, ".review-info > .content-star-rate.review-info-row", "data-star-point");
		return aData - bData;
	}
	case 'preference': // b - a, 공감수 내림차순 정렬 기준
	{
		let aData = getAttributeFromSelector(a, ".review-contents > .review-status > button:nth-child(1) > span.book-count", "data-preference");
		let bData = getAttributeFromSelector(b, ".review-contents > .review-status > button:nth-child(1) > span.book-count", "data-preference");
		return bData - aData;
	}
	default: // b - a, 작성일 내림차순 정렬 기준
	{
		let aData = getAttributeFromSelector(a, ".review-info > div:last-child > .review-date", "data-review-date");
		let bData = getAttributeFromSelector(b, ".review-info > div:last-child > .review-date", "data-review-date");
		return bData - aData;
	}
	}
	return true;
}

/**
 * 특정 요소의 attribute 값을 가져오는 함수
 * (속성값이 Numeric String인 경우만 가능합니다)
 * 
 * @param target 검색 대상 요소
 * @param selector 검색할 셀렉터
 * @param attribute 가져올 속성 종류
 * @returns 속성값
 *
 * @author 박성호
 * @date 2018. 2. 23.
 */
function getAttributeFromSelector(target, selector, attribute) {
	return parseInt(target.querySelector(selector).getAttribute(attribute));
}

/**
 * 도서를 구매한 사람들이 평가한 별점 정보를 갱신하는 함수
 * 
 * @param s1 별점평가 1점의 개수
 * @param s2 2점의 개수
 * @param s3 3점의 개수
 * @param s4 4점의 개수
 * @param s5 5점의 개수
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 24.
 */
function setScoreGraph(s1,s2,s3,s4,s5) {
	var target = document.getElementById("buyer-score-info-id");
	var scoreBars = target.querySelectorAll(".score-bar");
	var score = target.querySelector("span.score");
	
	var count = s1 + s2 + s3 + s4 + s5;
	
	// 별점 스코어 그래프 설정
	scoreBars[0].style.width = (100 * s5 / count) + "%"
	scoreBars[1].style.width = (100 * s4 / count) + "%"
	scoreBars[2].style.width = (100 * s3 / count) + "%"
	scoreBars[3].style.width = (100 * s2 / count) + "%"
	scoreBars[4].style.width = (100 * s1 / count) + "%"
	
	// 별점 평균값 계산
	var average = count == 0 ? 0.0 : ((s1 + s2*2 + s3*3 + s4*4 + s5*5) / (count)).toFixed(1);
	
	// 별점 평가 정보 화면에 갱신
	score.innerHTML = average == 0 ? '0.0' : average;
	createStarIcon(target.querySelector(".content-star-rate"), average);
}