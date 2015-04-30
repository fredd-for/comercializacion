<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Planpagofacturas extends \Phalcon\Mvc\Model
{
	private $_db;	
	
	// public function getdatosverificar($planpago_id,$tipo_deposito)
	// {
	// 	$sql="SELECT pp.*,cp.total, cp.nro_dias,co.dias_tolerancia,porcentaje_mora,MAX(d.fecha_deposito) as fecha,SUM(d.monto_deposito) as deposito
	// 	FROM planpagos pp
	// 	INNER JOIN contratosproductos cp ON pp.contratoproducto_id = cp.id
	// 	INNER JOIN contratos co ON cp.contrato_id = co.id
	// 	INNER JOIN planpagodepositos d ON pp.id=d.planpago_id AND d.baja_logica = 1 AND d.tipo_deposito = '$tipo_deposito'
	// 	WHERE pp.id = '$planpago_id' ";
	// 	$this->_db = new Planpagodepositos();
	// 	return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	// }
}