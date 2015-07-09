<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Solicitudes extends \Phalcon\Mvc\Model
{
	private $_db;
	public function lista()
	{
		$sql="SELECT s.*, CONCAT(COALESCE(u.paterno,' '),' ',COALESCE(u.materno,' '),' ',COALESCE(u.nombre,' ')) as responsable,
		(SELECT COUNT(sp.id) FROM solicitudesproductos sp WHERE sp.baja_logica = 1 AND sp.solicitud_id = s.id) as num_productos,
		cl.razon_social,p.valor_1
		FROM solicitudes s
		INNER JOIN usuarios u ON s.responsable_id = u.id
		INNER JOIN clientes cl ON s.cliente_id = cl.id
		INNER JOIN parametros p ON s.estado = p.nivel AND p.baja_logica = 1
		WHERE s.baja_logica = 1
		ORDER BY s.id DESC ";
		$this->_db = new Solicitudes();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
	public function listSolicitudes($solicitud_id)
	{
		$sql = "SELECT s.*,cl.razon_social,cl.nit,cl.representante_legal,CONCAT(COALESCE(paterno,' '),' ',COALESCE(materno,' '),' ',COALESCE(nombre,' ')) as responsable
		FROM solicitudes s
		INNER JOIN clientes cl ON s.cliente_id=cl.id 
		INNER JOIN usuarios u ON s.responsable_id = u.id
		WHERE s.id='$solicitud_id' AND s.baja_logica=1 LIMIT 1";
		$this->_db = new Solicitudes();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}

	public function solicitudesaprobadas()
	{
		$sql = "SELECT s.id,CONCAT(s.nro_solicitud,' <=> ', cl.razon_social) AS solicitud
		FROM solicitudes s 
		INNER JOIN clientes cl ON s.cliente_id = cl.id 
		WHERE s.baja_logica = 1 and s.estado=2";
		$this->_db = new Solicitudes();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
}