<?php 
/**
* 
*/
class ContratosController extends ControllerBase
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
                // ->addJs('/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js')
                ->addJs('/media/plugins/form-validation/jquery.validate.min.js')
                ->addJs('/assets/js/plugins.js')
                ->addJs('/assets/js/pages/formsValidation.js')
                
                ->addJs('/scripts/contratos/index.js')
        ;
	}

	public function crearAction($contrato_id='')
	{
		
		$tiempo = $this->tag->selectStatic(
        array(
            "tiempo",
            array(
                "Hora" => "Hora",
                "Dia"   => "Dia",
                //"Semanal" => "Semanal",
                "Mensual" => "Mensual",
                //"Anual" => "Anual",
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
                // ->addJs('/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js')
                ->addJs('/media/plugins/form-validation/jquery.validate.min.js')
                ->addJs('/assets/js/plugins.js')
                ->addJs('/assets/js/pages/formsValidation.js')
                
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
                'linea' => $v->linea,
                'estacion' => $v->estacion,
                'grupo' => $v->grupo,
                'producto' => $v->producto,
                'precio_tiempo' => $v->precio_unitario.' Bs. x '.$v->tiempo,
                'precio_unitario' => $v->precio_unitario,
                'tiempo' => $v->tiempo,
                'cantidad' => $v->cantidad,
                'fecha_inicio' => $v->fecha_inicio,
                'fecha_fin' => $v->fecha_fin,
                'total' => $v->total,
            );
        }
        echo json_encode($customers);
    }

    public function savecontratosproductosAction()
    {
        
        if (isset($_POST['id'])) {
            if ($_POST['id']>0) {
                // $resul = Clientes::findFirstById($this->request->getPost('id'));
                // $resul->razon_social= $this->request->getPost('razon_social');
                // $resul->nit = $this->request->getPost('nit');
                // $resul->telefono = $this->request->getPost('telefono');
                // $resul->celular = $this->request->getPost('celular');
                // $resul->correo = $this->request->getPost('correo');
                // $resul->direccion = $this->request->getPost('direccion');
                // // $resul->imagen = $this->request->getPost('imagen');
                // $resul->representante_legal = $this->request->getPost('representante_legal');
                // $resul->ci_representante_legal = $this->request->getPost('ci_representante_legal');
                // $resul->celular_representante_legal = $this->request->getPost('celular_representante_legal');
                // $resul->correo_representante_legal = $this->request->getPost('correo_representante_legal');
                // $resul->nombre_ref = $this->request->getPost('nombre_ref');
                // $resul->ci_ref = $this->request->getPost('ci_ref');
                // $resul->celular_ref = $this->request->getPost('celular_ref');
                // $resul->correo_ref = $this->request->getPost('correo_ref');
                // // $resul->usuario_reg = $this->_user->id;
                // // $resul->fecha_reg = date("Y-m-d H:i:s");
                // // $resul->baja_logica = 1;
                // if ($resul->save()) {
                //     $msm ='Exito: Se guardo correctamente';
                // }else{
                //     $msm = 'Error: No se guardo el registro';
                // }
            }
            else{
                $resul = new Contratosproductos();
                $resul->contrato_id= $this->request->getPost('contrato_id');
                $resul->producto_id = $this->request->getPost('producto_id');
                $resul->precio_unitario = $this->request->getPost('precio_unitario');
                $resul->tiempo = $this->request->getPost('tiempo');
                $resul->fecha_inicio = date("Y-m-d",strtotime($this->request->getPost('fecha_inicio')));
                $resul->fecha_fin = date("Y-m-d",strtotime($this->request->getPost('fecha_fin')));
                $resul->cantidad = $this->request->getPost('cantidad');
                $resul->total = $this->request->getPost('total');
                $resul->baja_logica = 1;
                if ($resul->save()) {
                    $resul2 = Productos::findFirstById($this->request->getPost('producto_id'));
                    $resul2->cantidad = $resul2->cantidad-$this->request->getPost('cantidad');
                    $resul2->save();
                    $msm ='Exito: Se guardo correctamente';
                }else{
                    $msm = 'Error: No se guardo el registro';
                }
            }   
        }
    $this->view->disable();
    echo $msm;
    }

    public function calculocostoAction()
    {
        $fecha_inicio = date("Y-m-d",strtotime($_POST['fecha_inicio']));
        $fecha_fin = date("Y-m-d",strtotime($_POST['fecha_fin']));

        $hora_inicio = $_POST['hora_inicio'];
        $hora_fin = $_POST['hora_fin'];

        $precio_unitario = $_POST['precio_unitario'];
        if ($_POST['tiempo'] == 'Mensual') {
            $costo = $this->mensual($fecha_inicio,$fecha_fin,$precio_unitario);
        }elseif ($_POST['tiempo'] == 'Dia') {
            $costo = $this->dias($fecha_inicio,$fecha_fin,$precio_unitario);
        }elseif ($_POST['tiempo']=='Hora') {
            $costo = $this->horas($fecha_inicio.' '.$hora_inicio,$fecha_fin.' '.$hora_fin,$precio_unitario);
        }
        else{
            $costo = 0;
        }
        $costo = $costo * $_POST['cantidad'];
        $this->view->disable();
        echo $costo;
    }

    public function mensual($fecha_inicio='2014-12-14',$fecha_fin='2015-02-15',$costo_mes='2000')
    {
        $dia_i = date('j',strtotime($fecha_inicio)); //dia inicial de la fecha de inicio
        $dia_f = date('j',strtotime($fecha_fin)); //dia final de la fecha final
        $costo_total = 0;
        $mes = date('n',strtotime($fecha_inicio));
        $anio = date('Y',strtotime($fecha_inicio));
        if( is_callable("cal_days_in_month")){
            $nro_dias= cal_days_in_month(CAL_GREGORIAN, $mes, $anio);
        }
        else{
            $nro_dias = date("t",mktime(0,0,0,$mes,1,$anio));
            //$dias = date("d",mktime(0,0,0,$Month+1,0,$Year));
        }
        $mes_anio_i = date("Y-m", strtotime($fecha_inicio));
        $mes_anio_f = date("Y-m", strtotime($fecha_fin));
        if ($mes_anio_i<$mes_anio_f) {
            $costo_total +=($nro_dias-$dia_i+1)*($costo_mes/$nro_dias);
            $dia_i = 1;
        }
        
        //incrementar un mes a un fecha
        $mes_anio_i = date("Y-m",strtotime('+1 month',strtotime($mes_anio_i))); //incrementamos 1 mes
        while ( $mes_anio_i<$mes_anio_f ) {
            $costo_total=$costo_total+$costo_mes;
            //echo $mes_anio_i.'<br>';
            $mes_anio_i = date("Y-m",strtotime('+1 month',strtotime($mes_anio_i)));
        }
        // Calculamos mes final
        $mes = date('n',strtotime($fecha_fin));
        $anio = date('Y',strtotime($fecha_fin));
        if( is_callable("cal_days_in_month")){
            $nro_dias= cal_days_in_month(CAL_GREGORIAN, $mes, $anio);
        }
        else{
            $nro_dias = date("t",mktime(0,0,0,$mes,1,$anio));
            //$dias = date("d",mktime(0,0,0,$Month+1,0,$Year));
        }
        $costo_total+=($dia_f-$dia_i+1)*($costo_mes/$nro_dias);
        return $costo_total;
        //echo 'Fecha Inicio: '.$fecha_inicio.' Fecha Final: '.$fecha_fin.' Costo total: '.$costo_total;
        
    }

    public function dias($fecha_inicio='2015-02-14',$fecha_fin='2015-02-14',$costo_dia='20')
    {
        $datetime1 = new DateTime($fecha_inicio);
        $datetime2 = new DateTime($fecha_fin);
        $interval = $datetime1->diff($datetime2);
        $nro_dias = $interval->format('%a')+1;
        $costo_total = $nro_dias*$costo_dia;
        return $costo_total;
    }

    public function horas($fecha_inicio='2014-12-14 10:55',$fecha_fin='2014-12-15 11:55',$costo_hora='20')
    {
        $minutos = (strtotime($fecha_inicio)-strtotime($fecha_fin))/60;
        $minutos = abs($minutos); 
        $minutos = floor($minutos);
        $horas = ceil($minutos/60);
        $costo_total = $horas*$costo_hora;
        return $costo_total;
    }

}
