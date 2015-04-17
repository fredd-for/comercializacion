<?php 
/**
* 
*/
class PlanpagosController extends ControllerBase
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
        ->addJs('/jqwidgets/jqxtooltip.js')
        ->addJs('/scripts/planpagos/index.js')
        ->addJs('/media/plugins/bootbox/bootbox.min.js')
        ;

    }

    public function listAction()
    {
      $model = new Planpagos();
      $resul = $model->lista();
      $this->view->disable();
      foreach ($resul as $v) {
        $customers[] = array(
            'id' => $v->id,
            'grupo' => $v->grupo,
            'razon_social' => $v->razon_social,
            'linea' => $v->linea,
            'estacion' => $v->estacion,
            'producto' => $v->producto,
            'contrato' => $v->contrato,
            'fecha_contrato' => $v->fecha_contrato,
            'precio_unitario' => $v->precio_unitario,
            'fecha_inicio' => $v->fecha_inicio,
            'fecha_fin' => $v->fecha_fin,
            'monto_mora' => 250,
            'monto_mes' => 1500,
            'monto_cobrar' => 2530
            );
    }
    echo json_encode($customers);
}

public function controlAction($contratoproducto_id)
{
    $cp = Contratosproductos::findFirstById($contratoproducto_id);
    if ($cp != false) {
        $resul = Planpagos::find(array("baja_logica = 1 and contratoproducto_id = ".$contratoproducto_id, 'order'=>'fecha_programado ASC'));

        $this->view->setVar('planpago',$resul);
        $this->view->setVar('contratoproducto_id',$contratoproducto_id);        

        $garantia = Garantias::findFirst(array('baja_logica=1 and tipo=1 and contratoproducto_id = '.$contratoproducto_id, 'order'=>'tipo ASC'));
        $this->view->setVar('garantia',$garantia);

        $derechollave = Garantias::findFirst(array('baja_logica=1 and tipo=2 and contratoproducto_id = '.$contratoproducto_id, 'order'=>'tipo ASC'));
        $this->view->setVar('derechollave',$derechollave);    
        $this->assets
        ->addJs('/scripts/planpagos/control.js')            
        ;
    }else{
        $this->response->redirect('/');
    }

}

public function savedepositoAction()
{
    $html = '
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
';
    //$AddEdit_derechollave = 'add_derechollave';
    if (isset($_POST['planpago_id'])) {
        if ($_POST['planpago_id']>0) {
         $fecha_deposito = date("Y-m-d",strtotime($this->request->getPost('fecha_deposito')));
         $resul = Planpagos::findFirstById($_POST['planpago_id']);
         $resul->fecha_deposito = $fecha_deposito;
         $resul->nro_deposito = $this->request->getPost('nro_deposito');
         $resul->monto_deposito = $this->request->getPost('monto_deposito');
             if ($resul->save()) {
                $msm = 'Exito: Se guardo correctamente';
                $fecha_deposito_mora = '';
                $fecha_deposito =date("d-m-Y",strtotime($resul->fecha_deposito));
                if ($resul->fecha_deposito_mora != null) {
                    $fecha_deposito_mora = date("d-m-Y",strtotime($resul->fecha_deposito_mora));
                }

                $html = '
                <td>'.$resul->id.'</td>
                <td>'.date("d-m-Y",strtotime($resul->fecha_programado)).'</td>
                <td>'.$resul->monto_programado.'</td>
                <td>'.$resul->nro_deposito.'</td>
                <td>'.$fecha_deposito.'</td>
                <td>'.$resul->monto_deposito.'</td>
                <td>'.$resul->dias_atraso.'</td>
                <td>'.$resul->mora.'</td>
                <td>'.$resul->nro_deposito_mora.'</td>
                <td>'.$resul->fecha_deposito_mora.'</td>
                <td>'.$resul->monto_deposito_mora.'</td>
                <td class="text-center">
                    <div class="btn-group btn-group-xs">
                        <a href="javascript:void(0)" data-toggle="tooltip" title="Realizar deposito" class="btn btn-default reg_deposito" planpago_id ="'.$resul->id.'" fecha_programado ="'.date("Y-m-d",strtotime($resul->fecha_programado)).'" monto_programado ="'.$resul->monto_programado.'" nro_deposito ="'.$resul->nro_deposito.'" fecha_deposito ="'.$fecha_deposito.'" monto_deposito ="'.$resul->monto_deposito.'"><i class="fa fa-pencil"></i></a>

                        <a href="javascript:void(0)" data-toggle="tooltip" title="Delete" class="btn btn-danger"><i class="fa fa-times"></i></a>
                    </div>
                </td>
                ';

            }else{
                $msm = 'Error: No se guardo el registro';
            }
        }
    }

$this->view->disable();
echo $html;
}

