/**
 * 2018-01-22
 * 염현우 : 통계 전체 누적판매수 꺾은선 그래프
 */
$(function () {
    var data1 = [
        {
            label: "일반",
            data: [[1, 10], [2, 15], [3, 25], [4, 44], [5, 45], [6, 60], [7, 65]]
        },
        {
            label: "로맨스", 
            data: [[1, 9], [2, 18], [3, 25], [4, 33], [5, 37], [6, 50], [7, 52]]
        },
        {
            label: "판타지", 
            data: [[1, 19], [2,22], [3, 35], [4, 37], [5, 44], [6, 52], [7, 53]]
        },
        {
            label: "만화", 
            data: [[1, 19], [2,20], [3, 43], [4, 43], [5, 43], [6, 55], [7, 60]]
        },
        {
            label: "BL", 
            data: [[1, 5], [2,15], [3, 20], [4, 22], [5, 25], [6, 27], [7, 50]]
        }
    ];
    
    
    var options1 = {
        series: {
            lines: { show: true },
            points: { show: true }
        },
        legend: { 
        	noColumns: 1,
        	position:"nw",
        	margin: [15,5],
        	labelFormatter: function(label, series) {
    		    return '<a href="/bookFactory/index.jsp?pname=/statistics/generalTotal.jsp">' + label + '</a>';
    		}
        },
        xaxis: { tickDecimals: 0, tickFormatter: function (v) { return v + "일"; } },
		yaxis: { tickDecimals: 0, tickFormatter: function (v) { return v; } }        
    };

    var placeholder1 = $("#s_tt_chart");    
    $.plot(placeholder1, data1, options1);
});