Highcharts.chart('3dDonutChart', {
    chart: {
        type: 'pie',
        options3d: {
            enabled: true,
            alpha: 45
        }
    },
    title: {
        text: 'Out Patient Department Wise Collection',
        style: {
            color: '#0776b9',
            fontWeight: 'bold',
        }
    },
    subtitle: {
        text: 'Life Institute Of Gastroentrology & Gynaecology'
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
    legend: {
        labelFormat: '{name} ( Rs {y:.2f} )'
    },
    series: [{
        name: 'Total Amount',
        data: [
          ['Pathology', 5400],
          ['Radiology', 2400],
          ['Gastroentrology', 1200],
          ['X-RAY', 600],
          ['Cardilogy', 800]
        ],
        animation: {
            duration: 3000,
            easing: 'easeOutBounce'
        }
    }]
});