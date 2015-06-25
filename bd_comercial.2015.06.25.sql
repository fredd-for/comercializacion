-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bd_comercial
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archivos`
--

DROP TABLE IF EXISTS `archivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `tipo_archivo` varchar(150) DEFAULT NULL,
  `nombre_archivo` varchar(150) DEFAULT NULL,
  `carpeta` varchar(50) DEFAULT NULL,
  `tamanio` varchar(50) DEFAULT NULL,
  `usuario_reg` int(11) DEFAULT NULL,
  `fecha_reg` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estado` int(11) NOT NULL DEFAULT '0',
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  `tabla` int(11) NOT NULL DEFAULT '1' COMMENT '1 = productos, 2= clientes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos`
--

LOCK TABLES `archivos` WRITE;
/*!40000 ALTER TABLE `archivos` DISABLE KEYS */;
INSERT INTO `archivos` VALUES (1,3,'image/jpeg','20150401_03483010641163_953148531379169_1274761557074378941_n.jpg','file/productos/','79688',635,'2015-05-26 15:12:02',0,0,1),(4,4,'image/jpeg','20150401_03560410626870_953148458045843_2392319170754392593_n.jpg','file/productos/','68818',635,'2015-05-26 15:37:31',0,1,1),(6,5,'image/jpeg','20150401_03563010666098_953147738045915_3371819793238289682_n.jpg','file/productos/','53555',635,'2015-05-26 15:42:45',0,1,1),(7,13,'image/jpeg','20150401_042434images7.jpeg','file/productos/','6981',635,'2015-05-26 15:12:02',0,1,1),(8,12,'image/jpeg','20150401_042444index6.jpeg','file/productos/','9097',635,'2015-05-26 15:12:02',0,1,1),(9,11,'image/jpeg','20150401_042458images4.jpeg','file/productos/','10504',635,'2015-05-26 15:12:02',0,1,1),(10,4,'image/jpeg','20150409_030941images.jpeg','file/productos/','10113',635,'2015-05-26 15:37:31',0,1,1),(11,4,'image/jpeg','20150409_031006images7.jpeg','file/productos/','6981',635,'2015-05-26 15:37:31',0,1,1),(12,4,'image/jpeg','20150409_031314index.jpeg','file/productos/','12886',635,'2015-05-26 15:37:31',1,1,1),(13,16,'image/jpeg','20150409_032716index6.jpeg','file/productos/','9097',635,'2015-05-26 15:12:02',0,1,1),(14,5,'image/jpeg','20150409_035847images7.jpeg','file/productos/','6981',635,'2015-05-26 15:42:45',1,1,1),(15,6,'image/jpeg','20150409_040023images3.jpeg','file/productos/','9589',635,'2015-05-26 15:12:02',1,1,1),(16,17,'image/jpeg','20150413_045314Desert.jpg','file/productos/','845941',635,'2015-05-26 15:12:02',0,1,1),(17,19,'image/jpeg','20150508_083641images7.jpeg','file/productos/','6981',635,'2015-05-26 15:12:02',0,1,1),(18,4,'image/jpeg','20150520_0606072015-04-26 17.53.32.jpg','file/productos/','1712097',635,'2015-05-26 15:37:31',0,1,1),(19,7,'image/jpeg','20150520_060804IMG_20150419_154456.jpg','file/productos/','1228672',635,'2015-05-26 15:12:02',0,1,1),(21,1,'image/jpeg','20150521_102017bmsc.jpg','file/clientes/','6954',635,'2015-05-26 15:12:02',0,0,2),(22,1,'image/jpeg','20150521_112102bmsc.jpg','file/clientes/','6954',635,'2015-05-26 15:12:02',0,0,2),(23,1,'image/jpeg','20150521_112123bmsc.jpg','file/clientes/','6954',635,'2015-05-26 15:12:02',0,0,2),(24,1,'image/jpeg','20150521_112140bmsc.jpg','file/clientes/','6954',635,'2015-05-26 15:12:02',0,0,2),(25,1,'image/jpeg','20150521_112636bmsc2.jpg','file/clientes/','4961',635,'2015-05-26 15:12:02',0,0,2),(26,1,'image/jpeg','20150521_112758bmsc.jpg','file/clientes/','6954',635,'2015-05-26 15:12:02',0,0,2),(27,1,'image/jpeg','20150521_112916bmsc.jpg','file/clientes/','6954',635,'2015-05-26 15:12:02',0,0,2),(28,1,'image/gif','20150521_113047bmsc3.gif','file/clientes/','5021',635,'2015-05-26 15:12:02',0,0,2),(29,1,'image/jpeg','20150521_113056bmsc.jpg','file/clientes/','6954',635,'2015-05-26 15:12:02',0,0,2),(30,2,'image/png','20150521_120125descarga.png','file/clientes/','2307',635,'2015-05-26 15:12:02',0,1,2),(31,4,'image/jpeg','20150525_06055911031118_911154522257941_1016828129_o.jpg','file/productos/','233673',635,'2015-05-26 15:37:31',0,1,1),(32,5,'image/jpeg','20150525_06073511035201_911154975591229_1245761264_o.jpg','file/productos/','167674',635,'2015-05-26 15:42:45',0,1,1),(33,5,'image/jpeg','20150525_060803Sin tÃ­tulo.jpg','file/productos/','1330467',635,'2015-05-26 15:42:45',0,1,1),(34,5,'image/jpeg','20150525_06241410626870_953148458045843_2392319170754392593_n.jpg','file/productos/','68818',635,'2015-05-26 15:42:45',0,1,1),(35,4,'image/jpeg','20150525_06385410626870_953148458045843_2392319170754392593_n.jpg','file/productos/','68818',635,'2015-05-26 15:37:31',0,1,1),(36,5,'image/jpeg','20150525_06425110641163_953148531379169_1274761557074378941_n.jpg','file/productos/','79688',635,'2015-05-26 15:42:45',0,1,1),(37,5,'image/jpeg','20150525_06541610636685_953121804715175_8745114804645013038_o.jpg','file/productos/','146137',635,'2015-05-26 15:42:45',0,1,1),(38,5,'image/jpeg','20150525_06541610641163_953148531379169_1274761557074378941_n.jpg','file/productos/','79688',635,'2015-05-26 15:42:45',0,1,1),(39,5,'image/jpeg','20150525_06541610408946_953147704712585_2641381366553007690_n.jpg','file/productos/','77413',635,'2015-05-26 15:42:45',0,1,1),(40,7,'image/jpeg','20150526_114438images7.jpeg','file/productos/','6981',635,'2015-05-26 15:44:38',0,1,1),(41,7,'image/jpeg','20150526_114438images4.jpeg','file/productos/','10504',635,'2015-05-26 15:44:38',0,1,1),(42,7,'image/jpeg','20150526_114438bol-tel.jpg','file/productos/','45019',635,'2015-05-26 15:44:38',1,1,1),(43,1,'image/jpeg','20150601_053745bmsc.jpg','file/clientes/','6954',635,'2015-06-01 09:37:45',1,0,2),(44,1,'image/jpeg','20150601_054121bmsc.jpg','file/clientes/','6954',635,'2015-06-01 09:41:21',1,1,2),(45,9,'image/jpeg','20150608_083327116875.jpg','file/clientes/','640574',635,'2015-06-08 12:33:27',1,0,2),(46,9,'image/jpeg','20150608_083758logo_mar.jpg','file/clientes/','889291',635,'2015-06-08 12:37:58',1,1,2),(47,20,'image/jpeg','20150608_08385611065362_911154858924574_588008206_o.jpg','file/productos/','217478',635,'2015-06-08 12:38:56',1,0,1),(48,21,'image/jpeg','20150608_085001Koala.jpg','file/productos/','780831',635,'2015-06-08 12:50:01',1,1,1),(49,21,'image/jpeg','20150608_085033Jellyfish.jpg','file/productos/','775702',635,'2015-06-08 12:50:33',0,1,1),(50,21,'image/jpeg','20150608_085033Penguins.jpg','file/productos/','777835',635,'2015-06-08 12:50:33',0,1,1),(51,21,'image/jpeg','20150608_085034Tulips.jpg','file/productos/','620888',635,'2015-06-08 12:50:34',0,1,1),(52,4,'image/jpeg','20150616_052620bmsc2.jpg','file/productos/','4961',635,'2015-06-16 09:26:20',0,0,1);
/*!40000 ALTER TABLE `archivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(100) NOT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `imagen` varchar(150) DEFAULT NULL,
  `representante_legal` varchar(100) DEFAULT NULL,
  `ci_representante_legal` varchar(20) DEFAULT NULL,
  `celular_representante_legal` int(11) DEFAULT NULL,
  `correo_representante_legal` varchar(50) DEFAULT NULL,
  `nombre_ref` varchar(100) DEFAULT NULL,
  `ci_ref` int(11) DEFAULT NULL,
  `celular_ref` int(11) DEFAULT NULL,
  `correo_ref` varchar(50) DEFAULT NULL,
  `usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'BANCO MERCANTIL SANTA CRUZ','72544888','2846365',706696877,'fvelasco@miteleferico.bo','Banco mercantil',NULL,'Juan Marcelo','49864966',71066965,'juan@bancomercantil.bo','Arsenio Castellon',49861445,70669877,'cramirez@miteleferico.bo',2,'2015-03-27 00:00:00',1),(2,'BANCO FIE LA PAZ','24444487','248596',70306627,'luis.freddy.velasco@gmail.com','Zona villa dolores F, calle C, nro 75',NULL,'Juan Mamani','4875744',70669687,'juanmamani@gmail.com','Pedro Mamani',4875487,0,'',635,'2015-03-27 12:48:18',1),(3,'MDPyEP','2485548','123123',0,'fredd_for@hotmail.com','calle c',NULL,'','',0,'','',0,0,'',635,'2015-03-30 12:00:07',0),(4,'BANCO FIE EL ALTO','7844844','248445',0,'fvelasco@miteleferico.bo','Zona Ceja de El Alto',NULL,'','',0,'','',0,0,'',635,'2015-03-30 12:03:26',1),(5,'BANCO UNION','4774578','248445',0,'luis.freddy.velasco@gmail.com','calle c zona villa dolores f',NULL,'','',0,'','',0,0,'',635,'2015-03-30 12:04:19',1),(6,'BANCO MERCANTIL','4774578','248445',706666,'fredd_for@hotmail.com','Zona villa dolores F, calle C, nro 75',NULL,'juan Mamaniq','457457',70966554,'juan@bc.bo','Pepito Peres',7894465,7005555,'cramirez@miteleferico.bo',635,'2015-03-30 12:06:52',1),(7,'BANCO BISA LA PAZ','7666667776','2835544',0,'fvelasco@miteleferico.bo','zona sopocachi',NULL,'','',0,'','Juan Mamani Mamani',4666444,7970707,'cramirez@miteleferico.bo',635,'2015-04-13 16:55:36',1),(8,'HERBALIFE','24544547','28466331',706696995,'fvelasco@miteleferico.bo','zona alto lima lecciÃ³n niÃ±os',NULL,'','',0,'','',0,0,'',635,'2015-05-08 08:37:52',1),(9,'BANCO BOLIVIA','6667777','2866676',6667777,'banco@bolivia.com','zona miraflores',NULL,'','',0,'','',0,0,'',635,'2015-06-05 17:01:15',1),(10,'PLANET PITZA','63636633','2856677',707070,'planet@pitza.com','zona sopocachi',NULL,'','',0,'','',0,0,'',635,'2015-06-23 18:04:07',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contrato` varchar(150) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha_contrato` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  `arrendador` varchar(100) DEFAULT NULL,
  `arrendador_rep_legal` varchar(150) DEFAULT NULL,
  `arrendador_cargo` varchar(150) DEFAULT NULL,
  `descripcion` text,
  `dias_tolerancia` int(11) NOT NULL DEFAULT '0',
  `porcentaje_mora` decimal(10,2) NOT NULL DEFAULT '0.00',
  `responsable_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_contratos_fk` (`cliente_id`),
  CONSTRAINT `clientes_contratos_fk` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES (24,'001/2015',1,'2015-04-28 22:07:03',635,'2015-04-14 17:48:32',1,'EMPRESA ESTATAL DE TRASPORTE POR CABLE ','LIC. CESAR LUIS DOCKWEILER SUAREA','GERENTE EJECUTIVO','alquiler de cajeros',5,0.03,640),(25,'002/2015',1,'2015-04-28 04:00:00',635,'2015-04-15 08:28:32',1,'EMPRESA ESTATAL DE TRASPORTE POR CABLE ','LIC. CESAR LUIS DOCKWEILER SUAREA','GERENTE EJECUTIVO','alquiler de cabinas publicitarias',5,0.03,643),(26,'003/2015',2,'2015-04-28 22:07:06',635,'2015-04-15 08:45:27',1,'EMPRESA ESTATAL DE TRASPORTE POR CABLE ','LIC. CESAR LUIS DOCKWEILER SUAREA','GERENTE EJECUTIVO','Cabinas publicitarias',5,0.03,643),(27,'015/2015',8,'2015-05-08 04:00:00',635,'2015-05-08 09:47:41',0,'EMPRESA ESTATAL DE TRASPORTE POR CABLE ','LIC. CESAR LUIS DOCKWEILER SUAREA','GERENTE EJECUTIVO','alquiler de patio de comidasx',5,0.03,640),(28,'017/2015',8,'2015-05-08 04:00:00',635,'2015-05-08 15:33:37',1,'EMPRESA ESTATAL DE TRASPORTE POR CABLE ','LIC. CESAR LUIS DOCKWEILER SUAREA','GERENTE EJECUTIVO','alquiler de patio de comida',5,0.03,640),(29,'011/2015',9,'2015-06-05 04:00:00',635,'2015-06-05 17:44:48',1,'EMPRESA ESTATAL DE TRASPORTE POR CABLE ','LIC. CESAR LUIS DOCKWEILER SUAREA','GERENTE EJECUTIVO','alquiler de cabinas',5,0.03,640),(30,'100/2015',10,'2015-06-23 04:00:00',635,'2015-06-23 18:12:40',1,'EMPRESA ESTATAL DE TRASPORTE POR CABLE ','LIC. CESAR LUIS DOCKWEILER SUAREA','GERENTE EJECUTIVO','alquiler de tres locales comerciales',5,0.03,640);
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratosproductos`
--

DROP TABLE IF EXISTS `contratosproductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratosproductos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contrato_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `tiempo` varchar(20) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  `cantidad` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `nro_dias` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contratos_contratosproductos_fk` (`contrato_id`),
  KEY `productos_contratosproductos_fk` (`producto_id`),
  CONSTRAINT `contratos_contratosproductos_fk` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productos_contratosproductos_fk` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratosproductos`
--

LOCK TABLES `contratosproductos` WRITE;
/*!40000 ALTER TABLE `contratosproductos` DISABLE KEYS */;
INSERT INTO `contratosproductos` VALUES (1,24,4,25000.00,'Mensual','2015-02-04 00:00:00','2015-12-09 00:00:00',1,1,254579.49,309),(2,24,5,2500.00,'Mensual','2015-02-04 00:00:00','2015-12-09 00:00:00',1,1,254579.49,309),(3,24,8,34.00,'Dia','2015-02-05 00:00:00','2015-02-07 00:00:00',1,1,102.00,3),(4,25,17,2500.00,'Mensual','2015-02-10 00:00:00','2016-02-10 00:00:00',0,1,30058.50,366),(5,25,14,2.00,'Hora','2015-04-01 00:00:00','2015-04-01 00:00:00',0,1,4.00,1),(6,25,17,2500.00,'Mensual','2015-04-01 00:00:00','2015-04-23 00:00:00',0,1,1916.67,23),(7,25,17,2500.00,'Mensual','2015-02-05 00:00:00','2015-12-16 00:00:00',0,1,25933.18,315),(8,25,17,2500.00,'Mensual','2015-02-05 00:00:00','2016-01-07 00:00:00',1,1,25933.18,337),(9,25,4,25000.00,'Mensual','2015-04-15 00:00:00','2016-07-06 00:00:00',1,1,368172.04,449),(10,26,7,34.00,'Dia','2015-04-01 00:00:00','2015-04-30 00:00:00',1,1,1020.00,30),(11,26,11,2500.00,'Mensual','2015-04-30 00:00:00','2015-12-31 00:00:00',1,1,20083.33,246),(12,26,5,2300.00,'Mensual','2015-06-01 00:00:00','2015-12-17 00:00:00',1,1,15061.29,200),(13,28,19,21000.00,'Mensual','2015-05-01 00:00:00','2016-06-30 00:00:00',0,1,294000.00,427),(14,28,16,24000.00,'Mensual','2015-02-01 00:00:00','2015-12-31 00:00:00',0,1,264000.00,334),(15,28,19,21000.00,'Mensual','2015-02-11 00:00:00','2016-03-17 00:00:00',0,1,277016.13,401),(16,28,19,21000.00,'Mensual','2015-02-09 00:00:00','2016-02-12 00:00:00',0,1,254689.66,369),(17,28,19,21000.00,'Mensual','2015-04-01 00:00:00','2015-05-31 00:00:00',0,1,42000.00,61),(18,28,19,21000.00,'Mensual','2015-01-14 00:00:00','2016-02-11 00:00:00',1,1,272159.07,394),(19,29,20,920.00,'Mensual','2015-06-15 00:00:00','2016-02-17 00:00:00',1,10,74699.77,248),(20,30,16,24000.00,'Mensual','2015-07-02 00:00:00','2015-09-30 00:00:00',1,1,71225.81,91),(21,30,15,21000.00,'Mensual','2015-07-02 00:00:00','2016-01-14 00:00:00',1,1,134806.45,197);
/*!40000 ALTER TABLE `contratosproductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(100) NOT NULL,
  `sigla` varchar(15) NOT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `representante_legal` varchar(150) DEFAULT NULL,
  `cargo` varchar(150) DEFAULT NULL,
  `ci` varchar(150) DEFAULT NULL,
  `nit` varchar(15) DEFAULT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'EMPRESA ESTATAL DE TRASPORTE POR CABLE \"MITELEFERICO\"','MI TELEFERICO',NULL,'AV. ESTACION CENTRAL TELEFERICO LINEA ROJA NRO. S/N ZONA PURA PURA','LIC. CESAR LUIS DOCKWEILER SUAREA','GERENTE EJECUTIVO',NULL,'280048029',1);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envioscorreos`
--

DROP TABLE IF EXISTS `envioscorreos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envioscorreos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planpago_id` int(11) NOT NULL,
  `remitente` varchar(50) DEFAULT NULL,
  `remitente_correo` varchar(50) DEFAULT NULL,
  `destinatario` varchar(50) DEFAULT NULL,
  `destinatario_correo` varchar(50) DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `contenido` text,
  `estado` int(11) NOT NULL,
  `fecha_programado` date DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `diferencia` int(11) DEFAULT NULL,
  `baja_logica` int(11) NOT NULL,
  `copia` varchar(150) DEFAULT NULL,
  `copia_correo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envioscorreos`
--

LOCK TABLES `envioscorreos` WRITE;
/*!40000 ALTER TABLE `envioscorreos` DISABLE KEYS */;
INSERT INTO `envioscorreos` VALUES (1,1,'Sistema de comercializacion','comercializacion@miteleferico.bo','banco mercantil','bancomercantil@gmail.com','Notificacion 10 antes de la fecha programada','contenido',1,'2015-05-06','2015-05-06',10,1,'',''),(3,4,'MI TELEFERICO','rrhh@miteleferico.bo','BANCO MERCANTIL SANTA CRUZ','fvelasco@miteleferico.bo','Notificacion 0 dias antes de la fecha programada','<div>SeÃ±or(es),</div>\n		<div><b>BANCO MERCANTIL SANTA CRUZ</b></div>\n		<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> ESTACION CENTRAL / TAYPI UTA</div>\n		<div><b>Nro Contrato:</b> 001/2015</div>\n		<div><b>Producto:</b> CAJERO AUTOMATICO</div>\n		<div><b>Fecha Programado:</b> 2015-05-07</div>\n		<div><b>Monto Programado Bs.:</b> 25000.00</div>\n		<BR>\n		<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n		<p>Saludos,</p>\n		<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>',1,'2015-05-07','2015-05-07',0,1,'Arsenio Castellon,Sergio Peñaloza Solares,Luis Freddy Velasco Poma','cramirez@miteleferico.bo,fredd_for@hotmail.com,fvelasco@miteleferico.bo'),(4,26,'MI TELEFERICO','rrhh@miteleferico.bo','BANCO MERCANTIL SANTA CRUZ','fvelasco@miteleferico.bo','Notificacion 10 dias antes de la fecha programada','<div>SeÃ±or(es),</div>\n		<div><b>BANCO MERCANTIL SANTA CRUZ</b></div>\n		<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> VERDE</div>\n		<div><b>EstaciÃ³n:</b> IRPAVI / IRPAWI</div>\n		<div><b>Nro Contrato:</b> 002/2015</div>\n		<div><b>Producto:</b> CAJERO AUTOMATICO </div>\n		<div><b>Fecha Programado:</b> 2015-05-17</div>\n		<div><b>Monto Programado Bs.:</b> 2500.00</div>\n		<BR>\n		<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n		<p>Saludos,</p>\n		<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>',1,'2015-05-17','2015-05-07',10,1,'Arsenio Castellon,Ariana Daza Goytia,Luis Freddy Velasco Poma','cramirez@miteleferico.bo,cramirez@mitelferico.bo,fvelasco@miteleferico.bo'),(5,4,'MI TELEFERICO','rrhh@miteleferico.bo','BANCO MERCANTIL SANTA CRUZ','fvelasco@miteleferico.bo','Notificacion 0 dias antes de la fecha programada','<div>SeÃ±or(es),</div>\n		<div><b>BANCO MERCANTIL SANTA CRUZ</b></div>\n		<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> ESTACION CENTRAL / TAYPI UTA</div>\n		<div><b>Nro Contrato:</b> 001/2015</div>\n		<div><b>Producto:</b> CAJERO AUTOMATICO</div>\n		<div><b>Fecha Programado:</b> 2015-05-08</div>\n		<div><b>Monto Programado Bs.:</b> 25000.00</div>\n		<BR>\n		<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n		<p>Saludos,</p>\n		<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>',1,'2015-05-08','2015-05-08',0,1,'Arsenio Castellon,Sergio PeÃ±aloza Solares,Luis Freddy Velasco Poma','cramirez@miteleferico.bo,fredd_for@hotmail.com,fvelasco@miteleferico.bo'),(6,15,'MI TELEFERICO','rrhh@miteleferico.bo','BANCO MERCANTIL SANTA CRUZ','fvelasco@miteleferico.bo','Notificacion 0 dias antes de la fecha programada','<div>SeÃ±or(es),</div>\n		<div><b>BANCO MERCANTIL SANTA CRUZ</b></div>\n		<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 001/2015</div>\n		<div><b>Producto:</b> CAJEROS AUTOMATICOS</div>\n		<div><b>Fecha Programado:</b> 2015-05-08</div>\n		<div><b>Monto Programado Bs.:</b> 2500.00</div>\n		<BR>\n		<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n		<p>Saludos,</p>\n		<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>',1,'2015-05-08','2015-05-08',0,1,'Arsenio Castellon,Sergio PeÃ±aloza Solares,Luis Freddy Velasco Poma','cramirez@miteleferico.bo,fredd_for@hotmail.com,fvelasco@miteleferico.bo'),(7,26,'MI TELEFERICO','rrhh@miteleferico.bo','BANCO MERCANTIL SANTA CRUZ','fvelasco@miteleferico.bo','Notificacion 10 dias antes de la fecha programada','<div>SeÃ±or(es),</div>\n		<div><b>BANCO MERCANTIL SANTA CRUZ</b></div>\n		<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> VERDE</div>\n		<div><b>EstaciÃ³n:</b> IRPAVI / IRPAWI</div>\n		<div><b>Nro Contrato:</b> 002/2015</div>\n		<div><b>Producto:</b> CAJERO AUTOMATICO </div>\n		<div><b>Fecha Programado:</b> 2015-05-18</div>\n		<div><b>Monto Programado Bs.:</b> 2500.00</div>\n		<BR>\n		<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n		<p>Saludos,</p>\n		<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>',0,'2015-05-18','2015-05-08',10,1,'Arsenio Castellon,Ariana Daza Goytia,Luis Freddy Velasco Poma','cramirez@miteleferico.bo,cramirez@mitelferico.bo,fvelasco@miteleferico.bo');
/*!40000 ALTER TABLE `envioscorreos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estaciones`
--

DROP TABLE IF EXISTS `estaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linea_id` int(11) NOT NULL,
  `estacion` varchar(50) NOT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `lineas_estaciones_fk` (`linea_id`),
  CONSTRAINT `lineas_estaciones_fk` FOREIGN KEY (`linea_id`) REFERENCES `lineas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estaciones`
--

LOCK TABLES `estaciones` WRITE;
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` VALUES (1,1,'ESTACION CENTRAL / TAYPI UTA',1),(3,1,'CEMENTERIO / AJAYUNI',1),(4,1,'16 DE JULIO / JACHA QHATHU',1),(5,2,'LIBERTADOR / CHUQUI APU',1),(6,2,'SOPOCACHI / SUPHU KACHI',1),(7,2,'BUENOS AIRES / QUTA UMA',1),(8,2,'CIUDAD SATELITE / QHANA PATA',1),(9,3,'IRPAVI / IRPAWI',1),(10,3,'OBRAJES / AYNACHA OBRAJES',1),(11,3,'ALTO OBRAJES / QUTA UMA',1),(12,3,'LIBERTADOR / CHUQUI APU',1),(13,2,'pruebass',0);
/*!40000 ALTER TABLE `estaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantias`
--

DROP TABLE IF EXISTS `garantias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `garantias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL COMMENT '1= garantia, 2=derecho de llave, 3=devolucion Garantida, 4=Devolucion Derecho Llave',
  `fecha_deposito` date DEFAULT NULL,
  `nro_deposito` varchar(50) DEFAULT NULL,
  `monto_deposito` decimal(10,2) DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `monto_devolucion` decimal(10,2) DEFAULT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  `contratoproducto_id` int(11) NOT NULL,
  `nro_devolucion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantias`
--

LOCK TABLES `garantias` WRITE;
/*!40000 ALTER TABLE `garantias` DISABLE KEYS */;
INSERT INTO `garantias` VALUES (3,2,'2015-06-02','12345678',25001.00,NULL,NULL,0,1,NULL),(6,1,'2015-04-06','9876',21000.00,'2015-04-04',21000.00,1,1,'457877'),(7,2,'2015-04-05','005',20005.00,NULL,0.00,1,2,''),(8,2,'2015-05-01','123',25000.00,NULL,NULL,1,13,NULL),(9,1,'2015-05-03','003',23000.00,NULL,0.00,1,13,''),(10,1,'2015-05-01','1',15000.00,NULL,0.00,1,2,''),(11,1,'2015-06-03','03',25.00,'0000-00-00',0.00,0,1,''),(12,2,'2015-06-03','04',35.00,'0000-00-00',0.00,0,1,''),(13,3,'2015-06-05','345',0.00,'0000-00-00',0.00,0,1,''),(14,3,'2015-06-13','133',130.00,'0000-00-00',0.00,0,1,''),(15,2,'2015-06-14','14',140.00,'0000-00-00',0.00,0,1,''),(16,1,'2015-06-01','1',10.00,'0000-00-00',0.00,0,1,''),(17,1,'2015-06-01','2',20.00,'0000-00-00',0.00,0,1,''),(18,1,'2015-06-03','33',30.00,'0000-00-00',0.00,0,1,''),(19,2,'2015-04-06','9876',21000.00,'0000-00-00',0.00,1,1,''),(20,3,'2015-06-03','12',2300.00,'0000-00-00',0.00,1,1,''),(21,1,'2015-06-06','12333',25000.00,'0000-00-00',0.00,1,19,''),(22,2,'2015-06-06','34',2000.00,'0000-00-00',0.00,1,19,''),(23,1,'2015-06-03','12',15000.00,'0000-00-00',0.00,1,20,''),(24,2,'2015-06-04','23',5000.00,'0000-00-00',0.00,1,20,''),(25,2,'2015-06-04','24',5000.00,'0000-00-00',0.00,1,20,'');
/*!40000 ALTER TABLE `garantias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(100) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'CAJEROS','CAJ','CAJEROS',NULL,1),(2,'PUBLICIDAD','PUB','PUBLICIDADES',NULL,1),(3,'LOCALES','LOC','LOCALES',NULL,1),(4,'ISLAS COMERCIALES','IC','ISLAS COMERCIALES',NULL,1),(5,'LOCALES COMERCIALES','LC','LOCALES COMERCIALES',NULL,1);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineas`
--

DROP TABLE IF EXISTS `lineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linea` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas`
--

LOCK TABLES `lineas` WRITE;
/*!40000 ALTER TABLE `lineas` DISABLE KEYS */;
INSERT INTO `lineas` VALUES (1,'ROJA','',1),(2,'AMARILLO','',1),(3,'VERDE','',1);
/*!40000 ALTER TABLE `lineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'identificador único del registro de logins al sistema.',
  `ip` varchar(30) DEFAULT NULL COMMENT 'número ip de la máquina desde la cual se ingreso al sistema.',
  `visible` int(11) NOT NULL,
  `baja_logica` int(11) NOT NULL,
  `agrupador` int(11) NOT NULL,
  `user_reg_id` int(11) DEFAULT NULL COMMENT 'identificador único del usuario que ingreso al sistema.',
  `fecha_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'fecha y hora de ingreso al sistema.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla para el registro de ingresos al sistema.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `controlador` varchar(30) DEFAULT NULL,
  `indexs` int(11) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Inicio','Pagina principal','dashboard',1,'fa fa-users'),(2,'Comercializaci&oacute;n','Comercialización','comercial',3,'fa fa-users'),(3,'Parametricas','Tablas parametricas del sistema','parametros',2,'fa fa-wrench'),(4,'Control de Pagos','Seguimiento al control de pagos','control',4,'fa fa-usd'),(5,'Reportes','Reportes del sistema','reportes',5,'fa fa-file-text-o'),(7,'Facturas','Facturacion a clientes','facturas',6,'fa fa-usd'),(8,'Molivilidad de Personal','Menu Administrador','movilidad',7,NULL),(9,'Archivo','Archivo','archivo',8,'gi gi-more_items'),(10,'Usuario','Bandeja de Salida','usuario',9,NULL),(11,'Parametrizacion','Tablas parametricas del sistema','parametricas',10,'gi gi-more_items'),(12,'Relaci&oacute;n Laboral','Relaci&oacute;n Laboral','relaborales',11,'gi gi-more_items'),(14,'Archivo Personal','Archivo personal EETC MT','presentaciondoc',12,'gi gi-more_items');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveles` (
  `id` int(11) NOT NULL,
  `nivel` varchar(30) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles`
--

LOCK TABLES `niveles` WRITE;
/*!40000 ALTER TABLE `niveles` DISABLE KEYS */;
INSERT INTO `niveles` VALUES (1,'Administrador','Administrador del sistema'),(2,'Administrador','Administrador del sistema Comercial'),(3,'Responsable Comercial','Resposable comercial'),(4,'Facturas','Responsansable de facturacion'),(5,'Super Administrador','Adminstrador del todo el sistema');
/*!40000 ALTER TABLE `niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivelmenu`
--

DROP TABLE IF EXISTS `nivelmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivelmenu` (
  `id_nivel` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_nivel`,`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivelmenu`
--

LOCK TABLES `nivelmenu` WRITE;
/*!40000 ALTER TABLE `nivelmenu` DISABLE KEYS */;
INSERT INTO `nivelmenu` VALUES (1,1),(1,8),(1,13),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,9),(2,11),(2,12),(2,14),(3,1),(3,2),(3,4),(3,6),(3,7),(3,13),(4,1),(4,7),(5,8),(5,11),(5,13),(5,15),(5,16),(6,1),(6,2),(6,3),(6,4),(6,6),(6,7),(6,18),(8,12);
/*!40000 ALTER TABLE `nivelmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planpagodepositos`
--

DROP TABLE IF EXISTS `planpagodepositos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planpagodepositos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planpago_id` int(11) NOT NULL,
  `fecha_deposito` date DEFAULT NULL,
  `monto_deposito` decimal(10,2) DEFAULT NULL,
  `nro_deposito` varchar(50) DEFAULT NULL,
  `tipo_deposito` int(11) DEFAULT NULL COMMENT '1 = deposito, 2=deposito mora',
  `fecha_reg` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `usuario_reg` int(11) NOT NULL,
  `baja_logica` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planpagodepositos`
--

LOCK TABLES `planpagodepositos` WRITE;
/*!40000 ALTER TABLE `planpagodepositos` DISABLE KEYS */;
INSERT INTO `planpagodepositos` VALUES (23,1,'2015-04-01',20000.00,'1',1,'2015-04-27 21:37:35',635,1),(24,1,'2015-04-02',3000.00,'2',1,'2015-04-27 22:32:06',635,0),(25,2,'2015-04-03',24321.43,'3',1,'2015-04-24 14:11:54',635,1),(26,1,'2015-04-01',1000.00,'100',1,'2015-04-27 21:37:37',635,1),(27,1,'2015-04-30',2000.00,'100',1,'2015-04-27 22:32:07',635,0),(28,1,'2015-04-03',3000.00,'3333',1,'2015-04-27 22:32:09',635,0),(29,1,'2015-04-04',4000.00,'4',1,'2015-04-27 21:55:57',635,0),(30,1,'2015-04-06',600.00,'6',1,'2015-04-27 21:56:55',635,0),(31,1,'2015-04-07',700.00,'7',1,'2015-04-27 22:02:20',635,0),(32,1,'2015-04-02',2000.00,'2',1,'2015-04-27 22:34:38',635,1),(33,1,'2015-04-02',2000.00,'2',2,'2015-04-27 22:34:55',635,0),(34,1,'2015-04-02',200000.00,'3',2,'2015-04-27 22:35:18',635,0),(35,1,'2015-04-02',10000.00,'4',2,'2015-04-27 22:35:49',635,1),(36,1,'2015-04-02',10000.00,'5',2,'2015-04-27 22:36:00',635,0),(37,12,'2015-04-01',1000.00,'01',1,'2015-04-28 19:29:47',635,1),(38,12,'2015-04-01',21000.00,'02',1,'2015-04-28 19:32:40',635,0),(39,12,'2015-04-02',1300.00,'02',1,'2015-04-28 19:36:51',635,1),(40,12,'2015-04-30',213846.77,'03',2,'2015-04-28 19:39:12',635,0),(41,13,'2015-04-30',2433.00,'04',1,'2015-04-28 19:41:20',635,1),(42,62,'2015-04-29',13333.33,'12',1,'2015-05-07 21:54:18',635,1),(43,63,'2015-04-29',25000.00,'12',1,'2015-05-07 21:54:49',635,1),(44,64,'2015-04-29',25000.00,'12',1,'2015-05-07 21:54:55',635,1),(45,151,'2015-03-16',12193.55,'12',1,'2015-05-08 21:30:37',635,0),(46,151,'2015-02-16',12193.55,'11',1,'2015-05-08 21:31:07',635,1),(47,3,'2015-05-05',25000.00,'123',1,'2015-05-11 20:11:22',635,1),(48,14,'2015-05-02',2000.00,'2000',1,'2015-05-15 16:17:49',635,1),(49,4,'2015-05-15',26000.00,'15',1,'2015-05-15 20:28:44',635,1),(50,14,'2015-05-15',500.00,'5',1,'2015-05-15 20:29:39',635,1),(51,13,'2015-05-05',190934.62,'5',2,'2015-05-15 20:32:54',635,0),(52,12,'2015-06-05',692.06,'1222',2,'2015-06-05 22:01:48',635,1),(53,174,'2015-06-26',232254.81,'333',1,'2015-06-23 22:29:55',635,1);
/*!40000 ALTER TABLE `planpagodepositos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planpagofacturas`
--

DROP TABLE IF EXISTS `planpagofacturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planpagofacturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planpago_id` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `monto_factura` decimal(10,2) NOT NULL,
  `nro_factura` varchar(50) NOT NULL,
  `fecha_reg` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `usuario_reg` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `baja_logica` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planpagofacturas`
--

LOCK TABLES `planpagofacturas` WRITE;
/*!40000 ALTER TABLE `planpagofacturas` DISABLE KEYS */;
INSERT INTO `planpagofacturas` VALUES (1,23,'2015-04-10',10.00,'10','0000-00-00 00:00:00',1,0,0),(2,24,'2015-04-02',1696.43,'2','2015-04-30 16:19:50',635,0,1),(3,50,'2015-04-03',2142.86,'3','2015-04-30 19:14:06',635,0,1),(4,39,'2015-04-01',2142.86,'4','2015-04-30 19:14:55',635,0,1),(5,12,'2015-04-05',2232.14,'5','2015-04-30 19:40:38',635,0,1),(6,1,'2015-04-06',22321.43,'6','2015-04-30 19:47:05',635,0,1),(7,23,'2015-05-12',102.00,'132','2015-05-07 14:01:35',635,0,1),(8,25,'2015-05-04',2500.00,'123','2015-05-07 21:56:13',635,0,1),(9,13,'2015-06-05',2432.14,'222','2015-06-05 22:03:26',645,0,1);
/*!40000 ALTER TABLE `planpagofacturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planpagos`
--

DROP TABLE IF EXISTS `planpagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planpagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contratoproducto_id` int(11) NOT NULL,
  `contrato_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha_programado` date NOT NULL,
  `monto_programado` decimal(10,2) DEFAULT NULL,
  `dias_atraso` int(11) DEFAULT NULL,
  `mora` decimal(10,2) DEFAULT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  `diferencia` decimal(10,2) DEFAULT NULL,
  `monto_reprogramado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planpagos`
--

LOCK TABLES `planpagos` WRITE;
/*!40000 ALTER TABLE `planpagos` DISABLE KEYS */;
INSERT INTO `planpagos` VALUES (1,1,24,4,'2015-02-28',22321.43,28,692.06,1,678.57,22321.43),(2,1,24,4,'2015-03-31',25000.00,0,0.00,1,0.00,24321.43),(3,1,24,4,'2015-04-30',25000.00,0,0.00,1,0.00,25000.00),(4,1,24,4,'2015-05-18',25000.00,0,0.00,1,1000.00,25000.00),(5,1,24,4,'2015-06-30',25000.00,0,0.00,1,0.00,24000.00),(6,1,24,4,'2015-07-31',25000.00,0,0.00,1,0.00,25000.00),(7,1,24,4,'2015-08-31',25000.00,NULL,NULL,1,NULL,25000.00),(8,1,24,4,'2015-09-30',25000.00,NULL,NULL,1,NULL,25000.00),(9,1,24,4,'2015-10-31',25000.00,NULL,NULL,1,NULL,25000.00),(10,1,24,4,'2015-11-30',25000.00,NULL,NULL,1,NULL,25000.00),(11,1,24,4,'2015-12-09',7258.06,NULL,NULL,1,NULL,7258.06),(12,2,24,5,'2015-02-28',2232.14,28,692.06,1,67.86,2232.14),(13,2,24,5,'2015-03-31',2500.00,25,617.91,1,0.86,2432.14),(14,2,24,5,'2015-04-30',2500.00,10,247.16,1,0.86,2499.14),(15,2,24,5,'2015-05-11',2500.00,NULL,NULL,1,NULL,2499.14),(16,2,24,5,'2015-06-30',2500.00,NULL,NULL,1,NULL,2500.00),(17,2,24,5,'2015-07-31',2500.00,NULL,NULL,1,NULL,2500.00),(18,2,24,5,'2015-08-31',2500.00,NULL,NULL,1,NULL,2500.00),(19,2,24,5,'2015-09-30',2500.00,NULL,NULL,1,NULL,2500.00),(20,2,24,5,'2015-10-31',2500.00,NULL,NULL,1,NULL,2500.00),(21,2,24,5,'2015-11-30',2500.00,NULL,NULL,1,NULL,2500.00),(22,2,24,5,'2015-12-09',725.81,NULL,NULL,1,NULL,725.81),(23,3,24,8,'2015-02-07',102.00,NULL,NULL,1,NULL,102.00),(24,4,25,17,'2015-02-28',1696.43,NULL,NULL,1,NULL,1696.43),(25,4,25,17,'2015-03-31',2500.00,NULL,NULL,1,NULL,2500.00),(26,4,25,17,'2015-05-21',2500.00,NULL,NULL,1,NULL,2500.00),(27,4,25,17,'2015-05-31',2500.00,NULL,NULL,1,NULL,2500.00),(28,4,25,17,'2015-06-30',2500.00,NULL,NULL,1,NULL,2500.00),(29,4,25,17,'2015-07-31',2500.00,NULL,NULL,1,NULL,2500.00),(30,4,25,17,'2015-08-31',2500.00,NULL,NULL,1,NULL,2500.00),(31,4,25,17,'2015-09-30',2500.00,NULL,NULL,1,NULL,2500.00),(32,4,25,17,'2015-10-31',2500.00,NULL,NULL,1,NULL,2500.00),(33,4,25,17,'2015-11-30',2500.00,NULL,NULL,1,NULL,2500.00),(34,4,25,17,'2015-12-31',2500.00,NULL,NULL,1,NULL,2500.00),(35,4,25,17,'2016-01-31',2500.00,NULL,NULL,1,NULL,2500.00),(36,4,25,17,'2016-02-10',862.07,NULL,NULL,1,NULL,862.07),(37,5,25,14,'2015-04-01',0.00,NULL,NULL,1,NULL,0.00),(38,6,25,17,'2015-04-23',1916.67,NULL,NULL,1,NULL,1916.67),(39,7,25,17,'2015-02-28',2142.86,NULL,NULL,1,NULL,2142.86),(40,7,25,17,'2015-03-31',2500.00,NULL,NULL,1,NULL,2500.00),(41,7,25,17,'2015-04-30',2500.00,NULL,NULL,1,NULL,2500.00),(42,7,25,17,'2015-05-31',2500.00,NULL,NULL,1,NULL,2500.00),(43,7,25,17,'2015-06-30',2500.00,NULL,NULL,1,NULL,2500.00),(44,7,25,17,'2015-07-31',2500.00,NULL,NULL,1,NULL,2500.00),(45,7,25,17,'2015-08-31',2500.00,NULL,NULL,1,NULL,2500.00),(46,7,25,17,'2015-09-30',2500.00,NULL,NULL,1,NULL,2500.00),(47,7,25,17,'2015-10-31',2500.00,NULL,NULL,1,NULL,2500.00),(48,7,25,17,'2015-11-30',2500.00,NULL,NULL,1,NULL,2500.00),(49,7,25,17,'2015-12-16',1290.32,NULL,NULL,1,NULL,1290.32),(50,8,25,17,'2015-02-28',2142.86,NULL,NULL,1,NULL,2142.86),(51,8,25,17,'2015-03-31',2500.00,NULL,NULL,1,NULL,2500.00),(52,8,25,17,'2015-04-30',2500.00,NULL,NULL,1,NULL,2500.00),(53,8,25,17,'2015-05-31',2500.00,NULL,NULL,1,NULL,2500.00),(54,8,25,17,'2015-06-30',2500.00,NULL,NULL,1,NULL,2500.00),(55,8,25,17,'2015-07-31',2500.00,NULL,NULL,1,NULL,2500.00),(56,8,25,17,'2015-08-31',2500.00,NULL,NULL,1,NULL,2500.00),(57,8,25,17,'2015-09-30',2500.00,NULL,NULL,1,NULL,2500.00),(58,8,25,17,'2015-10-31',2500.00,NULL,NULL,1,NULL,2500.00),(59,8,25,17,'2015-11-30',2500.00,NULL,NULL,1,NULL,2500.00),(60,8,25,17,'2015-12-31',2500.00,NULL,NULL,1,NULL,2500.00),(61,8,25,17,'2016-01-07',564.52,NULL,NULL,1,NULL,564.52),(62,9,25,4,'2015-04-30',13333.33,0,0.00,1,0.00,13333.33),(63,9,25,4,'2015-05-31',25000.00,0,0.00,1,0.00,25000.00),(64,9,25,4,'2015-06-30',25000.00,0,0.00,1,0.00,25000.00),(65,9,25,4,'2015-07-31',25000.00,NULL,NULL,1,NULL,25000.00),(66,9,25,4,'2015-08-31',25000.00,NULL,NULL,1,NULL,25000.00),(67,9,25,4,'2015-09-30',25000.00,NULL,NULL,1,NULL,25000.00),(68,9,25,4,'2015-10-31',25000.00,NULL,NULL,1,NULL,25000.00),(69,9,25,4,'2015-11-30',25000.00,NULL,NULL,1,NULL,25000.00),(70,9,25,4,'2015-12-31',25000.00,NULL,NULL,1,NULL,25000.00),(71,9,25,4,'2016-01-31',25000.00,NULL,NULL,1,NULL,25000.00),(72,9,25,4,'2016-02-29',25000.00,NULL,NULL,1,NULL,25000.00),(73,9,25,4,'2016-03-31',25000.00,NULL,NULL,1,NULL,25000.00),(74,9,25,4,'2016-04-30',25000.00,NULL,NULL,1,NULL,25000.00),(75,9,25,4,'2016-05-31',25000.00,NULL,NULL,1,NULL,25000.00),(76,9,25,4,'2016-06-30',25000.00,NULL,NULL,1,NULL,25000.00),(77,9,25,4,'2016-07-06',4838.71,NULL,NULL,1,NULL,4838.71),(78,10,26,7,'2015-04-30',1020.00,NULL,NULL,1,NULL,1020.00),(79,11,26,11,'2015-04-30',83.33,NULL,NULL,1,NULL,83.33),(80,11,26,11,'2015-05-31',2500.00,NULL,NULL,1,NULL,2500.00),(81,11,26,11,'2015-06-30',2500.00,NULL,NULL,1,NULL,2500.00),(82,11,26,11,'2015-07-31',2500.00,NULL,NULL,1,NULL,2500.00),(83,11,26,11,'2015-08-31',2500.00,NULL,NULL,1,NULL,2500.00),(84,11,26,11,'2015-09-30',2500.00,NULL,NULL,1,NULL,2500.00),(85,11,26,11,'2015-10-31',2500.00,NULL,NULL,1,NULL,2500.00),(86,11,26,11,'2015-11-30',2500.00,NULL,NULL,1,NULL,2500.00),(87,11,26,11,'2015-12-31',2500.00,NULL,NULL,1,NULL,2500.00),(120,15,28,19,'2015-01-03',5.00,NULL,NULL,0,NULL,5.00),(121,15,28,19,'2015-03-31',21000.00,NULL,NULL,1,NULL,21000.00),(122,15,28,19,'2015-04-30',21000.00,NULL,NULL,1,NULL,21000.00),(123,15,28,19,'2015-05-31',21000.00,NULL,NULL,1,NULL,21000.00),(124,15,28,19,'2015-06-30',21000.00,NULL,NULL,1,NULL,21000.00),(125,15,28,19,'2015-07-31',21000.00,NULL,NULL,1,NULL,21000.00),(126,15,28,19,'2015-08-31',21000.00,NULL,NULL,1,NULL,21000.00),(127,15,28,19,'2015-09-30',21000.00,NULL,NULL,1,NULL,21000.00),(128,15,28,19,'2015-10-31',21000.00,NULL,NULL,1,NULL,21000.00),(129,15,28,19,'2015-11-30',21000.00,NULL,NULL,1,NULL,21000.00),(130,15,28,19,'2015-12-31',21000.00,NULL,NULL,1,NULL,21000.00),(131,15,28,19,'2016-01-31',21000.00,NULL,NULL,1,NULL,21000.00),(132,15,28,19,'2016-02-29',21000.00,NULL,NULL,1,NULL,21000.00),(133,15,28,19,'2016-03-17',11516.13,NULL,NULL,1,NULL,11516.13),(134,15,28,19,'2015-01-01',1.00,NULL,NULL,0,NULL,1.00),(135,15,28,19,'2015-01-02',2.00,NULL,NULL,0,NULL,2.00),(136,16,28,19,'2015-02-28',15000.00,NULL,NULL,1,NULL,15000.00),(137,16,28,19,'2015-03-31',21000.00,NULL,NULL,1,NULL,21000.00),(138,16,28,19,'2015-04-30',21000.00,NULL,NULL,1,NULL,21000.00),(139,16,28,19,'2015-05-31',21000.00,NULL,NULL,1,NULL,21000.00),(140,16,28,19,'2015-06-30',21000.00,NULL,NULL,1,NULL,21000.00),(141,16,28,19,'2015-07-31',21000.00,NULL,NULL,1,NULL,21000.00),(142,16,28,19,'2015-08-31',21000.00,NULL,NULL,1,NULL,21000.00),(143,16,28,19,'2015-09-30',21000.00,NULL,NULL,1,NULL,21000.00),(144,16,28,19,'2015-10-31',21000.00,NULL,NULL,1,NULL,21000.00),(145,16,28,19,'2015-11-30',21000.00,NULL,NULL,1,NULL,21000.00),(146,16,28,19,'2015-12-31',21000.00,NULL,NULL,1,NULL,21000.00),(147,16,28,19,'2016-01-31',21000.00,NULL,NULL,1,NULL,21000.00),(148,16,28,19,'2016-02-12',8689.66,NULL,NULL,1,NULL,8689.66),(149,17,28,19,'2015-04-30',21000.00,NULL,NULL,1,NULL,21000.00),(150,17,28,19,'2015-05-31',21000.00,NULL,NULL,1,NULL,21000.00),(151,18,28,19,'2015-01-31',12193.55,11,227.95,1,0.00,12193.55),(152,18,28,19,'2015-02-28',21000.00,NULL,NULL,1,NULL,21000.00),(153,18,28,19,'2015-03-31',21000.00,NULL,NULL,1,NULL,21000.00),(154,18,28,19,'2015-04-30',21000.00,NULL,NULL,1,NULL,21000.00),(155,18,28,19,'2015-05-31',21000.00,NULL,NULL,1,NULL,21000.00),(156,18,28,19,'2015-06-30',21000.00,NULL,NULL,1,NULL,21000.00),(157,18,28,19,'2015-07-31',21000.00,NULL,NULL,1,NULL,21000.00),(158,18,28,19,'2015-08-31',21000.00,NULL,NULL,1,NULL,21000.00),(159,18,28,19,'2015-09-30',21000.00,NULL,NULL,1,NULL,21000.00),(160,18,28,19,'2015-10-31',21000.00,NULL,NULL,1,NULL,21000.00),(161,18,28,19,'2015-11-30',21000.00,NULL,NULL,1,NULL,21000.00),(162,18,28,19,'2015-12-31',21000.00,NULL,NULL,1,NULL,21000.00),(163,18,28,19,'2016-01-31',21000.00,NULL,NULL,1,NULL,21000.00),(164,18,28,19,'2016-02-11',7965.52,NULL,NULL,1,NULL,7965.52),(165,19,29,20,'2015-06-30',4906.67,NULL,NULL,1,NULL,4906.67),(166,19,29,20,'2015-07-31',9200.00,NULL,NULL,1,NULL,9200.00),(167,19,29,20,'2015-08-31',9200.00,NULL,NULL,1,NULL,9200.00),(168,19,29,20,'2015-09-30',9200.00,NULL,NULL,1,NULL,9200.00),(169,19,29,20,'2015-10-31',9200.00,NULL,NULL,1,NULL,9200.00),(170,19,29,20,'2015-11-30',9200.00,NULL,NULL,1,NULL,9200.00),(171,19,29,20,'2015-12-31',9200.00,NULL,NULL,1,NULL,9200.00),(172,19,29,20,'2016-01-31',9200.00,NULL,NULL,1,NULL,9200.00),(173,19,29,20,'2016-02-17',5393.10,NULL,NULL,1,NULL,5393.10),(174,20,30,16,'2015-07-31',23225.81,0,0.00,1,209029.00,23225.81),(175,20,30,16,'2015-08-31',24000.00,NULL,NULL,1,NULL,-185029.00),(176,20,30,16,'2015-09-30',24000.00,NULL,NULL,1,NULL,24000.00),(177,21,30,15,'2015-07-31',20322.58,NULL,NULL,1,NULL,20322.58),(178,21,30,15,'2015-08-31',21000.00,NULL,NULL,1,NULL,21000.00),(179,21,30,15,'2015-09-30',21000.00,NULL,NULL,1,NULL,21000.00),(180,21,30,15,'2015-10-31',21000.00,NULL,NULL,1,NULL,21000.00),(181,21,30,15,'2015-11-30',21000.00,NULL,NULL,1,NULL,21000.00),(182,21,30,15,'2015-12-31',21000.00,NULL,NULL,1,NULL,21000.00),(183,21,30,15,'2016-01-14',9483.87,NULL,NULL,1,NULL,9483.87);
/*!40000 ALTER TABLE `planpagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(11) NOT NULL,
  `estacion_id` int(11) NOT NULL,
  `producto` varchar(250) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `tiempo` varchar(20) NOT NULL,
  `dimension_x` int(11) DEFAULT NULL,
  `dimension_y` int(11) DEFAULT NULL,
  `usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `estaciones_productos_fk` (`estacion_id`),
  KEY `grupos_productos_fk` (`grupo_id`),
  CONSTRAINT `estaciones_productos_fk` FOREIGN KEY (`estacion_id`) REFERENCES `estaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `grupos_productos_fk` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,1,'cajeros','CA-1',NULL,10.00,80,'Dia',1,1,2,'2015-03-26 00:00:00',0),(2,2,6,'cajeros','CA-2 ','plan de accion',12.00,1,'Dia',1,1,629,'2015-03-26 18:57:29',0),(3,2,1,'publicidad','PU-01','publicidad de colinos',100.00,1,'Dia',1,1,629,'2015-03-26 18:59:03',0),(4,1,1,'CAJERO AUTOMATICO','CA-03','Alquiler de espacio para cajeros automaticos',25000.00,0,'Mensual',1,1,629,'2015-03-26 18:59:07',1),(5,1,3,'CAJEROS AUTOMATICOS','CA-04','Cajeros Automaticos',2500.00,2,'Mensual',1,1,629,'2015-03-26 18:59:09',1),(6,2,1,'LOCALES','LOC-01','Locales para patio de comidas',55000.00,0,'Mensual',1,1,629,'2015-03-26 18:59:11',1),(7,1,1,'CABINAS','CAB-01','Cabinas publicitarias',34.00,3,'Dia',1,1,629,'2015-03-26 19:03:10',1),(8,1,1,'CABINAS','CAB-02','Cabinas publicitarias',34.00,4,'Dia',1,1,629,'2015-03-26 19:03:13',1),(9,1,1,'CABINAS','CAB-03','Cabinas publicitarias',34.00,1,'Dia',1,1,629,'2015-03-26 19:03:15',1),(10,1,1,'CABINAS','CAB-04','Cabinas publicitarias',34.00,1,'Dia',1,1,629,'2015-03-26 19:03:18',1),(11,1,1,'CABINAS','CAB-05','Cabinas publicitarias',34.00,1,'Dia',1,1,629,'2015-03-26 19:03:21',1),(12,1,1,'CABINAS','CAB-06','Cabinas publicitarias',34.00,0,'Dia',1,1,629,'2015-03-26 19:03:23',1),(13,1,1,'CABINAS','CAB-07','Cabinas publicitarias',34.00,0,'Dia',1,1,629,'2015-03-26 19:03:27',1),(14,1,3,'LOCALES','LOC-02','Locales para patio de comidas',2.00,1,'Hora',1,1,629,'2015-03-26 19:21:05',1),(15,2,3,'LOCALES','LOC-03','Locales para patio de comidas',2.00,0,'Hora',1,1,629,'2015-03-26 19:22:20',1),(16,1,1,'LOCALES','LOC-04','Locales para patio de comidas',2.00,0,'Hora',1,1,629,'2015-03-26 19:23:35',1),(17,1,9,'CAJERO AUTOMATICO ','LV-IR-CA-CA01','ES UN CAJERO AUTOMATICO DE DIMENSION XxY',2500.00,3,'Mensual',1,1,635,'2015-04-13 16:52:43',1),(18,3,1,'producto de prueba','1','1',1000.00,1,'Mensual',1,1,635,'2015-04-28 16:34:05',1),(19,5,11,'Local comercial','LC-01','local comercial en la parte izquierda',21000.00,4,'Mensual',1,1,635,'2015-05-08 08:36:18',1),(20,2,3,'CABINAS','CAB-007','95 CM DE MICRO PERFORADO',940.00,99,'Mensual',1,1,635,'2015-06-05 16:54:50',1),(21,2,5,'CABINAS ','CAB-008','PUBLICIDAD DE CABINAS',21000.00,100,'Mensual',1,1,635,'2015-06-08 08:49:39',1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(30) NOT NULL,
  `dependencia` int(11) DEFAULT NULL COMMENT '0=total,1=restringida,2=mixta',
  `vigencia` int(11) DEFAULT NULL COMMENT 'vigencia de la contrasena antes de pedir su cambio.',
  `observacion` varchar(200) DEFAULT NULL COMMENT 'observación sobre el registro del rol.',
  `estado` int(11) DEFAULT NULL COMMENT 'estado del registro del rol (0:pasivo;1:activo).',
  `visible` int(11) NOT NULL,
  `baja_logica` int(11) NOT NULL,
  `agrupador` int(11) NOT NULL,
  `user_reg_id` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `user_mod_id` int(11) DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla para el registro de roles de usuario.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'login','Usuario'),(2,'usuario','Usuario común'),(3,'jefe','Jefe de Oficina(Area, Unidad, Dirección)'),(4,'ventanilla','Ventanilla'),(5,'despacho','Despacho Ministerial'),(6,'archivero','Archivero Central');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1),(95,1),(96,1),(97,1),(98,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(121,1),(122,1),(123,1),(124,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(209,1),(210,1),(211,1),(212,1),(213,1),(214,1),(215,1),(216,1),(217,1),(218,1),(219,1),(220,1),(221,1),(222,1),(223,1),(224,1),(225,1),(226,1),(227,1),(228,1),(229,1),(230,1),(231,1),(232,1),(234,1),(235,1),(236,1),(237,1),(238,1),(239,1),(240,1),(241,1),(242,1),(243,1),(244,1),(245,1),(246,1),(247,1),(248,1),(249,1),(250,1),(251,1),(252,1),(253,1),(254,1),(255,1),(256,1),(260,1),(261,1),(262,1),(263,1),(264,1),(265,1),(266,1),(267,1),(268,1),(269,1),(270,1),(271,1),(272,1),(273,1),(274,1),(275,1),(276,1),(277,1),(278,1),(279,1),(280,1),(281,1),(282,1),(283,1),(284,1),(285,1),(286,1),(287,1),(288,1),(289,1),(290,1),(291,1),(292,1),(293,1),(294,1),(295,1),(296,1),(297,1),(298,1),(299,1),(300,1),(301,1),(302,1),(303,1),(304,1),(305,1),(306,1),(307,1),(308,1),(309,1),(310,1),(311,1),(312,1),(313,1),(314,1),(315,1),(316,1),(317,1),(321,1),(324,1),(325,1),(326,1),(327,1),(328,1),(329,1),(330,1),(331,1),(332,1),(333,1),(334,1),(335,1),(336,1),(337,1),(338,1),(339,1),(340,1),(341,1),(342,1),(343,1),(344,1),(345,1),(346,1),(347,1),(348,1),(349,1),(351,1),(352,1),(353,1),(354,1),(355,1),(356,1),(357,1),(358,1),(359,1),(360,1),(361,1),(362,1),(363,1),(364,1),(365,1),(366,1),(367,1),(368,1),(369,1),(370,1),(371,1),(372,1),(373,1),(374,1),(375,1),(376,1),(377,1),(378,1),(379,1),(380,1),(381,1),(382,1),(383,1),(384,1),(385,1),(386,1),(387,1),(388,1),(389,1),(390,1),(391,1),(392,1),(393,1),(394,1),(395,1),(396,1),(397,1),(398,1),(399,1),(400,1),(401,1),(405,1),(406,1),(407,1),(408,1),(409,1),(410,1),(411,1),(413,1),(414,1),(415,1),(416,1),(417,1),(418,1),(419,1),(420,1),(421,1),(422,1),(423,1),(424,1),(425,1),(426,1),(427,1),(428,1),(429,1),(430,1),(431,1),(432,1),(433,1),(434,1),(435,1),(436,1),(437,1),(438,1),(439,1),(440,1),(441,1),(442,1),(443,1),(444,1),(445,1),(446,1),(447,1),(448,1),(449,1),(450,1),(451,1),(452,1),(453,1),(454,1),(455,1),(456,1),(457,1),(459,1),(460,1),(461,1),(462,1),(463,1),(464,1),(465,1),(466,1),(467,1),(468,1),(469,1),(470,1),(471,1),(472,1),(473,1),(474,1),(475,1),(476,1),(477,1),(478,1),(479,1),(480,1),(482,1),(483,1),(484,1),(485,1),(486,1),(487,1),(488,1),(489,1),(490,1),(491,1),(492,1),(493,1),(494,1),(495,1),(496,1),(497,1),(498,1),(499,1),(500,1),(501,1),(502,1),(503,1),(504,1),(505,1),(506,1),(507,1),(508,1),(509,1),(510,1),(512,1),(513,1),(514,1),(515,1),(516,1),(517,1),(518,1),(519,1),(520,1),(521,1),(522,1),(523,1),(526,1),(527,1),(528,1),(529,1),(530,1),(531,1),(532,1),(533,1),(534,1),(535,1),(536,1),(537,1),(538,1),(539,1),(540,1),(541,1),(542,1),(543,1),(544,1),(545,1),(546,1),(547,1),(548,1),(549,1),(550,1),(551,1),(552,1),(553,1),(554,1),(556,1),(557,1),(558,1),(559,1),(560,1),(561,1),(562,1),(563,1),(564,1),(565,1),(566,1),(567,1),(568,1),(569,1),(570,1),(571,1),(572,1),(573,1),(574,1),(575,1),(576,1),(577,1),(578,1),(579,1),(580,1),(581,1),(582,1),(583,1),(584,1),(585,1),(586,1),(587,1),(588,1),(589,1),(590,1),(591,1),(592,1),(593,1),(594,1),(595,1),(596,1),(597,1),(598,1),(599,1),(600,1),(601,1),(602,1),(603,1),(604,1),(605,1),(606,1),(607,1),(608,1),(609,1),(610,1),(611,1),(612,1),(613,1),(614,1),(615,1),(616,1),(617,1),(618,1),(619,1),(620,1),(621,1),(622,1),(623,1),(624,1),(625,1),(626,1),(627,1),(628,1),(629,1),(630,1),(631,1),(632,1),(633,1),(634,1),(635,1),(636,1),(637,1),(638,1),(639,1),(640,1),(641,1),(642,1),(643,1),(644,1),(645,1),(646,1),(647,1),(648,1),(649,1),(650,1),(651,1),(652,1),(653,1),(654,1),(655,1),(656,1),(657,1),(658,1),(659,1),(660,1),(661,1),(662,1),(663,1),(664,1),(665,1),(666,1),(667,1),(668,1),(669,1),(670,1),(671,1),(672,1),(673,1),(674,1),(675,1),(676,1),(677,1),(678,1),(679,1),(680,1),(681,1),(682,1),(683,1),(684,1),(685,1),(686,1),(687,1),(688,1),(689,1),(690,1),(691,1),(692,1),(693,1),(694,1),(695,1),(696,1),(697,1),(698,1),(699,1),(700,1),(701,1),(702,1),(703,1),(704,1),(705,1),(706,1),(707,1),(708,1),(709,1),(710,1),(711,1),(712,1),(713,1),(714,1),(715,1),(716,1),(717,1),(718,1),(719,1),(720,1),(721,1),(722,1),(723,1),(724,1),(725,1),(726,1),(727,1),(728,1),(729,1),(730,1),(731,1),(732,1),(733,1),(734,1),(735,1),(736,1),(737,1),(738,1),(739,1),(740,1),(741,1),(742,1),(743,1),(744,1),(745,1),(746,1),(747,1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nro_solicitud` varchar(50) NOT NULL,
  `fecha_envio_solicitud` date NOT NULL,
  `fecha_recepcion_solicitud` date NOT NULL,
  `productos_solicitud` varchar(250) NOT NULL,
  `respuesta` int(11) DEFAULT NULL,
  `fecha_envio_resp` date DEFAULT NULL,
  `fecha_recepcion_resp` date DEFAULT NULL,
  `descripcion_resp` varchar(250) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `usuario_reg` int(11) NOT NULL,
  `fecha_reg` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `baja_logica` int(11) NOT NULL,
  `responsable_id` int(11) NOT NULL,
  `representante` varchar(150) DEFAULT NULL,
  `cargo_representante` varchar(150) DEFAULT NULL,
  `descripcion_solictud` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submenus`
--

DROP TABLE IF EXISTS `submenus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `submenu` varchar(30) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `accion` varchar(30) DEFAULT NULL,
  `habilitado` int(11) DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submenus`
--

LOCK TABLES `submenus` WRITE;
/*!40000 ALTER TABLE `submenus` DISABLE KEYS */;
INSERT INTO `submenus` VALUES (1,2,'Lista de Productos','Lista de productos','../productos',1,0),(2,2,'Lista de Clientes','Listado de clientes','../clientes',1,0),(5,2,'Contratos','Listado de contratos realizados','../contratos',1,0),(44,11,'Normativas','PParametrizacion de normativas','../normativas',0,0),(45,5,'Reporte 1','permite la creación de nuevos tipos de documentos','../reporte',1,0),(46,11,'Horarios Laborales','Gesti&oacute;n de Horarios Laborales','../horarioslaborales',0,0),(47,11,'Tolerancias de Ingreso','Gesti&oacute;n de Tolerancias de Ingreso','../tolerancias',0,0),(48,17,'Busqueda Avanzada','Busqueda Avanzada','advanced',0,NULL),(49,13,'Organigrama','Organigrama de su institución','organigrama',0,NULL),(50,4,'Alertas','Alertas','../alertas',1,0),(51,18,'Archivero central','Archivero central',NULL,0,2),(52,3,'Estaciones','Estaciones de la empresa','../estaciones',1,1),(53,11,'Componentes','Parametrizacion de componentes','../componentes',0,0),(54,11,'Fuente de Financiamiento','Parametrizacion fuentes de financiamiento','../fuentefinanciamientos',0,0),(55,11,'Partidas','Parametrizacion partidas','../partidas',0,0),(56,3,'Lineas','Lines de la la empresa','../lineas',1,0),(57,11,'Niveles Estructurales','Parametrizacion de niveles estructurales','../nivelestructurales',0,0),(58,7,'Facturacion','Facturas','../facturas',1,0),(59,11,'Organigrama','Organigrama de la Entidad','../organigramas',0,0),(60,11,'Resoluciones','Resoluciones Salariales','../resoluciones',0,0),(61,11,'Escalas Salariales','Nivel salarial','../nivelsalariales',0,0),(62,11,'Cargos','Cargos de la institucion','../cargos',0,0),(63,12,'Gestion','Gestionar','index',0,0),(64,12,'Reportes','Reportar','index',0,0),(66,5,'Reporte 3','Permite realizar las altas, bajas y modificaciones de los nuevos tipos de documentos','../reporte',1,0),(67,7,'Alertas','Alertas','../facturas',1,0),(68,14,'Gesti&oacute;n Archivo','Permite gestionar el archivo personal','gestion',0,NULL),(69,14,'Listado documentos','Genera una lista de documentos','listar',0,NULL),(70,4,'Control Plan de Pagos','Control de plan de pagos','../planpagos',1,0),(71,3,'Grupos - Rubros','Grupos y rubros','../grupos',1,0),(72,11,'Gesti&oacute;n Feriados','Gesti&oacute;n de asingnaci&oacute;n de feriados','../feriados',0,0),(73,11,'Gesti&oacute;n Excepciones','Gesti&oacute;n Excepciones','../excepciones',0,0),(74,5,'Reporte 2','Tipos de documentos que se solicitara al personal','../reporte',1,0),(75,4,'Facturacion','Facturas','../facturas',1,0),(76,4,'Mora','Control de moras','../moras',1,0),(77,2,'Solicitudes','Listado de solicitudes','../solicitudes',1,0);
/*!40000 ALTER TABLE `submenus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Identificador único del registro de usuario.',
  `username` varchar(32) NOT NULL,
  `superior` int(11) NOT NULL,
  `oficina_id` int(11) NOT NULL,
  `dependencia` smallint(6) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL COMMENT 'password asignado al usuario en cuestión con el registro.',
  `nombre` varchar(50) DEFAULT NULL COMMENT 'denominación del usuario.',
  `mosca` varchar(30) DEFAULT NULL,
  `cargo` varchar(90) DEFAULT NULL,
  `email` varchar(127) DEFAULT NULL,
  `logins` bigint(20) NOT NULL,
  `fecha_creacion` int(11) DEFAULT NULL,
  `habilitado` smallint(6) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `entidad_id` int(11) DEFAULT NULL,
  `super` int(11) DEFAULT NULL,
  `cedula_identidad` bigint(20) DEFAULT NULL,
  `expedido` varchar(3) DEFAULT NULL,
  `theme` text,
  `cite_despacho` int(11) DEFAULT NULL,
  `paterno` varchar(30) DEFAULT NULL,
  `materno` varchar(30) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`) USING BTREE,
  UNIQUE KEY `uniq_email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para el registro de usuarios para el sistema de recursos humanos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (629,'ichacolla',0,1,1,'b374537609b09ea5376e4b8baad6b2809f495b72e9a615531ee33e980ff094c0','Ivan Marcelo','IMCM','Profesional Desarrollo','ichacolla@gmail.com',930,NULL,1,2,'1',NULL,1,1,4021525,'OR',NULL,1,'Chacolla','Morochi',NULL),(635,'fvelasco',0,1,1,'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9','Luis Freddy','FV','Profesioanl en desarrollo de sistemas','fvelasco@miteleferico.bo',432,NULL,1,2,'1',NULL,1,1,4986493,'LP',NULL,1,'Velasco','Poma',NULL),(637,'psalinas',0,1,1,'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9','Pablo','PS','Gerente de Gestion Empresial','psalinas@miteleferico.bo',35,NULL,1,2,'1',NULL,1,1,4098897,'LP',NULL,1,'Salinas','Burgos',NULL),(640,'spenaloza',0,1,1,'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9','Sergio','PD','Profesional en Comercializacio Marketing y Ventas','fredd_for@hotmail.com',26,NULL,1,3,'1',NULL,1,1,4096997,'LP',NULL,1,'PeÃ±aloza','Solares',NULL),(641,'jvera',0,1,1,'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9','Juan Esteban','FBS','Profesional en Comercializacio Marketing y Ventas','luis.freddy.velasco@gmail.com',3,NULL,1,3,'1',NULL,1,1,4567788,'LP',NULL,1,'Vera','Callau',NULL),(643,'adaza',0,1,1,'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9','Ariana','EMV','Profesional en Comercializacio Marketing y Ventas','cramirez@mitelferico.bo',5,NULL,1,3,'1',NULL,1,1,4567747,'LP',NULL,1,'Daza','Goytia',NULL),(644,'cvidaurre',0,1,1,'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9','Carla','MLY','Profesional en Comercializacio Marketing y Ventas','cvidaurre@miteleferico.bo',2,NULL,1,3,'1',NULL,1,1,4557897,'LP',NULL,1,'Vidaurre','Caballero',NULL),(645,'jtinini',0,1,1,'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9','Juan','JT','Responsable de Contabilidad','jloza@miteleferico.bo',2,NULL,1,4,'1',NULL,1,1,4985549,'LP',NULL,1,'Tinini','Tinini',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-25 16:24:19
