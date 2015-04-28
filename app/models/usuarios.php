<?php

use Phalcon\Mvc\Model\Resultset\Simple as Resultset;

class Usuarios extends \Phalcon\Mvc\Model {

    private $_db;

    // public function initialize() {
    //     $this->_db = new usuarios();
    //     //   parent::initialize();
    // }

    public function responsablecomercial() {
        $sql = "SELECT id,CONCAT(COALESCE(paterno,' '),' ',COALESCE(materno,' '),' ',COALESCE(nombre,' ')) as nombres
        FROM usuarios 
        WHERE habilitado = 1 AND nivel = 3";
        $this->_db = new Usuarios();
        return new Resultset(null, $this->_db, $this->_db->getReadConnection()->query($sql));
    }
    
}
