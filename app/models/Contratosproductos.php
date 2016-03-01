<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Contratosproductos extends \Phalcon\Mvc\Model
{
	private $_db;
	public function deletePlanPagos()
	{
		$sql = "UPDATE planpagos SET baja_logica = 0 WHERE contratoproducto_id='54'";
		$this->_db = new Contratosproductos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}

}