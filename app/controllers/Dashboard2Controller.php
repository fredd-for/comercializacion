<?php

class Dashboard2Controller extends ControllerBase {

 private $mes_array =array(
    "1" => "ENERO",
    "2"   => "FEBRERO",
    "3" => "MARZO",
    "4" => "ABRIL",
    "5" => "MAYO",
    "6" => "JUNIO",
    "7" => "JULIO",
    "8" => "AGOSTO",
    "9" => "SEPTIEMBRE",
    "10" => "OCTUBRE",
    "11" => "NOVIEMBRE",
    "12" => "DICIEMBRE"
    );
 public function indexAction()
 {

    $config = array();

    $this->assets
    ->addCss('/media/plugins/org/css/primitives.latest.css')
    ->addCss('/jqwidgets/styles/jqx.base.css')
    ->addCss('/jqwidgets/styles/jqx.custom.css')
    ;


    $this->assets
    ->addJs('/scripts/dashboard2.js')
    ->addJs('/jqwidgets/jqxcore.js')
    ->addJs('/jqwidgets/jqxdraw.js')
    ->addJs('/jqwidgets/jqxgauge.js')
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
    ;


        /*
        datos gestiones
         */
        $model = new Metas();
        $result = $model->gestiones();
        $gestiones = $this->tag->select(
            array(
                'gestion',
                $result,
                'using' => array('gestion', 'gestion'),
                'useEmpty' => false,
                'emptyText' => '(Selecionar)',
                'emptyValue' => '',
                'class' => 'form-control',
                'required' => 'required'
                )
            );
        $this->view->setVar('gestiones',$gestiones);
        /*
        end gestiones
         */
        
        /*
        Meses
         */
        $this->tag->setDefault("mes", date("n"));
        $meses = $this->tag->selectStatic(
            array(
                "mes",
                $this->mes_array,
                'useEmpty' => false,
                'emptyText' => '(Selecionar)',
                'emptyValue' => '',
                'class' => 'form-control',
                )
            );
        $this->view->setVar('meses', $meses);

        /*
        responsable comercial
         */
        $model = new Usuarios();
        $resul = $model->responsablecomercial();
        // $responsable = $this->tag->select(
        //     array(
        //         'responsable_id',
        //         $resul,
        //         'using' => array('id', 'nombres'),
        //         'useEmpty' => true,
        //         'emptyText' => '(Todos)',
        //         'emptyValue' => '0',
        //         'class' => 'form-control',
        //         'required' => 'required'
        //         )
        //     );
        $this->view->setVar('responsable',$resul);

        $recaudacion = $this->tag->select(
            array(
                'recaudacion',
                array(
                    "0"   => "PROGRAMADA",
                    "1" => "DEPOSITADA",
                    ),
                'useEmpty' => false,
                'emptyText' => '(Todos)',
                'emptyValue' => '0',
                'class' => 'form-control',
                'required' => 'required'
                )
            );
        $this->view->setVar('recaudacion',$recaudacion);

        


    }

    public function metaMesAgrupadoAction()
    {
        $gestion = $_POST['gestion'];
        $responsable_id = $_POST['responsable_id'];

        $model = new consultas();
        $resul = $model->metaAgrupadoMes($gestion,$responsable_id);
        $total = 0;
        foreach ($resul as $v) {
         $customers[] = array(
            'mes' => $v->mes,
            'meta' => $v->meta,
            );
         $total+=$v->meta;
        }
        $customers[] = array(
            'mes' => 'total',
            'meta' => $total,
            );
        $this->view->disable();  
        echo json_encode($customers);
        
    }
    public function porcentajemetasAction()
    {
        $gestion = $_POST['gestion'];
        $mes = $_POST['mes'];
        $responsable_id = $_POST['responsable_id'];
        $recaudacion = $_POST['recaudacion'];

        $model = new consultas();
        $mesActual = $model->montoMesActual($gestion,$mes,$responsable_id);
        $mesAcumulado = $model->montoMesAcumulado($gestion,$mes,$responsable_id);

        $garantiaLlaveMesActual = $model->garantiaLlaveMesActual($gestion,$mes,$responsable_id);
        $garantiaLlaveMesAcumulado = $model->garantiaLlaveMesAcumulado($gestion,$mes,$responsable_id);

        $metaActual = $model->metaMesActual($gestion,$mes,$responsable_id);
        $metaAcumulado = $model->metaMesAcumulado($gestion,$mes,$responsable_id);
        $metaAnual = $model->metaAnual($gestion,$responsable_id);
        $rows = array();
        // recaudacion 0 = programada , 1 = depositada
        if ($recaudacion == 0) {
            $logroMes=$mesActual[0]->monto_programado+$garantiaLlaveMesActual->total;
            $logroAcumulado = $mesAcumulado[0]->monto_programado+$garantiaLlaveMesAcumulado->total;
            $logroAnual = $mesAcumulado[0]->monto_programado+$garantiaLlaveMesAcumulado->total;

            $porcentajeAvanceMes = ($logroMes*100)/$metaActual[0]->meta;
            $porcentajeAvanceAcumulado = ($logroAcumulado*100)/$metaAcumulado[0]->meta;
            $porcentajeAvanceAnual = ($logroAnual*100)/$metaAnual[0]->meta;            
        }else{
            $logroMes = $mesActual[0]->monto_deposito+$garantiaLlaveMesActual->total;
            $logroAcumulado = $mesAcumulado[0]->monto_deposito+$garantiaLlaveMesAcumulado->total;
            $logroAnual = $mesAcumulado[0]->monto_deposito+$garantiaLlaveMesAcumulado->total;

            $porcentajeAvanceMes = ($logroMes*100)/$metaActual[0]->meta;
            $porcentajeAvanceAcumulado = ($logroAcumulado*100)/$metaAcumulado[0]->meta;
            $porcentajeAvanceAnual = ($logroAnual*100)/$metaAnual[0]->meta;            
        }
        $row['porcentajeAvanceMes'] = $porcentajeAvanceMes;
        $row['porcentajeAvanceAcumulado'] = $porcentajeAvanceAcumulado;
        $row['porcentajeAvanceAnual'] = $porcentajeAvanceAnual;

        $row['metaMes'] = number_format($metaActual[0]->meta,2,'.',',');
        $row['metaAcumulado'] = number_format($metaAcumulado[0]->meta,2,'.',','); 
        $row['metaAnual'] = number_format($metaAnual[0]->meta,2,'.',',');

        $row['logroMes'] = number_format($logroMes,2,'.',',');
        $row['logroAcumulado'] = number_format($logroAcumulado,2,'.',','); 
        $row['logroAnual'] = number_format($logroAnual,2,'.',',');    

        $this->view->disable();  
        echo json_encode($row);

    }

