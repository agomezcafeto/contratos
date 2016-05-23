-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: contratos_db
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `contratantes`
--

DROP TABLE IF EXISTS `contratantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratantes` (
  `id_contratante` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_contratante` varchar(45) NOT NULL,
  `direccion_contratante` varchar(45) NOT NULL,
  `id_representante_legal` int(11) NOT NULL,
  PRIMARY KEY (`id_contratante`),
  KEY `fk_representante_legal_idx` (`id_representante_legal`),
  CONSTRAINT `fk_representante_legal` FOREIGN KEY (`id_representante_legal`) REFERENCES `reperesentantes_legales` (`id_represntante_legal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratantes`
--

LOCK TABLES `contratantes` WRITE;
/*!40000 ALTER TABLE `contratantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratistas`
--

DROP TABLE IF EXISTS `contratistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratistas` (
  `id_contratista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_contratista` varchar(45) NOT NULL,
  `direccion_contratista` varchar(45) NOT NULL,
  `email_contratista` varchar(45) NOT NULL,
  `telefono_contratista` varchar(45) NOT NULL,
  `id_tipo_contratista` int(11) NOT NULL,
  PRIMARY KEY (`id_contratista`),
  KEY `fk_tipo_contratista_idx` (`id_tipo_contratista`),
  CONSTRAINT `fk_tipo_contratista` FOREIGN KEY (`id_tipo_contratista`) REFERENCES `tipo_contratistas` (`id_tipo_contratista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratistas`
--

LOCK TABLES `contratistas` WRITE;
/*!40000 ALTER TABLE `contratistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratos` (
  `id_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_contrato` varchar(45) NOT NULL,
  `valor_contrato` double NOT NULL,
  `objeto_contrato` varchar(45) NOT NULL,
  `fecha_inicio_contrato` datetime NOT NULL,
  `fecha_final_contrato` datetime NOT NULL,
  `actividades_contrato` varchar(45) NOT NULL,
  `id_tipo_contrato` int(11) NOT NULL,
  `id_contratante` int(11) NOT NULL,
  `id_contratista` int(11) NOT NULL,
  `id_estado_contrato` int(11) NOT NULL,
  PRIMARY KEY (`id_contrato`,`valor_contrato`),
  KEY `test_idx` (`usuario_contrato`),
  KEY `fk_tipo_contrato_idx` (`id_tipo_contrato`),
  KEY `fk_contratante_idx` (`id_contratante`),
  KEY `fk_contratista_idx` (`id_contratista`),
  KEY `fk_estado_contrato_idx` (`id_estado_contrato`),
  CONSTRAINT `fk_contratante` FOREIGN KEY (`id_contratante`) REFERENCES `contratantes` (`id_contratante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratista` FOREIGN KEY (`id_contratista`) REFERENCES `contratistas` (`id_contratista`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado_contrato` FOREIGN KEY (`id_estado_contrato`) REFERENCES `estado_contratos` (`id_estado_contrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_contrato` FOREIGN KEY (`id_tipo_contrato`) REFERENCES `tipo_contratos` (`id_tipo_contrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_contrato` FOREIGN KEY (`usuario_contrato`) REFERENCES `usuarios` (`nombre_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencias`
--

DROP TABLE IF EXISTS `dependencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencias` (
  `id_dependencia` int(11) NOT NULL,
  `nombre_dependencia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dependencia`),
  CONSTRAINT `test` FOREIGN KEY (`id_dependencia`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencias`
--

LOCK TABLES `dependencias` WRITE;
/*!40000 ALTER TABLE `dependencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_contratos`
--

DROP TABLE IF EXISTS `estado_contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_contratos` (
  `id_estado_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_contratos`
--

LOCK TABLES `estado_contratos` WRITE;
/*!40000 ALTER TABLE `estado_contratos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reperesentantes_legales`
--

DROP TABLE IF EXISTS `reperesentantes_legales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reperesentantes_legales` (
  `id_represntante_legal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_representante_legal` varchar(45) NOT NULL,
  `direccion_reperesentante_legal` varchar(45) NOT NULL,
  `profesion_reperesentante_legal` varchar(45) NOT NULL,
  `email_reperesentante_legal` varchar(45) NOT NULL,
  PRIMARY KEY (`id_represntante_legal`),
  UNIQUE KEY `id_represntante_legal_UNIQUE` (`id_represntante_legal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reperesentantes_legales`
--

LOCK TABLES `reperesentantes_legales` WRITE;
/*!40000 ALTER TABLE `reperesentantes_legales` DISABLE KEYS */;
/*!40000 ALTER TABLE `reperesentantes_legales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_usuarios` (
  `id_rol_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(45) NOT NULL,
  `nombre_rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_rol_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
INSERT INTO `roles_usuarios` VALUES (1,'agomez','ROLE_ADMIN'),(2,'agomezcafeto','ROLE_USER'),(3,'test','ROLE_USER');
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contratistas`
--

DROP TABLE IF EXISTS `tipo_contratistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_contratistas` (
  `id_tipo_contratista` int(11) NOT NULL,
  `nombre_tipo_contratista` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_contratista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contratistas`
--

LOCK TABLES `tipo_contratistas` WRITE;
/*!40000 ALTER TABLE `tipo_contratistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_contratistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contratos`
--

DROP TABLE IF EXISTS `tipo_contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_contratos` (
  `id_tipo_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_contrato` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contratos`
--

LOCK TABLES `tipo_contratos` WRITE;
/*!40000 ALTER TABLE `tipo_contratos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `estado` int(4) NOT NULL DEFAULT '1',
  `id_dependencia` int(64) DEFAULT NULL,
  PRIMARY KEY (`id_usuarios`),
  UNIQUE KEY `nombre_usuario_UNIQUE` (`nombre_usuario`),
  UNIQUE KEY `id_usuarios_UNIQUE` (`id_usuarios`),
  KEY `dependencia_FK_idx` (`id_dependencia`),
  CONSTRAINT `dependencia_FK` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencias` (`id_dependencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'agomez','12345',1,NULL),(2,'agomezcafeto','12345',1,NULL),(3,'test','andres123',1,NULL),(4,'tre','andres123',1,NULL),(5,'agomezcafeto12','andres123',1,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_roles`
--

DROP TABLE IF EXISTS `usuarios_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_roles` (
  `userRolId` int(11) NOT NULL,
  `rol` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userRolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_roles`
--

LOCK TABLES `usuarios_roles` WRITE;
/*!40000 ALTER TABLE `usuarios_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-22 21:25:36
