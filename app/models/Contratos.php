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
		$sql = "SELECT co.*,cl.razon_social,cl.nit,cl.representante_legal
		FROM contratos co
		INNER JOIN clientes cl ON co.cliente_id=cl.id 
		WHERE co.id='$contrato_id' LIMIT 1";
		$this->_db = new Contratos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));			
	}	
}