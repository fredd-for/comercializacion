<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Planpagodepositos extends \Phalcon\Mvc\Model
{
	private $_db;	
	public function listadodeposito($planpago_id)
	{
		$sql = "SELECT pp.id,pp.contratoproducto_id,pp.fecha_programado,pp.monto_programado,pp.mora,pp.dias_atraso,d.id as planpagodeposito_id,d.fecha_deposito,d.nro_deposito,d.monto_deposito,d.tipo_deposito
		FROM planpagos pp
		LEFT JOIN planpagodepositos d ON pp.id=d.planpago_id AND d.baja_logica = 1
		WHERE pp.id = '$planpago_id'
		ORDER BY pp.fecha_programado, d.fecha_deposito";
		$this->_db = new Planpagodepositos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
	public function listadepositos($contratoproducto_id)
	{
		$sql = "SELECT *, 
		(SELECT SUM(monto_deposito) FROM planpagodepositos WHERE planpago_id=pp.id AND tipo_deposito = 1 AND baja_logica = 1) as deposito
		FROM planpagos pp
		WHERE pp.contratoproducto_id = '$contratoproducto_id' and pp.baja_logica = 1
		ORDER BY pp.fecha_programado ";
		$this->_db = new Planpagodepositos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));	
	}

	public function getdatosverificar($planpago_id,$tipo_deposito)
	{
		$sql="SELECT pp.*,cp.total, cp.nro_dias,co.dias_tolerancia,porcentaje_mora,MAX(d.fecha_deposito) as fecha,SUM(d.monto_deposito) as deposito
		FROM planpagos pp
		INNER JOIN contratosproductos cp ON pp.contratoproducto_id = cp.id
		INNER JOIN contratos co ON cp.contrato_id = co.id
		INNER JOIN planpagodepositos d ON pp.id=d.planpago_id AND d.baja_logica = 1 AND d.tipo_deposito = '$tipo_deposito'
		WHERE pp.id = '$planpago_id' ";
		$this->_db = new Planpagodepositos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
}