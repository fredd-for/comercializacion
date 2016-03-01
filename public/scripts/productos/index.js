$(document).ready(function (){
	// cargar();	
	// function cargar(){	
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
			{ name: 'cantidad_alquilada',type:'number'},
			{ name: 'cantidad_disponible',type:'number'},
			{ name: 'tiempo',type:'string'},
			{ name: 'foto'},
			],
			url: '/productos/list',
			cache: true
		};
		// var dataAdapter = new $.jqx.dataAdapter(source);

		
		var cellclass = function (row, columnfield, value) {
			if (value < 0) {
				return 'red';
			}
			else if (value >0) {
				return 'green';
			}
			else return 'yellow';
		}

		var dataAdapter = new $.jqx.dataAdapter(source, {
                // downloadComplete: function (data, status, xhr) { },
                loadComplete: function (data) { 
                	if ($("#opcion").val()==0) {
                		$("#jqxgrid").jqxGrid('sortby', 'cantidad_disponible', 'desc');	
                	}
                	if ($("#opcion").val()==1) {
                		$("#jqxgrid").jqxGrid('sortby', 'cantidad_alquilada', 'desc');	
                	}

                	
            	},
                // loadError: function (xhr, status, error) { }
            });

		var tooltiprenderer = function (element) {
                $(element).jqxTooltip({position: 'mouse', content: $(element).text() });
        };

        var FilterLinea = function () {
        	if ($("#linea_id_filtro").val()!='') {
        		var filtergroup = new $.jqx.filter();
                var filter_or_operator = 1;
                var filtervalue = $("#linea_id_filtro").val();
                var filtercondition = 'equal';
                var filter = filtergroup.createfilter('stringfilter', filtervalue, filtercondition);
                filtergroup.addfilter(filter_or_operator, filter);
                return filtergroup;
        	}
                
            }();

            var FilterGrupo = function () {
        	if ($("#grupo_id_filtro").val()!='') {
        		var filtergroup = new $.jqx.filter();
                var filter_or_operator = 1;
                var filtervalue = $("#grupo_id_filtro").val();
                var filtercondition = 'equal';
                var filter = filtergroup.createfilter('stringfilter', filtervalue, filtercondition);
                filtergroup.addfilter(filter_or_operator, filter);
                return filtergroup;
        	}
                
            }();

		$("#jqxgrid").jqxGrid({
			width: '100%',
			height: 600,
			source: dataAdapter,
			sortable: true,
			altrows: true,
			columnsresize: true,
			pageable: true,
			pagerMode: 'advanced',
			theme: 'custom',
			scrollmode: 'deferred',
			showstatusbar: true,
			statusbarheight: 25,
			showfilterrow: true,

			autoshowfiltericon: false,
			
			filterable: true,
			autorowheight: true,
			// autoheight: true,
			// keyboardnavigation: false,
			rowsheight: 80,
			scrollfeedback: function (row)
			{
				return '<table style="height: 80px;"><tr><td><img src="' + row.foto + '"  height="90"/></td></tr><tr><td>' + row.producto + '</td></tr></table>';
			},
			columns: [
			{text: 'Image', datafield: 'foto', width: 100, cellsrenderer: function (row, column, value) {
				return '<img style="margin-left: 5px;" height="80" width="100%" src="' + value + '" />';
			}
			},
					{ text: 'Lineas', datafield: 'linea', filtertype: 'checkedlist',width: '8%',rendered: tooltiprenderer, filter:FilterLinea},
					{ text: 'Estación', datafield: 'estacion', filtertype: 'checkedlist',width: '10%' },
					{ text: 'Grupo', datafield: 'grupo', filtertype: 'checkedlist',width: '10%', filter:FilterGrupo},
					{ text: 'Producto', datafield: 'producto', filtertype: 'input',width: '15%' },
					{ text: 'Codigo', datafield: 'codigo', filtertype: 'input',width: '5%' },
					{ text: 'Descripción', datafield: 'descripcion', filtertype: 'input',width: '19%' },
					{ text: 'Precio Unitario', datafield: 'precio_unitario', filtertype: 'number', width: '7%',cellsformat: "c2", cellsalign: 'right' , rendered: tooltiprenderer},
					{ text: 'Cant. Total', datafield: 'cantidad',filtertype: 'number', width: '5%', rendered: tooltiprenderer,hidden: true},
					{ text: 'Cant. Alquilada', datafield: 'cantidad_alquilada',filtertype: 'number', width: '10%',cellsalign: 'center' , rendered: tooltiprenderer},
					{ text: 'Cant. Disponible', datafield: 'cantidad_disponible',filtertype: 'number', width: '10%',cellsalign: 'center',cellclassname: cellclass, rendered: tooltiprenderer},
					{ text: 'Tiempo', datafield: 'tiempo',filtertype: 'input', width: '5%',hidden: true},
					]
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
});

