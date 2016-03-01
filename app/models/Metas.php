<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Metas extends Phalcon\Mvc\Model
{
	private $_db;
	// public function lista()
	// {
	// 	$sql="SELECT e.*,l.linea
	// 	FROM estaciones e
	// 	INNER JOIN lineas l ON e.linea_id = l.id
	// 	WHERE e.baja_logica = 1 
	// 	ORDER BY id ASC";
	// 	$this->_db = new Estaciones();
	// 	return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	// }

	public function gestiones()
	{
		$sql="SELECT DISTINCT(YEAR(fecha_contrato)) as gestion FROM contratos ORDER BY gestion DESC";
		$this->_db = new Metas();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}

}