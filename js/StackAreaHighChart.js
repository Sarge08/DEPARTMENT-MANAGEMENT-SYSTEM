$(document).ready(function () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Services/ChartWebService.asmx/ExpensesPaymentModeWiseChart",
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
            var quarter8 = [];
            var quarter9 = [];
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
                quarter8.push(Result[i].quarter8);
                quarter9.push(Result[i].quarter9);
            }
            series.push(
          {
              name: 'Gastroentrology',
              data: quarter1
          },
          {
              name: 'Pathology',
              data: quarter2
          }
          ,
          {
              name: 'ECG',
              data: quarter3
          }
          ,
          {
              name: 'Radiology',
              data: quarter4
          }
          ,
          {
              name: 'IP Advance',
              data: quarter5
          }
          ,
          {
              name: 'Online Payment',
              data: quarter6
          }
          ,
          {
              name: 'Expenses',
              data: quarter7
          }
           ,
          {
              name: 'Net Income',
              data: quarter8
          },
          {
              name: 'Cash In Hand',
              data: quarter9
          } 
       );
            BindChartStackAreaChart(categories, series);
        },
        error: function (xhr) {
            alert('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
        }
    });
});
function BindChartStackAreaChart(categories, series) {
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
    $('#StackAreaHightChart').highcharts({
        chart: {
            type: 'area',
            style: {
                fontFamily: 'Amaranth-Regular'
            }
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
                }
            }
        },
        colors: colors,
        series: series
    });
}
