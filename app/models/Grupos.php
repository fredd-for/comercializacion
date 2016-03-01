<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Grupos extends Phalcon\Mvc\Model
{
	private $_db;
	public function lista()
	{
		$sql="SELECT e.espacio,g.*
		FROM grupos g
		INNER JOIN espacios e ON g.espacio_id=e.id
		WHERE g.baja_logica=1
		ORDER BY g.espacio_id,g.id ASC";
		$this->_db = new Grupos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
}