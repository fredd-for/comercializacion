<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Productos extends \Phalcon\Mvc\Model
{
	private $_db;
	public function lista($sw='',$where1,$group)
	{
		$where = '';
		if ($sw==1) {
			$where = 'AND (p.cantidad-(SELECT COALESCE(SUM(cantidad),0) FROM contratosproductos WHERE producto_id =p.id AND baja_logica =1 AND estado=1))>0';
		}
		$sql="SELECT l.id as linea_id,l.linea,e.estacion,g.grupo,p.*,a.carpeta,a.nombre_archivo,
		(SELECT COALESCE(SUM(cantidad),0) FROM contratosproductos WHERE producto_id =p.id AND baja_logica =1 AND estado=1) as cantidad_alquilada,
		(p.cantidad-(SELECT COALESCE(SUM(cantidad),0) FROM contratosproductos WHERE producto_id =p.id AND baja_logica =1 AND estado=1)) as cantidad_disponible
		FROM productos p
		INNER JOIN grupos g ON p.grupo_id=g.id
		INNER JOIN estaciones e ON p.estacion_id = e.id
		INNER JOIN lineas l ON e.linea_id = l.id
		LEFT JOIN archivos a ON p.id = a.producto_id and a.estado = 1 AND a.baja_logica = 1 AND tabla = 1
		WHERE p.baja_logica = 1 ".$where." ".$where1."   ORDER BY p.id ASC ".$gruop;
		$this->_db = new Productos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}

	public function getProducto($producto_id)
	{
		$sql = "SELECT l.id as linea_id,l.linea,e.estacion,g.grupo,p.*
		FROM productos p
		INNER JOIN grupos g ON p.grupo_id=g.id
		INNER JOIN estaciones e ON p.estacion_id = e.id
		INNER JOIN lineas l ON e.linea_id = l.id
		WHERE p.baja_logica = 1 AND p.id = '$producto_id'";
		$this->_db = new Productos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}

	public function cantidadProductosAlquilados($grupo_id, $linea_id)
	{
		$sql = "SELECT COALESCE(SUM(cp.cantidad),0) as cantidad_alquilada
		FROM productos p
		LEFT JOIN contratosproductos cp ON p.id = cp.producto_id AND cp.baja_logica = 1
		INNER JOIN estaciones e ON e.id = p.estacion_id AND e.baja_logica= 1
		WHERE p.baja_logica = 1 AND p.grupo_id = '$grupo_id' AND e.linea_id = '$linea_id'";
		$this->_db = new Productos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}


    public function cantidadProductos($grupo_id, $linea_id)
    {
    	$sql = "SELECT COALESCE(SUM(p.cantidad),0) as cantidad
    	FROM productos p
    	INNER JOIN estaciones e ON e.id = p.estacion_id AND e.baja_logica= 1
    	WHERE p.baja_logica = 1 AND p.grupo_id = '$grupo_id' AND e.linea_id = '$linea_id'";
    	$this->_db = new Productos();
    	return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
    }


    public function gruposProductosAlquilados($espacio_id, $linea_id)
	{
		$sql = "SELECT COALESCE(SUM(cp.cantidad),0) as cantidad_alquilada
		FROM grupos g
		INNER JOIN productos p ON g.id=p.grupo_id AND p.baja_logica=1
		LEFT JOIN contratosproductos cp ON p.id = cp.producto_id AND cp.baja_logica = 1
		INNER JOIN estaciones e ON e.id = p.estacion_id AND e.baja_logica= 1
		WHERE p.baja_logica = 1 AND g.espacio_id = '$espacio_id' AND e.linea_id = '$linea_id'";
		$this->_db = new Productos();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}


    public function gruposProductos($espacio_id, $linea_id)
    {
    	$sql = "SELECT COALESCE(SUM(p.cantidad),0) as cantidad
    	FROM grupos g
		INNER JOIN productos p ON g.id=p.grupo_id AND p.baja_logica=1
    	INNER JOIN estaciones e ON e.id = p.estacion_id AND e.baja_logica= 1
    	WHERE p.baja_logica = 1 AND g.espacio_id = '$espacio_id' AND e.linea_id = '$linea_id'";
    	$this->_db = new Productos();
    	return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
    }
}