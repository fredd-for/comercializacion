
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
			{ name: 'grupo',type: 'string'},
			{ name: 'linea',type: 'string'},
			{ name: 'estacion',type: 'string'},
			{ name: 'producto',type: 'string'},
			{ name: 'contrato',type: 'string'},
			{ name: 'fecha_programado',type:'date'},
			{ name: 'monto_reprogramado',type: 'number'},
			{ name: 'diferencia_dias',type:'number'}
			],
			url: '/alertas/list/',
			cache: false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);
		var tooltiprenderer = function (element) {
                $(element).jqxTooltip({position: 'mouse', content: $(element).text() });
        };
        var cellclass = function (row, columnfield, value,data) {
                if (data.diferencia_dias > 0) {
                    return 'red';
                } else {
                	return 'yellow';	
                }
                
        }
		$("#jqxgrid").jqxGrid({

			width: '100%',
            source: dataAdapter,                
            sortable: true,
            altRows: true,
            columnsresize: true,
            theme: 'custom',
            //showstatusbar: true,
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
			//{ text: 'Grupo', datafield: 'grupo', filtertype: 'checkedlist',width: '8%', rendered: tooltiprenderer },
			{ text: 'Linea', datafield: 'linea', filtertype: 'checkedlist',width: '10%',cellclassname: cellclass },
			{ text: 'Estación', datafield: 'estacion', filtertype: 'checkedlist',width: '15%',cellclassname: cellclass },
			{ text: 'Cliente / Razón Social', datafield: 'razon_social', filtertype: 'input',width: '19%',cellclassname: cellclass },
			{ text: 'Contrato', datafield: 'contrato', filtertype: 'input',width: '10%',cellclassname: cellclass },
			{ text: 'Producto', datafield: 'producto', filtertype: 'input',width: '15%',cellclassname: cellclass },
			{ text: 'Fecha Programado', datafield: 'fecha_programado', filtertype: 'range', width: '10%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center',cellclassname: cellclass},
			{ text: 'Monto Programado Bs.', datafield: 'monto_reprogramado', filtertype: 'number', width: '10%',cellsformat: "c2", cellsalign: 'right',cellclassname: cellclass},
	        { text: 'Dias Atraso', datafield: 'diferencia_dias', filtertype: 'number', width: '7%',cellsalign: 'center',cellclassname: cellclass},
			],
			//groups: ['razon_social','contrato']
		});

 		//$("#jqxgrid").jqxGrid('expandgroup',4);
}


cargar2();	
	function cargar2(){	
		var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'razon_social',type: 'string'},
			{ name: 'nit',type: 'string'},
			{ name: 'grupo',type: 'string'},
			{ name: 'linea',type: 'string'},
			{ name: 'estacion',type: 'string'},
			{ name: 'producto',type: 'string'},
			{ name: 'contrato',type: 'string'},
			{ name: 'fecha_fin',type:'date'},
			{ name: 'diferencia_dias',type:'number'}
			],
			url: '/alertas/listcontratos/',
			cache: false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);
		var tooltiprenderer = function (element) {
                $(element).jqxTooltip({position: 'mouse', content: $(element).text() });
        };
        var cellclass = function (row, columnfield, value,data) {
                if (data.diferencia_dias > 15) {
                    return 'yellow';
                } else {
                	return 'red';	
                }
                
        }
		$("#jqxgrid_contratos").jqxGrid({

			width: '100%',
            source: dataAdapter,                
            sortable: true,
            altRows: true,
            columnsresize: true,
            theme: 'custom',
            //showstatusbar: true,
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
			//{ text: 'Grupo', datafield: 'grupo', filtertype: 'checkedlist',width: '8%', rendered: tooltiprenderer },
			{ text: 'Linea', datafield: 'linea', filtertype: 'checkedlist',width: '10%',cellclassname: cellclass },
			{ text: 'Estación', datafield: 'estacion', filtertype: 'checkedlist',width: '15%',cellclassname: cellclass },
			{ text: 'Cliente / Razón Social', datafield: 'razon_social', filtertype: 'input',width: '19%',cellclassname: cellclass },
			{ text: 'Contrato', datafield: 'contrato', filtertype: 'input',width: '10%',cellclassname: cellclass },
			{ text: 'Producto', datafield: 'producto', filtertype: 'input',width: '15%',cellclassname: cellclass },
			{ text: 'Fecha Finalización', datafield: 'fecha_fin', filtertype: 'range', width: '10%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center',cellclassname: cellclass},
	        { text: 'Dias Faltantes', datafield: 'diferencia_dias', filtertype: 'number', width: '10%',cellsalign: 'center',cellclassname: cellclass},
			],
			//groups: ['razon_social','contrato']
		});

 		//$("#jqxgrid").jqxGrid('expandgroup',4);
}




})