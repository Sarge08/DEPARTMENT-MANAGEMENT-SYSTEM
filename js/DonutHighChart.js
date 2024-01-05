//Doctor Wise IP Count

$(document).ready(function () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Services/ChartWebService.asmx/DoctorWiseIPPatientCount",
        data: "{}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d; .0
            var data = [];
            for (var i in Result) {
                var serie = new Array(Result[i].HeadName, Result[i].Total);
                data.push(serie);
            }
            DrawChartIP(data);
        },
        error: function (Result) {
            alert('Request Status: ' + Result.status + ' Status Text: ' + Result.statusText + ' ' + Result.responseText);
        }
    });
});
function DrawChartIP(series) {
    var colors = ['#4da4f7', '#9143fb', '#6ef652', 'black', '#f08d0d ', 'lightgrey'];
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
    $('.DoctorWisePieChart').highcharts({
        chart: {
            type: 'pie',
            backgroundColor: 'transparent',
            options3d: {
                enabled: true,
                alpha: 45
            }
        },
        title: {
            text: 'Doctor Wise IP Admission Chart',
            style: {
                color: '#0776b9',
                fontWeight: 'bold',
            }
        },
        subtitle: {
            text: 'eHMS | Life Institute of Gastroentrology & Gyanecology'
        },

        plotOptions: {
            pie: {
                cursor: 'pointer',
                dataLabels: {
                    enabled: false,
                    pointFormat: '{point.name}'
                },
                size: '100%',
                showInLegend: true,
                innerSize: 100,
                depth: 45,
            }
        },
        tooltip: {
            pointFormat: "Total Patient: {point.y:.f}"
        },
        legend: {
            labelFormat: '{name} ( {y:.f} )'
        },
        series: [{
            name: 'Total Expenses',
            data: series,
            animation: {
                duration: 3000,
                easing: 'easeOutBounce'
            },

        }]
    });
}


