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
			{ name: 'foto'},
			],
			url: '/productos/list',
			cache: true
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		var toThemeProperty = function(className) {
			return className + " " + className + "-" + theme;
		}
		var groupsrenderer = function(text, group, expanded, data) {
			if (data.subItems.length > 0) {
				var aggregate = this.getcolumnaggregateddata('id', ['sum'], true, data.subItems);
				var total = this.getcolumnaggregateddata('suma', ['sum'], true, data.subItems);
			}
			else {
				var rows = new Array();
				var getRows = function(group, rows) {
					if (group.subGroups.length > 0) {
						for (var i = 0; i < group.subGroups.length; i++) {
							getRows(group.subGroups[i], rows);
						}
					}
					else {
						for (var i = 0; i < group.subItems.length; i++) {
							rows.push(group.subItems[i]);
						}
					}
				}
				getRows(data, rows);
				var aggregate = this.getcolumnaggregateddata('id', ['sum'], true, rows);
				var total = this.getcolumnaggregateddata('suma', ['sum'], true, rows);
			}
			return '<div class="' + toThemeProperty('jqx-grid-groups-row') + '" style="position: absolute "><span style="margin: 5px 0 0 0;">' + text + ' (' + total.sum + ') , </span>' + '<span class="' + toThemeProperty('jqx-grid-groups-row-details') + '">' + "Cantidad Valores:<b>" + 1 + "</b>, Monto Bs: " + '<b>' + 1 + '</b>' + '</span></div>';
		}
		var barra = function(statusbar) {
		};


		$("#jqxgrid_p").jqxGrid({

			width: '100%',
			source: dataAdapter,
			sortable: true,
			altRows: true,
			showstatusbar: true,
			statusbarheight: 25,
			pagerMode: 'advanced',
			theme: 'custom',
			showfilterrow: true,
			filterable: true,
			scrollmode: 'deferred',
			renderstatusbar: barra,
			scrollfeedback: function (row)
			{
				return '<table style="height: 150px;"><tr><td><img src="' + row.foto + '"  height="90"/></td></tr><tr><td>' + row.producto + '</td></tr></table>';
			},
			rowsheight: 90,
			columns: [
			{text: 'Image', datafield: 'foto', width: 100, cellsrenderer: function (row, column, value) {
                            return '<img src="' + value + '" height="90"/>';
                        }
            },
			{ text: 'linea', datafield: 'linea', filtertype: 'input',width: '10%' },
			{ text: 'Estación', datafield: 'estacion', filtertype: 'input',width: '10%' },
			{ text: 'Grupo', datafield: 'grupo', filtertype: 'input',width: '10%' },
			{ text: 'Producto', datafield: 'producto', filtertype: 'input',width: '20%' },
			{ text: 'Codigo', datafield: 'codigo', filtertype: 'input',width: '5%' },
			{ text: 'Descripción', datafield: 'descripcion', filtertype: 'input',width: '25%' },
			{ text: 'Precio Unitario', datafield: 'precio_unitario', filtertype: 'input',width: '5%' },
			{ text: 'Cantidad', datafield: 'cantidad',filtertype: 'input', width: '5%' },
			{ text: 'Tiempo', datafield: 'tiempo',filtertype: 'input', width: '5%' },
			]
		});

		$("#jqxgrid_p").bind("filter", function(event) {
        var visibleRows = $('#jqxgrid').jqxGrid('getrows');
        var count = visibleRows.length;        
        $('#statusbarjqxgrid').html('Total: <b>' + count + '</b>');
    });
    $("#jqxgrid_p").bind("bindingcomplete", function(event) {
        var visibleRows = $('#jqxgrid').jqxGrid('getrows');
        var count = visibleRows.length;
        var total_venta = 0;
        var total = 0;
        $.each(visibleRows, function(i, e) {
            total += e.suma;
            
        });
        $('#statusbarjqxgrid').html('Total: <b>' + count + '</b>');
        $('#fecha').addClass('animated');
        $('#fecha').addClass('fadeIn');
    });

}

/*
Segundo Grid
 */

