<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Facturas extends \Phalcon\Mvc\Model
{
	 private $_db;
	public function lista()
	{
		$sql = "SELECT cl.razon_social,cl.nit,g.grupo,l.linea,e.estacion,c.contrato,p.producto,pp.*,DATEDIFF(CURRENT_DATE(),pp.fecha_programado) AS diferencia_dias,ppf.nro_factura
FROM planpagos pp
LEFT JOIN planpagofacturas ppf ON pp.id=ppf.planpago_id AND ppf.baja_logica = 1
INNER JOIN productos p ON pp.producto_id = p.id
INNER JOIN contratos c ON pp.contrato_id = c.id
INNER JOIN clientes cl ON c.cliente_id = cl.id
INNER JOIN grupos g ON p.grupo_id = g.id
INNER JOIN estaciones e ON p.estacion_id = e.id
INNER JOIN lineas l ON e.linea_id = l.id
WHERE planpago_id IS NULL AND DATEDIFF(CURRENT_DATE(),pp.fecha_programado) >='-10'
ORDER BY DATEDIFF(CURRENT_DATE(),pp.fecha_programado) DESC";
		$this->_db = new Facturas();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}

	public function listafacturas()
	{
		$sql = "SELECT cl.razon_social,cl.nit,g.grupo,l.linea,e.estacion,c.contrato,p.producto,pp.*,DATEDIFF(CURRENT_DATE(),pp.fecha_programado) AS diferencia_dias,ppf.id as planpagofactura_id,ppf.fecha_factura,ppf.monto_factura,ppf.nro_factura,ppf.fecha_reg
		FROM planpagos pp
		LEFT JOIN planpagofacturas ppf ON pp.id=ppf.planpago_id AND ppf.baja_logica = 1
		INNER JOIN productos p ON pp.producto_id = p.id
		INNER JOIN contratos c ON pp.contrato_id = c.id
		INNER JOIN clientes cl ON c.cliente_id = cl.id
		INNER JOIN grupos g ON p.grupo_id = g.id
		INNER JOIN estaciones e ON p.estacion_id = e.id
		INNER JOIN lineas l ON e.linea_id = l.id
		WHERE planpago_id IS NOT NULL AND DATEDIFF(CURRENT_DATE(),pp.fecha_programado) >='-10'
		ORDER BY DATEDIFF(CURRENT_DATE(),pp.fecha_programado) DESC";
		$this->_db = new Facturas();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
	
}