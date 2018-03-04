/**
 * 메인 > 전체보기 메뉴용 자바스크립트 파일
 * 
 * @author 박성호(최초작성)
 * @date 2018.01.31
 */

/**
 * 도서 상세 페이지로 이동하는 함수
 * 
 * @param root 어플리케이션 루트 컨텍스트
 * @param book_num 도서번호
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 2. 26.
 */
function bookDetailLink(root, book_num) {
	location.href = root + '/detail.do?book_num=' + book_num;
}