    $(function () {
$('.tree').treegrid();

//  datosreloj();

// $("#gestion, #mes, #responsable_id, #recaudacion").change(function() {
//     datosreloj();
    
// });

// function datosreloj() {
//     var v = $.ajax({
//         url: '/dasboard/porcentajemetas/',
//         type: 'POST',
//         datatype: 'json',
//         data: {gestion: $("#gestion").val(),mes:$("#mes").val(),responsable_id:$("#responsable_id").val(),recaudacion:$("#recaudacion").val()},
//         success: function(data) {
//             var row = jQuery.parseJSON(data);
//             mensual(row.porcentajeAvanceMes);
//             acumulado(row.porcentajeAvanceAcumulado);
//             anual(row.porcentajeAvanceAnual);

//             $("#metaMes").text(row.metaMes);
//             $("#metaAcumulado").text(row.metaAcumulado);
//             $("#metaAnual").text(row.metaAnual);

//             $("#logroMes").text(row.logroMes);
//             $("#logroAcumulado").text(row.logroAcumulado);
//             $("#logroAnual").text(row.logroAnual);
            
//         }, 
//         error: function() {
//             alert('Se ha producido un error Inesperado');
//         }
//     });
// }

// $('#gaugeContainer1').jqxGauge({
//         ranges: [
//         { startValue: 0, endValue: 40, style: { fill: '#e02629', stroke: '#e02629' }, endWidth: 10, startWidth: 1 },
//         { startValue: 40, endValue: 80, style: { fill: '#fbd109', stroke: '#fbd109' }, endWidth: 15, startWidth: 10 },
//         { startValue: 80, endValue: 100, style: { fill: '#4bb648', stroke: '#4bb648' }, endWidth: 20, startWidth: 15 }
//         ],
//         ticksMinor: { interval: 5, size: '5%' },
//         ticksMajor: { interval: 10, size: '9%' },
//         value: 0,
//         colorScheme: 'scheme05',
//         animationDuration: 1200,
//         caption: { offset: [0, -25], value: 'Avance del Mes', position: 'bottom' }
//     });

//     $('#gaugeContainer1').on('valueChanging', function (e) {
//         var value = e.args.value.toFixed(1);
//         $('#gaugeValue1').text(value + ' % ');
//     });

//      // $('#gaugeContainer1').jqxGauge('border', { visible: false });

// function mensual(valor) {
//     $('#gaugeContainer1').jqxGauge('value', valor);    
// }

// $('#gaugeContainer2').jqxGauge({
//         ranges: [
//         { startValue: 0, endValue: 40, style: { fill: '#e02629', stroke: '#e02629' }, endWidth: 10, startWidth: 1 },
//         { startValue: 40, endValue: 80, style: { fill: '#fbd109', stroke: '#fbd109' }, endWidth: 15, startWidth: 10 },
//         { startValue: 80, endValue: 100, style: { fill: '#4bb648', stroke: '#4bb648' }, endWidth: 20, startWidth: 15 }
//         ],
//         ticksMinor: { interval: 5, size: '5%' },
//         ticksMajor: { interval: 10, size: '9%' },
//         value: 0,
//         // width: '40%',
//   //       height: '80%',
//         colorScheme: 'scheme05',
//         animationDuration: 1200,
//         caption: { offset: [0, -25], value: 'Avance Acumulado', position: 'bottom' }
//     });
//     $('#gaugeContainer2').on('valueChanging', function (e) {
//         var value = e.args.value.toFixed(1);
//         $('#gaugeValue2').text(value + ' %');
//     });

// function acumulado(valor) {
//     $('#gaugeContainer2').jqxGauge('value', valor);
// }

//     $('#gaugeContainer3').jqxGauge({
//         ranges: [
//         { startValue: 0, endValue: 40, style: { fill: '#e02629', stroke: '#e02629' }, endWidth: 10, startWidth: 1 },
//         { startValue: 40, endValue: 80, style: { fill: '#fbd109', stroke: '#fbd109' }, endWidth: 15, startWidth: 10 },
//         { startValue: 80, endValue: 100, style: { fill: '#4bb648', stroke: '#4bb648' }, endWidth: 20, startWidth: 15 }
//         ],
//         ticksMinor: { interval: 5, size: '5%' },
//         ticksMajor: { interval: 10, size: '9%' },
//         value: 0,
//         colorScheme: 'scheme05',
//         animationDuration: 1200,
//         caption: { offset: [0, -25], value: 'Avance Anual', position: 'bottom' }
//     });

//     $('#gaugeContainer3').on('valueChanging', function (e) {
//         var value = e.args.value.toFixed(1);
//         $('#gaugeValue3').text(value + ' %');
//     });
// function anual(valor) {
//     $('#gaugeContainer3').jqxGauge('value', valor);
// }

    





    
 // var source =
 //        {
 //            datatype: "json",
 //            datafields: [
 //            { name: 'id',type: 'number'},
 //            { name: 'razon_social_href',type: 'string'},
 //            { name: 'contrato',type: 'string'},
 //            { name: 'total',type: 'number'},
 //            { name: 'deposito',type: 'number'},
 //            { name: 'cobrar',type: 'number'},
 //            { name: 'mora',type: 'number'},
 //            { name: 'foto'},
 //            ],
 //            url: '/clientes/dashboard',
 //            cache: false
 //        };
 //        var dataAdapter = new $.jqx.dataAdapter(source);
        

 //        $("#jqxgrid").jqxGrid({
 //            width: '100%',
 //            height: '350',
 //            source: dataAdapter,
 //            sortable: true,
 //            altRows: true,
 //            columnsresize: true,
 //            pageable: true,
 //            pagerMode: 'advanced',
 //            theme: 'custom',
 //            //scrollmode: 'deferred',
 //            // showstatusbar: true,
 //            showfilterrow: true,
 //            filterable: true,
 //            autorowheight: true,
 //            keyboardnavigation: false,
 //            scrollfeedback: function (row)
 //            {
 //                return '<table style="height: 80px;"><tr><td><img src="' + row.foto + '"  height="90"/></td></tr><tr><td>' + row.producto + '</td></tr></table>';
 //            },
 //             ready: function () {
 //                    $("#jqxgrid").jqxGrid('sortby', 'total', 'desc');
 //                },
 //            columns: [
 //            {text: '#', datafield: 'foto', width: 80, cellsrenderer: function (row, column, value) {
 //                return '<img style="margin-left: 5px;" height="40" width="100%" src="' + value + '" />';
 //                }
 //            },
 //            { text: 'Razón Social', columngroup: 'cliente',datafield: 'razon_social_href', filtertype: 'input',width: '20%'},
 //            { text: 'Contrato', columngroup: 'cliente',datafield: 'contrato', filtertype: 'input',width: '10%'},
 //            { text: 'Total', columngroup: 'cliente',datafield: 'total', filtertype: 'number',width: '15%',cellsformat: "c2", cellsalign: 'right'},
 //            { text: 'Deposito', columngroup: 'cliente',datafield: 'deposito', filtertype: 'input',width: '15%',cellsformat: "c2", cellsalign: 'right'},
 //            { text: 'Por Cobrar', columngroup: 'cliente',datafield: 'cobrar', filtertype: 'input',width: '15%' ,cellsformat: "c2", cellsalign: 'right'},
 //            { text: 'Mora', columngroup: 'cliente',datafield: 'mora', filtertype: 'input',width: '15%',cellsformat: "c2", cellsalign: 'right'},
 //            ],
 //            columngroups: [
 //            { text: 'CLIENTES CON CONTRATOS CON MAYOR RECAUDACION', align: 'center', name: 'cliente' },
 //            ]
 //        });


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


    var options2 = {
        chart: {
            renderTo: 'container3',
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type:'pie'

        },
       title: {
            text: 'Recaudaciones en Bs. de Ene, 2015 a Dic, 2015'
        },
        subtitle: {
            text: 'Haga clic en las rebanadas para ver los clientes con mayor recaudación'
        },
        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.percentage:.2f}%</b> el total<br/>'
        },
        // plotOptions: {
        //     series: {
        //         dataLabels: {
        //             enabled: true,
        //             format: '{point.name}:<br> {point.y:.2f} Bs.'
        //         }
        //     }
        // },
         plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>:<br> {point.y:.1f} Bs.',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    },
                },
                point: {
                    events: {
                        click: function () {
                            // alert(this.x);
                            var responsable_id=this.x;
                            $("#titulo").text(this.name);
                         $.getJSON("/dasboard/container4/"+responsable_id, function(json) {
                            options3.series[0].data = json;
                            chart = new Highcharts.Chart(options3);
                        });
                         $('#myModal').modal('show');
                     }
                    }
                },
            }
        },

        series: [{
            type: 'pie',
            name: 'Contratos',
            data: [],
        }],


    }

    $.getJSON("/dasboard/container3", function(json) {
        options2.series[0].data = json;
        chart = new Highcharts.Chart(options2);
    });


    var options3 = {
        chart: {
            renderTo: 'container4',
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type:'pie'

        },
       title: {
            text: 'Monto del Contratos por Clientes. de Ene, 2015 a Dic, 2015'
        },
        // subtitle: {
        //     text: 'Haga clic en las rebanadas para ver los clientes con mayor recaudación'
        // },
        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.percentage:.2f}%</b> el total<br/>'
        },
        // plotOptions: {
        //     series: {
        //         dataLabels: {
        //             enabled: true,
        //             format: '{point.name}:<br> {point.y:.2f} Bs.'
        //         }
        //     }
        // },
         plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>:<br> {point.y:.1f} Bs.',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    },
                },
            }
        },

        series: [{
            type: 'pie',
            name: 'Cliente',
            data: [],
        }],


    }



});


