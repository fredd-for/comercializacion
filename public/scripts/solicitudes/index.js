$(document).ready(function (){

cargar();
function cargar(){
	var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'razon_social_href',type: 'string'},
			{ name: 'razon_social',type: 'string'},
			{ name: 'nit',type: 'string'},
			{ name: 'telefono',type: 'number'},
			{ name: 'celular',type: 'number'},
			{ name: 'correo',type: 'string'},
			{ name: 'direccion',type: 'string'},
			{ name: 'representante_legal',type:'string'},
			{ name: 'ci_representante_legal',type:'string'},
			{ name: 'celular_representante_legal',type:'number'},
			{ name: 'correo_representante_legal',type:'string'},
			{ name: 'nombre_ref',type:'string'},
			{ name: 'ci_ref',type:'string'},
			{ name: 'celular_ref',type:'celular'},
			{ name: 'correo_ref',type:'string'},
			{ name: 'estado',type:'string'},
			{ name: 'foto'},
			],
			url: '/clientes/list',
			cache: false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);
		// var cellclass = function (row, columnfield, value) {
  //               if (value == 'Activo') {
  //                   return 'green';
  //               }else{
  //               	return 'red';
  //               }
  //       }

		$("#jqxgrid").jqxGrid({
			width: '100%',
			height: '450',
			source: dataAdapter,
			sortable: true,
			altRows: true,
			columnsresize: true,
			pageable: true,
			pagerMode: 'advanced',
			theme: 'custom',
			//scrollmode: 'deferred',
			// showstatusbar: true,
			showfilterrow: true,
			filterable: true,
			autorowheight: true,
			keyboardnavigation: false,
			scrollfeedback: function (row)
			{
				return '<table style="height: 80px;"><tr><td><img src="' + row.foto + '"  height="90"/></td></tr><tr><td>' + row.producto + '</td></tr></table>';
			},

			columns: [
			{text: 'Image', datafield: 'foto', width: 100, cellsrenderer: function (row, column, value) {
				return '<img style="margin-left: 5px;" height="70" width="100%" src="' + value + '" />';
				}
			},
			{ text: 'Razón Social', columngroup: 'cliente',datafield: 'razon_social_href', filtertype: 'input',width: '15%' },
			{ text: 'NIT', columngroup: 'cliente',datafield: 'nit', filtertype: 'input',width: '8%' },
			{ text: 'Telefono', columngroup: 'cliente',datafield: 'telefono', filtertype: 'input',width: '8%'},
			{ text: 'Celular', columngroup: 'cliente',datafield: 'celular', filtertype: 'input',width: '8%'},
			{ text: 'Correo', columngroup: 'cliente',datafield: 'correo', filtertype: 'input',width: '8%'},
			{ text: 'Dirección', columngroup: 'cliente',datafield: 'direccion', filtertype: 'input',width: '20%'},
			{ text: 'Estado', columngroup: 'cliente',datafield: 'estado', filtertype: 'input',width: '8%'},
			{ text: 'Representante Legal', columngroup: 'representante',datafield: 'representante_legal', filtertype: 'input',width: '10%'},
			{ text: 'Celular', columngroup: 'representante',datafield: 'celular_representante_legal',filtertype: 'input', width: '10%' },
			{ text: 'Correo', columngroup: 'representante',datafield: 'correo_representante_legal',filtertype: 'input', width: '10%'},
			{ text: 'Persona Contacto', columngroup: 'contacto',datafield: 'nombre_ref', filtertype: 'input',width: '10%'},
			{ text: 'Celular', columngroup: 'contacto',datafield: 'celular_ref',filtertype: 'input', width: '10%' },
			{ text: 'Correo', columngroup: 'contacto',datafield: 'correo_ref',filtertype: 'input', width: '10%' },
			],
			columngroups: [
			{ text: 'CLIENTE / EMPRESA', align: 'center', name: 'cliente' },
			{ text: 'REPRESENTANTE LEGAL', align: 'center', name: 'representante' },
			{ text: 'PERSONA DE CONTACTO', align: 'center', name: 'contacto' }
			]
		});


