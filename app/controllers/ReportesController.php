<?php 

class ReportesController extends ControllerBase
{
	public function indexAction()
	{
		$this->assets
                // 	->addCss('/assets/css/plugins.css')
                ;
        $this->assets
                ->addJs('/js/tableExport/tableExport.js')
                ->addJs('/js/tableExport/jquery.base64.js')
                // ->addJs('/assets/js/app.js')
                // ->addJs('/js/app.plugin.js')
                
                ->addJs('/scripts/reportes/index.js')
        ;

		$linea = $this->tag->select(
                array(
                    'linea_id',
                    Lineas::find(array('baja_logica=1', 'order' => 'id ASC')),
                    'using' => array('id', "linea"),
                    'useEmpty' => true,
                    'emptyText' => '(Todos)',
                    'emptyValue' => '0',
                    'class' => 'form-control',
                    'required' => 'required',
                    'title' => 'Campo requerido'
                )
        );
		$this->view->setVar('linea', $linea);

        $grupo = $this->tag->select(
                array(
                    'grupo_id',
                    Grupos::find(array('baja_logica=1', 'order' => 'id ASC')),
                    'using' => array('id', "grupo"),
                    'useEmpty' => true,
                    'emptyText' => '(Todos)',
                    'emptyValue' => '0',
                    'class' => 'form-control',
                    'required' => 'required',
                    'title' => 'Campo requerido'
                )
        );
        $this->view->setVar('grupo', $grupo);
	}

	public function filtrarAction()
	{
		$linea_id = $this->request->getPost('linea_id');
		$grupo_id = $this->request->getPost('grupo_id');
		$f_i = date("Y-m-d",strtotime($this->request->getPost('f_inicio')));
		$f_f = date("Y-m-d",strtotime($this->request->getPost('f_fin')));

		$f_inicio = date("Y-m",strtotime($f_i));
		$f_fin = date("Y-m",strtotime($f_f));

		if ($linea_id>0) {
			$linea =Lineas::find(array('baja_logica=1 and id='.$linea_id, 'order' => 'id ASC'));	
		}else{
			$linea =Lineas::find(array('baja_logica=1', 'order' => 'id ASC'));	
		}

		if ($grupo_id>0) {
			$grupo =Grupos::find(array('baja_logica=1 and id='.$grupo_id, 'order' => 'id ASC'));
		}else{
			$grupo =Grupos::find(array('baja_logica=1', 'order' => 'id ASC'));	
		}
		
		

		$meses=array();
		$mesestotales=array();
		
		$table = "";
		$table.='<table class="table table-vcenter table-striped table-condensed table-bordered" id="tabla_excel">';
		$table.= '<thead>';
		$table.= '<tr>';
		$table.= '<th colspan="2">Concepto de Recaudación</th>';
		while ($f_inicio<=$f_fin) {
			$meses[]=$f_inicio;
			$table.= '<th>'.date("M-Y",strtotime($f_inicio)).'</th>';		
			$f_inicio = date("Y-m", strtotime($f_inicio."+1 month"));
		}
		$table.= '</tr>';
		$table.= '</thead>';
		
		$table.= '<tbody>';
		foreach ($linea as $l) {
			$table.= '<tr>';
			$table.= '<td rowspan="'.$grupo->count().'" style="color:'.$l->color.'">'.$l->linea.'</td>';
			$c = 1;
			foreach ($grupo as $g) {
				if ($c>1) {
					$table.= '<tr>';
				}
				$table.= '<td style="color:'.$l->color.'">'.$g->grupo.'</td>';
				foreach ($meses as $m) {
					$model = new consultas();
					$resul = $model->totaldepositomes($l->id,$g->id,$m);
					$table.= '<td class="text-right">'.$resul[0]->total.'</td>';
					$mesestotales[$m]=$mesestotales[$m]+$resul[0]->total;
				}
				$table.= '</tr>';
				$c++;
			}
			$table.= '</tr>';
		}
		$table.= '</tbody>';
		// $table.= '<tfooter>';
		$table.= '<tr>';
		$table.= '<td></td>';
		$table.= '<td class="text-right">TOTALES</td>';
		foreach ($meses as $m) {
			$table.= '<th class="text-right">'.number_format($mesestotales[$m],2,'.','').'</th>';
		}
		$table.= '</tr>';
		// $table.= '</tfooter>';
		$table.='</table>';

		$this->view->disable();
        echo $table;

	}


	public function totaldepositosAction($linea_id='1',$grupo_id='3',$mesanio='2015-06')
	{
		$model = new consultas();
		$resul = $model->totaldepositomes(1,3,'2015-06');
		echo $resul[0]->total;
	}

