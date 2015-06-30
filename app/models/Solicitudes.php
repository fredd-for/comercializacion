<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Solicitudes extends Phalcon\Mvc\Model
{
	private $_db;
	public function lista()
	{
		$sql="SELECT s.*,cl.razon_social,cl.nit,cl.representante_legal
		FROM solicitudes s 
		INNER JOIN clientes cl ON s.cliente_id = cl.id
		WHERE s.baja_logica = 1";
		$this->_db = new Solicitudes();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}

}