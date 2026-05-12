-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_seguro` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto_extraido` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `json_claude` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_importacion` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `errores_importacion`
--

DROP TABLE IF EXISTS `errores_importacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `errores_importacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `mensaje_error` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `errores_importacion_id_documento_fkey` (`id_documento`),
  CONSTRAINT `errores_importacion_id_documento_fkey` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_accesorios`
--

DROP TABLE IF EXISTS `seguro_auto_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_accesorios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `valor` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_accesorios_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_asegurado`
--

DROP TABLE IF EXISTS `seguro_auto_asegurado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_asegurado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `nombre` longtext COLLATE utf8mb4_unicode_ci,
  `nif` longtext COLLATE utf8mb4_unicode_ci,
  `direccion` longtext COLLATE utf8mb4_unicode_ci,
  `codigo_postal` longtext COLLATE utf8mb4_unicode_ci,
  `poblacion` longtext COLLATE utf8mb4_unicode_ci,
  `provincia` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_asegurado_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_asegurador`
--

DROP TABLE IF EXISTS `seguro_auto_asegurador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_asegurador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `nombre` longtext COLLATE utf8mb4_unicode_ci,
  `cif` longtext COLLATE utf8mb4_unicode_ci,
  `direccion` longtext COLLATE utf8mb4_unicode_ci,
  `codigo_postal` longtext COLLATE utf8mb4_unicode_ci,
  `localidad` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_asegurador_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_asistencia_viaje`
--

