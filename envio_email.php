<?php 
include("conexion/conexion.php");
require_once('app/libs/phpmailer/class.phpmailer.php');
require_once('app/libs/phpmailer/class.smtp.php');
$sql = "SELECT l.linea,e.estacion,c.contrato,p.producto,p.codigo,cl.razon_social,cl.nit,cl.correo,cl.representante_legal,cl.correo_representante_legal,cl.nombre_ref,cl.correo_ref,
	CONCAT(u.nombre,' ',u.paterno,' ',u.materno) as responsable,u.email as responsable_email,CONCAT(us.nombre,' ',us.paterno,' ',us.materno) as administrador,us.email as administrador_email,
	pp.id,pp.fecha_programado,DATEDIFF(pp.fecha_programado,CURDATE()) as diferencia,pp.monto_reprogramado,IFNULL((SUM(ppd.monto_deposito)), 0),
	ppf.monto_factura
	FROM planpagos pp
	LEFT JOIN planpagodepositos ppd ON pp.id = ppd.planpago_id AND ppd.tipo_deposito = 1
	INNER JOIN contratos c ON pp.contrato_id = c.id
	INNER JOIN productos p ON pp.producto_id = p.id
	INNER JOIN estaciones e ON p.estacion_id = e.id
	INNER JOIN lineas l ON e.linea_id= l.id
	INNER JOIN clientes cl ON c.cliente_id = cl.id
	INNER JOIN usuarios u ON c.responsable_id = u.id 
	INNER JOIN usuarios us ON c.usuario_reg = us.id 
	LEFT JOIN planpagofacturas ppf ON pp.id = ppf.planpago_id
	WHERE (CURDATE()=pp.fecha_programado OR ADDDATE(CURDATE(),INTERVAL 5 DAY)=pp.fecha_programado OR ADDDATE(CURDATE(),INTERVAL 10 DAY)=pp.fecha_programado) and pp.baja_logica = 1 
	AND pp.id NOT IN (SELECT planpago_id FROM envioscorreos WHERE fecha_envio = CURDATE() AND estado = 1)
	GROUP BY pp.id,pp.monto_reprogramado
	HAVING IFNULL((SUM(ppd.monto_deposito)), 0)<pp.monto_reprogramado";
$resul = mysql_query($sql,$link);


$sql3 ="SELECT CONCAT(nombre,' ',paterno,' ',materno) as nombres,email,cargo FROM usuarios WHERE nivel = 4";
$resul3 = mysql_query($sql3,$link);

