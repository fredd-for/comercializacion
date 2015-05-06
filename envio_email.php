<?php 
include("conexion/conexion.php");
require_once('app/libs/phpmailer/class.phpmailer.php');
require_once('app/libs/phpmailer/class.smtp.php');
$sql = "SELECT l.linea,e.estacion,c.contrato,p.producto,p.codigo,cl.razon_social,cl.correo,cl.representante_legal,cl.correo_representante_legal,cl.nombre_ref,cl.correo_ref,
CONCAT(u.nombre,' ',u.paterno,' ',u.materno) as responsable,u.email as responsable_email,CONCAT(us.nombre,' ',us.paterno,' ',us.materno) as administrador,us.email as administrador_email,
pp.id,pp.fecha_programado,DATEDIFF(pp.fecha_programado,CURDATE()) as diferencia,pp.monto_reprogramado,IFNULL((SUM(ppd.monto_deposito)), 0)
FROM planpagos pp
LEFT JOIN planpagodepositos ppd ON pp.id = ppd.planpago_id AND ppd.tipo_deposito = 1
INNER JOIN contratos c ON pp.contrato_id = c.id
INNER JOIN productos p ON pp.producto_id = p.id
INNER JOIN estaciones e ON p.estacion_id = e.id
INNER JOIN lineas l ON e.linea_id= l.id
INNER JOIN clientes cl ON c.cliente_id = cl.id
INNER JOIN usuarios u ON c.responsable_id = u.id 
INNER JOIN usuarios us ON c.usuario_reg = us.id 
WHERE (CURDATE()=pp.fecha_programado OR ADDDATE(CURDATE(),INTERVAL 5 DAY)=pp.fecha_programado OR ADDDATE(CURDATE(),INTERVAL 10 DAY)=pp.fecha_programado) and pp.baja_logica = 1 
GROUP BY pp.id,pp.monto_reprogramado
HAVING IFNULL((SUM(ppd.monto_deposito)), 0)<pp.monto_reprogramado
";
$resul = mysql_query($sql,$link);
$html = '';
while ($f = mysql_fetch_assoc($resul)) {
	if ($f['diferencia']=='10') {
		$html .= '<div>Señor(es),</div>
		<div><b>'.$f['razon_social'].'</b></div>
		<BR>
		<p>La Empresa Estatal de Transporte por Cable "Mi Teleférico", le comunica que tiene que realizar el deposito del alquiler del siguiente producto</p>
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
		$remitente = utf8_decode("\"MI TELEFERICO\"");
		$remitente_correo = "rrhh@miteleferico.bo";
		$mail = new PHPMailer();
		$mail->IsSMTP();
		$mail->SMTPAuth = true;
		$mail->SMTPSecure = "ssl";
		$mail->Host = "correo.miteleferico.bo";
		$mail->Port = 465;
		$mail->Username = "rrhh@miteleferico.bo";
		$mail->Password = "recursos442k15";
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
		$concopia.=$f['responsable'].',';
		$concopia_email.=$f['responsable_email'].',';
		$mail->AddCC($f['administrador_email'],$f['administrador']); //Administrador del sistema
		$concopia.=$f['administrador'];
		$concopia_email.=$f['administrador_email'];
		$mail->IsHTML(true);
		if(!$mail->Send()) {
			$sql = "INSERT INTO envioscorreos VALUES ('',1,$remitente,$remitente_correo,$f['razon_social'],$f['correo'],'Notificacion 10 dias antes de la fecha programada',$html,1,$f['fecha_programado'],CURDATE(),$f['diferencia'],1,$concopia,$concopia_email)";
			$sms = "<strong>Error: </strong>El correo electronico no existe.";
		} else{
			$sql = "INSERT INTO envioscorreos VALUES ('',1,$remitente,$remitente_correo,$f['razon_social'],$f['correo'],'Notificacion 10 dias antes de la fecha programada',$html,1,$f['fecha_programado'],CURDATE(),$f['diferencia'],0,$concopia,$concopia_email)";
			$sms = "<strong>Exito: </strong>Revise su correo electronico ".$correo_destinatario.", se le envio la contraseña para postularse. ";
		}
		$resul2 = mysql_query($sql,$link);
	}
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
// $mail->AddAddress($correo_destinatario, $destinatario);
// $mail->AddCC( 'fvelasco@miteleferico.bo', 'Luis Velasco');
// $mail->AddCC( 'luis.freddy.velasco@gmail.com', 'Luis Freddy Velasco');
// $mail->IsHTML(true);
// if(!$mail->Send()) {
// 	$sms = "<strong>Error: </strong>El correo electronico no existe.";
// } else{
// 	$sms = "<strong>Exito: </strong>Revise su correo electronico ".$correo_destinatario.", se le envio la contraseña para postularse. ";
// }


?>