DROP TABLE IF EXISTS `seguro_auto_asistencia_viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_asistencia_viaje` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `servicio` longtext COLLATE utf8mb4_unicode_ci,
  `cobertura` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_asistencia_viaje_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_campos_detectados`
--

DROP TABLE IF EXISTS `seguro_auto_campos_detectados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_campos_detectados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `etiqueta` longtext COLLATE utf8mb4_unicode_ci,
  `valor` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_campos_detectados_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_centro_reale`
--

DROP TABLE IF EXISTS `seguro_auto_centro_reale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_centro_reale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `codigo` longtext COLLATE utf8mb4_unicode_ci,
  `nombre` longtext COLLATE utf8mb4_unicode_ci,
  `direccion` longtext COLLATE utf8mb4_unicode_ci,
  `codigo_postal` longtext COLLATE utf8mb4_unicode_ci,
  `localidad` longtext COLLATE utf8mb4_unicode_ci,
  `telefono` longtext COLLATE utf8mb4_unicode_ci,
  `fax` longtext COLLATE utf8mb4_unicode_ci,
  `email` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_centro_reale_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_coberturas`
--

DROP TABLE IF EXISTS `seguro_auto_coberturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_coberturas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `tipo` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `limite` longtext COLLATE utf8mb4_unicode_ci,
  `incluye_danos_corporales` longtext COLLATE utf8mb4_unicode_ci,
  `incluye_danos_materiales` longtext COLLATE utf8mb4_unicode_ci,
  `nombre` longtext COLLATE utf8mb4_unicode_ci,
  `incluye` longtext COLLATE utf8mb4_unicode_ci,
  `condicion` longtext COLLATE utf8mb4_unicode_ci,
  `alcance` longtext COLLATE utf8mb4_unicode_ci,
  `comunicacion` longtext COLLATE utf8mb4_unicode_ci,
  `materiales` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_coberturas_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_conductores`
--

DROP TABLE IF EXISTS `seguro_auto_conductores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_conductores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `tipo` longtext COLLATE utf8mb4_unicode_ci,
  `nombre` longtext COLLATE utf8mb4_unicode_ci,
  `nif` longtext COLLATE utf8mb4_unicode_ci,
  `fecha_nacimiento` longtext COLLATE utf8mb4_unicode_ci,
  `sexo` longtext COLLATE utf8mb4_unicode_ci,
  `estado_civil` longtext COLLATE utf8mb4_unicode_ci,
  `fecha_carnet` longtext COLLATE utf8mb4_unicode_ci,
  `puntos_carnet` longtext COLLATE utf8mb4_unicode_ci,
  `codigo_postal` longtext COLLATE utf8mb4_unicode_ci,
  `actividad_profesional` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_conductores_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_definiciones_contractuales`
--

DROP TABLE IF EXISTS `seguro_auto_definiciones_contractuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_definiciones_contractuales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `termino` longtext COLLATE utf8mb4_unicode_ci,
  `definicion` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_definiciones_contractuales_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_definiciones_tecnicas`
--

DROP TABLE IF EXISTS `seguro_auto_definiciones_tecnicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_definiciones_tecnicas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `termino` longtext COLLATE utf8mb4_unicode_ci,
  `definicion` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_definiciones_tecnicas_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_definiciones_vehiculo`
--

DROP TABLE IF EXISTS `seguro_auto_definiciones_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_definiciones_vehiculo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `termino` longtext COLLATE utf8mb4_unicode_ci,
  `definicion` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_definiciones_vehiculo_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_derechos_asegurado`
--

DROP TABLE IF EXISTS `seguro_auto_derechos_asegurado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_derechos_asegurado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `derecho` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `limite_gastos` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_derechos_asegurado_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_documento`
--

DROP TABLE IF EXISTS `seguro_auto_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_documento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `numero_paginas` longtext COLLATE utf8mb4_unicode_ci,
  `tipo_documento` longtext COLLATE utf8mb4_unicode_ci,
  `estado` longtext COLLATE utf8mb4_unicode_ci,
  `logalty_guid` longtext COLLATE utf8mb4_unicode_ci,
  `fecha_documento` longtext COLLATE utf8mb4_unicode_ci,
  `paginas_totales` longtext COLLATE utf8mb4_unicode_ci,
  `paginas` longtext COLLATE utf8mb4_unicode_ci,
  `guid_logalty` longtext COLLATE utf8mb4_unicode_ci,
  `hora_documento` longtext COLLATE utf8mb4_unicode_ci,
  `total_paginas` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_documento_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_domicilio_cobro`
--

DROP TABLE IF EXISTS `seguro_auto_domicilio_cobro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_domicilio_cobro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `entidad` longtext COLLATE utf8mb4_unicode_ci,
  `iban` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_domicilio_cobro_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_domicilio_pago`
--

DROP TABLE IF EXISTS `seguro_auto_domicilio_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_domicilio_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `entidad` longtext COLLATE utf8mb4_unicode_ci,
  `iban` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_domicilio_pago_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_estados_convenio`
--

DROP TABLE IF EXISTS `seguro_auto_estados_convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_estados_convenio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `valor` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_estados_convenio_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_exclusiones`
--

DROP TABLE IF EXISTS `seguro_auto_exclusiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_exclusiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `cobertura` longtext COLLATE utf8mb4_unicode_ci,
  `exclusiones` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_exclusiones_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_exclusiones_incendio`
--

DROP TABLE IF EXISTS `seguro_auto_exclusiones_incendio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_exclusiones_incendio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `tipo` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_exclusiones_incendio_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_exclusiones_responsabilidad_civil`
--

DROP TABLE IF EXISTS `seguro_auto_exclusiones_responsabilidad_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_exclusiones_responsabilidad_civil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `tipo` longtext COLLATE utf8mb4_unicode_ci,
  `condicion` longtext COLLATE utf8mb4_unicode_ci,
  `exencion` longtext COLLATE utf8mb4_unicode_ci,
  `nota` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_exclusiones_responsabilidad_civil_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_exclusiones_rotura_lunas`
--

DROP TABLE IF EXISTS `seguro_auto_exclusiones_rotura_lunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_exclusiones_rotura_lunas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `tipo` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_exclusiones_rotura_lunas_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_garantias`
--

DROP TABLE IF EXISTS `seguro_auto_garantias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_garantias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `nombre` longtext COLLATE utf8mb4_unicode_ci,
  `capital` longtext COLLATE utf8mb4_unicode_ci,
  `tipo` longtext COLLATE utf8mb4_unicode_ci,
  `limite` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_garantias_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_garantias_adicionales`
--

DROP TABLE IF EXISTS `seguro_auto_garantias_adicionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_garantias_adicionales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `nombre` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `condicion` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_garantias_adicionales_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_historial_seguros`
--

DROP TABLE IF EXISTS `seguro_auto_historial_seguros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_historial_seguros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `compania_anterior` longtext COLLATE utf8mb4_unicode_ci,
  `poliza_anterior` longtext COLLATE utf8mb4_unicode_ci,
  `anos_compania_anterior` longtext COLLATE utf8mb4_unicode_ci,
  `siniestros_historial` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_historial_seguros_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_mediador`
--

DROP TABLE IF EXISTS `seguro_auto_mediador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_mediador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `codigo` longtext COLLATE utf8mb4_unicode_ci,
  `tipo` longtext COLLATE utf8mb4_unicode_ci,
  `nombre` longtext COLLATE utf8mb4_unicode_ci,
  `direccion` longtext COLLATE utf8mb4_unicode_ci,
  `codigo_postal` longtext COLLATE utf8mb4_unicode_ci,
  `localidad` longtext COLLATE utf8mb4_unicode_ci,
  `telefono` longtext COLLATE utf8mb4_unicode_ci,
  `email` longtext COLLATE utf8mb4_unicode_ci,
  `poblacion` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_mediador_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_normas_prima`
--

DROP TABLE IF EXISTS `seguro_auto_normas_prima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_normas_prima` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `concepto` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_normas_prima_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_obligaciones_asegurado`
--

