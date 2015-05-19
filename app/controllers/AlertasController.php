<?php 
/**
* 
*/
class AlertasController extends ControllerBase
{
    
    public function indexAction()
    {
        $this->assets
                ->addCss('/jqwidgets/styles/jqx.base.css')
                ->addCss('/jqwidgets/styles/jqx.custom.css')
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
                ->addJs('/media/plugins/bootbox/bootbox.min.js')
                ->addJs('/jqwidgets/jqxtooltip.js')
                // ->addJs('/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js')
                // ->addJs('/media/plugins/form-validation/jquery.validate.min.js')
                // ->addJs('/assets/js/plugins.js')
                // ->addJs('/assets/js/pages/formsValidation.js')
                
                ->addJs('/scripts/alertas/index.js')
        ;
    }

    public function listAction()
    {   $this->view->disable();
        $model = new Facturas();
        $resul = $model->lista();
        $customers = array();
        foreach ($resul as $v) {
            //echo 'ver =>'.$v->id;
            $customers[] = array(
                'id' => $v->id,
                'razon_social' => $v->razon_social,
                'nit' => $v->nit,
                'grupo' => $v->grupo,
                'linea' => $v->linea,
                'estacion' => $v->estacion,
                'contrato' => $v->contrato,
                'producto' => $v->producto,
                'fecha_programado' => $v->fecha_programado.' 00:00:00',
                'monto_reprogramado' => $v->monto_reprogramado,
                'diferencia_dias' => $v->diferencia_dias,
            );
        }
        echo json_encode($customers);
        
    }

    public function listcontratosAction()
    {   $this->view->disable();
        $model = new Facturas();
        $resul = $model->listacontratos();
        $customers = array();
        foreach ($resul as $v) {
            //echo 'ver =>'.$v->id;
            $customers[] = array(
                'id' => $v->id,
                'razon_social' => $v->razon_social,
                'nit' => $v->nit,
                'grupo' => $v->grupo,
                'linea' => $v->linea,
                'estacion' => $v->estacion,
                'contrato' => $v->contrato,
                'producto' => $v->producto,
                'fecha_fin' => $v->fecha_fin,
                'diferencia_dias' => $v->diferencia_dias,
            );
        }
        echo json_encode($customers);
        
    }
    
}