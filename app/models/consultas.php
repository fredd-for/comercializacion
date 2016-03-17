<?php

use Phalcon\Mvc\Model\Resultset\Simple as Resultset;

class Consultas extends \Phalcon\Mvc\Model {
    /* personal activo de la instatitucion */

    public static function contratosComerciales($mesanio,$comercial)
    {
        $sql = "SELECT COUNT(id) as cant from contratos 
        WHERE Date_format(fecha_contrato,'%Y-%m') = '".$mesanio."' AND responsable_id = '".$comercial."' AND baja_logica = 1";
        $db = new Clientes();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }

    public static function clientesContrato() {
        $sql = "SELECT c.cliente_id
        FROM contratosproductos cp
        INNER JOIN contratos c ON cp.contrato_id = c.id AND c.baja_logica = 1
        WHERE cp.baja_logica =1 AND CURDATE()<=cp.fecha_fin
        GROUP BY c.cliente_id";
        $db = new Clientes();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }
    public static function productosSinAlquilar() {
        $sql = "SELECT SUM(cantidad) as cantidad FROM productos WHERE baja_logica = 1 AND cantidad >0";
        $db = new Clientes();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }
    public static function personigramacargo($id) {
        $sql = "SELECT r.id,r.num_contrato,CONCAT(p.p_nombre,' ',p.s_nombre,' ',p.p_apellido,' ',p.s_apellido) as nombre,c.codigo, c.id as cargo_id,
                c.cargo,e.estado,to_char(r.fecha_ini, 'DD-mm-YYYY') as fecha_ini,to_char(r.fecha_incor, 'DD-mm-YYYY') as fecha_incorporacion,
                to_char(p.fecha_nac, 'DD-mm-YYYY') as fecha_nac,CONCAT(p.ci,' ',p.expd) as ci,o.unidad_administrativa,p.foto
                FROM  (SELECT * FROM relaborales
                WHERE estado >='1' ) as r
                INNER JOIN personas p ON r.persona_id=p.id
                INNER JOIN organigramas o ON r.organigrama_id=o.id
                INNER JOIN cargos c ON r.cargo_id=c.id               
                INNER JOIN cargosestados e ON c.cargo_estado_id=e.id
                WHERE r.baja_logica='1' AND o.id='$id'
                ORDER BY r.estado";
        $db = new personas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }
    //DETALLES PERSONA
    public static function archivoActivo($id) {
        $sql = "SELECT r.id,r.num_contrato,CONCAT(p.p_nombre,' ',p.s_nombre,' ',p.p_apellido,' ',p.s_apellido) as nombre,c.codigo, 
                c.cargo,n.denominacion,n.sueldo,e.estado,to_char(r.fecha_ini, 'DD-mm-YYYY') as fecha_ini,to_char(r.fecha_incor, 'DD-mm-YYYY') as fecha_incorporacion,
                to_char(p.fecha_nac, 'DD-mm-YYYY') as fecha_nac,CONCAT(p.ci,' ',p.expd) as ci,o.unidad_administrativa,p.foto
                FROM  (SELECT * FROM relaborales
                WHERE estado >='1' and id='$id' ) as r
                INNER JOIN personas p ON r.persona_id=p.id
                INNER JOIN organigramas o ON r.organigrama_id=o.id
                INNER JOIN cargos c ON r.cargo_id=c.id
                INNER JOIN nivelsalariales n ON r.nivelsalarial_id=n.id
                INNER JOIN cargosestados e ON c.cargo_estado_id=e.id
                WHERE r.baja_logica='1'
                ORDER BY r.estado";
        $db = new personas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }

