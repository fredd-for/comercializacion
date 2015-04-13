<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Planpagos extends \Phalcon\Mvc\Model
{
	private $_db;
	public function lista()
	{
		$sql="SELECT cl.razon_social,c.cliente_id,c.contrato,c.fecha_contrato,c.descripcion,p.producto,p.codigo,g.grupo,e.estacion,l.linea,
		cp.*
		FROM contratos c
		INNER JOIN clientes cl ON c.cliente_id = cl.id
		INNER JOIN contratosproductos cp ON c.id = cp.contrato_id
		INNER JOIN productos p ON p.id = cp.producto_id 
		INNER JOIN grupos g ON p.grupo_id = g.id
		INNER JOIN estaciones e ON p.estacion_id = e.id
		INNER JOIN lineas l ON e.linea_id = l.id
		WHERE c.baja_logica =1 AND cp.baja_logica = 1";
		$this->_db = new Planpagos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
}