cargar2();	
	function cargar2(){	
		var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'linea',type: 'string'},
			{ name: 'estacion',type: 'string'},
			{ name: 'grupo',type: 'number'},
			{ name: 'producto',type: 'number'},
			{ name: 'precio_tiempo',type: 'string'},
			{ name: 'fecha_inicio'},
			{ name: 'fecha_fin'},
			{ name: 'total',type:'number'},
			],
			url: '/contratos/listcp',
			cache: false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		$("#jqxgrid_cp").jqxGrid({

			width: '100%',
			height:'250px',			
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
			{ text: 'Linea', datafield: 'linea', filtertype: 'filter',width: '13%' },
			{ text: 'Estación', datafield: 'Estacion', filtertype: 'input',width: '14%' },
			{ text: 'Producto', datafield: 'Producto', filtertype: 'input',width: '25%' },
			{ text: 'Precio / Tiempo', datafield: 'precio_tiempo', filtertype: 'input',width: '15%' },
			{ text: 'Fecha Inicio', datafield: 'fecha_inicio', filtertype: 'range', width: '10%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
	        { text: 'Fecha Finalización', datafield: 'fecha_fin', filtertype: 'range', width: '10%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
			{ text: 'Sub Total', datafield: 'total', filtertype: 'number',width: '10%' },
			]
		});
}

/*
adicionar 
*/
// $("#add").click(function(){
// 	$("#titulo").text("Adicionar Producto");
// 	$("#id").val("");
// 	$('#myModal').modal('show');
// });

/*
Añadir a Contrato
 */

$("#add_contrato").click(function() {
 	var rowindex = $('#jqxgrid_p').jqxGrid('getselectedrowindex');
 	if (rowindex > -1)
 	{
 		var dataRecord = $("#jqxgrid_p").jqxGrid('getrowdata', rowindex);
 		$("#id").val(dataRecord.id);
 		$("#titulo").text("Añadir a Contrato");

 		$("#estacion").val(dataRecord.estacion);
 		$("#grupo").val(dataRecord.grupo);
 		$("#producto").val(dataRecord.producto);
 		$("#cantidad").val(1);
 		$("#tiempo").val(dataRecord.tiempo);
 		$("#precio_unitario").val(dataRecord.precio_unitario);
 		$('#myModal').modal('show');
 	}
 	else
 	{
 		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un producto para agregar.");
 	}

 });

/*
Eliminar
 */
// $("#delete").click(function() {
//  	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
//  	if (rowindex > -1)
//  	{
//  		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
//  		//$("#id").val(dataRecord.id);
//  		bootbox.confirm("<strong>¡Mensaje!</strong> Esta seguro de eliminar el registro.", function(result) {
//                 if (result == true) {
//                     var v = $.ajax({
//                         url: '/productos/delete/',
//                         type: 'POST',
//                         datatype: 'json',
//                         data: {id: dataRecord.id},
//                         success: function(data) {
//                             cargar(); //alert('Guardado Correctamente'); 
//                             $("#divMsjeExito").show();
//                     		$("#divMsjeExito").addClass('alert alert-warning alert-dismissable');
//                     		$("#aMsjeExito").html(data); 
//                         }, //mostramos el error
//                         error: function() {
//                             alert('Se ha producido un error Inesperado');
//                         }
//                     });
//                 }
//             });
//  	}
//  	else
//  	{
//  		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un registro para eliminar.");
//  	}

//  });

// /*
// Select dependiente
// */

// $("#linea_id").change(function(){
// 	select_estacion($(this).val());
// });

// $("#tiempo").change(function(){
// 	$("#tiempo_text").text('('+$(this).val()+')');
// });

// function select_estacion(linea_id,estacion_id){
// 	$.post("/productos/select_estaciones/", { linea_id: linea_id }, function(data){
// 		$("#estacion_id").html(data);
// 		$("#estacion_id").val(estacion_id);
// 		}); 
// }


// $("#testForm").submit(function() {
// 	var v=$.ajax({
//             	url:'/productos/save/',
//             	type:'POST',
//             	datatype: 'json',
//             	data:{id:$("#id").val(),grupo_id:$("#grupo_id").val(),estacion_id:$("#estacion_id").val(),producto:$("#producto").val(),codigo:$("#codigo").val(),descripcion:$("#descripcion").val(),precio_unitario:$("#precio_unitario").val(),cantidad:$("#cantidad").val(),tiempo:$("#tiempo").val(),estacion_id:$("#estacion_id").val()},
// 				success: function(data) { cargar(); 
// 					$("#divMsjeExito").show();
//                     $("#divMsjeExito").addClass('alert alert-info alert-dismissable');
//                     $("#aMsjeExito").html(data); 
// 				}, //mostramos el error
// 			error: function() { alert('Se ha producido un error Inesperado'); }
// 			});
//             $('#myModal').modal('hide');
//             return false; // ajax used, block the normal submit
// });


})