    public static function personasActivo() {
        $sql = "SELECT p.id,CONCAT(p.p_nombre,' ',p.s_nombre) as nombres,CONCAT(p.p_apellido,' ',p.s_apellido) as apellidos,to_char(p.fecha_nac, 'DD-mm-YYYY') as fecha_nac,p.ci,p.expd,p.nacionalidad
                ,foto,genero,nacionalidad FROM personas p
                WHERE p.id not in 
                (
                select distinct persona_id FROM relaborales  WHERE baja_logica='1'
                ) ORDER BY p.p_apellido ASC";
        $db = new personas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }
   

    public static function acefalos() {
        $sql = "SELECT c.id,c.cargo,c.codigo,o.unidad_administrativa as oficina,n.denominacion,n.sueldo,ce.estado from cargos c
                inner join organigramas o on c.organigrama_id = o.id
                inner join nivelsalariales n on c.codigo_nivel = n.nivel
                inner join ejecutoras e on c.ejecutora_id = e.id
                inner join cargosestados ce on c.cargo_estado_id = ce.id
                inner join finpartidas fp on c.fin_partida_id = fp.id
                inner join condiciones cs on fp.condicion_id=cs.id
                left join organigramas temporganigramas on temporganigramas.id = o.padre_id
                where c.id not in (
                        select distinct r.cargo_id from relaborales r	
                        where r.baja_logica=1
                        and r.estado>=1
                )
                
";
        $db = new personas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }
    
    public static function organigrama(){
        $sql="SELECT o.id,n.nivel_estructural,o.padre_id,o.unidad_administrativa
               FROM  organigramas o 
               INNER JOIN nivelestructurales n ON o.nivel_estructural_id=n.id
               WHERE o.baja_logica='1' and o.visible='1'";
         $db = new personas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }
    public static function personigrama($id){
        $sql="select id,organigrama_id,depende_id,cargo from cargos where organigrama_id='$id'  and baja_logica='1'";
         $db = new personas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }

/*
SQl para obtener los el monto por contrato agrupado por Responsables
 */
    public function contratosResponsable()
    {
        $sql = "SELECT u.id,CONCAT(u.nombre,' ',u.paterno) as nombre,COALESCE(SUM(cp.total),0) as monto
        FROM usuarios u
        LEFT JOIN contratos c ON u.id = c.responsable_id AND c.baja_logica = 1
        LEFT JOIN contratosproductos cp ON c.id = cp.contrato_id AND cp.baja_logica = 1
        WHERE u.habilitado = 1 AND u.nivel = 2 
        GROUP BY u.id";
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }

   public function contratosClientes($responsable_id)
   {
    $sql = "SELECT cl.id,cl.razon_social,COALESCE(SUM(cp.total),0)  as monto
    FROM 
    contratos c 
    INNER JOIN clientes cl ON c.cliente_id = cl.id
    LEFT JOIN contratosproductos cp ON c.id = cp.contrato_id AND cp.baja_logica = 1
    WHERE c.responsable_id ='$responsable_id'
    GROUP BY c.cliente_id";
    $db = new Consultas();
    return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    } 

    public function totaldepositomes($linea_id='',$grupo_id='',$mesanio='')
    {
      $fi=$mesanio.'-01';
      $ff=$mesanio.'-31';
      
      $sql = "SELECT COALESCE(SUM(ppd.monto_deposito) ,0) as total
      FROM planpagodepositos ppd
      INNER JOIN planpagos pp ON ppd.planpago_id = pp.id AND pp.baja_logica=1 AND pp.estado = 1
      INNER JOIN productos p ON pp.producto_id = p.id
      INNER JOIN grupos g ON p.grupo_id = g.id
      INNER JOIN estaciones e ON p.estacion_id = e.id
      INNER JOIN lineas l ON e.linea_id = l.id
      WHERE ppd.baja_logica =1 AND ppd.fecha_deposito BETWEEN '".$fi."' AND '".$ff."' AND l.id='$linea_id' AND g.id = '$grupo_id'";
      $db = new Consultas();
      return new Resultset(null, $db, $db->getReadConnection()->query($sql));  
    }

