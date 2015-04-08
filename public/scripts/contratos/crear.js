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
			cache: false
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


		$("#jqxgrid").jqxGrid({

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

		$("#jqxgrid").bind("filter", function(event) {
        var visibleRows = $('#jqxgrid').jqxGrid('getrows');
        var count = visibleRows.length;        
        $('#statusbarjqxgrid').html('Total: <b>' + count + '</b>');
    });
    $("#jqxgrid").bind("bindingcomplete", function(event) {
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
			{ name: 'grupo',type: 'string'},
			{ name: 'producto',type: 'string'},
			{ name: 'precio_tiempo',type: 'string'},
			{ name: 'fecha_inicio',type:'date'},
			{ name: 'fecha_fin',type:'date'},
			{ name: 'precio_unitario',type:'number'},
			{ name: 'tiempo',type:'string'},
			{ name: 'cantidad',type:'number'},
			{ name: 'total',type:'number'},
			],
			url: '/contratos/listcp/'+$("#contrato_id").val(),
			cache: false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		$("#jqxgrid_cp").jqxGrid({

			width: '100%',
			height:'200px',
            source: dataAdapter,                
            sortable: true,
            altrows: true,
            columnsresize: true,
            theme: 'custom',
            showstatusbar: true,
            showfilterrow: true,
            filterable: true,
            // autorowheight: true,
            // pageable: true,
            pagerMode: 'advanced',
            
            statusbarheight: 25,
            showaggregates: true,

			columns: [
			{
				text: '#', sortable: false, filterable: false, editable: false,
				groupable: false, draggable: false, resizable: false,
				datafield: '', columntype: 'number', width: '3%',
				cellsrenderer: function (row, column, value) {
					return "<div style='margin:4px;'>" + (value + 1) + "</div>";
				}
			},
			{ text: 'Linea', datafield: 'linea', filtertype: 'filter',width: '10%' },
			{ text: 'Estación', datafield: 'estacion', filtertype: 'input',width: '17%' },
			{ text: 'Producto', datafield: 'producto', filtertype: 'input',width: '25%' },
			{ text: 'Precio Bs. / Tiempo', datafield: 'precio_tiempo', filtertype: 'input',width: '15%' },
			{ text: 'Fecha Inicio', datafield: 'fecha_inicio', filtertype: 'range', width: '10%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy HH:mm', align:'center'},
	        { text: 'Fecha Finalización', datafield: 'fecha_fin', filtertype: 'range', width: '10%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy HH:mm', align:'center'},
			//{ text: 'Sub Total', datafield: 'total', filtertype: 'number',width: '10%' },
			{ text: 'Sub Total', datafield: 'total', cellsalign: 'right', cellsformat: 'c2', aggregates: ['sum', 'avg'] },
			]
		});
}

/*
Añadir a Contrato
 */

$("#add_contrato").click(function() {
 	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
 	if (rowindex > -1)
 	{
 		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
 		if (dataRecord.cantidad>0) {
 			$("#producto_id").val(dataRecord.id);
 			$("#titulo").text("Añadir Producto al Contrato");

 			$("#estacion").val(dataRecord.estacion);
 			$("#grupo").val(dataRecord.grupo);
 			$("#producto").val(dataRecord.producto);
 			$("#cantidad").val(1);
 			$("#tiempo").val(dataRecord.tiempo);
 			$("#precio_unitario").val(dataRecord.precio_unitario);
 			$("#tiempo_text").text('('+dataRecord.tiempo+')');
 			$('#myModal').modal('show');
 		}else{
 			bootbox.alert("<strong>¡Mensaje!</strong> El producto ya fue alquilado.");		
 		}
 		
 	}
 	else
 	{
 		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un producto para agregar.");
 	}

 });

$("#edit_cp").click(function(){
	var rowindex = $('#jqxgrid_cp').jqxGrid('getselectedrowindex');
 	if (rowindex > -1)
 	{
 		var dataRecord = $("#jqxgrid_cp").jqxGrid('getrowdata', rowindex);
 			$("#cp_id").val(dataRecord.id);
 			$("#titulo").text("Editar Producto del Contrato");
 			// alert(dataRecord.tiempo);
 			$("#estacion").val(dataRecord.estacion);
 			$("#grupo").val(dataRecord.grupo);
 			$("#producto").val(dataRecord.producto);
 			$("#cantidad").val(dataRecord.cantidad);
 			$("#tiempo").val(dataRecord.tiempo);
 			$("#precio_unitario").val(dataRecord.precio_unitario);
 			$("#tiempo_text").text('('+dataRecord.tiempo+')');
 			$("#total").val(dataRecord.total);
 			var fe = $.jqx.dataFormat.formatdate(dataRecord.fecha_inicio, 'dd-MM-yyyy');
            var fa = $.jqx.dataFormat.formatdate(dataRecord.fecha_fin, 'dd-MM-yyyy');
            $("#fecha_inicio").val(fe);
            $("#fecha_fin").val(fa);

            var fe = $.jqx.dataFormat.formatdate(dataRecord.fecha_inicio, 'HH:mm');
            var fa = $.jqx.dataFormat.formatdate(dataRecord.fecha_fin, 'HH:mm');
            $("#hora_inicio").val(fe);
            $("#hora_fin").val(fa);

 			$('#myModal').modal('show');
 		
 	}
 	else
 	{
 		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un producto para agregar.");
 	}
});

$("#cantidad").blur(function(){
	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
	var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
	if ($(this).val()>dataRecord.cantidad){
		bootbox.alert("<strong>¡Mensaje!</strong> "+dataRecord.producto+ " disponibles solo "+dataRecord.cantidad);
		$("#cantidad").val('').focus();
	}
	calculoCosto();
});

$("#hora_inicio, #hora_fin,#hora_inicio, #hora_fin,#precio_unitario").blur(function(){
	calculoCosto();
});

$("#tiempo").change(function(){
	$("#tiempo_text").text('('+$(this).val()+')');
	calculoCosto();
});

function calculoCosto(){
	var fecha_inicio = $("#fecha_inicio").val();
	var fecha_fin = $("#fecha_fin").val();
	var hora_inicio = $("#hora_inicio").val();
	var hora_fin = $("#hora_fin").val();
	var cantidad = $("#cantidad").val();
	var tiempo = $("#tiempo").val();
	//alert (tiempo);
	var precio_unitario = $("#precio_unitario").val();

	if (fecha_inicio!='' && fecha_fin!='' && hora_inicio!='' && hora_fin!='' && cantidad>0 && tiempo!='' && precio_unitario!='') {
		var v=$.ajax({
		url:'/contratos/calculocosto/',
		type:'POST',
		datatype: 'json',
		data:{fecha_inicio:fecha_inicio,fecha_fin:fecha_fin,hora_inicio:hora_inicio,hora_fin:hora_fin,cantidad:cantidad,tiempo:tiempo,precio_unitario:precio_unitario},
		success: function(data) { 
			//alert(data);
			$("#total").val(data);	
		}, //mostramos el error
		error: function() { alert('Se ha producido un error Inesperado'); }
		});	
	};
	
}

/*
Eliminar Contratos productos
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

$("#testForm").submit(function() {
	var v=$.ajax({
		url:'/contratos/savecontratosproductos/',
		type:'POST',
		datatype: 'json',
		data:{id:$("#id").val(),contrato_id:$("#contrato_id").val(),producto_id:$("#producto_id").val(),precio_unitario:$("#precio_unitario").val(),tiempo:$("#tiempo").val(),fecha_inicio:$("#fecha_inicio").val(),fecha_fin:$("#fecha_fin").val(),cantidad:$("#cantidad").val(),total:$("#total").val()},
		success: function(data) { 
			cargar(); 
			cargar2(); 
			$("#divMsjeExito").show();
			$("#divMsjeExito").addClass('alert alert-info alert-dismissable');
			$("#aMsjeExito").html(data); 
				}, //mostramos el error
				error: function() { alert('Se ha producido un error Inesperado'); }
			});
	$('#myModal').modal('hide');
            return false; // ajax used, block the normal submit
        });

	$("#fecha_inicio, #fecha_fin").datepicker({
						autoclose:true,
	});
	 

})