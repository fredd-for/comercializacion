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

}
