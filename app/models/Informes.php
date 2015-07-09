<?php 

/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Informes extends \Phalcon\Mvc\Model
{
	private $_db;
	
	public function lista()
	{
		$sql = "SELECT * FROM informes i WHERE i.baja_logica=1";
		$this->_db=new Informes();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
}