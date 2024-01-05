$(document).ready(function () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Services/ChartWebService.asmx/GetRevenueDetails",
        data: "{}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            var categories = [];
            var quarter1 = [];
            var quarter2 = [];
            var quarter3 = [];
            var quarter4 = [];
            var quarter5 = [];
            var quarter6 = [];
            var quarter7 = [];
            var series = [];
            for (var i in Result) {
                categories.push(Result[i].year);
                quarter1.push(Result[i].quarter1);
                quarter2.push(Result[i].quarter2);
                quarter3.push(Result[i].quarter3);
                quarter4.push(Result[i].quarter4);
                quarter5.push(Result[i].quarter5);
                quarter6.push(Result[i].quarter6);
                quarter7.push(Result[i].quarter7);
            }
            series.push({
                name: 'Cash',
                data: quarter1
            },
            {
                name: 'Card',
                data: quarter2
            },
            {
                name: 'Bank',
                data: quarter3
            },
            {
                name: 'Cheque',
                data: quarter4
            },
             {
                 name: 'NEFT',
                 data: quarter5
             },
             {
                 name: 'RTGS',
                 data: quarter6
             },
             {
                 name: 'UPI',
                 data: quarter7
             }
         );

            BindChart(categories, series);
        },
        error: function (xhr) {
            alert('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
        }
    });

});
function BindChart(categories, series) {
    var easeOutBounce = function (pos) {
        if ((pos) < (1 / 2.75)) {
            return (7.5625 * pos * pos);
        }
        if (pos < (2 / 2.75)) {
            return (7.5625 * (pos -= (1.5 / 2.75)) * pos + 0.75);
        }
        if (pos < (2.5 / 2.75)) {
            return (7.5625 * (pos -= (2.25 / 2.75)) * pos + 0.9375);
        }
        return (7.5625 * (pos -= (2.625 / 2.75)) * pos + 0.984375);
    };
    Math.easeOutBounce = easeOutBounce;
    var colors = ['#4da4f7', '#9143fb', '#6ef652', 'black', '#f08d0d ', 'lightgrey', 'hotpink'];
    $('#PaymentModeWiseExpesnsesChart').highcharts({
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Payment Mode Wise Daily Expenses Chart',
            style: {
                color: '#0776b9',
                fontWeight: 'bold',
            }
        },
        subtitle: {
            text: 'eHMS | Life Institute Of Gastroentrology & Gynaecology'
        },
        xAxis: {
            categories: categories,
            labels: {
                style: {
                    color: 'black',
                    fontWeight: 'bold',
                    fontSize: '9px'
                },
            }

        },
        legend: {
            labelFormat: '{name}',
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Amount in (Rs.)'
            },
            labels: {
                style: {
                    color: 'black',
                    fontWeight: 'bold',
                    fontSize: '12px'
                }
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    fontSize: '10px',
                    color: 'black'
                }
            }
        },

        tooltip: {
            formatter: function () {
                return '<b>' + this.x + '</b><br/>' +
            this.series.name + ' : ' + this.y + '<br/>' +
            'Total : ' + this.point.stackTotal;
            }
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                    style: {
                        textShadow: '0 0 3px black'
                    }
                },
                animation: {
                    duration: 2500,
                    easing: 'easeOutBounce'
                }
            },
            series: {
                stacking: 'normal'
            }
        },
        colors: colors,
        series: series
    });
}