/**
 * 마이팩토리 페이지 자바스크립트 파일
 * 
 * @author 박성호(최초작성)
 * @date 2018.20
 */

/**
 * 체크박스를 체크 및 해제하는 토글 함수
 * 
 * @param selector 대상 체크박스에 대한 선택자
 * @param checked 전체선택 체크박스의 체크 상태
 * @returns 없음
 * 
 * @Author 박성호
 * @Date 2018. 1. 20.
 */
function checkAllToggle(selector, checked) {
	// querySelectorAll()을 사용해서, 대상 체크박스에 대한 Object NodeList를 얻는다. 
	selector = document.querySelectorAll(selector);
	if (checked) {
		// 전체선택
		selector.forEach(function(item, index) {
			item.checked = true;
		});
	} else {
		// 전체해제
		selector.forEach(function(item, index) {
			item.checked = false;
		});
	}
}

document.querySelectorAll('.purchased-form-list-box input[type=checkbox]').forEach(function(e,i) {
	e.addEventListener("click", function() {
		document.querySelector('.purchased-action-box input[type=checkbox]').checked = false;
	});
});
