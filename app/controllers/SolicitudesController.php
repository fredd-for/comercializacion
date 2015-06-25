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
                // ->addJs('/media/plugins/form-validation/jquery.validate.min.js')
                // ->addJs('/media/plugins/form-stepy/jquery.stepy.js')
        		// ->addJs('/media/demo/demo-formwizard.js')
                ->addJs('/scripts/solicitudes/index.js')
                // ->addJs('/assets/js/plugins.js')
                // ->addJs('/js/datepicker/bootstrap-datepicker.js')
                // ->addJs('/assets/js/pages/formsValidation.js')
                // ->addJs('/js/fileinput/js/fileinput.min.js')
                // ->addJs('/scripts/productos/galeria.js')
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

	public function saveAction()
	{
		if ($this->request->isPost()) {
			$fecha_envio_solicitud = date("Y-m-d",strtotime($this->request->getPost('fecha_envio_solicitud')));
			$fecha_recepcion_solicitud = date("Y-m-d",strtotime($this->request->getPost('fecha_recepcion_solicitud')));
			if ($_POST['solicitud_id']>0) {
				$resul = Solicitudes::findFirstById($_POST['solicitud_id']);
				$resul->nro_solicitud = $this->request->getPost('nro_solicitud');
				$resul->fecha_envio_solicitud = $fecha_envio_solicitud;
				$resul->fecha_recepcion_solicitud = $fecha_recepcion_solicitud;
				$resul->responsable_id = $this->request->getPost('responsable_id');
				$resul->representante = $this->request->getPost('representante');
				$resul->cargo_representante = $this->request->getPost('cargo_representante');
				$resul->descripcion_solicitud = $this->request->getPost('descripcion_solicitud');
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
				$resul->cliente_id = date("Y-m-d H:i:s");
				$resul->baja_logica = 1;
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
}
