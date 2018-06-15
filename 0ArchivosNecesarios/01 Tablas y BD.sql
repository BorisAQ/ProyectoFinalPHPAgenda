

-- MySQL dump 10.16  Distrib 10.1.31-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: bd_agenda
-- ------------------------------------------------------
-- Server version	10.1.31-MariaDB

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

CREATE DATABASE bd_agenda;
USE bd_agenda;


--
-- Table structure for table `age_usuario`
--

DROP TABLE IF EXISTS `age_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `age_usuario` (
  `usu_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `usu_nombre_completo` varchar(50) NOT NULL,
  `usu_correo` varchar(100) NOT NULL,
  `usu_fecha_nacimiento` date NOT NULL,
  `usu_password` varchar(255) NOT NULL,
  PRIMARY KEY (`usu_codigo`),
  UNIQUE KEY `usu_correo` (`usu_correo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `age_evento`
--

DROP TABLE IF EXISTS `age_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `age_evento` (
  `eve_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `eve_titulo` varchar(100) NOT NULL,
  `eve_fecha_inicio` date NOT NULL,
  `eve_hora_inicio` time DEFAULT NULL,
  `eve_fecha_fin` date DEFAULT NULL,
  `eve_hora_fin` time DEFAULT NULL,
  `eve_usu` int(11) NOT NULL,
  `eve_dia_entero` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`eve_codigo`),
  KEY `eve_usu_fk` (`eve_usu`),
  CONSTRAINT `eve_usu_fk` FOREIGN KEY (`eve_usu`) REFERENCES `age_usuario` (`usu_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;




--
-- Dumping data for table `age_usuario`
--

LOCK TABLES `age_usuario` WRITE;
/*!40000 ALTER TABLE `age_usuario` DISABLE KEYS */;

INSERT INTO `age_usuario` VALUES (3,'Boris Apaza','b_apaza@hotmail.com','1986-09-22','$2y$10$7kh6AO.Yrn.v1I63IFvHI.h0Jkw2yZy0SYExXEW/c82VvoeHZSa5W'),(4,'Maria Perez','MPerez@hotmail.com','1990-12-01','$2y$10$dTKRtcc81FI3.6UPAvB64.Mn5CV78STB2KsAtw4ELVSbkkG5PmLkK'),(5,'Javier Cordova','jcordova@hotmail.com','1986-09-22','$2y$10$ZgSnQcQJfdZT1sVq0iV8.eqA/O1fqGVUC8c0HbQ6C0NBbOM/ZAIHC'),(6,'Pedro Ramirez','pedro@gmail.com','1983-10-22','$2y$10$ARnaIY70qxwtUVpEQWQmEeBFHaUQ.vVfPsZx9LtUYiI9Fc2V2skau'),(7,'javier Macherano','j@midho.com','0000-00-00','$2y$10$HCYUqqk91Zm8P/qdg/j8ROeTuXcgWksupIz5j4kwtkFcP/OqnzGV2'),(8,'maria cabrera','m@gmail.com','2018-05-22','$2y$10$CSJZmRCgD.PYzkI3xjqiA.0PnXWTv0eP4nJfFAPNSHU5QTavmRIx6');
/*!40000 ALTER TABLE `age_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-11 18:24:43

--
-- Dumping data for table `age_evento`
--

LOCK TABLES `age_evento` WRITE;
/*!40000 ALTER TABLE `age_evento` DISABLE KEYS */;
INSERT INTO `age_evento` VALUES (1,'EVENTO prueba','2018-01-01',NULL,NULL,NULL,4,1),(2,'adf','0000-00-00','00:00:00','0000-00-00','00:00:00',3,1),(3,'Nuevo evento','0000-00-00','00:00:00','0000-00-00','00:00:00',3,1),(4,'EVENTO prueba','2018-01-01',NULL,NULL,NULL,4,1),(5,'Evento boris','0000-00-00','00:00:00','0000-00-00','00:00:00',3,1),(6,'Dia de gracias','0000-00-00','00:00:00','0000-00-00','00:00:00',3,1),(7,'Navidad','2018-12-24','00:00:00','0000-00-00','00:00:00',3,1),(8,'AÃ±o nuevo','2018-12-31','07:00:00','2018-12-31','22:30:00',3,1),(9,'Carnaval','2018-02-13','05:00:00','2018-02-21','22:00:00',6,1),(10,'EVENTO prueba','2018-01-01',NULL,NULL,NULL,4,0),(11,'Carnaval','2018-02-13','00:00:00','0000-00-00','00:00:00',6,1),(13,'Todos SAntos','2018-11-01','00:00:00','0000-00-00','00:00:00',6,1),(14,'Todos SAntos no','2018-11-01','07:00:00','0000-00-00','07:00:00',6,1),(15,'NN','2018-06-21','00:00:00','0000-00-00','00:00:00',6,0),(16,'SS','2018-06-07','00:00:00','0000-00-00','00:00:00',6,0),(17,'BB','2018-06-06','03:30:00','0000-00-00','00:00:00',6,1),(18,'CCC','2018-06-21','00:00:00','0000-00-00','00:00:00',6,0),(19,'CCC1','2018-06-20','00:00:00','0000-00-00','00:00:00',6,0),(20,'ddd','2018-06-20','07:00:00','0000-00-00','07:00:00',6,1),(22,'KKK','2018-06-05','07:00:00','0000-00-00','07:00:00',6,1),(23,'JJJ','2018-06-14','09:30:00','0000-00-00','00:00:00',6,1),(24,'JJJ1','2018-06-13','00:00:00','0000-00-00','00:00:00',6,0),(27,'Evento todo el dÃ­a','2018-06-13','00:00:00','0000-00-00','00:00:00',6,1),(28,'Evnto no todo el dÃ­a','2020-01-01','06:00:00','2021-01-01','07:00:00',6,0),(29,'Nuevo evento','2018-06-10','00:00:00','0000-00-00','00:00:00',6,1),(30,'Incia Mundial','2018-06-12','05:30:00','2018-06-12','07:00:00',6,0),(31,'Cumple ma','2018-06-07','07:00:00','2018-06-07','20:30:00',3,0),(32,'Inicia Mun','2018-06-13','07:00:00','2018-06-13','23:00:00',6,0),(33,'Neuvo','2018-06-09','00:00:00','0000-00-00','00:00:00',6,0),(34,'nnn','2018-06-05','05:00:00','2018-06-05','06:00:00',3,0),(35,'Comida con papa','2018-06-06','07:00:00','2018-06-06','12:00:00',3,0),(36,'Comida con papa','2018-06-06','07:00:00','2018-06-06','12:00:00',3,0),(37,'Compra de computadora','2018-06-02','07:00:00','2018-06-05','07:00:00',3,0),(38,'Calculo de impuestos','2018-06-08','00:00:00','0000-00-00','00:00:00',3,1);
/*!40000 ALTER TABLE `age_evento` ENABLE KEYS */;
UNLOCK TABLES;