    public function montoMesActual($gestion,$mes,$responsable_id)
    {
        $where = '';
        if ($responsable_id!=0) {
            $where = 'AND c.responsable_id='.$responsable_id;
        }
        $sql = "SELECT COALESCE(SUM(pp.monto_programado),0) as monto_programado,COALESCE(SUM(ppd.monto_deposito),0) as monto_deposito
FROM contratos c
INNER JOIN contratosproductos cp ON c.id = cp.contrato_id AND cp.baja_logica =1
INNER JOIN planpagos pp ON pp.contratoproducto_id = cp.id AND YEAR(pp.fecha_programado)='".$gestion."' AND MONTH(pp.fecha_programado)='".$mes."' AND pp.baja_logica = 1 AND pp.estado = 1
LEFT JOIN planpagodepositos ppd ON pp.id = ppd.planpago_id AND ppd.baja_logica = 1
WHERE  YEAR(c.fecha_contrato)='".$gestion."' AND c.baja_logica =1 ".$where;
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));         
    }


    public function montoMesAcumulado($gestion,$mes,$responsable_id)
    {
        $where = '';
        if ($responsable_id!=0) {
            $where = 'AND c.responsable_id='.$responsable_id;
        }
        $sql = "SELECT COALESCE(SUM(pp.monto_programado),0) as monto_programado,COALESCE(SUM(ppd.monto_deposito),0) as monto_deposito
        FROM planpagos pp
        LEFT JOIN planpagodepositos ppd ON pp.id = ppd.planpago_id AND ppd.baja_logica = 1
        INNER JOIN contratos c ON pp.contrato_id=c.id ".$where." AND YEAR(c.fecha_contrato)='".$gestion."'
        WHERE  YEAR(fecha_programado) ='".$gestion."' AND MONTH(fecha_programado)<='".$mes."' AND pp.baja_logica = 1 AND pp.estado = 1";
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));         
    }

    public function metaMesActual($gestion,$mes,$responsable_id)
    {
        $where = '';
        if ($responsable_id!=0) {
            $where = 'AND usuario_id='.$responsable_id;
        }
        $sql = "SELECT COALESCE(SUM(meta),0) as meta
        FROM metas
        WHERE baja_logica = 1 ".$where." AND gestion = '".$gestion."' AND mes = '".$mes."'";
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));         
    }

    public function metaMesAcumulado($gestion,$mes,$responsable_id)
    {
        $where = '';
        if ($responsable_id!=0) {
            $where = 'AND usuario_id='.$responsable_id;
        }
        $sql = "SELECT COALESCE(SUM(meta),0) as meta
        FROM metas
        WHERE baja_logica = 1 ".$where." AND gestion = '".$gestion."' AND mes <= '".$mes."'";
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));         
    }

    public function metaAnual($gestion,$responsable_id)
    {
        $where = '';
        if ($responsable_id!=0) {
            $where = 'AND usuario_id='.$responsable_id;
        }
        $sql = "SELECT COALESCE(SUM(meta),0) as meta
        FROM metas
        WHERE baja_logica = 1 ".$where." AND gestion = '".$gestion."'";
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }

    public function garantiaLlaveMesActual($gestion,$mes,$responsable_id)
    {
       $where = '';
        if ($responsable_id!=0) {
            $where = 'AND c.responsable_id='.$responsable_id;
        }
        $sql = "SELECT COALESCE(SUM(g.monto_deposito)-SUM(g.monto_devolucion),0) as total
FROM contratos c
INNER JOIN contratosproductos cp ON c.id = cp.contrato_id AND cp.baja_logica=1
INNER JOIN garantias g ON cp.id = g.contratoproducto_id and g.baja_logica = 1 AND YEAR(g.fecha_deposito)='".$gestion."'  AND MONTH(g.fecha_deposito)='".$mes."'
WHERE YEAR(c.fecha_contrato)='".$gestion."'  AND c.baja_logica = 1 ".$where;
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }

     public function garantiaLlaveMesAcumulado($gestion,$mes,$responsable_id)
    {
       $where = '';
        if ($responsable_id!=0) {
            $where = 'AND c.responsable_id='.$responsable_id;
        }
        $sql = "SELECT COALESCE(SUM(g.monto_deposito)-SUM(g.monto_devolucion),0) as total
FROM contratos c
INNER JOIN contratosproductos cp ON c.id = cp.contrato_id AND cp.baja_logica=1
INNER JOIN garantias g ON cp.id = g.contratoproducto_id and g.baja_logica = 1 AND YEAR(g.fecha_deposito)='".$gestion."'  AND MONTH(g.fecha_deposito)<='".$mes."'
WHERE YEAR(c.fecha_contrato)='".$gestion."'  AND c.baja_logica = 1 ".$where;
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));
    }


    /*
    alquiler asegurado gestiones pasadas
     */
    public function alquilerAsegurado()
    {
        $sql = "SELECT SUM(pp.monto_reprogramado) as total
        FROM contratos c
        INNER JOIN planpagos pp ON pp.contrato_id = c.id AND YEAR(pp.fecha_programado)=YEAR(NOW()) AND pp.baja_logica=1 AND pp.estado=1
        WHERE c.baja_logica = 1 AND YEAR(c.fecha_contrato)<YEAR(NOW())";
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));         
    }

    /*
    Metas por meses de todos los responsables comerciales
     */
    
    public function metasPorMeses()
    {
        $sql = "SELECT u.id, CONCAT(u.nombre,' ',u.paterno,' ',u.materno) as nombre,m.meta,m.mes,m.gestion
        FROM usuarios u
        INNER JOIN metas m ON u.id = m.usuario_id AND gestion = YEAR(NOW())
        WHERE u.nivel =2 AND u.habilitado = 1
        ORDER BY u.id, m.mes ASC";
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));         
    }

    public function metaAgrupadoMes($gestion,$responsable_id)
    {
        $where = '';
        if ($responsable_id!=0) {
            $where = 'AND c.responsable_id='.$responsable_id;
        }
        $sql = "SELECT mes,SUM(meta) as meta
        FROM metas
        WHERE baja_logica = 1 AND gestion = '$gestion' ".$where."
        GROUP BY mes";
        $db = new Consultas();
        return new Resultset(null, $db, $db->getReadConnection()->query($sql));         
    }

    


    public function pivotAlquilerAsegurado($gestion,$responsable_id,$alquilernuevo=1)
    {
       $gestionactual = ' AND YEAR(c.fecha_contrato)="'.$gestion.'" ';
       if($alquilernuevo!=1){
            $gestionactual = ' AND YEAR(c.fecha_contrato)<"'.$gestion.'" ';
       }

       $where = '';
       if ($responsable_id!=0) {
        $where = ' AND c.responsable_id='.$responsable_id.' ';
       }
       


    $sql = 'select
    v.id,v.contrato,v.fecha_contrato,
    COALESCE(SUM( case when v.fecha_programado = "1" then monto_reprogramado end ),0) as enero,
    COALESCE(SUM( case when v.fecha_programado = "2" then monto_reprogramado end ),0) as febrero,
    COALESCE(SUM(case when v.fecha_programado = "3" then monto_reprogramado end ),0) as marzo,
    COALESCE(SUM(case when v.fecha_programado = "4" then monto_reprogramado end ),0) as abril,
    COALESCE(SUM(case when v.fecha_programado = "5" then monto_reprogramado end ),0) as mayo,
    COALESCE(SUM(case when v.fecha_programado = "6" then monto_reprogramado end ),0) as junio,
    COALESCE(SUM(case when v.fecha_programado = "7" then monto_reprogramado end ),0) as julio,
    COALESCE(SUM(case when v.fecha_programado = "8" then monto_reprogramado end ),0) as agosto,
    COALESCE(SUM(case when v.fecha_programado = "9" then monto_reprogramado end ),0) as septiembre,
    COALESCE(SUM(case when v.fecha_programado = "10" then monto_reprogramado end ),0) as octubre,
    COALESCE(SUM(case when v.fecha_programado = "11" then monto_reprogramado end ),0) as noviembre,
    COALESCE(SUM(case when v.fecha_programado = "12" then monto_reprogramado end ),0) as diciembre
    from (
    select c.id,c.contrato,c.fecha_contrato,MONTH(p.fecha_programado) fecha_programado,sum(p.monto_reprogramado) monto_reprogramado
    from contratos c
    inner join contratosproductos cp on c.id = cp.contrato_id AND cp.baja_logica=1
    inner join planpagos p on p.contratoproducto_id = cp.id AND p.baja_logica=1 AND p.estado = 1
    where year(p.fecha_programado) = "'.$gestion.'" AND c.baja_logica = 1 '.$gestionactual.$where.'
    group by fecha_programado,contrato
    order by c.contrato
    ) v
    group by v.contrato';
    $db = new Consultas();
    return new Resultset(null, $db, $db->getReadConnection()->query($sql));            
}