	public function reporteAction($linea_id='0',$grupo_id='0',$f_i='',$f_f='')
	{
		// $this->view->disable();
		// $model = new Clientes();
		// $resul = $model->lista();
  //       include_once('tbs_us/tbs_class.php'); // Load the TinyButStrong template engine
  //       include_once ('tbs_us/tbs_plugin_opentbs/tbs_plugin_opentbs.php'); // Load the OpenTBS plugin

  //       $TBS = new clsTinyButStrong; // new instance of TBS
  //       $TBS->Plugin(TBS_INSTALL, OPENTBS_PLUGIN); // load the OpenTBS plugin

  //       $TBS->VarRef['usuario'] = $this->_user->nombre.' '.$this->_user->paterno;
  //       $data = array();
  //       $c=1;

  //       foreach ($resul as $v) {
  //       	$data[] = array('rank'=> 'A', 'nro'=>$c ,'razon_social'=>$v->razon_social , 'nit'=>$v->nit, 'telefono'=>$v->telefono, 'celular'=>$v->celular, 'correo'=>$v->correo,'direccion'=>$v->direccion,'estado'=>$v->estado, 'representante_legal'=>$v->representante_legal,'celular_representante_legal'=>$v->celular_representante_legal,'correo_representante_legal'=>$v->correo_representante_legal,'nombre_ref'=>$v->nombre_ref,'celular_ref'=>$v->celular_ref,'correo_ref'=>$v->correo_ref);
  //       	$c++;
  //       }
  //       $template = 'file/template/temp_reporte_cliente.xlsx';
  //       $TBS->LoadTemplate($template, OPENTBS_ALREADY_UTF8); // Also merge some [onload] automatic fields (depends of the type of document).
  //       // ----------------------
  //       // Debug mode of the demo
  //       // ----------------------
  //       // if (isset($_POST['debug']) && ($_POST['debug']=='current')) $TBS->Plugin(OPENTBS_DEBUG_XML_CURRENT, true); // Display the intented XML of the current sub-file, and exit.
  //       // if (isset($_POST['debug']) && ($_POST['debug']=='info'))    $TBS->Plugin(OPENTBS_DEBUG_INFO, true); // Display information about the document, and exit.
  //       // if (isset($_POST['debug']) && ($_POST['debug']=='show'))    $TBS->Plugin(OPENTBS_DEBUG_XML_SHOW); // Tells TBS to display information when the document is merged. No exit.

  //       // Merge data in the first sheet
  //       $TBS->MergeBlock('a,b', $data);

  //       // -----------------
  //       // Output the result
  //       // -----------------
  //       // $output_file_name = str_replace('.', '_'.date('Y-m-d').'.', $template);
  //       $output_file_name = date('Y-m-d').' '.'reporte.xlsx';
  //       $TBS->Show(OPENTBS_DOWNLOAD, $output_file_name); // Also merges all [onshow] automatic fields.
  //       exit();
  //       

		$file="demo.xls";
		$test="<table  ><tr><td>Cell 1</td><td>Cell 2</td></tr></table>";
		header("Content-type: application/vnd.ms-excel");
		header("Content-Disposition: attachment; filename=$file");


		// $linea_id = 0;
		// $grupo_id = 0;
		$f_i = date("Y-m-d",strtotime($f_i));
		$f_f = date("Y-m-d",strtotime($f_f));


		$f_inicio = date("Y-m",strtotime($f_i));
		$f_fin = date("Y-m",strtotime($f_f));

		if ($linea_id>0) {
			$linea =Lineas::find(array('baja_logica=1 and id='.$linea_id, 'order' => 'id ASC'));	
		}else{
			$linea =Lineas::find(array('baja_logica=1', 'order' => 'id ASC'));	
		}

		if ($grupo_id>0) {
			$grupo =Grupos::find(array('baja_logica=1 and id='.$grupo_id, 'order' => 'id ASC'));
		}else{
			$grupo =Grupos::find(array('baja_logica=1', 'order' => 'id ASC'));	
		}
		
		

		$meses=array();
		$mesestotales=array();
		
		$table = "";
		$table.='<table >';
		$table.= '<thead>';
		$table.= '<tr>';
		$table.= '<th colspan="2">Concepto de Recaudacion</th>';
		while ($f_inicio<=$f_fin) {
			$meses[]=$f_inicio;
			$table.= '<th>'.date("M-Y",strtotime($f_inicio)).'</th>';		
			$f_inicio = date("Y-m", strtotime($f_inicio."+1 month"));
		}
		$table.= '</tr>';
		$table.= '</thead>';
		
		$table.= '<tbody>';
		foreach ($linea as $l) {
			foreach ($grupo as $g) {
				$table.= '<tr>';
				$table.= '<td>'.$l->linea.'</td>';
				$table.= '<td>'.$g->grupo.'</td>';
				foreach ($meses as $m) {
					$model = new consultas();
					$resul = $model->totaldepositomes($l->id,$g->id,$m);
					$table.= '<td>'.$resul[0]->total.'</td>';
					$mesestotales[$m]=$mesestotales[$m]+$resul[0]->total;
				}
				$table.= '</tr>';
			}
		}
		$table.= '</tbody>';
		// $table.= '<tfooter>';
		$table.= '<tr>';
		$table.= '<td></td>';
		$table.= '<td>TOTALES</td>';
		foreach ($meses as $m) {
			$table.= '<th>'.number_format($mesestotales[$m],2,'.','').'</th>';
		}
		$table.= '</tr>';
		// $table.= '</tfooter>';
		$table.='</table>';

		$this->view->disable();
		echo $table;
	}
}