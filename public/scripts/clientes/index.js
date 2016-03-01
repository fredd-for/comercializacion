$(document).ready(function (){

cargar();
function cargar(){
	var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'empresa',type: 'string'},
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
			// {
			// 	text: '#', sortable: false, filterable: false, editable: false,
			// 	groupable: false, draggable: false, resizable: false,
			// 	datafield: '', columntype: 'number', width: '3%',
			// 	cellsrenderer: function (row, column, value) {
			// 		return "<div style='margin:4px;'>" + (value + 1) + "</div>";
			// 	}
			// },
			{text: 'Image', datafield: 'foto', width: 100, cellsrenderer: function (row, column, value) {
				return '<img style="margin-left: 5px;" height="70" width="100%" src="' + value + '" />';
				}
			},
			{ text: 'Empresa', columngroup: 'cliente',datafield: 'empresa', filtertype: 'input',width: '10%' },
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

}
		
/*
adicionar 
*/
$("#add").click(function(){
	$("#titulo").text("Adicionar Cliente");
	$("#id").val("");

	$("#empresa").val("");
	$("#razon_social").val("");
	$("#nit").val("");
	$("#telefono").val("");
	$("#celular").val("");
	$("#correo").val("");
	$("#direccion").val("");
	$("#representante_legal").val("");
	$("#ci_representante_legal").val();
	$("#celular_representante_legal").val("");
	$("#correo_representante_legal").val("");
	$("#nombre_ref").val("");
	$("#ci_ref").val("");
	$("#celular_ref").val("");
	$("#correo_ref").val("");

	$('#myModal').modal('show');
});

/*
Ver
 */

 $("#view").click(function() {
 	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
 	if (rowindex > -1)
 	{
 		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
 		window.location.href = 'clientes/view/'+dataRecord.id;
 	}
 	else
 	{
 		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un registro para ver.");
 	}

 });


/*
Editar
 */

 $("#edit").click(function() {
 	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
 	if (rowindex > -1)
 	{
 		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
 		$("#id").val(dataRecord.id);
 		$("#titulo").text("Editar Cliente");

 		$("#empresa").val(dataRecord.empresa);
 		$("#razon_social").val(dataRecord.razon_social);
 		$("#nit").val(dataRecord.nit);
 		$("#telefono").val(dataRecord.telefono);
 		$("#celular").val(dataRecord.celular);
 		$("#correo").val(dataRecord.correo);
 		$("#direccion").val(dataRecord.direccion);
 		$("#representante_legal").val(dataRecord.representante_legal);
 		$("#ci_representante_legal").val(dataRecord.ci_representante_legal);
 		$("#celular_representante_legal").val(dataRecord.celular_representante_legal);
 		$("#correo_representante_legal").val(dataRecord.correo_representante_legal);
 		$("#nombre_ref").val(dataRecord.nombre_ref);
 		$("#ci_ref").val(dataRecord.ci_ref);
 		$("#celular_ref").val(dataRecord.celular_ref);
 		$("#correo_ref").val(dataRecord.correo_ref);

 		$('#myModal').modal('show');
 	}
 	else
 	{
 		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un registro para editar.");
 	}

 });

/*
Eliminar
 */
$("#delete").click(function() {
 	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
 	if (rowindex > -1)
 	{
 		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
 		//$("#id").val(dataRecord.id);
 		bootbox.confirm("<strong>¡Mensaje!</strong> Esta seguro de eliminar el registro.", function(result) {
                if (result == true) {
                    var v = $.ajax({
                        url: '/clientes/delete/',
                        type: 'POST',
                        datatype: 'json',
                        data: {id: dataRecord.id},
                        success: function(data) {
                            cargar(); //alert('Guardado Correctamente'); 
                            $("#divMsjeExito").show();
                    		$("#divMsjeExito").addClass('alert alert-warning alert-dismissable');
                    		$("#aMsjeExito").html(data); 
                        }, //mostramos el error
                        error: function() {
                            alert('Se ha producido un error Inesperado');
                        }
                    });
                }
            });
 	}
 	else
 	{
 		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un registro para eliminar.");
 	}

 });

/*
guardar 
 */
$("#wizard").submit(function() {
	var v=$.ajax({
            	url:'/clientes/save/',
            	type:'POST',
            	datatype: 'json',
            	data:{id:$("#id").val(),empresa:$("#empresa").val(),razon_social:$("#razon_social").val(),nit:$("#nit").val(),telefono:$("#telefono").val(),celular:$("#celular").val(),correo:$("#correo").val(),direccion:$("#direccion").val(),representante_legal:$("#representante_legal").val(),ci_representante_legal:$("#ci_representante_legal").val(),celular_representante_legal:$("#celular_representante_legal").val(),correo_representante_legal:$("#correo_representante_legal").val(),nombre_ref:$("#nombre_ref").val(),ci_ref:$("#ci_ref").val(),celular_ref:$("#celular_ref").val(),correo_ref:$("#correo_ref").val()},
				success: function(data) { cargar(); 
					$("#divMsjeExito").show();
                    $("#divMsjeExito").addClass('alert alert-info alert-dismissable');
                    $("#aMsjeExito").html(data); 
				}, //mostramos el error
			error: function() { alert('Se ha producido un error Inesperado'); }
			});
            $('#myModal').modal('hide');
            return false; // ajax used, block the normal submit
});




})