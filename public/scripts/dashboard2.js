
$(document).ready(function (){

/*
meta por meses
 */
    var v=$.ajax({
        url:'/dashboard2/metaMesAgrupado/',
        type:'POST',
        datatype: 'json',
        data:{gestion:$("#gestion").val(),responsable_id:$("#responsable_id").val()},
        success: function(data) { 
           data = $.parseJSON(data);
           $.each(data, function (i,v)
           {
            $("#mes_"+v.mes).val(v.meta);
            });

                }, //mostramos el error
                error: function() { alert('Se ha producido un error Inesperado'); }
            });
    
contratosAsegurados();

function contratosAsegurados() {
    var responsable_id = $("#responsable_id").val();
    var gestion = $("#gestion").val();
    var recaudacion = $("#recaudacion").val();
    var source =
    {
        datatype: "json",
        datafields: [
        { name: 'id',type: 'number'},
        { name: 'contrato',type: 'string'},
        { name: 'enero',type: 'number'},
        { name: 'febrero',type: 'number'},
        { name: 'marzo',type: 'number'},
        { name: 'abril',type: 'number'},
        { name: 'mayo',type: 'number'},
        { name: 'junio',type: 'number'},
        { name: 'julio',type: 'number'},
        { name: 'agosto',type: 'number'},
        { name: 'septiembre',type: 'number'},
        { name: 'octubre',type: 'number'},
        { name: 'noviembre',type: 'number'},
        { name: 'diciembre',type: 'number'},
        { name: 'total_contrato',type: 'number'},
        { name: 'estado',type: 'number'},
        ],
        url: '/dashboard2/alquilerAsegurado/'+responsable_id+'/'+gestion+'/'+recaudacion,
        cache: false
    };
    var dataAdapter = new $.jqx.dataAdapter(source);

    $("#jqxgrid").jqxGrid({

        width: '100%',
        source: dataAdapter,
        sortable: true,
        altRows: true,
        columnsresize: true,
        // pageable: true,
        // pagerMode: 'advanced',
        theme: 'custom',
            //scrollmode: 'deferred',
            showstatusbar: true,
            showfilterrow: true,
            filterable: true,
            // autorowheight: true,
            // keyboardnavigation: false,
            statusbarheight: 25,
            showaggregates: true,
            columns: [
            {
                text: '#', sortable: false, filterable: false, editable: false,
                groupable: false, draggable: false, resizable: false,
                datafield: '', columntype: 'number', width: '3%',
                pinned: true,
                cellsrenderer: function (row, column, value) {
                    return "<div style='margin:4px;'>" + (value + 1) + "</div>";
                }
            },
            // { text: 'Contrato', datafield: 'contrato', filtertype: 'input',width: '12%' },
            { text: 'Contrato', datafield: 'contrato', filtertype: 'input',width: '12%',pinned: true,aggregates: ['Meta'],
                      aggregatesrenderer: function (aggregates) {
                          var renderstring = "";
                          renderstring = '<div style="position: relative; margin: 4px; overflow: hidden;"><b>Total Recaudado</b></div>';
                          return renderstring;
            }},
            { text: 'Enero', datafield: 'enero', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['enero'];
                    return total;
                }
                }]
            },

            { text: 'Febrero', datafield: 'febrero', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['febrero'];
                    return total;
                }
                }]
            },
            { text: 'Marzo', datafield: 'marzo', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['marzo'];
                    return total;
                }
                }]
            },
            { text: 'Abril', datafield: 'abril', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['abril'];
                    return total;
                }
                }]
            },
            { text: 'Mayo', datafield: 'mayo', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['mayo'];
                    return total;
                }
                }]
            },
            { text: 'Junio', datafield: 'junio', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['junio'];
                    return total;
                }
                }]
            },
            { text: 'Julio', datafield: 'julio', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['julio'];
                    return total;
                }
                }]
            },
            { text: 'Agosto', datafield: 'agosto', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['agosto'];
                    return total;
                }
                }]
            },
            { text: 'Septiembre', datafield: 'septiembre', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['septiembre'];
                    return total;
                }
                }]
            },
            { text: 'Octubre', datafield: 'octubre', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['octubre'];
                    return total;
                }
                }]
            },
            { text: 'Noviembre', datafield: 'noviembre', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['noviembre'];
                    return total;
                }
                }]
            },
            { text: 'Diciembre', datafield: 'diciembre', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['diciembre'];
                    return total;
                }
                }]
            },
            { text: 'Total Deposito', datafield: 'total_contrato', filtertype: 'number',width: '12%', cellsformat: 'c2',cellsalign: 'right',align:'right',
                aggregates: [{ '<b>Bs.</b>': 
                function (aggregatedValue, currentValue, column, record) {
                    var total = aggregatedValue + record['total_contrato'];
                    return total;
                }
                }]
            },
            // { text: 'Estado', datafield: 'estado', filtertype: 'input',width: '12%' },
            ]
        });
}
// $(function () {
    


    /*
    grid 2 contratos nuevos
     */
contratosNuevos();

