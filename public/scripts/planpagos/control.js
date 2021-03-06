
$(document).ready(function (){
/*
Adicionar Derecho de llave
 */
$("#add_derechollave").click(function() {
	$('#titulo_derechollave').text('Adicionar Derecho de LLave');
	$("#fecha_deposito_derechollave").val("");
	$("#nro_deposito_derechollave").val($("");
	$("#monto_deposito_derechollave").val("");

	$('#myModal_derechollave').modal('show');
});

$("#edit_derechollave").click(function() {
	$('#titulo_derechollave').text('Editar Derecho de LLave');
	$("#garantia_id").val($(this).attr('garantia_id'));
	$("#fecha_deposito_derechollave").val($(this).attr('fecha_deposito'));
	$("#nro_deposito_derechollave").val($(this).attr('nro_deposito'));
	$("#monto_deposito_derechollave").val($(this).attr('monto_deposito'));
	$('#myModal_derechollave').modal('show');
});

$("#testForm_derechollave").submit(function(){
	var v=$.ajax({
		url:'/planpagos/savederechollave/',
		type:'POST',
		datatype: 'json',
		data:{garantia_id:$("#garantia_id").val(),contratoproducto_id:$("#contratoproducto_id").val(),fecha_deposito:$("#fecha_deposito_derechollave").val(),nro_deposito:$("#nro_deposito_derechollave").val(),monto_deposito:$("#monto_deposito_derechollave").val()},
		complete:function(){
			$("#edit_derechollave").click(function() {
				$('#titulo_derechollave').text('Editar Derecho de LLave');
				$("#garantia_id").val($(this).attr('garantia_id'));
				$("#fecha_deposito_derechollave").val($(this).attr('fecha_deposito'));
				$("#nro_deposito_derechollave").val($(this).attr('nro_deposito'));
				$("#monto_deposito_derechollave").val($(this).attr('monto_deposito'));
				$('#myModal_derechollave').modal('show');
			});	
		},
		success: function(data) { 
			$("#html_derechollave").html(data); 
				}, //mostramos el error
				error: function() { alert('Se ha producido un error Inesperado'); }
			});
	$('#myModal_derechollave').modal('hide');
    return false; // ajax used, block the normal submit
});


/*
Adicionar Garantia
 */
$("#add_garantia").click(function() {
	alert("hola");
	$('#titulo_garantia').text('Adicionar Garantia');
	$("#fecha_deposito_garantia").val("");
	$("#nro_deposito_garantia").val("");
	$("#monto_deposito_garantia").val("");
	$('#myModal_garantia').modal('show');
});

$("#edit_garantia").click(function() {
	$('#titulo_garantia').text('Editar Garantia');
	$("#garantia_id").val($(this).attr('garantia_id'));
	$("#fecha_deposito_garantia").val($(this).attr('fecha_deposito'));
	$("#nro_deposito_garantia").val($(this).attr('nro_deposito'));
	$("#monto_deposito_garantia").val($(this).attr('monto_deposito'));

	$("#fecha_devolucion_garantia").val($(this).attr('fecha_devolucion'));
	$("#nro_devolucion_garantia").val($(this).attr('nro_devolucion'));
	$("#monto_devolucion_garantia").val($(this).attr('monto_devolucion'));

	$('#myModal_garantia').modal('show');
});

$("#testForm_garantia").submit(function(){
	var v=$.ajax({
		url:'/planpagos/savegarantia/',
		type:'POST',
		datatype: 'json',
		data:{garantia_id:$("#garantia_id").val(),contratoproducto_id:$("#contratoproducto_id").val(),fecha_deposito:$("#fecha_deposito_garantia").val(),nro_deposito:$("#nro_deposito_garantia").val(),monto_deposito:$("#monto_deposito_garantia").val(),fecha_devolucion:$("#fecha_devolucion_garantia").val(),nro_devolucion:$("#nro_devolucion_garantia").val(),monto_devolucion:$("#monto_devolucion_garantia").val()},
		complete:function(){
			$("#edit_garantia").click(function() {
				$('#titulo_garantia').text('Editar Garantia');
				$("#garantia_id").val($(this).attr('garantia_id'));
				$("#fecha_deposito_garantia").val($(this).attr('fecha_garantia'));
				$("#nro_deposito_garantia").val($(this).attr('nro_garantia'));
				$("#monto_deposito_garantia").val($(this).attr('monto_garantia'));

				$("#fecha_devolucion_garantia").val($(this).attr('fecha_devolucion'));
				$("#nro_devolucion_garantia").val($(this).attr('nro_devolucion'));
				$("#monto_devolucion_garantia").val($(this).attr('monto_devolucion'));

				$('#myModal_garantia').modal('show');
			});	
		},
		success: function(data) { 
			$("#html_garantia").html(data); 
				}, //mostramos el error
				error: function() { alert('Se ha producido un error Inesperado'); }
			});
	$('#myModal_garantia').modal('hide');
    return false; // ajax used, block the normal submit
});


/*
REgistro de deposito de pago
 */
$(".reg_deposito").click(function() {
	$("#planpago_id").val($(this).attr('planpago_id'));
	$("#tipo_deposito").val($(this).attr('tipo_deposito'));
	$('#titulo_deposito').text($(this).attr('texto'));
	$('#myModal_deposito').modal('show');
});

$("#testForm_deposito").submit(function(){
	var v=$.ajax({
		url:'/planpagos/savedeposito/',
		type:'POST',
		datatype: 'json',
		data:{contratoproducto_id:$("#contratoproducto_id").val(),planpago_id:$("#planpago_id").val(),nro_deposito:$("#nro_deposito").val(),fecha_deposito:$("#fecha_deposito").val(),monto_deposito:$("#monto_deposito").val(),tipo_deposito:$("#tipo_deposito").val()},
		complete:function(){
			$(".reg_deposito").click(function() {
				$("#planpago_id").val($(this).attr('planpago_id'));
				$("#tipo_deposito").val($(this).attr('tipo_deposito'));
				$('#titulo_deposito').text($(this).attr('texto'));
				$('#myModal_deposito').modal('show');
			});

		},
		success: function(data) { 
			$("#cargar_html").html(data); 
				}, //mostramos el error
				error: function() { alert('Se ha producido un error Inesperado'); }
			});
	$('#myModal_deposito').modal('hide');
    return false; // ajax used, block the normal submit
});


/*
Edicion de depositos
 */
$(".edit_deposito").click(function() {
	$("#planpago_id").val($(this).attr('planpago_id'))
	htmldepositos($(this).attr('planpago_id'));
	
});

function htmldepositos(planpago_id) {
	
	var v=$.ajax({
		url:'/planpagos/htmldepositos/',
		type:'POST',
		datatype: 'json',
		complete:function(){

			$(".eliminar_deposito").click(function(){
				var ppd =$(this).attr('planpagodeposito_id');
				if(ppd!=""){
					bootbox.confirm("<strong>¡Mensaje!</strong> Esta seguro de eliminar el deposito?.", function(result) {
						if (result==true) {
							var v=$.ajax({
								url:'/planpagos/deletedeposito/',
								type:'POST',
								datatype: 'json',
								data:{planpagodeposito_id:ppd},
								success: function(data) { 
									htmldepositos($("#planpago_id").val());

									/*
									
									*/
									var v=$.ajax({
										url:'/planpagos/gethtmlcontrolpagos/',
										type:'POST',
										datatype: 'json',
										data:{contratoproducto_id:$("#contratoproducto_id").val()},
										complete:function(){
											$(".reg_deposito").click(function() {
												$("#planpago_id").val($(this).attr('planpago_id'));
												$("#tipo_deposito").val($(this).attr('tipo_deposito'));
												$('#titulo_deposito').text($(this).attr('texto'));
												$('#myModal_deposito').modal('show');
											});
											$(".edit_deposito").click(function() {
												$("#planpago_id").val($(this).attr('planpago_id'))
												htmldepositos($(this).attr('planpago_id'));

											});
										},
										success: function(data) { 
											$("#cargar_html").html(data); 
										},
										error: function() { alert('Se ha producido un error Inesperado'); }
									});



								},
								error: function() { alert('Se ha producido un error Inesperado'); }
							});
						}
					});
				
				}else{
					bootbox.alert("<strong>¡Mensaje!</strong> Seleccionar un registro para eliminar.");
				}



			});
    	},
		data:{planpago_id:planpago_id},
		success: function(data) { 
			$("#html_depositos").html(data); 
				}, //mostramos el error
				error: function() { alert('Se ha producido un error Inesperado'); }
		});
	$('#myModal_editdeposito').modal('show');
}

$(".tdFacDep").hide();
 $("#verFacDep").click(function(){
 	$(".tdFacDep").toggle();
 });

$("#fecha_deposito, #fecha_deposito_derechollave, #fecha_deposito_garantia, #fecha_devolucion_garantia").datepicker({
	autoclose:true,
});

})