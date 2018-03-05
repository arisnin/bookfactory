/**
 * 프로젝트 공통 자바스크립트 파일
 * 
 * @author 박성호(최초작성)
 * @date 2018.01.17
 */

/**
 * 평점에 맞는 개수의 별을 생성합니다.
 * 
 * @param target 별점평가 영역을 감싸고 있는 <div class="content-star-rate"> 태그 Object
 * @param full 꽉 찬 별 개수
 * @param half 반개짜리 별 개수(0 아니면 1)
 * @returns 없음
 * 
 * @author 박성호
 * @date 2018. 1. 18.
 */
function createStarIcon2(target, full, half) {
	var starField = target.querySelector(".star-icon-field");
	var nonStarField = target.querySelector(".non-star-icon-field");

	starField.innerHTML = "";
	nonStarField.innerHTML = "";

	for (let j = 0; j < full; j++) {
		starField.innerHTML += "&#xe838;";
	}

	if (half > 0) starField.innerHTML += "star_border";
	for (let j = 0; j < 5 - full - half; j++) {
		nonStarField.innerHTML += "&#xe838;";
	}
}

/**
 * 평점에 맞는 개수의 별을 생성합니다.
 * 
 * @param target 별점평가 영역을 감싸고 있는 <div class="content-star-rate"> 태그 Object
 * @param score 평점. 예, 4.7
 * @returns 없음
 * 
 * @author 박성호
 * @date 2018. 1. 18.
 */
function createStarIcon(target, score) {
	var starField = target.querySelector(".star-icon-field");
	var nonStarField = target.querySelector(".non-star-icon-field");

	starField.innerHTML = "";
	nonStarField.innerHTML = "";

	var full = parseInt(score);
	var half = parseFloat(score) - parseInt(score);

	for (let i = 0; i < full; i++) {
		starField.innerHTML += "&#xe838;";
	}

	if (half != 0) {
		starField.innerHTML += "star_border";
		full++;
	}

	for (let i = full; i < 5; i++) {
		nonStarField.innerHTML += "&#xe838;";
	}
	// 이벤트 리스너에 등록된 다른 click 이벤트의 실행을 방지합니다.
	if (event) event.stopImmediatePropagation();
}

/**
 * Selector 드롭박스
 * 
 * @author 염현우
 * @date 2018. 1. 19.
 */
$(".hwdropbtn").click(function() {
	$(".hwdropbtn").not(this).next().hide();
	$(this).next().toggle();
});

window.onclick = function(event) {
	if (!event.target.matches('.hwdropbtn')) {
		if (event.target.matches('.hwdropdown-content > span')) {
			var data = $(event.target).text();
			$(event.target).parent().prev().text(data);
		}

		var dropdowns = document.getElementsByClassName("hwdropdown-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if ($(openDropdown).css("display") == "block") {
				$(openDropdown).css("display", "none");
			}
		}
	}
}
/**
 * Selector 드롭박스 끝
 * 
 * @date 2018. 1. 19.
 */

/**
 * (current / total) 형태의 페이지 인덱스 표시에서 current값을 1씩 증가 또는 감소시키는 함수입니다.
 * 
 * @param active 증가, 감소 이벤트를 발생시킨 버튼 요소
 * @param n 1(증가) 또는 -1(감소)
 * @returns 없음
 * 
 * @Author 박성호
 * @Date 2018. 1. 20.
 */
function indexUpdate(active, n) {
	// current(현재페이지), total(전체페이지수), update(현재페이지 + n)
	var current = active.parentElement.firstElementChild;
	var total = parseInt(current.lastElementChild.innerHTML);
	current = current.firstElementChild;

	// 증감 연산시, 1부터 total까지 반복되도록 한다.
	var update = parseInt(current.innerHTML) + n;
	current.innerHTML = 1 + (update + total - 1) % total;
}

/**
 * 접기/펼치기 버튼 양식에서 collapsable-notice 영역을 확장/해제하는 함수
 * 
 * @param active 클릭한 버튼 요소
 * @returns 없음
 * 
 * @author 박성호
 * @date 2018. 1. 22.
 */
function collapseViewToggle(active) {
	var target = active.nextElementSibling;
	if (target.style.display == "none") {
		target.style.display = "inline-block";
	} else {
		target.style.display = "none";
	}
}

/**
 * 
 * @param elementId 펼치기/접기 대상 요소의 id
 * @returns
 *
 * @author 박성호
 * @date 2018. 1. 30.
 */
function collapseViewToggleById(elementId) {
	var target = document.getElementById(elementId);
	if (target.style.display == "none") {
		target.style.display = "inline-block";
	} else {
		target.style.display = "none";
	}
}

/**
 * 도서목록 보기방식 버튼(Portrait & Landscape)의 기능 구현
 * 
 * @param event 이벤트가 발생한 버튼 요소
 * @returns 없음
 * 
 * @Author 박성호
 * @Date 2018. 1. 28.
 */
function changeViewType(event) {
	var target = document.getElementById("search-view-type");
	var buttons = event.parentElement.children;
	
	buttons[0].classList.toggle("active");
	buttons[1].classList.toggle("active");
//	document.querySelectorAll(".book-metadata-description").forEach(function(e, i) {
//		e.classList.toggle("hidden-block");
//	});
	target.classList.toggle("list-landscape");
}

/**
 * 책 상세페이지 이동 함수
 * 
 * @param root 어플리케이션 루트 컨텍스트
 * @param book_num 도서번호
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 28.
 */
function bookDetailLink(root, book_num) {			
	location.href = root + '/detail.do?book_num=' + book_num;
}

/**
 * 작가 정보 페이지 이동 함수
 * 
 * @param root 어플리케이션 루트 컨텍스트
 * @param authorNum 작가번호
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 3. 4.
 */
function authorDetailHref(root, authorNum) {
	location.href = root + '/author.do?anum=' + authorNum;
}

/*
 * 메인카테고리들을 제외한 나머지서비스에서는 카테고리의 서비스타입을 없애야함.
 */

$(".hw_sub_wrap").hide();