function contratosNuevos() {

var responsable_id = $("#responsable_id").val();
var gestion = $("#gestion").val();
var recaudacion = $("#recaudacion").val();
// alert(recaudacion);

    var source2 =
    {
        datatype: "json",
        datafields: [
        { name: 'id',type: 'number'},
        { name: 'contrato',type: 'string'},
        { name: 'enero',type: 'number'},
        { name: 'febrero',type: 'number'},
        { name: 'marzo',type: 'number'},
        { name: 'abril',type: 'number'},
        { name: 'mayo',type: 'number'},
        { name: 'junio',type: 'number'},
        { name: 'julio',type: 'number'},
        { name: 'agosto',type: 'number'},
        { name: 'septiembre',type: 'number'},
        { name: 'octubre',type: 'number'},
        { name: 'noviembre',type: 'number'},
        { name: 'diciembre',type: 'number'},
        { name: 'total_contrato',type: 'number'},
        { name: 'estado',type: 'number'},
        ],
        url: '/dashboard2/alquilerContratosNuevos/'+responsable_id+'/'+gestion+'/'+recaudacion,
        cache: false
    };
    var dataAdapter2 = new $.jqx.dataAdapter(source2);

    $("#jqxgrid2").jqxGrid({

        width: '100%',
        height: '250px',
        source: dataAdapter2,
        sortable: true,
        altRows: true,
        columnsresize: true,
        // pageable: true,
        // pagerMode: 'advanced',
        theme: 'custom',
            //scrollmode: 'deferred',
            showstatusbar: true,
            showfilterrow: true,
            filterable: true,
            // autorowheight: true,
            // keyboardnavigation: false,
            statusbarheight: 50,
            showaggregates: true,
            columns: [
            {
                text: '#', sortable: false, filterable: false, editable: false,
                groupable: false, draggable: false, resizable: false,
                datafield: '', columntype: 'number', width: '3%',
                pinned: true,
                cellsrenderer: function (row, column, value) {
                    return "<div style='margin:4px;'>" + (value + 1) + "</div>";
                }
            },
            { text: 'Contrato', datafield: 'contrato', filtertype: 'input',width: '12%',pinned: true,aggregates: ['Logro', 'Meta'],
                      aggregatesrenderer: function (aggregates) {
                          var renderstring = "";
                          renderstring = '<div style="position: relative; margin: 4px; overflow: hidden;"><b>Logro</b></div>';
                          renderstring += '<div style="position: relative; margin: 4px; overflow: hidden;"><b>Meta</b></div>';
                          return renderstring;
                      }},
            { text: 'Enero', datafield: 'enero', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['enero'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_1").val();
                          }
                      }]
            },
            { text: 'Febrero', datafield: 'febrero', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['febrero'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_2").val();
                          }
                      }]
            },

            { text: 'Marzo', datafield: 'marzo', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['marzo'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_3").val();
                          }
                      }]
            },
            { text: 'Abril', datafield: 'abril', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['abril'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_4").val();
                          }
                      }]
            },
            { text: 'Mayo', datafield: 'mayo', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['mayo'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_5").val();
                          }
                      }]
            },
            { text: 'Junio', datafield: 'junio', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['junio'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_6").val();
                          }
                      }]
            },
            { text: 'Julio', datafield: 'julio', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['julio'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_7").val();
                          }
                      }]
            },
            { text: 'Agosto', datafield: 'agosto', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['agosto'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_8").val();
                          }
                      }]
            },
            { text: 'Septiembre', datafield: 'septiembre', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['septiembre'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_9").val();
                          }
                      }]
            },
            { text: 'Octubre', datafield: 'octubre', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['octubre'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_10").val();
                          }
                      }]
            },
            { text: 'Noviembre', datafield: 'noviembre', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['noviembre'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_11").val();
                          }
                      }]
            },
            { text: 'Diciembre', datafield: 'diciembre', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['diciembre'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_12").val();
                          }
                      }]
            },
             { text: 'Total Deposito', datafield: 'total_contrato', filtertype: 'number', width: '12%',cellsformat: "c2", cellsalign: 'right',aggregates: [{ '<b>Bs</b>':
                          function (aggregatedValue, currentValue, column, record) {
                                var total = aggregatedValue + record['total_contrato'];
                                return total;
                            }
                      },
                      { '<strong>Bs</strong>':
                          function () {
                              return $("#mes_total").val();
                          }
                      }]
            },
            // { text: 'Estado', datafield: 'estado', filtertype: 'input',width: '12%' },
            ]
        });
}
 

    /*
    end grid2 contratos nuevos
     */

datosreloj();
$(".text_gestion").text($("#gestion").val());

$("#gestion, #mes, #responsable_id, #recaudacion").change(function() {
    
    $(".text_gestion").text($("#gestion").val());
    obtenerimagen();
    datosreloj();
    contratosNuevos();
    contratosAsegurados();
});

