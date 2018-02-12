/**
 * 2018-01-21
 * 염현우 : 통계 선호도조사 막대그래프
 */
$('#q-graph td>input[type=hidden]').each(function() {
	$(this).each(function(i,e) {
		var height = $(this).val();
		$(this).parent().animate({
			height: height
		},1500);
	});
});