if ($("#opcion").val()>0) {
	ordenar('cantidad_disponible','desc');
}
function ordenar (campo,orden) {
	$("#jqxgrid").jqxGrid('sortby', campo, orden);	
}



// }


 
/*
adicionar 
*/
$("#add").click(function(){
	$("#titulo").text("Adicionar Producto");
	$("#id").val("");
	$('#myModal').modal('show');
});

/*
Galeria de Imagenes
*/
$("#galeria").click(function() {
	var rowindex = $('#jqxgrid').jqxGrid('getselectedrowindex');
	if (rowindex > -1)
	{
		var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', rowindex);
		$("#id").val(dataRecord.id);
		$(location).attr('href','/productos/galeria/'+dataRecord.id);
	}
	else
	{
		bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un registro para editar.");
	}

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
		$("#titulo").text("Editar Producto");

		$("#grupo_id").val(dataRecord.grupo_id);
		$("#linea_id").val(dataRecord.linea_id);
		$("#producto").val(dataRecord.producto);
		$("#codigo").val(dataRecord.codigo);
		$("#descripcion").val(dataRecord.descripcion);
		$("#precio_unitario").val(dataRecord.precio_unitario);
		$("#cantidad").val(dataRecord.cantidad);
		$("#tiempo").val(dataRecord.tiempo);
		select_estacion(dataRecord.linea_id,dataRecord.estacion_id);
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
 		//$("#id").val(dataRecord.id);
 		bootbox.confirm("<strong>¡Mensaje!</strong> Esta seguro de eliminar el registro.", function(result) {
 			if (result == true) {
 				var v = $.ajax({
 					url: '/productos/delete/',
 					type: 'POST',
 					datatype: 'json',
 					data: {id: dataRecord.id},
 					success: function(data) {
                            // cargar(); //alert('Guardado Correctamente'); 
                            $("#jqxgrid").jqxGrid('updatebounddata', 'cells');
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
Select dependiente
*/

$("#linea_id").change(function(){
	select_estacion($(this).val());
});

$("#tiempo").change(function(){
	$("#tiempo_text").text('('+$(this).val()+')');
});

function select_estacion(linea_id,estacion_id){
	$.post("/productos/select_estaciones/", { linea_id: linea_id }, function(data){
		$("#estacion_id").html(data);
		$("#estacion_id").val(estacion_id);
	}); 
}

$.validator.setDefaults( {
			submitHandler: function () {
				var v=$.ajax({
		url:'/productos/save/',
		type:'POST',
		datatype: 'json',
		data:{id:$("#id").val(),grupo_id:$("#grupo_id").val(),estacion_id:$("#estacion_id").val(),producto:$("#producto").val(),codigo:$("#codigo").val(),descripcion:$("#descripcion").val(),precio_unitario:$("#precio_unitario").val(),cantidad:$("#cantidad").val(),tiempo:$("#tiempo").val(),estacion_id:$("#estacion_id").val()},
		success: function(data) { 
			$("#jqxgrid").jqxGrid('updatebounddata', 'cells'); //cargar(); 
			$("#divMsjeExito").show();
			$("#divMsjeExito").addClass('alert alert-info alert-dismissable');
			$("#aMsjeExito").html(data); 
				}, //mostramos el error
				error: function() { alert('Se ha producido un error Inesperado'); }
			});
	$('#myModal').modal('hide');
			}
		} );

$( "#testForm" ).validate( {
				rules: {
					precio_unitario: {
						required: true,
						number: true
					},
					
				},
				messages: {
					
					precio_unitario: {
						required: "Campo requerido",
						number: "Ingrese un numero"
					},
					
				},
				errorElement: "label",
				errorPlacement: function ( error, element ) {
					// Add the `help-block` class to the error element
					error.addClass( "help-block" );

					if ( element.prop( "type" ) === "checkbox" ) {
						error.insertAfter( element.parent( "label" ) );
					} else {
						error.insertAfter( element );
					}
				},
				highlight: function ( element, errorClass, validClass ) {
					$( element ).parents( ".col-md-9" ).addClass( "has-error" ).removeClass( "" );
				},
				unhighlight: function (element, errorClass, validClass) {
					$( element ).parents( ".col-md-9" ).addClass( "" ).removeClass( "has-error" );
				}
			} );

// $("#testForm").submit(function() {
// 	alert($("#precio_unitario").val());
// 	var v=$.ajax({
// 		url:'/productos/save/',
// 		type:'POST',
// 		datatype: 'json',
// 		data:{id:$("#id").val(),grupo_id:$("#grupo_id").val(),estacion_id:$("#estacion_id").val(),producto:$("#producto").val(),codigo:$("#codigo").val(),descripcion:$("#descripcion").val(),precio_unitario:$("#precio_unitario").val(),cantidad:$("#cantidad").val(),tiempo:$("#tiempo").val(),estacion_id:$("#estacion_id").val()},
// 		success: function(data) { 
// 			$("#jqxgrid").jqxGrid('updatebounddata', 'cells'); //cargar(); 
// 			$("#divMsjeExito").show();
// 			$("#divMsjeExito").addClass('alert alert-info alert-dismissable');
// 			$("#aMsjeExito").html(data); 
// 				}, //mostramos el error
// 				error: function() { alert('Se ha producido un error Inesperado'); }
// 			});
// 	$('#myModal').modal('hide');
//             return false; // ajax used, block the normal submit
//         });


$("#btnExportarExcel").click(function () {
	// alert("hola");

	exportarReporte(1);

        // var items = $("#jqxlistbox").jqxListBox('getCheckedItems');
        // var numColumnas = 0;
        // $.each(items, function (index, value) {
        //     numColumnas++;
        // });
        // if (numColumnas > 0) 
        // else {
        //     alert("Debe seleccionar al menos una columna para la obtención del reporte solicitado.");
        //     $("#jqxlistbox").focus();
        // }
    });

})

var FormsValidation=function(){return{init:function(){$("#form-validation").validate({errorClass:"help-block animation-slideDown",errorElement:"div",errorPlacement:function(e,a){a.parents(".form-group > div").append(e)},highlight:function(e){$(e).closest(".form-group").removeClass("has-success has-error").addClass("has-error"),$(e).closest(".help-block").remove()},success:function(e){e.closest(".form-group").removeClass("has-success has-error"),e.closest(".help-block").remove()},rules:{val_username:{required:!0,minlength:3},val_email:{required:!0,email:!0},val_password:{required:!0,minlength:5},val_confirm_password:{required:!0,equalTo:"#val_password"},val_bio:{required:!0,minlength:5},val_skill:{required:!0},val_website:{required:!0,url:!0},val_credit_card:{required:!0,creditcard:!0},val_digits:{required:!0,digits:!0},val_number:{required:!0,number:!0},val_range:{required:!0,range:[1,1e3]},val_terms:{required:!0}},messages:{val_username:{required:"Please enter a username",minlength:"Your username must consist of at least 3 characters"},val_email:"Please enter a valid email address",val_password:{required:"Please provide a password",minlength:"Your password must be at least 5 characters long"},val_confirm_password:{required:"Please provide a password",minlength:"Your password must be at least 5 characters long",equalTo:"Please enter the same password as above"},val_bio:"Don't be shy, share something with us :-)",val_skill:"Please select a skill!",val_website:"Please enter your website!",val_credit_card:"Please enter a valid credit card! Try 446-667-651!",val_digits:"Please enter only digits!",val_number:"Please enter a number!",val_range:"Please enter a number between 1 and 1000!",val_terms:"You must agree to the service terms!"}}),$("#masked_date").mask("99/99/9999"),$("#masked_date2").mask("99-99-9999"),$("#masked_phone").mask("(999) 999-9999"),$("#masked_phone_ext").mask("(999) 999-9999? x99999"),$("#masked_taxid").mask("99-9999999"),$("#masked_ssn").mask("999-99-9999"),$("#masked_pkey").mask("a*-999-a999")}}}();