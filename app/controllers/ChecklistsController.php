<?php 
/**
* 
*/
class ChecklistsController extends ControllerBase
{
	
	public function indexAction($contrato_id=0)
	{
	
       $this->assets
                ->addCss('/jqwidgets/styles/jqx.base.css')
                ->addCss('/jqwidgets/styles/jqx.custom.css')
                ->addCss('/assets/css/plugins.css')
                ->addCss('/js/fileinput/css/fileinput.min.css')
                //->addCss('/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css')
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
                ->addJs('/jqwidgets/jqxgrid.edit.js')
                ->addJs('/media/plugins/bootbox/bootbox.min.js')
                ->addJs('/jqwidgets/jqxtooltip.js')
                ->addJs('/assets//js/plugins.js')
                ->addJs('/assets/js/app.js')
                ->addJs('/js/fileinput/js/fileinput.min.js')
                ->addJs('/js/fileinput/js/fileinput_locale_es.js')
                // ->addJs('/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js')
                // ->addJs('/media/plugins/form-validation/jquery.validate.min.js')
                // ->addJs('/assets/js/pages/formsValidation.js')
                
                ->addJs('/scripts/checklists/index.js')
        ;




        $this->assets
                ->addCss('/assets/css/widget_galeria.css')
                ->addCss('/js/fileinput/css/fileinput.min.css')
                ;
            $this->assets
                ->addJs('/assets/js/app.js')
                ->addJs('/assets/js/plugins.js')
                ->addJs('/scripts/productos/galeria.js')
                ->addJs('/js/fileinput/js/fileinput.min.js')
                ->addJs('/js/fileinput/js/fileinput_locale_es.js')
            ;

         $resul = Contratos::findFirstById($contrato_id);
         $this->view->setVar('contrato_id',$resul->id);
         $this->view->setVar('cliente_id',$resul->cliente_id);
   

    }

    public function listAction($contrato_id)
    {
      $model = new Checklists();
      $resul = $model->lista($contrato_id);
      $this->view->disable();
      foreach ($resul as $v) {
        $customers[] = array(
            'id' => $v->id,
            'parametro' => $v->parametro,
            'abreviado' => $v->abreviado,
            'tipo_empresa' =>$v->tipo_empresa,
            'tipo_empresa_text' =>$v->tipo_empresa_text,
            'obligatorio' =>$v->obligatorio,
            'obligatorio_text' =>$v->obligatorio_text,
            'escaner' =>$v->escaner,
            'escaner_text' =>$v->escaner_text,
            'clase' =>$v->clase,
            'cumple' =>$v->cumple,
            'accion' => '<a class="btn btn-xs btn-warning" onclick="add_archivo()" title="Adicionar Archivo"><i class="fa fa-pencil"></i></a>',
            );
    }
    echo json_encode($customers);
}


public function savecumpleAction()
{
    if (isset($_POST['parametro_id'])) {
        $contrato_id = $_POST['contrato_id'];
        $parametro_id = $_POST['parametro_id'];

        $model = Checklists::findFirst(array('contrato_id='.$contrato_id.' AND parametro_id='.$parametro_id.' and baja_logica=1'));
        // $cumple = 0;
        if ($this->request->getPost('cumple')=="true") {
            $cumple = 1;
        }else{
            $cumple = 0;
        }
        if ($model!=false) {
            $model->tipo_empresa = $this->request->getPost('tipo_empresa');
            $model->parametro = $this->request->getPost('parametro');
            $model->cumple = $cumple;
            if ($model->save()) {
                $msm ='Exito: Se guardo correctamente';
            }else{
                $msm = 'Error: No se guardo el registro';
            }
        }else{
            $resul = new Checklists();
            $resul->contrato_id = $contrato_id;
            $resul->parametro_id = $parametro_id;
            $resul->tipo_empresa = $this->request->getPost('tipo_empresa');
            $resul->parametro = $this->request->getPost('parametro');
            $resul->cumple = $cumple;
            $resul->observacion = '';
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

// public function deleteAction(){
//     $resul = Estaciones::findFirstById($this->request->getPost('id'));
//     $resul->baja_logica = 0;
//     if ($resul->save()) {
//         $msm ='Exito: Se elimino correctamente';
//     }else{
//         $msm = 'Error: No se guardo el registro';
//     }
//     $this->view->disable();
//     echo $msm;
// }


}