<?php 
require_once('app/libs/phpmailer/class.phpmailer.php');
require_once('app/libs/phpmailer/class.smtp.php');
for ($i=1; $i < 5  ; $i++) { 
	$mail = new PHPMailer();
$mail->IsSMTP();
$mail->SMTPAuth = true;
$mail->SMTPSecure = "ssl";
$mail->Host = "correo.miteleferico.bo";
$mail->Port = 465;
$mail->Username = "sistemas@miteleferico.bo";
$mail->Password = "76KhCgc5";
$mail->From = "sistemas@miteleferico.bo";
$mail->FromName = "Don Ramon";
$mail->Subject = utf8_decode("Notificación Pago de Alquiler");
$mail->MsgHTML('<h1>hola</h1>');
$mail->AddAddress('fvelasco@miteleferico.bo', 'Freddy Velasco');
// $mail->AddCC( 'fvelasco@miteleferico.bo', 'Luis Velasco');
// $mail->AddCC( 'luis.freddy.velasco@gmail.com', 'Luis Freddy Velasco');
$mail->IsHTML(true);
if(!$mail->Send()) {
	$sms = "<strong>Error: </strong>El correo electronico no existe.";
} else{
	$sms = "<br>".$i."<strong>Exito: </strong>Revise su correo electronico ".$correo_destinatario.", se le envio la contraseña para postularse. ".date("H:i:s");
}

echo $sms;		
// sleep(10);
}


?>