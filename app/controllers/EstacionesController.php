<?php 
/**
* 
*/
class EstacionesController extends ControllerBase
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
        ->addJs('/scripts/estaciones/index.js')
        ->addJs('/assets/js/plugins.js')
        ->addJs('/assets/js/pages/formsValidation.js')
        ;

        $linea = $this->tag->select(
            array(
                'linea_id',
                Lineas::find(array('baja_logica=1','order'=>'id ASC')),
                'using' => array('id', 'linea'),
                'useEmpty' => true,
                'emptyText' => '(Selecionar)',
                'emptyValue' => '',
                'class' => 'form-control'
                )
            );
        $this->view->setVar('linea',$linea);
    }

    public function listAction()
    {
      $model = new Estaciones();
      $resul = $model->lista();
      $this->view->disable();
      foreach ($resul as $v) {
        $customers[] = array(
            'id' => $v->id,
            'linea_id' => $v->linea_id,
            'linea' => $v->linea,
            'estacion' => $v->estacion,
            );
    }
    echo json_encode($customers);
}


public function saveAction()
{
    if (isset($_POST['id'])) {
        if ($_POST['id']>0) {
            $resul = Estaciones::findFirstById($this->request->getPost('id'));
            $resul->linea_id= $this->request->getPost('linea_id');
            $resul->estacion = $this->request->getPost('estacion');
            if ($resul->save()) {
                $msm ='Exito: Se guardo correctamente';
            }else{
                $msm = 'Error: No se guardo el registro';
            }
        }
        else{
            $resul = new Estaciones();
            $resul->linea_id= $this->request->getPost('linea_id');
            $resul->estacion = $this->request->getPost('estacion');
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
    $resul = Estaciones::findFirstById($this->request->getPost('id'));
    $resul->baja_logica = 0;
    if ($resul->save()) {
        $msm ='Exito: Se elimino correctamente';
    }else{
        $msm = 'Error: No se guardo el registro';
    }
    $this->view->disable();
    echo $msm;
}

public function pruebaAction()
{
    $password = hash_hmac('sha256', 'tpinaya741', '2, 4, 6, 7, 9, 15, 20, 23, 25, 30');
    echo $password;
}

}