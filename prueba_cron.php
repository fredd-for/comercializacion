<?php 
$time = date("d-m-Y G:i:s");
$entry = "Información guardada a las $time.\n";
$file = "/var/www/html/comercializacion/test.cron.txt";
$open = fopen($file,"a");
if ( $open ) {
	fwrite($open,$entry);
	fclose($open);
}
 ?>
