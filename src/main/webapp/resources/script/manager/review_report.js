$(".sh_report_detail_button").each(function(i, e) {
		$(e).click(function() {
			let target = $(".collapsable-notice").eq(i);
			if (target.css("display") == "none") {
				target.css("display", "inline-block");
			} else {
				target.css("display", "none");
			}
		});
	});