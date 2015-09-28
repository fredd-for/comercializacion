$(document).ready(function (){


$("#file-1").fileinput({
		//showUpload: false,
		// showCaption: false,
		language: 'es',
		allowedFileExtensions : ['jpg','jpeg', 'png','gif','xlsx','docx','pdf'],
		maxFileSize: 1000,
		browseClass: "btn btn-primary btn-sm",
		// fileType: "any",
  //       previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
	});

	cargar();	
	function cargar(){	
		var source =
		{
			datatype: "json",
			updaterow: function (rowid, rowdata, commit) {
                    var v=$.ajax({
                    	url:'/checklists/savecumple/',
                    	type:'POST',
                    	datatype: 'json',
                    	data:{parametro_id:rowdata.id,contrato_id:$("#contrato_id").val(),tipo_empresa:rowdata.tipo_empresa_text,parametro:rowdata.parametro,cumple:rowdata.cumple},
                    	success: function(data) { 
                    	$("#jqxgrid").jqxGrid('updatebounddata', 'cells');
				}, //mostramos el error
				error: function() { alert('Se ha producido un error Inesperado'); }
			});
                    commit(true);
                },
			datafields: [
			{ name: 'id',type: 'number'},
			{ name: 'parametro',type: 'string'},
			{ name: 'abreviado',type: 'string'},
			{ name: 'tipo_empresa',type: 'number'},
			{ name: 'tipo_empresa_text',type: 'string'},
			{ name: 'obligatorio',type: 'number'},
			{ name: 'obligatorio_text',type: 'string'},
			{ name: 'escaner',type: 'number'},
			{ name: 'escaner_text',type: 'string'},
			{ name: 'clase',type: 'string'},
			{ name: 'cumple',type: 'number'},
			{ name: 'accion',type: 'string'},
			{ name: 'archivo',type: 'string'},
			{ name: 'checklist_id',type: 'number'},
			],
			url: '/checklists/list/'+$("#contrato_id").val(),
			cache: false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		$("#jqxgrid").jqxGrid({

			width: '100%',
            source: dataAdapter,
            pageable: false,
            autorowheight: true,
            autoheight: true,
            altrows: true,
            theme: 'custom',
            columnsresize: true,
            showstatusbar: true,
            statusbarheight: 25,
            showaggregates: true,
			// groupable: true,
			editable: true,
			columns: [
			// {
			// 	text: '#', sortable: false, filterable: false, editable: false,
			// 	groupable: false, draggable: false, resizable: false,
			// 	datafield: '', columntype: 'number', width: '3%',
			// 	cellsrenderer: function (row, column, value) {
			// 		return "<div style='margin:4px;'>" + (value + 1) + "</div>";
			// 	}
			// },
			{ text: 'Tipo Empresa', datafield: 'tipo_empresa_text', filtertype: 'input',width: '35%' ,editable: false},
			{ text: 'Parametro', datafield: 'parametro', filtertype: 'input',width: '40%',editable: false},
			{ text: 'Cumple', datafield: 'cumple', columntype: 'checkbox', width: '10%' },
			{ text: 'Archivo Escaneado', datafield: 'archivo', filtertype: 'input',width: '10%' ,editable: false},
			{ text: '', datafield: 'accion', filtertype: 'input',width: '5%' ,editable: false},
			],
			groups: ['tipo_empresa_text']
		});

	 
}
// $("#expandall").jqxButton({ theme: theme });
// $("#expandall").click(function () {
// 	alert("hoal");
//                 //$("#jqxgrid").jqxGrid('expandallgroups');
// });

$("#expandall").click(function(){
	$("#jqxgrid").jqxGrid('expandallgroups');
});
// $("#tipo_empresa_text").jqxCheckBox({  checked: false });


/*
adicionar 
*/
$("#migrar").click(function(){
	
	var v = $.ajax({
				url: '/checklists/migrar/',
				type: 'POST',
				datatype: 'json',
				data: {cliente_id: $("#cliente_id").val(), contrato_id:$("#contrato_id").val()},
				success: function(data) {
                            // alert(data);
                            bootbox.confirm("<strong>¡Mensaje!</strong> "+ data,function (result) {
                            	if(result==true){
                            		alert("si");
                            	}
                            })
                        }, //mostramos el error
                        error: function() {
                        	alert('Se ha producido un error Inesperado');
                        }
    });

	// bootbox.confirm("<strong>¡Mensaje!</strong> Esta seguro de migrar del ultimo contrato.", function(result) {
	// 	if (result == true) {
			
	// 	}
	// });
});

// /*
// Editar
//  */
// $("#edit").click(function() {
//  	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
//  	if (rowindex > -1)
//  	{
//  		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
//  		$("#id").val(dataRecord.id);
//  		$("#titulo").text("Editar Parametro Check List");
//  		$("#tipo_empresa").val(dataRecord.tipo_empresa);
//  		$("#parametro").val(dataRecord.parametro);
//  		$("#obligatorio").val(dataRecord.obligatorio);
//  		$("#escaner").val(dataRecord.escaner);
//  		$('#myModal').modal('show');
//  	}
//  	else
//  	{
//  		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un registro para editar.");
//  	}

//  });

// /*
// Eliminar
//  */
// $("#delete").click(function() {
//  	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
//  	if (rowindex > -1)
//  	{
//  		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
//  		bootbox.confirm("<strong>¡Mensaje!</strong> Esta seguro de eliminar el registro.", function(result) {
//                 if (result == true) {
//                     var v = $.ajax({
//                         url: '/parametroschecklists/delete/',
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
// guardar 
//  */
// $("#testForm").submit(function() {
// 	var v=$.ajax({
//             	url:'/parametroschecklists/save/',
//             	type:'POST',
//             	datatype: 'json',
//             	data:{id:$("#id").val(),tipo_empresa:$("#tipo_empresa").val(),parametro:$("#parametro").val(),obligatorio:$("#obligatorio").val(),escaner:$("#escaner").val()},
// 				success: function(data) { cargar(); 
// 					$("#divMsjeExito").show();
//                     $("#divMsjeExito").addClass('alert alert-info alert-dismissable');
//                     $("#aMsjeExito").html(data); 
// 				}, //mostramos el error
// 			error: function() { alert('Se ha producido un error Inesperado'); }
// 			}); //             $('#myModal').modal('hide');
//             return false; // ajax used, block the normal submit
// });

})

var add_archivo = function (row) {
	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
	if (rowindex > -1) {
		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
		$("#checklist_id").val(dataRecord.checklist_id);
		// $("#tipo").val(dataRecord.tipo);
		$('#myModal').modal('show');
	
	}else{
		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un registro para editar.");
	}
};
