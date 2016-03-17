<?php

class IndexController extends ControllerBase {

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

    public function initialize() {
        parent::initialize();
    }

    public function indexAction() {
        $config = array();

        $this->assets

        ->addCss('/media/plugins/org/css/primitives.latest.css')
        // ->addCss('/jqwidgets/styles/jqx.base.css')
        // ->addCss('/jqwidgets/styles/jqx.custom.css')
        ->addCss('/js/treegrid/css/jquery.treegrid.css')
        ;
        $this->assets
        ->addJs('/js/highcharts/js/highcharts.js')
        ->addJs('/js/highcharts/js/modules/data.js')
        ->addJs('/js/highcharts/js/modules/exporting.js')
        ->addJs('/js/highcharts/js/modules/drilldown.js')
        ->addJs('/js/treegrid/js/jquery.treegrid.js')
        ->addJs('/scripts/dashboard.js')

        // ->addJs('/jqwidgets/jqxcore.js')
        // ->addJs('/jqwidgets/jqxdraw.js')
        // ->addJs('/jqwidgets/jqxgauge.js')
        ;
        
        /*
        datos gestiones
         */
        // $model = new Metas();
        // $result = $model->gestiones();
        // $gestiones = $this->tag->select(
        //     array(
        //         'gestion',
        //         $result,
        //         'using' => array('gestion', 'gestion'),
        //         'useEmpty' => false,
        //         'emptyText' => '(Selecionar)',
        //         'emptyValue' => '',
        //         'class' => 'form-control',
        //         'required' => 'required'
        //         )
        //     );
        // $this->view->setVar('gestiones',$gestiones);
        /*
        end gestiones
         */
        
        /*
        Meses
         */
        // $this->tag->setDefault("mes", date("n"));
        // $meses = $this->tag->selectStatic(
        // array(
        //     "mes",
        //     $this->mes_array,
        //     'useEmpty' => false,
        //     'emptyText' => '(Selecionar)',
        //     'emptyValue' => '',
        //     'class' => 'form-control',
        //     )
        // );
        // $this->view->setVar('meses', $meses);

        /*
        responsable comercial
         */
        // $model = new Usuarios();
        // $resul = $model->responsablecomercial();
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
        // $this->view->setVar('responsable',$responsable);

        // $recaudacion = $this->tag->select(
        //     array(
        //         'recaudacion',
        //         array(
        //         "0"   => "PROGRAMADA",
        //         "1" => "DEPOSITADA",
        //         ),
        //         'useEmpty' => false,
        //         'emptyText' => '(Todos)',
        //         'emptyValue' => '0',
        //         'class' => 'form-control',
        //         'required' => 'required'
        //         )
        //     );
        // $this->view->setVar('recaudacion',$recaudacion);

        $this->view->setVar('usuario', $this->_user);
        
        $clientes = consultas::clientesContrato()->count();
        $productossinalquilar = Productos::sum(array("baja_logica=1 and cantidad>0", 'column' => 'cantidad'));
        $productosalquilados = Contratosproductos::sum(array("baja_logica=1 and cantidad>0", 'column' => 'cantidad'));
        $contratosActivos = Contratos::count(array("baja_logica=1"));

        $this->view->setVar('clientes', $clientes);
        $this->view->setVar('productossinalquilar', $productossinalquilar);
        $this->view->setVar('productosalquilados', $productosalquilados);
        $this->view->setVar('contratosActivos', $contratosActivos);

        /*Datos para el grafico*/
        $fechaActual = date('Y-m');
        $nuevafecha = strtotime ('-11 month' , strtotime ( $fechaActual ) ) ;
        $nuevafecha = date ( 'Y-m' , $nuevafecha );
        $usuariocomercial = Usuarios::find(array('habilitado = 1 and nivel in (2,3)',"order"=>"id ASC"));
        $html_tabla = '<tr><th></th>';
        $array_usuario_id=array();
        foreach ($usuariocomercial as $v) {
            $html_tabla .='<th>'.$v->nombre.' '.$v->paterno.'</th>';
            $array_usuario_id[]=$v->id;
        }
        $html_tabla.='</tr>';
        
        while ($nuevafecha<=$fechaActual) {
            $html_tabla .= '<tr><th>'.date("M",strtotime($nuevafecha)).'</th>';
            for ($i=0; $i < count($array_usuario_id); $i++) { 
                $model = new Consultas();
                $cantidadcontratos = $model->contratosComerciales($nuevafecha,$array_usuario_id[$i]);
                $html_tabla .= '<td>'.$cantidadcontratos[0]->cant.'</td>';
            }            
            $html_tabla.='</tr>';
            $nuevafecha = strtotime ('1 month' , strtotime ( $nuevafecha ) ) ;
            $nuevafecha = date ( 'Y-m' , $nuevafecha );
        }
        $this->view->setVar('html_tabla', $html_tabla);        


        /*
        tabla de grupos
         */
        $model = new Grupos();
        $grupos = $model->lista();
        // $grupos = Grupos::find(array("baja_logica=1","order"=>"id ASC"));
        $lineas = Lineas::find(array("baja_logica=1","order"=>"id ASC"));
        $cant_lineas = count($lineas)*3;
        // $this->view->setVar('cant_lineas', $cant_lineas);        
        $tabla = "";
        $tabla.='<thead>';
        $tabla.='<tr>';
        $tabla.='<th rowspan="2">Grupos</th>';
        $tabla.='<th colspan="'.$cant_lineas.'" class="text-center">Cantidad Productos / Productos Disponibles / Productos Alquilados</th>';
        $tabla.='</tr>'; 
        $tabla.='<tr>';
        $suma = array();
        foreach ($lineas as $v) {
          $tabla .= '<th colspan="3" class="text-center" style="color:'.$v->color.'">'.$v->linea.'</th>';
          $suma[$v->id]['cantidad']=0;
          $suma[$v->id]['cantidad_disponible']=0;
          $suma[$v->id]['cantidad_alquilada']=0;
        }
        $tabla.='</tr>';
        $tabla.='</thead>';
        $tabla.='<tbody>';
        $espacio = '';
        $sw=0;
        foreach ($grupos as $g) {
            if ($espacio!=$g->espacio_id) {
                $tabla.='<tr class="treegrid-'.$g->espacio_id.'">';
                $tabla.='<td>'.$g->espacio.'</td>';
                foreach ($lineas as $l) {
                    $cant = $this->productosespacio($g->espacio_id,$l->id);
                        $tabla.='<td class="text-center">'.$cant['cantidad'].'</td>';
                        $tabla.='<td class="text-center">'.$cant['cantidad_disponible'].'</td>';
                        $tabla.='<td class="text-center">'.$cant['cantidad_alquilada'].'</td>';
                }
                $tabla.='</tr>';   
                $espacio =  $g->espacio_id;
                $sw=1;
            }
            
            $tabla.='<tr class="treegrid-n treegrid-parent-'.$g->espacio_id.'">';
            $tabla.='<td><a href="/productos/index/0/'.$g->id.'/0">'.$g->grupo.'</a></td>';
            foreach ($lineas as $l) {
                $cant = $this->productosgrupo($g->id,$l->id);
                $tabla.='<td class="text-center" ><a href="/productos/index/0/'.$g->id.'/'.$l->id.'" >'.$cant['cantidad'].'</a></td>';
                $tabla.='<td class="text-center" ><a href="/productos/index/0/'.$g->id.'/'.$l->id.'" style="color:'.$l->color.'">'.$cant['cantidad_disponible'].'</a></td>';
                $tabla.='<td class="text-center" style="color:'.$l->color.'"><a href="/productos/index/0/'.$g->id.'/'.$l->id.'" style="color:'.$l->color.'">'.$cant['cantidad_alquilada'].'</a></td>';


                $suma[$l->id]['cantidad'] += $cant['cantidad'];
                $suma[$l->id]['cantidad_disponible'] += $cant['cantidad_disponible'];
                $suma[$l->id]['cantidad_alquilada'] += $cant['cantidad_alquilada'];
            }
            
            $tabla.='</tr>';

            
        }

      
        $tabla.='</tbody>';
        $tabla.='<tr>';
                $tabla.='<th class="text-right">TOTAL</th>';
                foreach ($lineas as $v) {
                $tabla.='<th class="text-center">'.$suma[$v->id]['cantidad'].'</th>';
                $tabla.='<th class="text-center">'.$suma[$v->id]['cantidad_disponible'].'</th>';
                $tabla.='<th class="text-center">'.$suma[$v->id]['cantidad_alquilada'].'</th>';
              }       
                
                $tabla.='</tr>';   
              
  $this->view->setVar('tabla', $tabla);                      
                    
        /*
        end table
         */
        $tablacontratos = "";
        $model = new Planpagos();
        $resul = $model->lista20();
          foreach ($resul as $v) {
            $porcobrar=$v->total-$v->deposito;
            $tablacontratos.='<tr>';
            // $tablacontratos.='<td class="text-center"><img src="'.$this->foto($v->carpeta,$v->nombre_archivo).'" alt="avatar" class="img-circle" /></td>';
            $tablacontratos.='<td><a href="/clientes/view/'.$v->cliente_id.'">'.$v->razon_social.'</a></td>';
            $tablacontratos.='<td><a href="/contratos/crear/'.$v->contrato_id.'">'.$v->contrato.'</a></td>';
            $tablacontratos.='<td class="text-right">'.number_format($v->total,'2','.',',').'</td>';
            $tablacontratos.='<td class="text-right">'.number_format($v->deposito,'2','.',',').'</td>';
            $tablacontratos.='<td class="text-right">'.number_format($porcobrar,'2','.',',').'</td>';
            $tablacontratos.='<td class="text-right">'.number_format($v->mora,'2','.',',').'</td>';
            // // $tablacontratos.='<td class="text-center"><img src="'.$this->foto($v->carpeta,$v->nombre_archivo).'" alt="avatar" class="img-circle" /></td>';
            $tablacontratos.='</tr>';
          }
            
            $this->view->setVar('tablacontratos', $tablacontratos);                      
        

        /*
        Tabla de contratos con mayore recaudacion
         */
        
    }

public function clientesAction()
{
    $model = new Clientes();
    $resul = $model->lista();
    $this->view->disable();
    foreach ($resul as $v) {
        if ($v->estado == 'Activo') {
            $estado = '<span class="label label-success">'.$v->estado.'</span>';
        }elseif ($v->estado =='Pasivo') {
            $estado = '<span class="label label-danger">'.$v->estado.'</span>';
        }else{
            $estado = '<span class="label label-primary">'.$v->estado.'</span>';
        }
        $customers[] = array(
            'id' => $v->id,
            'razon_social_href' => '<a href="/clientes/view/'.$v->id.'">'.$v->razon_social.'</a>',
            'razon_social' => $v->razon_social,
            'foto' => $this->foto($v->carpeta,$v->nombre_archivo)
            );
    }
    echo json_encode($customers);
}

public function foto($carpeta='', $archivo) {
    $file = "/file/clientes/logo_comodin.png";
    if (file_exists($carpeta . $archivo)) {
        $file = "/".$carpeta . $archivo;
    } 
    return $file;
}
   
public function productosgrupo($grupo_id='',$linea_id='')
{
    $model = new Productos();
    $resul1 = $model->cantidadProductosAlquilados($grupo_id,$linea_id);
    $resul2 = $model->cantidadProductos($grupo_id,$linea_id);
    $resp = array('cantidad'=>$resul2[0]->cantidad,'cantidad_disponible'=>$resul2[0]->cantidad-$resul1[0]->cantidad_alquilada,'cantidad_alquilada'=>$resul1[0]->cantidad_alquilada);
    return $resp;
}

public function productosespacio($espacio_id='',$linea_id='')
{
    $model = new Productos();
    $resul1 = $model->gruposProductosAlquilados($espacio_id,$linea_id);
    $resul2 = $model->gruposProductos($espacio_id,$linea_id);
    $resp = array('cantidad'=>$resul2[0]->cantidad,'cantidad_disponible'=>$resul2[0]->cantidad-$resul1[0]->cantidad_alquilada,'cantidad_alquilada'=>$resul1[0]->cantidad_alquilada);
    return $resp;
}


   
   
}
