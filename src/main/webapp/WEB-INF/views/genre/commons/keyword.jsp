<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>키워드 검색</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css" href="${root}/css/basic/reset.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/basic/commons.css" />
<link rel="stylesheet" type="text/css" href="${root}/css/genre/keyword.css" />
<script type="text/javascript" src="${root}/script/basic/jquery.js"></script>
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
<%-- <script type="text/javascript" src="${root}/script/genre/keyword_check.js"></script> --%>
<script type="text/javascript">
$(function(){
	var cateNum=$("input[name=firstCate]").val();
	var jsonFile="";
	
	if(cateNum==2){
		jsonFile="keyword_romance.json";
	}else if(cateNum==3){
		jsonFile="keyword_fantasy.json";
	}else if(cateNum==4){
		jsonFile="keyword_comic.json";
	}else if(cateNum==5){
		jsonFile="keyword_bl.json";
	}
	
	$.getJSON(jsonFile, function(data){ 
		$(".keyword_top_head > .title").text(data["title"]);
		
		var group=data.sets[0].groups;
		
		$(group).each(function(i, ex) {
            var fieldset=document.createElement("fieldset");
            $(fieldset).addClass("keyword_filed");
            $("#keyword_top_list").append(fieldset);
            
            var fieldDiv=document.createElement("div");
            $(fieldDiv).addClass("keyword_top_list_show wrap-container");
            fieldset.append(fieldDiv);
            
            var titleDiv=document.createElement("div");
            $(titleDiv).text(group[i].title);
            fieldDiv.append(titleDiv);
            
            var listDiv=document.createElement("div");
            $(listDiv).addClass("keyword_top_list_button wrap-container");
            fieldDiv.append(listDiv);
            
            var listUl=document.createElement("ul");
            listDiv.append(listUl);
            
            var tags=group[i].tags;
            $(tags).each(function(j, ext){
	            var listLi=document.createElement("li");
	            listUl.append(listLi);
	            
	            var label=document.createElement("label");
	            $(label).addClass("bf-custom-checkbox checkbox-btn");
	            listLi.append(label);
	            
	            var labelCheck=document.createElement("input");
	            $(labelCheck).attr("type","checkbox");
	            $(labelCheck).attr("title",tags[j].name);
	            label.append(labelCheck);
	            
	            var labelSpan=document.createElement("span");
	            $(labelSpan).addClass("bf-button bf-transparent-btn");
	            $(labelSpan).text(tags[j].name);
	            label.append(labelSpan);
            });
        });
	});
	
	var listCount=0;
	var sendData="tags=";
	
	//키워드 선택시 밑에 나오는 태그
	$("#keyword_top_list").on("click",".keyword_top_list_button label > input",function(){
		event.preventDefault();
		
		if (this.checked == true) {
// 			alert('true');
			$(this).parent().parent().css({
				backgroundColor : "#A59AF6"
			});
			
			$(".keyword_not_choice").attr("style","display:none");
			$(".keyword_choice").attr("style","display:inline-block");
			
			var key=document.createElement("li");
			
			var button = '<button type="button" class="bf-button keyword-btn">'+$(this).next().text()+'<span class="button_x">X</span></button>';
			key.innerHTML = button;

			$(".keyword_choice ul.tag-list").append(key);
			
			sendData+=$(this).next().text()+",";
// 			alert(sendData);
			
			listCount=listCount+1;
			display(listCount);
			
			var root=$("input[name=rootJS]").val();
			var first=$("input[name=firstCate]").val();

			$.ajax({
				type:"get",
				url: root+"/keyword.do",
				data:sendData+"&firstCate="+first,
				success: "list(tagList)",
				error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
			    	alert(e.responseText);
			    }
			});
		}
	});
	
	
	display(listCount);
});

function list(tagList){
	alert(tagList);
}

function display(listCount){
	if(listCount==0){
		$(".keyword_no_search").attr("style","display:none");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").css({
			display:"none"
		});
	}else if(listCount==5){
		$(".keyword_not_choice").attr("style","display:table");
		$(".keyword_choice").attr("style","display:none");
		$(".keyword_no_search").attr("style","display:none");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").attr("style","display:none");
	}else{
		$(".keyword_not_choice").attr("style","display:none");
		$(".keyword_no_search").attr("style","display:none");
		$(".keyword_bottom_head, .keyword_bottom_book_list, .bf-pagination").attr("style","display:inline-block")
	}
}

</script>
</head>
<body>
	<input type="hidden" name="rootJS" value="${root}"/>
	<input type="hidden" name="firstCate" value="${firstCate}"/>
	<div class="keyword wrap-container">
		<div class="keyword_top">
			<div class="keyword_top_head">
				<span class="material-icons">search</span>
				<span class="title">키워드로 검색하기</span>
				<span class="sub-title">키워드로 마음에 드는 책을 찾아보세요!</span>
				<button type="button" class="bf-button bf-transparent-btn">전체 해제</button>
			</div>
			
			<form id="keyword_top_list">
