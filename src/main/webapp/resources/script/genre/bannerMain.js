/*
 * 메인 홈 화면에서의 이벤트 배너 스크립트 - 전상헌
 * ++ 템플릿에서 안되기에 수정 - 최정은
 * 
 * */
$(document).ready(function(){
	var bgc = ["rgb(8,62,108)","rgb(255,130,92)","rgb(45,53,64)","rgb(26,94,159)","rgb(121,31,31)","rgb(32,32,32)"];

	first();
	
	$(".main_banner_img").css("display","none");
	$("#banner0").css("display","block");
	$(".main-banner-content-box").css("backgroundColor",bgc[0]);
	
	$(".main-banner-list-item > img").mouseover(function(){
		$(".main-banner-content > img").css("display","none");
		var num=$(this).attr("id").substring(3);
		
		for(var i=0;i<6;i++){
			if(num==i){
				$(".main-banner-content > img").eq(i).css("display","block");
				$(".main-banner-content-box").css("backgroundColor",bgc[i]);
			}
		}
	});
	
//	for(var i=0; i<6;i++){
//		$("#img"+i).mouseover(function() {
//			$(".main_banner_img").css("display","none");
//			$("#banner"+i).css("display","block");
//			$(".main-banner-content-box").css("backgroundColor",bgc[i]);
//			
//		});
//	}
});	
	/*$("#img0").mouseover(function() {
		$(".main_banner_img").css("display","none");
		$("#banner0").css("display","block");
		$(".main-banner-content-box").css("backgroundColor","rgb(39,43,54)");

	});
	$("#img1").mouseover(function() {
		$(".main_banner_img").css("display","none");
		$("#banner1").css("display","block");
		$(".main-banner-content-box").css("backgroundColor","rgb(53,53,53)");
	});
	$("#img2").mouseover(function() {
		$(".main_banner_img").css("display","none");
		$("#banner2").css("display","block");
		$(".main-banner-content-box").css("backgroundColor","rgb(39,43,54)");
	});
	$("#img3").mouseover(function() {
		$(".main_banner_img").css("display","none");
		$("#banner3").css("display","block");
		$(".main-banner-content-box").css("backgroundColor","rgb(19,15,14)");
	});
	$("#img4").mouseover(function() {
		$(".main_banner_img").css("display","none");
		$("#banner4").css("display","block");
		$(".main-banner-content-box").css("backgroundColor","rgb(53,53,53)");
	});
	$("#img5").mouseover(function() {
		$(".main_banner_img").css("display","none");
		$("#banner5").css("display","block");
		$(".main-banner-content-box").css("backgroundColor","rgb(32,32,32)");
	});*/

function first() {
	//script
	var contentList = document.getElementById("content_list");
	var serveList = document.getElementById("serve_list");
	var main_list = contentList.previousElementSibling;
	var children = contentList.children;
	
	//임시경로추가
	var root="/bookFactory/";
	
	for(var i=0; i< children.length; i++){
		var contentImg=["<img src='//active.ridibooks.com/ridibooks_top_banner/pc/20180302175638_1519980998668.jpg' id='banner0' class='main_banner_img' onclick='goEvent()'/>",
			"<img src='//active.ridibooks.com/ridibooks_top_banner/pc/20180227175723_1519721843128.jpg' id='banner1' class='main_banner_img' onclick='goEvent()'/>",
			"<img src='//active.ridibooks.com/ridibooks_top_banner/pc/20180228154142_1519800102222.jpg' id='banner2' class='main_banner_img' onclick='goEvent()'/>",
			"<img src='//active.ridibooks.com/ridibooks_top_banner/pc/20180228152801_1519799281425.jpg' id='banner3' class='main_banner_img' onclick='goEvent()'/>",
			"<img src='//active.ridibooks.com/ridibooks_top_banner/pc/20180228160918_1519801758484.jpg' id='banner4' class='main_banner_img' onclick='goEvent()'/>"
			];
		
		var serverImg=["<img src='//active.ridibooks.com/ridibooks_top_banner/pc/20180302175638_rolling_1519980998668.jpg' id='img0' class='main_serve_img'/>",
			"<img src='//active.ridibooks.com/ridibooks_top_banner/pc/20180227175723_rolling_1519721843128.jpg' id='img1' class='main_serve_img'/>",
			"<img src='//active.ridibooks.com/ridibooks_top_banner/pc/20180228154142_rolling_1519800102222.jpg' id='img2' class='main_serve_img'/>",
			"<img src='//active.ridibooks.com/ridibooks_top_banner/pc/20180228152801_rolling_1519799281425.jpg' id='img3' class='main_serve_img'/>",
			"<img src='//active.ridibooks.com/ridibooks_top_banner/pc/20180228160919_rolling_1519801758484.jpg' id='img4' class='main_serve_img'/>"];
		
		
	/*  style ='display:none' */												//경로를 템플릿에서볼때는 이렇게 직접실행시킬때는 ../../ 추가해줘야함
//		contentList.children[i].innerHTML="<img id='banner"+i+"'class='main_banner_img' src='"+root+"resources/img/mainBanner"+i+".jpg' onclick='goEvent()'/>";
//		serveList.children[i].innerHTML="<img id='img"+i+"'class='main_serve_img' src='"+root+"resources/img/serveBanner"+i+".jpg'/>";
		
		contentList.children[i].innerHTML=contentImg[i];
		serveList.children[i].innerHTML=serverImg[i];
	}
	
	main_list.appendChild(contentList);
	main_list.appendChild(serveList);
}		

function goEvent(){
//	alert("이벤트페이지로 이동");
	var firstCate=$("input[name=firstCate]").val();
	location.href="/bookFactory/event.do?firstCateNum="+firstCate;
}