
$(document).ready(function (){

cargar();	
	function cargar(){	
		var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'razon_social',type: 'string'},
			{ name: 'grupo',type: 'string'},
			{ name: 'linea',type: 'string'},
			{ name: 'estacion',type: 'string'},
			{ name: 'producto',type: 'string'},
			{ name: 'contrato',type: 'string'},
			{ name: 'fecha_contrato',type:'date'},
			{ name: 'precio_unitario',type: 'number'},
			{ name: 'fecha_inicio',type:'date'},
			{ name: 'fecha_fin',type:'date'},
			{ name: 'monto_mora',type: 'number'},
			{ name: 'monto_mes',type:'number'},
			{ name: 'monto_cobrar',type:'number'},
			],
			url: '/planpagos/list/',
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
			{ text: 'Grupo', datafield: 'grupo', filtertype: 'filter',width: '8%' },
			{ text: 'Linea', datafield: 'linea', filtertype: 'input',width: '8%' },
			{ text: 'Estación', datafield: 'estacion', filtertype: 'input',width: '10%' },
			{ text: 'Cliente / Razón Social', datafield: 'razon_social', filtertype: 'input',width: '10%' },
			{ text: 'Contrato', datafield: 'contrato', filtertype: 'input',width: '5%' },
			{ text: 'Fecha Contrato ', datafield: 'fecha_contrato', filtertype: 'range', width: '8%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
			{ text: 'Producto', datafield: 'producto', filtertype: 'input',width: '10%' },
			{ text: 'Fecha Inicio', datafield: 'fecha_inicio', filtertype: 'range', width: '8%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
			{ text: 'Fecha Final', datafield: 'fecha_fin', filtertype: 'range', width: '8%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
			{ text: 'Monto Mora Bs.', datafield: 'monto_mora', filtertype: 'number', width: '8%',cellsformat: "c2", cellsalign: 'right'},
	        { text: 'Fecha Programado', datafield: 'fecha_programado', filtertype: 'range', width: '8%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
			{ text: 'Monto Programado', datafield: 'monto_programado', filtertype: 'number',width: '8%',cellsformat: "c2", cellsalign: 'right' },
 			{ text: 'Monto Por Cobrar', datafield: 'monto_cobrar', filtertype: 'number',width: '8%' },
			]
			//groups: ['grupo']
		});

 		//$("#jqxgrid").jqxGrid('expandgroup',4);
}


})