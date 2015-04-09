
$(document).ready(function (){

cargar();	
	function cargar(){	
		var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'razon_social',type: 'string'},
			{ name: 'cliente_id',type: 'number'},
			{ name: 'contrato',type: 'string'},
			{ name: 'fecha_contrato',type: 'date'},
			{ name: 'descripcion',type: 'string'},
			{ name: 'monto_total',type: 'number'},
			{ name: 'monto_cancelado',type: 'number'},
			{ name: 'monto_cobrar',type:'number'},
			{ name: 'fecha_pago',type:'date'},
			{ name: 'dias_atraso',type:'number'},
			{ name: 'mora',type:'number'},
			],
			url: '/contratos/list/',
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
			{ text: 'Cliente / Razon Social', datafield: 'razon_social', filtertype: 'filter',width: '10%' },
			{ text: 'Nro Contrato', datafield: 'contrato', filtertype: 'input',width: '8%' },
			{ text: 'Fecha Contrato', datafield: 'fecha_contrato', filtertype: 'range', width: '8%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
			{ text: 'Descripción', datafield: 'descripcion', filtertype: 'input',width: '19%' },
			{ text: 'Monto Total Bs.', datafield: 'monto_total', filtertype: 'number', width: '10%',cellsformat: "c2", cellsalign: 'right'},
	        { text: 'Monto Cancelado Bs.', datafield: 'monto_cancelado', filtertype: 'number', width: '10%', cellsformat: "c2", cellsalign: 'right'},
			{ text: 'Monto Cobrar', datafield: 'monto_cobrar', filtertype: 'number',width: '10%',cellsformat: "c2", cellsalign: 'right' },
			{ text: 'Ultima Fecha Pago', datafield: 'fecha_pago', filtertype: 'range', width: '8%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
			{ text: 'Mora', datafield: 'mora', filtertype: 'number',width: '10%' },
			],
			groups: ['razon_social']
		});

 		//$("#jqxgrid").jqxGrid('expandgroup',4);
}


})