DROP TABLE IF EXISTS `seguro_auto_obligaciones_asegurado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_obligaciones_asegurado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `obligacion` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `plazo` longtext COLLATE utf8mb4_unicode_ci,
  `incluye` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_obligaciones_asegurado_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_obligaciones_comunicacion`
--

DROP TABLE IF EXISTS `seguro_auto_obligaciones_comunicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_obligaciones_comunicacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `tipo` longtext COLLATE utf8mb4_unicode_ci,
  `plazo` longtext COLLATE utf8mb4_unicode_ci,
  `consecuencia` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_obligaciones_comunicacion_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_oficina_emisora`
--

DROP TABLE IF EXISTS `seguro_auto_oficina_emisora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_oficina_emisora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `nombre` longtext COLLATE utf8mb4_unicode_ci,
  `direccion` longtext COLLATE utf8mb4_unicode_ci,
  `codigo_postal` longtext COLLATE utf8mb4_unicode_ci,
  `poblacion` longtext COLLATE utf8mb4_unicode_ci,
  `provincia` longtext COLLATE utf8mb4_unicode_ci,
  `telefono` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_oficina_emisora_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_plazos_prescripcion`
--

DROP TABLE IF EXISTS `seguro_auto_plazos_prescripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_plazos_prescripcion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `tipo` longtext COLLATE utf8mb4_unicode_ci,
  `plazo` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_plazos_prescripcion_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_poliza`
--

DROP TABLE IF EXISTS `seguro_auto_poliza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_poliza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `numero_poliza` longtext COLLATE utf8mb4_unicode_ci,
  `fecha_efecto` longtext COLLATE utf8mb4_unicode_ci,
  `fecha_vencimiento` longtext COLLATE utf8mb4_unicode_ci,
  `duracion` longtext COLLATE utf8mb4_unicode_ci,
  `forma_pago` longtext COLLATE utf8mb4_unicode_ci,
  `prima_anual` longtext COLLATE utf8mb4_unicode_ci,
  `consorcio` longtext COLLATE utf8mb4_unicode_ci,
  `dgs` longtext COLLATE utf8mb4_unicode_ci,
  `impuestos` longtext COLLATE utf8mb4_unicode_ci,
  `total_recibo` longtext COLLATE utf8mb4_unicode_ci,
  `periodo_cobertura` longtext COLLATE utf8mb4_unicode_ci,
  `compania` longtext COLLATE utf8mb4_unicode_ci,
  `nif_compania` longtext COLLATE utf8mb4_unicode_ci,
  `tipo_documento` longtext COLLATE utf8mb4_unicode_ci,
  `ambito_territorial` longtext COLLATE utf8mb4_unicode_ci,
  `prorroga` longtext COLLATE utf8mb4_unicode_ci,
  `plazo_oposicion_tomador` longtext COLLATE utf8mb4_unicode_ci,
  `plazo_oposicion_asegurador` longtext COLLATE utf8mb4_unicode_ci,
  `modalidad` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_poliza_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_proceso_indemnizacion`
