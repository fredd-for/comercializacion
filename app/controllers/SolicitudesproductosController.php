<?php 
/**
* 
*/
class SolicitudesproductosController extends ControllerBase
{
	
	public function indexAction()
	{

	}

     
    
    public function listAction()
    {
        $model = new Solicitudesproductos();
        $resul = $model->lista();
        $this->view->disable();
        $customers = array();
        foreach ($resul as $v) {
            $customers[] = array(
                'id' => $v->id,
                'solicitud_id' => $v->solicitud_id,
                'producto_id' => $v->producto_id,
                'grupo' => $v->grupo,
                'linea' => $v->linea,
                'estacion' => $v->estacion,
                'producto' => $v->producto,
                'precio_unitario' => $v->precio_unitario,
                'tiempo' =>$v->tiempo,
                'cantidad' => $v->cantidad,
            );
        }
        echo json_encode($customers);
    }

	
}
