    $(function () {

        var options = {
            chart: {
                renderTo: 'container4',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: 'Web Sales & Marketing Efforts'
            },
            tooltip: {
                formatter: function() {
                    return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        formatter: function() {
                            return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: []
            }]
        }
            
            $.getJSON("/estaciones/pruebaarray", function(json) {
                options.series[0].data = json;
                chart = new Highcharts.Chart(options);
            });


    $('#container').highcharts({
        data: {
            table: 'datatable',
        },
        chart: {
            type: 'column'
        },
        title: {
            text: 'Contratos Firmados por Meses'
        },
        subtitle: {
            text: 'Nro de contratos firmados'
        },
        xAxis: {
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Nro Contratos'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.0f}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
    });



/*Columna */
var options = {
        chart: {
            renderTo: 'container1',
            type: 'column',
            marginRight: 130,
            marginBottom: 25
        },
        title: {
            text: 'Project Requests',
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
            categories: []
        },
        yAxis: {
            title: {
                text: 'Requests'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            formatter: function() {
                    return '<b>'+ this.series.name +'</b><br/>'+
                    this.x +': '+ this.y;
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -10,
            y: 100,
            borderWidth: 0
        },
        series: []
    }
   
    $.getJSON("/dasboard/solicitudes", function(json) {
        options.xAxis.categories = json[0]['data'];
        options.series[0] = json[1];
        options.series[1] = json[2];
        options.series[2] = json[3];
        chart = new Highcharts.Chart(options);
    });
/*end columna*/
    //  $('#container1').highcharts({

    //     chart: {
    //         type: 'column'
    //     },
    //     title: {
    //         text: 'Contratos Firmados por Meses'
    //     },
    //     subtitle: {
    //         text: 'Nro de contratos firmados'
    //     },
    //     xAxis: {
    //         categories: [
    //             'Ene',
    //             'Feb',
    //             'Mar',
    //             'Apr',
    //             'May',
    //             'Jun',
    //             'Jul',
    //             'Aug',
    //             'Sep',
    //             'Oct',
    //             'Nov',
    //             'Dec'
    //         ],
    //         crosshair: true
    //     },
    //     yAxis: {
    //         min: 0,
    //         title: {
    //             text: 'Rainfall (mm)'
    //         }
    //     },
    //     tooltip: {
    //         headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
    //         pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
    //             '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
    //         footerFormat: '</table>',
    //         shared: true,
    //         useHTML: true
    //     },
    //     plotOptions: {
    //         column: {
    //             pointPadding: 0.2,
    //             borderWidth: 0
    //         }
    //     },
    //     series: [{
    //         name: 'Tokyo',
    //         data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

    //     }, {
    //         name: 'New York',
    //         data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

    //     }, {
    //         name: 'London',
    //         data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

    //     }, {
    //         name: 'Berlin',
    //         data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5]

    //     }]
    // });


// Create the chart
    $('#container3').highcharts({
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Browser market shares. January, 2015 to May, 2015'
        },
        subtitle: {
            text: 'Click the slices to view versions. Source: netmarketshare.com.'
        },
        plotOptions: {
            series: {
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: {point.y:.1f}%'
                }
            }
        },

        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
        },
        series: [{
            name: "Brands",
            colorByPoint: true,
            data: [{
                name: "Microsoft Internet Explorer",
                y: 56.33,
                drilldown: "Microsoft Internet Explorerxxx"
            }, {
                name: "Chrome",
                y: 24.03,
                drilldown: "Chrome"
            }, {
                name: "Firefox",
                y: 10.38,
                drilldown: "Firefox"
            }, {
                name: "Safari",
                y: 4.77,
                drilldown: "Safari"
            }, {
                name: "Opera",
                y: 0.91,
                drilldown: "Opera"
            }, {
                name: "Proprietary or Undetectable",
                y: 0.2,
                drilldown: null
            }]
        }],
        drilldown: {
            series: [{
                name: "Microsoft Internet Explorer",
                id: "Microsoft Internet Explorer",
                data: [
                    ["v11.0", 24.13],
                    ["v8.0", 17.2],
                    ["v9.0", 8.11],
                    ["v10.0", 5.33],
                    ["v6.0", 1.06],
                    ["v7.0", 0.5]
                ]
            }, {
                name: "Chrome",
                id: "Chrome",
                data: [
                    ["v40.0", 5],
                    ["v41.0", 4.32],
                    ["v42.0", 3.68],
                    ["v39.0", 2.96],
                    ["v36.0", 2.53],
                    ["v43.0", 1.45],
                    ["v31.0", 1.24],
                    ["v35.0", 0.85],
                    ["v38.0", 0.6],
                    ["v32.0", 0.55],
                    ["v37.0", 0.38],
                    ["v33.0", 0.19],
                    ["v34.0", 0.14],
                    ["v30.0", 0.14]
                ]
            }, {
                name: "Firefox",
                id: "Firefox",
                data: [
                    ["v35", 2.76],
                    ["v36", 2.32],
                    ["v37", 2.31],
                    ["v34", 1.27],
                    ["v38", 1.02],
                    ["v31", 0.33],
                    ["v33", 0.22],
                    ["v32", 0.15]
                ]
            }, {
                name: "Safari",
                id: "Safari",
                data: [
                    ["v8.0", 2.56],
                    ["v7.1", 0.77],
                    ["v5.1", 0.42],
                    ["v5.0", 0.3],
                    ["v6.1", 0.29],
                    ["v7.0", 0.26],
                    ["v6.2", 0.17]
                ]
            }, {
                name: "Opera",
                id: "Opera",
                data: [
                    ["v12.x", 0.34],
                    ["v28", 0.24],
                    ["v27", 0.17],
                    ["v29", 0.16]
                ]
            }]
        }
    });

});

// var chart;
// var chartData = [
//     {
//         "country": "USA",
//         "visits": 4025,
//         "color": "#FF0F00"
//     },
//     {
//         "country": "China",
//         "visits": 1882,
//         "color": "#FF6600"
//     },
//     {
//         "country": "Japan",
//         "visits": 1809,
//         "color": "#FF9E01"
//     },
//     {
//         "country": "Germany",
//         "visits": 1322,
//         "color": "#FCD202"
//     },
//     {
//         "country": "UK",
//         "visits": 1122,
//         "color": "#F8FF01"
//     },
//     {
//         "country": "France",
//         "visits": 1114,
//         "color": "#B0DE09"
//     },
//     {
//         "country": "India",
//         "visits": 984,
//         "color": "#04D215"
//     },
//     {
//         "country": "Spain",
//         "visits": 711,
//         "color": "#0D8ECF"
//     },
//     {
//         "country": "Netherlands",
//         "visits": 665,
//         "color": "#0D52D1"
//     },
//     {
//         "country": "Russia",
//         "visits": 580,
//         "color": "#2A0CD0"
//     },
//     {
//         "country": "South Korea",
//         "visits": 443,
//         "color": "#8A0CCF"
//     },
//     {
//         "country": "Canada",
//         "visits": 441,
//         "color": "#CD0D74"
//     },
//     {
//         "country": "Brazil",
//         "visits": 395,
//         "color": "#754DEB"
//     },
//     {
//         "country": "Italy",
//         "visits": 386,
//         "color": "#DDDDDD"
//     },
//     {
//         "country": "Australia",
//         "visits": 384,
//         "color": "#999999"
//     },
//     {
//         "country": "Taiwan",
//         "visits": 338,
//         "color": "#333333"
//     },
//     {
//         "country": "Poland",
//         "visits": 328,
//         "color": "#000000"
//     }
// ];


// AmCharts.ready(function() {
//     // SERIAL CHART
//     chart = new AmCharts.AmSerialChart();
//     chart.dataProvider = chartData;
//     chart.categoryField = "country";
//     // the following two lines makes chart 3D
//     chart.depth3D = 20;
//     chart.angle = 30;

//     // AXES
//     // category
//     var categoryAxis = chart.categoryAxis;
//     categoryAxis.labelRotation = 90;
//     categoryAxis.dashLength = 5;
//     categoryAxis.gridPosition = "start";

//     // value
//     var valueAxis = new AmCharts.ValueAxis();
//     valueAxis.title = "Visitors";
//     valueAxis.dashLength = 5;
//     chart.addValueAxis(valueAxis);

//     // GRAPH
//     var graph = new AmCharts.AmGraph();
//     graph.valueField = "visits";
//     graph.colorField = "color";
//     graph.balloonText = "<span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>";
//     graph.type = "column";
//     graph.lineAlpha = 0;
//     graph.fillAlphas = 1;
//     chart.addGraph(graph);

//     // CURSOR
//     var chartCursor = new AmCharts.ChartCursor();
//     chartCursor.cursorAlpha = 0;
//     chartCursor.zoomable = false;
//     chartCursor.categoryBalloonEnabled = false;
//     chart.addChartCursor(chartCursor);

//     chart.creditsPosition = "top-right";

//     // WRITE
//     chart.write("chartdiv");
// });

