<?php 
/**
* 
*/
class SolicitudesController extends ControllerBase
{
	public function indexAction()
	{
		
	}

	public function listAction()
	{
		$this->view->disable();
		$resul = Solicitudes::find(array('baja_logica=1','order'=>'id ASC'));
		foreach ($resul as $v) {
			$customers[] = array(
				'id' => $v->id,
				'nro_solicitud' => $v->nro_solicitud,
				'fecha_envio_recepcion' => $v->fecha_envio_recepcion,
				'fecha_recepcion_solicitud' => $v->fecha_recepcion_solicitud,
				'productos_solicitud' => $v->productos_solicitud,
				'respuesta' => $v->respuesta,
				'fecha_envio_resp' => $v->fecha_envio_resp,
				'fecha_recepcion_resp' => $v->fecha_recepcion_resp,
				'descripcion_resp' => $v->descripcion_resp,
				'fecha_recepcion_solicitud' => $v->fecha_recepcion_solicitud,
				'descripcion_resp' => $v->descripcion_resp,
				'cliente_id' => $v->cliente_id,
				);
		}
		echo json_encode($customers);

	}
}
