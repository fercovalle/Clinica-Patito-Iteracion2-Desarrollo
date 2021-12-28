-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: patitolabs
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paciente_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `medico_id` int NOT NULL,
  `fecha` date NOT NULL,
  `referencia_pago` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editable` tinyint NOT NULL,
  PRIMARY KEY (`id`,`paciente_id`,`usuario_id`,`medico_id`),
  KEY `fk_consulta_paciente_idx` (`paciente_id`),
  KEY `fk_consulta_usuario1_idx` (`usuario_id`),
  KEY `fk_consulta_medico1_idx` (`medico_id`),
  CONSTRAINT `fk_consulta_medico1` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `fk_consulta_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`),
  CONSTRAINT `fk_consulta_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consulta_tipo_muestra`
--

DROP TABLE IF EXISTS `consulta_tipo_muestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta_tipo_muestra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_muestra_id` int NOT NULL,
  `consulta_id` int NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_muestra_has_consulta_consulta1_idx` (`consulta_id`),
  KEY `fk_tipo_muestra_has_consulta_tipo_muestra1_idx` (`tipo_muestra_id`),
  CONSTRAINT `fk_tipo_muestra_has_consulta_consulta1` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`id`),
  CONSTRAINT `fk_tipo_muestra_has_consulta_tipo_muestra1` FOREIGN KEY (`tipo_muestra_id`) REFERENCES `tipo_muestra` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corte_mes`
--

DROP TABLE IF EXISTS `corte_mes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corte_mes` (
  `historial` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comentario` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`historial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_tipo_examen`
--

DROP TABLE IF EXISTS `detalle_tipo_examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_tipo_examen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `consulta_id` int NOT NULL,
  `tipo_examen_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_consulta_has_tipo_examen_tipo_examen1_idx` (`tipo_examen_id`),
  KEY `fk_consulta_has_tipo_examen_consulta1_idx` (`consulta_id`),
  CONSTRAINT `fk_consulta_has_tipo_examen_consulta1` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`id`),
  CONSTRAINT `fk_consulta_has_tipo_examen_tipo_examen1` FOREIGN KEY (`tipo_examen_id`) REFERENCES `tipo_examen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `historial` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comentario` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`historial`,`usuario_id`),
  KEY `fk_historial_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_historial_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `numero_cuenta` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activo` tinyint NOT NULL,
  `regalia` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CUI` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sexo` tinyint NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CUI_UNIQUE` (`CUI`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prueba_tipo_examen`
--

DROP TABLE IF EXISTS `prueba_tipo_examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prueba_tipo_examen` (
  `historial` int NOT NULL AUTO_INCREMENT,
  `tipo_examen_id` int NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sexo` tinyint NOT NULL,
  PRIMARY KEY (`historial`,`tipo_examen_id`),
  KEY `fk_prueba_tipo_examen_tipo_examen1_idx` (`tipo_examen_id`),
  CONSTRAINT `fk_prueba_tipo_examen_tipo_examen1` FOREIGN KEY (`tipo_examen_id`) REFERENCES `tipo_examen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resultado_prueba_tipo_examen`
--

DROP TABLE IF EXISTS `resultado_prueba_tipo_examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado_prueba_tipo_examen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `detalle_tipo_examen_id` int NOT NULL,
  `prueba_tipo_examen_tipo_examen_id` int NOT NULL,
  `resultado` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unidades` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rango_inferior` int NOT NULL,
  `rango_superior` int NOT NULL,
  `clinicamente_significativo` tinyint DEFAULT NULL,
  `comentario_clinico` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `finalizado` tinyint NOT NULL,
  PRIMARY KEY (`id`,`usuario_id`,`detalle_tipo_examen_id`,`prueba_tipo_examen_tipo_examen_id`),
  KEY `fk_resultado_prueba_tipo_examen_usuario1_idx` (`usuario_id`),
  KEY `fk_resultado_prueba_tipo_examen_detalle_tipo_examen1_idx` (`detalle_tipo_examen_id`),
  KEY `fk_resultado_prueba_tipo_examen_prueba_tipo_examen1_idx` (`prueba_tipo_examen_tipo_examen_id`),
  CONSTRAINT `fk_resultado_prueba_tipo_examen_detalle_tipo_examen1` FOREIGN KEY (`detalle_tipo_examen_id`) REFERENCES `detalle_tipo_examen` (`id`),
  CONSTRAINT `fk_resultado_prueba_tipo_examen_prueba_tipo_examen1` FOREIGN KEY (`prueba_tipo_examen_tipo_examen_id`) REFERENCES `prueba_tipo_examen` (`tipo_examen_id`),
  CONSTRAINT `fk_resultado_prueba_tipo_examen_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_examen`
--

DROP TABLE IF EXISTS `tipo_examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_examen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `precio` int NOT NULL,
  `disponible` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_muestra`
--

DROP TABLE IF EXISTS `tipo_muestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_muestra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unidad` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `disponible` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nombre` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clave` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activo` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-28 16:30:37
