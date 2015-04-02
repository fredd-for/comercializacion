/*
Navicat MySQL Data Transfer

Source Server         : local Mysql
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : bd_comercial

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-04-02 16:24:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `archivos`
-- ----------------------------
DROP TABLE IF EXISTS `archivos`;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of archivos
-- ----------------------------
INSERT INTO `archivos` VALUES ('1', '3', 'image/jpeg', '20150401_03483010641163_953148531379169_1274761557074378941_n.jpg', 'file/productos/', '79688', '635', '2015-04-01 03:48:30', '1', '1');
INSERT INTO `archivos` VALUES ('4', '4', 'image/jpeg', '20150401_03560410626870_953148458045843_2392319170754392593_n.jpg', 'file/productos/', '68818', '635', '2015-04-01 03:56:04', '1', '1');
INSERT INTO `archivos` VALUES ('6', '5', 'image/jpeg', '20150401_03563010666098_953147738045915_3371819793238289682_n.jpg', 'file/productos/', '53555', '635', '2015-04-01 03:56:30', '1', '1');
INSERT INTO `archivos` VALUES ('7', '13', 'image/jpeg', '20150401_042434images7.jpeg', 'file/productos/', '6981', '635', '2015-04-01 04:24:34', '1', '1');
INSERT INTO `archivos` VALUES ('8', '12', 'image/jpeg', '20150401_042444index6.jpeg', 'file/productos/', '9097', '635', '2015-04-01 04:24:44', '1', '1');
INSERT INTO `archivos` VALUES ('9', '11', 'image/jpeg', '20150401_042458images4.jpeg', 'file/productos/', '10504', '635', '2015-04-01 04:24:58', '1', '1');

-- ----------------------------
-- Table structure for `clientes`
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(100) NOT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `celular` int(11) DEFAULT NULL,
  `correo` varchar(20) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('1', 'BANCO MERCANTIL SANTA CRUZ', '72544888', '2846365', '706696877', 'bancomercantil@bc.bo', 'Banco mercantil', null, 'Juan Marcelo', '49864966', '71066965', 'juan@bancomercantil.bo', 'Arsenio Castellon', '49861445', '70669877', 'arsenio@bancomercantil.bo', '2', '2015-03-27 00:00:00', '1');
INSERT INTO `clientes` VALUES ('2', 'BANCO FIE LA PAZ', '24444487', '248596', '70306627', 'bancofie@bancofie.co', 'Zona villa dolores F, calle C, nro 75', null, 'Juan Mamani', '4875744', '70669687', 'juanmamani@gmail.com', 'Pedro Mamani', '4875487', '0', '', '635', '2015-03-27 12:48:18', '1');
INSERT INTO `clientes` VALUES ('3', 'MDPyEP', '2485548', '123123', '0', 'mdpyep@mdpyep.com', 'calle c', null, '', '', '0', '', '', '0', '0', '', '635', '2015-03-30 12:00:07', '0');
INSERT INTO `clientes` VALUES ('4', 'BANCO FIE EL ALTO', '7844844', '248445', '0', 'bancofie@bancofie.co', 'Zona Ceja de El Alto', null, '', '', '0', '', '', '0', '0', '', '635', '2015-03-30 12:03:26', '1');
INSERT INTO `clientes` VALUES ('5', 'BANCO UNION', '4774578', '248445', '0', 'bancounion@bancounio', 'calle c zona villa dolores f', null, '', '', '0', '', '', '0', '0', '', '635', '2015-03-30 12:04:19', '1');
INSERT INTO `clientes` VALUES ('6', 'BANCO MERCANTIL', '4774578', '248445', '706666', 'bancomercantil@bc.bo', 'Zona villa dolores F, calle C, nro 75', null, 'juan Mamaniq', '457457', '70966554', 'juan@bc.bo', 'Pepito Peres', '7894465', '7005555', 'pepito@bc.bo', '635', '2015-03-30 12:06:52', '1');

-- ----------------------------
-- Table structure for `contratos`
-- ----------------------------
DROP TABLE IF EXISTS `contratos`;
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
  PRIMARY KEY (`id`),
  KEY `clientes_contratos_fk` (`cliente_id`),
  CONSTRAINT `clientes_contratos_fk` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contratos
-- ----------------------------
INSERT INTO `contratos` VALUES ('1', '001/2015', '1', '2015-03-27 00:00:00', '2', '2015-03-30 00:00:00', '1', null, null, null, 'Alquiler de cajeros automaticos');
INSERT INTO `contratos` VALUES ('2', '002/2015', '1', '2015-03-27 00:00:00', '2', '0000-00-00 00:00:00', '1', null, null, null, 'Alquiler de cajeros automaticos');
INSERT INTO `contratos` VALUES ('3', '003/2015', '1', '2015-03-27 00:00:00', '635', '2015-03-31 16:57:13', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'juan mamani', 'GERENTE EJECUTIVO', 'Alquiler de cajeros automaticos');
INSERT INTO `contratos` VALUES ('4', '004/2015', '1', '2015-03-27 00:00:00', '635', '2015-03-31 16:59:23', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', null, 'GERENTE EJECUTIVO', 'Alquiler de cajeros automaticos');
INSERT INTO `contratos` VALUES ('5', '005/2015', '1', '2015-03-27 00:00:00', '635', '2015-03-31 17:01:06', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', null, 'GERENTE EJECUTIVO', 'Alquiler de cajeros automaticos');
INSERT INTO `contratos` VALUES ('6', '006/2015', '1', '2015-03-27 00:00:00', '635', '2015-03-31 17:01:41', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', null, 'GERENTE EJECUTIVO', 'Alquiler de cajeros automaticos');
INSERT INTO `contratos` VALUES ('7', '007/2015', '2', '2015-03-27 00:00:00', '635', '2015-03-31 17:03:34', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de cajeros automaticos');
INSERT INTO `contratos` VALUES ('8', '010/2015', '1', '2015-03-31 00:00:00', '635', '2015-03-31 17:04:36', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de cajeros automaticos');
INSERT INTO `contratos` VALUES ('9', '011/2015', '2', '2015-03-31 00:00:00', '635', '2015-03-31 17:08:02', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de cajeros automaticos');
INSERT INTO `contratos` VALUES ('10', '012/2015', '2', '2015-03-31 00:00:00', '635', '2015-03-31 17:25:43', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de cajeros automaticos');
INSERT INTO `contratos` VALUES ('11', '012/2015', '4', '2015-04-01 00:00:00', '635', '2015-04-01 09:00:49', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'alquiler de cajero');
INSERT INTO `contratos` VALUES ('12', '013/2015', '4', '2015-04-01 00:00:00', '635', '2015-04-01 17:10:36', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'alquiler de cabinas');
INSERT INTO `contratos` VALUES ('13', '014/2015', '4', '2015-04-01 00:00:00', '635', '2015-04-01 17:19:14', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'espacio publicitario');
INSERT INTO `contratos` VALUES ('14', '014/2015', '4', '2015-04-01 00:00:00', '635', '2015-04-01 17:21:09', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'espacio publicitario');
INSERT INTO `contratos` VALUES ('15', '020/2015', '5', '2015-04-02 00:00:00', '635', '2015-04-02 09:14:25', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler cajero automtico');

-- ----------------------------
-- Table structure for `contratosproductos`
-- ----------------------------
DROP TABLE IF EXISTS `contratosproductos`;
CREATE TABLE `contratosproductos` (
  `id` int(11) NOT NULL,
  `contrato_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `tiempo` varchar(20) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `contratos_contratosproductos_fk` (`contrato_id`),
  KEY `productos_contratosproductos_fk` (`producto_id`),
  CONSTRAINT `contratos_contratosproductos_fk` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productos_contratosproductos_fk` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contratosproductos
-- ----------------------------

-- ----------------------------
-- Table structure for `empresas`
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
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

-- ----------------------------
-- Records of empresas
-- ----------------------------
INSERT INTO `empresas` VALUES ('1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE \"MITELEFERICO\"', 'MI TELEFERICO', null, 'AV. ESTACION CENTRAL TELEFERICO LINEA ROJA NRO. S/N ZONA PURA PURA', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', null, '280048029', '1');

-- ----------------------------
-- Table structure for `estaciones`
-- ----------------------------
DROP TABLE IF EXISTS `estaciones`;
CREATE TABLE `estaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linea_id` int(11) NOT NULL,
  `estacion` varchar(50) NOT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `lineas_estaciones_fk` (`linea_id`),
  CONSTRAINT `lineas_estaciones_fk` FOREIGN KEY (`linea_id`) REFERENCES `lineas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of estaciones
-- ----------------------------
INSERT INTO `estaciones` VALUES ('1', '1', 'ESTACION CENTRAL / TAYPI UTA', '1');
INSERT INTO `estaciones` VALUES ('3', '1', 'CEMENTERIO / AJAYUNI', '1');
INSERT INTO `estaciones` VALUES ('4', '1', '16 DE JULIO / JACHA QHATHU', '1');
INSERT INTO `estaciones` VALUES ('5', '2', 'LIBERTADOR / CHUQUI APU', '1');
INSERT INTO `estaciones` VALUES ('6', '2', 'SOPOCACHI / SUPHU KACHI', '1');
INSERT INTO `estaciones` VALUES ('7', '2', 'BUENOS AIRES / QUTA UMA', '1');
INSERT INTO `estaciones` VALUES ('8', '2', 'CIUDAD SATELITE / QHANA PATA', '1');
INSERT INTO `estaciones` VALUES ('9', '3', 'IRPAVI / IRPAWI', '1');
INSERT INTO `estaciones` VALUES ('10', '3', 'OBRAJES / AYNACHA OBRAJES', '1');
INSERT INTO `estaciones` VALUES ('11', '3', 'ALTO OBRAJES / QUTA UMA', '1');
INSERT INTO `estaciones` VALUES ('12', '3', 'LIBERTADOR / CHUQUI APU', '1');

-- ----------------------------
-- Table structure for `grupos`
-- ----------------------------
DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(100) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grupos
-- ----------------------------
INSERT INTO `grupos` VALUES ('1', 'CAJEROS', 'CAJ', 'CAJEROS', null, '1');
INSERT INTO `grupos` VALUES ('2', 'PUBLICIDAD', 'PUB', 'PUBLICIDADES', null, '1');
INSERT INTO `grupos` VALUES ('3', 'LOCALES', 'LOC', 'LOCALES', null, '1');
INSERT INTO `grupos` VALUES ('4', 'ISLAS COMERCIALES', 'IC', 'ISLAS COMERCIALES', null, '1');
INSERT INTO `grupos` VALUES ('5', 'LOCALES COMERCIALES', 'LC', 'LOCALES COMERCIALES', null, '1');

-- ----------------------------
-- Table structure for `lineas`
-- ----------------------------
DROP TABLE IF EXISTS `lineas`;
CREATE TABLE `lineas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linea` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lineas
-- ----------------------------
INSERT INTO `lineas` VALUES ('1', 'ROJA', '', '1');
INSERT INTO `lineas` VALUES ('2', 'AMARILLO', '', '1');
INSERT INTO `lineas` VALUES ('3', 'VERDE', '', '1');

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
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

-- ----------------------------
-- Records of login
-- ----------------------------

-- ----------------------------
-- Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `controlador` varchar(30) DEFAULT NULL,
  `indexs` int(11) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', 'Inicio', 'Pagina principal', 'dashboard', '1', 'fa fa-users');
INSERT INTO `menus` VALUES ('2', 'Comercializaci&oacute;n', 'Comercialización', 'comercial', '3', 'fa fa-users');
INSERT INTO `menus` VALUES ('3', 'Parametricas', 'Tablas parametricas del sistema', 'parametros', '2', 'fa fa-wrench');
INSERT INTO `menus` VALUES ('4', 'Control de Pagos', 'Seguimiento al control de pagos', 'control', '4', 'fa fa-usd');
INSERT INTO `menus` VALUES ('5', 'Reportes', 'Reportes del sistema', 'reportes', '5', 'fa fa-file-text-o');
INSERT INTO `menus` VALUES ('7', 'Gestión de Conocimiento', 'Hojas de Ruta creados', 'capacitacion', '6', 'gi gi-tags');
INSERT INTO `menus` VALUES ('8', 'Molivilidad de Personal', 'Menu Administrador', 'movilidad', '7', null);
INSERT INTO `menus` VALUES ('9', 'Archivo', 'Archivo', 'archivo', '8', 'gi gi-more_items');
INSERT INTO `menus` VALUES ('10', 'Usuario', 'Bandeja de Salida', 'usuario', '9', null);
INSERT INTO `menus` VALUES ('11', 'Parametrizacion', 'Tablas parametricas del sistema', 'parametricas', '10', 'gi gi-more_items');
INSERT INTO `menus` VALUES ('12', 'Relaci&oacute;n Laboral', 'Relaci&oacute;n Laboral', 'relaborales', '11', 'gi gi-more_items');
INSERT INTO `menus` VALUES ('14', 'Archivo Personal', 'Archivo personal EETC MT', 'presentaciondoc', '12', 'gi gi-more_items');

-- ----------------------------
-- Table structure for `niveles`
-- ----------------------------
DROP TABLE IF EXISTS `niveles`;
CREATE TABLE `niveles` (
  `id` int(11) NOT NULL,
  `nivel` varchar(30) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of niveles
-- ----------------------------
INSERT INTO `niveles` VALUES ('1', 'Administrador', 'Administrador del sistema');
INSERT INTO `niveles` VALUES ('2', 'Asistente', 'Asistente');
INSERT INTO `niveles` VALUES ('3', 'Gerentes', 'Gerentes ejecutivos y gerentes, reportes toma de decisiones');
INSERT INTO `niveles` VALUES ('4', 'Operador', 'Operador');
INSERT INTO `niveles` VALUES ('5', 'Super Administrador', 'Adminstrador del todo el sistema');

-- ----------------------------
-- Table structure for `nivelmenu`
-- ----------------------------
DROP TABLE IF EXISTS `nivelmenu`;
CREATE TABLE `nivelmenu` (
  `id_nivel` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_nivel`,`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nivelmenu
-- ----------------------------
INSERT INTO `nivelmenu` VALUES ('1', '1');
INSERT INTO `nivelmenu` VALUES ('1', '8');
INSERT INTO `nivelmenu` VALUES ('1', '13');
INSERT INTO `nivelmenu` VALUES ('2', '1');
INSERT INTO `nivelmenu` VALUES ('2', '2');
INSERT INTO `nivelmenu` VALUES ('2', '3');
INSERT INTO `nivelmenu` VALUES ('2', '4');
INSERT INTO `nivelmenu` VALUES ('2', '5');
INSERT INTO `nivelmenu` VALUES ('2', '6');
INSERT INTO `nivelmenu` VALUES ('2', '7');
INSERT INTO `nivelmenu` VALUES ('2', '9');
INSERT INTO `nivelmenu` VALUES ('2', '11');
INSERT INTO `nivelmenu` VALUES ('2', '12');
INSERT INTO `nivelmenu` VALUES ('2', '14');
INSERT INTO `nivelmenu` VALUES ('3', '1');
INSERT INTO `nivelmenu` VALUES ('3', '2');
INSERT INTO `nivelmenu` VALUES ('3', '3');
INSERT INTO `nivelmenu` VALUES ('3', '4');
INSERT INTO `nivelmenu` VALUES ('3', '6');
INSERT INTO `nivelmenu` VALUES ('3', '7');
INSERT INTO `nivelmenu` VALUES ('3', '13');
INSERT INTO `nivelmenu` VALUES ('4', '1');
INSERT INTO `nivelmenu` VALUES ('4', '7');
INSERT INTO `nivelmenu` VALUES ('4', '9');
INSERT INTO `nivelmenu` VALUES ('4', '10');
INSERT INTO `nivelmenu` VALUES ('4', '11');
INSERT INTO `nivelmenu` VALUES ('4', '13');
INSERT INTO `nivelmenu` VALUES ('5', '8');
INSERT INTO `nivelmenu` VALUES ('5', '11');
INSERT INTO `nivelmenu` VALUES ('5', '13');
INSERT INTO `nivelmenu` VALUES ('5', '15');
INSERT INTO `nivelmenu` VALUES ('5', '16');
INSERT INTO `nivelmenu` VALUES ('6', '1');
INSERT INTO `nivelmenu` VALUES ('6', '2');
INSERT INTO `nivelmenu` VALUES ('6', '3');
INSERT INTO `nivelmenu` VALUES ('6', '4');
INSERT INTO `nivelmenu` VALUES ('6', '6');
INSERT INTO `nivelmenu` VALUES ('6', '7');
INSERT INTO `nivelmenu` VALUES ('6', '18');
INSERT INTO `nivelmenu` VALUES ('8', '12');

-- ----------------------------
-- Table structure for `productos`
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES ('1', '1', '1', 'cajeros', 'ca', null, '10.00', '80', 'dia', '1', '1', '2', '2015-03-26 00:00:00', '0');
INSERT INTO `productos` VALUES ('2', '2', '6', 'cajeros', 'caxx', 'plan de accion', '12.00', '1', 'Dia', '1', '1', '629', '2015-03-26 18:57:29', '0');
INSERT INTO `productos` VALUES ('3', '2', '1', 'publicidad', 'pu-01', 'publicidad de colinos', '100.00', '1', 'Dia', '1', '1', '629', '2015-03-26 18:59:03', '0');
INSERT INTO `productos` VALUES ('4', '1', '1', 'CAJERO AUTOMATICO', 'CA', 'Cajeros automaticos', '2400.00', '5', 'Mensual', '1', '1', '629', '2015-03-26 18:59:07', '1');
INSERT INTO `productos` VALUES ('5', '1', '3', 'CAJEROS AUTOMATICOS', 'CA', 'Cajeros Automaticos', '2500.00', '5', 'Mensual', '1', '1', '629', '2015-03-26 18:59:09', '1');
INSERT INTO `productos` VALUES ('6', '2', '1', 'asf', 'asdf', 'asdf', '123.00', '1', 'Dia', '1', '1', '629', '2015-03-26 18:59:11', '1');
INSERT INTO `productos` VALUES ('7', '1', '1', 'CABINAS', 'prueba', 'adf', '34.00', '1', 'Dia', '1', '1', '629', '2015-03-26 19:03:10', '1');
INSERT INTO `productos` VALUES ('8', '1', '1', 'CABINAS', 'prueba', 'adf', '34.00', '1', 'Dia', '1', '1', '629', '2015-03-26 19:03:13', '1');
INSERT INTO `productos` VALUES ('9', '1', '1', 'CABINAS', 'prueba', 'adf', '34.00', '1', 'Dia', '1', '1', '629', '2015-03-26 19:03:15', '1');
INSERT INTO `productos` VALUES ('10', '1', '1', 'CABINAS', 'prueba', 'adf', '34.00', '1', 'Dia', '1', '1', '629', '2015-03-26 19:03:18', '1');
INSERT INTO `productos` VALUES ('11', '1', '1', 'CABINAS', 'prueba', 'adf', '34.00', '1', 'Dia', '1', '1', '629', '2015-03-26 19:03:21', '1');
INSERT INTO `productos` VALUES ('12', '1', '1', 'CABINAS', 'prueba', 'adf', '34.00', '1', 'Dia', '1', '1', '629', '2015-03-26 19:03:23', '1');
INSERT INTO `productos` VALUES ('13', '1', '1', 'CABINAS', 'prueba', 'adf', '34.00', '1', 'Dia', '1', '1', '629', '2015-03-26 19:03:27', '1');
INSERT INTO `productos` VALUES ('14', '1', '3', 'asdf', 'asdf', 'asdf', '2.00', '1', 'Hora', '1', '1', '629', '2015-03-26 19:21:05', '1');
INSERT INTO `productos` VALUES ('15', '2', '3', 'adsf', 'asdf', 'asdf', '2.00', '1', 'Hora', '1', '1', '629', '2015-03-26 19:22:20', '1');
INSERT INTO `productos` VALUES ('16', '1', '1', 'dfa', 'asdf', 'asdf', '2.00', '1', 'Hora', '1', '1', '629', '2015-03-26 19:23:35', '1');

-- ----------------------------
-- Table structure for `resoluciones`
-- ----------------------------
DROP TABLE IF EXISTS `resoluciones`;
CREATE TABLE `resoluciones` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'identificador de la resolución ministerial o bi-ministerial.',
  `tipo_resolucion` varchar(200) DEFAULT NULL COMMENT 'tipo de resolución.',
  `numero_res` int(11) DEFAULT NULL COMMENT 'número de resolución.',
  `institucion_sector_id` int(11) DEFAULT NULL COMMENT 'institución del sector que dispone la resolución.',
  `institucion_rectora_id` int(11) DEFAULT NULL COMMENT 'institución recortora que dispone la resolución.',
  `instituciones_otras` varchar(200) DEFAULT NULL,
  `gestion_res` int(11) DEFAULT NULL COMMENT 'gestión de emisión de la resolución.',
  `fecha_emi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'fecha de emisión de la resolución.',
  `fecha_apr` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'fecha de aprobación de la resolución.',
  `fecha_fin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'fecha de finalización de la resolución.',
  `estado` int(11) DEFAULT NULL COMMENT 'estado del registro de la resolución.',
  `baja_logica` int(11) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  `uso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla para el registro de resoluciones.';

-- ----------------------------
-- Records of resoluciones
-- ----------------------------

-- ----------------------------
-- Table structure for `rol`
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
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

-- ----------------------------
-- Records of rol
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'login', 'Usuario');
INSERT INTO `roles` VALUES ('2', 'usuario', 'Usuario común');
INSERT INTO `roles` VALUES ('3', 'jefe', 'Jefe de Oficina(Area, Unidad, Dirección)');
INSERT INTO `roles` VALUES ('4', 'ventanilla', 'Ventanilla');
INSERT INTO `roles` VALUES ('5', 'despacho', 'Despacho Ministerial');
INSERT INTO `roles` VALUES ('6', 'archivero', 'Archivero Central');

-- ----------------------------
-- Table structure for `roles_users`
-- ----------------------------
DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE `roles_users` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_users
-- ----------------------------
INSERT INTO `roles_users` VALUES ('1', '1');
INSERT INTO `roles_users` VALUES ('95', '1');
INSERT INTO `roles_users` VALUES ('96', '1');
INSERT INTO `roles_users` VALUES ('97', '1');
INSERT INTO `roles_users` VALUES ('98', '1');
INSERT INTO `roles_users` VALUES ('100', '1');
INSERT INTO `roles_users` VALUES ('101', '1');
INSERT INTO `roles_users` VALUES ('102', '1');
INSERT INTO `roles_users` VALUES ('103', '1');
INSERT INTO `roles_users` VALUES ('104', '1');
INSERT INTO `roles_users` VALUES ('105', '1');
INSERT INTO `roles_users` VALUES ('106', '1');
INSERT INTO `roles_users` VALUES ('107', '1');
INSERT INTO `roles_users` VALUES ('108', '1');
INSERT INTO `roles_users` VALUES ('109', '1');
INSERT INTO `roles_users` VALUES ('110', '1');
INSERT INTO `roles_users` VALUES ('111', '1');
INSERT INTO `roles_users` VALUES ('112', '1');
INSERT INTO `roles_users` VALUES ('113', '1');
INSERT INTO `roles_users` VALUES ('114', '1');
INSERT INTO `roles_users` VALUES ('115', '1');
INSERT INTO `roles_users` VALUES ('116', '1');
INSERT INTO `roles_users` VALUES ('117', '1');
INSERT INTO `roles_users` VALUES ('118', '1');
INSERT INTO `roles_users` VALUES ('119', '1');
INSERT INTO `roles_users` VALUES ('121', '1');
INSERT INTO `roles_users` VALUES ('122', '1');
INSERT INTO `roles_users` VALUES ('123', '1');
INSERT INTO `roles_users` VALUES ('124', '1');
INSERT INTO `roles_users` VALUES ('133', '1');
INSERT INTO `roles_users` VALUES ('134', '1');
INSERT INTO `roles_users` VALUES ('135', '1');
INSERT INTO `roles_users` VALUES ('136', '1');
INSERT INTO `roles_users` VALUES ('137', '1');
INSERT INTO `roles_users` VALUES ('138', '1');
INSERT INTO `roles_users` VALUES ('139', '1');
INSERT INTO `roles_users` VALUES ('140', '1');
INSERT INTO `roles_users` VALUES ('141', '1');
INSERT INTO `roles_users` VALUES ('142', '1');
INSERT INTO `roles_users` VALUES ('143', '1');
INSERT INTO `roles_users` VALUES ('144', '1');
INSERT INTO `roles_users` VALUES ('145', '1');
INSERT INTO `roles_users` VALUES ('146', '1');
INSERT INTO `roles_users` VALUES ('147', '1');
INSERT INTO `roles_users` VALUES ('148', '1');
INSERT INTO `roles_users` VALUES ('149', '1');
INSERT INTO `roles_users` VALUES ('150', '1');
INSERT INTO `roles_users` VALUES ('151', '1');
INSERT INTO `roles_users` VALUES ('152', '1');
INSERT INTO `roles_users` VALUES ('153', '1');
INSERT INTO `roles_users` VALUES ('154', '1');
INSERT INTO `roles_users` VALUES ('155', '1');
INSERT INTO `roles_users` VALUES ('156', '1');
INSERT INTO `roles_users` VALUES ('157', '1');
INSERT INTO `roles_users` VALUES ('158', '1');
INSERT INTO `roles_users` VALUES ('159', '1');
INSERT INTO `roles_users` VALUES ('160', '1');
INSERT INTO `roles_users` VALUES ('161', '1');
INSERT INTO `roles_users` VALUES ('162', '1');
INSERT INTO `roles_users` VALUES ('163', '1');
INSERT INTO `roles_users` VALUES ('164', '1');
INSERT INTO `roles_users` VALUES ('165', '1');
INSERT INTO `roles_users` VALUES ('166', '1');
INSERT INTO `roles_users` VALUES ('167', '1');
INSERT INTO `roles_users` VALUES ('168', '1');
INSERT INTO `roles_users` VALUES ('169', '1');
INSERT INTO `roles_users` VALUES ('170', '1');
INSERT INTO `roles_users` VALUES ('171', '1');
INSERT INTO `roles_users` VALUES ('172', '1');
INSERT INTO `roles_users` VALUES ('173', '1');
INSERT INTO `roles_users` VALUES ('174', '1');
INSERT INTO `roles_users` VALUES ('175', '1');
INSERT INTO `roles_users` VALUES ('176', '1');
INSERT INTO `roles_users` VALUES ('177', '1');
INSERT INTO `roles_users` VALUES ('178', '1');
INSERT INTO `roles_users` VALUES ('179', '1');
INSERT INTO `roles_users` VALUES ('180', '1');
INSERT INTO `roles_users` VALUES ('181', '1');
INSERT INTO `roles_users` VALUES ('182', '1');
INSERT INTO `roles_users` VALUES ('183', '1');
INSERT INTO `roles_users` VALUES ('184', '1');
INSERT INTO `roles_users` VALUES ('185', '1');
INSERT INTO `roles_users` VALUES ('186', '1');
INSERT INTO `roles_users` VALUES ('187', '1');
INSERT INTO `roles_users` VALUES ('188', '1');
INSERT INTO `roles_users` VALUES ('189', '1');
INSERT INTO `roles_users` VALUES ('190', '1');
INSERT INTO `roles_users` VALUES ('191', '1');
INSERT INTO `roles_users` VALUES ('192', '1');
INSERT INTO `roles_users` VALUES ('193', '1');
INSERT INTO `roles_users` VALUES ('194', '1');
INSERT INTO `roles_users` VALUES ('195', '1');
INSERT INTO `roles_users` VALUES ('196', '1');
INSERT INTO `roles_users` VALUES ('197', '1');
INSERT INTO `roles_users` VALUES ('198', '1');
INSERT INTO `roles_users` VALUES ('199', '1');
INSERT INTO `roles_users` VALUES ('200', '1');
INSERT INTO `roles_users` VALUES ('201', '1');
INSERT INTO `roles_users` VALUES ('202', '1');
INSERT INTO `roles_users` VALUES ('203', '1');
INSERT INTO `roles_users` VALUES ('204', '1');
INSERT INTO `roles_users` VALUES ('205', '1');
INSERT INTO `roles_users` VALUES ('206', '1');
INSERT INTO `roles_users` VALUES ('207', '1');
INSERT INTO `roles_users` VALUES ('208', '1');
INSERT INTO `roles_users` VALUES ('209', '1');
INSERT INTO `roles_users` VALUES ('210', '1');
INSERT INTO `roles_users` VALUES ('211', '1');
INSERT INTO `roles_users` VALUES ('212', '1');
INSERT INTO `roles_users` VALUES ('213', '1');
INSERT INTO `roles_users` VALUES ('214', '1');
INSERT INTO `roles_users` VALUES ('215', '1');
INSERT INTO `roles_users` VALUES ('216', '1');
INSERT INTO `roles_users` VALUES ('217', '1');
INSERT INTO `roles_users` VALUES ('218', '1');
INSERT INTO `roles_users` VALUES ('219', '1');
INSERT INTO `roles_users` VALUES ('220', '1');
INSERT INTO `roles_users` VALUES ('221', '1');
INSERT INTO `roles_users` VALUES ('222', '1');
INSERT INTO `roles_users` VALUES ('223', '1');
INSERT INTO `roles_users` VALUES ('224', '1');
INSERT INTO `roles_users` VALUES ('225', '1');
INSERT INTO `roles_users` VALUES ('226', '1');
INSERT INTO `roles_users` VALUES ('227', '1');
INSERT INTO `roles_users` VALUES ('228', '1');
INSERT INTO `roles_users` VALUES ('229', '1');
INSERT INTO `roles_users` VALUES ('230', '1');
INSERT INTO `roles_users` VALUES ('231', '1');
INSERT INTO `roles_users` VALUES ('232', '1');
INSERT INTO `roles_users` VALUES ('234', '1');
INSERT INTO `roles_users` VALUES ('235', '1');
INSERT INTO `roles_users` VALUES ('236', '1');
INSERT INTO `roles_users` VALUES ('237', '1');
INSERT INTO `roles_users` VALUES ('238', '1');
INSERT INTO `roles_users` VALUES ('239', '1');
INSERT INTO `roles_users` VALUES ('240', '1');
INSERT INTO `roles_users` VALUES ('241', '1');
INSERT INTO `roles_users` VALUES ('242', '1');
INSERT INTO `roles_users` VALUES ('243', '1');
INSERT INTO `roles_users` VALUES ('244', '1');
INSERT INTO `roles_users` VALUES ('245', '1');
INSERT INTO `roles_users` VALUES ('246', '1');
INSERT INTO `roles_users` VALUES ('247', '1');
INSERT INTO `roles_users` VALUES ('248', '1');
INSERT INTO `roles_users` VALUES ('249', '1');
INSERT INTO `roles_users` VALUES ('250', '1');
INSERT INTO `roles_users` VALUES ('251', '1');
INSERT INTO `roles_users` VALUES ('252', '1');
INSERT INTO `roles_users` VALUES ('253', '1');
INSERT INTO `roles_users` VALUES ('254', '1');
INSERT INTO `roles_users` VALUES ('255', '1');
INSERT INTO `roles_users` VALUES ('256', '1');
INSERT INTO `roles_users` VALUES ('260', '1');
INSERT INTO `roles_users` VALUES ('261', '1');
INSERT INTO `roles_users` VALUES ('262', '1');
INSERT INTO `roles_users` VALUES ('263', '1');
INSERT INTO `roles_users` VALUES ('264', '1');
INSERT INTO `roles_users` VALUES ('265', '1');
INSERT INTO `roles_users` VALUES ('266', '1');
INSERT INTO `roles_users` VALUES ('267', '1');
INSERT INTO `roles_users` VALUES ('268', '1');
INSERT INTO `roles_users` VALUES ('269', '1');
INSERT INTO `roles_users` VALUES ('270', '1');
INSERT INTO `roles_users` VALUES ('271', '1');
INSERT INTO `roles_users` VALUES ('272', '1');
INSERT INTO `roles_users` VALUES ('273', '1');
INSERT INTO `roles_users` VALUES ('274', '1');
INSERT INTO `roles_users` VALUES ('275', '1');
INSERT INTO `roles_users` VALUES ('276', '1');
INSERT INTO `roles_users` VALUES ('277', '1');
INSERT INTO `roles_users` VALUES ('278', '1');
INSERT INTO `roles_users` VALUES ('279', '1');
INSERT INTO `roles_users` VALUES ('280', '1');
INSERT INTO `roles_users` VALUES ('281', '1');
INSERT INTO `roles_users` VALUES ('282', '1');
INSERT INTO `roles_users` VALUES ('283', '1');
INSERT INTO `roles_users` VALUES ('284', '1');
INSERT INTO `roles_users` VALUES ('285', '1');
INSERT INTO `roles_users` VALUES ('286', '1');
INSERT INTO `roles_users` VALUES ('287', '1');
INSERT INTO `roles_users` VALUES ('288', '1');
INSERT INTO `roles_users` VALUES ('289', '1');
INSERT INTO `roles_users` VALUES ('290', '1');
INSERT INTO `roles_users` VALUES ('291', '1');
INSERT INTO `roles_users` VALUES ('292', '1');
INSERT INTO `roles_users` VALUES ('293', '1');
INSERT INTO `roles_users` VALUES ('294', '1');
INSERT INTO `roles_users` VALUES ('295', '1');
INSERT INTO `roles_users` VALUES ('296', '1');
INSERT INTO `roles_users` VALUES ('297', '1');
INSERT INTO `roles_users` VALUES ('298', '1');
INSERT INTO `roles_users` VALUES ('299', '1');
INSERT INTO `roles_users` VALUES ('300', '1');
INSERT INTO `roles_users` VALUES ('301', '1');
INSERT INTO `roles_users` VALUES ('302', '1');
INSERT INTO `roles_users` VALUES ('303', '1');
INSERT INTO `roles_users` VALUES ('304', '1');
INSERT INTO `roles_users` VALUES ('305', '1');
INSERT INTO `roles_users` VALUES ('306', '1');
INSERT INTO `roles_users` VALUES ('307', '1');
INSERT INTO `roles_users` VALUES ('308', '1');
INSERT INTO `roles_users` VALUES ('309', '1');
INSERT INTO `roles_users` VALUES ('310', '1');
INSERT INTO `roles_users` VALUES ('311', '1');
INSERT INTO `roles_users` VALUES ('312', '1');
INSERT INTO `roles_users` VALUES ('313', '1');
INSERT INTO `roles_users` VALUES ('314', '1');
INSERT INTO `roles_users` VALUES ('315', '1');
INSERT INTO `roles_users` VALUES ('316', '1');
INSERT INTO `roles_users` VALUES ('317', '1');
INSERT INTO `roles_users` VALUES ('321', '1');
INSERT INTO `roles_users` VALUES ('324', '1');
INSERT INTO `roles_users` VALUES ('325', '1');
INSERT INTO `roles_users` VALUES ('326', '1');
INSERT INTO `roles_users` VALUES ('327', '1');
INSERT INTO `roles_users` VALUES ('328', '1');
INSERT INTO `roles_users` VALUES ('329', '1');
INSERT INTO `roles_users` VALUES ('330', '1');
INSERT INTO `roles_users` VALUES ('331', '1');
INSERT INTO `roles_users` VALUES ('332', '1');
INSERT INTO `roles_users` VALUES ('333', '1');
INSERT INTO `roles_users` VALUES ('334', '1');
INSERT INTO `roles_users` VALUES ('335', '1');
INSERT INTO `roles_users` VALUES ('336', '1');
INSERT INTO `roles_users` VALUES ('337', '1');
INSERT INTO `roles_users` VALUES ('338', '1');
INSERT INTO `roles_users` VALUES ('339', '1');
INSERT INTO `roles_users` VALUES ('340', '1');
INSERT INTO `roles_users` VALUES ('341', '1');
INSERT INTO `roles_users` VALUES ('342', '1');
INSERT INTO `roles_users` VALUES ('343', '1');
INSERT INTO `roles_users` VALUES ('344', '1');
INSERT INTO `roles_users` VALUES ('345', '1');
INSERT INTO `roles_users` VALUES ('346', '1');
INSERT INTO `roles_users` VALUES ('347', '1');
INSERT INTO `roles_users` VALUES ('348', '1');
INSERT INTO `roles_users` VALUES ('349', '1');
INSERT INTO `roles_users` VALUES ('351', '1');
INSERT INTO `roles_users` VALUES ('352', '1');
INSERT INTO `roles_users` VALUES ('353', '1');
INSERT INTO `roles_users` VALUES ('354', '1');
INSERT INTO `roles_users` VALUES ('355', '1');
INSERT INTO `roles_users` VALUES ('356', '1');
INSERT INTO `roles_users` VALUES ('357', '1');
INSERT INTO `roles_users` VALUES ('358', '1');
INSERT INTO `roles_users` VALUES ('359', '1');
INSERT INTO `roles_users` VALUES ('360', '1');
INSERT INTO `roles_users` VALUES ('361', '1');
INSERT INTO `roles_users` VALUES ('362', '1');
INSERT INTO `roles_users` VALUES ('363', '1');
INSERT INTO `roles_users` VALUES ('364', '1');
INSERT INTO `roles_users` VALUES ('365', '1');
INSERT INTO `roles_users` VALUES ('366', '1');
INSERT INTO `roles_users` VALUES ('367', '1');
INSERT INTO `roles_users` VALUES ('368', '1');
INSERT INTO `roles_users` VALUES ('369', '1');
INSERT INTO `roles_users` VALUES ('370', '1');
INSERT INTO `roles_users` VALUES ('371', '1');
INSERT INTO `roles_users` VALUES ('372', '1');
INSERT INTO `roles_users` VALUES ('373', '1');
INSERT INTO `roles_users` VALUES ('374', '1');
INSERT INTO `roles_users` VALUES ('375', '1');
INSERT INTO `roles_users` VALUES ('376', '1');
INSERT INTO `roles_users` VALUES ('377', '1');
INSERT INTO `roles_users` VALUES ('378', '1');
INSERT INTO `roles_users` VALUES ('379', '1');
INSERT INTO `roles_users` VALUES ('380', '1');
INSERT INTO `roles_users` VALUES ('381', '1');
INSERT INTO `roles_users` VALUES ('382', '1');
INSERT INTO `roles_users` VALUES ('383', '1');
INSERT INTO `roles_users` VALUES ('384', '1');
INSERT INTO `roles_users` VALUES ('385', '1');
INSERT INTO `roles_users` VALUES ('386', '1');
INSERT INTO `roles_users` VALUES ('387', '1');
INSERT INTO `roles_users` VALUES ('388', '1');
INSERT INTO `roles_users` VALUES ('389', '1');
INSERT INTO `roles_users` VALUES ('390', '1');
INSERT INTO `roles_users` VALUES ('391', '1');
INSERT INTO `roles_users` VALUES ('392', '1');
INSERT INTO `roles_users` VALUES ('393', '1');
INSERT INTO `roles_users` VALUES ('394', '1');
INSERT INTO `roles_users` VALUES ('395', '1');
INSERT INTO `roles_users` VALUES ('396', '1');
INSERT INTO `roles_users` VALUES ('397', '1');
INSERT INTO `roles_users` VALUES ('398', '1');
INSERT INTO `roles_users` VALUES ('399', '1');
INSERT INTO `roles_users` VALUES ('400', '1');
INSERT INTO `roles_users` VALUES ('401', '1');
INSERT INTO `roles_users` VALUES ('405', '1');
INSERT INTO `roles_users` VALUES ('406', '1');
INSERT INTO `roles_users` VALUES ('407', '1');
INSERT INTO `roles_users` VALUES ('408', '1');
INSERT INTO `roles_users` VALUES ('409', '1');
INSERT INTO `roles_users` VALUES ('410', '1');
INSERT INTO `roles_users` VALUES ('411', '1');
INSERT INTO `roles_users` VALUES ('413', '1');
INSERT INTO `roles_users` VALUES ('414', '1');
INSERT INTO `roles_users` VALUES ('415', '1');
INSERT INTO `roles_users` VALUES ('416', '1');
INSERT INTO `roles_users` VALUES ('417', '1');
INSERT INTO `roles_users` VALUES ('418', '1');
INSERT INTO `roles_users` VALUES ('419', '1');
INSERT INTO `roles_users` VALUES ('420', '1');
INSERT INTO `roles_users` VALUES ('421', '1');
INSERT INTO `roles_users` VALUES ('422', '1');
INSERT INTO `roles_users` VALUES ('423', '1');
INSERT INTO `roles_users` VALUES ('424', '1');
INSERT INTO `roles_users` VALUES ('425', '1');
INSERT INTO `roles_users` VALUES ('426', '1');
INSERT INTO `roles_users` VALUES ('427', '1');
INSERT INTO `roles_users` VALUES ('428', '1');
INSERT INTO `roles_users` VALUES ('429', '1');
INSERT INTO `roles_users` VALUES ('430', '1');
INSERT INTO `roles_users` VALUES ('431', '1');
INSERT INTO `roles_users` VALUES ('432', '1');
INSERT INTO `roles_users` VALUES ('433', '1');
INSERT INTO `roles_users` VALUES ('434', '1');
INSERT INTO `roles_users` VALUES ('435', '1');
INSERT INTO `roles_users` VALUES ('436', '1');
INSERT INTO `roles_users` VALUES ('437', '1');
INSERT INTO `roles_users` VALUES ('438', '1');
INSERT INTO `roles_users` VALUES ('439', '1');
INSERT INTO `roles_users` VALUES ('440', '1');
INSERT INTO `roles_users` VALUES ('441', '1');
INSERT INTO `roles_users` VALUES ('442', '1');
INSERT INTO `roles_users` VALUES ('443', '1');
INSERT INTO `roles_users` VALUES ('444', '1');
INSERT INTO `roles_users` VALUES ('445', '1');
INSERT INTO `roles_users` VALUES ('446', '1');
INSERT INTO `roles_users` VALUES ('447', '1');
INSERT INTO `roles_users` VALUES ('448', '1');
INSERT INTO `roles_users` VALUES ('449', '1');
INSERT INTO `roles_users` VALUES ('450', '1');
INSERT INTO `roles_users` VALUES ('451', '1');
INSERT INTO `roles_users` VALUES ('452', '1');
INSERT INTO `roles_users` VALUES ('453', '1');
INSERT INTO `roles_users` VALUES ('454', '1');
INSERT INTO `roles_users` VALUES ('455', '1');
INSERT INTO `roles_users` VALUES ('456', '1');
INSERT INTO `roles_users` VALUES ('457', '1');
INSERT INTO `roles_users` VALUES ('459', '1');
INSERT INTO `roles_users` VALUES ('460', '1');
INSERT INTO `roles_users` VALUES ('461', '1');
INSERT INTO `roles_users` VALUES ('462', '1');
INSERT INTO `roles_users` VALUES ('463', '1');
INSERT INTO `roles_users` VALUES ('464', '1');
INSERT INTO `roles_users` VALUES ('465', '1');
INSERT INTO `roles_users` VALUES ('466', '1');
INSERT INTO `roles_users` VALUES ('467', '1');
INSERT INTO `roles_users` VALUES ('468', '1');
INSERT INTO `roles_users` VALUES ('469', '1');
INSERT INTO `roles_users` VALUES ('470', '1');
INSERT INTO `roles_users` VALUES ('471', '1');
INSERT INTO `roles_users` VALUES ('472', '1');
INSERT INTO `roles_users` VALUES ('473', '1');
INSERT INTO `roles_users` VALUES ('474', '1');
INSERT INTO `roles_users` VALUES ('475', '1');
INSERT INTO `roles_users` VALUES ('476', '1');
INSERT INTO `roles_users` VALUES ('477', '1');
INSERT INTO `roles_users` VALUES ('478', '1');
INSERT INTO `roles_users` VALUES ('479', '1');
INSERT INTO `roles_users` VALUES ('480', '1');
INSERT INTO `roles_users` VALUES ('482', '1');
INSERT INTO `roles_users` VALUES ('483', '1');
INSERT INTO `roles_users` VALUES ('484', '1');
INSERT INTO `roles_users` VALUES ('485', '1');
INSERT INTO `roles_users` VALUES ('486', '1');
INSERT INTO `roles_users` VALUES ('487', '1');
INSERT INTO `roles_users` VALUES ('488', '1');
INSERT INTO `roles_users` VALUES ('489', '1');
INSERT INTO `roles_users` VALUES ('490', '1');
INSERT INTO `roles_users` VALUES ('491', '1');
INSERT INTO `roles_users` VALUES ('492', '1');
INSERT INTO `roles_users` VALUES ('493', '1');
INSERT INTO `roles_users` VALUES ('494', '1');
INSERT INTO `roles_users` VALUES ('495', '1');
INSERT INTO `roles_users` VALUES ('496', '1');
INSERT INTO `roles_users` VALUES ('497', '1');
INSERT INTO `roles_users` VALUES ('498', '1');
INSERT INTO `roles_users` VALUES ('499', '1');
INSERT INTO `roles_users` VALUES ('500', '1');
INSERT INTO `roles_users` VALUES ('501', '1');
INSERT INTO `roles_users` VALUES ('502', '1');
INSERT INTO `roles_users` VALUES ('503', '1');
INSERT INTO `roles_users` VALUES ('504', '1');
INSERT INTO `roles_users` VALUES ('505', '1');
INSERT INTO `roles_users` VALUES ('506', '1');
INSERT INTO `roles_users` VALUES ('507', '1');
INSERT INTO `roles_users` VALUES ('508', '1');
INSERT INTO `roles_users` VALUES ('509', '1');
INSERT INTO `roles_users` VALUES ('510', '1');
INSERT INTO `roles_users` VALUES ('512', '1');
INSERT INTO `roles_users` VALUES ('513', '1');
INSERT INTO `roles_users` VALUES ('514', '1');
INSERT INTO `roles_users` VALUES ('515', '1');
INSERT INTO `roles_users` VALUES ('516', '1');
INSERT INTO `roles_users` VALUES ('517', '1');
INSERT INTO `roles_users` VALUES ('518', '1');
INSERT INTO `roles_users` VALUES ('519', '1');
INSERT INTO `roles_users` VALUES ('520', '1');
INSERT INTO `roles_users` VALUES ('521', '1');
INSERT INTO `roles_users` VALUES ('522', '1');
INSERT INTO `roles_users` VALUES ('523', '1');
INSERT INTO `roles_users` VALUES ('526', '1');
INSERT INTO `roles_users` VALUES ('527', '1');
INSERT INTO `roles_users` VALUES ('528', '1');
INSERT INTO `roles_users` VALUES ('529', '1');
INSERT INTO `roles_users` VALUES ('530', '1');
INSERT INTO `roles_users` VALUES ('531', '1');
INSERT INTO `roles_users` VALUES ('532', '1');
INSERT INTO `roles_users` VALUES ('533', '1');
INSERT INTO `roles_users` VALUES ('534', '1');
INSERT INTO `roles_users` VALUES ('535', '1');
INSERT INTO `roles_users` VALUES ('536', '1');
INSERT INTO `roles_users` VALUES ('537', '1');
INSERT INTO `roles_users` VALUES ('538', '1');
INSERT INTO `roles_users` VALUES ('539', '1');
INSERT INTO `roles_users` VALUES ('540', '1');
INSERT INTO `roles_users` VALUES ('541', '1');
INSERT INTO `roles_users` VALUES ('542', '1');
INSERT INTO `roles_users` VALUES ('543', '1');
INSERT INTO `roles_users` VALUES ('544', '1');
INSERT INTO `roles_users` VALUES ('545', '1');
INSERT INTO `roles_users` VALUES ('546', '1');
INSERT INTO `roles_users` VALUES ('547', '1');
INSERT INTO `roles_users` VALUES ('548', '1');
INSERT INTO `roles_users` VALUES ('549', '1');
INSERT INTO `roles_users` VALUES ('550', '1');
INSERT INTO `roles_users` VALUES ('551', '1');
INSERT INTO `roles_users` VALUES ('552', '1');
INSERT INTO `roles_users` VALUES ('553', '1');
INSERT INTO `roles_users` VALUES ('554', '1');
INSERT INTO `roles_users` VALUES ('556', '1');
INSERT INTO `roles_users` VALUES ('557', '1');
INSERT INTO `roles_users` VALUES ('558', '1');
INSERT INTO `roles_users` VALUES ('559', '1');
INSERT INTO `roles_users` VALUES ('560', '1');
INSERT INTO `roles_users` VALUES ('561', '1');
INSERT INTO `roles_users` VALUES ('562', '1');
INSERT INTO `roles_users` VALUES ('563', '1');
INSERT INTO `roles_users` VALUES ('564', '1');
INSERT INTO `roles_users` VALUES ('565', '1');
INSERT INTO `roles_users` VALUES ('566', '1');
INSERT INTO `roles_users` VALUES ('567', '1');
INSERT INTO `roles_users` VALUES ('568', '1');
INSERT INTO `roles_users` VALUES ('569', '1');
INSERT INTO `roles_users` VALUES ('570', '1');
INSERT INTO `roles_users` VALUES ('571', '1');
INSERT INTO `roles_users` VALUES ('572', '1');
INSERT INTO `roles_users` VALUES ('573', '1');
INSERT INTO `roles_users` VALUES ('574', '1');
INSERT INTO `roles_users` VALUES ('575', '1');
INSERT INTO `roles_users` VALUES ('576', '1');
INSERT INTO `roles_users` VALUES ('577', '1');
INSERT INTO `roles_users` VALUES ('578', '1');
INSERT INTO `roles_users` VALUES ('579', '1');
INSERT INTO `roles_users` VALUES ('580', '1');
INSERT INTO `roles_users` VALUES ('581', '1');
INSERT INTO `roles_users` VALUES ('582', '1');
INSERT INTO `roles_users` VALUES ('583', '1');
INSERT INTO `roles_users` VALUES ('584', '1');
INSERT INTO `roles_users` VALUES ('585', '1');
INSERT INTO `roles_users` VALUES ('586', '1');
INSERT INTO `roles_users` VALUES ('587', '1');
INSERT INTO `roles_users` VALUES ('588', '1');
INSERT INTO `roles_users` VALUES ('589', '1');
INSERT INTO `roles_users` VALUES ('590', '1');
INSERT INTO `roles_users` VALUES ('591', '1');
INSERT INTO `roles_users` VALUES ('592', '1');
INSERT INTO `roles_users` VALUES ('593', '1');
INSERT INTO `roles_users` VALUES ('594', '1');
INSERT INTO `roles_users` VALUES ('595', '1');
INSERT INTO `roles_users` VALUES ('596', '1');
INSERT INTO `roles_users` VALUES ('597', '1');
INSERT INTO `roles_users` VALUES ('598', '1');
INSERT INTO `roles_users` VALUES ('599', '1');
INSERT INTO `roles_users` VALUES ('600', '1');
INSERT INTO `roles_users` VALUES ('601', '1');
INSERT INTO `roles_users` VALUES ('602', '1');
INSERT INTO `roles_users` VALUES ('603', '1');
INSERT INTO `roles_users` VALUES ('604', '1');
INSERT INTO `roles_users` VALUES ('605', '1');
INSERT INTO `roles_users` VALUES ('606', '1');
INSERT INTO `roles_users` VALUES ('607', '1');
INSERT INTO `roles_users` VALUES ('608', '1');
INSERT INTO `roles_users` VALUES ('609', '1');
INSERT INTO `roles_users` VALUES ('610', '1');
INSERT INTO `roles_users` VALUES ('611', '1');
INSERT INTO `roles_users` VALUES ('612', '1');
INSERT INTO `roles_users` VALUES ('613', '1');
INSERT INTO `roles_users` VALUES ('614', '1');
INSERT INTO `roles_users` VALUES ('615', '1');
INSERT INTO `roles_users` VALUES ('616', '1');
INSERT INTO `roles_users` VALUES ('617', '1');
INSERT INTO `roles_users` VALUES ('618', '1');
INSERT INTO `roles_users` VALUES ('619', '1');
INSERT INTO `roles_users` VALUES ('620', '1');
INSERT INTO `roles_users` VALUES ('621', '1');
INSERT INTO `roles_users` VALUES ('622', '1');
INSERT INTO `roles_users` VALUES ('623', '1');
INSERT INTO `roles_users` VALUES ('624', '1');
INSERT INTO `roles_users` VALUES ('625', '1');
INSERT INTO `roles_users` VALUES ('626', '1');
INSERT INTO `roles_users` VALUES ('627', '1');
INSERT INTO `roles_users` VALUES ('628', '1');
INSERT INTO `roles_users` VALUES ('629', '1');
INSERT INTO `roles_users` VALUES ('630', '1');
INSERT INTO `roles_users` VALUES ('631', '1');
INSERT INTO `roles_users` VALUES ('632', '1');
INSERT INTO `roles_users` VALUES ('633', '1');
INSERT INTO `roles_users` VALUES ('634', '1');
INSERT INTO `roles_users` VALUES ('635', '1');
INSERT INTO `roles_users` VALUES ('636', '1');
INSERT INTO `roles_users` VALUES ('637', '1');
INSERT INTO `roles_users` VALUES ('638', '1');
INSERT INTO `roles_users` VALUES ('639', '1');
INSERT INTO `roles_users` VALUES ('640', '1');
INSERT INTO `roles_users` VALUES ('641', '1');
INSERT INTO `roles_users` VALUES ('642', '1');
INSERT INTO `roles_users` VALUES ('643', '1');
INSERT INTO `roles_users` VALUES ('644', '1');
INSERT INTO `roles_users` VALUES ('645', '1');
INSERT INTO `roles_users` VALUES ('646', '1');
INSERT INTO `roles_users` VALUES ('647', '1');
INSERT INTO `roles_users` VALUES ('648', '1');
INSERT INTO `roles_users` VALUES ('649', '1');
INSERT INTO `roles_users` VALUES ('650', '1');
INSERT INTO `roles_users` VALUES ('651', '1');
INSERT INTO `roles_users` VALUES ('652', '1');
INSERT INTO `roles_users` VALUES ('653', '1');
INSERT INTO `roles_users` VALUES ('654', '1');
INSERT INTO `roles_users` VALUES ('655', '1');
INSERT INTO `roles_users` VALUES ('656', '1');
INSERT INTO `roles_users` VALUES ('657', '1');
INSERT INTO `roles_users` VALUES ('658', '1');
INSERT INTO `roles_users` VALUES ('659', '1');
INSERT INTO `roles_users` VALUES ('660', '1');
INSERT INTO `roles_users` VALUES ('661', '1');
INSERT INTO `roles_users` VALUES ('662', '1');
INSERT INTO `roles_users` VALUES ('663', '1');
INSERT INTO `roles_users` VALUES ('664', '1');
INSERT INTO `roles_users` VALUES ('665', '1');
INSERT INTO `roles_users` VALUES ('666', '1');
INSERT INTO `roles_users` VALUES ('667', '1');
INSERT INTO `roles_users` VALUES ('668', '1');
INSERT INTO `roles_users` VALUES ('669', '1');
INSERT INTO `roles_users` VALUES ('670', '1');
INSERT INTO `roles_users` VALUES ('671', '1');
INSERT INTO `roles_users` VALUES ('672', '1');
INSERT INTO `roles_users` VALUES ('673', '1');
INSERT INTO `roles_users` VALUES ('674', '1');
INSERT INTO `roles_users` VALUES ('675', '1');
INSERT INTO `roles_users` VALUES ('676', '1');
INSERT INTO `roles_users` VALUES ('677', '1');
INSERT INTO `roles_users` VALUES ('678', '1');
INSERT INTO `roles_users` VALUES ('679', '1');
INSERT INTO `roles_users` VALUES ('680', '1');
INSERT INTO `roles_users` VALUES ('681', '1');
INSERT INTO `roles_users` VALUES ('682', '1');
INSERT INTO `roles_users` VALUES ('683', '1');
INSERT INTO `roles_users` VALUES ('684', '1');
INSERT INTO `roles_users` VALUES ('685', '1');
INSERT INTO `roles_users` VALUES ('686', '1');
INSERT INTO `roles_users` VALUES ('687', '1');
INSERT INTO `roles_users` VALUES ('688', '1');
INSERT INTO `roles_users` VALUES ('689', '1');
INSERT INTO `roles_users` VALUES ('690', '1');
INSERT INTO `roles_users` VALUES ('691', '1');
INSERT INTO `roles_users` VALUES ('692', '1');
INSERT INTO `roles_users` VALUES ('693', '1');
INSERT INTO `roles_users` VALUES ('694', '1');
INSERT INTO `roles_users` VALUES ('695', '1');
INSERT INTO `roles_users` VALUES ('696', '1');
INSERT INTO `roles_users` VALUES ('697', '1');
INSERT INTO `roles_users` VALUES ('698', '1');
INSERT INTO `roles_users` VALUES ('699', '1');
INSERT INTO `roles_users` VALUES ('700', '1');
INSERT INTO `roles_users` VALUES ('701', '1');
INSERT INTO `roles_users` VALUES ('702', '1');
INSERT INTO `roles_users` VALUES ('703', '1');
INSERT INTO `roles_users` VALUES ('704', '1');
INSERT INTO `roles_users` VALUES ('705', '1');
INSERT INTO `roles_users` VALUES ('706', '1');
INSERT INTO `roles_users` VALUES ('707', '1');
INSERT INTO `roles_users` VALUES ('708', '1');
INSERT INTO `roles_users` VALUES ('709', '1');
INSERT INTO `roles_users` VALUES ('710', '1');
INSERT INTO `roles_users` VALUES ('711', '1');
INSERT INTO `roles_users` VALUES ('712', '1');
INSERT INTO `roles_users` VALUES ('713', '1');
INSERT INTO `roles_users` VALUES ('714', '1');
INSERT INTO `roles_users` VALUES ('715', '1');
INSERT INTO `roles_users` VALUES ('716', '1');
INSERT INTO `roles_users` VALUES ('717', '1');
INSERT INTO `roles_users` VALUES ('718', '1');
INSERT INTO `roles_users` VALUES ('719', '1');
INSERT INTO `roles_users` VALUES ('720', '1');
INSERT INTO `roles_users` VALUES ('721', '1');
INSERT INTO `roles_users` VALUES ('722', '1');
INSERT INTO `roles_users` VALUES ('723', '1');
INSERT INTO `roles_users` VALUES ('724', '1');
INSERT INTO `roles_users` VALUES ('725', '1');
INSERT INTO `roles_users` VALUES ('726', '1');
INSERT INTO `roles_users` VALUES ('727', '1');
INSERT INTO `roles_users` VALUES ('728', '1');
INSERT INTO `roles_users` VALUES ('729', '1');
INSERT INTO `roles_users` VALUES ('730', '1');
INSERT INTO `roles_users` VALUES ('731', '1');
INSERT INTO `roles_users` VALUES ('732', '1');
INSERT INTO `roles_users` VALUES ('733', '1');
INSERT INTO `roles_users` VALUES ('734', '1');
INSERT INTO `roles_users` VALUES ('735', '1');
INSERT INTO `roles_users` VALUES ('736', '1');
INSERT INTO `roles_users` VALUES ('737', '1');
INSERT INTO `roles_users` VALUES ('738', '1');
INSERT INTO `roles_users` VALUES ('739', '1');
INSERT INTO `roles_users` VALUES ('740', '1');
INSERT INTO `roles_users` VALUES ('741', '1');
INSERT INTO `roles_users` VALUES ('742', '1');
INSERT INTO `roles_users` VALUES ('743', '1');
INSERT INTO `roles_users` VALUES ('744', '1');
INSERT INTO `roles_users` VALUES ('745', '1');
INSERT INTO `roles_users` VALUES ('746', '1');
INSERT INTO `roles_users` VALUES ('747', '1');

-- ----------------------------
-- Table structure for `submenus`
-- ----------------------------
DROP TABLE IF EXISTS `submenus`;
CREATE TABLE `submenus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) DEFAULT NULL,
  `submenu` varchar(30) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `accion` varchar(30) DEFAULT NULL,
  `habilitado` int(11) DEFAULT NULL,
  `id_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of submenus
-- ----------------------------
INSERT INTO `submenus` VALUES ('1', '2', 'Lista de Productos', 'Lista de productos', '../productos', '1', '0');
INSERT INTO `submenus` VALUES ('2', '2', 'Lista de Clientes', 'Listado de clientes', '../clientes', '1', '0');
INSERT INTO `submenus` VALUES ('5', '2', 'Contratos', 'Listado de contratos realizados', '../contratos', '1', '0');
INSERT INTO `submenus` VALUES ('44', '11', 'Normativas', 'PParametrizacion de normativas', '../normativas', '0', '0');
INSERT INTO `submenus` VALUES ('45', '5', 'Reporte 1', 'permite la creación de nuevos tipos de documentos', '../reporte', '1', '0');
INSERT INTO `submenus` VALUES ('46', '11', 'Horarios Laborales', 'Gesti&oacute;n de Horarios Laborales', '../horarioslaborales', '0', '0');
INSERT INTO `submenus` VALUES ('47', '11', 'Tolerancias de Ingreso', 'Gesti&oacute;n de Tolerancias de Ingreso', '../tolerancias', '0', '0');
INSERT INTO `submenus` VALUES ('48', '17', 'Busqueda Avanzada', 'Busqueda Avanzada', 'advanced', '0', null);
INSERT INTO `submenus` VALUES ('49', '13', 'Organigrama', 'Organigrama de su institución', 'organigrama', '0', null);
INSERT INTO `submenus` VALUES ('50', '4', 'Alertas', 'Gesti&oacute;n de perfiles laborales', '../alertas', '1', '0');
INSERT INTO `submenus` VALUES ('51', '18', 'Archivero central', 'Archivero central', null, '0', '2');
INSERT INTO `submenus` VALUES ('52', '3', 'Estaciones', 'Estaciones de la empresa', '../estaciones', '1', '1');
INSERT INTO `submenus` VALUES ('53', '11', 'Componentes', 'Parametrizacion de componentes', '../componentes', '0', '0');
INSERT INTO `submenus` VALUES ('54', '11', 'Fuente de Financiamiento', 'Parametrizacion fuentes de financiamiento', '../fuentefinanciamientos', '0', '0');
INSERT INTO `submenus` VALUES ('55', '11', 'Partidas', 'Parametrizacion partidas', '../partidas', '0', '0');
INSERT INTO `submenus` VALUES ('56', '3', 'Lineas', 'Lines de la la empresa', '../lineas', '1', '0');
INSERT INTO `submenus` VALUES ('57', '11', 'Niveles Estructurales', 'Parametrizacion de niveles estructurales', '../nivelestructurales', '0', '0');
INSERT INTO `submenus` VALUES ('58', '11', 'Direcciones Administrativas', 'Parametrizacion de direcciones administrativas', '../das', '0', '0');
INSERT INTO `submenus` VALUES ('59', '11', 'Organigrama', 'Organigrama de la Entidad', '../organigramas', '0', '0');
INSERT INTO `submenus` VALUES ('60', '11', 'Resoluciones', 'Resoluciones Salariales', '../resoluciones', '0', '0');
INSERT INTO `submenus` VALUES ('61', '11', 'Escalas Salariales', 'Nivel salarial', '../nivelsalariales', '0', '0');
INSERT INTO `submenus` VALUES ('62', '11', 'Cargos', 'Cargos de la institucion', '../cargos', '0', '0');
INSERT INTO `submenus` VALUES ('63', '12', 'Gestion', 'Gestionar', 'index', '0', '0');
INSERT INTO `submenus` VALUES ('64', '12', 'Reportes', 'Reportar', 'index', '0', '0');
INSERT INTO `submenus` VALUES ('66', '5', 'Reporte 3', 'Permite realizar las altas, bajas y modificaciones de los nuevos tipos de documentos', '../reporte', '1', '0');
INSERT INTO `submenus` VALUES ('67', '9', 'Parámetros', 'Ajustar Parámetros del tipo de documento', 'parametros', '0', '0');
INSERT INTO `submenus` VALUES ('68', '14', 'Gesti&oacute;n Archivo', 'Permite gestionar el archivo personal', 'gestion', '0', null);
INSERT INTO `submenus` VALUES ('69', '14', 'Listado documentos', 'Genera una lista de documentos', 'listar', '0', null);
INSERT INTO `submenus` VALUES ('70', '4', 'Control de pagos', 'Gesti&oacute;n de turnos laborales.', '../planespagos', '1', '0');
INSERT INTO `submenus` VALUES ('71', '3', 'Grupos - Rubros', 'Grupos y rubros', '../grupos', '1', '0');
INSERT INTO `submenus` VALUES ('72', '11', 'Gesti&oacute;n Feriados', 'Gesti&oacute;n de asingnaci&oacute;n de feriados', '../feriados', '0', '0');
INSERT INTO `submenus` VALUES ('73', '11', 'Gesti&oacute;n Excepciones', 'Gesti&oacute;n Excepciones', '../excepciones', '0', '0');
INSERT INTO `submenus` VALUES ('74', '5', 'Reporte 2', 'Tipos de documentos que se solicitara al personal', '../reporte', '1', '0');
INSERT INTO `submenus` VALUES ('75', '4', 'Mora', 'Control Excepciones', '../moras', '1', '0');

-- ----------------------------
-- Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
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

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('629', 'ichacolla', '0', '1', '1', 'b374537609b09ea5376e4b8baad6b2809f495b72e9a615531ee33e980ff094c0', 'Ivan Marcelo', 'IMCM', 'Profesional Desarrollo', 'ichacolla@gmail.com', '930', null, '1', '2', '1', null, '1', '1', '4021525', 'OR', null, '1', 'Chacolla', 'Morochi', null);
INSERT INTO `usuarios` VALUES ('635', 'fvelasco', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Luis Freddy', 'FV', 'Profesioanl en desarrollo de sistemas', 'fvelasco@miteleferico.bo', '41', null, '1', '2', '1', null, '1', '1', '4986493', 'LP', null, '1', 'Velasco', 'Poma', null);
INSERT INTO `usuarios` VALUES ('637', 'rrhh', '0', '1', '1', '9ad76a04f82f5ff52256787255c21e50f55ca4be011e146763a1335490ac60f1', 'Usuario Recursos Humanos', 'URRHH', 'Profesional Recursos Humanos', 'rrhh@miteleferico.bo', '35', null, '1', '2', '1', null, '1', '1', '4098897', 'LP', null, '1', 'Recursos', null, null);
INSERT INTO `usuarios` VALUES ('640', 'pdaza', '0', '1', '1', 'e6a95cbd012ece36648687f8a16c7471cd8aedd3000ea332c347926c984d8b78', 'Sharon Priscila', 'PD', 'Profesional Recursos Humanos', 'pdaza@miteleferico.bo', '24', null, '1', '2', '1', null, '1', '1', '4096997', 'LP', null, '1', 'Daza', 'Carreon', null);
INSERT INTO `usuarios` VALUES ('641', 'fbutron321', '0', '1', '1', '5a61b5f86af462f23670da2fb54fca12f1c8a775d4aa51968c082e8ee17e937c', 'Fernando', 'FBS', 'Profesional Recurso Humanos', 'fbutron@miteleferico', '3', null, '1', '2', '1', null, '1', '1', '4567788', 'LP', null, '1', 'Butron', 'Sandoval', null);
INSERT INTO `usuarios` VALUES ('643', 'emamani', '0', '1', '1', '83e674fbdb9823d163fcb0c10e8b7e8dead0a2805a28d916f29ad29c3f57c251', 'Estela Julia', 'EMV', 'Profesional Recursos Humanos', 'emamani@miteleferico.bo', '5', null, '1', '2', '1', null, '1', '1', '4567747', 'LP', null, '1', 'Mamani', 'Villca', null);
INSERT INTO `usuarios` VALUES ('644', 'mlazarte321', '0', '1', '1', 'ded4f4089b1aa38a18b4bf9a45497fcdaba3b267d4e7d1e9d7102fa6026dc725', 'Margoth Miriam', 'MLY', 'Profesional Recursos Humanos', 'mlazarte@miteleferico.bo', '2', null, '1', '2', '1', null, '1', '1', '4557897', 'LP', null, '1', 'Lazarte', 'Yapu', null);
