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
var colors = ['#ff550f', 'black'];
Highcharts.chart('LineColumnChart', {
    chart: {
        zoomType: 'xy'
    },
    title: {
        text: 'Daily Income and Expenses Chart Visualisation',
        style: {
            color: '#0776b9',
            fontWeight: 'bold',
        }
    },
    subtitle: {
        text: 'Life Institute Of Gastroentrology & Gynaecology'
    },
    xAxis: [{
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
          'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        crosshair: false
    }],
    yAxis: [{ // Primary yAxis
        labels: {
            format: '{value}',
            style: {
                color: 'black',
                fontWeight: 'bold'
            }
        },
        title: {
            text: 'Daily Expenses',
            style: {
                color: 'black',
                fontWeight: 'bold'
            }
        }
    }, { // Secondary yAxis
        title: {
            text: 'Daily Income',
            style: {
                color: 'black',
                fontWeight: 'bold',
            }
        },
        labels: {
            format: '{value}',
            style: {
                color: 'black',
                fontWeight: 'bold'
            }
        },
        opposite: true
    }],
    tooltip: {
        shared: true
    },
    //colors: colors,
    series: [{
        name: 'Expenses',
        type: 'spline',
        data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 75.2, 26.5, 23.3, 18.3, 47.9, 9.6],
        tooltip: {
            valuePrefix: 'Rs '
        },
        animation: {
            duration: 10000,
            easing: 'easeOutBounce'
        }

    }, {
        name: 'Income',
        type: 'column',
        yAxis: 1,
        data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 13.6, 54.4],
       
        tooltip: {
            valuePrefix: 'Rs '
        },
        animation: {
            duration: 3000,
            easing: 'easeOutBounce'
        }
    }]
});