--

DROP TABLE IF EXISTS `seguro_auto_proceso_indemnizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_proceso_indemnizacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `concepto` longtext COLLATE utf8mb4_unicode_ci,
  `plazo` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_proceso_indemnizacion_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_recibo`
--

DROP TABLE IF EXISTS `seguro_auto_recibo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_recibo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `numero_recibo` longtext COLLATE utf8mb4_unicode_ci,
  `periodo_desde` longtext COLLATE utf8mb4_unicode_ci,
  `periodo_hasta` longtext COLLATE utf8mb4_unicode_ci,
  `prima_neta` longtext COLLATE utf8mb4_unicode_ci,
  `consorcio` longtext COLLATE utf8mb4_unicode_ci,
  `impuestos` longtext COLLATE utf8mb4_unicode_ci,
  `prima_total` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_recibo_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_servicios_asegurador`
--

DROP TABLE IF EXISTS `seguro_auto_servicios_asegurador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_servicios_asegurador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `servicio` longtext COLLATE utf8mb4_unicode_ci,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `casos` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_servicios_asegurador_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_tomador`
--

DROP TABLE IF EXISTS `seguro_auto_tomador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_tomador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `nombre` longtext COLLATE utf8mb4_unicode_ci,
  `nif` longtext COLLATE utf8mb4_unicode_ci,
  `telefono` longtext COLLATE utf8mb4_unicode_ci,
  `email` longtext COLLATE utf8mb4_unicode_ci,
  `direccion` longtext COLLATE utf8mb4_unicode_ci,
  `codigo_postal` longtext COLLATE utf8mb4_unicode_ci,
  `localidad` longtext COLLATE utf8mb4_unicode_ci,
  `provincia` longtext COLLATE utf8mb4_unicode_ci,
  `poblacion` longtext COLLATE utf8mb4_unicode_ci,
  `fecha_nacimiento` longtext COLLATE utf8mb4_unicode_ci,
  `fecha_carnet` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_tomador_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguro_auto_vehiculo`
--

DROP TABLE IF EXISTS `seguro_auto_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro_auto_vehiculo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int DEFAULT NULL,
  `fecha_importacion` datetime DEFAULT NULL,
  `tipo` longtext COLLATE utf8mb4_unicode_ci,
  `marca` longtext COLLATE utf8mb4_unicode_ci,
  `modelo` longtext COLLATE utf8mb4_unicode_ci,
  `matricula` longtext COLLATE utf8mb4_unicode_ci,
  `fecha_primera_matriculacion` longtext COLLATE utf8mb4_unicode_ci,
  `uso` longtext COLLATE utf8mb4_unicode_ci,
  `km_ano` longtext COLLATE utf8mb4_unicode_ci,
  `propietario` longtext COLLATE utf8mb4_unicode_ci,
  `propietario_nif` longtext COLLATE utf8mb4_unicode_ci,
  `guarda_garaje` longtext COLLATE utf8mb4_unicode_ci,
  `tiene_alarma` longtext COLLATE utf8mb4_unicode_ci,
  `mas_vehiculos_nucleo_familiar` longtext COLLATE utf8mb4_unicode_ci,
  `version` longtext COLLATE utf8mb4_unicode_ci,
  `plazas` longtext COLLATE utf8mb4_unicode_ci,
  `combustible` longtext COLLATE utf8mb4_unicode_ci,
  `aparcamiento` longtext COLLATE utf8mb4_unicode_ci,
  `localizador_antirrobo` longtext COLLATE utf8mb4_unicode_ci,
  `vehiculo_rematriculado` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `id_documento` (`id_documento`),
  CONSTRAINT `seguro_auto_vehiculo_ibfk_1` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tablas_generadas`
--

DROP TABLE IF EXISTS `tablas_generadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_generadas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_documento` int NOT NULL,
  `nombre_logico` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_mysql` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filas_insertadas` int NOT NULL DEFAULT '0',
  `fecha_creacion` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `tablas_generadas_id_documento_fkey` (`id_documento`),
  CONSTRAINT `tablas_generadas_id_documento_fkey` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-12 16:04:29
