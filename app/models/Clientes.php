<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Clientes extends \Phalcon\Mvc\Model
{
	private $_db;
	public function lista()
		{
			$sql = "SELECT *, (
				SELECT IF(COUNT(cp.id)>0,'Activo','Pasivo')
				FROM contratos c
				INNER JOIN contratosproductos cp ON c.id = cp.contrato_id AND cp.baja_logica=1
				WHERE c.cliente_id=cl.id AND c.baja_logica = 1 AND CURDATE() <= cp.fecha_fin
				) as estado
	FROM clientes cl
	WHERE cl.baja_logica = 1";
	$this->_db = new Clientes();
	return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
}	
}