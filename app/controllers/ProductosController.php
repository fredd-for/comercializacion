<?php 
/**
* 
*/
class ProductosController extends ControllerBase
{
	
	public function indexAction()
	{
		$this->assets
                ->addCss('/jqwidgets/styles/jqx.base.css')
                ->addCss('/jqwidgets/styles/jqx.custom.css');
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
                ->addJs('/scripts/productos/index.js')
        ;

        // $linea = $this->tag->select(
        //         array(
        //             'linea_id',
        //             Lineas::find(array('baja_logica=1', 'order' => 'id ASC')),
        //             'using' => array('id', "linea"),
        //             'useEmpty' => true,
        //             'emptyText' => '(Selecionar)',
        //             'emptyValue' => '',
        //             'class' => 'form-control',
        //             'required' => 'required',
        //             'title' => 'Campo requerido'
        //         )
        // );

        // $this->view->setVar('linea', $linea);

	}

	public function listAction()
	{
		$model = new Productos();
        $resul = $model->lista();
        $this->view->disable();
        foreach ($resul as $v) {
            $customers[] = array(
                'id' => $v->id,
                'linea' => $v->linea,
                'estacion' => $v->estacion,
                'grupo' => $v->grupo,
                'grupo_id' => $v->grupo_id,
                'linea_id' => $v->linea_id,
                'estacion_id' => $v->estacion_id,
                'producto' => $v->producto,
                'codigo' => $v->codigo,
                'descripcion' => $v->descripcion,
                'precio_unitario' => $v->precio_unitario,
                'cantidad' => $v->cantidad,
                'tiempo' => $v->tiempo
            );
        }
        echo json_encode($customers);
	}
}