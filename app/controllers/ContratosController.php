<?php 
/**
* 
*/
class ContratosController extends ControllerBase
{
	
	public function indexAction()
	{
		# code...
	}

	public function crearAction()
	{
		
		if ($this->request->isPost()) {
			$resul = new Contratos();
			$resul->contrato = $this->request->getPost('contrato');
			$resul->cliente_id = $this->request->getPost('cliente_id');
			$resul->fecha_contrato = date("Y-m-d",strtotime($this->request->getPost('fecha_contrato')));
			$resul->usuario_reg = $this->_user->id;
			$resul->fecha_reg = date("Y-m-d H:i:s");
			$resul->baja_logica = 1;
			$resul->arrendador = $this->request->getPost('arrendador');
			$resul->arrendador_rep_legal = $this->request->getPost('arrendador_rep_legal');
			$resul->arrendador_cargo = $this->request->getPost('arrendador_cargo');
			if ($resul->save()) {
                $this->flashSession->success("Exito: Registro guardado correctamente...");
                
            }else{
                $this->flashSession->error("Error: no se guardo el registro...");
                $this->response->redirect('/clientes');
            }
		}else{
			$this->flashSession->error("Error: no se guardo el registro...");
			$this->response->redirect('/clientes');
		}
	}
}