<!-- 				<fieldset class="keyword_filed"> -->
<!-- 					<div class="keyword_top_list_show wrap-container"> -->
<!-- 						<div>장르/배경</div> -->
<!-- 						<div class="keyword_top_list_button wrap-container"> -->
<!-- 							<ul> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드1</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드2</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드3</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드4</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드5</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드6</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드7</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드8</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</fieldset> -->
<!-- 				<fieldset class="keyword_filed"> -->
<!-- 					<div class="keyword_top_list_show wrap-container"> -->
<!-- 						<div>소재</div> -->
<!-- 						<div class="keyword_top_list_button wrap-container"> -->
<!-- 							<ul> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드11</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드22</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드33</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드44</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드55</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드66</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드77</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드88</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</fieldset> -->
<!-- 				<fieldset class="keyword_filed"> -->
<!-- 					<div class="keyword_top_list_show wrap-container"> -->
<!-- 						<div>관계</div> -->
<!-- 						<div class="keyword_top_list_button wrap-container"> -->
<!-- 							<ul> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드111</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드222</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드333</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드444</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드555</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드666</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드777</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드888</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</fieldset> -->
<!-- 				<fieldset class="keyword_filed"> -->
<!-- 					<div class="keyword_top_list_show wrap-container"> -->
<!-- 						<div>남자 주인공</div> -->
<!-- 						<div class="keyword_top_list_button wrap-container"> -->
<!-- 							<ul> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드1111</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드2222</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드3333</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드4444</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드5555</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드6666</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드7777</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드8888</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</fieldset> -->
<!-- 				<fieldset class="keyword_filed"> -->
<!-- 					<div class="keyword_top_list_show wrap-container"> -->
<!-- 						<div>여자 주인공</div> -->
<!-- 						<div class="keyword_top_list_button wrap-container"> -->
<!-- 							<ul> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드11111</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드22222</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드33333</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드44444</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드55555</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드66666</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드77777</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드88888</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</fieldset> -->
<!-- 				<fieldset class="keyword_filed"> -->
<!-- 					<div class="keyword_top_list_show wrap-container"> -->
<!-- 						<div>분위기/기타</div> -->
<!-- 						<div class="keyword_top_list_button wrap-container"> -->
<!-- 							<ul> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드111111</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드222222</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드333333</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드444444</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드555555</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드666666</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드777777</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<label class="bf-custom-checkbox checkbox-btn">  -->
<!-- 										<input type="checkbox" title="" />  -->
<!-- 										<span class="bf-button bf-transparent-btn">키워드888888</span> -->
<!-- 									</label> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</fieldset> -->
			</form>
		</div>
		
		<div class="keyword_bottom">
			<div class="keyword_not_choice">
				<!-- 아무것도선택하지않았을때의 이미지 : 처음화면 -->
				<img src="${root}/img/arrow.PNG">
			</div>
			
			<div>	<!-- 태그를 선택하면 이 화면 나와야함 -->
				<div class="keyword_choice ">
					<ul class="tag-list">
					<!-- <li><button type="button" class="bf-button keyword-btn">
								키워드1
								<span class="button_x">X</span>
							</button>
						</li> -->
					</ul>
				</div>

				<!-- 해당되는 책이 없을때 나오는 화면 
				물어봐여함 책이없으면 키워드추가이벤트를 없애고 태그를 지울경우에 다시이벤트활성화
				-->
				<div class="keyword_no_search">
					<img src="${root}/img/sad.PNG">
				</div>
			</div>
				
			<div>
				<div class="keyword_bottom_head">
					<div>
						<span>158</span>
						<span>건의 작품이 있습니다.</span>
					</div>
					<div class="keyword_bottom_view_choice">
						<ol>
							<li><a href="#">평점순</a></li>
							<li><a href="#">인기순</a></li>
							<li><a class="activeFont" href="#">최신순</a></li>
						</ol>
					</div>
				</div>
			</div>
				
			<div class="keyword_bottom_book_list wrap-container">
				<ul class="mf-book-list list-landscape">
 					<c:forEach begin="0" end="5">
						<li class="mf-book-item">
							<div class="mf-book-thumbnail">
								<div class="mf-book-thumbnail-image" onclick="location.href='${root}/detail.do'">
									<img class="" src="//misc.ridibooks.com/cover/111000138/large" alt="image" />
								</div>
							</div>
							<div class="mf-book-metadata">
								<h3 class="book-metadata-text" onclick="location.href='${root}/detail.do'">운현궁의 봄</h3>
								<p class="book-metadata-author">
									<a class="" href="${root}/author.do">김동인</a>
								</p>
								<p class="book-metadata-translator hidden-block">
									<a class="" href="${root}/author.do"></a>
								</p>
								<p class="book-metadata-publisher">
									<a class="" href="${root}/author.do">Public Domain Books</a>
								</p>
								<div class="content-star-rate">
									<span class="star-icon-field material-icons"></span>
									<span class="non-star-icon-field material-icons"></span>
									<span class="count-field"> 9999명</span>
								</div>
								<pre class="book-metadata-description">* 이 책은 Public Domain Books 입니다. Public Domain Books란 저작자 사후 일정 기간이 경과하여 저작권이 만료된 책을 의미합니다. 회원님께서는 인터넷 상의 기타 사이트를 통해서 이 책을 찾아보실 수도 있습니다.
	
	1933년 4월부터 1934년 2월까지 <조선일보>에 연재된 장편소설로 <대수양(大首陽)>과 더불어 김동인의 대표적인 역사소설로 꼽힌다.
							
								</pre>
								<p class="book-metadata-price hidden-block">
									<span class="price-rent"></span>
								</p>
								<p class="book-metadata-price">
									<span class="price-purchase">무료</span>
								</p>
								<div class="keyword_bottom_book_hava_key keyword_choice">
									<ul>
										<li>
											<button type="button" class="bf-button keyword-btn">갖고있는키워드뿌려주긔</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">11111</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2222222</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">3333</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">4444444</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">555555</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">23123</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2132</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">11111</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2222222</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">3333</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">4444444</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">555555</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">23123</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2132</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">11111</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2222222</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">3333</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">4444444</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">555555</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">23123</button>
										</li>
										<li>
											<button type="button" class="bf-button keyword-btn">2132</button>
										</li>
									</ul>
								</div>
							</div>
						</li>
						<!--  -------------------------------------------------------------------------- -->
						<!-- <li>
							<div class="keyword_bottom_book">
								<div>
									<a><img></a>
								</div>
								
								<div class="keyword_bottom_book_content">
									<div><a>책 제목</a></div>
									<div class="keyword_bottom_book_star">
										<p class="content-star-rate">
											별이 들어가는 처음 두개의 span 사이에는 공백이 들어가면 안됨
											<span class="star-icon-field material-icons"></span>
											<span class="non-star-icon-field material-icons"></span>
											카운팅 숫자 표시는 필요없으면 빼도 됨
											<span class="count-field"> 9999명</span>
										</p>
										<p><a>작가</a></p>
										<p><a>출판사</a></p>
									</div>
									<div class="keyword_bottom_book_intro">
										<a>
											책소개 블라블라블라책소개 블라블라블라책소개 블라블라블라책소개 블라블라블라
											책소개 블라블라블라책소개 블라블라블라책소개 블라블라블라책소개 블라블라블라
											책소개 블라블라블라책소개 블라블라블라
										</a>
									</div>
									<div class="keyword_bottom_book_buy">
										<span>구매</span>
										<span>가격</span>
									</div>
									<div class="keyword_bottom_book_hava_key">
										<ol>
											<li>
												<button>#갖고있는키워드뿌려주긔</button>
											</li>
											<li>
												<button>#11111</button>
											</li>
											<li>
												<button>#2222222</button>
											</li>
											<li>
												<button>#3333</button>
											</li>
											<li>
												<button>#4444444</button>
											</li>
											<li>
												<button>#555555</button>
											</li>
											<li>
												<button>#23123</button>
											</li>
											<li>
												<button>#2132</button>
											</li>
											<li>
												<button>#11111</button>
											</li>
											<li>
												<button>#2222222</button>
											</li>
											<li>
												<button>#3333</button>
											</li>
											<li>
												<button>#4444444</button>
											</li>
											<li>
												<button>#555555</button>
											</li>
											<li>
												<button>#23123</button>
											</li>
											<li>
												<button>#2132</button>
											</li>
											<li>
												<button>#11111</button>
											</li>
											<li>
												<button>#2222222</button>
											</li>
											<li>
												<button>#3333</button>
											</li>
											<li>
												<button>#4444444</button>
											</li>
											<li>
												<button>#555555</button>
											</li>
											<li>
												<button>#23123</button>
											</li>
											<li>
												<button>#2132</button>
											</li>
										</ol>
									</div>									
								</div>
							</div>
						</li> -->
					</c:forEach>
				</ul>
			</div>
			
		</div>
		<nav class="bf-pagination">
			<ul class="bf-animated-btn">
				<li class="first"><a href="#0"><span></span></a></li>
				<li class="prev"><a href="#0"><span></span></a></li>
				<li><a href="#0">1</a></li>
				<li><a href="#0">2</a></li>
				<li><a class="active" href="#0">3</a></li>
				<li><a href="#0">4</a></li>
				<li><a href="#0">5</a></li>
				<li class="next"><a href="#0"><span></span></a></li>
				<li class="last"><a href="#0"><span></span></a></li>
			</ul>
		</nav>
	</div>

	
	<script type="text/javascript">
	document.querySelectorAll(".content-star-rate").forEach(function(e,i){
		createStarIcon(e, 3.7);
		
	})
	</script>
</body>
</html>