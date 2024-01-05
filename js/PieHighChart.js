$(document).ready(function () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Services/ChartWebService.asmx/RetriveBranchWiseStudentDetails",
        data: "{}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d; .0

            var data = [];
            for (var i in Result) {
                var serie = new Array(Result[i].DeptUid, Result[i].TotalAmount);
                data.push(serie);
            }
            DrawOPDoctorWiseChart(data);
        },
        error: function (Result) {
            alert('Request Status: ' + Result.status + ' Status Text: ' + Result.statusText + ' ' + Result.responseText);
        }
    });
});
function DrawOPDoctorWiseChart(series) {
    var colors = ['#ef6c00', '#1976d2', '#ffd54f', '#455a64', '#96a6a6 ', '#dd2c00', '#00838f', '#00bfa5', '#ffa000', '#64b5f6'];
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
    $('.SubjectWiseStudentDetails').highcharts({
        chart: {
            type: 'pie',
            backgroundColor: 'transparent',
            options3d: {
                enabled: true,
                alpha: 45
            },
            style: {
                fontFamily: 'SignikaNegative-Regular'
            }
        },
        title: {
            text: 'Branch Wise Student Details',
            style: {
                color: '#0776b9',
                fontWeight: 'bold',
            }
        },
        subtitle: {
            text: 'e-IMS | Sharma Institute of Technology (SIT) '
        },

        plotOptions: {
            pie: {
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    pointFormat: '{point.name}'
                },
                size: '100%',
                showInLegend: true,
                innerSize: 90,
                depth: 70,
            }
        },
        tooltip: {
            pointFormat: "Total Student: {point.y:f}"
        },
        legend: {
            labelFormat: '{name} ( {y:f} )'
        },
        series: [{
            name: 'Total Student',
            data: series,
            animation: {
                duration: 3000,
                easing: 'easeOutBounce'
            },

        }]
    });
}



