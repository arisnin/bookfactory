/**
 * 	Date: 2017-12-20
 *	Author: 박성호
 */

// Data List
var popularTimeFlag;
function initPopularList(xhr) {
	var dFrag = createPopularList();
    updatePopularList(dFrag);
}
function refreshPopularList(xhr) {
	var dFrag = extractPopularList();
    updatePopularList(dFrag);
}
//function createPopularList() {
////	var dFrag = document.createDocumentFragment();
////	var ulNode = document.createElement("ul");
////    ulNode.id = "popular-ul";
////    ulNode.className = "popular-ul";
////    for (var i=0; i<12; i++) {
////		let liNode = document.createElement("li");
////		liNode.className = "popular-li";
////		ulNode.appendChild(liNode);
////    }
////    dFrag.appendChild(ulNode);
////    return dFrag;
//}
function extractPopularList() {
	var dFrag = document.createDocumentFragment();
    dFrag.appendChild(document.getElementById("popular-ul"));
    return dFrag;
}
function updatePopularList(dFrag, xhr) {
    var target = document.getElementById("popular-list");
    var itemList = dFrag.querySelectorAll(".popular-li");
    for (var i=0; i<itemList.length; i++) {
        let h3 = document.createElement("h3");
        let p = document.createElement("p");
        let spanL = document.createElement("span");
        let spanR = document.createElement("span");
        let div = document.createElement("div");
        let img = document.createElement("img");
        let button = document.createElement("button");
        h3.className = "popular-list-title";
        p.className = "popular-list-description";
        div.className = "popular-thumbnail";
        button.className = "popular-thumbnail-btn";
        button.type = "button";
        img.alt = "img";
        spanL.style.float = "left";
        spanR.style.float = "right";
        // TODO: Insert Data
        h3.innerHTML = "Book Title";
        spanL.innerHTML = "Book Description";
        spanR.innerHTML = "Cate";
        img.src = "https://kottke.org/plus/misc/images/book-cover-design-03.jpg";
//        button.onclick = function() {
//           //alert(i+1);
//        };
        div.appendChild(img);
        p.appendChild(spanL);
        p.appendChild(spanR);
        itemList[i].appendChild(h3);
        itemList[i].appendChild(p);
        itemList[i].appendChild(div);
        itemList[i].appendChild(button);
    }
    target.appendChild(dFrag);
    collapseMenu();
}
// MENU
function collapseMenu() {
   var e = document.getElementById("most-popular-box");
   var se = document.getElementById("popular-list");
   se.style.height = "3.75rem";
    e.style.height = "5.75rem";
    e.firstElementChild.onclick = extendMenu;
    e = document.getElementsByClassName("popular-toggle");
    e[1].style.display = "none";
    e[0].style.display = "inline-block";
    popularTimeFlag = setTimeout(slideMenu, 5000);
    document.getElementById("popular-ul").style.transition="all 0.5s";
}
function extendMenu() {
   var e = document.getElementById("most-popular-box");
   var se = document.getElementById("popular-list");
   se.style.height = "15rem";
   e.style.height = "16.9375rem";
   e.firstElementChild.onclick = collapseMenu;
    e = document.getElementsByClassName("popular-toggle");
    e[0].style.display = "none";
    e[1].style.display = "inline-block";
    clearTimeout(popularTimeFlag);
    document.getElementById("popular-ul").style.top = "0px";
}
function slideMenu() {
   var menu = document.getElementById("popular-ul");
   // 3.73 * 4 rem
   if (parseFloat(menu.style.top) <= -11.25) {
       menu.style.top = "0rem";
    } else menu.style.top = (parseFloat(menu.style.top) - 3.75) + "rem";
    popularTimeFlag = setTimeout(slideMenu, 5000);
}

// XHR
function toServer() {
   const url = "";
    sendRequest("get", url, fromServer, null);
}
function fromServer(xhr) {
   // TODO: Your codes
   // popularList(xhr);
}
function sendRequest(method, url, callback, params) {
   method = method.toLowerCase();
   params = (params == "") ? null : params;
   if (method == "get" && params != null) url += "?" + params;
   let xhr = createXHR();
   xhr.open(method, url, true);
   xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   xhr.send((method == "post") ? params : null);
   xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) callback(xhr);
   };
}
function createXHR() {
   if (window.XMLHttpRequest) return new XMLHttpRequest();
   else return new ActiveXObject("Microsoft.XMLHTTP");
}