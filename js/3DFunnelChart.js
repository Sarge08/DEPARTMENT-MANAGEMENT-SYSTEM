$(document).ready(function () {
$.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "../Services/ChartWebService.asmx/GetAdvancePaymentModeReportChartDetails",
    data: "{}",
    dataType: "json",
    success: function (Result) {
        Result = Result.d; .0

        var data = [];
        for (var i in Result) {
            var serie = new Array(Result[i].DeptUid, Result[i].TotalAmount);
            data.push(serie);
        }
        DrawChartOPAdvance(data);
    },
    error: function (Result) {
        alert('Request Status: ' + Result.status + ' Status Text: ' + Result.statusText + ' ' + Result.responseText);
    }
});
});
function DrawChartOPAdvance(seriesData) {
    $('#FunnelChart').highcharts({
        chart: {
            type: 'funnel3d',
            options3d: {
                enabled: true,
                alpha: 10,
                depth: 50,
                viewDistance: 50
            },
            backgroundColor: 'transparent',
            style: {
                fontFamily: 'Amaranth-Regular'
            }
        },
        title: {
            text: 'Payment Mode Wise IP Advance Report',
            style: {
                color: '#0776b9',
                fontWeight: 'bold',
            }
        },
        subtitle: {
            text: 'eHMS | Life Institute Of Gastroentrology & Gynaecology'
        },
        legend: {
            align: 'center',
            x: 0,
            verticalAlign: 'center',
            y: 0
        },
        plotOptions: {
            series: {
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b> ({point.y:,.0f})',
                    allowOverlap: true,
                    y: 10
                },
                neckWidth: '30%',
                neckHeight: '25%',
                width: '80%',
                height: '80%'
            }
        },
        series: [{
            name: 'Total Amount',
            data: seriesData,
            animation: {
                duration: 3000,
                easing: 'easeOutBounce'
            },
        }]
    })

}