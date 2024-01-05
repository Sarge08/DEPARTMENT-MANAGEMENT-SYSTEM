$(document).ready(function () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Services/ChartWebService.asmx/RetriveTrainingCentreWiseStudent",
        data: "{}",
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            var data = [];
            for (var i in Result) {
                var serie = { tcuid: Result[i].TCUid,name: Result[i].district, y: Result[i].target, drilldown: Result[i].drilldown };
                data.push(serie);
            }

            OSFDCDrillDown(data);
        },
        error: function (Result) {
            alert("Error");
        }
    });
});

function OSFDCDrillDown(seriesArr) {
    var colors = ['#ef6c00', '#1976d2', '#ffd54f', '#455a64', '#96a6a6 ', '#dd2c00', '#00838f', '#00bfa5', '#ffa000', '#64b5f6', '#2E8B57', '#98FB98', '#B22222', '#9932CC', '#66CD00'];
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
    $('.DrillDownHighChartAll').highcharts({
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 0,
                beta: 0,
            },
            style: {
                fontFamily: 'SignikaNegative-Regular'
            },
            backgroundColor: 'transparent',
            events: {
                drilldown: function (e) {
                    if (!e.seriesOptions) {
                        var chart = this;
                        chart.showLoading('Please Wait...');
                        var dataArr = CallChildOSFDC(e.point.tcuid);
                        chart.setTitle({
                            text: 'Course Wise Student Details'
                        });
                        data = {
                            name: e.point.name,
                            data: dataArr,
                        }
                        setTimeout(function () {
                            chart.hideLoading();
                            chart.addSeriesAsDrilldown(e.point, data);
                        }, 1000);
                    }
                }
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
            text: 'e-IMS | Smart ERP | Sharma Institute of Technology (SIT)'
        },
        legend: {
            enabled: false,
            labelFormat: '{name} ( {y:.2.f} )',
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Total Target Assigned'
            }
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true
                }
            }
        },
        series: [{
            name: 'District',
            colorByPoint: true,
            data: seriesArr,
            animation: {
                duration: 3000,
                easing: 'easeOutBounce'
            },
        }],
        colors:colors,
        drilldown: {
            series: [],
            animation: {
                duration: 3000,
                easing: 'easeOutBounce'
            },
        }
    });
}

function CallChildOSFDC(name) {
    var DrilldowndataOSFDC = [];
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Services/ChartWebService.asmx/TargetUsedByPIAOSFDC",
        data: JSON.stringify({ district: name }),
        dataType: "json",
        success: function (Result) {
            Result = Result.d;
            for (var i in Result) {
                var serie = { name: Result[i].district, y: Result[i].target };
                DrilldowndataOSFDC.push(serie);
            }
        },
        error: function (Result) {
            alert("Error");
        }
    })
    return DrilldowndataOSFDC;
}