    public function alquilerAseguradoAction($responsable_id=0,$gestion=0,$recaudacion=0)
    {
      if ($recaudacion==1) {
        $model = new consultas();
        $resul = $model->pivotAlquilerDepositado($gestion,$responsable_id,0);   
      }else{
        $model = new consultas();
        $resul = $model->pivotAlquilerAsegurado($gestion,$responsable_id,0);    
      }


      // $model = new consultas();
      // $resul = $model->pivotAlquilerAsegurado('2016',0,0);
      $this->view->disable();
      foreach ($resul as $v) {
        $string = base64_encode($v->contrato);
        $customers[] = array(
            // 'id' => $v->id,
            // 'contrato' => '<div><a href="/planpagos/index/'.$string.'" ><b>'.$v->razon_social.' </b></a> ('.date("d-m-Y",strtotime($v->fecha_contrato)).')</div>',
            'contrato' => '<div><a href="/planpagos/index/'.$string.'" ><b>'.$v->razon_social.' </b></a></div>',
            'enero' => $v->enero,
            'febrero' => $v->febrero,
            'marzo' => $v->marzo,
            'abril' => $v->abril,
            'mayo' => $v->mayo,
            'junio' => $v->junio,
            'julio' => $v->julio,
            'agosto' => $v->agosto,
            'septiembre' => $v->septiembre,
            'octubre' => $v->octubre,
            'noviembre' => $v->noviembre,
            'diciembre' => $v->diciembre,
            'total_contrato' => ($v->enero+$v->febrero+$v->marzo+$v->abril+$v->mayo+$v->junio+$v->julio+$v->agosto+$v->septiembre+$v->octubre+$v->noviembre+$v->diciembre)
            );
         }
        echo json_encode($customers);
    }

    public function alquilerContratosNuevosAction($responsable_id=0,$gestion=0,$recaudacion=0)
    {
      
      if ($recaudacion==1) {
        $model = new consultas();
        $resul = $model->pivotAlquilerDepositado($gestion,$responsable_id,1);   
      }else{
        $model = new consultas();
        $resul = $model->pivotAlquilerAsegurado($gestion,$responsable_id,1);    
      }
      
      $this->view->disable();
      foreach ($resul as $v) {
        $string = base64_encode($v->contrato);
        $customers[] = array(
            'id' => $v->id,
            // 'contrato' => '<div><a href="/planpagos/index/'.$string.'" ><b>'.$v->razon_social.' </b></a> ('.date("d-m-Y",strtotime($v->fecha_contrato)).')</div>',
            'contrato' => '<div><a href="/planpagos/index/'.$string.'" ><b>'.$v->razon_social.' </b></a></div>',
            'enero' => $v->enero,
            'febrero' => $v->febrero,
            'marzo' => $v->marzo,
            'abril' => $v->abril,
            'mayo' => $v->mayo,
            'junio' => $v->junio,
            'julio' => $v->julio,
            'agosto' => $v->agosto,
            'septiembre' => $v->septiembre,
            'octubre' => $v->octubre,
            'noviembre' => $v->noviembre,
            'diciembre' => $v->diciembre,
            'total_contrato' => ($v->enero+$v->febrero+$v->marzo+$v->abril+$v->mayo+$v->junio+$v->julio+$v->agosto+$v->septiembre+$v->octubre+$v->noviembre+$v->diciembre)
            );
         }
        echo json_encode($customers);
    }

    public function obtenerimagenAction()
    {
        $responsable_id = $_POST['responsable_id'];

        $model = new usuarios();
        $resul = $model->profileUsuario($responsable_id);
         $customers = array(
            'responsable' => $resul[0]->nombre.' '.$resul[0]->paterno.' '.$resul[0]->materno,
            'imagen' => $this->foto($resul[0]->imagen, $resul[0]->genero),
            );
        
        $this->view->disable();  
        echo json_encode($customers);
    }

    public function foto($foto, $genero) {
        $file = "/images/hombre.jpg";
        if (file_exists("images/" . $foto)) {
            $file = "/images/" . $foto;
        } else {
            if ($genero == 'F') {
                $file = "/images/mujer.jpg";
            }
        }
        return $file;
    }
}