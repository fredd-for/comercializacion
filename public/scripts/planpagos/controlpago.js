$(document).ready(function (){
	cargar();	
	function cargar(){	
		var source =
		{
			datatype: "json",
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'fecha_programado',type: 'date'},
			{ name: 'monto_programado',type: 'number'},
			{ name: 'monto_reprogramado',type: 'number'},
			{ name: 'monto_reprogramado_div',type: 'string'},
			{ name: 'dias_atraso',type: 'number'},
			{ name: 'mora',type: 'number'},
			{ name: 'diferencia',type: 'number'},
			{ name: 'factura_total',type: 'number'},
			{ name: 'deposito_total',type: 'number'},
			{ name: 'mora_total',type: 'number'},
			{ name: 'nro_deposito',type: 'string'},
			{ name: 'fecha_deposito',type: 'string'},
			{ name: 'monto_deposito',type: 'string'},
			{ name: 'nro_deposito_mora',type: 'string'},
			{ name: 'fecha_deposito_mora',type: 'string'},
			{ name: 'monto_deposito_mora',type: 'string'},
			{ name: 'nro_factura',type: 'string'},
			{ name: 'fecha_factura',type: 'string'},
			{ name: 'monto_factura',type: 'string'},
			{ name: 'fecha_actual',type: 'date'},
			{ name: 'fecha_10',type: 'date'},
			],
			url: '/planpagos/listcontrolpago/'+$("#contratoproducto_id").val(),
			cache: false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);
		var cellclass = function (row, columnfield, value,data) {
			if(data.fecha_actual>=data.fecha_programado && data.factura_total<data.monto_reprogramado){
				return 'red';
			}else if(data.fecha_10>=data.fecha_programado && data.factura_total<data.monto_reprogramado){
				return 'yellow';
			}else if (data.factura_total>=data.monto_reprogramado){
				return 'green';
			}else{
				return '';
			}
        };

        var cellclassdeposito = function (row, columnfield, value,data) {
			if(data.fecha_actual>=data.fecha_programado && data.deposito_total<data.monto_reprogramado){
				return 'red';
			}else if(data.fecha_10>=data.fecha_programado && data.deposito_total<data.monto_reprogramado){
				return 'yellow';
			}else if (data.deposito_total>=data.monto_reprogramado){
				return 'green';
			}else{
				return '';
			}
			
        };

        var cellclassmora = function (row, columnfield, value,data) {
			
        };




        // $color_mora = '';
        //                         $model = new Planpagodepositos();
        //                         $resulmora = $model->getdatosverificar($v->id,2);
        //                         $dias_atraso = '';
        //                         $mora='';
        //                         foreach ($resulmora as $rm) {
        //                             $fecha_tolerancia = date("Y-m-d",strtotime( '+'.$rm->dias_tolerancia.' day' , strtotime($v->fecha_programado)));
        //                             if ($fecha_tolerancia<date("Y-m-d")) {
        //                                 if ($v->mora>0) {
        //                                     if ($v->mora > $rm->deposito) {
        //                                         $color_mora = 'danger';
        //                                     }else{
        //                                         $color_mora = 'success';
        //                                     }
        //                                     $dias_atraso = $v->dias_atraso;
        //                                     $mora=$v->mora;
        //                                 }else{
        //                                     if ($total_deposito<$v->monto_reprogramado) {
        //                                         $nuevafecha = strtotime ( '+'.$rm->dias_tolerancia.' day' , strtotime ( $v->fecha_programado ) ) ;
        //                                         $nuevafecha = date ( 'Y-m-d' , $nuevafecha );

        //                                         $datetime1 = new DateTime($nuevafecha);
        //                                         $datetime2 = new DateTime(date("Y-m-d"));
        //                                         $interval = $datetime1->diff($datetime2);
        //                                         $dias_atraso = $interval->format('%R%a');
        //                                         $mora=($rm->total/$rm->nro_dias*$rm->porcentaje_mora)*$dias_atraso;
        //                                         $color_mora = 'danger';    
        //                                     }else{
        //                                         $color_mora = 'success';   
        //                                     }
                                            
        //                                 }
        //                                 $total_mora+=$mora;
        //                             }
        //                         }


        

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
			//showstatusbar: true,
			showfilterrow: true,
			filterable: true,
			autorowheight: true,
			keyboardnavigation: false,
			columns: [
			// {
			// 	text: '#', sortable: false, filterable: false, editable: false,
			// 	groupable: false, draggable: false, resizable: false,
			// 	datafield: '', columntype: 'number', width: '3%',
			// 	cellsrenderer: function (row, column, value) {
			// 		return "<div style='margin:4px;'>" + (value + 1) + "</div>";
			// 	}
			// },
			{ text: 'Fecha Programado', datafield: 'fecha_programado', filtertype: 'range', width: '10%', cellsalign: 'center', cellsformat: 'dd-MM-yyyy', align:'center'},
			{ text: 'Monto Programado', datafield: 'monto_reprogramado_div', filtertype: 'input',width: '12%' ,cellsalign: 'right',align:'center'},
			// { text: 'Nro Factura', datafield: 'nro_factura', filtertype: 'input',width: '8%' },
			{ text: 'Fecha Factura', datafield: 'fecha_factura', filtertype: 'input',width: '10%', cellsalign: 'center',align:'center',cellclassname: cellclass },
			{ text: 'Monto Factura', datafield: 'monto_factura', filtertype: 'input',width: '10%', cellsalign: 'right',align:'center',cellclassname: cellclass},
			// { text: 'Nro Deposito', datafield: 'nro_deposito', filtertype: 'input',width: '8%' },
			{ text: 'Fecha Deposito', datafield: 'fecha_deposito', filtertype: 'input',width: '10%', cellsalign: 'center',align:'center',cellclassname:cellclassdeposito },
			{ text: 'Monto Deposito', datafield: 'monto_deposito', filtertype: 'input',width: '12%', cellsalign: 'right',align:'center',cellclassname:cellclassdeposito},
			{ text: 'Dias Atraso', datafield: 'dias_atraso', filtertype: 'input',width: '8%',align:'center',cellclassname:cellclassmora },
			{ text: 'Mora', datafield: 'mora', filtertype: 'input',width: '8%' ,align:'center',cellclassname:cellclassmora},
			// { text: 'Nro Deposito Mora', datafield: 'nro_deposito_mora', filtertype: 'input',width: '8%' },
			{ text: 'Fecha Deposito Mora', datafield: 'fecha_deposito_mora', filtertype: 'input',width: '10%', cellsalign: 'center',align:'center' },
			{ text: 'Monto Deposito Mora', datafield: 'monto_deposito_mora', filtertype: 'input',width: '10%', cellsalign: 'right',align:'center'},
			]
		});
}




})