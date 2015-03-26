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
		pageable: true,
		pagerMode: 'advanced',
		showfilterrow: true,
		filterable: true,
        showstatusbar: true,
        statusbarheight: 25,
        theme: 'custom',
        scrollmode: 'deferred',
        rowsheight: 90,
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

})