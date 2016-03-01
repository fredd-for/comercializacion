<?php 
/**
* 
*/
class ProductosController extends ControllerBase
{
	
	public function indexAction($opcion='',$grupo_id='',$linea_id='')
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
                ->addJs('/jqwidgets/jqxpanel.js')
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
                ->addJs('/scripts/productos/exportar.js')
                ->addJs('/media/plugins/bootbox/bootbox.min.js')
                ->addJs('/jqwidgets/jqxtooltip.js')
                ->addJs('/media/plugins/form-validation/jquery.validate.js')
        ;

        $this->view->setVar('opcion', $opcion);     // opcion de ordenacion 
        
        $grupo_f = Grupos::findFirstById($grupo_id);
        $this->view->setVar('grupo_f', $grupo_f->grupo);

        $linea_f = Lineas::findFirstById($linea_id);
        $this->view->setVar('linea_f', $linea_f->linea);

        $linea = $this->tag->select(
                array(
                    'linea_id',
                    Lineas::find(array('baja_logica=1', 'order' => 'id ASC')),
                    'using' => array('id', "linea"),
                    'useEmpty' => true,
                    'emptyText' => '(Selecionar)',
                    'emptyValue' => '',
                    'class' => 'form-control',
                    'required' => 'required',
                    'title' => 'Campo requerido'
                )
        );

        $this->view->setVar('linea', $linea);

        // $grupo = $this->tag->select(
        //         array(
        //             'grupo_id',
        //             Grupos::find(array('baja_logica=1', 'order' => 'id ASC')),
        //             'using' => array('id', "grupo"),
        //             'useEmpty' => true,
        //             'emptyText' => '(Selecionar)',
        //             'emptyValue' => '',
        //             'class' => 'form-control',
        //             'required' => 'required',
        //             'title' => 'Campo requerido'
        //         )
        // );
        $model = new Grupos();
        $grupo1 = $model->lista();
        $this->view->setVar('grupo1', $grupo1);

