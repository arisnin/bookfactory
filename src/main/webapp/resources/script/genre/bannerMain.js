/*
 * 메인 홈 화면에서의 이벤트 배너 스크립트 - 전상헌
 * ++ 템플릿에서 안되기에 수정 - 최정은
 * 
 * */
$(document).ready(function(){
	var bgc = ["rgb(39,43,54)","rgb(53,53,53)","rgb(39,43,54)","rgb(19,15,14)","rgb(53,53,53)","rgb(32,32,32)"];

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
	/*  style ='display:none' */												//경로를 템플릿에서볼때는 이렇게 직접실행시킬때는 ../../ 추가해줘야함
		contentList.children[i].innerHTML="<img id='banner"+i+"'class='main_banner_img' src='"+root+"resources/img/mainBanner"+i+".jpg' onclick='goEvent()'/>";
		serveList.children[i].innerHTML="<img id='img"+i+"'class='main_serve_img' src='"+root+"resources/img/serveBanner"+i+".jpg'/>";
		
	}
	
	main_list.appendChild(contentList);
	main_list.appendChild(serveList);
}		

function goEvent(){
	alert("이벤트페이지로 이동");
}