<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Solicitudesproductos extends \Phalcon\Mvc\Model
{
	private $_db;
	public function lista($solicitud_id)
	{
		$where ='';
		if($solicitud_id>0){
			$where = ' AND sp.solicitud_id = '.$solicitud_id;
		}
		$sql = "SELECT s.nro_solicitud,p.producto,p.codigo,g.grupo,e.estacion,l.linea,sp.*
		FROM solicitudes s
		INNER JOIN solicitudesproductos sp ON s.id = sp.solicitud_id AND sp.baja_logica = 1
		INNER JOIN productos p ON p.id = sp.producto_id 
		INNER JOIN grupos g ON p.grupo_id = g.id
		INNER JOIN estaciones e ON p.estacion_id = e.id
		INNER JOIN lineas l ON e.linea_id = l.id
		WHERE s.baja_logica =1 ".$where;
		$this->_db = new Solicitudesproductos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
	
	
}