/*	Segunda Grilla*/
var dataFields = [
{ name: 'id', type: 'number' },
{ name: 'nro_solicitud', type: 'string' },
{ name: 'fecha_envio_solicitud', type: 'date' },
{ name: 'fecha_recepcion_solicitud', type: 'date' },
{ name: 'productos_solicitados', type: 'string' },
{ name: 'respuesta', type: 'string' },
{ name: 'fecha_envio_resp', type: 'date' },
{ name: 'fecha_recepcion_resp', type: 'date' },
{ name: 'descripcion_resp', type: 'string' },
{ name: 'cliente_id', type: 'number' },
];

var sourceSeg =
{
	datafields: dataFields,
	datatype: "json",
	url: '/solicitudes/list',
	async: false
};

var dataAdapter = new $.jqx.dataAdapter(sourceSeg);
dataAdapter.dataBind();

$("#jqxgrid").on('rowselect', function (event) {
	$("#text_cliente").text(event.args.row.razon_social);
	var id = event.args.row.id;
	var records = new Array();
	var length = dataAdapter.records.length;
	for (var i = 0; i < length; i++) {
		var record = dataAdapter.records[i];
		if (record.cliente_id == id) {
			records[records.length] = record;
		}
	}

	var dataSource = {
		datafields: dataFields,
		localdata: records
	}
	var adapter = new $.jqx.dataAdapter(dataSource);
    $("#jqxgrid_solicitudes").jqxGrid({ source: adapter });
});

$("#jqxgrid_solicitudes").jqxGrid({
	width: '100%',
	height: '300',
	source: dataAdapter,
	sortable: true,
	altRows: true,
	columnsresize: true,
	pageable: true,
	pagerMode: 'advanced',
	theme: 'custom',
	showfilterrow: true,
	// showstatusbar: true,
	showfilterrow: true,
	filterable: true,
	autorowheight: true,
	columns: [
	{
		text: '#', sortable: false, filterable: false, editable: false,
		groupable: false, draggable: false, resizable: false,
		datafield: '', columntype: 'number', width: '3%',
		cellsrenderer: function (row, column, value) {
			return "<div style='margin:4px;'>" + (value + 1) + "</div>";
		}
	},
	{ text: 'Nro Solicitud', datafield: 'nro_solicitud', filtertype: 'input',width: '10%' },
	{ text: 'Fecha Recepción Solicitud', datafield: 'fecha_recepcion_solicitud', filtertype: 'input',width: '10%' },
	{ text: 'Productos Solicitados', datafield: 'productos_solicitados', filtertype: 'input',width: '40%' },
	{ text: 'Respuesta', datafield: 'respuesta', filtertype: 'input',width: '10%' }
	]
});

}
		
/*
Crear nuevo contrato
 */
 $("#crear_solicitud").click(function(){
 	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
 	if (rowindex > -1)
 	{
 		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
 		$("#id").val(dataRecord.id);
 		$("#solicitud_id").val(0);
 		$("#titulo_solicitud").text("Crear Nueva Solicitud");
 		$("#rs").val(dataRecord.razon_social);
 		$("#rl").val(dataRecord.representante_legal);
 		$("#cliente_id").val(dataRecord.id);

 		$('#myModal_solicitud').modal('show');
 	}
 	else
 	{
 		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un registro para crear una solicitud.");
 	}
 });

 /*
 guardar solicitud
  */
  $("#testForm_solicitud").submit(function() {
  	var v=$.ajax({
  		url:'/solicitudes/save/',
  		type:'POST',
  		datatype: 'json',
  		data:{solicitud_id:$("#solicitud_id").val(),cliente_id:$("#cliente_id").val(),nro_solicitud:$("#nro_solicitud").val(),fecha_envio_solicitud:$("#fecha_envio_solicitud").val(),fecha_recepcion_solicitud:$("#fecha_recepcion_solicitud").val(),responsable_id:$("#responsable_id").val(),representante:$("#representante").val(),cargo_representante:$("#cargo_representante").val(),descripcion_solicitud:$("#descripcion_solicitud").val()},
  		success: function(data) { 
  				cargar();
  				$("#divMsjeExito").show();
  				$("#divMsjeExito").addClass('alert alert-info alert-dismissable');
  				$("#aMsjeExito").html('Guardado Correctamente'); 

				}, //mostramos el error
				error: function() { alert('Se ha producido un error Inesperado'); }
			});
  			$('#myModal_solicitud').modal('hide');
            return false;
    });


$("#fecha_envio_solicitud, #fecha_recepcion_solicitud").datepicker({
	autoclose:true,
});

})