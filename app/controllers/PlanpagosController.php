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

public function control1Action($contratoproducto_id)
{
        
        $html = $this->htmlcontrolpagos($contratoproducto_id);
        $this->view->setVar('htmlp',$html);
        $this->view->setVar('contratoproducto_id',$contratoproducto_id);

        $garantia = Garantias::findFirst(array('baja_logica=1 and tipo=1 and contratoproducto_id = '.$contratoproducto_id, 'order'=>'tipo ASC'));
        $this->view->setVar('garantia',$garantia);

        $derechollave = Garantias::findFirst(array('baja_logica=1 and tipo=2 and contratoproducto_id = '.$contratoproducto_id, 'order'=>'tipo ASC'));
        $this->view->setVar('derechollave',$derechollave);    
        $this->assets
        ->addJs('/scripts/planpagos/control1.js');

    
}

private function htmlcontrolpagos($contratoproducto_id)
{
    $cp = Contratosproductos::findFirstById($contratoproducto_id);
    if ($cp != false) {
        //$resul = Planpagos::find(array("baja_logica = 1 and contratoproducto_id = ".$contratoproducto_id, 'order'=>'fecha_programado ASC'));
        $model = new Planpagos();
        $resul = $model->listadoplanpago($contratoproducto_id);
        $datos = array();
        $id = 0;
        $hoy = date("Y-m-d");
        // $hoy = new DateTime();
        // $fecha->add(new DateInterval('P10D'));
        // echo $fecha->format('Y-m-d') . "\n";
        foreach ($resul as $v) {
            $datos[$v->id][$v->planpagodeposito_id]['id']=$v->planpagodeposito_id;
            $datos[$v->id][$v->planpagodeposito_id]['fecha_programado']=$v->fecha_programado;
            $datos[$v->id][$v->planpagodeposito_id]['monto_programado']=$v->monto_programado;
            $datos[$v->id][$v->planpagodeposito_id]['mora']=$v->mora;
            $datos[$v->id][$v->planpagodeposito_id]['dias_atraso']=$v->dias_atraso;
            $datos[$v->id][$v->planpagodeposito_id]['nro_deposito']=$v->nro_deposito;
            $datos[$v->id][$v->planpagodeposito_id]['fecha_deposito']=$v->fecha_deposito;
            $datos[$v->id][$v->planpagodeposito_id]['monto_deposito']=$v->monto_deposito;
            $datos[$v->id][$v->planpagodeposito_id]['tipo_deposito']=$v->tipo_deposito;
            $datos[$v->id][$v->planpagodeposito_id]['monto_reprogramado']=$v->monto_reprogramado;
            $datos[$v->id][$v->planpagodeposito_id]['diferencia']=$v->diferencia;
        }
        //echo var_dump($datos);
        $html='<div class="table-responsive">
                <table class="table table-vcenter table-striped table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Fecha Programado</th>
                                    <th>Monto Programado</th>
                                    <th>Nro Deposito</th>
                                    <th>Fecha Deposito</th>
                                    <th>Monto Deposito</th>
                                    <th>Dias Atraso</th>
                                    <th>Mora</th>
                                    <th>Nro Deposito Mora</th>
                                    <th>Fecha Deposito Mora</th>
                                    <th>Monto Deposito Mora</th>
                                    <th style="width: 150px;" class="text-center">Acción</th>
                                </tr>
                            </thead>
                            <tbody>';
        
        
        foreach ($resul as $v) {
            if ($id != $v->id) {
                $div_nrodeposito = '';
                $div_fecha_deposito = '';
                $div_monto_deposito = '';

                $div_nrodeposito_mora = '';
                $div_fecha_deposito_mora = '';
                $div_monto_deposito_mora = '';
                $dias = 10; // numero de dias antes de la fecha programada para mostrar el color amarillo
                $diff = $v->monto_programado-$v->monto_reprogramado;
                $diff_text = '';
                if($diff>0){
                    $diff_text = '<span class="label label-primary">'.$diff.'</span>';
                }
                $html.='<tr id="html'.$v->id.'">
                            <td class="active">'.$v->id.'</td>
                            <td class="active">'.$v->fecha_programado.'</td>
                            <td class="active text-right">'.$diff_text.' '.number_format($v->monto_reprogramado,2,'.',' ').'</td>';
                                $total_deposito = 0;
                                $total_mora = 0;
                                $color = '';
                                $masmenos = '';
                                //<span class="badge">8</span>
                                foreach ($datos[$v->id] as $k => $m) {
                                    if ($datos[$v->id][$k]['tipo_deposito']==1) {
                                        $div_nrodeposito .=$datos[$v->id][$k]['nro_deposito'].'<br>';
                                        $div_fecha_deposito .=$datos[$v->id][$k]['fecha_deposito'].'<br>';
                                        $div_monto_deposito .=number_format($datos[$v->id][$k]['monto_deposito'],2,'.',' ').'<br>';    
                                        $total_deposito+=$datos[$v->id][$k]['monto_deposito'];
                                    }else{
                                        $div_nrodeposito_mora .=$datos[$v->id][$k]['nro_deposito'].'<br>';
                                        $div_fecha_deposito_mora .=$datos[$v->id][$k]['fecha_deposito'].'<br>';
                                        $div_monto_deposito_mora .= number_format($datos[$v->id][$k]['monto_deposito'],2,'.',' ').'<br>';    
                                        $total_mora+=$datos[$v->id][$k]['monto_deposito'];
                                    }
                                    

                                }
                                $hoy10 = date("Y-m-d",strtotime( '+'.$dias.' day' , strtotime($hoy)));
                                if ($hoy>=$v->fecha_programado && $total_deposito<$v->monto_reprogramado) {
                                    $color = 'danger';
                                }elseif ($hoy10>=$v->fecha_programado && $total_deposito<$v->monto_reprogramado) {
                                    $color = 'warning';
                                }elseif ($total_deposito>=$v->monto_reprogramado) {
                                    $color = 'success';
                                }
                                $diff_text = '';
                                if($v->diferencia!=0)
                                    $diff_text = '<span class="label label-'.$color.'">'.$v->diferencia.'</span>';

                                //calculo de mora
                                $color_mora = '';
                                $model = new Planpagodepositos();
                                $resulmora = $model->getdatosverificar($v->id,2);
                                $dias_atraso = '';
                                $mora='';
                                foreach ($resulmora as $rm) {
                                    $fecha_tolerancia = date("Y-m-d",strtotime( '+'.$rm->dias_tolerancia.' day' , strtotime($v->fecha_programado)));
                                    if ($fecha_tolerancia<date("Y-m-d")) {
                                        if ($v->mora>0) {
                                            if ($v->mora > $rm->deposito) {
                                                $color_mora = 'danger';
                                            }else{
                                                $color_mora = 'success';
                                            }
                                            $dias_atraso = $v->dias_atraso;
                                            $mora=$v->mora;
                                        }else{
                                            $nuevafecha = strtotime ( '+'.$rm->dias_tolerancia.' day' , strtotime ( $v->fecha_programado ) ) ;
                                            $nuevafecha = date ( 'Y-m-d' , $nuevafecha );

                                            $datetime1 = new DateTime($nuevafecha);
                                            $datetime2 = new DateTime(date("Y-m-d"));
                                            $interval = $datetime1->diff($datetime2);
                                            $dias_atraso = $interval->format('%a');
                                            $mora=($rm->total/$rm->nro_dias)*$dias_atraso;
                                            $color_mora = 'danger';
                                        }
                                    }
                                }
                                

                                $html.='<td class="'.$color.'">'.$div_nrodeposito.'</td>
                                <td class="'.$color.'">'.$div_fecha_deposito.'</td>
                                <td class="'.$color.' text-right"> '.$diff_text.' '.$masmenos.' '.$div_monto_deposito.' </td>
                                <td class="'.$color_mora.' ">'.$dias_atraso.'</td>
                                <td class="'.$color_mora.' text-right">'.number_format($mora, 2, '.', ' ').'</td>
                                <td class="'.$color_mora.'">'.$div_nrodeposito_mora.'</td>
                                <td class="'.$color_mora.'">'.$div_fecha_deposito_mora.'</td>
                                <td class="'.$color_mora.' text-right">'.$div_monto_deposito_mora.'</td>
                                 <td class="text-center">
                                    <div class="btn-group btn-group-xs">
                                        <a href="javascript:void(0)" data-toggle="tooltip" title="Realizar deposito" class="btn btn-primary reg_deposito" planpago_id ="'.$v->id.'" tipo_deposito="1" texto="Registrar Deposito"><i class="fa fa-plus"></i></a>
                                        <a href="javascript:void(0)" data-toggle="tooltip" title="Editar Depositos" class="btn btn-warning"><i class="fa fa-pencil"></i></a>
                                        <a href="javascript:void(0)" data-toggle="tooltip" title="Realizar deposito" class="btn btn-default reg_deposito" planpago_id ="'.$v->id.'" tipo_deposito="2" texto="Registrar Deposito Mora"><i class="fa fa-plus"></i></a>
                                    </div>
                                </td>
                        </tr>';
                }
            $id = $v->id;
        }
         
        $html .='</tbody>
                </table>
                </div>';
        }
        return $html;
        //$this->view->setVar('htmlp',$html);
}

