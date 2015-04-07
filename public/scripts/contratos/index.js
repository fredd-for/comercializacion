
$(document).ready(function (){

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
			{ name: 'fecha_inicio',type:'date'},
			{ name: 'fecha_fin',type:'date'},
			{ name: 'total',type:'number'},
			],
			url: '/contratos/listcp/15',
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
            showstatusbar: true,
            showfilterrow: true,
            filterable: true,
            autorowheight: true,
            pageable: true,
            pagerMode: 'advanced',
            
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
			{ text: 'Precio Bs', datafield: 'precio_tiempo', filtertype: 'input',width: '15%' },
			{ text: 'Fecha Inicio', datafield: 'fecha_inicio', filtertype: 'range', width: '10%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
	        { text: 'Fecha Finalización', datafield: 'fecha_fin', filtertype: 'range', width: '10%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
			{ text: 'Sub Total', datafield: 'total', filtertype: 'number',width: '10%' },
			//{ text: 'Sub Total', datafield: 'total', cellsalign: 'right', cellsformat: 'c2', aggregates: ['sum', 'avg'] },
			]
		});
}


})