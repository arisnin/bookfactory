

/*달력*/

	$("#sh_date_start").datepicker({
		dateFormat : 'yy-mm-dd'
	});
	$("#sh_date_end").datepicker({
		dateFormat : 'yy-mm-dd'
	});

	// function createStarIcon(target, full, half) {}
	// target : <div class="content-star-rate"> 태그
	// full : 꽉 찬 별 개수
	// half : 반개짜리 별 개수(0 아니면 1)
	/* //createStarIcon2(document.querySelector(".content-star-rate"), 3, 1); */

	// function createStarIcon(target, score) {}
	// target : 위와 동일
	// score : 평점(예, 4.7)
	// createStarIcon(document.querySelector(".sh_content-star-rate"),3.7);
	// createStarIcon(document.querySelector(".sh_content-star-rate1"),3.7);
	document.querySelectorAll(".content-star-rate").forEach(
			function(item, index) {
				createStarIcon(item, 4.7);
			});

	/* 체크 태그 */
	$("#allCheck").click(function() {
		// 클릭되었으면
		if ($("#allCheck").prop("checked")) {
			// input태그의 class이 chk인 태그들을 찾아서 checked옵션을 true로 정의
			$(".sh_check").prop("checked", true);
			// 클릭이 안되있으면
		} else {
			// input태그의 class이 chk인 태그들을 찾아서 checked옵션을 false로 정의
			$(".sh_check").prop("checked", false);
		}
	})
	/* 클릭시 하루, 일주일 , 한달 */
	var date;
	var year;
	var month;
	var day;
	var beforeDate;
	var today;

	$("#sh_day1").click(function() {
		Day();

		$("#sh_date_end").val(today);

		today = today.split("-");
		beforeDate.setFullYear(today[0], today[1] - 1, today[2] - 1);

		beforeDay();

	});

	$("#sh_day7").click(function() {
		Day();

		$("#sh_date_end").val(today);
		today = today.split("-");
		beforeDate.setFullYear(today[0], today[1] - 1, today[2] - 7);

		beforeDay();
	});

	$("#sh_day30").click(function() {
		Day();

		$("#sh_date_end").val(today);
		today = today.split("-");
		beforeDate.setFullYear(today[0], today[1] - 1, today[2] - 30);

		beforeDay();
	});

	function Day() {
		date = new Date();
		year = date.getFullYear();
		month = new String(date.getMonth() + 1);
		day = new String(date.getDate());
		beforeDate = new Date();
		// 한자리수일 경우 0을 채워준다.
		if (month.length == 1) {
			month = "0" + month;
		}
		if (day.length == 1) {
			day = "0" + day;
		}
		today = year + "-" + month + "-" + day;

	}
	function beforeDay() {
		var y = beforeDate.getFullYear();
		var m = beforeDate.getMonth() + 1;
		var d = beforeDate.getDate();

		if (m < 10) {
			m = "0" + m;
		}
		if (d < 10) {
			d = "0" + d;
		}
		beforeDate = y + "-" + m + "-" + d;

		$("#sh_date_start").val(beforeDate);
	}
	
	$("#sh_date_start").datepicker({
		dateFormat : 'yy-mm-dd'
	});
	$("#sh_date_end").datepicker({
		dateFormat : 'yy-mm-dd'
	});


