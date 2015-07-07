<?php
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
class Seguimientos extends \Phalcon\Mvc\Model
{

    public function prueba()
    {
        $this->setConnectionService('sigec');
        $sql = "select * from seguimiento where nur='MT/2014-00002'";
        $users = new Seguimientos();
        return new Resultset(null, $users, $users->getReadConnection()->query($sql));    
    }    

    public function documentos($valor)
    {
    	$this->setConnectionService('sigec');
        $sql = "SELECT * FROM documentos WHERE nur like '%$valor%' ORDER BY id DESC LIMIT 100";
        $users = new Seguimientos();
        return new Resultset(null, $users, $users->getReadConnection()->query($sql));    
    }
}
