$(function() {
	// 처음화면에 전체가 다 선택되어있음
	$(".cart_content input[type='checkbox']").each(function() {
		$(this).prop("checked", true);
	});

	// 삭제클릭
	$(".cart_content_book_content button:last-child").click(function() {
		var a = confirm("정말로 삭제하시겠습니까?");
		if (a == true) {
			$.get("${root}/cartDelete.do", {
				num : "${book_num}"
			});
		}
	});

	// $(".cart_content_book_content button:last-child").click(function() {
	// var a = confirm("정말로 삭제하시겠습니까?");
	// if (a == true) {
	// $(this).parents(".cart_content_book").remove();
	// }
	// });

	// 선택삭제
	$(".cart_content_select button:last-child").click(function() {
		var bookNum = "";

		$(".book-thumbnail input[type='checkbox']").each(function() {
			if ($(this).prop("checked") == true) {
				bookNum += "${ book_num }" +",";
			}
		});

		$.get("${root}/cartDelete.do", {
			num : bookNum
		}, function() {
			alert("삭제");
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
		$.get("${root}/cartWishList.do", {
			num : "${book_num}"
		}, function() {
			alert("위시리스트로 이동되었습니다.")
		});
	});

	// 선택된 위시 리스트로 이동
	$(".cart_content_select").find("button").first().click(
			function() {
				if ($(".cart_contnet_book_content input[type='checkbox']")
						.prop("checked") == true) {
					alert("ab");
					$.get("${root}/cartWishList.do", {
						"num" : [ "${book_num}" ]
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
});