        $tiempo = $this->tag->selectStatic(
        array(
            "tiempo",
            array(
                "Hora" => "Hora",
                "Dia"   => "Dia",
                // "Semanal" => "Semanal",
                "Mensual" => "Mensual",
                // "Anual" => "Anual",
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

	}

  

	public function listAction()
	{
		$model = new Productos();
        $resul = $model->lista();
        $this->view->disable();
        foreach ($resul as $v) {
            $customers[] = array(
                'id' => $v->id,
                'linea_id' => $v->linea_id,
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
                'cantidad_alquilada' => $v->cantidad_alquilada,
                'cantidad_disponible' => $v->cantidad_disponible,
                // 'cant_solicitud' => $v->cant_solicitud,
                'cant_solicitud' => '<a class="solicitudes" href="javascript:void(0)" producto_id="'.$v->id.'" title="Ver Solicitudes">'.$v->cant_solicitud.'</a>',
                'tiempo' => $v->tiempo,
                'foto' => $this->foto($v->carpeta,$v->nombre_archivo)
            );
        }
        echo json_encode($customers);
	}

    public function foto($carpeta, $archivo) {
        $file = "/file/productos/images.png";
        if (file_exists($carpeta . $archivo)) {
            $file = "/".$carpeta . $archivo;
        } 
        return $file;
    }


    public function saveAction()
    {
        if (isset($_POST['id'])) {
            if ($_POST['id']>0) {
                $resul = Productos::findFirstById($this->request->getPost('id'));
                $resul->grupo_id= $this->request->getPost('grupo_id');
                $resul->estacion_id = $this->request->getPost('estacion_id');
                $resul->producto = $this->request->getPost('producto');
                $resul->codigo = $this->request->getPost('codigo');
                $resul->descripcion = $this->request->getPost('descripcion');
                $resul->precio_unitario = $this->request->getPost('precio_unitario');
                $resul->cantidad = $this->request->getPost('cantidad');
                $resul->tiempo = $this->request->getPost('tiempo');
                // $resul->usuario_reg = $this->_user->id;
                // $resul->fecha_reg = date("Y-m-d");
                // $resul->baja_logica = 1;
                if ($resul->save()) {
                    $msm ='Exito: Se guardo correctamente';
                }else{
                    $msm = 'Error: No se guardo el registro';
                }
            }
            else{
                $resul = new Productos();
                $resul->grupo_id= $this->request->getPost('grupo_id');
                $resul->estacion_id = $this->request->getPost('estacion_id');
                $resul->producto = $this->request->getPost('producto');
                $resul->codigo = $this->request->getPost('codigo');
                $resul->descripcion = $this->request->getPost('descripcion');
                $resul->precio_unitario = $this->request->getPost('precio_unitario');
                $resul->cantidad = $this->request->getPost('cantidad');
                $resul->tiempo = $this->request->getPost('tiempo');
                $resul->usuario_reg = $this->_user->id;
                $resul->fecha_reg = date("Y-m-d H:i:s");
                $resul->dimension_x = 1;
                $resul->dimension_y = 1;
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



    public function select_estacionesAction()
    {
        $resul = Estaciones::find(array('baja_logica = 1 and linea_id='.$_POST['linea_id'] , 'order' => 'id ASC' ));
        $this->view->disable();
        $options = '<option value="">(Seleccionar)</option>';
        foreach ($resul as $v) {
            $options.='<option value="'.$v->id.'" >'.$v->estacion.'</option>';
        }
        echo $options; 
    }

    public function deleteAction(){
        $resul = Productos::findFirstById($this->request->getPost('id'));
        $resul->baja_logica = 0;
        if ($resul->save()) {
                    $msm ='Exito: Se elimino correctamente';
                }else{
                    $msm = 'Error: No se guardo el registro';
                }
        $this->view->disable();
        echo $msm;
    }

    public function galeriaAction($producto_id)
    {

        if ($this->request->hasFiles() == true) {
                foreach ($this->request->getUploadedFiles() as $file) {
                //Move the file into the application
                $carpeta = "file/productos/";
                    $path = $carpeta.date("Ymd_his").$file->getName();
                    if($file->moveTo($path)) {
                        $resul3 = new Archivos();
                        $resul3->producto_id = $producto_id;
                        $resul3->tipo_archivo = $file->getType();
                        $resul3->nombre_archivo = date("Ymd_his").$file->getName();
                        $resul3->carpeta = $carpeta;
                        $resul3->tamanio = $file->getSize();
                        $resul3->usuario_reg = $this->_user->id;
                        $resul3->fecha_reg = date("Y-m-d h:i:s");
                        $resul3->estado = 0;
                        $resul3->baja_logica = 1;
                        $resul3->tabla = 1;
                        if ($resul3->save()) {
                            $this->flashSession->success("Exito: Registro guardado correctamente...");    
                        }else{
                            $this->flashSession->error("Error: no se a guardado el registro...");    
                        }
                    } else {
                        die("Acurrio algun error.");    
                    } 
                }
            }

             $this->assets
                ->addCss('/assets/css/widget_galeria.css')
                ->addCss('/js/fileinput/css/fileinput.min.css')
                ;
            $this->assets
                ->addJs('/assets/js/app.js')
                ->addJs('/assets/js/plugins.js')
                ->addJs('/scripts/productos/galeria.js')
                ->addJs('/js/fileinput/js/fileinput.min.js')
                ->addJs('/js/fileinput/js/fileinput_locale_es.js')
            ;

        $resul = Productos::findFirstById($producto_id);
        $this->view->setVar('producto',$resul);
        $archivo = Archivos::find(array("baja_logica=1 and producto_id='$producto_id'"));
        $this->view->setVar('archivo',$archivo);
        // $this->view->setVar('producto_id', $producto_id);


    }

    public function imagenactivarAction($archivo_id)
    {
        $model = new Archivos();
        $r = $model->desactivarTodo($archivo_id);
        $resul = Archivos::findFirstById($archivo_id);
        $resul->estado = 1;
        if ($resul->save()) {
                    $this->flashSession->success("Exito: Se activo correctamente...");    
                }else{
                    $this->flashSession->error("Error: no se a activado ...");    
                }
        $this->response->redirect('/productos/galeria/'.$resul->producto_id);
    }

    public function imagendeleteAction($archivo_id)
    {
        $resul = Archivos::findFirstById($archivo_id);
        $resul->baja_logica = 0;
        if ($resul->save()) {
                    $this->flashSession->success("Exito: Se elimino correctamente...");    
                }else{
                    $this->flashSession->error("Error: no se a eliminado ...");    
                }
        $this->response->redirect('/productos/galeria/'.$resul->producto_id);
    }

    public function alquilarAction()
    {
        $this->assets
                ->addCss('/assets/css/widget_galeria.css')
                ->addCss('/js/fileinput/css/fileinput.min.css')
                ;
        $this->assets
                ->addJs('/assets/js/app.js')
                ->addJs('/assets/js/plugins.js')
                // ->addJs('/scripts/productos/alquilar.js')
                ->addJs('/js/fileinput/js/fileinput.min.js')
            ;
        $model = new Productos();
        $resul = $model->lista(1);
        $this->view->setVar('producto',$resul);
    }

    public function reporteAction()
    {
$this->view->disable();
$model = new Productos();
$resul = $model->lista();
        

include_once('tbs_us/tbs_class.php'); // Load the TinyButStrong template engine
include_once ('tbs_us/tbs_plugin_opentbs/tbs_plugin_opentbs.php'); // Load the OpenTBS plugin

$TBS = new clsTinyButStrong; // new instance of TBS
$TBS->Plugin(TBS_INSTALL, OPENTBS_PLUGIN); // load the OpenTBS plugin

$TBS->VarRef['usuario'] = $this->_user->nombre.' '.$this->_user->paterno;

$data = array();
$c=1;
foreach ($resul as $v) {
    $data[] = array('rank'=> 'A', 'nro'=>$c ,'linea'=>$v->linea , 'estacion'=>$v->estacion, 'grupo'=>$v->grupo, 'producto'=>$v->producto, 'codigo'=>$v->codigo, 'descripcion'=>$v->descripcion,'precio_unitario'=>$v->precio_unitario,'cantidad'=>$v->cantidad,'tiempo'=>$v->tiempo);            
    $c++;
}

$template = 'file/template/temp_reporte.xlsx';
$TBS->LoadTemplate($template, OPENTBS_ALREADY_UTF8); // Also merge some [onload] automatic fields (depends of the type of document).

// ----------------------
// Debug mode of the demo
// ----------------------
// if (isset($_POST['debug']) && ($_POST['debug']=='current')) $TBS->Plugin(OPENTBS_DEBUG_XML_CURRENT, true); // Display the intented XML of the current sub-file, and exit.
// if (isset($_POST['debug']) && ($_POST['debug']=='info'))    $TBS->Plugin(OPENTBS_DEBUG_INFO, true); // Display information about the document, and exit.
// if (isset($_POST['debug']) && ($_POST['debug']=='show'))    $TBS->Plugin(OPENTBS_DEBUG_XML_SHOW); // Tells TBS to display information when the document is merged. No exit.

// Merge data in the first sheet
$TBS->MergeBlock('a,b', $data);

// -----------------
// Output the result
// -----------------
// $output_file_name = str_replace('.', '_'.date('Y-m-d').'.', $template);
$output_file_name = date('Y-m-d').' '.'reporte.xlsx';
$TBS->Show(OPENTBS_DOWNLOAD, $output_file_name); // Also merges all [onshow] automatic fields.
exit();

}

public function exportexcelAction($n_rows, $columns, $filtros, $groups, $sorteds)
    {
        $this->view->disable();
        $columns = base64_decode(str_pad(strtr($columns, '-_', '+/'), strlen($columns) % 4, '=', STR_PAD_RIGHT));
        $filtros = base64_decode(str_pad(strtr($filtros, '-_', '+/'), strlen($columns) % 4, '=', STR_PAD_RIGHT));
        $groups = base64_decode(str_pad(strtr($groups, '-_', '+/'), strlen($groups) % 4, '=', STR_PAD_RIGHT));
        if ($groups == 'null' || $groups == null) $groups = "";
        $sorteds = base64_decode(str_pad(strtr($sorteds, '-_', '+/'), strlen($sorteds) % 4, '=', STR_PAD_RIGHT));
        $columns = json_decode($columns, true);
        $filtros = json_decode($filtros, true);
        $sub_keys = array_keys($columns);//echo $sub_keys[0];
        $n_col = count($columns);//echo$keys[1];
        $sorteds = json_decode($sorteds, true);
        /**
         * Especificando la configuración de las columnas
         */
        $generalConfigForAllColumns = array(
            'nro_row' => array('title' => 'Nro.', 'width' => 8, 'title-align' => 'C', 'align' => 'C', 'type' => 'int4'),
            'grupo' => array('title' => 'Grupo', 'width' => 20, 'align' => 'C', 'type' => 'varchar'),
            'linea' => array('title' => 'Linea', 'width' => 20, 'align' => 'C', 'type' => 'varchar'),
            'estacion' => array('title' => 'Estacion', 'width' => 15, 'align' => 'C', 'type' => 'varchar'),
            'producto' => array('title' => 'Producto', 'width' => 30, 'align' => 'L', 'type' => 'varchar'),
            'codigo' => array('title' => 'Codigo', 'width' => 12, 'align' => 'C', 'type' => 'varchar'),
            'descripcion' => array('title' => 'Descripcion', 'width' => 8, 'align' => 'C', 'type' => 'varchar'),
            'precio_unitario' => array('title' => 'Precio Unitario', 'width' => 18, 'align' => 'R', 'type' => 'number'),
            'cantidad' => array('title' => 'Cantidad', 'width' => 30, 'align' => 'R', 'type' => 'number'),
            'cantidad_alquilada' => array('title' => 'Cantidad Alquilada', 'width' => 30, 'align' => 'R', 'type' => 'number'),
            'cantidad_disponible' => array('title' => 'Cantidad Disponible', 'width' => 20, 'align' => 'R', 'type' => 'number'),
            'tiempo' => array('title' => 'Tiempo', 'width' => 30, 'align' => 'L', 'type' => 'varchar'),
        );
        $agruparPor = ($groups != "") ? explode(",", $groups) : array();
        $widthsSelecteds = $this->DefineWidths($generalConfigForAllColumns, $columns, $agruparPor);
        $ancho = 0;
        if (count($widthsSelecteds) > 0) {
            foreach ($widthsSelecteds as $w) {
                $ancho = $ancho + $w;
            }
            $excel = new exceloasis();
            $excel->tableWidth = $ancho;
            #region Proceso de generación del documento Excel
            $excel->debug = 0;
            $excel->title_rpt = utf8_decode('Reporte Productos');
            $excel->header_title_empresa_rpt = utf8_decode('Empresa Estatal de Transporte por Cable "Mi Teleférico"');
            $alignSelecteds = $excel->DefineAligns($generalConfigForAllColumns, $columns, $agruparPor);
            $colSelecteds = $excel->DefineCols($generalConfigForAllColumns, $columns, $agruparPor);
            $colTitleSelecteds = $excel->DefineTitleCols($generalConfigForAllColumns, $columns, $agruparPor);
            $alignTitleSelecteds = $excel->DefineTitleAligns(count($colTitleSelecteds));
            $formatTypes = $excel->DefineTypeCols($generalConfigForAllColumns, $columns, $agruparPor);
            $gruposSeleccionadosActuales = $excel->DefineDefaultValuesForGroups($groups);
            $excel->generalConfigForAllColumns = $generalConfigForAllColumns;
            $excel->colTitleSelecteds = $colTitleSelecteds;
            $excel->widthsSelecteds = $widthsSelecteds;
            $excel->alignSelecteds = $alignSelecteds;
            $excel->alignTitleSelecteds = $alignTitleSelecteds;

            $cantCol = count($colTitleSelecteds);
            $excel->ultimaLetraCabeceraTabla = $excel->columnasExcel[$cantCol - 1];
            $excel->penultimaLetraCabeceraTabla = $excel->columnasExcel[$cantCol - 2];
            $excel->numFilaCabeceraTabla = 4;
            $excel->primeraLetraCabeceraTabla = "A";
            $excel->segundaLetraCabeceraTabla = "B";
            $excel->celdaInicial = $excel->primeraLetraCabeceraTabla . $excel->numFilaCabeceraTabla;
            $excel->celdaFinal = $excel->ultimaLetraCabeceraTabla . $excel->numFilaCabeceraTabla;
            if ($cantCol <= 9) {
                $excel->defineOrientation("V");
                $excel->defineSize("C");
            } elseif ($cantCol <= 13) {
                $excel->defineOrientation("H");
                $excel->defineSize("C");
            } else {
                $excel->defineOrientation("H");
                $excel->defineSize("O");
            }
            if ($excel->debug == 1) {
                echo "<p>::::::::::::::::::::::::::::::::::::::::::::COLUMNAS::::::::::::::::::::::::::::::::::::::::::<p>";
                print_r($columns);
                echo "<p>::::::::::::::::::::::::::::::::::::::::::::FILTROS::::::::::::::::::::::::::::::::::::::::::<p>";
                print_r($filtros);
                echo "<p>::::::::::::::::::::::::::::::::::::::::::::GRUPOS::::::::::::::::::::::::::::::::::::::::::::<p>";
                echo "<p>" . $groups;
                echo "<p>::::::::::::::::::::::::::::::::::::::::::::ORDEN::::::::::::::::::::::::::::::::::::::::::::<p>";
                print_r($sorteds);
                echo "<p>:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::<p>";
            }
            $where = '';
            $yaConsiderados = array();
            for ($k = 0; $k < count($filtros); $k++) {
                $cant = $this->obtieneCantidadVecesConsideracionPorColumnaEnFiltros($filtros[$k]['columna'], $filtros);
                $arr_val = $this->obtieneValoresConsideradosPorColumnaEnFiltros($filtros[$k]['columna'], $filtros);

                for ($j = 0; $j < $n_col; $j++) {
                    if ($sub_keys[$j] == $filtros[$k]['columna']) {
                        $col_fil = $columns[$sub_keys[$j]]['text'];
                    }
                }
                if ($filtros[$k]['tipo'] == 'datefilter') {
                    $filtros[$k]['valor'] = date("Y-m-d", strtotime($filtros[$k]['valor']));
                }
                $cond_fil = ' ' . $col_fil;
                if (!in_array($filtros[$k]['columna'], $yaConsiderados)) {

                    if (strlen($where) > 0) {
                        switch ($filtros[$k]['condicion']) {
                            case 'EMPTY':
                                $where .= ' AND ';
                                break;
                            case 'NOT_EMPTY':
                                $where .= ' AND ';
                                break;
                            case 'CONTAINS':
                                $where .= ' AND ';
                                break;
                            case 'EQUAL':
                                $where .= ' AND ';
                                break;
                            case 'GREATER_THAN_OR_EQUAL':
                                $where .= ' AND ';
                                break;
                            case 'LESS_THAN_OR_EQUAL':
                                $where .= ' AND ';
                                break;
                        }
                    }
                }
                if ($cant > 1) {
                    if ($excel->debug == 1) {
                        echo "<p>::::::::::::::::::::::::::::::::::::YA CONSIDERADOS:::::::::::::::::::::::::::::::::::::::::::::::<p>";
                        print_r($yaConsiderados);
                        echo "<p>::::::::::::::::::::::::::::::::::::YA CONSIDERADOS:::::::::::::::::::::::::::::::::::::::::::::::<p>";
                    }
                    if (!in_array($filtros[$k]['columna'], $yaConsiderados)) {
                        switch ($filtros[$k]['condicion']) {
                            case 'EMPTY':
                                $cond_fil .= utf8_encode(" que sea vacía ");
                                $where .= "(" . $filtros[$k]['columna'] . " IS NULL OR " . $filtros[$k]['columna'] . " LIKE '')";
                                break;
                            case 'NOT_EMPTY':
                                $cond_fil .= utf8_encode(" que no sea vacía ");
                                $where .= "(" . $filtros[$k]['columna'] . " IS NOT NULL OR " . $filtros[$k]['columna'] . " NOT LIKE '')";
                                break;
                            case 'CONTAINS':
                                $cond_fil .= utf8_encode(" que contenga el valor:  " . $filtros[$k]['valor']);
                                if ($filtros[$k]['columna'] == "nombres") {
                                    $where .= "(p_nombre LIKE '%" . $filtros[$k]['valor'] . "%' OR s_nombre LIKE '%" . $filtros[$k]['valor'] . "%' OR t_nombre LIKE '%" . $filtros[$k]['valor'] . "%' OR p_apellido LIKE '%" . $filtros[$k]['valor'] . "%' OR s_apellido LIKE '%" . $filtros[$k]['valor'] . "%' OR c_apellido LIKE '%" . $filtros[$k]['valor'] . "%')";
                                } else {
                                    $where .= $filtros[$k]['columna'] . " LIKE '%" . $filtros[$k]['valor'] . "%'";
                                }
                                break;
                            case 'EQUAL':
                                $cond_fil .= utf8_encode(" que contenga el valor:  " . $filtros[$k]['valor']);
                                $ini = 0;
                                foreach ($arr_val as $col) {
                                    if ($excel->debug == 1) {

                                        echo "<p>.........................recorriendo las columnas multiseleccionadas: .............................................";
                                        echo $filtros[$k]['columna'] . "-->" . $col;
                                        echo "<p>.........................recorriendo las columnas multiseleccionadas: .............................................";
                                    }
                                    if (isset($generalConfigForAllColumns[$filtros[$k]['columna']]['type'])) {
                                        //$where .= $filtros[$k]['columna']." ILIKE '".$filtros[$k]['valor']."'";
                                        if ($ini == 0) {
                                            $where .= " (";
                                        }
                                        switch (@$generalConfigForAllColumns[$filtros[$k]['columna']]['type']) {
                                            case 'int4':
                                            case 'numeric':
                                            case 'date':
                                                //$whereEqueals .= $filtros[$k]['columna']." = '".$filtros[$k]['valor']."'";
                                                $where .= $filtros[$k]['columna'] . " = '" . $col . "'";
                                                break;
                                            case 'varchar':
                                            case 'bpchar':
                                                //$whereEqueals .= $filtros[$k]['columna']." ILIKE '".$filtros[$k]['valor']."'";
                                                $where .= $filtros[$k]['columna'] . " LIKE '" . $col . "'";
                                                break;
                                        }
                                        $ini++;
                                        if ($ini == count($arr_val)) {
                                            $where .= ") ";
                                        } else $where .= " OR ";
                                    }
                                }
                                break;
                            case 'GREATER_THAN_OR_EQUAL':
                                $cond_fil .= utf8_encode(" que sea mayor o igual que:  " . $filtros[$k]['valor']);
                                $ini = 0;
                                foreach ($arr_val as $col) {
                                    //$fecha = date("Y-m-d", $col);
                                    $fecha = $col;
                                    if (isset($generalConfigForAllColumns[$filtros[$k]['columna']]['type'])) {
                                        //$where .= $filtros[$k]['columna']." ILIKE '".$filtros[$k]['valor']."'";
                                        if ($ini == 0) {
                                            $where .= " (";
                                        }
                                        switch (@$generalConfigForAllColumns[$filtros[$k]['columna']]['type']) {
                                            case 'int4':
                                            case 'numeric':
                                                $where .= $filtros[$k]['columna'] . " = '" . $fecha . "'";
                                                break;
                                            case 'date':
                                                //$whereEqueals .= $filtros[$k]['columna']." = '".$filtros[$k]['valor']."'";
                                                if ($ini == 0) {
                                                    $where .= $filtros[$k]['columna'] . " BETWEEN ";
                                                } else {
                                                    $where .= " AND ";
                                                }
                                                $where .= "'" . $fecha . "'";

                                                break;
                                            case 'varchar':
                                            case 'bpchar':
                                                //$whereEqueals .= $filtros[$k]['columna']." ILIKE '".$filtros[$k]['valor']."'";
                                                $where .= $filtros[$k]['columna'] . " LIKE '" . $col . "'";
                                                break;
                                        }
                                        $ini++;
                                        if ($ini == count($arr_val)) {
                                            $where .= ") ";
                                        }
                                    }
                                }
                                break;
                            case 'LESS_THAN_OR_EQUAL':
                                $cond_fil .= utf8_encode(" que sea menor o igual que:  " . $filtros[$k]['valor']);
                                $where .= $filtros[$k]['columna'] . ' <= "' . $filtros[$k]['valor'] . '"';
                                break;
                        }
                        $yaConsiderados[] = $filtros[$k]['columna'];
                    }
                } else {
                    switch ($filtros[$k]['condicion']) {
                        case 'EMPTY':
                            $cond_fil .= utf8_encode(" que sea vacía ");
                            $where .= "(" . $filtros[$k]['columna'] . " IS NULL OR " . $filtros[$k]['columna'] . " LIKE '')";
                            break;
                        case 'NOT_EMPTY':
                            $cond_fil .= utf8_encode(" que no sea vacía ");
                            $where .= "(" . $filtros[$k]['columna'] . " IS NOT NULL OR " . $filtros[$k]['columna'] . " NOT LIKE '')";
                            break;
                        case 'CONTAINS':
                            $cond_fil .= utf8_encode(" que contenga el valor:  " . $filtros[$k]['valor']);
                            if ($filtros[$k]['columna'] == "nombres") {
                                $where .= "(p_nombre LIKE '%" . $filtros[$k]['valor'] . "%' OR s_nombre LIKE '%" . $filtros[$k]['valor'] . "%' OR t_nombre LIKE '%" . $filtros[$k]['valor'] . "%' OR p_apellido LIKE '%" . $filtros[$k]['valor'] . "%' OR s_apellido LIKE '%" . $filtros[$k]['valor'] . "%' OR c_apellido LIKE '%" . $filtros[$k]['valor'] . "%')";
                            } else {
                                $where .= $filtros[$k]['columna'] . " LIKE '%" . $filtros[$k]['valor'] . "%'";
                            }
                            break;
                        case 'EQUAL':
                            $cond_fil .= utf8_encode(" que contenga el valor:  " . $filtros[$k]['valor']);
                            if (isset($generalConfigForAllColumns[$filtros[$k]['columna']]['type'])) {
                                //$where .= $filtros[$k]['columna']." LIKE '".$filtros[$k]['valor']."'";
                                switch (@$generalConfigForAllColumns[$filtros[$k]['columna']]['type']) {
                                    case 'int4':
                                    case 'numeric':
                                    case 'date':
                                        //$whereEqueals .= $filtros[$k]['columna']." = '".$filtros[$k]['valor']."'";
                                        $where .= $filtros[$k]['columna'] . " = '" . $filtros[$k]['valor'] . "'";
                                        break;
                                    case 'varchar':
                                    case 'bpchar':
                                        //$whereEqueals .= $filtros[$k]['columna']." LIKE '".$filtros[$k]['valor']."'";
                                        $where .= $filtros[$k]['columna'] . " LIKE '" . $filtros[$k]['valor'] . "'";
                                        break;
                                }
                            }
                            break;
                        case 'GREATER_THAN_OR_EQUAL':
                            $cond_fil .= utf8_encode(" que sea mayor o igual que:  " . $filtros[$k]['valor']);
                            $where .= $filtros[$k]['columna'] . ' >= "' . $filtros[$k]['valor'] . '"';
                            break;
                        case 'LESS_THAN_OR_EQUAL':
                            $cond_fil .= utf8_encode(" que sea menor o igual que:  " . $filtros[$k]['valor']);
                            $where .= $filtros[$k]['columna'] . ' <= "' . $filtros[$k]['valor'] . '"';
                            break;
                    }
                }

            }
            $obj = new Productos();
            // if ($where != "") $where = " WHERE " . $where;
            if ($where != "") $where = " AND " . $where;
            $groups_aux = "";
            if ($groups != "") {
                /**
                 * Se verifica que no se considere la columna nombres debido a que contenido ya esta ordenado por las
                 * columnas p_apellido, s_apellido, c_apellido, p_anombre, s_nombre, t_nombre
                 */
                if (strrpos($groups, "nombres")) {
                    if (strrpos($groups, ",")) {
                        $arr = explode(",", $groups);
                        foreach ($arr as $val) {
                            if ($val != "nombres")
                                $groups_aux[] = $val;
                        }
                        $groups = implode(",", $groups_aux);
                    } else $groups = "";
                }
                if (is_array($sorteds) && count($sorteds) > 0) {
                    if ($groups != "") $groups .= ",";
                    $coma = "";
                    if ($excel->debug == 1) {
                        echo "<p>===========================================Orden======================================</p>";
                        print_r($sorteds);
                        echo "<p>===========================================Orden======================================</p>";
                    }
                    foreach ($sorteds as $ord => $orden) {
                        $groups .= $coma . $ord;
                        if ($orden['asc'] == '') $groups .= " ASC"; else$groups .= " DESC";
                        $coma = ",";
                    }
                }
                if ($groups != "")
                    $groups = " ORDER BY " . $groups . ",p_apellido,s_apellido,c_apellido,p_nombre,s_nombre,t_nombre,id_da,fecha_ini";
                if ($excel->debug == 1) echo "<p>La consulta es: " . $groups . "<p>";
            } else {
                if (is_array($sorteds) && count($sorteds) > 0) {
                    $coma = "";
                    if ($excel->debug == 1) {
                        echo "<p>===========================================Orden======================================</p>";
                        print_r($sorteds);
                        echo "<p>===========================================Orden======================================</p>";
                    }
                    foreach ($sorteds as $ord => $orden) {
                        $groups .= $coma . $ord;
                        if ($orden['asc'] == '') $groups .= " ASC"; else$groups .= " DESC";
                        $coma = ",";
                    }
                    $groups = " ORDER BY " . $groups;
                }

            }
            if ($excel->debug == 1) echo "<p>WHERE------------------------->" . $where . "<p>";
            if ($excel->debug == 1) echo "<p>GROUP BY------------------------->" . $groups . "<p>";
            $resul = $obj->lista(0,$where,$groups);

            $relaboral = array();
            foreach ($resul as $v) {
                $relaboral[] = array(
                    'grupo' => $v->grupo,
                    'linea' => $v->linea,
                    'estacion' => $v->estacion,
                    'producto' => $v->producto,
                    'codigo' => $v->codigo,
                    'descripcion' => $v->descripcion,
                    'precio_unitario' => $v->precio_unitario,
                    'cantidad' => $v->cantidad,
                    'cantidad_alquilada' => $v->cantidad_alquilada,
                    'cantidad_disponible' => $v->cantidad_disponible,
                    'tiempo' => $v->tiempo
                );
            }
            #region Espacio para la definición de valores para la cabecera de la tabla
            $excel->FechaHoraReporte = date("d-m-Y H:i:s");
            $j = 0;
            $agrupadores = array();
            if ($groups != "")
                $agrupadores = explode(",", $groups);

            $dondeCambio = array();
            $queCambio = array();
            $excel->header();
            $fila = $excel->numFilaCabeceraTabla;
            if (count($relaboral) > 0) {
                $excel->RowTitle($colTitleSelecteds, $fila);
                $celdaInicial = $excel->primeraLetraCabeceraTabla . $fila;
                $celdaFinalDiagonalTabla = $excel->ultimaLetraCabeceraTabla . $fila;
                if ($excel->debug == 1) {
                    echo "<p>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||<p></p>";
                    print_r($relaboral);
                    echo "<p>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||<p></p>";
                }
                foreach ($relaboral as $i => $val) {
                    if (count($agrupadores) > 0) {
                        if ($excel->debug == 1) {
                            echo "<p>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||<p></p>";
                            print_r($gruposSeleccionadosActuales);
                            echo "<p>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||<p></p>";
                        }
                        $agregarAgrupador = 0;
                        $aux = array();
                        $dondeCambio = array();
                        foreach ($gruposSeleccionadosActuales as $key => $valor) {
                            if ($valor != $val[$key]) {
                                $agregarAgrupador = 1;
                                $aux[$key] = $val[$key];
                                $dondeCambio[] = $key;
                                $queCambio[$key] = $val[$key];
                            } else {
                                $aux[$key] = $val[$key];
                            }
                        }
                        $gruposSeleccionadosActuales = $aux;
                        if ($agregarAgrupador == 1) {
                            $agr = $excel->DefineTitleColsByGroups($generalConfigForAllColumns, $dondeCambio, $queCambio);
                            if ($excel->debug == 1) {
                                echo "<p>+++++++++++++++++++++++++++AGRUPADO POR++++++++++++++++++++++++++++++++++++++++<p></p>";
                                print_r($agr);
                                echo "<p>+++++++++++++++++++++++++++AGRUPADO POR++++++++++++++++++++++++++++++++++++++++<p></p>";
                            }
                            $excel->borderGroup($celdaInicial, $celdaFinalDiagonalTabla);
                            $fila++;
                            /*
                             * Si es que hay agrupadores, se inicia el conteo desde donde empieza el agrupador
                             */
                            $celdaInicial = $excel->primeraLetraCabeceraTabla . $fila;
                            $excel->Agrupador($agr, $fila);
                            $excel->RowTitle($colTitleSelecteds, $fila);
                        }
                        $celdaFinalDiagonalTabla = $excel->ultimaLetraCabeceraTabla . $fila;
                        $rowData = $excel->DefineRows($j + 1, $relaboral[$j], $colSelecteds);
                        if ($excel->debug == 1) {
                            echo "<p>···································FILA·················································<p></p>";
                            print_r($rowData);
                            echo "<p>···································FILA·················································<p></p>";
                        }
                        $excel->Row($rowData, $alignSelecteds, $formatTypes, $fila);
                        $fila++;

                    } else {
                        $celdaFinalDiagonalTabla = $excel->ultimaLetraCabeceraTabla . $fila;
                        $rowData = $excel->DefineRows($j + 1, $val, $colSelecteds);
                        if ($excel->debug == 1) {
                            echo "<p>···································FILA·················································<p></p>";
                            print_r($rowData);
                            echo "<p>···································FILA·················································<p></p>";
                        }
                        $excel->Row($rowData, $alignSelecteds, $formatTypes, $fila);
                        $fila++;
                    }
                    $j++;
                }
                $fila--;
                $celdaFinalDiagonalTabla = $excel->ultimaLetraCabeceraTabla . $fila;
                $excel->borderGroup($celdaInicial, $celdaFinalDiagonalTabla);
            }
            $excel->ShowLeftFooter = true;
            //$excel->secondPage();
            if ($excel->debug == 0) {
                $excel->display("AppData/reporte_productos.xls", "I");
            }
            #endregion Proceso de generación del documento PDF
        }
    }

// public function exportexcelAction($n_rows,$columns, $filtros, $groups, $sorteds)
//     {
//         $this->view->disable();
//         $columns = base64_decode(str_pad(strtr($columns, '-_', '+/'), strlen($columns) % 4, '=', STR_PAD_RIGHT));
//         $filtros = base64_decode(str_pad(strtr($filtros, '-_', '+/'), strlen($columns) % 4, '=', STR_PAD_RIGHT));
//         $groups = base64_decode(str_pad(strtr($groups, '-_', '+/'), strlen($groups) % 4, '=', STR_PAD_RIGHT));
//         if ($groups == 'null' || $groups == null) $groups = "";
//         $sorteds = base64_decode(str_pad(strtr($sorteds, '-_', '+/'), strlen($sorteds) % 4, '=', STR_PAD_RIGHT));
//         $columns = json_decode($columns, true);
//         $filtros = json_decode($filtros, true);
//         $sub_keys = array_keys($columns);//echo $sub_keys[0];
//         $n_col = count($columns);//echo$keys[1];
//         $sorteds = json_decode($sorteds, true);
//         /**
//          * Especificando la configuración de las columnas
//          */
//         $generalConfigForAllColumns = array(
//             'nro_row' => array('title' => 'Nro.', 'width' => 8, 'title-align' => 'C', 'align' => 'C', 'type' => 'int4'),
//             'grupo' => array('title' => 'Grupoxx', 'width' => 20, 'align' => 'C', 'type' => 'varchar'),
//             'estacion' => array('title' => 'Estacion', 'width' => 20, 'align' => 'C', 'type' => 'varchar'),
//             'linea' => array('title' => 'Linea', 'width' => 15, 'align' => 'C', 'type' => 'varchar'),
//             'producto' => array('title' => 'Producto', 'width' => 30, 'align' => 'L', 'type' => 'varchar'),
//             'codigo' => array('title' => 'Codigo', 'width' => 12, 'align' => 'C', 'type' => 'varchar'),
//             'descripcion' => array('title' => 'Descripcion', 'width' => 30, 'align' => 'C', 'type' => 'varchar'),
//             'precio_unitario' => array('title' => 'Precio Unitario', 'width' => 18, 'align' => 'C', 'type' => 'varchar'),
//             'cantidad' => array('title' => 'Cantidad Total', 'width' => 30, 'align' => 'L', 'type' => 'varchar'),
//             'cantidad_alquilada' => array('title' => 'Cantidad Alquilada', 'width' => 30, 'align' => 'L', 'type' => 'varchar'),
//             'cantidad_disponible' => array('title' => 'Area', 'Cantidad Disponible' => 20, 'align' => 'L', 'type' => 'varchar'),
//             'tiempo' => array('title' => 'Tiempo', 'width' => 30, 'align' => 'L', 'type' => 'varchar'),
//         );
//         $agruparPor = ($groups != "") ? explode(",", $groups) : array();
//         $widthsSelecteds = $this->DefineWidths($generalConfigForAllColumns, $columns, $agruparPor);
//         $ancho = 0;
//         if (count($widthsSelecteds) > 0) {
//             foreach ($widthsSelecteds as $w) {
//                 $ancho = $ancho + $w;
//             }
//             if ($ancho > 215.9) {
//                 if ($ancho > 270) {
//                     $pdf = new pdfoasis('L', 'mm', 'Legal');
//                     $pdf->pageWidth = 355;
//                 } else {
//                     $pdf = new pdfoasis('L', 'mm', 'Letter');
//                     $pdf->pageWidth = 280;
//                 }
//             } else {
//                 $pdf = new pdfoasis('P', 'mm', 'Letter');
//                 $pdf->pageWidth = 215.9;
//             }
//             $pdf->tableWidth = $ancho;
//             #region Proceso de generación del documento PDF
//             $pdf->debug = 1;
//             $pdf->title_rpt = utf8_decode('Reporte Relación Laboral');
//             $pdf->header_title_empresa_rpt = utf8_decode('Empresa Estatal de Transporte por Cable "Mi Teleférico"');
//             $alignSelecteds = $pdf->DefineAligns($generalConfigForAllColumns, $columns, $agruparPor);
//             $colSelecteds = $pdf->DefineCols($generalConfigForAllColumns, $columns, $agruparPor);
//             $colTitleSelecteds = $pdf->DefineTitleCols($generalConfigForAllColumns, $columns, $agruparPor);
//             $alignTitleSelecteds = $pdf->DefineTitleAligns(count($colTitleSelecteds));
//             $gruposSeleccionadosActuales = $pdf->DefineDefaultValuesForGroups($groups);
//             $pdf->generalConfigForAllColumns = $generalConfigForAllColumns;
//             $pdf->colTitleSelecteds = $colTitleSelecteds;
//             $pdf->widthsSelecteds = $widthsSelecteds;
//             $pdf->alignSelecteds = $alignSelecteds;
//             $pdf->alignTitleSelecteds = $alignTitleSelecteds;
//             if ($pdf->debug == 1) {
//                 echo "<p>::::::::::::::::::::::::::::::::::::::::::::COLUMNAS::::::::::::::::::::::::::::::::::::::::::<p>";
//                 print_r($columns);
//                 echo "<p>::::::::::::::::::::::::::::::::::::::::::::FILTROS::::::::::::::::::::::::::::::::::::::::::<p>";
//                 print_r($filtros);
//                 echo "<p>::::::::::::::::::::::::::::::::::::::::::::GRUPOS::::::::::::::::::::::::::::::::::::::::::::<p>";
//                 echo "<p>" . $groups;
//                 echo "<p>::::::::::::::::::::::::::::::::::::::::::::ORDEN::::::::::::::::::::::::::::::::::::::::::::<p>";
//                 print_r($sorteds);
//                 echo "<p>:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::<p>";
//             }
//             $where = '';
//             $yaConsiderados = array();
//             for ($k = 0; $k < count($filtros); $k++) {
//                 $cant = $this->obtieneCantidadVecesConsideracionPorColumnaEnFiltros($filtros[$k]['columna'], $filtros);
//                 $arr_val = $this->obtieneValoresConsideradosPorColumnaEnFiltros($filtros[$k]['columna'], $filtros);

//                 for ($j = 0; $j < $n_col; $j++) {
//                     if ($sub_keys[$j] == $filtros[$k]['columna']) {
//                         $col_fil = $columns[$sub_keys[$j]]['text'];
//                     }
//                 }
//                 if ($filtros[$k]['tipo'] == 'datefilter') {
//                     $filtros[$k]['valor'] = date("Y-m-d", strtotime($filtros[$k]['valor']));
//                 }
//                 $cond_fil = ' ' . $col_fil;
//                 if (!in_array($filtros[$k]['columna'], $yaConsiderados)) {

//                     if (strlen($where) > 0) {
//                         switch ($filtros[$k]['condicion']) {
//                             case 'EMPTY':
//                                 $where .= ' AND ';
//                                 break;
//                             case 'NOT_EMPTY':
//                                 $where .= ' AND ';
//                                 break;
//                             case 'CONTAINS':
//                                 $where .= ' AND ';
//                                 break;
//                             case 'EQUAL':
//                                 $where .= ' AND ';
//                                 break;
//                             case 'GREATER_THAN_OR_EQUAL':
//                                 $where .= ' AND ';
//                                 break;
//                             case 'LESS_THAN_OR_EQUAL':
//                                 $where .= ' AND ';
//                                 break;
//                         }
//                     }
//                 }
//                 if ($cant > 1) {
//                     if ($pdf->debug == 1) {
//                         echo "<p>::::::::::::::::::::::::::::::::::::YA CONSIDERADOS:::::::::::::::::::::::::::::::::::::::::::::::<p>";
//                         print_r($yaConsiderados);
//                         echo "<p>::::::::::::::::::::::::::::::::::::YA CONSIDERADOS:::::::::::::::::::::::::::::::::::::::::::::::<p>";
//                     }
//                     if (!in_array($filtros[$k]['columna'], $yaConsiderados)) {
//                         switch ($filtros[$k]['condicion']) {
//                             case 'EMPTY':
//                                 $cond_fil .= utf8_encode(" que sea vacía ");
//                                 $where .= "(" . $filtros[$k]['columna'] . " IS NULL OR " . $filtros[$k]['columna'] . " ILIKE '')";
//                                 break;
//                             case 'NOT_EMPTY':
//                                 $cond_fil .= utf8_encode(" que no sea vacía ");
//                                 $where .= "(" . $filtros[$k]['columna'] . " IS NOT NULL OR " . $filtros[$k]['columna'] . " NOT ILIKE '')";
//                                 break;
//                             case 'CONTAINS':
//                                 $cond_fil .= utf8_encode(" que contenga el valor:  " . $filtros[$k]['valor']);
//                                 if ($filtros[$k]['columna'] == "nombres") {
//                                     $where .= "(p_nombre ILIKE '%" . $filtros[$k]['valor'] . "%' OR s_nombre ILIKE '%" . $filtros[$k]['valor'] . "%' OR t_nombre ILIKE '%" . $filtros[$k]['valor'] . "%' OR p_apellido ILIKE '%" . $filtros[$k]['valor'] . "%' OR s_apellido ILIKE '%" . $filtros[$k]['valor'] . "%' OR c_apellido ILIKE '%" . $filtros[$k]['valor'] . "%')";
//                                 } else {
//                                     $where .= $filtros[$k]['columna'] . " ILIKE '%" . $filtros[$k]['valor'] . "%'";
//                                 }
//                                 break;
//                             case 'EQUAL':
//                                 $cond_fil .= utf8_encode(" que contenga el valor:  " . $filtros[$k]['valor']);
//                                 $ini = 0;
//                                 foreach ($arr_val as $col) {
//                                     if ($pdf->debug == 1) {

//                                         echo "<p>.........................recorriendo las columnas multiseleccionadas: .............................................";
//                                         echo $filtros[$k]['columna'] . "-->" . $col;
//                                         echo "<p>.........................recorriendo las columnas multiseleccionadas: .............................................";
//                                     }
//                                     if (isset($generalConfigForAllColumns[$filtros[$k]['columna']]['type'])) {
//                                         //$where .= $filtros[$k]['columna']." ILIKE '".$filtros[$k]['valor']."'";
//                                         if ($ini == 0) {
//                                             $where .= " (";
//                                         }
//                                         switch (@$generalConfigForAllColumns[$filtros[$k]['columna']]['type']) {
//                                             case 'int4':
//                                             case 'numeric':
//                                             case 'date':
//                                                 //$whereEqueals .= $filtros[$k]['columna']." = '".$filtros[$k]['valor']."'";
//                                                 $where .= $filtros[$k]['columna'] . " = '" . $col . "'";
//                                                 break;
//                                             case 'varchar':
//                                             case 'bpchar':
//                                                 //$whereEqueals .= $filtros[$k]['columna']." ILIKE '".$filtros[$k]['valor']."'";
//                                                 $where .= $filtros[$k]['columna'] . " ILIKE '" . $col . "'";
//                                                 break;
//                                         }
//                                         $ini++;
//                                         if ($ini == count($arr_val)) {
//                                             $where .= ") ";
//                                         } else $where .= " OR ";
//                                     }
//                                 }
//                                 break;
//                             case 'GREATER_THAN_OR_EQUAL':
//                                 $cond_fil .= utf8_encode(" que sea mayor o igual que:  " . $filtros[$k]['valor']);
//                                 $ini = 0;
//                                 foreach ($arr_val as $col) {
//                                     //$fecha = date("Y-m-d", $col);
//                                     $fecha = $col;
//                                     if (isset($generalConfigForAllColumns[$filtros[$k]['columna']]['type'])) {
//                                         //$where .= $filtros[$k]['columna']." ILIKE '".$filtros[$k]['valor']."'";
//                                         if ($ini == 0) {
//                                             $where .= " (";
//                                         }
//                                         switch (@$generalConfigForAllColumns[$filtros[$k]['columna']]['type']) {
//                                             case 'int4':
//                                             case 'numeric':
//                                                 $where .= $filtros[$k]['columna'] . " = '" . $fecha . "'";
//                                                 break;
//                                             case 'date':
//                                                 //$whereEqueals .= $filtros[$k]['columna']." = '".$filtros[$k]['valor']."'";
//                                                 if ($ini == 0) {
//                                                     $where .= $filtros[$k]['columna'] . " BETWEEN ";
//                                                 } else {
//                                                     $where .= " AND ";
//                                                 }
//                                                 $where .= "'" . $fecha . "'";

//                                                 break;
//                                             case 'varchar':
//                                             case 'bpchar':
//                                                 //$whereEqueals .= $filtros[$k]['columna']." ILIKE '".$filtros[$k]['valor']."'";
//                                                 $where .= $filtros[$k]['columna'] . " ILIKE '" . $col . "'";
//                                                 break;
//                                         }
//                                         $ini++;
//                                         if ($ini == count($arr_val)) {
//                                             $where .= ") ";
//                                         }
//                                     }
//                                 }
//                                 break;
//                             case 'LESS_THAN_OR_EQUAL':
//                                 $cond_fil .= utf8_encode(" que sea menor o igual que:  " . $filtros[$k]['valor']);
//                                 $where .= $filtros[$k]['columna'] . ' <= "' . $filtros[$k]['valor'] . '"';
//                                 break;
//                         }
//                         $yaConsiderados[] = $filtros[$k]['columna'];
//                     }
//                 } else {
//                     switch ($filtros[$k]['condicion']) {
//                         case 'EMPTY':
//                             $cond_fil .= utf8_encode(" que sea vacía ");
//                             $where .= "(" . $filtros[$k]['columna'] . " IS NULL OR " . $filtros[$k]['columna'] . " ILIKE '')";
//                             break;
//                         case 'NOT_EMPTY':
//                             $cond_fil .= utf8_encode(" que no sea vacía ");
//                             $where .= "(" . $filtros[$k]['columna'] . " IS NOT NULL OR " . $filtros[$k]['columna'] . " NOT ILIKE '')";
//                             break;
//                         case 'CONTAINS':
//                             $cond_fil .= utf8_encode(" que contenga el valor:  " . $filtros[$k]['valor']);
//                             if ($filtros[$k]['columna'] == "nombres") {
//                                 $where .= "(p_nombre ILIKE '%" . $filtros[$k]['valor'] . "%' OR s_nombre ILIKE '%" . $filtros[$k]['valor'] . "%' OR t_nombre ILIKE '%" . $filtros[$k]['valor'] . "%' OR p_apellido ILIKE '%" . $filtros[$k]['valor'] . "%' OR s_apellido ILIKE '%" . $filtros[$k]['valor'] . "%' OR c_apellido ILIKE '%" . $filtros[$k]['valor'] . "%')";
//                             } else {
//                                 $where .= $filtros[$k]['columna'] . " ILIKE '%" . $filtros[$k]['valor'] . "%'";
//                             }
//                             break;
//                         case 'EQUAL':
//                             $cond_fil .= utf8_encode(" que contenga el valor:  " . $filtros[$k]['valor']);
//                             if (isset($generalConfigForAllColumns[$filtros[$k]['columna']]['type'])) {
//                                 //$where .= $filtros[$k]['columna']." ILIKE '".$filtros[$k]['valor']."'";
//                                 switch (@$generalConfigForAllColumns[$filtros[$k]['columna']]['type']) {
//                                     case 'int4':
//                                     case 'numeric':
//                                     case 'date':
//                                         //$whereEqueals .= $filtros[$k]['columna']." = '".$filtros[$k]['valor']."'";
//                                         $where .= $filtros[$k]['columna'] . " = '" . $filtros[$k]['valor'] . "'";
//                                         break;
//                                     case 'varchar':
//                                     case 'bpchar':
//                                         //$whereEqueals .= $filtros[$k]['columna']." ILIKE '".$filtros[$k]['valor']."'";
//                                         $where .= $filtros[$k]['columna'] . " ILIKE '" . $filtros[$k]['valor'] . "'";
//                                         break;
//                                 }
//                             }
//                             break;
//                         case 'GREATER_THAN_OR_EQUAL':
//                             $cond_fil .= utf8_encode(" que sea mayor o igual que:  " . $filtros[$k]['valor']);
//                             $where .= $filtros[$k]['columna'] . ' >= "' . $filtros[$k]['valor'] . '"';
//                             break;
//                         case 'LESS_THAN_OR_EQUAL':
//                             $cond_fil .= utf8_encode(" que sea menor o igual que:  " . $filtros[$k]['valor']);
//                             $where .= $filtros[$k]['columna'] . ' <= "' . $filtros[$k]['valor'] . '"';
//                             break;
//                     }
//                 }

//             }
//             $obj = new Productos();
//             if ($where != "") $where = " WHERE " . $where;
//             $groups_aux = "";
//             if ($groups != "") {
//                 /**
//                  * Se verifica que no se considere la columna nombres debido a que contenido ya esta ordenado por las
//                  * columnas p_apellido, s_apellido, c_apellido, p_anombre, s_nombre, t_nombre
//                  */
//                 if (strrpos($groups, "nombres")) {
//                     if (strrpos($groups, ",")) {
//                         $arr = explode(",", $groups);
//                         foreach ($arr as $val) {
//                             if ($val != "nombres")
//                                 $groups_aux[] = $val;
//                         }
//                         $groups = implode(",", $groups_aux);
//                     } else $groups = "";
//                 }
//                 if (is_array($sorteds) && count($sorteds) > 0) {
//                     if ($groups != "") $groups .= ",";
//                     $coma = "";
//                     if ($pdf->debug == 1) {
//                         echo "<p>===========================================Orden======================================</p>";
//                         print_r($sorteds);
//                         echo "<p>===========================================Orden======================================</p>";
//                     }
//                     foreach ($sorteds as $ord => $orden) {
//                         $groups .= $coma . $ord;
//                         if ($orden['asc'] == '') $groups .= " ASC"; else$groups .= " DESC";
//                         $coma = ",";
//                     }
//                 }
//                 if ($groups != "")
//                     $groups = " ORDER BY " . $groups . ",p_apellido,s_apellido,c_apellido,p_nombre,s_nombre,t_nombre,id_da,fecha_ini";
//                 if ($pdf->debug == 1) echo "<p>La consulta es: " . $groups . "<p>";
//             } else {
//                 if (is_array($sorteds) && count($sorteds) > 0) {
//                     $coma = "";
//                     if ($pdf->debug == 1) {
//                         echo "<p>===========================================Orden======================================</p>";
//                         print_r($sorteds);
//                         echo "<p>===========================================Orden======================================</p>";
//                     }
//                     foreach ($sorteds as $ord => $orden) {
//                         $groups .= $coma . $ord;
//                         if ($orden['asc'] == '') $groups .= " ASC"; else$groups .= " DESC";
//                         $coma = ",";
//                     }
//                     $groups = " ORDER BY " . $groups;
//                 }

//             }
//             if ($pdf->debug == 1) echo "<p>WHERE------------------------->" . $where . "<p>";
//             if ($pdf->debug == 1) echo "<p>GROUP BY------------------------->" . $groups . "<p>";
//             $resul = $obj->lista(0,$where, $groups);

//             $relaboral = array();
//             foreach ($resul as $v) {
//                 $relaboral[] = array(
//                     'grupo' => $v->grupo,
//                     'estacion' => $v->estacion,
//                     'linea' => $v->linea,
//                     'producto' => $v->producto,
//                     'codigo' => $v->codigo,
//                     'descripcion' => $v->descripcion,
//                     'precio_unitario' => $v->precio_unitario,
//                     'cantidad' => $v->cantidad,
//                     'cantidad_alquilada' => $v->cantidad_alquilada,
//                     'cantidad_disponible' => $v->cantidad_disponible,
//                     'tiempo' => $v->tiempo,
//                 );
//             }
//             //$pdf->Open("L");
//             /**
//              * Si el ancho supera el establecido para una hoja tamaño carta, se la pone en posición horizontal
//              */

//             $pdf->AddPage();
//             if ($pdf->debug == 1) {
//                 echo "<p>El ancho es:: " . $ancho;
//             }
//             #region Espacio para la definición de valores para la cabecera de la tabla
//             $pdf->FechaHoraReporte = date("d-m-Y H:i:s");
//             $j = 0;
//             $agrupadores = array();
//             //echo "<p>++++++++++>".$groups;
//             if ($groups != "")
//                 $agrupadores = explode(",", $groups);

//             $dondeCambio = array();
//             $queCambio = array();

//             if (count($relaboral) > 0) {
//                 foreach ($relaboral as $i => $val) {
//                     if (($pdf->pageWidth - $pdf->tableWidth) > 0) $pdf->SetX(($pdf->pageWidth - $pdf->tableWidth) / 2);
//                     if (count($agrupadores) > 0) {
//                         if ($pdf->debug == 1) {
//                             echo "<p>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||<p></p>";
//                             print_r($gruposSeleccionadosActuales);
//                             echo "<p>|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||<p></p>";
//                         }
//                         $agregarAgrupador = 0;
//                         $aux = array();
//                         $dondeCambio = array();
//                         foreach ($gruposSeleccionadosActuales as $key => $valor) {
//                             if ($valor != $val[$key]) {
//                                 $agregarAgrupador = 1;
//                                 $aux[$key] = $val[$key];
//                                 $dondeCambio[] = $key;
//                                 $queCambio[$key] = $val[$key];
//                             } else {
//                                 $aux[$key] = $val[$key];
//                             }
//                         }
//                         $gruposSeleccionadosActuales = $aux;
//                         if ($agregarAgrupador == 1) {
//                             $pdf->Ln();
//                             $pdf->DefineColorHeaderTable();
//                             $pdf->SetAligns($alignTitleSelecteds);
//                             //if(($pdf->pageWidth-$pdf->tableWidth)>0)$pdf->SetX(($pdf->pageWidth-$pdf->tableWidth)/2);
//                             $agr = $pdf->DefineTitleColsByGroups($generalConfigForAllColumns, $dondeCambio, $queCambio);
//                             $pdf->Agrupador($agr);
//                             $pdf->RowTitle($colTitleSelecteds);
//                         }
//                         $pdf->DefineColorBodyTable();
//                         $pdf->SetAligns($alignSelecteds);
//                         if (($pdf->pageWidth - $pdf->tableWidth) > 0) $pdf->SetX(($pdf->pageWidth - $pdf->tableWidth) / 2);
//                         $rowData = $pdf->DefineRows($j + 1, $relaboral[$j], $colSelecteds);
//                         $pdf->Row($rowData);

//                     } else {
//                         //if(($pdf->pageWidth-$pdf->tableWidth)>0)$pdf->SetX(($pdf->pageWidth-$pdf->tableWidth)/2);
//                         $pdf->DefineColorBodyTable();
//                         $pdf->SetAligns($alignSelecteds);
//                         $rowData = $pdf->DefineRows($j + 1, $val, $colSelecteds);
//                         $pdf->Row($rowData);
//                     }
//                     //if(($pdf->pageWidth-$pdf->tableWidth)>0)$pdf->SetX(($pdf->pageWidth-$pdf->tableWidth)/2);
//                     $j++;
//                 }
//             }
//             $pdf->ShowLeftFooter = true;
//             if ($pdf->debug == 0) $pdf->Output('reporte_productos.pdf', 'I');
//             #endregion Proceso de generación del documento PDF
//         }
//     }


     function DefineWidths($widthAlignAll, $columns, $exclude = array())
    {
        $arrRes = Array();
        $arrRes[] = 8;
        foreach ($columns as $key => $val) {
            if (isset($widthAlignAll[$key])) {
                if (!isset($val['hidden']) || $val['hidden'] != true) {
                    if (!in_array($key, $exclude) || count($exclude) == 0)
                        $arrRes[] = $widthAlignAll[$key]['width'];
                }
            }
        }
        return $arrRes;
    }

    /*
     * Función para obtener la cantidad de veces que se considera una misma columna en el filtrado.
     * @param $columna
     * @param $array
     * @return int
     */
    function obtieneCantidadVecesConsideracionPorColumnaEnFiltros($columna, $array)
    {
        $cont = 0;
        if (count($array) >= 1) {
            foreach ($array as $key => $val) {
                if (in_array($columna, $val)) {
                    $cont++;
                }
            }
        }
        return $cont;
    }

    /**
     * Función para la obtención de los valores considerados en el filtro enviado.
     * @param $columna Nombre de la columna
     * @param $array Array con los registro de busquedas.
     * @return array Array con los valores considerados en el filtrado enviado.
     */
    function obtieneValoresConsideradosPorColumnaEnFiltros($columna, $array)
    {
        $arr_col = array();
        $cont = 0;
        if (count($array) >= 1) {
            foreach ($array as $key => $val) {
                if (in_array($columna, $val)) {
                    $arr_col[] = $val["valor"];
                }
            }
        }
        return $arr_col;
    }


}