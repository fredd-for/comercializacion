<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Productos extends \Phalcon\Mvc\Model
{
	private $_db;
	public function lista()
	{
		$sql="SELECT l.linea,e.estacion,g.grupo,p.*
		FROM productos p
		INNER JOIN grupos g ON p.grupo_id=g.id
		INNER JOIN estaciones e ON p.estacion_id = e.id
		INNER JOIN lineas l ON e.linea_id = l.id
		WHERE p.baja_logica = 1 ORDER BY p.id ASC";
		$this->_db = new Cargos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
}