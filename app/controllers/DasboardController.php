<?php

class DasboardController extends ControllerBase {

	public function solicitudesAction()
    {
        $this->view->disable();
        $fechaActual = date('Y-m');
        $nuevafecha = strtotime ('-11 month' , strtotime ( $fechaActual ) ) ;
        $nuevafecha = date ( 'Y-m' , $nuevafecha );

        $category = array();
        $category['name'] = 'Meses';
        $usuariocomercial = Usuarios::find(array('habilitado = 1 and nivel in (2,3)',"order"=>"id ASC"));
        $ids = array();
        foreach ($usuariocomercial as $v) {
            $series[$v->id] = array();
            $series[$v->id]['name'] = $v->nombre.' '.$v->paterno;            
            $ids[] = $v->id; 
        }

        while ($nuevafecha<=$fechaActual) {
            $category['data'][] = date("M",strtotime($nuevafecha));
            for ($i=0; $i < count($ids); $i++) { 
                $model = new consultas();
                $cantidadcontratos = $model->contratosComerciales($nuevafecha,$ids[$i]);
                $series[$ids[$i]][$i]['data'][] = $cantidadcontratos[0]->cant;
            }            
            $nuevafecha = strtotime ('1 month' , strtotime ( $nuevafecha ) ) ;
            $nuevafecha = date ( 'Y-m' , $nuevafecha );
        }

        $result = array();//         array_push($result,$category);
        array_push($result,$category);
        for ($i=0; $i < count($ids); $i++) { 
            array_push($result,$series[$ids[$i]][$i]);
        }
        echo var_dump($result);
        echo json_encode($result, JSON_NUMERIC_CHECK);
    }

    public function container3Action()
    {   $this->view->disable();
        $model = new consultas();
        $resul = $model->contratosResponsable();
        $rows = array();
        foreach ($resul as $v) {
            $row['name'] = $v->nombre;
            $row['y'] = $v->monto;
            $row['x'] = $v->id;
            array_push($rows,$row);
        }
        // echo var_dump($rows);
        echo json_encode($rows, JSON_NUMERIC_CHECK);
        
    }

    public function container4Action($responsable_id)
    {   $this->view->disable();
        $model = new consultas();
        $resul = $model->contratosClientes($responsable_id);
        $rows = array();
        foreach ($resul as $v) {
            $row['name'] = $v->razon_social;
            $row['y'] = $v->monto;
            array_push($rows,$row);
        }
        // echo var_dump($rows);
        echo json_encode($rows, JSON_NUMERIC_CHECK);
        
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
        // echo "<<<<".$mesActual[0]->monto_programado*100;
        // $porcentajeAvanceMes = (($mesActual[0]->monto_programado+$garantiaLlaveMesActual->total)*100)/$metaActual[0]->meta;
        // $porcentajeAvanceAcumulado = (($mesAcumulado[0]->monto_programado+$garantiaLlaveMesAcumulado->total)*100)/$metaAcumulado[0]->meta;
        // $porcentajeAvanceAnual = (($mesAcumulado[0]->monto_programado+$garantiaLlaveMesAcumulado->total)*100)/$metaAnual[0]->meta;

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
}