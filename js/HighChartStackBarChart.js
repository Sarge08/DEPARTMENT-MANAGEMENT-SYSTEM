$(document).ready(function () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Services/ChartWebService.asmx/DailyIncomeExpensesSummary",
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
    var colors = ['orange', 'green', 'brown', '#113262', 'powderblue', 'yellowgreen', 'hotpink', '#4da4f7', 'purple'];
    $('#StackBarHighChart').highcharts({
        chart: {
            type: 'area',
            style: {
                fontFamily: 'Amaranth-Regular'
            }
        },
        title: {
            text: 'Daily Income / Expenses Summary Chart (Last 10 Days)',
            style: {
                color: '#0776b9',
                fontWeight: 'bold'
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
            labelFormat: '{name} ',
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
            pointFormat: '<span>{series.name}</span>: <b>{point.percentage:.1f}%</b> Rs ({point.y:,.0f})<br/>',
        },
        plotOptions: {
            series: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                    style: {
                        textShadow: '0 0 3px black',
                        fontWeight: 'bold',
                        fontSize: '10px'
                    }
                },
                animation: {
                    duration: 2500,
                    easing: 'easeOutBounce'
                }
            }
        },
        //colors: colors,
        series: series
    });
}