public function savederechollaveAction()
{
    $garantia_id = '';
    $fecha_deposito = '';
    $nro_deposito = '';
    $monto_deposito = '';
    $AddEdit_derechollave = 'add_derechollave';
    if (isset($_POST['garantia_id'])) {
        if ($_POST['garantia_id']>0) {
         $fecha_deposito = date("Y-m-d",strtotime($this->request->getPost('fecha_deposito')));
         $resul = Garantias::findFirstById($_POST['garantia_id']);
         $resul->fecha_deposito = $fecha_deposito;
         $resul->nro_deposito = $this->request->getPost('nro_deposito');
         $resul->monto_deposito = $this->request->getPost('monto_deposito');
         if ($resul->save()) {
            $msm = 'Exito: Se guardo correctamente';
            $garantia_id = $resul->id;
            $fecha_deposito = date("d-m-Y",strtotime($resul->fecha_deposito));
            $nro_deposito = $resul->nro_deposito;
            $monto_deposito = $resul->monto_deposito;
            $AddEdit_derechollave = 'edit_derechollave';

        }else{
            $msm = 'Error: No se guardo el registro';
        }
    }
    else{
        $fecha_deposito = date("Y-m-d",strtotime($this->request->getPost('fecha_deposito')));
        $resul = new Garantias();
        $resul->contratoproducto_id = $this->request->getPost('contratoproducto_id');
        $resul->tipo=2;
        $resul->fecha_deposito = $fecha_deposito;
        $resul->nro_deposito = $this->request->getPost('nro_deposito');
        $resul->monto_deposito = $this->request->getPost('monto_deposito');
        $resul->baja_logica = 1;
        if ($resul->save()) {
            $msm = 'Exito: Se guardo correctamente';
            $garantia_id = $resul->id;
            $fecha_deposito = date("d-m-Y",strtotime($resul->fecha_deposito));
            $nro_deposito = $resul->nro_deposito;
            $monto_deposito = $resul->monto_deposito;
            $AddEdit_derechollave = 'edit_derechollave';

        }else{
            $msm = 'Error: No se guardo el registro';
        }
    }   
}
$html = '
<td><a href="javascript:void(0)" id="'.$AddEdit_derechollave.'" garantia_id="'.$garantia_id.'" fecha_deposito="'.$fecha_deposito.'" nro_deposito="'.$nro_deposito.'" monto_deposito="'.$monto_deposito.'" ><strong>DERECHO DE LLAVE </strong></a></td>
<td><strong>Fecha Deposito: </strong> '.$fecha_deposito.'</td>
<td><strong>Nro Deposito: </strong> '.$nro_deposito.'</td>
<td><strong>Monto Depositado: </strong> '.$monto_deposito.'</td>
<td colspan="3"></td>
';
$this->view->disable();
echo $html;
}


