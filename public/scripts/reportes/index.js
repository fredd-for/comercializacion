$(document).ready(function (){
	$("#reporte").hide();
	$("#testForm").submit(function() {
		var v=$.ajax({
			url:'/reportes/filtrar/',
			type:'POST',
			datatype: 'json',
			data:{linea_id:$("#linea_id").val(),grupo_id:$("#grupo_id").val(),f_inicio:$("#f_inicio").val(),f_fin:$("#f_fin").val()},
			success: function(data) { 
			// $("#divMsjeExito").show();
			// $("#divMsjeExito").addClass('alert alert-info alert-dismissable');
			// $("#aMsjeExito").html(data); 

			$("#contenido_tabla").html(data);
			$("#reporte").show();
				}, //mostramos el error
				error: function() { alert('Se ha producido un error Inesperado'); }
			});
            return false; // ajax used, block the normal submit
        });

	$(".input-daterange").datepicker({weekStart:1});
	$(".input-datepicker-close").datepicker({weekStart:1}).on("changeDate",function(){$(this).datepicker("hide")})
	$("#f_inicio,#f_fin").datepicker({
		autoclose:true,
	});	


	$("#reporte").click(function(){
	$("#linea_id").val();
	$(location).attr('href', '/reportes/reporte/'+$("#linea_id").val()+'/'+$("#grupo_id").val()+'/'+$("#f_inicio").val()+'/'+$("#f_fin").val());
	});

	// $("#reporte").click(function () {
	// 	alert("hola");
	// 	$('#tabla_excel').tableExport({type:'excel',escape:'false'});
 //    // window.open('data:application/vnd.ms-excel,' + $('#tabla_excel').html());
 //    // e.preventDefault();
	// });

})