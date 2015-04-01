$(document).ready(function (){
	cargar();	
	function cargar(){	
		var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'grupo_id',type: 'number'},
			{ name: 'grupo',type: 'string'},
			{ name: 'estacion_id',type: 'number'},
			{ name: 'estacion',type: 'string'},
			{ name: 'linea_id',type: 'number'},
			{ name: 'linea',type: 'string'},
			{ name: 'producto',type:'string'},
			{ name: 'codigo',type:'string'},
			{ name: 'descripcion',type:'string'},
			{ name: 'precio_unitario',type:'number'},
			{ name: 'cantidad',type:'number'},
			{ name: 'tiempo',type:'string'},
			],
			url: '/productos/list',
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
			{ text: 'linea', datafield: 'linea', filtertype: 'input',width: '10%' },
			{ text: 'Estación', datafield: 'estacion', filtertype: 'input',width: '10%' },
			{ text: 'Grupo', datafield: 'grupo', filtertype: 'input',width: '10%' },
			{ text: 'Producto', datafield: 'producto', filtertype: 'input',width: '20%' },
			{ text: 'Codigo', datafield: 'codigo', filtertype: 'input',width: '5%' },
			{ text: 'Descripción', datafield: 'descripcion', filtertype: 'input',width: '25%' },
			{ text: 'Precio Unitario', datafield: 'precio_unitario', filtertype: 'input',width: '7%' },
			{ text: 'Cantidad', datafield: 'uso_string',filtertype: 'input', width: '5%' },
			{ text: 'Tiempo', datafield: 'tiempo',filtertype: 'input', width: '5%' },
			]
		});

}

/*
adicionar 
*/
$("#add").click(function(){
	$("#titulo").text("Adicionar Producto");
	$("#id").val("");
	$('#myModal').modal('show');
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
 		$("#titulo").text("Editar Producto");

 		$("#grupo_id").val(dataRecord.grupo_id);
 		$("#linea_id").val(dataRecord.linea_id);
 		$("#producto").val(dataRecord.producto);
 		$("#codigo").val(dataRecord.codigo);
 		$("#descripcion").val(dataRecord.descripcion);
 		$("#precio_unitario").val(dataRecord.precio_unitario);
 		$("#cantidad").val(dataRecord.cantidad);
 		$("#tiempo").val(dataRecord.tiempo);
 		select_estacion(dataRecord.linea_id,dataRecord.estacion_id);
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
                        url: '/productos/delete/',
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
Select dependiente
*/

$("#linea_id").change(function(){
	select_estacion($(this).val());
});

$("#tiempo").change(function(){
	$("#tiempo_text").text('('+$(this).val()+')');
});

function select_estacion(linea_id,estacion_id){
	$.post("/productos/select_estaciones/", { linea_id: linea_id }, function(data){
		$("#estacion_id").html(data);
		$("#estacion_id").val(estacion_id);
		}); 
}


$("#testForm").submit(function() {
	var v=$.ajax({
            	url:'/productos/save/',
            	type:'POST',
            	datatype: 'json',
            	data:{id:$("#id").val(),grupo_id:$("#grupo_id").val(),estacion_id:$("#estacion_id").val(),producto:$("#producto").val(),codigo:$("#codigo").val(),descripcion:$("#descripcion").val(),precio_unitario:$("#precio_unitario").val(),cantidad:$("#cantidad").val(),tiempo:$("#tiempo").val(),estacion_id:$("#estacion_id").val()},
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