$(document).ready(function (){
	cargar();	
	function cargar(){	
		var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'solicitud_id',type: 'number'},
			{ name: 'cite',type: 'string'},
			{ name: 'nur',type: 'string'},
			],
			url: '/informes/list',
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
			// showstatusbar: true,
			showfilterrow: true,
			filterable: true,
			autorowheight: true,
			keyboardnavigation: false,
			columns: [
			{
				text: '#', sortable: false, filterable: false, editable: false,
				groupable: false, draggable: false, resizable: false,
				datafield: '', columntype: 'number', width: '3%',
				cellsrenderer: function (row, column, value) {
					return "<div style='margin:4px;'>" + (value + 1) + "</div>";
				}
			},
			{ text: 'Solicitud', datafield: 'solicitud_id', filtertype: 'input',width: '20%' },
			{ text: 'Cite', datafield: 'cite', filtertype: 'input',width: '20%' },
			{ text: 'Hoja de Ruta', datafield: 'nur', filtertype: 'input',width: '20%' },
			]
		});
}

/*
adicionar 
*/
$("#add").click(function(){
	$("#titulo").text("Adicionar Hoja de Ruta (Sistema de Gestión de Correspondencia)");
	$("#id").val("");
	$("#cite").val("");
	$("#nur").val("");
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
 		$("#titulo").text("Editar Hoja de Ruta (Sistema de Gestión de Correspondencia)");
 		$("#nur").val(dataRecord.nur);
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
 		bootbox.confirm("<strong>¡Mensaje!</strong> Esta seguro de eliminar el registro.", function(result) {
                if (result == true) {
                    var v = $.ajax({
                        url: '/informes/delete/',
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
$("#testForm").submit(function() {
	var v=$.ajax({
            	url:'/informes/save/',
            	type:'POST',
            	datatype: 'json',
            	data:{id:$("#id").val(),nur:$("#nur").val()},
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