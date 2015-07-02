<?php 
/**
* 
*/
class SolicitudesController extends ControllerBase
{
	public function indexAction()
	{
		$this->assets
                ->addCss('/jqwidgets/styles/jqx.base.css')
                ->addCss('/jqwidgets/styles/jqx.custom.css')
                ->addCss('/assets/css/plugins.css')
                // ->addCss('/js/fileinput/css/fileinput.min.css')
                ;
        $this->assets
                ->addJs('/jqwidgets/jqxcore.js')
                ->addJs('/jqwidgets/jqxmenu.js')
                ->addJs('/jqwidgets/jqxdropdownlist.js')
                ->addJs('/jqwidgets/jqxlistbox.js')
                ->addJs('/jqwidgets/jqxcheckbox.js')
                ->addJs('/jqwidgets/jqxscrollbar.js')
                ->addJs('/jqwidgets/jqxgrid.js')
                ->addJs('/jqwidgets/jqxdata.js')
                ->addJs('/jqwidgets/jqxgrid.sort.js')
                ->addJs('/jqwidgets/jqxgrid.pager.js')
                ->addJs('/jqwidgets/jqxgrid.filter.js')
                ->addJs('/jqwidgets/jqxgrid.selection.js')
                ->addJs('/jqwidgets/jqxgrid.grouping.js')
                ->addJs('/jqwidgets/jqxgrid.columnsreorder.js')
                ->addJs('/jqwidgets/jqxgrid.columnsresize.js')
                ->addJs('/jqwidgets/jqxdatetimeinput.js')
                ->addJs('/jqwidgets/jqxcalendar.js')
                ->addJs('/jqwidgets/jqxbuttons.js')
                ->addJs('/jqwidgets/jqxdata.export.js')
                ->addJs('/jqwidgets/jqxgrid.export.js')
                ->addJs('/jqwidgets/globalization/globalize.js')
                ->addJs('/jqwidgets/jqxgrid.aggregates.js')
                ->addJs('/media/plugins/bootbox/bootbox.min.js')
                ->addJs('/jqwidgets/jqxtooltip.js')
                ->addJs('/assets//js/plugins.js')
                ->addJs('/assets/js/app.js')
                ->addJs('/js/app.plugin.js')
                ->addJs('/scripts/solicitudes/index.js')
        ;

        $model = new Usuarios();
        $resul = $model->responsablecomercial();
        $responsable = $this->tag->select(
        	array(
        		'responsable_id',
        		$resul,
        		'using' => array('id', 'nombres'),
        		'useEmpty' => true,
        		'emptyText' => '(Selecionar)',
        		'emptyValue' => '',
        		'class' => 'form-control',
        		'required' => 'required'
        		)
        	);
        $this->view->setVar('responsable',$responsable);

        $resul = Clientes::find(array('baja_logica=1','order' => 'razon_social ASC'));
        $clientes = $this->tag->select(
            array(
                'cliente_id',
                $resul,
                'using' => array('id', 'razon_social'),
                'useEmpty' => true,
                'emptyText' => '(Selecionar)',
                'emptyValue' => '',
                'class' => 'form-control select-chosen',
                'required' => 'required'
                )
            );
        $this->view->setVar('clientes',$clientes);

	}

	public function listAction()
	{
		$this->view->disable();
		$model = new Solicitudes();
		$resul = $model->lista();
		foreach ($resul as $v) {
			$customers[] = array(
				'id' => $v->id,
				'nro_solicitud' => $v->nro_solicitud,
				'fecha_envio_solicitud' => $v->fecha_envio_solicitud.' 00:00:00',
				'fecha_recepcion_solicitud' => $v->fecha_recepcion_solicitud.' 00:00:00',
				'productos_solicitud' => $v->productos_solicitud,
				'respuesta' => $v->respuesta,
				'fecha_envio_resp' => $v->fecha_envio_resp,
				'fecha_recepcion_resp' => $v->fecha_recepcion_resp,
				'descripcion_resp' => $v->descripcion_resp,
				'cliente_id' => $v->cliente_id,
				'razon_social' => $v->razon_social,
				'nit' => $v->nit,
				'responsable_id' => $v->responsable_id,
				'responsable' => $v->responsable,
				'representante' => $v->representante,
				'cargo_representante' => $v->cargo_representante,
				'descripcion_solicitud' => $v->descripcion_solicitud,
				'num_productos' => $v->num_productos,
				'estado' => $v->valor_1,
				);
		}
		echo json_encode($customers);

	}

	public function saveAction()
	{
		if ($this->request->isPost()) {
			$fecha_envio_solicitud = date("Y-m-d",strtotime($this->request->getPost('fecha_envio_solicitud')));
			$fecha_recepcion_solicitud = date("Y-m-d",strtotime($this->request->getPost('fecha_recepcion_solicitud')));
			if ($_POST['id']>0) {
				$resul = Solicitudes::findFirstById($_POST['id']);
				$resul->nro_solicitud = $this->request->getPost('nro_solicitud');
				$resul->fecha_envio_solicitud = $fecha_envio_solicitud;
				$resul->fecha_recepcion_solicitud = $fecha_recepcion_solicitud;
				$resul->responsable_id = $this->request->getPost('responsable_id');
				$resul->representante = $this->request->getPost('representante');
				$resul->cargo_representante = $this->request->getPost('cargo_representante');
				$resul->descripcion_solicitud = $this->request->getPost('descripcion_solicitud');
				$resul->cliente_id = $this->request->getPost('cliente_id');
				if ($resul->save()) {
					$msm = 'Exito: Se guardo correctamente';
				}else{
					$msm = 'Error: No se guardo el registro';
				}
			}
			else{
				$resul = new Solicitudes();
				$resul->nro_solicitud = $this->request->getPost('nro_solicitud');
				$resul->fecha_envio_solicitud = $fecha_envio_solicitud;
				$resul->fecha_recepcion_solicitud = $fecha_recepcion_solicitud;
				$resul->responsable_id = $this->request->getPost('responsable_id');
				$resul->representante = $this->request->getPost('representante');
				$resul->cargo_representante = $this->request->getPost('cargo_representante');
				$resul->descripcion_solicitud = $this->request->getPost('descripcion_solicitud');
				$resul->cliente_id = $this->request->getPost('cliente_id');
				$resul->usuario_reg = $this->_user->id;
				$resul->fecha_reg = date("Y-m-d H:i:s");
				$resul->baja_logica = 1;
				$resul->estado = 1;
				if ($resul->save()) {
					$msm = 'Exito: Se guardo correctamente';
				}else{
					$msm = 'Error: No se guardo el registro';
				}
			}   
		}
		$this->view->disable();
		echo $msm;
	}

	public function deleteAction(){
        $resul = Solicitudes::findFirstById($this->request->getPost('id'));
        $resul->baja_logica = 0;
        if ($resul->save()) {
                    $msm ='Exito: Se elimino correctamente';
                }else{
                    $msm = 'Error: No se guardo el registro';
                }
        $this->view->disable();
        echo $msm;
    }
}
