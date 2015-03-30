<?php 
/**
* 
*/
class ClientesController extends ControllerBase
{
	
	public function indexAction()
	{
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
                ->addJs('/media/plugins/form-validation/jquery.validate.min.js')
                ->addJs('/media/plugins/form-stepy/jquery.stepy.js')
        		->addJs('/media/demo/demo-formwizard.js')
                ->addJs('/scripts/clientes/index.js')
        ;

	}

	public function listAction()
	{
		$resul = Clientes::find(array('baja_logica=1', 'order'=>'id ASC'));
        $this->view->disable();
        foreach ($resul as $v) {
            $customers[] = array(
                'id' => $v->id,
                'razon_social' => $v->razon_social,
                'nit' => $v->nit,
                'telefono' => $v->telefono,
                'celular' => $v->celular,
                'correo' => $v->correo,
                'direccion' => $v->direccion,
                // 'imagen' => $v->imagen,
                'representante_legal' => $v->representante_legal,
                'ci_representante_legal' => $v->ci_representante_legal,
                'celular_representante_legal' => $v->celular_representante_legal,
                'correo_representante_legal' => $v->correo_representante_legal,
                'nombre_ref' => $v->nombre_ref,
                'ci_ref' => $v->ci_ref,
                'celular_ref' => $v->celular_ref,
                'correo_ref' => $v->correo_ref
            );
        }
        echo json_encode($customers);
	}

    public function saveAction()
    {
        if (isset($_POST['id'])) {
            if ($_POST['id']>0) {
                $resul = Clientes::findFirstById($this->request->getPost('id'));
                $resul->razon_social= $this->request->getPost('razon_social');
                $resul->nit = $this->request->getPost('nit');
                $resul->telefono = $this->request->getPost('telefono');
                $resul->celular = $this->request->getPost('celular');
                $resul->correo = $this->request->getPost('correo');
                $resul->direccion = $this->request->getPost('direccion');
                // $resul->imagen = $this->request->getPost('imagen');
                $resul->representante_legal = $this->request->getPost('representante_legal');
                $resul->ci_representante_legal = $this->request->getPost('ci_representante_legal');
                $resul->celular_representante_legal = $this->request->getPost('celular_representante_legal');
                $resul->correo_representante_legal = $this->request->getPost('correo_representante_legal');
                $resul->nombre_ref = $this->request->getPost('nombre_ref');
                $resul->ci_ref = $this->request->getPost('ci_ref');
                $resul->celular_ref = $this->request->getPost('celular_ref');
                $resul->correo_ref = $this->request->getPost('correo_ref');
                // $resul->usuario_reg = $this->_user->id;
                // $resul->fecha_reg = date("Y-m-d H:i:s");
                // $resul->baja_logica = 1;
                if ($resul->save()) {
                    $msm ='Exito: Se guardo correctamente';
                }else{
                    $msm = 'Error: No se guardo el registro';
                }
            }
            else{
                $resul = new Clientes();
                $resul->razon_social= $this->request->getPost('razon_social');
                $resul->nit = $this->request->getPost('nit');
                $resul->telefono = $this->request->getPost('telefono');
                $resul->celular = $this->request->getPost('celular');
                $resul->correo = $this->request->getPost('correo');
                $resul->direccion = $this->request->getPost('direccion');
                // $resul->imagen = $this->request->getPost('imagen');
                $resul->representante_legal = $this->request->getPost('representante_legal');
                $resul->ci_representante_legal = $this->request->getPost('ci_representante_legal');
                $resul->celular_representante_legal = $this->request->getPost('celular_representante_legal');
                $resul->correo_representante_legal = $this->request->getPost('correo_representante_legal');
                $resul->nombre_ref = $this->request->getPost('nombre_ref');
                $resul->ci_ref = $this->request->getPost('ci_ref');
                $resul->celular_ref = $this->request->getPost('celular_ref');
                $resul->correo_ref = $this->request->getPost('correo_ref');
                $resul->usuario_reg = $this->_user->id;
                $resul->fecha_reg = date("Y-m-d H:i:s");
                $resul->baja_logica = 1;
                if ($resul->save()) {
                    $msm ='Exito: Se guardo correctamente';
                }else{
                    $msm = 'Error: No se guardo el registro';
                }
            }   
        }
    $this->view->disable();
    echo $msm;
    }


    public function deleteAction(){
        $resul = Clientes::findFirstById($this->request->getPost('id'));
        $resul->baja_logica = 0;
        if ($resul->save()) {
                    $msm ='Exito: Se elimino correctamente';
                }else{
                    $msm = 'Error: No se guardo el registro';
                }
        $this->view->disable();
        echo $msm;
    }

    public function addAction()
    {
    	$this->assets
    				->addCss('/media/plugins/form-stepy/jquery.stepy.css')
                    ;

        $this->assets
        ->addJs('/media/plugins/form-validation/jquery.validate.min.js')
        ->addJs('/media/plugins/form-stepy/jquery.stepy.js')
        ->addJs('/media/demo/demo-formwizard.js')       
        ;
    }
}