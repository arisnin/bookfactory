/**
 * 2018-01-17
 * 염현우 : 관리자페이지 왼쪽 메뉴 Accordion 작업
 */

$(".accordion").click(function() {
	var accordion = $(this);
	accordion.toggleClass("active");
	
	accordion.next(".panel").slideToggle("slow",function(){
		var panel = accordion.next(".panel");
		
		if	(panel.css("display") == "block") {
        	accordion.find("span").removeClass("i-i-plus");
        	accordion.find("span").addClass("i-i-min");
        } else {    
			accordion.find("span").removeClass("i-i-min");
			accordion.find("span").addClass("i-i-plus");
        }
	});
});
$(".panel a").click(menuClick);

function menuClick(event){
	$(event.target).toggleClass("active");
	$(".panel a").not(event.target).removeClass("active");
}

