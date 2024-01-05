

$(document).ready(function () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Services/ChartWebService.asmx/DoctorWisePaymentReport",
        data: "{}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            var categories = [];
            var quarter1 = [];
            var quarter2 = [];
            var quarter3 = [];
            var series = [];
            for (var i in Result) {
                categories.push(Result[i].year);
                quarter1.push(Result[i].quarter1);
                quarter2.push(Result[i].quarter2);
                quarter3.push(Result[i].quarter3);
            }
            series.push(
          {
              name: 'Cash',
              data: quarter1
          },
          {
              name: 'Card',
              data: quarter2
          }
          ,
          {
              name: 'UPI',
              data: quarter3
          }
       );
            BindChartDoctorwIsePaymentChart(categories, series);
        },
        error: function (xhr) {
            alert('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
        }
    });
});
function BindChartDoctorwIsePaymentChart(categories, series) {
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
    var colors = ['#ef6c00', '#1976d2', '#ffd54f', '#455a64', '#96a6a6 ', '#dd2c00', '#00838f', '#00bfa5', '#ffa000', '#64b5f6'];
    $('#StackBarChart').highcharts({
        chart: {
            type: 'column',
            style: {
                fontFamily: 'Amaranth-Regular'
            }
        },
        title: {
            text: 'Doctor Wise OP Payment Report (Today)',
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
            pointFormat: '<span>{series.name}</span>: Rs ({point.y:,.0f})<br/>',
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
                },
                colorByPoint: true,
            }
        },
        colors:colors,
        series: series
    });
}