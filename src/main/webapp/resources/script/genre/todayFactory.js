/**
 * Date: 2017-12-24 Author: 박성호
 */

// Data(Book) List
function initRecList(targetId) {
	var dFrag = createRecList();
	updateRecList(dFrag, targetId);
}

function createRecList() {
	var dFrag = document.createDocumentFragment();
	for (var i = 0; i < 5; i++) {
		let pDiv = document.createElement("div");
		let spotlight = document.createElement("div");
		let bDiv = document.createElement("div");
		let mDiv = document.createElement("div");
		let sDiv = document.createElement("div");
		let tDiv = document.createElement("div");
		let p = document.createElement("p");
		let sSpan = document.createElement("span");
		let nSpan = document.createElement("span");
		let cSpan = document.createElement("span");
		let img = document.createElement("img");

		pDiv.onmouseover = mouseoverBook;
		pDiv.onmouseout = mouseoutBook;
		spotlight.className = "book-spotlight";
		pDiv.className = "today-recommended-book";
		bDiv.className = "book-thumbnail-wrap";
		mDiv.className = "recommended-book-metadata";
		sDiv.className = "content-star-rate";
		sSpan.className = "star-icon-field material-icons";
		nSpan.className = "non-star-icon-field material-icons";
		cSpan.className = "count-field";
		tDiv.className = "recommended-book-thumbnail";
		mDiv.appendChild(p);
		sDiv.appendChild(sSpan);
		bDiv.appendChild(mDiv);
		bDiv.appendChild(sDiv);
		bDiv.appendChild(tDiv);
		sDiv.appendChild(nSpan);
		sDiv.appendChild(cSpan);
		tDiv.appendChild(img);
		pDiv.appendChild(spotlight);
		pDiv.appendChild(bDiv);
		dFrag.appendChild(pDiv);
	}
	return dFrag;
}

function updateRecList(dFrag, targetId) {
	var target = document.getElementById(targetId);
	var pList = dFrag.querySelectorAll("p");
	var imgList = dFrag.querySelectorAll("img");
	var countField = dFrag.querySelectorAll(".count-field");
	var starRate = dFrag.querySelectorAll(".content-star-rate");
	
	for (var i = 0; i < pList.length; i++) {
		imgList[i].alt = "img";
		// TODO: Insert Data
		// meta-data
		pList[i].innerHTML = "김진명 필생의 대작 <br/>북핵 문제의 해법은?"
		// book-image
		imgList[i].src = "https://i.pinimg.com/736x/ff/9e/1e/ff9e1ee425118020df5323c87a82a6c7--reading-nooks-book-nooks.jpg";
		// star-icon
		let score = 4.5;
		let star = 3;
		let half = 1;
		//createStarIcon2(starRate[i],star,half);
		createStarIcon(starRate[i],score);
		// count
		countField[i].innerHTML = " 9999명";
	}
	target.appendChild(dFrag);	
}

// Spotlight effect
function mouseoverBook(active) {
	var childs = document.getElementsByClassName("today-recommended-book");
	for (var i = 0; i < childs.length; i++) {
		childs[i].style.opacity = "0.5";
	}
	active.style.opacity = "1";
	active.getElementsByClassName("book-spotlight")[0].style.opacity = "0.4";
}

function mouseoutBook(active) {
	var childs = document.getElementsByClassName("today-recommended-book");
	for (var i = 0; i < childs.length; i++) {
		childs[i].style.opacity = "1";
	}
	active.getElementsByClassName("book-spotlight")[0].style.opacity = "0";
}

$(function(){
	//책을 클릭했을때 이동
	$("#today-recommended-list-normal .book-thumbnail-wrap").click(function(){
		location.href="/bookFactory/bookPlus/plus.do";
	});
});