<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Contratos extends \Phalcon\Mvc\Model
{
	public function listContrato($contrato_id)
	{
		$sql = "SELECT co.*,cl.razon_social,cl.nit,cl.representante_legal
		FROM contratos co
		INNER JOIN clientes cl ON co.cliente_id=cl.id 
		WHERE co.id='$contrato_id' LIMIT 1";
		$this->_db = new Contratos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}

	public function listcp($contrato_id)
	{
		$sql = "SELECT l.linea, e.estacion,p.producto,c.contrato,cp.*
		FROM contratosproductos cp 
		INNER JOIN contratos c ON cp.contrato_id=c.id
		INNER JOIN productos p	ON cp.producto_id = p.id
		INNER JOIN estaciones e ON p.estacion_id = e.id
		INNER JOIN lineas l ON e.linea_id = l.id
		WHERE cp.baja_logica=1 AND cp.contrato_id='$contrato_id' 
		ORDER BY fecha_fin ASC";
		$this->_db = new Contratos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));			
	}	
}