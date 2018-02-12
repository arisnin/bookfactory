/**
 * 2018-01-23
 * 염현우 : 통계 일반 누적판매수 꺾은선 그래프
 */
$(function () {
	
	var label1 = ["그대 눈동자에 건대","우리는 언젠가 만난다","82년생 김지영","어떻게 살것인가","종료되었습니다"];
	var data1 =[ [[1, 10], [2, 15], [3, 25], [4, 44], [5, 45], [6, 60], [7, 65]],
		[[1, 9], [2, 18], [3, 25], [4, 33], [5, 37], [6, 50], [7, 52]],
		[[1, 19], [2,22], [3, 35], [4, 37], [5, 44], [6, 52], [7, 53]],
		[[1, 19], [2,20], [3, 43], [4, 43], [5, 43], [6, 55], [7, 60]],
		[[1, 5], [2,15], [3, 20], [4, 22], [5, 25], [6, 27], [7, 50]] ];
    
	for(var i=0;i<label1.length;i++){
		$("table").append("<tr></tr>")
	}
	
	$("tr").each(function (i,e) {
		if(i != 0){
			var dataIndex = data1[i-1];
					
			for(var k=0;k<dataIndex.length+2;k++){
				$(e).append("<td></td>");			
			}
		}
		
		$(e).find("td").each(function (j,subE) {
			if(j==0){
				$(subE).text((i) + "등");
			}else if(j==1){
				$(subE).text(label1[i-1]);
			}else{
				$(subE).text(dataIndex[j-2][1]);
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
        }
    ];

    var options = {
        series: {
            lines: { show: true },
            points: { show: true },
        },
        legend: { 
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
});