public function pruebaAction()
{
    $datetime1 = new DateTime('2015-02-28');
    $datetime2 = new DateTime('2015-04-02');
    $interval = $datetime1->diff($datetime2);
    $nro_dias = $interval->format('%a');
    echo $nro_dias;

    $fecha = date('Y-m-d');
    $nuevafecha = strtotime ( '+5 day' , strtotime ( $fecha ) ) ;
    $nuevafecha = date ( 'Y-m-d' , $nuevafecha );

    echo 'sumamos mas 5 dias '.$nuevafecha;

    // $model = new Planpagodepositos();
    //         $resulmora = $model->getfechadeposito(1);
    //         echo var_dump($resulmora);
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
    $html = '';
    //$AddEdit_derechollave = 'add_derechollave';
    if (isset($_POST['planpago_id'])) {
        if ($_POST['planpago_id']>0) {
         $fecha_deposito = date("Y-m-d",strtotime($this->request->getPost('fecha_deposito')));
         $resul = new Planpagodepositos();
         $resul->planpago_id = $this->request->getPost('planpago_id');
         $resul->fecha_deposito = $fecha_deposito;
         $resul->nro_deposito = $this->request->getPost('nro_deposito');
         $resul->monto_deposito = $this->request->getPost('monto_deposito');
         $resul->tipo_deposito = $this->request->getPost('tipo_deposito');
         $resul->fecha_reg = date("Y-m-d H:i:s");
         $resul->usuario_reg = $this->_user->id;
         $resul->baja_logica = 1;
         if ($resul->save()) {
            if ($this->request->getPost('tipo_deposito') ==1) {
                    /*
            Realizamos la modificacion de montos en el caso de que esta sea mas o menos
             */
            $model = new Planpagodepositos();
            $resul_ppd = $model->listadepositos($this->request->getPost('contratoproducto_id'));
            $diff=0;
            foreach ($resul_ppd as $v) {
                if ($diff>0) {
                    $planpago=Planpagos::findFirstById($v->id);
                    $planpago->monto_reprogramado = ($v->monto_programado-$diff);    
                    $planpago->save();
                }else{
                    $planpago=Planpagos::findFirstById($v->id);
                    $planpago->monto_reprogramado = $v->monto_programado;    
                    $planpago->save();
                }
                $diff = 0;
                if ($v->deposito >0) {
                    $diff = ($v->deposito-$v->monto_reprogramado);
                    $planpago=Planpagos::findFirstById($v->id);
                    $planpago->diferencia = $diff;  
                    $planpago->save();
                }
            }
            // end modificacion

            /*Verificamos dias de mora y el monto*/
            $model = new Planpagodepositos();
            $resulmora = $model->getdatosverificar($_POST['planpago_id'],1);

            foreach ($resulmora as $v) {
                if ($v->deposito>=$v->monto_reprogramado) {
                    $nuevafecha = strtotime ( '+'.$v->dias_tolerancia.' day' , strtotime ( $v->fecha_programado ) ) ;
                    $nuevafecha = date ( 'Y-m-d' , $nuevafecha );

                    $datetime1 = new DateTime($nuevafecha);
                    $datetime2 = new DateTime($v->fecha);
                    $interval = $datetime1->diff($datetime2);
                    $nro_dias = $interval->format('%a');
                    
                    $planpago = Planpagos::findFirstById($_POST['planpago_id']);
                    $planpago->dias_atraso = $nro_dias;
                    $planpago->mora = ($v->total/$v->nro_dias)*$nro_dias;
                    $planpago->save();
                }
            }
            /*end*/

        }

        
        $html = $this->htmlcontrolpagos($this->request->getPost('contratoproducto_id'));
        $msm = 'Exito: Se guardo correctamente';
        // $fecha_deposito_mora = '';
        // $fecha_deposito =date("d-m-Y",strtotime($resul->fecha_deposito));
        // if ($resul->fecha_deposito_mora != null) {
        //     $fecha_deposito_mora = date("d-m-Y",strtotime($resul->fecha_deposito_mora));
        // }

        // $model = new Planpagodepositos();
        // $resul2 = $model->listadodeposito($this->request->getPost('planpago_id'));

        // $datos = array();
        // $id = 0;
        // $total_deposito = 0;
        // $total_mora = 0;
        // foreach ($resul2 as $v) {
        //     $datos[$v->id][$v->planpagodeposito_id]['id']=$v->planpagodeposito_id;
        //     $datos[$v->id][$v->planpagodeposito_id]['fecha_programado']=$v->fecha_programado;
        //     $datos[$v->id][$v->planpagodeposito_id]['monto_reprogramado']=$v->monto_reprogramado;
        //     $datos[$v->id][$v->planpagodeposito_id]['mora']=$v->mora;
        //     $datos[$v->id][$v->planpagodeposito_id]['dias_atraso']=$v->dias_atraso;
        //     $datos[$v->id][$v->planpagodeposito_id]['nro_deposito']=$v->nro_deposito;
        //     $datos[$v->id][$v->planpagodeposito_id]['fecha_deposito']=$v->fecha_deposito;
        //     $datos[$v->id][$v->planpagodeposito_id]['monto_deposito']=$v->monto_deposito;
        //     $datos[$v->id][$v->planpagodeposito_id]['tipo_deposito']=$v->tipo_deposito;
        // }

        // foreach ($resul2 as $v) {
        //     if ($id != $v->id) {
        //         $div_nrodeposito = '';
        //         $div_fecha_deposito = '';
        //         $div_monto_deposito = '';

        //         $div_nrodeposito_mora = '';
        //         $div_fecha_deposito_mora = '';
        //         $div_monto_deposito_mora = '';

        //         $html.='<td>'.$v->id.'</td>
        //         <td>'.$v->fecha_programado.'</td>
        //         <td>'.$v->monto_reprogramado.'</td>';
        //         foreach ($datos[$v->id] as $k => $m) {
        //             if ($datos[$v->id][$k]['tipo_deposito']==1) {
        //                 $div_nrodeposito .=$datos[$v->id][$k]['nro_deposito'].'<br>';
        //                 $div_fecha_deposito .=$datos[$v->id][$k]['fecha_deposito'].'<br>';
        //                 $div_monto_deposito .=$datos[$v->id][$k]['monto_deposito'].'<br>';
        //                 $total_deposito+=$datos[$v->id][$k]['monto_deposito'];    
        //             }else{
        //                 $div_nrodeposito_mora .=$datos[$v->id][$k]['nro_deposito'].'<br>';
        //                 $div_fecha_deposito_mora .=$datos[$v->id][$k]['fecha_deposito'].'<br>';
        //                 $div_monto_deposito_mora .=$datos[$v->id][$k]['monto_deposito'].'<br>';    
        //                 $total_mora+=$datos[$v->id][$k]['monto_deposito'];
        //             }


        //         }


        //         $html.='<td>'.$div_nrodeposito.'</td>
        //         <td>'.$div_fecha_deposito.'</td>
        //         <td><a class="label label-warning" href="javascript:void(0)">Trial</a>'.$div_monto_deposito.'</td>
        //         <td>'.$v->dias_atraso.'</td>
        //         <td>'.$v->mora.'</td>
        //         <td>'.$div_nrodeposito_mora.'</td>
        //         <td>'.$div_fecha_deposito_mora.'</td>
        //         <td>'.$div_monto_deposito_mora.'</td>
        //         <td class="text-center">
        //             <div class="btn-group btn-group-xs">
        //                 <a href="javascript:void(0)" data-toggle="tooltip" title="Realizar deposito" class="btn btn-primary reg_deposito" planpago_id ="'.$v->id.'" tipo_deposito = "1" texto="Registrar Deposito"><i class="fa fa-plus"></i></a>
        //                 <a href="javascript:void(0)" data-toggle="tooltip" title="Editar Depositos" class="btn btn-warning"><i class="fa fa-pencil"></i></a>
        //                 <a href="javascript:void(0)" data-toggle="tooltip" title="Realizar deposito Mora" class="btn btn-default reg_deposito" tipo_deposito = "2" texto="Registrar Deposito Mora"><i class="fa fa-plus"></i></a>
        //             </div>
        //         </td>';
        //     }
        //     $id = $v->id;
        // }
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