obtenerimagen();
function obtenerimagen() {
    var responsable_id = $("#responsable_id").val();
    if (responsable_id==0) {
    $("#imagen_responsable").attr("src","/images/logo.png");    
    $("#text_responsable").text("Equipo Comercial");
}else{
    var v = $.ajax({
        url: '/dashboard2/obtenerimagen/',
        type: 'POST',
        datatype: 'json',
        data: {responsable_id:responsable_id},
        success: function(data) {
            // alert(data);
           var row = jQuery.parseJSON(data);
           // alert(row1.responsable);
           $("#imagen_responsable").attr("src",row.imagen);          
           $("#text_responsable").text(row.responsable);
        }, 
        error: function() {
            alert('Se ha producido un error Inesperado');
        }
    });
}
    
}

function datosreloj() {
    var v = $.ajax({
        url: '/dashboard2/porcentajemetas/',
        type: 'POST',
        datatype: 'json',
        data: {gestion: $("#gestion").val(),mes:$("#mes").val(),responsable_id:$("#responsable_id").val(),recaudacion:$("#recaudacion").val()},
        success: function(data) {
            var row = jQuery.parseJSON(data);
            mensual(row.porcentajeAvanceMes);
            acumulado(row.porcentajeAvanceAcumulado);
            anual(row.porcentajeAvanceAnual);

            $("#metaMes").text(row.metaMes);
            $("#metaAcumulado").text(row.metaAcumulado);
            $("#metaAnual").text(row.metaAnual);

            $("#logroMes").text(row.logroMes);
            $("#logroAcumulado").text(row.logroAcumulado);
            $("#logroAnual").text(row.logroAnual);
            
        }, 
        error: function() {
            alert('Se ha producido un error Inesperado');
        }
    });
}

$('#gaugeContainer1').jqxGauge({
        ranges: [
        { startValue: 0, endValue: 40, style: { fill: '#e02629', stroke: '#e02629' }, endWidth: 10, startWidth: 1 },
        { startValue: 40, endValue: 80, style: { fill: '#fbd109', stroke: '#fbd109' }, endWidth: 15, startWidth: 10 },
        { startValue: 80, endValue: 100, style: { fill: '#4bb648', stroke: '#4bb648' }, endWidth: 20, startWidth: 15 }
        ],
        ticksMinor: { interval: 5, size: '5%' },
        ticksMajor: { interval: 10, size: '9%' },
        value: 0,
        colorScheme: 'scheme05',
        animationDuration: 1200,
        caption: { offset: [0, -25], value: 'Avance del Mes', position: 'bottom' }
    });

    $('#gaugeContainer1').on('valueChanging', function (e) {
        var value = e.args.value.toFixed(1);
        $('#gaugeValue1').text(value + ' % ');
    });

     // $('#gaugeContainer1').jqxGauge('border', { visible: false });

function mensual(valor) {
    $('#gaugeContainer1').jqxGauge('value', valor);    
}

$('#gaugeContainer2').jqxGauge({
        ranges: [
        { startValue: 0, endValue: 40, style: { fill: '#e02629', stroke: '#e02629' }, endWidth: 10, startWidth: 1 },
        { startValue: 40, endValue: 80, style: { fill: '#fbd109', stroke: '#fbd109' }, endWidth: 15, startWidth: 10 },
        { startValue: 80, endValue: 100, style: { fill: '#4bb648', stroke: '#4bb648' }, endWidth: 20, startWidth: 15 }
        ],
        ticksMinor: { interval: 5, size: '5%' },
        ticksMajor: { interval: 10, size: '9%' },
        value: 0,
        // width: '40%',
  //       height: '80%',
        colorScheme: 'scheme05',
        animationDuration: 1200,
        caption: { offset: [0, -25], value: 'Avance Acumulado', position: 'bottom' }
    });
    $('#gaugeContainer2').on('valueChanging', function (e) {
        var value = e.args.value.toFixed(1);
        $('#gaugeValue2').text(value + ' %');
    });

function acumulado(valor) {
    $('#gaugeContainer2').jqxGauge('value', valor);
}

    $('#gaugeContainer3').jqxGauge({
        ranges: [
        { startValue: 0, endValue: 40, style: { fill: '#e02629', stroke: '#e02629' }, endWidth: 10, startWidth: 1 },
        { startValue: 40, endValue: 80, style: { fill: '#fbd109', stroke: '#fbd109' }, endWidth: 15, startWidth: 10 },
        { startValue: 80, endValue: 100, style: { fill: '#4bb648', stroke: '#4bb648' }, endWidth: 20, startWidth: 15 }
        ],
        ticksMinor: { interval: 5, size: '5%' },
        ticksMajor: { interval: 10, size: '9%' },
        value: 0,
        colorScheme: 'scheme05',
        animationDuration: 1200,
        caption: { offset: [0, -25], value: 'Avance Anual', position: 'bottom' }
    });

    $('#gaugeContainer3').on('valueChanging', function (e) {
        var value = e.args.value.toFixed(1);
        $('#gaugeValue3').text(value + ' %');
    });
function anual(valor) {
    $('#gaugeContainer3').jqxGauge('value', valor);
}

});


