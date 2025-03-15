CREATE DATABASE  IF NOT EXISTS `aseguradora` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aseguradora`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: aseguradora
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agentes`
--

DROP TABLE IF EXISTS `agentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agentes` (
  `agente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `num_empleado` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `es_activo` tinyint(1) DEFAULT '1',
  `oficina_id` int DEFAULT NULL,
  `nivel_comision` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`agente_id`),
  UNIQUE KEY `num_empleado` (`num_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentes`
--

LOCK TABLES `agentes` WRITE;
/*!40000 ALTER TABLE `agentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `agentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajustadores`
--

DROP TABLE IF EXISTS `ajustadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ajustadores` (
  `ajustador_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `num_empleado` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `zona_cobertura` varchar(100) DEFAULT NULL,
  `es_activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ajustador_id`),
  UNIQUE KEY `num_empleado` (`num_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajustadores`
--

LOCK TABLES `ajustadores` WRITE;
/*!40000 ALTER TABLE `ajustadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajustadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) DEFAULT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `num_documento` varchar(20) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT 'México',
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado_civil` varchar(20) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `es_activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `num_documento` (`num_documento`),
  UNIQUE KEY `tipo_documento` (`tipo_documento`,`num_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coberturas`
--

DROP TABLE IF EXISTS `coberturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coberturas` (
  `cobertura_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `es_obligatoria` tinyint(1) DEFAULT '0',
  `suma_asegurada_minima` decimal(12,2) DEFAULT NULL,
  `suma_asegurada_maxima` decimal(12,2) DEFAULT NULL,
  `deducible_porcentaje` decimal(5,2) DEFAULT NULL,
  `es_activa` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`cobertura_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coberturas`
--

LOCK TABLES `coberturas` WRITE;
/*!40000 ALTER TABLE `coberturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `coberturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comisiones`
--

DROP TABLE IF EXISTS `comisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comisiones` (
  `comision_id` int NOT NULL AUTO_INCREMENT,
  `agente_id` int NOT NULL,
  `poliza_id` int NOT NULL,
  `monto_comision` decimal(10,2) NOT NULL,
  `porcentaje_comision` decimal(5,2) NOT NULL,
  `fecha_calculo` datetime NOT NULL,
  `estado` varchar(20) DEFAULT 'Pendiente',
  `fecha_pago` datetime DEFAULT NULL,
  PRIMARY KEY (`comision_id`),
  KEY `agente_id` (`agente_id`),
  KEY `poliza_id` (`poliza_id`),
  CONSTRAINT `comisiones_ibfk_1` FOREIGN KEY (`agente_id`) REFERENCES `agentes` (`agente_id`),
  CONSTRAINT `comisiones_ibfk_2` FOREIGN KEY (`poliza_id`) REFERENCES `polizas` (`poliza_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comisiones`
--

LOCK TABLES `comisiones` WRITE;
/*!40000 ALTER TABLE `comisiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `comisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuraciones_tarifas`
--

DROP TABLE IF EXISTS `configuraciones_tarifas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuraciones_tarifas` (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `tipo_vehiculo` varchar(50) NOT NULL,
  `anio_min` int DEFAULT NULL,
  `anio_max` int DEFAULT NULL,
  `valor_min` decimal(12,2) DEFAULT NULL,
  `valor_max` decimal(12,2) DEFAULT NULL,
  `factor_riesgo` decimal(5,2) NOT NULL,
  `fecha_inicio_vigencia` date NOT NULL,
  `fecha_fin_vigencia` date DEFAULT NULL,
  `es_activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuraciones_tarifas`
--

LOCK TABLES `configuraciones_tarifas` WRITE;
/*!40000 ALTER TABLE `configuraciones_tarifas` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuraciones_tarifas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizaciones` (
  `cotizacion_id` int NOT NULL AUTO_INCREMENT,
  `num_cotizacion` varchar(20) NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `agente_id` int DEFAULT NULL,
  `fecha_cotizacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_vigencia` datetime DEFAULT NULL,
  `marca_vehiculo` varchar(50) NOT NULL,
  `modelo_vehiculo` varchar(50) NOT NULL,
  `anio_vehiculo` int NOT NULL,
  `valor_vehiculo` decimal(12,2) NOT NULL,
  `prima_total` decimal(10,2) NOT NULL,
  `estado` varchar(20) DEFAULT 'Pendiente',
  `convertida_poliza` tinyint(1) DEFAULT '0',
  `poliza_id` int DEFAULT NULL,
  PRIMARY KEY (`cotizacion_id`),
  UNIQUE KEY `num_cotizacion` (`num_cotizacion`),
  KEY `cliente_id` (`cliente_id`),
  KEY `agente_id` (`agente_id`),
  KEY `poliza_id` (`poliza_id`),
  CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `cotizaciones_ibfk_2` FOREIGN KEY (`agente_id`) REFERENCES `agentes` (`agente_id`),
  CONSTRAINT `cotizaciones_ibfk_3` FOREIGN KEY (`poliza_id`) REFERENCES `polizas` (`poliza_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizaciones`
--

LOCK TABLES `cotizaciones` WRITE;
/*!40000 ALTER TABLE `cotizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentos` (
  `documento_id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `tipo_documento` varchar(50) NOT NULL,
  `url_archivo` varchar(255) NOT NULL,
  `fecha_subida` datetime DEFAULT CURRENT_TIMESTAMP,
  `entidad_tipo` varchar(50) NOT NULL,
  `entidad_id` int NOT NULL,
  `notas` text,
  `es_activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`documento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_modificaciones`
--

DROP TABLE IF EXISTS `historial_modificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_modificaciones` (
  `modificacion_id` int NOT NULL AUTO_INCREMENT,
  `entidad_tipo` varchar(50) NOT NULL,
  `entidad_id` int NOT NULL,
  `campo_modificado` varchar(50) NOT NULL,
  `valor_anterior` text,
  `valor_nuevo` text,
  `usuario_id` int DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `motivo` text,
  PRIMARY KEY (`modificacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_modificaciones`
--

LOCK TABLES `historial_modificaciones` WRITE;
/*!40000 ALTER TABLE `historial_modificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_modificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `pago_id` int NOT NULL AUTO_INCREMENT,
  `poliza_id` int NOT NULL,
  `num_referencia` varchar(50) DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `metodo_pago` varchar(30) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'Completado',
  `comprobante_url` varchar(255) DEFAULT NULL,
  `factura_id` int DEFAULT NULL,
  PRIMARY KEY (`pago_id`),
  UNIQUE KEY `num_referencia` (`num_referencia`),
  KEY `poliza_id` (`poliza_id`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`poliza_id`) REFERENCES `polizas` (`poliza_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poliza_coberturas`
--

DROP TABLE IF EXISTS `poliza_coberturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poliza_coberturas` (
  `poliza_cobertura_id` int NOT NULL AUTO_INCREMENT,
  `poliza_id` int NOT NULL,
  `cobertura_id` int NOT NULL,
  `suma_asegurada` decimal(12,2) NOT NULL,
  `deducible` decimal(10,2) DEFAULT NULL,
  `prima` decimal(10,2) NOT NULL,
  `es_activa` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`poliza_cobertura_id`),
  UNIQUE KEY `poliza_id` (`poliza_id`,`cobertura_id`),
  KEY `cobertura_id` (`cobertura_id`),
  CONSTRAINT `poliza_coberturas_ibfk_1` FOREIGN KEY (`poliza_id`) REFERENCES `polizas` (`poliza_id`),
  CONSTRAINT `poliza_coberturas_ibfk_2` FOREIGN KEY (`cobertura_id`) REFERENCES `coberturas` (`cobertura_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poliza_coberturas`
--

LOCK TABLES `poliza_coberturas` WRITE;
/*!40000 ALTER TABLE `poliza_coberturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `poliza_coberturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polizas`
--

DROP TABLE IF EXISTS `polizas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polizas` (
  `poliza_id` int NOT NULL AUTO_INCREMENT,
  `num_poliza` varchar(20) NOT NULL,
  `cliente_id` int NOT NULL,
  `vehiculo_id` int NOT NULL,
  `agente_id` int DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` varchar(20) DEFAULT 'Vigente',
  `prima_total` decimal(12,2) NOT NULL,
  `forma_pago` varchar(20) DEFAULT NULL,
  `frecuencia_pago` varchar(20) DEFAULT NULL,
  `notas` text,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `ultima_modificacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`poliza_id`),
  UNIQUE KEY `num_poliza` (`num_poliza`),
  KEY `cliente_id` (`cliente_id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `agente_id` (`agente_id`),
  CONSTRAINT `polizas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
  CONSTRAINT `polizas_ibfk_2` FOREIGN KEY (`vehiculo_id`) REFERENCES `vehiculos` (`vehiculo_id`),
  CONSTRAINT `polizas_ibfk_3` FOREIGN KEY (`agente_id`) REFERENCES `agentes` (`agente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polizas`
--

LOCK TABLES `polizas` WRITE;
/*!40000 ALTER TABLE `polizas` DISABLE KEYS */;
/*!40000 ALTER TABLE `polizas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamaciones`
--

DROP TABLE IF EXISTS `reclamaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamaciones` (
  `reclamacion_id` int NOT NULL AUTO_INCREMENT,
  `siniestro_id` int NOT NULL,
  `tipo_reclamacion` varchar(50) NOT NULL,
  `descripcion` text,
  `monto_reclamado` decimal(12,2) NOT NULL,
  `monto_aprobado` decimal(12,2) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'Pendiente',
  `fecha_reclamacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_resolucion` datetime DEFAULT NULL,
  PRIMARY KEY (`reclamacion_id`),
  KEY `siniestro_id` (`siniestro_id`),
  CONSTRAINT `reclamaciones_ibfk_1` FOREIGN KEY (`siniestro_id`) REFERENCES `siniestros` (`siniestro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamaciones`
--

LOCK TABLES `reclamaciones` WRITE;
/*!40000 ALTER TABLE `reclamaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `reclamaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siniestros`
--

DROP TABLE IF EXISTS `siniestros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siniestros` (
  `siniestro_id` int NOT NULL AUTO_INCREMENT,
  `num_siniestro` varchar(20) NOT NULL,
  `poliza_id` int NOT NULL,
  `fecha_siniestro` datetime NOT NULL,
  `fecha_reporte` datetime NOT NULL,
  `ubicacion_siniestro` varchar(200) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `estado` varchar(20) DEFAULT 'Reportado',
  `ajustador_id` int DEFAULT NULL,
  `taller_id` int DEFAULT NULL,
  `monto_estimado` decimal(12,2) DEFAULT NULL,
  `monto_pagado` decimal(12,2) DEFAULT NULL,
  `deducible_cobrado` decimal(10,2) DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  PRIMARY KEY (`siniestro_id`),
  UNIQUE KEY `num_siniestro` (`num_siniestro`),
  KEY `poliza_id` (`poliza_id`),
  KEY `ajustador_id` (`ajustador_id`),
  KEY `taller_id` (`taller_id`),
  CONSTRAINT `siniestros_ibfk_1` FOREIGN KEY (`poliza_id`) REFERENCES `polizas` (`poliza_id`),
  CONSTRAINT `siniestros_ibfk_2` FOREIGN KEY (`ajustador_id`) REFERENCES `ajustadores` (`ajustador_id`),
  CONSTRAINT `siniestros_ibfk_3` FOREIGN KEY (`taller_id`) REFERENCES `talleres` (`taller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siniestros`
--

LOCK TABLES `siniestros` WRITE;
/*!40000 ALTER TABLE `siniestros` DISABLE KEYS */;
/*!40000 ALTER TABLE `siniestros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talleres`
--

DROP TABLE IF EXISTS `talleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talleres` (
  `taller_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contacto_nombre` varchar(100) DEFAULT NULL,
  `es_preferente` tinyint(1) DEFAULT '0',
  `categoria` varchar(20) DEFAULT NULL,
  `es_activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`taller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talleres`
--

LOCK TABLES `talleres` WRITE;
/*!40000 ALTER TABLE `talleres` DISABLE KEYS */;
/*!40000 ALTER TABLE `talleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `vehiculo_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `anio` int NOT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `num_serie` varchar(50) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `tipo_vehiculo` varchar(30) DEFAULT NULL,
  `uso` varchar(30) DEFAULT NULL,
  `kilometraje` int DEFAULT NULL,
  `valor_comercial` decimal(12,2) DEFAULT NULL,
  `es_financiado` tinyint(1) DEFAULT '0',
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vehiculo_id`),
  UNIQUE KEY `placa` (`placa`),
  UNIQUE KEY `num_serie` (`num_serie`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-14 21:27:56
