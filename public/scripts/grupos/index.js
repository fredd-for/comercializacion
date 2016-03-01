$(document).ready(function (){
	cargar();	
	function cargar(){	
		var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'espacio_id',type: 'number'},
			{ name: 'espacio',type: 'string'},
			{ name: 'grupo',type: 'string'},
			{ name: 'sigla',type: 'string'},
			{ name: 'descripcion',type: 'string'},
			],
			url: '/grupos/list',
			cache: false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		$("#jqxgrid").jqxGrid({

			width: '100%',
            source: dataAdapter,                
            sortable: true,
            altRows: true,
            columnsresize: true,
            theme: 'custom',
            showfilterrow: true,
            filterable: true,
            autorowheight: true,
            pageable: true,
            pagerMode: 'advanced',
            groupable: true,
			columns: [
			{
				text: '#', sortable: false, filterable: false, editable: false,
				groupable: false, draggable: false, resizable: false,
				datafield: '', columntype: 'number', width: '3%',
				cellsrenderer: function (row, column, value) {
					return "<div style='margin:4px;'>" + (value + 1) + "</div>";
				}
			},
			{ text: 'Espacio', datafield: 'espacio', filtertype: 'input',width: '17%' },
			{ text: 'Grupo', datafield: 'grupo', filtertype: 'input',width: '20%' },
			{ text: 'Sigla', datafield: 'sigla', filtertype: 'input',width: '20%' },
			{ text: 'Descripción', datafield: 'descripcion', filtertype: 'input',width: '40%' }
			],
			groups: ['espacio']
		});
}


 $("#jqxgrid").jqxGrid('expandallgroups');

/*
adicionar 
*/
$("#add").click(function(){
	$("#titulo").text("Adicionar Grupo");
	$("#id").val("");
	$("#espacio_id").val("");
	$("#grupo").val("");
	$("#sigla").val("");
	$("#descripcion").val("");
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
 		$("#titulo").text("Editar Grupo");
 		$("#espacio_id").val(dataRecord.espacio_id);
 		$("#grupo").val(dataRecord.grupo);
 		$("#sigla").val(dataRecord.sigla);
 		$("#descripcion").val(dataRecord.descripcion);
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
                        url: '/grupos/delete/',
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
            	url:'/grupos/save/',
            	type:'POST',
            	datatype: 'json',
            	data:{id:$("#id").val(),grupo:$("#grupo").val(),sigla:$("#sigla").val(),descripcion:$("#descripcion").val(),espacio_id:$("#espacio_id").val()},
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