public function pivotAlquilerDepositado($gestion,$responsable_id,$alquilernuevo=1)
    {
       $gestionactual = ' AND YEAR(c.fecha_contrato)="'.$gestion.'" ';
       if($alquilernuevo!=1){
            $gestionactual = ' AND YEAR(c.fecha_contrato)<"'.$gestion.'" ';
       }

       $where = '';
       if ($responsable_id!=0) {
        $where = 'AND c.responsable_id='.$responsable_id;
       }
       


    $sql = 'select
    v.id,v.contrato,v.fecha_contrato,
    COALESCE(SUM( case when v.fecha_programado = "1" then monto_deposito end ),0) as enero,
    COALESCE(SUM( case when v.fecha_programado = "2" then monto_deposito end ),0) as febrero,
    COALESCE(SUM(case when v.fecha_programado = "3" then monto_deposito end ),0) as marzo,
    COALESCE(SUM(case when v.fecha_programado = "4" then monto_deposito end ),0) as abril,
    COALESCE(SUM(case when v.fecha_programado = "5" then monto_deposito end ),0) as mayo,
    COALESCE(SUM(case when v.fecha_programado = "6" then monto_deposito end ),0) as junio,
    COALESCE(SUM(case when v.fecha_programado = "7" then monto_deposito end ),0) as julio,
    COALESCE(SUM(case when v.fecha_programado = "8" then monto_deposito end ),0) as agosto,
    COALESCE(SUM(case when v.fecha_programado = "9" then monto_deposito end ),0) as septiembre,
    COALESCE(SUM(case when v.fecha_programado = "10" then monto_deposito end ),0) as octubre,
    COALESCE(SUM(case when v.fecha_programado = "11" then monto_deposito end ),0) as noviembre,
    COALESCE(SUM(case when v.fecha_programado = "12" then monto_deposito end ),0) as diciembre
    from (
    select c.id,c.contrato,c.fecha_contrato,MONTH(p.fecha_programado) fecha_programado,sum(pd.monto_deposito) monto_deposito
    from contratos c
    inner join contratosproductos cp on c.id = cp.contrato_id AND cp.baja_logica=1
    inner join planpagos p on p.contratoproducto_id = cp.id AND p.baja_logica=1 AND p.estado = 1
    inner join planpagodepositos pd on p.id = pd.planpago_id and pd.baja_logica = 1
    where year(p.fecha_programado) = "'.$gestion.'" AND c.baja_logica = 1 '.$gestionactual.$where.'
    group by fecha_programado,contrato
    order by c.contrato
    ) v
    group by v.contrato';
    $db = new Consultas();
    return new Resultset(null, $db, $db->getReadConnection()->query($sql));            
}

}
