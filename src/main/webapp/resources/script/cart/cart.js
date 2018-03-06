/*
 * 김도현(최초작성)
 */

$(function() {
	// 처음화면에 전체가 다 선택되어있음
//	$(".cart_content input[type='checkbox']").each(function() {
//		$(this).prop("checked", true);
//	});

	// 삭제클릭
	$(".cart_content_book_content button.delete-btn").click(function(event) {
		let target = $(this).parent().find("span.book-num");
		var book_num = target.attr("data-book-num");
		
		var a = confirm("정말로 삭제하시겠습니까?");
		if (a == true) {
			$.get("cart/cartDelete.do", {
				bookNum : book_num
			}, function() {
				target.parent().parent().remove();
			});
		}
	});

	$("img").on("error", function() {
		$("img").attr("src", "/bookFactory/img/manager/no_image.png");
		
	});
	// $(".cart_content_book_content button:last-child").click(function() {
	// var a = confirm("정말로 삭제하시겠습니까?");
	// if (a == true) {
	// $(this).parents(".cart_content_book").remove();
	// }
	// });

	// 선택삭제
	$(".cart_content_select > .cart_content_sel_button > button:last-child").click(
			function() {
				var bookNum = "";
				$(".cart_content_book > .book-thumbnail input[type=checkbox]").each(function(i,e) {
					alert(e.checked + " : " + $(e).attr("disabled"));
					if (e.checked && !$(e).attr("disabled")) {
						bookNum += e.value + "_";
					}
				});

				$.get("cart/cartDelete.do", {
					bookNum : bookNum
				}, function() {
					location.reload();
				});
			});

	// $(".cart_content_select button:last-child").click(function() {
	// $(".book-thumbnail input[type='checkbox']").each(function(){
	// if($(this).prop("checked")==true){
	// $(this).parents(".cart_content_book").remove();
	// }
	// })
	// });

	// 전체선택
	$(".cart_content_sel_child input[type='checkbox']").click(
			function() {
				$(".checkbox-label").click();
				if ($(this).prop("checked") == true) {
					$(".cart_content_book_span input[type='checkbox']").prop(
							"checked", true);
				} else {
					$(".cart_content_book_span input[type='checkbox']").prop(
							"checked", false);
				}
			});

	// 전체선택중 하나라도 해제시 전체선택 해제
	$(".cart_content_book_span")
			.click(
					function() {
						$(".book-thumbnail input[type='checkbox']")
								.each(
										function() {
											if ($(this).prop("checked") == false) {
												$(
														".cart_content_sel_child input[type='checkbox']")
														.prop("checked", false);
											}
										});
					});

	// 위시 리스트로 이동
	$(".cart_content_book_content").find("button").first().click(function() {
		var book_num = $(this).parent().find("span:first-child").attr("id");

		$.get("cart/cartWishList.do", {
			bookNum : book_num
		}, function() {
			alert("위시리스트로 이동되었습니다.")
		});
	});

	// 선택된 위시 리스트로 이동
	$(".cart_content_select").find("button").first().click(
			function() {
				var book_num = $(".cart_content_book_content").find(
						"span:first-child").attr("id");
				if ($(".cart_contnet_book_content input[type='checkbox']")
						.prop("checked") == true) {
					$.get("cart/cartWishList.do", {
						num : book_num
					}, function() {
						alert("위시리스트로 이동되었습니다.");
					});
				}
			});

	// 책 선택시 총 권 수 확인
	$(".cart_content input[type='checkbox']").change(function() {
		var count = 0;
		$(".cart_content_book input[type='checkbox']").each(function() {
			if ($(this).prop("checked") == true) {
				count++;
			}
		});
		$(".cart_right_menu_content strong").text(count + "권");
	});

	// 모든 책을 선택했을때 전체선택 표시
	$(".cart_content_book input[type='checkbox']")
			.click(
					function() {
						$(".cart_content_book")
								.each(
										function() {
											if ($(
													".cart_content_book input[type='checkbox']")
													.prop("checked") == false) {
												return;
											} else {
												$(
														".cart_content_sel_child input[type='checkbox']")
														.prop("checked", true);
											}
										});
					});

});

/**
 * 장바구니에서 도서를 선택할 때마다, 오른쪽의 메뉴 정산표를 업데이트하는 함수
 * 
 * @returns 없음
 *
 * @author 박성호
 * @date 2018. 3. 5.
 */
function updateTotalMenu() {
	var target = document.querySelectorAll("#cart-total-menu span.float_right");			
	var bookList = document.querySelectorAll(".cart_content_book_content > div.float_right > span.price");
	var totalList = document.querySelectorAll(".cart_content_book_content > div.float_right > .dc-price-box > .dc-price");
	var sourceList = document.querySelectorAll(".cart_content_book");
	
	var book = 0, total = 0, count = 0;
	Array.prototype.forEach.call(sourceList, function(e,i) {
		let input = e.querySelector(".cart_content_book_span > input[type=checkbox]");
		if (input.checked && !input.disabled) {
			// 선택된 도서
			book += parseInt(bookList[i].getAttribute("data-price"));
			total += parseInt(totalList[i].getAttribute("data-dc-price"));
			count++;
		}
	});

	target[0].innerHTML = book + '원';
	target[1].innerHTML = (book - total) + '원';
	target[2].innerHTML = total + '원';
	document.querySelector("#cart-total-menu .total-menu-title > strong").innerHTML = count + '권';
	document.querySelector("input[name=totalPrice]").value = total;
}
