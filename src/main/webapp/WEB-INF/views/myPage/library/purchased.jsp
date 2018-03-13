<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이리디, 책, 구매목록</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${root}/css/basic/reset.css" type="text/css" rel="stylesheet">
<link href="${root}/css/basic/commons.css" type="text/css" rel="stylesheet">
<link href="${root}/css/myPage/library/purchased.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${root}/script/basic/commons.js"></script>
</head>
<body>
	<div class="wrap-container">
		<section class="wrap-container mf-purchased-box">
			<!-- 타이틀 -->
			<div class="bf-title-row title-type4">
				<h3>구매목록<span class="book-count">${purchased_count}</span>
					<c:if test="${searchValue != null}">
					><span class="search_value">'${searchValue}'</span>검색결과<span class="book-count">${myPagePurchasedPageDtoList.size()}</span>
					</c:if>
				</h3>
			</div>
			
			<!-- 구매 서비스 타입  -->
			<div class="bf-service-type-menu">
				<ul class="service-type-list">
					<li><a class="active" href="javascript:alert('전체')">전체</a></li>
					<li><a href="javascript:alert('구매')">구매</a></li>
					<li><a href="javascript:alert('대여')">대여</a></li>
					<li><a href="javascript:alert('이용권 미구현')">이용권</a></li>
				</ul>
				
				<div class="search-box">
					<form name="purchased_search" method="get" autocomplete="on" action="${root}/library/purchased.do">
						<span class="material-icons">search</span>
						<input id="search-word" class="search-word" type="text" name="searchWord" placeholder="책 제목 또는 저자명" onkeyup="purchasedFun()"/>
						<input type="hidden" value="${purchased_count}" name="purchased_count"/>
					</form>
				</div>
			</div>
			<!-- 구매목록 기능  -->
			<div class="purchased-action-box">
				<div class="purchased-action-select">
					<label class="bf-custom-checkbox">
						<input type="checkbox" title="전체선택" onclick="checkAllToggle('.purchased-form-list-box input[type=checkbox]', this.checked)"/>
						<span class="all-mark"></span>
						<span class="checkbox-label">전체선택</span>
					</label>
				</div>
				<div class="purchased-action-button">
					<button class="bf-button bf-white-btn" type="button" onclick="everLastingDelete()">영구삭제</button>
					<button class="bf-button" type="button" onclick="alert('미구현 기능입니다.')">다운로드</button>
				</div>
			</div>
			<!-- 구매목록 출력  -->
			<div class="purchased-form-list-box">
				<form name="purchased-form-list" method="post" onsubmit="return purchasedForm(this)" action="${root}/library/purchasedDelete.do">
					<ul class="mf-book-list">
						<c:forEach var="myPurchasedPageDto" items="${myPagePurchasedPageDtoList}">
						<li class="mf-book-item">
							<div class="mf-book-checkbox">
								<label class="bf-custom-checkbox">
									<input type="checkbox" title="구매목록 책 선택" name="book_num" value="${myPurchasedPageDto.book_num}"/>
									<span class="all-mark"></span>
								</label>
							</div>
							<div class="mf-book-thumbnail">
								<div class="mf-book-thumbnail-image" onclick ="location.href='${root}/book/example.do?book_num=${myPurchasedPageDto.book_num}'">
									<img class="" src="${myPurchasedPageDto.img_path}"/>
								</div>
							</div>
							<div class="mf-book-metadata">
								<h3 class="book-metadata-text" onclick ="javascript:bookDetailLink('${root}', '${myPurchasedPageDto.book_num}')">${myPurchasedPageDto.book_name}</h3>
								<p class="book-metadata-author">
									<a class="" href="javascript:authorDetailHref('${root}', '${myPurchasedPageDto.author_num}')">${myPurchasedPageDto.author_name}</a>
								</p>
							</div>
						</li>
						</c:forEach>
					</ul>
				</form>
			</div>
			<div class="purchased-form-delete-box"></div>
		</section>
	</div>
	<!-- 자바 스크립트 -->
	<script type="text/javascript" src="${root}/script/myPage/myPage.js"></script>
	<script type="text/javascript">
		function purchasedForm(obj){
			var cbox = $(":input[name=book_num]:checkbox:checked");
			
			if(!cbox.val()){
				alert("삭제할 책을 선택하세요");
				cbox.focus();
				return false;
			}
		}
	
		function everLastingDelete(){
			$("form[name=purchased-form-list]").submit();
		}
		
		var input = $(":input[name=searchWord]").val();
		
		function purchasedFun(event) {
		    event.preventDefault();
		    if (event.keyCode === 13) {
		        $("form[name=purchased_search]").submit();
		    }
		}
		
		/* function autocomplete(inp, arr){
			var currentFocus;
			
			inp.addEventListener("input", function(e){
				var a, b, i, val = this.value;
				
				closeAllLists();
				if(!val){ return false; }
				currentFocus = -1;
				
				a = document.createElement("DIV");
				a.setAttribute("id", this.id + "autocomplete-list");
				a.setAttribute("class", "autocomplete-items");
				
				this.parentNode.appendChild(a);
				
				for(i = 0 ; i < arr.length; i++){
					if(arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()){
						b = document.createElement("DIV");
						b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
						b.innerHTML += arr[i].substr(val.length);
						
						b.innerHTML += "<input type = 'hidden' value - '" + arr[i] + "'>";
						b.addEventListener("click", function(e){
							inp.value = this.getElementsByTagName("input")[0].value;
							
							closeAllLists();
						});
						a.appendClid(b);
					}
				}
			});
		} */
			/* inp.addEventListener("keydown", function(e){
				var x = document.getElementById(this.id + "autocomplete-list");
				
				if(x) x = x.getElementsByTagName("div");
				
				if(e.keyCode == 40){
					addActive(x);
				}else if(e.keyCode == 38){
					currentFocus--;
					addActive(x);
				}else if(e.keyCode == 13){
					empreventDefault();
					
					if(currentFocus > -1){
						if(x) x[currentFocus].click();
					}
				}
			});
			
			function addActive(x){
				if(!x) return false;
				
				removeActive(x);
				
				if(currentFocus >= x.length) currentFocus = 0;
				
				if(currentFocus < 0) currentFocus = (x.length - 1);
				
				x[currentFocus].classList.add("autocomplete-active");
			}
			
			function removeActive(x){
				for(var i = 0; i < x.length; i++){
					x[i].classList.remove("autocomplete-active");
				}
			}
			
			function closeAllLists(elmnt){
				var x = document.getElementsByClassName("autocomplete-items");
				
				for(var i = 0; i < x.length; i++){
					if(elmnt != x[i] && elmnt != inp){
						x[i].parentNode.removeChild(x[i]);
					}
				}
			}
			
			document.addEventListener("click", function(e){
				closeAllLists(e.target);	
			});
		}
		
		var book_name = ["조선 자본주의 공화국"];
		var author = ["김태경"];
		
		autocomplete(document.getElementById("search-word"), book_name);
		autocomplete(document.getElementById("search-word", author)); */
	</script>
</body>
</html>