$html = '';
while ($f = mysql_fetch_assoc($resul)) {
	/*
	Notificacion Clientes, responsable y administrador del sistema
	 */
	$html = '';
	if ($f['diferencia']=='10' ) {
		$motivo = 'Notificacion 10 dias antes de la fecha programada';
	}elseif ($f['diferencia']=='5') {
		$motivo = 'Notificacion 5 dias antes de la fecha programada';
	}elseif ($f['diferencia']=='0') {
		$motivo = 'Notificacion 0 dias antes de la fecha programada';
	}else{
		$motivo = '';
	}
	$html .= '<div>Señor(es),</div>
	<div><b>'.$f['razon_social'].'</b></div>
	<BR>
		<p>La Empresa Estatal de Transporte por Cable "Mi Teleférico", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>
		<div><b>Linea:</b> '.$f['linea'].'</div>
		<div><b>Estación:</b> '.$f['estacion'].'</div>
		<div><b>Nro Contrato:</b> '.$f['contrato'].'</div>
		<div><b>Producto:</b> '.$f['producto'].'</div>
		<div><b>Fecha Programado:</b> '.$f['fecha_programado'].'</div>
		<div><b>Monto Programado Bs.:</b> '.$f['monto_reprogramado'].'</div>
		<BR>
			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>
			<p>Saludos,</p>
			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>';

			$concopia ='';
			$concopia_email = '';

			$remitente = utf8_decode("MI TELEFERICO");
			$remitente_correo = "sistemas@miteleferico.bo";
			$mail = new PHPMailer();
			$mail->IsSMTP(); 	
			$mail->SMTPAuth = true;
			$mail->SMTPSecure = "ssl";
			$mail->Host = "correo.miteleferico.bo";
			$mail->Port = 465;
			$mail->Username = "sistemas@miteleferico.bo";
			$mail->Password = "76KhCgc5";
			$mail->From = $remitente_correo;
			$mail->FromName = $remitente;
			$mail->Subject = utf8_decode("Notificación Pago de Alquiler");
			$mail->MsgHTML(utf8_decode($html));
			$mail->AddAddress($f['correo'], $f['razon_social']);
			if ($f['correo_ref']!='') {
				$mail->AddCC( $f['correo_ref'], $f['nombre_ref']);
				$concopia.=$f['nombre_ref'].',';
				$concopia_email.=$f['correo_ref'].',';
			}
		$mail->AddCC($f['responsable_email'],$f['responsable']); //Responsable del contrato
		$concopia.=$f['responsable'];
		$concopia_email.=$f['responsable_email'];
		// $mail->AddCC($f['administrador_email'],$f['administrador']); //Administrador del sistema
		// $concopia.=$f['administrador'];
		// $concopia_email.=$f['administrador_email'];
		$mail->IsHTML(true);
		if(!$mail->Send()) {
			$sql = "INSERT INTO envioscorreos VALUES ('','".$f['id']."','".$remitente."','".$remitente_correo."','".$f['razon_social']."','".$f['correo']."','".$motivo."','".$html."',0,'".$f['fecha_programado']."','".date("Y-m-d H:i:s")."','".$f['diferencia']."',1,'".$concopia."','".$concopia_email."')";
			$sms = "<strong>Error: </strong>El correo electronico no existe.";
		} else{
			$sql = "INSERT INTO envioscorreos VALUES ('','".$f['id']."','".$remitente."','".$remitente_correo."','".$f['razon_social']."','".$f['correo']."','".$motivo."','".$html."',1,'".$f['fecha_programado']."','".date("Y-m-d H:i:s")."','".$f['diferencia']."',1,'".$concopia."','".$concopia_email."')";
			$sms = "<strong>Exito: </strong>Se envio correctamente. ";
		}
		$resul2 = mysql_query($sql,$link);
		/*
		end notificacion
		 */
		$html .='<hr>';
		/*
		Notificacion GAF
		 */
		if ($f['monto_reprogramado']>$f['monto_factura']) {
			$html .= '<div>Señor,</div>
			<div><b>GERENCIA ADMINISTRATIVA FINANCIARA</b></div>
			<BR>
				<p>Solicitud de factura para el siguiente cliente:</p>
				<div><b>Cliente / Razon Social:</b> '.$f['razon_social'].'</div>
				<div><b>NIT:</b> '.$f['nit'].'</div>
				<div><b>Responsable del Contrato:</b> '.$f['responsable'].'</div>
				<div><b>Linea:</b> '.$f['linea'].'</div>
				<div><b>Estación:</b> '.$f['estacion'].'</div>
				<div><b>Nro Contrato:</b> '.$f['contrato'].'</div>
				<div><b>Producto:</b> '.$f['producto'].'</div>
				<div><b>Fecha Programado:</b> '.$f['fecha_programado'].'</div>
				<div><b>Monto Programado Bs.:</b> '.$f['monto_reprogramado'].'</div>
				<BR>
					<p>Saludos,</p>
					<p><b>GERENCIA DE GESIÓN EMPRESARIAL</b></p>';

					$concopia ='';
					$concopia_email = '';

					$remitente = utf8_decode("MI TELEFERICO");
					$remitente_correo = "sistemas@miteleferico.bo";
					$mail = new PHPMailer();
					$mail->IsSMTP(); 	
					$mail->SMTPAuth = true;
					$mail->SMTPSecure = "ssl";
					$mail->Host = "correo.miteleferico.bo";
					$mail->Port = 465;
					$mail->Username = "sistemas@miteleferico.bo";
					$mail->Password = "76KhCgc5";
					$mail->From = $remitente_correo;
					$mail->FromName = $remitente;
					$mail->Subject = utf8_decode("Solicitud de Facturación");
					$mail->MsgHTML(utf8_decode($html));

					while ($g = mysql_fetch_assoc($resul3)) {
						$mail->AddAddress($g['email'], $g['nombres']);	
					}

		$mail->AddCC($f['responsable_email'],$f['responsable']); //Responsable del contrato
		$concopia.=$f['responsable'];
		$concopia_email.=$f['responsable_email'];
		// $mail->AddCC($f['administrador_email'],$f['administrador']); //Administrador del sistema
		// $concopia.=$f['administrador'];
		// $concopia_email.=$f['administrador_email'];
		$mail->IsHTML(true);
		if(!$mail->Send()) {
			$sms = "<strong>Error: </strong>El correo electronico no existe.";
		} else{
			$sms = "<strong>Exito: </strong>Se envio correctamente. ";
		}
		sleep(5);	
	}
		
		/*
		end notificacion GAF
		 */

	}
echo utf8_decode($html);
mysql_close($link);



// $mail = new PHPMailer();
// $mail->IsSMTP();
// $mail->SMTPAuth = true;
// $mail->SMTPSecure = "ssl";
// $mail->Host = "correo.miteleferico.bo";
// $mail->Port = 465;
// $mail->Username = "rrhh@miteleferico.bo";
// $mail->Password = "recursos442k15";
// $mail->From = "rrhh@miteleferico.bo";
// $mail->FromName = utf8_decode("\"MI TELEFERICO\"");
// $mail->Subject = utf8_decode("Notificación Pago de Alquiler");
// $mail->MsgHTML(utf8_decode($html));
// $mail->AddAddress('fvelasco@miteleferico.bo', 'Juan mamami');
// $mail->AddCC( 'fvelasco@miteleferico.bo', 'Luis Velasco');
// $mail->AddCC( 'luis.freddy.velasco@gmail.com', 'Luis Freddy Velasco');
// $mail->IsHTML(true);
// if(!$mail->Send()) {
// 	$sms = "<strong>Error: </strong>El correo electronico no existe.";
// } else{
// 	$sms = "<strong>Exito: </strong>Revise su correo electronico ".$correo_destinatario.", se le envio la contraseña para postularse. ";
// }


?>
