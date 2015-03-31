$(document).ready(function (){
	cargar();	
	function cargar(){	
		var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
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
			],
			url: '/clientes/list',
			cache: false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		$("#jqxgrid").jqxGrid({

			width: '100%',
			source: dataAdapter,
			sortable: true,
			altRows: true,
			columnsresize: true,
			pageable: true,
			pagerMode: 'advanced',
			theme: 'custom',
			//scrollmode: 'deferred',
			showstatusbar: true,
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
			{ text: 'Razón Social', columngroup: 'cliente',datafield: 'razon_social', filtertype: 'input',width: '15%' },
			{ text: 'NIT', columngroup: 'cliente',datafield: 'nit', filtertype: 'input',width: '8%' },
			{ text: 'Telefono', columngroup: 'cliente',datafield: 'telefono', filtertype: 'input',width: '8%' },
			{ text: 'Celular', columngroup: 'cliente',datafield: 'celular', filtertype: 'input',width: '8%' },
			{ text: 'Correo', columngroup: 'cliente',datafield: 'correo', filtertype: 'input',width: '8%' },
			{ text: 'Dirección', columngroup: 'cliente',datafield: 'direccion', filtertype: 'input',width: '20%' },
			{ text: 'Representante Legal', columngroup: 'representante',datafield: 'representante_legal', filtertype: 'input',width: '10%' },
			{ text: 'Celular', columngroup: 'representante',datafield: 'celular_representante_legal',filtertype: 'input', width: '10%' },
			{ text: 'Correo', columngroup: 'representante',datafield: 'correo_representante_legal',filtertype: 'input', width: '10%' },
			{ text: 'Persona Contacto', columngroup: 'contacto',datafield: 'nombre_ref', filtertype: 'input',width: '10%' },
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
guardar 
 */
$("#wizard").submit(function() {
	var v=$.ajax({
            	url:'/clientes/save/',
            	type:'POST',
            	datatype: 'json',
            	data:{id:$("#id").val(),razon_social:$("#razon_social").val(),nit:$("#nit").val(),telefono:$("#telefono").val(),celular:$("#celular").val(),correo:$("#correo").val(),direccion:$("#direccion").val(),representante_legal:$("#representante_legal").val(),ci_representante_legal:$("#ci_representante_legal").val(),celular_representante_legal:$("#celular_representante_legal").val(),correo_representante_legal:$("#correo_representante_legal").val(),nombre_ref:$("#nombre_ref").val(),ci_ref:$("#ci_ref").val(),celular_ref:$("#celular_ref").val(),correo_ref:$("#correo_ref").val()},
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