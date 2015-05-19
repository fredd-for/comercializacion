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
                ->addJs('/assets/js/plugins.js')
                ->addJs('/assets/js/pages/formsValidation.js')
        ;

        $empresa= Empresas::findFirst(array('baja_logica=1'));
        $this->view->setVar('empresa',$empresa);

        //$model = usuarios::find(array('habilitado=1 and nivel=3',"order"=>"paterno ASC"));
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
		//$resul = Clientes::find(array('baja_logica=1', 'order'=>'id ASC'));
        $model = new Clientes();
        $resul = $model->lista();
        $this->view->disable();
        foreach ($resul as $v) {
            $customers[] = array(
                'id' => $v->id,
                'razon_social_href' => '<a href="/clientes/view/'.$v->id.'"><b>'.$v->razon_social.'</b></a>',
                'razon_social' => $v->razon_social,
                'nit' => $v->nit,
                'telefono' => $v->telefono,
                'celular' => $v->celular,
                'correo' => $v->correo,
                'direccion' => $v->direccion,
                'representante_legal' => $v->representante_legal,
                'ci_representante_legal' => $v->ci_representante_legal,
                'celular_representante_legal' => $v->celular_representante_legal,
                'correo_representante_legal' => $v->correo_representante_legal,
                'nombre_ref' => $v->nombre_ref,
                'ci_ref' => $v->ci_ref,
                'celular_ref' => $v->celular_ref,
                'correo_ref' => $v->correo_ref,
                'estado' => $v->estado
            );
        }
        echo json_encode($customers);
	}

    public function listcontratosAction()
    {
        //$resul = Contratos::find(array('baja_logica=1', 'order'=>'fecha_contrato desc'));
        $model = new Contratos();
        $resul = $model->listadocontratos();

        $this->view->disable();
        $customers = array();
        foreach ($resul as $v) {
//            echo "<p>-->".$v->paterno."</p>";
            $customers[] = array(
                'id' => $v->id,
                'contrato' => $v->contrato,
                'cliente_id' => $v->cliente_id,
                'fecha_contrato' => $v->fecha_contrato,
                'descripcion' => $v->descripcion,
                'num_productos' => $v->num_productos,
                'dias_tolerancia' => $v->dias_tolerancia,
                'porcentaje_mora' => $v->porcentaje_mora*100,
                'responsable' =>$v->responsable,
                'responsable_id' => $v->responsable_id,
            );
        }
        echo json_encode($customers);
    }

    public function listcontratosclientesAction($cliente_id)
    {
        $model = new Clientes();
        $resul = $model->listContratosCliente($cliente_id);
        $this->view->disable();
        $customers = array();
        foreach ($resul as $v) {
            if ($v->estado == 'Activo') {
                $estado = '<span class="label label-success">'.$v->estado.'</span>';
            }elseif ($v->estado =='Pasivo') {
                $estado = '<span class="label label-danger">'.$v->estado.'</span>';
            }else{
                $estado = '<span class="label label-primary">'.$v->estado.'</span>';
            }
            $customers[] = array(
                'id' => $v->id,
                'contrato' => '<a href="/contratos/crear/'.$v->id.'">'.$v->contrato.'</a>',
                'cliente_id' => $v->cliente_id,
                'fecha_contrato' => $v->fecha_contrato,
                'descripcion' => $v->descripcion,
                'num_productos' => $v->num_productos,
                'dias_tolerancia' => $v->dias_tolerancia,
                'porcentaje_mora' => $v->porcentaje_mora*100,
                'responsable' =>$v->responsable,
                'responsable_id' => $v->responsable_id,
                'estado' =>'<span class="label label-success">'.$v->estado.'</span>',
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
                // ->addCss('/js/datepicker/datepicker.css')
                ;

        $this->assets
        ->addJs('/assets/js/plugins.js')
        //->addJs('/assets/js/pages/formsValidation.js')
        // ->addJs('/js/datepicker/bootstrap-datepicker.js')
        ;
    }

    public function viewAction($cliente_id)
    {
        
        if ($this->request->isPost()) {
             $resul = Clientes::findFirstById($this->request->getPost('cliente_id'));
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
                    $this->flashSession->success('<b>Exito!</b> Se guardo correctamente');
                }else{
                    $this->flashSession->error('<b>Error!</b> No se a actualizado');    
                }   
        }

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
                ->addJs('/scripts/clientes/view.js')
                ->addJs('/assets/js/plugins.js')
                ->addJs('/assets/js/pages/formsValidation.js')
        ;

        $model = new Contratos();
        $activos = $model->activos($cliente_id);
        $proceso = $model->proceso($cliente_id);
        $concluido = $model->concluido($cliente_id);

        $this->view->setVar('contratos_activos',count($activos));
        $this->view->setVar('contratos_proceso',count($proceso));
        $this->view->setVar('contratos_concluido',count($concluido));

        $contrato_total = $model->totalContrato($cliente_id);
        $deposito_total = $model->depositoTotal($cliente_id);
        $mora_total = $model->moraTotal($cliente_id);

        $this->view->setVar('contratoTotal',$contrato_total[0]->total);
        $this->view->setVar('depositoTotal',$deposito_total[0]->deposito);
        $this->view->setVar('moraTotal',$mora_total[0]->mora);

        

        $resul = Clientes::findFirstById($cliente_id);
        $this->view->setVar('cliente',$resul);
    }

     public function savecontratoAction()
    {
        if (isset($_POST['contrato_id'])) {
            $contrato_id = 0;
            if ($_POST['contrato_id']>0) {
                $resul = Contratos::findFirstById($this->request->getPost('contrato_id'));
                $resul->contrato = $this->request->getPost('contrato');
                $resul->fecha_contrato = date("Y-m-d",strtotime($this->request->getPost('fecha_contrato')));
                $resul->descripcion = $this->request->getPost('descripcion');
                $resul->dias_tolerancia = $this->request->getPost('dias_tolerancia');
                $resul->porcentaje_mora = $this->request->getPost('porcentaje_mora')/100;
                $resul->responsable_id = $this->request->getPost('responsable_id');
                if ($resul->save()) {
                    $contrato_id = $resul->id;
                }
            }
            else{
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
                $resul->dias_tolerancia = $this->request->getPost('dias_tolerancia');
                $resul->porcentaje_mora = $this->request->getPost('porcentaje_mora')/100;
                $resul->responsable_id = $this->request->getPost('responsable_id');
                if ($resul->save()) {
                    $this->flashSession->success("Exito: Registro guardado correctamente...");
                    $contrato_id =$resul->id; 
                }else{
                    $this->flashSession->error("Error: no se guardo el registro...");
                }    
                
            }   
        }
    $this->view->disable();
    echo $contrato_id;
    }

    public function deletecontratoAction(){
        $resul = Contratos::findFirstById($this->request->getPost('id'));
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