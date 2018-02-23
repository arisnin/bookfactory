/**
 * 책 상세페이지 - 리뷰, 댓글용 자바스크립트 파일
 * 
 * @author 박성호(최초작성)
 * @date 2018.01.23
 */

/**
 * 리뷰작성은 12자 이상만 가능하게 하는 유효성 체크 함수
 */
document.getElementById("review-textarea").onkeyup = function() {
	// Validate length
	var button = document.getElementById("review-submit-btn");
	if (this.value.length >= 12) {
		button.classList.remove("disabled");
	} else {
		button.classList.add("disabled");
	}
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
	var target = document.getElementById("review-list-box-id");
	var targetList = target.children;
	var remain = Number(target.getAttribute("data-remain-list"));
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
	
	target.setAttribute("data-remain-list", remain);
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
		/*var stars = document.getElementById("star-rate-touch-box").querySelectorAll(".star-field");
		Array.prototype.forEach.call(stars, function(e,i) {
			if (i > count) {
				e.classList.remove("active");
			} else {
				e.classList.add("active");
			}
		});*/
		activateStarIcon(count);
	});
});

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

function updateReview() {
	var targets = document.querySelectorAll(".review-write-form .review-content");
	if (targets.length > 0) {
		targets[0].classList.toggle("hidden-block");
		targets[1].classList.toggle("hidden-block");
	}
	
	document.getElementById("review-cancel-btn").classList.toggle("disabled");
}