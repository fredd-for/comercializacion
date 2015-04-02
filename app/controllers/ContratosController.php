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
		
		$tiempo = $this->tag->selectStatic(
        array(
            "tiempo",
            array(
                "Hora" => "Hora",
                "Dia"   => "Dia",
                "Semanal" => "Semanal",
                "Mensual" => "Mensual",
                "Anual" => "Anual",
                ),
            'useEmpty' => true,
            'emptyText' => '(Selecionar)',
            'emptyValue' => '',
            'class' => 'form-control',
            'required' => 'required',
            'title' => 'Campo requerido'
            )
        );
        $this->view->setVar('tiempo', $tiempo);
		
		$model = new Contratos();
		$resul = $model->listContrato($contrato_id);
        $contrato=array();
        foreach ($resul as $v) {
            $contrato = $v;  
        }
        $this->view->setVar('contrato',$contrato);
        
		$this->assets
                ->addCss('/jqwidgets/styles/jqx.base.css')
                ->addCss('/jqwidgets/styles/jqx.custom.css')
                // ->addCss('/js/datepicker/datepicker.css')
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
                // ->addJs('/js/datepicker/bootstrap-datepicker.js')
                
                ->addJs('/scripts/contratos/crear.js')
        ;


	}

    public function listcpAction($contrato_id)
    {
        $model = new Contratos();
        $resul = $model->listcp($contrato_id);
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
}
