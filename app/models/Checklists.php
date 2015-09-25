<?php 
/**
* 
*/
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Checklists extends \Phalcon\Mvc\Model
{
	
	private $_db;
	public function lista($contrato_id)
	{
		$sql= "SELECT pck.*,p.valor_1 as tipo_empresa_text, IF(pck.obligatorio,'SI','NO') as obligatorio_text,IF(pck.escaner,'SI','NO') as escaner_text, COALESCE(ck.cumple,0) as cumple
		FROM parametroschecklists pck
		INNER JOIN parametros p ON pck.tipo_empresa = p.nivel AND p.parametro='checklist_tipoempresas'
		LEFT JOIN checklists ck ON pck.id=ck.parametro_id AND ck.contrato_id='$contrato_id' AND ck.baja_logica=1
		WHERE pck.baja_logica = 1  
		ORDER BY pck.tipo_empresa,pck.parametro";
		$this->_db = new Parametroschecklists();
		return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
	}
}