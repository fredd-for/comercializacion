<?php 
/**
* 
*/
class ContratosController extends ControllerBase
{
	
	public function indexAction()
	{
		# code...
	}

	public function crearAction($contrato_id='')
	{
		
		if ($this->request->isPost()) {
			$resul = new Contratos();
			$resul->contrato = $this->request->getPost('contrato');
			$resul->cliente_id = $this->request->getPost('cliente_id');
			$resul->fecha_contrato = date("Y-m-d",strtotime($this->request->getPost('fecha_contrato')));
			$resul->usuario_reg = $this->_user->id;
			$resul->fecha_reg = date("Y-m-d H:i:s");
			$resul->baja_logica = 1;
			$resul->arrendador = $this->request->getPost('arrendador');
			$resul->arrendador_rep_legal = $this->request->getPost('arrendador_rep_legal');
			$resul->arrendador_cargo = $this->request->getPost('arrendador_cargo');
			$resul->descripcion = $this->request->getPost('descripcion');
			if ($resul->save()) {
                $this->flashSession->success("Exito: Registro guardado correctamente...");
                
            }else{
                $this->flashSession->error("Error: no se guardo el registro...");
                $this->response->redirect('/clientes');
            }
		}
			//$this->flashSession->error("Error: no se guardo el registro...");
		$model = new Contratos();
		$contratos = $model->listContrato(10);

		$this->assets
                ->addCss('/jqwidgets/styles/jqx.base.css')
                ->addCss('/jqwidgets/styles/jqx.custom.css')
                //->addCss('/media/plugins/form-stepy/jquery.stepy.css')
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
          //       ->addJs('/media/plugins/form-validation/jquery.validate.min.js')
          //       ->addJs('/media/plugins/form-stepy/jquery.stepy.js')
        		// ->addJs('/media/demo/demo-formwizard.js')
                 ->addJs('/scripts/contratos/crear.js')
                // ->addJs('/assets/js/plugins.js')
                // ->addJs('/assets/js/pages/formsValidation.js')
        ;


	}
}
