/**
 * 2018-01-24
 * 염현우 : 통계 매출
 */

var label1 = ["전체","일반","로맨스","판타지","만화","BL"];
var data1 =[ [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]],
	[[1, 9], [2, 18], [3, 25], [4, 33], [5, 37], [6, 50], [7, 100]],
	[[1, 19], [2,22], [3, 35], [4, 37], [5, 44], [6, 52], [7, 53]],
	[[1, 19], [2,20], [3, 43], [4, 43], [5, 43], [6, 55], [7, 68]],
	[[1, 5], [2,15], [3, 20], [4, 22], [5, 25], [6, 27], [7, 33]],
	[[1, 5], [2,15], [3, 20], [4, 22], [5, 25], [6, 27], [7, 50]] ];

for(var i=1;i<data1.length;i++){
	var row = data1[i];
	for(var k=0;k<row.length;k++){
		data1[0][k][1] += row[k][1];
	}
}

for(var i=0;i<label1.length;i++){
	$("table").append("<tr></tr>")
}

$("tr").each(function (i,e) {
	if(i == 0){
		/*for(var k=0;k<data1[i].length+1;k++){
			if(k==0){
				$(e).append("<th><strong>카테고리</strong></th>");							
			}else{
				$(e).append("<th>" + data1[i][k-1][0]+"일" + "</th>");
			}
		}*/
	}else{
		var dataIndex = data1[i-1];
		for(var k=0;k<dataIndex.length+1;k++){
			$(e).append("<td></td>");			
		}
	}
	
	$(e).find("td").each(function (j,subE) {
		if(j==0){
			$(subE).text(label1[i-1]);
		}else{
			$(subE).text(dataIndex[j-1][1]);
		}
	});		
});

var data = [
    {
        label: label1[0],
        data: data1[0]
    },
    {
        label: label1[1], 
        data: data1[1]
    },
    {
        label: label1[2], 
        data: data1[2]
    },
    {
        label: label1[3], 
        data: data1[3]
    },
    {
        label: label1[4], 
        data: data1[4]
    },
    {
        label: label1[5], 
        data: data1[5]
    }
];

var options = {
    series: {
        lines: { show: true },
        points: { show: true },
    },
    legend: { 
    	labelBoxBorderColor: 'white',
    	noColumns: 1,
    	position:"nw",
    	margin: [15,5],
    	labelFormatter: function(label, series) {
		    return '<a href="#' + label + '">' + label + '</a>';
		}
    },
    xaxis: {tickDecimals: 0, tickFormatter: function (v) { return v + "일"; } },
	yaxis: { tickDecimals: 0, tickFormatter: function (v) { return v; } }
};

var placeholder = $("#s_tt_chart");
$.plot(placeholder, data, options);




/*// Load the Visualization API and the corechart package.
google.charts.load('current', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
var chartRow = [];

for(var i=1;i<label1.length;i++){
	var k = data1[i].length;
	chartRow[i-1] = [label1[i],data1[i][k-1][1]];
}

function drawChart() {

  // Create the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'subject');
  data.addColumn('number', 'quantity');
  data.addRows(chartRow);

  // Set chart options
  var options = {
		  		 title:'매출 비율',
                 width:800,
                 height:350,
                 is3D: true,
                 colors:['#afd8f8','#cb4b4b','#4da74d','#9440ed','#bd9b33']};

  // Instantiate and draw our chart, passing in some options.
  var chart = new google.visualization.PieChart(document.getElementById('s_tt_circleChart'));
  chart.draw(data, options);
}*/



var lineColor = ['#afd8f8', '#cb4b4b','#4da74d', '#9440ed', '#bd9b33'];
/*chart TEST*/
var dLength = data1[0].length;
Morris.Donut({
	element: 's_tt_donutChart',     //그래프가 들어갈 위치의 ID를 적어주세요
	data: [                                     //그래프에 들어갈 data를 적어주세요
	{label: label1[1], value: data1[1][dLength-1][1] },
	{label: label1[2], value: data1[2][dLength-1][1] },
	{label: label1[3], value: data1[3][dLength-1][1] },
	{label: label1[4], value: data1[4][dLength-1][1] },
	{label: label1[5], value: data1[5][dLength-1][1] }
	],
	colors: lineColor, //그래프 color를 지정해줍니다.
	formatter: function (y) { 
		var total = 0;
		for(var i=1; i<label1.length;i++){
			total += data1[i][dLength-1][1];
		}
		return Math.round(y/total*100) + '%' 
	}  //y값 뒤에 %를 추가해줍니다.
});

/*chart progressbar*/
/*$("#s_tt_progress").progressbar({
	value: 37 //진행률을 보여줄 숫자를 입력해줍니다.,
	,color:"red"
});*/



$(function (){
  var elem = $(".s_myProgress > div");
  var total = 0;
  for(var i=1; i<label1.length;i++){
	  total += data1[i][dLength-1][1];
  }
  elem.each(function (i, e) {
	  var y = data1[i+1][dLength-1][1];
	  var value = Math.round(y/total*100);
	  $(this).css("width", value + '%').css("backgroundColor",lineColor[i]);
	  $(this).next('span').text(label1[i+1] +" "+ value + "%");
  });
});