public function savegarantiaAction()
{
    $garantia_id = '';
    $fecha_deposito = '';
    $nro_deposito = '';
    $monto_deposito = '';

    $fecha_devolucion = '';
    $nro_devolucion = '';
    $monto_devolucion = '';

    $AddEdit_derechollave = 'add_garantia';
    if (isset($_POST['garantia_id'])) {
        if ($_POST['garantia_id']>0) {
         $fecha_deposito = date("Y-m-d",strtotime($this->request->getPost('fecha_deposito')));
         if ($this->request->getPost('fecha_devolucion') !='') {
            $fecha_devolucion = date("Y-m-d",strtotime($this->request->getPost('fecha_devolucion')));    
        }else{
            $fecha_devolucion = null;
        }

        $resul = Garantias::findFirstById($_POST['garantia_id']);
        $resul->fecha_deposito = $fecha_deposito;
        $resul->nro_deposito = $this->request->getPost('nro_deposito');
        $resul->monto_deposito = $this->request->getPost('monto_deposito');

        $resul->fecha_devolucion = $fecha_devolucion;
        $resul->nro_devolucion = $this->request->getPost('nro_devolucion');
        $resul->monto_devolucion = $this->request->getPost('monto_devolucion');
        if ($resul->save()) {
            $msm = 'Exito: Se guardo correctamente';
            $garantia_id = $resul->id;
            $fecha_deposito = date("d-m-Y",strtotime($resul->fecha_deposito));
            $nro_deposito = $resul->nro_deposito;
            $monto_deposito = $resul->monto_deposito;

            if ($resul->fecha_devolucion !=null) {
                $fecha_devolucion = date("d-m-Y",strtotime($resul->fecha_devolucion));
            }else{
                $fecha_devolucion = null;
            }
            $nro_devolucion = $resul->nro_devolucion;
            $monto_devolucion = $resul->monto_devolucion;
            $AddEdit_derechollave = 'edit_garantia';

        }else{
            $msm = 'Error: No se guardo el registro';
        }
    }
    else{
        $fecha_deposito = date("Y-m-d",strtotime($this->request->getPost('fecha_deposito')));
        if ($this->request->getPost('fecha_devolucion') !='') {
            $fecha_devolucion = date("Y-m-d",strtotime($this->request->getPost('fecha_devolucion')));    
        }else{
            $fecha_devolucion = null;
        }    
        $resul = new Garantias();
        $resul->contratoproducto_id = $this->request->getPost('contratoproducto_id');
        $resul->tipo=1;
        $resul->fecha_deposito = $fecha_deposito;
        $resul->nro_deposito = $this->request->getPost('nro_deposito');
        $resul->monto_deposito = $this->request->getPost('monto_deposito');

        $resul->fecha_devolucion = $fecha_devolucion;
        $resul->nro_devolucion = $this->request->getPost('nro_devolucion');
        $resul->monto_devolucion = $this->request->getPost('monto_devolucion');

        $resul->baja_logica = 1;
        if ($resul->save()) {
            $msm = 'Exito: Se guardo correctamente';
            $garantia_id = $resul->id;
            $fecha_deposito = date("d-m-Y",strtotime($resul->fecha_deposito));
            $nro_deposito = $resul->nro_deposito;
            $monto_deposito = $resul->monto_deposito;


            if ($resul->fecha_devolucion !=null) {
                $fecha_devolucion = date("d-m-Y",strtotime($resul->fecha_devolucion));
            }else{
                $fecha_devolucion = null;
            }
            $nro_devolucion = $resul->nro_devolucion;
            $monto_devolucion = $resul->monto_devolucion;
            $AddEdit_derechollave = 'edit_garantia';

        }else{
            $msm = 'Error: No se guardo el registro';
        }
    }   
}
$html = '
<td><a href="javascript:void(0)" id="'.$AddEdit_derechollave.'" garantia_id="'.$garantia_id.'" fecha_deposito="'.$fecha_deposito.'" nro_deposito="'.$nro_deposito.'" monto_deposito="'.$monto_deposito.'" fecha_devolucion="'.$fecha_devolucion.'" nro_devolucion="'.$nro_devolucion.'" monto_devolucion="'.$monto_devolucion.'" ><strong>DERECHO DE LLAVE </strong></a></td>
<td><strong>Fecha Deposito: </strong> '.$fecha_deposito.'</td>
<td><strong>Nro Deposito: </strong> '.$nro_deposito.'</td>
<td><strong>Monto Depositado: </strong> '.$monto_deposito.'</td>

<td><strong>Fecha Devolución: </strong> '.$fecha_devolucion.'</td>
<td><strong>Nro Devolución: </strong> '.$nro_devolucion.'</td>
<td><strong>Monto Devolución: </strong> '.$monto_devolucion.'</td>
';
$this->view->disable();
echo $html;
}

    // public function saveAction()
    // {
    //     if (isset($_POST['id'])) {
    //         if ($_POST['id']>0) {
    //             $resul = Productos::findFirstById($this->request->getPost('id'));
    //             $resul->grupo_id= $this->request->getPost('grupo_id');
    //             $resul->estacion_id = $this->request->getPost('estacion_id');
    //             $resul->producto = $this->request->getPost('producto');
    //             $resul->codigo = $this->request->getPost('codigo');
    //             $resul->descripcion = $this->request->getPost('descripcion');
    //             $resul->precio_unitario = $this->request->getPost('precio_unitario');
    //             $resul->cantidad = $this->request->getPost('cantidad');
    //             $resul->tiempo = $this->request->getPost('tiempo');
    //             // $resul->usuario_reg = $this->_user->id;
    //             // $resul->fecha_reg = date("Y-m-d");
    //             // $resul->baja_logica = 1;
    //             if ($resul->save()) {
    //                 $msm ='Exito: Se guardo correctamente';
    //             }else{
    //                 $msm = 'Error: No se guardo el registro';
    //             }
    //         }
    //         else{
    //             $resul = new Productos();
    //             $resul->grupo_id= $this->request->getPost('grupo_id');
    //             $resul->estacion_id = $this->request->getPost('estacion_id');
    //             $resul->producto = $this->request->getPost('producto');
    //             $resul->codigo = $this->request->getPost('codigo');
    //             $resul->descripcion = $this->request->getPost('descripcion');
    //             $resul->precio_unitario = $this->request->getPost('precio_unitario');
    //             $resul->cantidad = $this->request->getPost('cantidad');
    //             $resul->tiempo = $this->request->getPost('tiempo');
    //             $resul->usuario_reg = $this->_user->id;
    //             $resul->fecha_reg = date("Y-m-d H:i:s");
    //             $resul->dimension_x = 1;
    //             $resul->dimension_y = 1;
    //             $resul->baja_logica = 1;
    //             if ($resul->save()) {
    //                 $msm ='Exito: Se guardo correctamente';
    //             }else{
    //                 $msm = 'Error: No se guardo el registro';
    //             }
    //         }   
    //     }
    // $this->view->disable();
    // echo $msm;
    // }



    // public function deleteAction(){
    //     $resul = Productos::findFirstById($this->request->getPost('id'));
    //     $resul->baja_logica = 0;
    //     if ($resul->save()) {
    //                 $msm ='Exito: Se elimino correctamente';
    //             }else{
    //                 $msm = 'Error: No se guardo el registro';
    //             }
    //     $this->view->disable();
    //     echo $msm;
    // }



}