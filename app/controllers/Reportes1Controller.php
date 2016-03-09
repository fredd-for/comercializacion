<?php 

class Reportes1Controller extends ControllerBase
{	
	
	public function indexAction()
	{
		$mes_array =array(
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

		$model = new consultas();
		$alquilerasegurado = $model->alquilerAsegurado();
		$metaAnual = $model->metaAnual(date("Y"),0);

		$this->view->setVar('alquilerAsegurado', $alquilerasegurado[0]->total);
		$this->view->setVar('metaAnual', $metaAnual[0]->meta);

		$responsables = Usuarios::find(array('habilitado = 1 and nivel = 2','order'=>'id ASC'));

		$tabla = '<table class="table table-vcenter table-striped table-condensed table-bordered">';
		$tabla .= '<tr>';
		$tabla .= '<th colspan="14" class="text-center success">METAS '.date("Y").' POR PERSONAS</th>';
		$tabla .= '</tr>';
		$tabla .= '<tr>';
		$tabla .= '<th>RESPONSABLE COMERCIAL</th>';
		foreach ($mes_array as $v) {
			$tabla .= '<th class="text-center"> '.$v.'</th>';				
		}
		$tabla .= '<th class="text-center">TOTAL</th>';				
		$tabla .= '</tr>';
		$total = 0;
		foreach ($responsables as $v) {
			$tabla .= '<tr>';
				$tabla .= '<td>'.$v->nombre.' '.$v->paterno.' '.$v->materno.'</td>';
				$c = 1;
				$suma = 0;
				foreach ($mes_array as $m) {
					$model = new consultas();
					$metaMesActual = $model->metaMesActual(date("Y"),$c,$v->id);
					$tabla .= '<td class="text-right">'.number_format($metaMesActual[0]->meta,2,',','.').'</td>';
					$suma += $metaMesActual[0]->meta;
					$c++;
				}
				
				$tabla .= '<th class="text-right">'.number_format($suma,2,',','.').'</th>';
			$tabla .= '</tr>';
			$total += $suma; 
		}
		$tabla .= '<tr>';
		$tabla .= '<td colspan="13"></td>';
		$tabla .= '<th class="text-right">'.number_format($total,2,',','.').'</th>';
		$tabla .= '</tr>';
		$tabla .= '</table>';
		$this->view->setVar('tabla', $tabla);
	}

}
