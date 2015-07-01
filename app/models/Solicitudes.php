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
		$sql="SELECT s.*, CONCAT(COALESCE(u.paterno,' '),' ',COALESCE(u.materno,' '),' ',COALESCE(u.nombre,' ')) as responsable,
		(SELECT COUNT(sp.id) FROM solicitudesproductos sp WHERE sp.baja_logica = 1 AND sp.solicitud_id = s.id) as num_productos,
		cl.razon_social
		FROM solicitudes s
		INNER JOIN usuarios u ON s.responsable_id = u.id
		INNER JOIN clientes cl ON s.cliente_id = cl.id
		WHERE s.baja_logica = 1
		ORDER BY s.id DESC ";
		$this->_db = new Solicitudes();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}

}