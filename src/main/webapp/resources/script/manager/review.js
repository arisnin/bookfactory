/* review 적립금 부여*/
	/*
	 * $( "#dialog" ).dialog({ autoOpen: false }); $("#dialog").dialog({
	 * buttons: [ { text: "Ok", icon: "ui-icon-heart", click: function() { $(
	 * this ).dialog( "close" ); } }] }); $('.sh_button_point').click(function() {
	 * $("#dialog").dialog("open"); $(this).css("pointer-events", "none");
	 * $(this).css("background-color", "gray"); });
	 */

	$('.sh_button_point').click(function(event) {
		$.confirm({
			title : '적립금',
			content : '적립금을 부여하시겠습니까?!',
			buttons : {
				confirm : function() {
					$.alert('적립금 부여 완료');
					var target = $(event.target);
					if (target.is("button")) {
						target.css("background-color", "gray");
						target.css("pointer-events", "none");
					}
				},
				cancel : function() {
					$.alert('적립금을 부여하지않았습니다.');
				}

			},
			type : '#A59AF6'
		});
	});
	
	$(".sh_review_detail_button").each(function(i, e) {
		$(e).click(function() {
			let target = $(".collapsable-notice").eq(i);
			if (target.css("display") == "none") {
				target.css("display", "inline-block");
			} else {
				target.css("display", "none");
			}
		});
	});
	$('.sh_review_secret').click(function(event) {
		$.confirm({
			title : '비공개',
			content : '정말 이 리뷰를 비공개 처리하시겠습니까?!',
			buttons : {
				confirm : function() {
					$.alert('리뷰 비공개 완료');
					var target = $(event.target);
					if (target.is("button")) {
						target.fadeOut(1000, function() {
							target.next().fadeIn(1000);
						});
					}
				},
				cancel : function() {
					$.alert('비공개 처리하지 않았습니다.');
				}

			},
			type : '#A59AF6'
		});
	});
	
	$('.sh_review_open').click(function(event) {
		$.confirm({
			title : '공개',
			content : '이 리뷰를 다시 공개 처리하시겠습니까?!',
			buttons : {
				confirm : function() {
					$.alert('리뷰 공개 완료');
					var target = $(event.target);
					if (target.is("button")) {
						target.fadeOut(1000, function() {
							target.prev().fadeIn(1000);
						});
					}
				},
				cancel : function() {
					$.alert('공개 처리하지 않았습니다.');
				}

			},
			type : '#A59AF6'
		});
	});
	
	$('.sh_review_delete').click(function(event) {
		$.confirm({
			title : '리뷰 삭제',
			content : '삭제하시면 복원할수없습니다. 그래도 삭제하시겠습니깐?',
			buttons : {
				confirm : function() {
					$.alert('리뷰 삭제 완료');
					var target = $(event.target);
					if (target.is("button")) {
						target.css("pointer-events", "none");
					}
				},
				cancel : function() {
					$.alert('삭제 하지 않았습니다.');
				}

			},
			type : '#A59AF6'
		});
	});