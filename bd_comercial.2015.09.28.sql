/*
Navicat MySQL Data Transfer

Source Server         : local Mysql
Source Server Version : 50544
Source Host           : localhost:3306
Source Database       : bd_comercial

Target Server Type    : MYSQL
Target Server Version : 50544
File Encoding         : 65001

Date: 2015-09-28 19:42:13
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
  `tabla` int(11) NOT NULL DEFAULT '1' COMMENT '1 = productos, 2= clientes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of archivos
-- ----------------------------
INSERT INTO `archivos` VALUES ('1', '1', 'image/jpeg', '20150922_0421293.jpg', 'file/productos/', '44288', '635', '2015-09-22 04:21:29', '1', '0', '1');

-- ----------------------------
-- Table structure for `archivoschecklists`
-- ----------------------------
DROP TABLE IF EXISTS `archivoschecklists`;
CREATE TABLE `archivoschecklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `tipo_archivo` varchar(150) DEFAULT NULL,
  `nombre_archivo` varchar(150) DEFAULT NULL,
  `carpeta` varchar(50) DEFAULT NULL,
  `tamanio` varchar(50) DEFAULT NULL,
  `usuario_reg` int(11) DEFAULT NULL,
  `fecha_reg` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of archivoschecklists
-- ----------------------------
INSERT INTO `archivoschecklists` VALUES ('1', '7', 'application/pdf', '20150925_032949resultado agente de anden.pdf', 'file/checklist/', '5763', '635', '2015-09-25 03:29:49', '1');
INSERT INTO `archivoschecklists` VALUES ('2', '7', 'application/pdf', '20150925_034103resultado agente de anden.pdf', 'file/checklist/', '5763', '635', '2015-09-25 03:41:03', '1');
INSERT INTO `archivoschecklists` VALUES ('3', '7', 'application/pdf', '20150925_034148resultado operador de estacion.pdf', 'file/checklist/', '5805', '635', '2015-09-25 03:41:48', '1');
INSERT INTO `archivoschecklists` VALUES ('4', '7', 'image/jpeg', '20150925_034546mt-marparabolivia-cij1.jpg', 'file/checklist/', '41360', '635', '2015-09-25 03:45:46', '1');
INSERT INTO `archivoschecklists` VALUES ('5', '7', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '20150925_034847CONVOCATORIA PÃ™BLICA INTERNA 6 - CPI06.xlsx', 'file/checklist/', '33522', '635', '2015-09-25 03:48:47', '1');
INSERT INTO `archivoschecklists` VALUES ('6', '7', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '20150925_034933NOTA DE PRENSA-30millones-diasigte.docx', 'file/checklist/', '202684', '635', '2015-09-25 03:49:33', '1');
INSERT INTO `archivoschecklists` VALUES ('7', '2', 'image/jpeg', '20150927_08301930millonesok11.jpg', 'file/checklist/', '70414', '635', '2015-09-27 08:30:19', '1');
INSERT INTO `archivoschecklists` VALUES ('8', '2', 'image/jpeg', '20150927_08423930millonesokxx.jpg', 'file/checklist/', '49904', '635', '2015-09-27 08:42:39', '1');
INSERT INTO `archivoschecklists` VALUES ('9', '7', 'image/png', '20150928_045832undefined.png', 'file/checklist/', '773578', '635', '2015-09-28 04:58:32', '1');
INSERT INTO `archivoschecklists` VALUES ('10', '7', 'image/png', '20150928_053401Captura de pantalla de 2015-08-07 13:29:53.png', 'file/checklist/', '132105', '635', '2015-09-28 05:34:01', '1');
INSERT INTO `archivoschecklists` VALUES ('11', '7', 'application/pdf', '20150928_065421escala salarial.pdf', 'file/checklist/', '11962', '635', '2015-09-28 06:54:21', '1');
INSERT INTO `archivoschecklists` VALUES ('12', '7', 'application/pdf', '20150928_065611Servicios de Hospedaje - BOLTUR.pdf', 'file/checklist/', '334811', '635', '2015-09-28 06:56:11', '1');
INSERT INTO `archivoschecklists` VALUES ('13', '7', 'image/jpeg', '20150928_065856LOGO GAMCABLE 1.jpg', 'file/checklist/', '8403', '635', '2015-09-28 06:58:56', '1');
INSERT INTO `archivoschecklists` VALUES ('14', '7', 'image/png', '20150928_065935Logo Consorcio.png', 'file/checklist/', '14189', '635', '2015-09-28 06:59:35', '1');

-- ----------------------------
-- Table structure for `checklists`
-- ----------------------------
DROP TABLE IF EXISTS `checklists`;
CREATE TABLE `checklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contrato_id` int(11) NOT NULL,
  `parametro_id` int(11) NOT NULL,
  `tipo_empresa` varchar(150) DEFAULT NULL,
  `parametro` varchar(250) DEFAULT NULL,
  `cumple` tinyint(11) DEFAULT NULL,
  `observacion` varchar(250) DEFAULT NULL,
  `usuario_reg` int(11) NOT NULL,
  `fecha_reg` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

-- ----------------------------
-- Records of checklists
-- ----------------------------
INSERT INTO `checklists` VALUES ('2', '1', '6', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia de nÃºmero de identificaciÃ³n tributaria (NIT)', '1', '', '635', '2015-09-25 10:24:19', '1');
INSERT INTO `checklists` VALUES ('3', '1', '9', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia de cÃ©dula de identidad del representante legal', '0', '', '635', '2015-09-25 10:38:49', '1');
INSERT INTO `checklists` VALUES ('4', '1', '5', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia del instrumento de poder del representante legal', '1', '', '635', '2015-09-25 10:39:07', '1');
INSERT INTO `checklists` VALUES ('5', '1', '2', 'Requisitos Generales', 'Carta dirigida a la EETC MT solicitando alquiler de un espacio comercial', '0', '', '635', '2015-09-25 10:39:26', '1');
INSERT INTO `checklists` VALUES ('6', '1', '4', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia de las estructuras modificatorias posteriores', '1', '', '635', '2015-09-25 10:39:28', '1');
INSERT INTO `checklists` VALUES ('7', '1', '8', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia matrÃ­cula de inscripciÃ³n de FUNDEMPRESA (actualizado)', '1', '', '635', '2015-09-25 10:39:28', '1');
INSERT INTO `checklists` VALUES ('8', '1', '3', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia de constituciÃ³n de sociedad', '1', '', '635', '2015-09-25 10:39:29', '1');
INSERT INTO `checklists` VALUES ('9', '1', '7', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia de licencia de funcionamiento municipal (para locales comerciales, islas y plazas de comida) (no excluyente)', '1', '', '635', '2015-09-25 10:58:22', '1');
INSERT INTO `checklists` VALUES ('10', '2', '18', 'Requisitos personas naturales', 'Fotocopia de cÃ©dula de identidad', '1', '', '635', '2015-09-27 20:35:15', '1');
INSERT INTO `checklists` VALUES ('11', '2', '17', 'Equivalente del poder del representante legal para instituciones ejecutoras de convenios o acuerdos internacionales', 'Convenio o Acuerdo Marco de CooperaciÃ³n, suscrito por la autoridad competente del Estado Plurinacional de Bolivia (Ministerio de Relaciones Exteriores)', '1', '', '635', '2015-09-27 20:42:18', '1');
INSERT INTO `checklists` VALUES ('12', '2', '16', 'Equivalente del poder del representante legal para entidades publicas', 'ResoluciÃ³n y memorÃ¡ndum de designaciÃ³n', '1', '', '635', '2015-09-27 20:42:24', '1');
INSERT INTO `checklists` VALUES ('13', '1', '14', 'Empresas Unipersonales', 'Fotocopia de cÃ©dula de identidad del representante legal', '0', '', '635', '2015-09-27 20:53:50', '1');
INSERT INTO `checklists` VALUES ('14', '1', '18', 'Requisitos personas naturales', 'Fotocopia de cÃ©dula de identidad', '1', '', '635', '2015-09-27 20:57:07', '1');
INSERT INTO `checklists` VALUES ('15', '1', '17', 'Equivalente del poder del representante legal para instituciones ejecutoras de convenios o acuerdos internacionales', 'Convenio o Acuerdo Marco de CooperaciÃ³n, suscrito por la autoridad competente del Estado Plurinacional de Bolivia (Ministerio de Relaciones Exteriores)', '1', '', '635', '2015-09-27 20:57:28', '1');
INSERT INTO `checklists` VALUES ('16', '1', '10', 'Empresas Unipersonales', 'Fotocopia de instrumento de poder del representante legal (si corresponde)', '0', '', '635', '2015-09-28 17:33:50', '1');
INSERT INTO `checklists` VALUES ('107', '8', '6', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia de nÃºmero de identificaciÃ³n tributaria (NIT)', '1', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('108', '8', '9', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia de cÃ©dula de identidad del representante legal', '0', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('109', '8', '5', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia del instrumento de poder del representante legal', '1', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('110', '8', '2', 'Requisitos Generales', 'Carta dirigida a la EETC MT solicitando alquiler de un espacio comercial', '0', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('111', '8', '4', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia de las estructuras modificatorias posteriores', '1', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('112', '8', '8', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia matrÃ­cula de inscripciÃ³n de FUNDEMPRESA (actualizado)', '1', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('113', '8', '3', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia de constituciÃ³n de sociedad', '1', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('114', '8', '7', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', 'Fotocopia de licencia de funcionamiento municipal (para locales comerciales, islas y plazas de comida) (no excluyente)', '1', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('115', '8', '14', 'Empresas Unipersonales', 'Fotocopia de cÃ©dula de identidad del representante legal', '0', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('116', '8', '18', 'Requisitos personas naturales', 'Fotocopia de cÃ©dula de identidad', '1', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('117', '8', '17', 'Equivalente del poder del representante legal para instituciones ejecutoras de convenios o acuerdos internacionales', 'Convenio o Acuerdo Marco de CooperaciÃ³n, suscrito por la autoridad competente del Estado Plurinacional de Bolivia (Ministerio de Relaciones Exteriores)', '1', '', '635', '2015-09-28 19:39:17', '1');
INSERT INTO `checklists` VALUES ('118', '8', '10', 'Empresas Unipersonales', 'Fotocopia de instrumento de poder del representante legal (si corresponde)', '0', '', '635', '2015-09-28 19:39:17', '1');

-- ----------------------------
-- Table structure for `checklistsarchivos`
-- ----------------------------
DROP TABLE IF EXISTS `checklistsarchivos`;
CREATE TABLE `checklistsarchivos` (
  `parametro_id` int(11) NOT NULL,
  `archivo_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `contrato_id` int(11) NOT NULL,
  PRIMARY KEY (`parametro_id`,`archivo_id`,`contrato_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of checklistsarchivos
-- ----------------------------
INSERT INTO `checklistsarchivos` VALUES ('4', '1', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('4', '1', '1', '8');
INSERT INTO `checklistsarchivos` VALUES ('4', '6', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('4', '6', '1', '8');
INSERT INTO `checklistsarchivos` VALUES ('4', '9', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('4', '9', '1', '8');
INSERT INTO `checklistsarchivos` VALUES ('4', '10', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('4', '10', '1', '8');
INSERT INTO `checklistsarchivos` VALUES ('5', '2', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('5', '2', '1', '8');
INSERT INTO `checklistsarchivos` VALUES ('5', '3', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('5', '3', '1', '8');
INSERT INTO `checklistsarchivos` VALUES ('5', '7', '1', '2');
INSERT INTO `checklistsarchivos` VALUES ('6', '4', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('6', '4', '1', '8');
INSERT INTO `checklistsarchivos` VALUES ('6', '5', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('6', '5', '1', '8');
INSERT INTO `checklistsarchivos` VALUES ('6', '8', '1', '2');
INSERT INTO `checklistsarchivos` VALUES ('7', '12', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('7', '12', '1', '8');
INSERT INTO `checklistsarchivos` VALUES ('8', '13', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('8', '13', '1', '8');
INSERT INTO `checklistsarchivos` VALUES ('8', '14', '1', '1');
INSERT INTO `checklistsarchivos` VALUES ('8', '14', '1', '8');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('1', 'Valery Cruz Cayabu', '10918245', '0', '65658821', 'maruquipa@miteleferico.bo', 'Calle Policarpo Eysaguirre NÂº 1156, Zona de Callampaya', null, 'Valery Cruz Cayabu', '10918245', '65658821', '', 'Valery Cruz Cayabu', '10918245', '65658821', 'maruquipa@miteleferico.bo', '643', '2015-06-29 10:26:28', '1');
INSERT INTO `clientes` VALUES ('2', 'Aidee CarmiÃ±a Cori Sardon ', '4741440', '762188010', '762188010', 'maruquipa@miteleferico.bo', 'Calle Reyes Cardona NÂº 88, Zona Callampaya', null, 'Aidee CarmiÃ±a Cori Sardon ', '4741440', '762188010', '', 'Aidee CarmiÃ±a Cori Sardon ', '4741440', '762188010', 'maruquipa@miteleferico.bo', '643', '2015-07-22 08:38:00', '1');
INSERT INTO `clientes` VALUES ('3', 'Maria Josefina Sardon de Cori', '2363896', '77223881', '77223881', 'maruquipa@miteleferico.bo', 'Calle Reyes Cardona NÂº 88, Zona Callampaya', null, 'Maria Josefina Sardon de Cori', '2363896', '77223881', '', 'Maria Josefina Sardon de Cori', '2363896', '77223881', 'maruquipa@miteleferico.bo', '643', '2015-07-22 08:42:33', '1');
INSERT INTO `clientes` VALUES ('4', 'Sofia Roque Choque', '3338938', '73071574', '65644286', 'maruquipa@miteleferico.bo', 'Calle Omasuyos NÂº 1144, Zona Nueva JerusalÃ©n ', null, 'Sofia Roque Choque', '3338938', '73071574', '', 'Sofia Roque Choque', '3338938', '73071574', 'maruquipa@miteleferico.bo', '643', '2015-07-22 08:48:44', '1');
INSERT INTO `clientes` VALUES ('5', 'Gabriel Ulo Arteaga', '2465402', '79610324', '0', 'maruquipa@miteleferico.bo', 'Calle Reyes Cardona NÂº 88, Zona Callampaya', null, 'Gabriel Ulo Arteaga', '2465402', '79610324', '', 'Gabriel Ulo Arteaga ', '2465402', '79610324', 'maruquipa@miteleferico.bo', '643', '2015-07-22 08:50:30', '1');
INSERT INTO `clientes` VALUES ('6', 'Tania Paola Ulo Costas ', '4879345', '60580083', '60580083', 'maruquipa@miteleferico.bo', 'Calle Policarpo Eyzaguirre NÂº 1368', null, 'Tania Ulo Costas ', '4879345', '60580083', '', 'Tania Ulo Costas ', '4879345', '60580083', 'maruquipa@miteleferico.bo', '643', '2015-07-22 09:01:22', '1');
INSERT INTO `clientes` VALUES ('7', 'Carlos Vicente Cori Sardon ', '4772465', '75218898', '75218898', 'maruquipa@miteleferico.bo', 'Calle Reyes Cardona NÂº 88, Zona Callampaya', null, 'Carlos Vicente Cori Sardon ', '4772465', '75218898', '', 'Carlos Vicente Cori Sardon ', '4772465', '75218898', 'maruquipa@miteleferico.bo', '643', '2015-07-22 09:17:13', '1');
INSERT INTO `clientes` VALUES ('8', 'Olga Ximena AibaÃ±ez Aranibar', '3791332015', '77702011', '77702011', 'aranibar27@hotmail.com', 'Bloque J NÂº 28, Ed. Josefina Piso 3. Depto: 3ro, Zona Sur de San Miguel', null, 'Olga Ximena IbaÃ±ez Aranibar ', '', '77702011', 'aranibar@hotmail.com', 'Alejandra Jimenez ', '0', '70307555', 'ajimenez@scj-srl.com', '643', '2015-07-22 10:07:06', '1');
INSERT INTO `clientes` VALUES ('9', 'Laboratorios Bago de Bolivia S.A.', '1020503020', '2770110', '72026100', 'edelgado@bago.com.bo', ' Calle 11, No 480 Calacoto, esquina SÃ¡nchez Bustamante', null, 'Maria Rene Centellas de Antezana', '2614102', '0', '', 'Edmundo Delgado', '0', '72026100', 'edelgado@bago.com.bo', '644', '2015-09-10 18:41:30', '1');

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
  `dias_tolerancia` int(11) NOT NULL DEFAULT '0',
  `porcentaje_mora` decimal(10,2) NOT NULL DEFAULT '0.00',
  `responsable_id` int(11) NOT NULL,
  `solicitud_id` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `fecha_finalizacion` timestamp NULL DEFAULT NULL,
  `obs_finalizacion` text,
  `usuario_finalizacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_contratos_fk` (`cliente_id`),
  CONSTRAINT `clientes_contratos_fk` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';

-- ----------------------------
-- Records of contratos
-- ----------------------------
INSERT INTO `contratos` VALUES ('1', '007/2015', '7', '2015-03-02 00:00:00', '643', '2015-07-22 17:09:48', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de una caseta comercial para la venta de flores en la EstaciÃ³n Ajayuni.', '0', '0.00', '643', null, '1', null, null, null);
INSERT INTO `contratos` VALUES ('2', '006/2015', '2', '2015-03-02 00:00:00', '643', '2015-07-22 17:30:01', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de una caseta comercial para la venta de flores en la EstaciÃ³n Ajayuni.', '0', '0.00', '643', null, '1', null, null, null);
INSERT INTO `contratos` VALUES ('3', '004/2015', '3', '2015-03-02 00:00:00', '643', '2015-07-22 18:58:11', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de una caseta comercial para la venta de flores en la EstaciÃ³n Ajayuni.', '0', '0.00', '643', null, '1', null, null, null);
INSERT INTO `contratos` VALUES ('4', '003/2015', '4', '2015-03-02 00:00:00', '643', '2015-07-23 09:44:29', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de una caseta comercial para la venta de flores en la EstaciÃ³n Ajayuni.', '0', '0.00', '643', '10', '1', null, null, null);
INSERT INTO `contratos` VALUES ('5', '009/2015', '1', '2015-03-02 00:00:00', '643', '2015-07-23 10:05:00', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de una caseta comercial para la venta de helados en la EstaciÃ³n Ajayuni.', '0', '0.00', '643', '14', '1', null, null, null);
INSERT INTO `contratos` VALUES ('6', '010/2015', '5', '2015-03-02 00:00:00', '643', '2015-07-23 10:20:48', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de una caseta comercial para la venta de helados en la EstaciÃ³n Ajayuni.', '0', '0.00', '643', '12', '1', null, null, null);
INSERT INTO `contratos` VALUES ('7', '008/2015', '6', '2015-03-02 00:00:00', '643', '2015-07-23 10:34:45', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', 'Alquiler de una caseta comercial para la venta de helados en la EstaciÃ³n Ajayuni', '0', '0.00', '643', '13', '1', null, null, null);
INSERT INTO `contratos` VALUES ('8', '100/2015', '7', '2015-09-27 00:00:00', '635', '2015-09-27 21:29:43', '1', 'EMPRESA ESTATAL DE TRASPORTE POR CABLE ', 'LIC. CESAR LUIS DOCKWEILER SUAREA', 'GERENTE EJECUTIVO', '', '5', '0.03', '629', '0', '1', null, null, null);

-- ----------------------------
-- Table structure for `contratosproductos`
-- ----------------------------
DROP TABLE IF EXISTS `contratosproductos`;
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
  `estado` int(11) NOT NULL DEFAULT '1',
  `fecha_finalizacion` timestamp NULL DEFAULT NULL,
  `obs_finalizacion` text,
  `usuario_finalizacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contratos_contratosproductos_fk` (`contrato_id`),
  KEY `productos_contratosproductos_fk` (`producto_id`),
  CONSTRAINT `contratos_contratosproductos_fk` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productos_contratosproductos_fk` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';

-- ----------------------------
-- Records of contratosproductos
-- ----------------------------
INSERT INTO `contratosproductos` VALUES ('1', '1', '15', '1392.00', 'Mensual', '2015-04-01 00:00:00', '2016-03-31 00:00:00', '1', '1', '16704.00', '366', '1', null, null, null);
INSERT INTO `contratosproductos` VALUES ('2', '1', '16', '1392.00', 'Mensual', '2015-05-01 00:00:00', '2015-04-30 00:00:00', '0', '1', '1392.00', '2', '1', null, null, null);
INSERT INTO `contratosproductos` VALUES ('3', '2', '16', '1392.00', 'Mensual', '2015-05-01 00:00:00', '2016-04-30 00:00:00', '1', '1', '16704.00', '366', '1', null, null, null);
INSERT INTO `contratosproductos` VALUES ('4', '3', '17', '1392.00', 'Mensual', '2015-05-01 00:00:00', '2016-04-30 00:00:00', '1', '1', '16704.00', '366', '1', null, null, null);
INSERT INTO `contratosproductos` VALUES ('5', '4', '18', '1392.00', 'Mensual', '2015-04-01 00:00:00', '2016-03-31 00:00:00', '1', '1', '16704.00', '366', '1', null, null, null);
INSERT INTO `contratosproductos` VALUES ('6', '5', '13', '1392.00', 'Mensual', '2015-04-01 00:00:00', '2016-03-31 00:00:00', '1', '1', '16704.00', '366', '1', null, null, null);
INSERT INTO `contratosproductos` VALUES ('7', '6', '12', '1392.00', 'Mensual', '2015-04-01 00:00:00', '2016-03-31 00:00:00', '1', '1', '16704.00', '366', '1', null, null, null);
INSERT INTO `contratosproductos` VALUES ('8', '7', '14', '1392.00', 'Mensual', '2015-04-01 00:00:00', '2016-03-31 00:00:00', '1', '1', '16704.00', '366', '1', null, null, null);
INSERT INTO `contratosproductos` VALUES ('9', '8', '2', '2610.00', 'Mensual', '2015-06-01 00:00:00', '2015-11-30 00:00:00', '1', '1', '15660.00', '183', '1', null, null, null);

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
-- Table structure for `envioscorreos`
-- ----------------------------
DROP TABLE IF EXISTS `envioscorreos`;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of envioscorreos
-- ----------------------------
INSERT INTO `envioscorreos` VALUES ('1', '4', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Carlos Vicente Cori Sardon ', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Carlos Vicente Cori Sardon </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 007/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-26', '5', '1', 'Carlos Vicente Cori Sardon ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('2', '16', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Aidee CarmiÃ±a Cori Sardon ', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Aidee CarmiÃ±a Cori Sardon </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 006/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-26', '5', '1', 'Aidee CarmiÃ±a Cori Sardon ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('3', '28', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Maria Josefina Sardon de Cori', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Maria Josefina Sardon de Cori</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 004/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-26', '5', '1', 'Maria Josefina Sardon de Cori,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('4', '41', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Sofia Roque Choque', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Sofia Roque Choque</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 003/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-26', '5', '1', 'Sofia Roque Choque,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('5', '53', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Valery Cruz Cayabu', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Valery Cruz Cayabu</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 009/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-26', '5', '1', 'Valery Cruz Cayabu,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('6', '65', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Gabriel Ulo Arteaga', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Gabriel Ulo Arteaga</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 010/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-26', '5', '1', 'Gabriel Ulo Arteaga ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('7', '77', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Tania Paola Ulo Costas ', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Tania Paola Ulo Costas </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 008/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-26', '5', '1', 'Tania Ulo Costas ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('8', '4', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Carlos Vicente Cori Sardon ', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Carlos Vicente Cori Sardon </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 007/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-31', '0', '1', 'Carlos Vicente Cori Sardon ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('9', '16', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Aidee CarmiÃ±a Cori Sardon ', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Aidee CarmiÃ±a Cori Sardon </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 006/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-31', '0', '1', 'Aidee CarmiÃ±a Cori Sardon ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('10', '28', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Maria Josefina Sardon de Cori', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Maria Josefina Sardon de Cori</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 004/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-31', '0', '1', 'Maria Josefina Sardon de Cori,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('11', '41', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Sofia Roque Choque', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Sofia Roque Choque</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 003/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-31', '0', '1', 'Sofia Roque Choque,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('12', '53', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Valery Cruz Cayabu', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Valery Cruz Cayabu</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 009/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-31', '0', '1', 'Valery Cruz Cayabu,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('13', '65', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Gabriel Ulo Arteaga', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Gabriel Ulo Arteaga</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 010/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-31', '0', '1', 'Gabriel Ulo Arteaga ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('14', '77', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Tania Paola Ulo Costas ', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Tania Paola Ulo Costas </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 008/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-07-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-07-31', '2015-07-31', '0', '1', 'Tania Ulo Costas ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('15', '5', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Carlos Vicente Cori Sardon ', 'maruquipa@miteleferico.bo', 'Notificacion 10 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Carlos Vicente Cori Sardon </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 007/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-21', '10', '1', 'Carlos Vicente Cori Sardon ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('16', '17', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Aidee CarmiÃ±a Cori Sardon ', 'maruquipa@miteleferico.bo', 'Notificacion 10 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Aidee CarmiÃ±a Cori Sardon </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 006/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-21', '10', '1', 'Aidee CarmiÃ±a Cori Sardon ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('17', '29', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Maria Josefina Sardon de Cori', 'maruquipa@miteleferico.bo', 'Notificacion 10 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Maria Josefina Sardon de Cori</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 004/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-21', '10', '1', 'Maria Josefina Sardon de Cori,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('18', '42', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Sofia Roque Choque', 'maruquipa@miteleferico.bo', 'Notificacion 10 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Sofia Roque Choque</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 003/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-21', '10', '1', 'Sofia Roque Choque,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('19', '54', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Valery Cruz Cayabu', 'maruquipa@miteleferico.bo', 'Notificacion 10 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Valery Cruz Cayabu</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 009/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-21', '10', '1', 'Valery Cruz Cayabu,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('20', '66', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Gabriel Ulo Arteaga', 'maruquipa@miteleferico.bo', 'Notificacion 10 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Gabriel Ulo Arteaga</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 010/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-21', '10', '1', 'Gabriel Ulo Arteaga ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('21', '78', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Tania Paola Ulo Costas ', 'maruquipa@miteleferico.bo', 'Notificacion 10 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Tania Paola Ulo Costas </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 008/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-21', '10', '1', 'Tania Ulo Costas ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('22', '5', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Carlos Vicente Cori Sardon ', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Carlos Vicente Cori Sardon </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 007/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-26', '5', '1', 'Carlos Vicente Cori Sardon ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('23', '17', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Aidee CarmiÃ±a Cori Sardon ', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Aidee CarmiÃ±a Cori Sardon </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 006/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-26', '5', '1', 'Aidee CarmiÃ±a Cori Sardon ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('24', '29', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Maria Josefina Sardon de Cori', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Maria Josefina Sardon de Cori</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 004/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-26', '5', '1', 'Maria Josefina Sardon de Cori,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('25', '42', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Sofia Roque Choque', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Sofia Roque Choque</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 003/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-26', '5', '1', 'Sofia Roque Choque,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('26', '54', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Valery Cruz Cayabu', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Valery Cruz Cayabu</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 009/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-26', '5', '1', 'Valery Cruz Cayabu,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('27', '66', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Gabriel Ulo Arteaga', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Gabriel Ulo Arteaga</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 010/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-26', '5', '1', 'Gabriel Ulo Arteaga ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('28', '78', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Tania Paola Ulo Costas ', 'maruquipa@miteleferico.bo', 'Notificacion 5 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Tania Paola Ulo Costas </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 008/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-26', '5', '1', 'Tania Ulo Costas ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('29', '5', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Carlos Vicente Cori Sardon ', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Carlos Vicente Cori Sardon </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 007/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-31', '0', '1', 'Carlos Vicente Cori Sardon ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('30', '17', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Aidee CarmiÃ±a Cori Sardon ', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Aidee CarmiÃ±a Cori Sardon </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 006/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-31', '0', '1', 'Aidee CarmiÃ±a Cori Sardon ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('31', '29', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Maria Josefina Sardon de Cori', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Maria Josefina Sardon de Cori</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 004/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-31', '0', '1', 'Maria Josefina Sardon de Cori,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('32', '42', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Sofia Roque Choque', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Sofia Roque Choque</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 003/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-31', '0', '1', 'Sofia Roque Choque,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('33', '54', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Valery Cruz Cayabu', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Valery Cruz Cayabu</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 009/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-31', '0', '1', 'Valery Cruz Cayabu,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('34', '66', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Gabriel Ulo Arteaga', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Gabriel Ulo Arteaga</b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 010/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-31', '0', '1', 'Gabriel Ulo Arteaga ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');
INSERT INTO `envioscorreos` VALUES ('35', '78', 'MI TELEFERICO', 'rrhh@miteleferico.bo', 'Tania Paola Ulo Costas ', 'maruquipa@miteleferico.bo', 'Notificacion 0 dias antes de la fecha programada', '<div>SeÃ±or(es),</div>\n	<div><b>Tania Paola Ulo Costas </b></div>\n	<BR>\n		<p>La Empresa Estatal de Transporte por Cable \"Mi TelefÃ©rico\", le comunica que tiene que realizar el deposito de alquiler del siguiente producto:</p>\n		<div><b>Linea:</b> ROJA</div>\n		<div><b>EstaciÃ³n:</b> CEMENTERIO / AJAYUNI</div>\n		<div><b>Nro Contrato:</b> 008/2015</div>\n		<div><b>Producto:</b> Caseta comercial</div>\n		<div><b>Fecha Programado:</b> 2015-08-31</div>\n		<div><b>Monto Programado Bs.:</b> 1392.00</div>\n		<BR>\n			<p>Se lo insinua realizar el pago antes de la fecha programada para no pasar a mora.</p>\n			<p>Saludos,</p>\n			<p><b>EMPRESA DE TRANSPORTE POR CABLE MI TELEFERICO</b></p>', '1', '2015-08-31', '2015-08-31', '0', '1', 'Tania Ulo Costas ,Ariana Daza Goytia,Ariana Daza Goytia', 'maruquipa@miteleferico.bo,adaza@miteleferico.bo,adaza@miteleferico.bo');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
INSERT INTO `estaciones` VALUES ('13', '2', 'pruebass', '0');

-- ----------------------------
-- Table structure for `garantias`
-- ----------------------------
DROP TABLE IF EXISTS `garantias`;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of garantias
-- ----------------------------
INSERT INTO `garantias` VALUES ('1', '1', '2014-11-04', '31128709', '1394.00', '0000-00-00', '0.00', '1', '1', '');
INSERT INTO `garantias` VALUES ('2', '1', '2014-11-04', '31128712', '1394.00', '0000-00-00', '0.00', '1', '3', '');
INSERT INTO `garantias` VALUES ('3', '1', '2014-11-04', '31128703', '1394.00', '0000-00-00', '0.00', '1', '4', '');
INSERT INTO `garantias` VALUES ('4', '1', '2014-11-11', '31881347', '1398.00', '0000-00-00', '0.00', '1', '6', '');
INSERT INTO `garantias` VALUES ('5', '1', '2014-12-09', '34374938', '1370.00', '0000-00-00', '0.00', '0', '7', '');
INSERT INTO `garantias` VALUES ('6', '1', '2014-11-13', '32172899', '1370.00', '0000-00-00', '0.00', '1', '7', '');
INSERT INTO `garantias` VALUES ('7', '1', '2014-12-09', '34374938', '24.00', '0000-00-00', '0.00', '1', '7', '');

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
-- Table structure for `informes`
-- ----------------------------
DROP TABLE IF EXISTS `informes`;
CREATE TABLE `informes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitud_id` int(11) NOT NULL,
  `cite` varchar(50) NOT NULL,
  `nur` varchar(50) NOT NULL,
  `usuario_reg` int(11) NOT NULL,
  `fecha_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';

-- ----------------------------
-- Records of informes
-- ----------------------------
INSERT INTO `informes` VALUES ('9', '8', 'test', 'MT/2014-02942', '643', '2015-07-22 17:05:37', '1');
INSERT INTO `informes` VALUES ('10', '6', 'test', 'MT/2014-02942', '643', '2015-07-22 17:26:23', '1');
INSERT INTO `informes` VALUES ('11', '9', 'test', 'MT/2014-02942', '643', '2015-07-22 18:52:48', '1');
INSERT INTO `informes` VALUES ('12', '11', 'test', 'Ex/2014-02942', '643', '2015-07-23 08:57:04', '1');
INSERT INTO `informes` VALUES ('13', '10', 'test', 'Ex/2015-00428', '643', '2015-07-23 09:38:40', '1');
INSERT INTO `informes` VALUES ('14', '14', 'test', 'MT/2014-02942', '643', '2015-07-23 10:02:49', '1');
INSERT INTO `informes` VALUES ('15', '12', 'test', 'MT/2014-02942', '643', '2015-07-23 10:18:41', '1');
INSERT INTO `informes` VALUES ('16', '13', 'test', 'Ex/2015-00323', '643', '2015-07-23 10:33:21', '1');
INSERT INTO `informes` VALUES ('17', '15', 'test', 'MT/2014-02943', '644', '2015-09-10 18:55:08', '1');

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
INSERT INTO `menus` VALUES ('7', 'Facturas', 'Facturacion a clientes', 'facturas', '6', 'fa fa-usd');
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
INSERT INTO `niveles` VALUES ('2', 'Administrador', 'Administrador del sistema Comercial');
INSERT INTO `niveles` VALUES ('3', 'Responsable Comercial', 'Resposable comercial');
INSERT INTO `niveles` VALUES ('4', 'Facturas', 'Responsansable de facturacion');
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
INSERT INTO `nivelmenu` VALUES ('2', '9');
INSERT INTO `nivelmenu` VALUES ('2', '11');
INSERT INTO `nivelmenu` VALUES ('2', '12');
INSERT INTO `nivelmenu` VALUES ('2', '14');
INSERT INTO `nivelmenu` VALUES ('3', '1');
INSERT INTO `nivelmenu` VALUES ('3', '2');
INSERT INTO `nivelmenu` VALUES ('3', '4');
INSERT INTO `nivelmenu` VALUES ('3', '6');
INSERT INTO `nivelmenu` VALUES ('3', '7');
INSERT INTO `nivelmenu` VALUES ('3', '13');
INSERT INTO `nivelmenu` VALUES ('4', '1');
INSERT INTO `nivelmenu` VALUES ('4', '7');
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
-- Table structure for `parametros`
-- ----------------------------
DROP TABLE IF EXISTS `parametros`;
CREATE TABLE `parametros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parametro` varchar(250) NOT NULL,
  `valor_1` varchar(150) NOT NULL,
  `valor_2` varchar(100) DEFAULT NULL,
  `valor_3` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '0',
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  `nivel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

-- ----------------------------
-- Records of parametros
-- ----------------------------
INSERT INTO `parametros` VALUES ('1', 'solicitudes_estados', 'Proceso', null, null, null, '0', '1', '1');
INSERT INTO `parametros` VALUES ('2', 'solicitudes_estados', 'Aceptado', null, null, null, '0', '1', '2');
INSERT INTO `parametros` VALUES ('3', 'solicitudes_estados', 'Rechazado', null, null, null, '0', '1', '3');
INSERT INTO `parametros` VALUES ('4', 'contratos_estados', 'Vigente', null, null, null, '0', '1', '1');
INSERT INTO `parametros` VALUES ('5', 'contratos_estados', 'Concluido correctamente', null, null, null, '0', '1', '2');
INSERT INTO `parametros` VALUES ('6', 'contratos_estados', 'Recindir por incumplimiento de pago', null, null, null, '0', '1', '3');
INSERT INTO `parametros` VALUES ('7', 'checklist_tipoempresas', 'Requisitos Generales', null, null, null, '0', '1', '1');
INSERT INTO `parametros` VALUES ('8', 'checklist_tipoempresas', 'Sociedades Anonimas (S.A.) y Sociedades de Resposabilidad limitada (S.R.L)', null, null, null, '0', '1', '2');
INSERT INTO `parametros` VALUES ('9', 'checklist_tipoempresas', 'Empresas Unipersonales', null, null, null, '0', '1', '3');
INSERT INTO `parametros` VALUES ('10', 'checklist_tipoempresas', 'Equivalente del poder del representante legal para entidades publicas', null, null, null, '0', '1', '4');
INSERT INTO `parametros` VALUES ('11', 'checklist_tipoempresas', 'Equivalente del poder del representante legal para instituciones ejecutoras de convenios o acuerdos internacionales', null, null, null, '0', '1', '5');
INSERT INTO `parametros` VALUES ('12', 'checklist_tipoempresas', 'Requisitos personas naturales', null, null, null, '0', '1', '6');

-- ----------------------------
-- Table structure for `parametroschecklists`
-- ----------------------------
DROP TABLE IF EXISTS `parametroschecklists`;
CREATE TABLE `parametroschecklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parametro` varchar(250) NOT NULL,
  `abreviado` varchar(20) DEFAULT NULL,
  `tipo_empresa` int(11) NOT NULL,
  `obligatorio` int(11) NOT NULL,
  `escaner` int(11) NOT NULL,
  `clase` varchar(250) DEFAULT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

-- ----------------------------
-- Records of parametroschecklists
-- ----------------------------
INSERT INTO `parametroschecklists` VALUES ('1', '2', null, '2', '0', '0', null, '0');
INSERT INTO `parametroschecklists` VALUES ('2', 'Carta dirigida a la EETC MT solicitando alquiler de un espacio comercial', '', '1', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('3', 'Fotocopia de constituciÃ³n de sociedad', '', '2', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('4', 'Fotocopia de las estructuras modificatorias posteriores', '', '2', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('5', 'Fotocopia del instrumento de poder del representante legal', '', '2', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('6', 'Fotocopia de nÃºmero de identificaciÃ³n tributaria (NIT)', '', '2', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('7', 'Fotocopia de licencia de funcionamiento municipal (para locales comerciales, islas y plazas de comida) (no excluyente)', '', '2', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('8', 'Fotocopia matrÃ­cula de inscripciÃ³n de FUNDEMPRESA (actualizado)', '', '2', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('9', 'Fotocopia de cÃ©dula de identidad del representante legal', '', '2', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('10', 'Fotocopia de instrumento de poder del representante legal (si corresponde)', '', '3', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('11', 'Fotocopia de nÃºmero de identificaciÃ³n tributaria (NIT)', '', '3', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('12', 'Fotocopia de la licencia de funcionamiento municipal (no excluyente)', '', '3', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('13', 'Matricula de inscripcion en FUNDEMPRESA (actualizada, en original)', '', '3', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('14', 'Fotocopia de cÃ©dula de identidad del representante legal', '', '3', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('15', 'Decreto Supremo', '', '4', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('16', 'ResoluciÃ³n y memorÃ¡ndum de designaciÃ³n', '', '4', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('17', 'Convenio o Acuerdo Marco de CooperaciÃ³n, suscrito por la autoridad competente del Estado Plurinacional de Bolivia (Ministerio de Relaciones Exteriores)', '', '5', '1', '1', '', '1');
INSERT INTO `parametroschecklists` VALUES ('18', 'Fotocopia de cÃ©dula de identidad', '', '6', '1', '1', '', '1');

-- ----------------------------
-- Table structure for `planpagodepositos`
-- ----------------------------
DROP TABLE IF EXISTS `planpagodepositos`;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of planpagodepositos
-- ----------------------------
INSERT INTO `planpagodepositos` VALUES ('1', '1', '2015-05-13', '1392.00', '47635837', '1', '2015-07-22 17:14:06', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('2', '2', '2015-06-23', '1392.00', '51116512', '1', '2015-07-22 17:15:26', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('3', '14', '2015-07-13', '1392.00', '52927460', '1', '2015-07-22 18:46:33', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('4', '26', '2015-06-23', '1392.00', '51116932', '1', '2015-07-22 19:02:33', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('5', '27', '2015-07-13', '1392.00', '52927484', '1', '2015-07-22 19:03:12', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('6', '38', '2015-05-05', '1394.00', '46770459', '1', '2015-07-23 09:48:47', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('7', '39', '2015-06-15', '1394.00', '50404281', '1', '2015-07-23 09:49:43', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('8', '50', '2014-11-11', '1392.00', '31881347', '1', '2015-07-23 10:08:54', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('9', '51', '2014-11-11', '1392.00', '31881347', '1', '2015-07-23 10:09:10', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('10', '52', '2015-06-08', '1392.00', '49830662', '1', '2015-07-23 10:10:11', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('11', '62', '2015-03-17', '2740.00', '42855498', '1', '2015-07-23 10:28:14', '643', '0');
INSERT INTO `planpagodepositos` VALUES ('12', '63', '2015-03-27', '44.00', '43598547', '1', '2015-07-23 10:29:02', '643', '0');
INSERT INTO `planpagodepositos` VALUES ('13', '64', '2015-06-24', '1392.00', '51209779', '1', '2015-07-23 10:30:04', '643', '0');
INSERT INTO `planpagodepositos` VALUES ('14', '74', '2015-03-17', '1392.00', '42865400', '1', '2015-07-23 10:39:05', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('15', '75', '2015-03-17', '1392.00', '42865400', '1', '2015-07-23 10:40:37', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('16', '76', '2015-06-08', '1392.00', '49783595', '1', '2015-07-23 10:41:19', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('17', '62', '2015-03-17', '1392.00', '42855498', '1', '2015-07-23 11:27:07', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('18', '63', '2015-03-17', '1348.00', '42855498', '1', '2015-07-23 11:27:52', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('19', '63', '2015-07-23', '44.00', '43598547', '1', '2015-07-23 11:28:28', '643', '1');
INSERT INTO `planpagodepositos` VALUES ('20', '64', '2015-07-30', '1392.00', '51209779', '1', '2015-07-23 11:29:22', '643', '1');

-- ----------------------------
-- Table structure for `planpagofacturas`
-- ----------------------------
DROP TABLE IF EXISTS `planpagofacturas`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of planpagofacturas
-- ----------------------------

-- ----------------------------
-- Table structure for `planpagos`
-- ----------------------------
DROP TABLE IF EXISTS `planpagos`;
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of planpagos
-- ----------------------------
INSERT INTO `planpagos` VALUES ('1', '1', '1', '15', '2015-04-30', '1392.00', '13', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('2', '1', '1', '15', '2015-05-31', '1392.00', '23', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('3', '1', '1', '15', '2015-06-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('4', '1', '1', '15', '2015-07-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('5', '1', '1', '15', '2015-08-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('6', '1', '1', '15', '2015-09-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('7', '1', '1', '15', '2015-10-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('8', '1', '1', '15', '2015-11-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('9', '1', '1', '15', '2015-12-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('10', '1', '1', '15', '2016-01-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('11', '1', '1', '15', '2016-02-29', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('12', '1', '1', '15', '2016-03-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('13', '2', '1', '16', '2015-04-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('14', '3', '2', '16', '2015-05-31', '1392.00', '43', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('15', '3', '2', '16', '2015-06-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('16', '3', '2', '16', '2015-07-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('17', '3', '2', '16', '2015-08-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('18', '3', '2', '16', '2015-09-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('19', '3', '2', '16', '2015-10-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('20', '3', '2', '16', '2015-11-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('21', '3', '2', '16', '2015-12-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('22', '3', '2', '16', '2016-01-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('23', '3', '2', '16', '2016-02-29', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('24', '3', '2', '16', '2016-03-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('25', '3', '2', '16', '2016-04-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('26', '4', '3', '17', '2015-05-31', '1392.00', '23', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('27', '4', '3', '17', '2015-06-30', '1392.00', '13', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('28', '4', '3', '17', '2015-07-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('29', '4', '3', '17', '2015-08-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('30', '4', '3', '17', '2015-09-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('31', '4', '3', '17', '2015-10-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('32', '4', '3', '17', '2015-11-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('33', '4', '3', '17', '2015-12-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('34', '4', '3', '17', '2016-01-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('35', '4', '3', '17', '2016-02-29', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('36', '4', '3', '17', '2016-03-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('37', '4', '3', '17', '2016-04-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('38', '5', '4', '18', '2015-04-30', '1392.00', '5', '0.00', '1', '2.00', '1392.00');
INSERT INTO `planpagos` VALUES ('39', '5', '4', '18', '2015-05-31', '1392.00', '15', '0.00', '1', '4.00', '1390.00');
INSERT INTO `planpagos` VALUES ('40', '5', '4', '18', '2015-06-30', '1392.00', null, null, '1', null, '1388.00');
INSERT INTO `planpagos` VALUES ('41', '5', '4', '18', '2015-07-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('42', '5', '4', '18', '2015-08-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('43', '5', '4', '18', '2015-09-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('44', '5', '4', '18', '2015-10-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('45', '5', '4', '18', '2015-11-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('46', '5', '4', '18', '2015-12-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('47', '5', '4', '18', '2016-01-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('48', '5', '4', '18', '2016-02-29', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('49', '5', '4', '18', '2016-03-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('50', '6', '5', '13', '2015-04-30', '1392.00', '0', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('51', '6', '5', '13', '2015-05-31', '1392.00', '0', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('52', '6', '5', '13', '2015-06-30', '1392.00', '0', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('53', '6', '5', '13', '2015-07-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('54', '6', '5', '13', '2015-08-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('55', '6', '5', '13', '2015-09-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('56', '6', '5', '13', '2015-10-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('57', '6', '5', '13', '2015-11-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('58', '6', '5', '13', '2015-12-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('59', '6', '5', '13', '2016-01-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('60', '6', '5', '13', '2016-02-29', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('61', '6', '5', '13', '2016-03-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('62', '7', '6', '12', '2015-04-30', '1392.00', '0', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('63', '7', '6', '12', '2015-05-31', '1392.00', '53', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('64', '7', '6', '12', '2015-06-30', '1392.00', '30', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('65', '7', '6', '12', '2015-07-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('66', '7', '6', '12', '2015-08-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('67', '7', '6', '12', '2015-09-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('68', '7', '6', '12', '2015-10-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('69', '7', '6', '12', '2015-11-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('70', '7', '6', '12', '2015-12-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('71', '7', '6', '12', '2016-01-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('72', '7', '6', '12', '2016-02-29', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('73', '7', '6', '12', '2016-03-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('74', '8', '7', '14', '2015-04-30', '1392.00', '0', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('75', '8', '7', '14', '2015-05-31', '1392.00', '0', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('76', '8', '7', '14', '2015-06-30', '1392.00', '0', '0.00', '1', '0.00', '1392.00');
INSERT INTO `planpagos` VALUES ('77', '8', '7', '14', '2015-07-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('78', '8', '7', '14', '2015-08-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('79', '8', '7', '14', '2015-09-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('80', '8', '7', '14', '2015-10-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('81', '8', '7', '14', '2015-11-30', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('82', '8', '7', '14', '2015-12-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('83', '8', '7', '14', '2016-01-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('84', '8', '7', '14', '2016-02-29', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('85', '8', '7', '14', '2016-03-31', '1392.00', null, null, '1', null, '1392.00');
INSERT INTO `planpagos` VALUES ('86', '9', '8', '2', '2015-06-30', '2610.00', null, null, '1', null, '2610.00');
INSERT INTO `planpagos` VALUES ('87', '9', '8', '2', '2015-07-31', '2610.00', null, null, '1', null, '2610.00');
INSERT INTO `planpagos` VALUES ('88', '9', '8', '2', '2015-08-31', '2610.00', null, null, '1', null, '2610.00');
INSERT INTO `planpagos` VALUES ('89', '9', '8', '2', '2015-09-30', '2610.00', null, null, '1', null, '2610.00');
INSERT INTO `planpagos` VALUES ('90', '9', '8', '2', '2015-10-31', '2610.00', null, null, '1', null, '2610.00');
INSERT INTO `planpagos` VALUES ('91', '9', '8', '2', '2015-11-30', '2610.00', null, null, '1', null, '2610.00');

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
  `cant_solicitud` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `estaciones_productos_fk` (`estacion_id`),
  KEY `grupos_productos_fk` (`grupo_id`),
  CONSTRAINT `estaciones_productos_fk` FOREIGN KEY (`estacion_id`) REFERENCES `estaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `grupos_productos_fk` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES ('1', '2', '1', 'Pilar', 'PIL-EC001', 'Publicidad en pilar circular. Publicidad Star.', '2610.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:22:38', '1', '0');
INSERT INTO `productos` VALUES ('2', '2', '1', 'Pilar', 'PIL-EC002', 'Publicidad en pilar circular. Publicidad Star.', '2610.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:23:32', '1', '0');
INSERT INTO `productos` VALUES ('3', '2', '1', 'Pilar', 'PIL-EC003', 'Publicidad en pilar circular. Publicidad Star.', '2610.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:24:30', '1', '0');
INSERT INTO `productos` VALUES ('4', '2', '1', 'Cartelera Luminosa', 'EC-CL001', 'Cartelera Luminosa. Publicidad Gold.', '5700.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:29:11', '1', '0');
INSERT INTO `productos` VALUES ('5', '2', '1', 'Cartelera Luminosa', 'EC-CL002', 'Cartelera Luminosa. Publicidad Premium.', '7600.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:30:49', '1', '0');
INSERT INTO `productos` VALUES ('6', '2', '1', 'Cartelera Luminosa', 'EC-CL003', 'Cartelera Luminosa. Publicidad Premium.', '7600.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:31:46', '1', '0');
INSERT INTO `productos` VALUES ('7', '2', '10', 'Cartelera Luminosa', 'PO-CL001', 'Cartelera Luminosa. Publicidad Star.', '1705.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:37:33', '1', '0');
INSERT INTO `productos` VALUES ('8', '2', '10', 'Cartelera Luminosa', 'PO-CL002', 'Cartelera Luminosa. Publicidad Star.', '1705.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:38:11', '1', '0');
INSERT INTO `productos` VALUES ('9', '2', '10', 'Cartelera Luminosa', 'PO-CL003', 'Cartelera Luminosa. Publicidad Star.', '2554.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:38:37', '1', '0');
INSERT INTO `productos` VALUES ('10', '2', '10', 'Cartelera Luminosa', 'PO-CL004', 'Cartelera Luminosa. Publicidad Star.', '2554.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:39:20', '1', '0');
INSERT INTO `productos` VALUES ('11', '2', '10', 'Cartelera Luminosa', 'PO-PIL001', 'Publicidad en Pilar 4 caras. Publicidad Star.', '7600.00', '1', 'Mensual', '1', '1', '643', '2015-06-26 10:40:23', '1', '0');
INSERT INTO `productos` VALUES ('12', '5', '3', 'Caseta comercial', 'C-A 3 ', 'Caseta comercial para la venta de helados.', '1392.00', '0', 'Mensual', '1', '1', '643', '2015-06-29 10:05:47', '1', '1');
INSERT INTO `productos` VALUES ('13', '5', '3', 'Caseta comercial', 'C-A 1 ', 'Caseta comercial para la venta de helados.', '1392.00', '0', 'Mensual', '1', '1', '643', '2015-06-29 10:08:39', '1', '0');
INSERT INTO `productos` VALUES ('14', '5', '3', 'Caseta comercial', 'C-A 2 ', 'Caseta comercial para la venta de helados.', '1392.00', '0', 'Mensual', '1', '1', '643', '2015-06-29 10:14:09', '1', '1');
INSERT INTO `productos` VALUES ('15', '3', '3', 'Caseta comercial', 'C-A  9', 'Caseta comercial para la venta de flores.', '1392.00', '0', 'Mensual', '1', '1', '643', '2015-07-21 19:22:17', '1', null);
INSERT INTO `productos` VALUES ('16', '3', '3', 'Caseta comercial', 'C-A  7', 'Caseta comercial para la venta de flores.', '1392.00', '0', 'Mensual', '1', '1', '643', '2015-07-21 19:23:17', '1', null);
INSERT INTO `productos` VALUES ('17', '3', '3', 'Caseta comercial', 'C-A  4', 'Caseta comercial para la venta de flores.', '1392.00', '0', 'Mensual', '1', '1', '643', '2015-07-21 19:29:12', '1', '1');
INSERT INTO `productos` VALUES ('18', '3', '3', 'Caseta comercial', 'C-A  8', 'Caseta comercial para la venta de flores.', '1392.00', '0', 'Mensual', '1', '1', '643', '2015-07-21 19:31:01', '1', '1');
INSERT INTO `productos` VALUES ('19', '3', '3', 'Caseta comercial', 'C-A  5', 'Caseta comercial para la venta de flores.', '1392.00', '1', 'Mensual', '1', '1', '643', '2015-07-21 19:36:37', '1', null);
INSERT INTO `productos` VALUES ('20', '3', '3', 'Caseta comercial', 'C-A  6', 'Caseta comercial para la venta de flores.', '1392.00', '1', 'Mensual', '1', '1', '643', '2015-07-21 19:36:46', '1', null);
INSERT INTO `productos` VALUES ('21', '2', '1', 'PILAR', 'PIL-EC003', 'Forrado del pilar con publicidad', '3480.00', '1', 'Mensual', '1', '1', '644', '2015-09-10 18:48:31', '1', '1');

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
-- Table structure for `solicitudes`
-- ----------------------------
DROP TABLE IF EXISTS `solicitudes`;
CREATE TABLE `solicitudes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nro_solicitud` varchar(50) NOT NULL,
  `fecha_envio_solicitud` date NOT NULL,
  `fecha_recepcion_solicitud` date NOT NULL,
  `productos_solicitud` varchar(250) DEFAULT NULL,
  `respuesta` varchar(20) DEFAULT NULL,
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
  `descripcion_solicitud` varchar(250) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';

-- ----------------------------
-- Records of solicitudes
-- ----------------------------
INSERT INTO `solicitudes` VALUES ('5', 'Ex/2014-02648', '2014-10-22', '2014-10-22', null, null, null, null, null, '2', '643', '2015-07-22 09:49:09', '0', '643', 'Aidee CarmiÃ±a Cori Sardon', 'Propietaria', 'Solicitud de un espacio comercial para la venta de flores en la EstaciÃ³n Ajayuni.', '1');
INSERT INTO `solicitudes` VALUES ('6', 'Ex/2014-02648', '2014-10-22', '2014-10-22', null, 'Aceptado', '2014-10-29', '1969-12-31', null, '2', '643', '2015-07-22 09:54:11', '1', '643', 'Aidee CarmiÃ±a Cori Sardon', 'Propietaria', 'Solicitud de un espacio comercial para la venta de flores en la EstaciÃ³n Ajayuni. ', '2');
INSERT INTO `solicitudes` VALUES ('7', '1', '2015-07-22', '2015-07-22', null, 'Aceptado', '2015-07-02', '2015-07-23', null, '2', '635', '2015-07-22 10:33:19', '0', '629', 'Marcos Tintaya', 'Gerente de banco mercantil', 'q', '2');
INSERT INTO `solicitudes` VALUES ('8', 'Ex/2014-02766', '2014-10-27', '2014-10-28', null, 'Aceptado', '2014-10-29', '2014-10-29', null, '7', '643', '2015-07-22 16:34:24', '1', '643', 'Carlos Vicente Cori Sardon', 'Propietario', 'Solicitud de un espacion comercial para la venta de flores en la EstaciÃ³n Ajayuni.', '2');
INSERT INTO `solicitudes` VALUES ('9', 'Ex/2014-02650', '2014-10-22', '2014-10-23', null, 'Aceptado', '2014-10-29', '1969-12-31', null, '3', '643', '2015-07-22 16:38:37', '1', '643', 'Maria Josefina Sardon de Cori', 'Propietaria', 'Solicitud de un espacion comercial para la venta de flores en la EstaciÃ³n Ajayuni.', '2');
INSERT INTO `solicitudes` VALUES ('10', 'Ex/2015-00428', '2015-01-27', '2015-01-27', null, 'Aceptado', '2015-03-02', '1969-12-31', null, '4', '643', '2015-07-22 16:40:21', '1', '643', 'Sofia Roque Choque', 'Propietaria', 'Solicitud de un espacion comercial para la venta de flores en la EstaciÃ³n Ajayuni.', '2');
INSERT INTO `solicitudes` VALUES ('11', 'Ex/2014-02887', '2014-11-04', '2014-11-04', null, 'Aceptado', '2015-03-02', '1969-12-31', null, '1', '643', '2015-07-22 16:41:46', '0', '643', 'Valery Cruz Cayabu', 'Propietaria', 'Solicitud de un espacion comercial para la venta de helados en la EstaciÃ³n Ajayuni.', '2');
INSERT INTO `solicitudes` VALUES ('12', 'Ex/2014-03029', '2014-11-08', '2014-11-10', null, 'Aceptado', '2014-11-19', '1969-12-31', null, '5', '643', '2015-07-22 16:46:00', '1', '643', 'Gabriel Ulo Artega', 'Propietario', 'Solicitud de un espacion comercial para la venta de helados en la EstaciÃ³n Ajayuni.', '2');
INSERT INTO `solicitudes` VALUES ('13', 'Ex/2015-00323', '2015-01-21', '2015-01-21', null, 'Aceptado', '2015-03-02', '1969-12-31', null, '6', '643', '2015-07-22 16:50:34', '1', '643', 'Tania Paola Ulo Costas', 'Propietaria', 'Solicitud de un espacion comercial para la venta de helados en la EstaciÃ³n Ajayuni.', '2');
INSERT INTO `solicitudes` VALUES ('14', 'Ex/2014-02887', '2014-11-04', '2014-11-04', null, 'Aceptado', '2015-03-02', '1969-12-31', null, '1', '643', '2015-07-23 10:00:52', '1', '643', 'Valery Cruz Cayabu', 'Propietaria', 'Solicitud de una caseta comercial para la venta de helado en la EstaciÃ³n Ajayuni.', '2');
INSERT INTO `solicitudes` VALUES ('15', 'MT/2014-03115', '2014-11-12', '2014-11-13', null, 'Aceptado', '2014-12-15', '2014-12-15', null, '9', '644', '2015-09-10 18:51:49', '1', '644', 'Edmundo Delgado', 'Gerente Regional', 'Solicitud espacio publicitario - Pilar', '2');

-- ----------------------------
-- Table structure for `solicitudesproductos`
-- ----------------------------
DROP TABLE IF EXISTS `solicitudesproductos`;
CREATE TABLE `solicitudesproductos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solicitud_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `tiempo` varchar(20) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `baja_logica` int(11) NOT NULL DEFAULT '1',
  `cantidad` int(11) NOT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `nro_dias` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `solicitudes_solicitudesproductos_fk` (`solicitud_id`),
  KEY `productos_solicitudesproductos_fk` (`producto_id`),
  CONSTRAINT `productos_solicitudesproductos_fk` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `solicitudes_solicitudesproductos_fk` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='utf8_general_ci';

-- ----------------------------
-- Records of solicitudesproductos
-- ----------------------------
INSERT INTO `solicitudesproductos` VALUES ('6', '7', '1', '2610.00', 'Mensual', null, null, '0', '1', null, null, '1');
INSERT INTO `solicitudesproductos` VALUES ('7', '13', '14', '1392.00', 'Mensual', null, null, '1', '1', null, null, '1');
INSERT INTO `solicitudesproductos` VALUES ('8', '9', '17', '1392.00', 'Mensual', null, null, '1', '1', null, null, '1');
INSERT INTO `solicitudesproductos` VALUES ('9', '10', '18', '1392.00', 'Mensual', null, null, '1', '1', null, null, '1');
INSERT INTO `solicitudesproductos` VALUES ('10', '12', '12', '1392.00', 'Mensual', null, null, '1', '1', null, null, '1');
INSERT INTO `solicitudesproductos` VALUES ('11', '15', '21', '3480.00', 'Mensual', null, null, '1', '1', null, null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of submenus
-- ----------------------------
INSERT INTO `submenus` VALUES ('1', '2', 'Lista de Productos', 'Lista de productos', '../productos', '1', '0');
INSERT INTO `submenus` VALUES ('2', '2', 'Lista de Clientes', 'Listado de clientes', '../clientes', '1', '0');
INSERT INTO `submenus` VALUES ('5', '2', 'Solicitudes', 'Listado de solicitudes', '../solicitudes', '1', '0');
INSERT INTO `submenus` VALUES ('44', '11', 'Normativas', 'PParametrizacion de normativas', '../normativas', '0', '0');
INSERT INTO `submenus` VALUES ('45', '5', 'Reporte 1', 'permite la creación de nuevos tipos de documentos', '../reporte', '1', '0');
INSERT INTO `submenus` VALUES ('46', '11', 'Horarios Laborales', 'Gesti&oacute;n de Horarios Laborales', '../horarioslaborales', '0', '0');
INSERT INTO `submenus` VALUES ('47', '11', 'Tolerancias de Ingreso', 'Gesti&oacute;n de Tolerancias de Ingreso', '../tolerancias', '0', '0');
INSERT INTO `submenus` VALUES ('48', '17', 'Busqueda Avanzada', 'Busqueda Avanzada', 'advanced', '0', null);
INSERT INTO `submenus` VALUES ('49', '13', 'Organigrama', 'Organigrama de su institución', 'organigrama', '0', null);
INSERT INTO `submenus` VALUES ('50', '4', 'Control Plan de Pagos', 'Control de plan de pagos', '../planpagos', '1', '0');
INSERT INTO `submenus` VALUES ('51', '18', 'Archivero central', 'Archivero central', null, '0', '2');
INSERT INTO `submenus` VALUES ('52', '3', 'Estaciones', 'Estaciones de la empresa', '../estaciones', '1', '1');
INSERT INTO `submenus` VALUES ('53', '11', 'Componentes', 'Parametrizacion de componentes', '../componentes', '0', '0');
INSERT INTO `submenus` VALUES ('54', '11', 'Fuente de Financiamiento', 'Parametrizacion fuentes de financiamiento', '../fuentefinanciamientos', '0', '0');
INSERT INTO `submenus` VALUES ('55', '11', 'Partidas', 'Parametrizacion partidas', '../partidas', '0', '0');
INSERT INTO `submenus` VALUES ('56', '3', 'Lineas', 'Lines de la la empresa', '../lineas', '1', '0');
INSERT INTO `submenus` VALUES ('57', '11', 'Niveles Estructurales', 'Parametrizacion de niveles estructurales', '../nivelestructurales', '0', '0');
INSERT INTO `submenus` VALUES ('58', '7', 'Facturacion', 'Facturas', '../facturas', '1', '0');
INSERT INTO `submenus` VALUES ('59', '11', 'Organigrama', 'Organigrama de la Entidad', '../organigramas', '0', '0');
INSERT INTO `submenus` VALUES ('60', '11', 'Resoluciones', 'Resoluciones Salariales', '../resoluciones', '0', '0');
INSERT INTO `submenus` VALUES ('61', '11', 'Escalas Salariales', 'Nivel salarial', '../nivelsalariales', '0', '0');
INSERT INTO `submenus` VALUES ('62', '11', 'Cargos', 'Cargos de la institucion', '../cargos', '0', '0');
INSERT INTO `submenus` VALUES ('63', '12', 'Gestion', 'Gestionar', 'index', '0', '0');
INSERT INTO `submenus` VALUES ('64', '12', 'Reportes', 'Reportar', 'index', '0', '0');
INSERT INTO `submenus` VALUES ('66', '5', 'Reporte 3', 'Permite realizar las altas, bajas y modificaciones de los nuevos tipos de documentos', '../reporte', '1', '0');
INSERT INTO `submenus` VALUES ('67', '7', 'Alertas', 'Alertas', '../facturas', '1', '0');
INSERT INTO `submenus` VALUES ('68', '14', 'Gesti&oacute;n Archivo', 'Permite gestionar el archivo personal', 'gestion', '0', null);
INSERT INTO `submenus` VALUES ('69', '14', 'Listado documentos', 'Genera una lista de documentos', 'listar', '0', null);
INSERT INTO `submenus` VALUES ('70', '4', 'Facturacion', 'Facturas', '../facturas', '1', '0');
INSERT INTO `submenus` VALUES ('71', '3', 'Grupos - Rubros', 'Grupos y rubros', '../grupos', '1', '0');
INSERT INTO `submenus` VALUES ('72', '11', 'Gesti&oacute;n Feriados', 'Gesti&oacute;n de asingnaci&oacute;n de feriados', '../feriados', '0', '0');
INSERT INTO `submenus` VALUES ('73', '11', 'Gesti&oacute;n Excepciones', 'Gesti&oacute;n Excepciones', '../excepciones', '0', '0');
INSERT INTO `submenus` VALUES ('74', '5', 'Reporte 2', 'Tipos de documentos que se solicitara al personal', '../reporte', '1', '0');
INSERT INTO `submenus` VALUES ('75', '4', 'Alertas', 'Alertas', '../alertas', '1', '0');
INSERT INTO `submenus` VALUES ('76', '4', 'Mora', 'Control de moras', '../moras', '1', '0');
INSERT INTO `submenus` VALUES ('77', '2', 'Informes', 'Listado de informes', '../informes', '1', '0');
INSERT INTO `submenus` VALUES ('78', '2', 'Contratos', 'Listado de contratos', '../contratos', '1', '0');
INSERT INTO `submenus` VALUES ('79', '3', 'Parametricas Check List', 'Parametriscas check list', '../parametroschecklists', '1', '0');

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
INSERT INTO `usuarios` VALUES ('629', 'gsanchez', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Gaby', 'GS', 'Jefe Dpto. Comercializacion', 'gsanchez@miteleferico.bo', '2', null, '1', '2', '1', null, '1', '1', '4021525', 'OR', null, '1', 'Sanchez', 'BolaÃ±os', null);
INSERT INTO `usuarios` VALUES ('635', 'fvelasco', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Luis Freddy', 'FV', 'Profesioanl en desarrollo de sistemas', 'fvelasco@miteleferico.bo', '492', null, '1', '2', '1', null, '1', '1', '4986493', 'LP', null, '1', 'Velasco', 'Poma', null);
INSERT INTO `usuarios` VALUES ('637', 'psalinas', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Pablo', 'PS', 'Gerente de Gestion Empresial', 'psalinas@miteleferico.bo', '6', null, '1', '2', '1', null, '1', '1', '4098897', 'LP', null, '1', 'Salinas', 'Burgos', null);
INSERT INTO `usuarios` VALUES ('640', 'spenaloza', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Sergio', 'PD', 'Profesional en Comercializacio Marketing y Ventas', 'spenaloza@miteleferico.bo', '2', null, '1', '2', '1', null, '1', '1', '4096997', 'LP', null, '1', 'PeÃ±aloza', 'Solares', null);
INSERT INTO `usuarios` VALUES ('641', 'jvera', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Juan Esteban', 'FBS', 'Profesional en Comercializacio Marketing y Ventas', 'jvera@miteleferico.bo', '3', null, '1', '2', '1', null, '1', '1', '4567788', 'LP', null, '1', 'Vera', 'Callau', null);
INSERT INTO `usuarios` VALUES ('643', 'adaza', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Ariana', 'EMV', 'Profesional en Comercializacio Marketing y Ventas', 'adaza@miteleferico.bo', '25', null, '1', '2', '1', null, '1', '1', '4567747', 'LP', null, '1', 'Daza', 'Goytia', null);
INSERT INTO `usuarios` VALUES ('644', 'cvidaurre', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Carla', 'MLY', 'Profesional en Comercializacio Marketing y Ventas', 'cvidaurre@miteleferico.bo', '5', null, '1', '2', '1', null, '1', '1', '4557897', 'LP', null, '1', 'Vidaurre', 'Caballero', null);
INSERT INTO `usuarios` VALUES ('645', 'jtinini', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Juan', 'JT', 'Responsable de Contabilidad', 'jloza@miteleferico.bo', '1', null, '1', '4', '1', null, '1', '1', '4985549', 'LP', null, '1', 'Tinini', 'Tinini', null);
INSERT INTO `usuarios` VALUES ('646', 'saruquipa', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Sonia', 'SA', 'Profesional en comercializacion', 'saruquipa@miteleferico.bo', '7', '0', '1', '2', '1', '0', '1', '1', '420625', 'LP', null, '1', 'Aruquipa', 'Quispesala', null);
INSERT INTO `usuarios` VALUES ('647', 'pburgos', '0', '1', '1', 'b6c56905f53fbea5b1acb6f28d4e8d61940b7c99c80b5e765e9762fc069f13f9', 'Pamela', 'PB', 'Consultor en Desarrollo, Penetracion y Mantenimiento de Mercado', 'pburgos@miteleferico.bo', '2', '2015', '1', '2', '1', '0', '1', '1', '5817699', 'LP', null, '1', 'Burgos', 'Chungara', null);

-- ----------------------------
-- Function structure for `migrarChecklist`
-- ----------------------------
DROP FUNCTION IF EXISTS `migrarChecklist`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `migrarChecklist`(c_id INT,c_id_migrar INT) RETURNS int(11)
BEGIN
        -- DECLARE factorial INT;
        
-- SELECT * FROM checklists WHERE contrato_id = 8

DELETE FROM checklists WHERE contrato_id = c_id;
INSERT INTO checklists (contrato_id,parametro_id,tipo_empresa,parametro,cumple,observacion,usuario_reg,fecha_reg,baja_logica)
SELECT c_id,cl.parametro_id,cl.tipo_empresa,cl.parametro,cl.cumple,cl.observacion,cl.usuario_reg,NOW(),cl.baja_logica FROM checklists cl WHERE cl.contrato_id = c_id_migrar AND cl.baja_logica =1;

-- SELECT * FROM checklistsarchivos WHERE contrato_id = 8

DELETE FROM checklistsarchivos WHERE contrato_id = c_id;
INSERT INTO checklistsarchivos (parametro_id,archivo_id,estado,contrato_id)
SELECT parametro_id,archivo_id,estado,c_id FROM checklistsarchivos cka WHERE cka.contrato_id=c_id_migrar;
        -- Retornamos en el factorial
        RETURN 1;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `prueba`
-- ----------------------------
DROP FUNCTION IF EXISTS `prueba`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `prueba`() RETURNS int(11)
BEGIN
	#Routine body goes here...

	RETURN 1;
END
;;
DELIMITER ;
