CREATE DATABASE  IF NOT EXISTS `questions` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `questions`;
-- MySQL dump 10.13  Distrib 5.7.9, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: questions
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.9-MariaDB

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
-- Table structure for table `graduate`
--

DROP TABLE IF EXISTS `graduate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graduate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `program` varchar(45) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `country` varchar(45) NOT NULL,
  `department` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `res_phone` varchar(20) DEFAULT NULL,
  `mob_phone` varchar(20) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `pin` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_id_UNIQUE` (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='Graduate dataset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graduate`
--

LOCK TABLES `graduate` WRITE;
/*!40000 ALTER TABLE `graduate` DISABLE KEYS */;
INSERT INTO `graduate` VALUES (1,123123,'José David',NULL,NULL,'Colombia',NULL,NULL,NULL,NULL,'josdagaro@gmail.com',1234);
/*!40000 ALTER TABLE `graduate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_a`
--

DROP TABLE IF EXISTS `part_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_a` (
  `graduate_id` int(11) NOT NULL,
  `civil_state` int(1) NOT NULL,
  `children_numb` int(2) NOT NULL,
  `housing` int(1) NOT NULL,
  `limitations` varchar(200) NOT NULL COMMENT 'Multiple answers.',
  `performace` int(1) DEFAULT NULL,
  KEY `graduate_id_foreign_key_a_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_a` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_a`
--

LOCK TABLES `part_a` WRITE;
/*!40000 ALTER TABLE `part_a` DISABLE KEYS */;
INSERT INTO `part_a` VALUES (1,1,7,3,'a:8:{i:0;i:8;i:1;i:7;i:2;i:6;i:3;i:5;i:4;i:4;i:5;i:3;i:6;i:2;i:7;i:1;}',3);
/*!40000 ALTER TABLE `part_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_b`
--

DROP TABLE IF EXISTS `part_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_b` (
  `graduate_id` int(11) NOT NULL,
  `languages` varchar(700) CHARACTER SET latin1 NOT NULL COMMENT 'Multiple answers.',
  `competences` varchar(2800) CHARACTER SET latin1 NOT NULL,
  `outstandings` varchar(600) CHARACTER SET latin1 NOT NULL,
  KEY `graduate_id_foreign_key_b_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_b` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_b`
--

LOCK TABLES `part_b` WRITE;
/*!40000 ALTER TABLE `part_b` DISABLE KEYS */;
INSERT INTO `part_b` VALUES (1,'O:8:\"stdClass\":8:{s:6:\"ingles\";a:5:{i:0;b:1;i:1;s:1:\"3\";i:2;s:1:\"2\";i:3;s:1:\"2\";i:4;s:1:\"1\";}s:7:\"frances\";a:5:{i:0;b:1;i:1;s:1:\"3\";i:2;s:1:\"3\";i:3;s:1:\"2\";i:4;s:1:\"1\";}s:8:\"italiano\";a:5:{i:0;b:1;i:1;s:1:\"2\";i:2;s:1:\"1\";i:3;s:1:\"2\";i:4;s:1:\"1\";}s:9:\"portugues\";a:5:{i:0;b:1;i:1;s:1:\"2\";i:2;s:1:\"2\";i:3;s:1:\"2\";i:4;s:1:\"1\";}s:8:\"mandarin\";a:5:{i:0;b:1;i:1;s:1:\"3\";i:2;s:1:\"3\";i:3;s:1:\"2\";i:4;s:1:\"1\";}s:6:\"aleman\";a:5:{i:0;b:1;i:1;s:1:\"3\";i:2;s:1:\"1\";i:3;s:1:\"2\";i:4;s:1:\"1\";}s:7:\"japones\";a:5:{i:0;b:1;i:1;s:1:\"1\";i:2;s:1:\"2\";i:3;s:1:\"1\";i:4;s:1:\"1\";}s:5:\"arabe\";a:5:{i:0;b:1;i:1;s:1:\"2\";i:2;s:1:\"2\";i:3;s:1:\"1\";i:4;s:1:\"1\";}}','O:8:\"stdClass\":24:{s:13:\"present_ideas\";a:3:{i:0;s:37:\"Exponer las ideas por medios escritos\";i:1;s:1:\"2\";i:2;i:2;}s:10:\"com_orally\";a:3:{i:0;s:34:\"Comunicarse oralmente con claridad\";i:1;s:1:\"2\";i:2;i:2;}s:13:\"pers_convince\";a:3:{i:0;s:42:\"Persuadir y convencer a sus interlocutores\";i:1;s:1:\"1\";i:2;i:2;}s:9:\"iden_symb\";a:3:{i:0;s:95:\"Identificar y utilizar sÃ­mbolos para comunicarse (lenguaje icÃ³nico, lenguaje no verbal, etc.)\";i:1;s:1:\"2\";i:2;i:2;}s:10:\"accpet_dif\";a:3:{i:0;s:62:\"Aceptar las diferencias y trabajar en contexto multiculturales\";i:1;s:1:\"2\";i:2;i:3;}s:9:\"use_tools\";a:3:{i:0;s:114:\"Utilizar herramientas informÃ¡ticas bÃ¡sicas (procesadores de texto, hojas de cÃ¡lculo, correo electrÃ³nico, etc.)\";i:1;s:1:\"3\";i:2;i:3;}s:12:\"learn_update\";a:3:{i:0;s:33:\"Aprender y mantenerse actualizado\";i:1;s:1:\"3\";i:2;i:2;}s:19:\"creative_innovative\";a:3:{i:0;s:24:\"Ser creativo e innovador\";i:1;s:1:\"2\";i:2;i:2;}s:27:\"search_analyze_manage_share\";a:3:{i:0;s:54:\"Buscar, analizar, administrar y compartir informaciÃ³n\";i:1;s:1:\"1\";i:2;i:2;}s:15:\"create_innovate\";a:3:{i:0;s:39:\"Crear, investigar y adoptar tecnologÃ­a\";i:1;s:1:\"2\";i:2;i:2;}s:16:\"design_implement\";a:3:{i:0;s:61:\"DiseÃ±ar e implementar soluciones con el apoyo de tecnologÃ­a\";i:1;s:1:\"2\";i:2;i:2;}s:13:\"solve_problem\";a:3:{i:0;s:43:\"Identificar , plantear y resolver problemas\";i:1;s:1:\"2\";i:2;i:2;}s:11:\"abstraction\";a:3:{i:0;s:47:\"Capacidad de abstracciÃ³n anÃ¡lisis y sÃ­ntesis\";i:1;s:1:\"1\";i:2;i:2;}s:7:\"underst\";a:3:{i:0;s:35:\"Comprender la realidad que lo rodea\";i:1;s:1:\"1\";i:2;i:2;}s:12:\"take_culture\";a:3:{i:0;s:33:\"Asumir una cultura de convivencia\";i:1;s:1:\"2\";i:2;i:2;}s:11:\"assume_resp\";a:3:{i:0;s:43:\"Asumir responsabilidades y tomar decisiones\";i:1;s:1:\"3\";i:2;i:2;}s:13:\"planning_time\";a:3:{i:0;s:103:\"Planificar y utilizar el tiempo de manera efectiva de tal forma que se logran los objetivos planteados.\";i:1;s:1:\"2\";i:2;i:3;}s:14:\"computer_tools\";a:3:{i:0;s:102:\"Utilizar herramientas informÃ¡ticas especializadas (paquetes estadÃ­sticos, software de diseÃ±o, etc.)\";i:1;s:1:\"1\";i:2;i:3;}s:12:\"imp_projects\";a:3:{i:0;s:29:\"Formular y ejecutar proyectos\";i:1;s:1:\"2\";i:2;i:2;}s:9:\"team_work\";a:3:{i:0;s:46:\"Trabajar en equipo para alcanzar metas comunes\";i:1;s:1:\"3\";i:2;i:3;}s:10:\"indep_work\";a:3:{i:0;s:60:\"Trabajar de manera independiente sin supervisiÃ³n permanente\";i:1;s:1:\"3\";i:2;i:3;}s:9:\"apply_val\";a:3:{i:0;s:61:\"Aplicar valores y Ã©tica profesional en el desempeÃ±o laboral\";i:1;s:1:\"4\";i:2;i:3;}s:13:\"adapt_changes\";a:3:{i:0;s:65:\"Adaptarse a los cambios (trabajar en contextos nuevos y diversos)\";i:1;s:1:\"3\";i:2;i:3;}s:13:\"pressure_work\";a:3:{i:0;s:22:\"Trabajar bajo presiÃ³n\";i:1;s:1:\"3\";i:2;i:2;}}','O:8:\"stdClass\":4:{s:11:\"strong_comp\";a:2:{i:0;s:78:\"Â¿cuÃ¡l de las competencias antes mencionadas considera que es la mÃ¡s fuerte?\";i:1;s:1:\"3\";}s:9:\"weak_comp\";a:2:{i:0;s:78:\"Â¿cuÃ¡l de las competencias antes mencionadas considera que es la mÃ¡s dÃ©bil?\";i:1;s:1:\"5\";}s:11:\"useful_comp\";a:2:{i:0;s:70:\"Â¿cuÃ¡l considera que ha sido la mÃ¡s Ãºtil en su trayectoria laboral?\";i:1;s:1:\"3\";}s:12:\"useless_comp\";a:2:{i:0;s:71:\"Â¿cuÃ¡l considera que ha sido la menos Ãºtil en su trayectoria laboral?\";i:1;s:1:\"4\";}}');
/*!40000 ALTER TABLE `part_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_c`
--

DROP TABLE IF EXISTS `part_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_c` (
  `graduate_id` int(11) NOT NULL,
  `long_term` varchar(200) NOT NULL COMMENT 'Multiple answers.',
  `activity` varchar(200) NOT NULL COMMENT 'Multiple answers.',
  KEY `graduate_id_foreign_key_c_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_c` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_c`
--

LOCK TABLES `part_c` WRITE;
/*!40000 ALTER TABLE `part_c` DISABLE KEYS */;
INSERT INTO `part_c` VALUES (1,'a:8:{i:0;i:2;i:1;i:3;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;i:6;i:8;i:7;i:9;}','a:8:{i:0;i:3;i:1;i:1;i:2;i:4;i:3;i:5;i:4;i:6;i:5;i:7;i:6;i:8;i:7;i:9;}');
/*!40000 ALTER TABLE `part_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_d_five`
--

DROP TABLE IF EXISTS `part_d_five`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_d_five` (
  `graduate_id` int(11) NOT NULL,
  `time_company` int(1) DEFAULT NULL,
  `career_relat` int(1) DEFAULT NULL,
  `eco_activity_company` varchar(200) DEFAULT NULL,
  `company_monthly_avg` float DEFAULT NULL,
  KEY `graduate_id_foreign_key_five_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_five` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_d_five`
--

LOCK TABLES `part_d_five` WRITE;
/*!40000 ALTER TABLE `part_d_five` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_d_five` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_d_four`
--

DROP TABLE IF EXISTS `part_d_four`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_d_four` (
  `graduate_id` int(11) NOT NULL,
  `create_company` int(1) DEFAULT NULL,
  `main_difficulty` int(1) DEFAULT NULL,
  KEY `graduate_id_foreign_key_d_four_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_d_four` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_d_four`
--

LOCK TABLES `part_d_four` WRITE;
/*!40000 ALTER TABLE `part_d_four` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_d_four` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_d_one`
--

DROP TABLE IF EXISTS `part_d_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_d_one` (
  `graduate_id` int(11) NOT NULL,
  `more_time_activity` int(1) NOT NULL,
  `remunerated_activity` int(1) DEFAULT NULL,
  `diligence_work` int(1) DEFAULT NULL,
  `after_dilig_work` int(1) DEFAULT NULL,
  `reasons_not_dilig` int(1) DEFAULT NULL,
  `work_availab` int(1) DEFAULT NULL,
  `activity_role` int(1) DEFAULT NULL,
  KEY `graduate_id_foreign_key_d_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_d` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_d_one`
--

LOCK TABLES `part_d_one` WRITE;
/*!40000 ALTER TABLE `part_d_one` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_d_one` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_d_seven`
--

DROP TABLE IF EXISTS `part_d_seven`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_d_seven` (
  `graduate_id` int(11) NOT NULL,
  `looking_first_job` int(1) DEFAULT NULL,
  `months_looking_job` int(11) DEFAULT NULL,
  `get_job` int(1) DEFAULT NULL,
  `difficult_get_job` varchar(200) DEFAULT NULL COMMENT 'Unique answer with comment (option "other").',
  `search_ch_job` int(1) DEFAULT NULL,
  KEY `graduate_id_foreign_key_d_seven_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_d_seven` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_d_seven`
--

LOCK TABLES `part_d_seven` WRITE;
/*!40000 ALTER TABLE `part_d_seven` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_d_seven` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_d_six`
--

DROP TABLE IF EXISTS `part_d_six`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_d_six` (
  `graduate_id` int(11) NOT NULL,
  `exp_months` int(11) DEFAULT NULL,
  `study_exp_reality` int(1) DEFAULT NULL,
  `useful_knowledge` varchar(200) DEFAULT NULL,
  `work_contributes` int(1) DEFAULT NULL,
  `work_satisfaction` int(1) DEFAULT NULL,
  `study_level` int(1) DEFAULT NULL,
  `additional_interest` int(1) DEFAULT NULL,
  `other_work` int(1) DEFAULT NULL,
  `should_earn_more` int(1) DEFAULT NULL,
  KEY `graduate_id_foreign_key_d_six_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_d_six` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_d_six`
--

LOCK TABLES `part_d_six` WRITE;
/*!40000 ALTER TABLE `part_d_six` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_d_six` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_d_three`
--

DROP TABLE IF EXISTS `part_d_three`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_d_three` (
  `graduate_id` int(11) NOT NULL,
  `first_work` int(1) DEFAULT NULL,
  `career_relat` int(1) DEFAULT NULL,
  `labour_forms` int(1) DEFAULT NULL,
  `eco_activity` varchar(200) DEFAULT NULL,
  `monthly_income` float DEFAULT NULL,
  KEY `graduate_id_foreign_key_d_three_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_d_three` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_d_three`
--

LOCK TABLES `part_d_three` WRITE;
/*!40000 ALTER TABLE `part_d_three` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_d_three` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_d_two`
--

DROP TABLE IF EXISTS `part_d_two`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_d_two` (
  `graduate_id` int(11) NOT NULL,
  `first_work` int(1) DEFAULT NULL,
  `search_ch` int(1) DEFAULT NULL,
  `type_link` int(1) DEFAULT NULL,
  `current_occup` varchar(200) DEFAULT NULL,
  `eco_activity` varchar(200) DEFAULT NULL,
  `employment_relat` int(1) DEFAULT NULL,
  `last_entry` float DEFAULT NULL,
  `week_work_hours_avg` float DEFAULT NULL,
  `field_activity` int(1) DEFAULT NULL,
  `inst_links` int(1) DEFAULT NULL,
  KEY `graduate_id_foreign_key_d_two_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_d_two` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_d_two`
--

LOCK TABLES `part_d_two` WRITE;
/*!40000 ALTER TABLE `part_d_two` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_d_two` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_e`
--

DROP TABLE IF EXISTS `part_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_e` (
  `graduate_id` int(11) NOT NULL,
  `classify_sense_belong` int(1) NOT NULL,
  `eval_work_possib` int(1) NOT NULL,
  `study_again` int(1) NOT NULL,
  `reason_study_again` varchar(200) DEFAULT NULL COMMENT 'Unique answer with comment (option "other").',
  `reason_no_study_again` varchar(200) DEFAULT NULL COMMENT 'Unique answer with comment (option "other").',
  `want_other_study` int(1) NOT NULL,
  `other_study` int(1) DEFAULT NULL,
  `recommend` int(1) NOT NULL,
  KEY `graduate_id_foreign_key_e_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_e` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_e`
--

LOCK TABLES `part_e` WRITE;
/*!40000 ALTER TABLE `part_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_f`
--

DROP TABLE IF EXISTS `part_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_f` (
  `graduate_id` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `relationship` varchar(45) DEFAULT NULL,
  `country` varchar(45) NOT NULL,
  `departament` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `res_phone` varchar(20) DEFAULT NULL,
  `mob_phone` varchar(20) DEFAULT NULL,
  KEY `graduate_id_foreign_key_f_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_f` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_f`
--

LOCK TABLES `part_f` WRITE;
/*!40000 ALTER TABLE `part_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `part_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'questions'
--

--
-- Dumping routines for database 'questions'
--
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartA` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartA`()
    NO SQL
select * from part_a ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartB` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartB`()
    NO SQL
select * from part_b ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartC` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartC`()
    NO SQL
select * from part_c ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartDFive` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartDFive`()
    NO SQL
select * from part_d_five ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartDFour` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartDFour`()
    NO SQL
select * from part_d_four ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartDOne` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartDOne`()
    NO SQL
select * from part_d_one ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartDSeven` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartDSeven`()
    NO SQL
select * from part_d_seven ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartDSix` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartDSix`()
    NO SQL
select * from part_d_six ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartDThree` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartDThree`()
    NO SQL
select * from part_d_three ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartDTwo` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartDTwo`()
    NO SQL
select * from part_d_two ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartE` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartE`()
    NO SQL
select * from part_e ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPartF` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllPartF`()
    NO SQL
select * from part_f ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getSpecificGraduate` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSpecificGraduate`(IN `pCardId` INT (11), IN `pPin` INT (4))
    NO SQL
select * from graduate where card_id = pCardId and pin = pPin ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setGraduate` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setGraduate`(IN `pCardId` INT(11), IN `pFullName` VARCHAR(45), IN `pProgram` VARCHAR(45), IN `pBirthDate` DATE, IN `pCountry` VARCHAR(45), IN `pDepartament` VARCHAR(45), IN `pCity` VARCHAR(45), IN `pResPhone` VARCHAR(20), IN `pMobPhone` VARCHAR(20), IN `pEmail` VARCHAR(45), IN `pPin` INT(4))
    NO SQL
insert into graduate (card_id, full_name, program, birth_date, country, departament, city, res_phone, mob_phone, email, pin) values (pCardId, pFullName, pProgram, pBirthDate, pCountry, pDepartament, pCity, pResPhone, pMobPhone, pEmail, pPin) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartA` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartA`(IN `pGraduateId` INT(11), IN `pCivilState` INT(1), IN `pChildrenNumb` INT(2), IN `pHousing` INT(1), IN `pLimitations` VARCHAR(200), IN `pPerformace` INT(1))
    NO SQL
insert into part_a (graduate_id, civil_state, children_numb, housing, limitations, performace) values (pGraduateId, pCivilState, pChildrenNumb, pHousing, pLimitations, pPerformace) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartB` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartB`(IN `pGraduateId` INT(11), IN `pLanguages` VARCHAR(700), IN `pCompetences` VARCHAR(2800), IN `pOutstandings` VARCHAR(600))
    NO SQL
insert into part_b (graduate_id, languages, competences, outstandings) values (pGraduateId, pLanguages, pCompetences, pOutstandings) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartC` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartC`(IN `pGraduateId` INT(11), IN `pLongTerm` VARCHAR(200), IN `pActivity` VARCHAR(200))
    NO SQL
insert into part_c (graduate_id, long_term, activity) values (pGraduateId, pLongTerm, pActivity) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartDFive` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartDFive`(IN `pGraduateId` INT(11), IN `pTimeCompany` INT(1), IN `pCareerRelat` INT(1), IN `pEcoActivityCompany` VARCHAR(200), IN `pCompanyMonthlyAvg` FLOAT)
    NO SQL
insert into part_d_five (graduate_id, time_company, career_relat, eco_activity_company, company_monthly_avg) values (pGraduateId, pTimeCompany, pCareerRelat, pEcoActivityCompany, pCompanyMonthlyAvg) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartDFour` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartDFour`(IN `pGraduateId` INT(11), IN `pCreateCompany` INT(1), IN `pMainDifficulty` INT(1))
    NO SQL
insert into part_d_four (graduate_id, create_company, main_difficulty) values (pGraduateId, pCreateCompany, pMainDifficulty) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartDOne` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartDOne`(IN `pGraduateId` INT(11), IN `pMoreTimeActivity` INT(1), IN `pRemuneratedActivity` INT(1), IN `pDiligenceWork` INT(1), IN `pAfterDiligWork` INT(1), IN `pReasonsNotDilig` INT(1), IN `pWorkAvailab` INT(1), IN `pActivityRole` INT(1))
    NO SQL
insert into part_d_one (graduate_id, more_time_activity, remunerated_activity, diligence_work, after_dilig_work, reasons_not_dilig, work_availab, activity_role) values (pGraduateId, pMoreTimeActivity, pRemuneratedActivity, pDiligenceWork, pAfterDiligWork, pReasonsNotDilig, pWorkAvailab, pActivityRole) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartDSeven` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartDSeven`(IN `pGraduateId` INT(11), IN `pLookingFirstJob` INT(1), IN `pMonthsLookingJob` INT(11), IN `pGetJob` INT(1), IN `pDifficultGetJob` VARCHAR(200), IN `pSearchChJob` INT(1))
    NO SQL
insert into part_d_seven (graduate_id, looking_first_job, months_looking_job, get_job, difficult_get_job, search_ch_job) values (pGraduateId, pLookingFirstJob, pMonthsLookingJob, pGetJob, pDifficultGetJob, pSearchChJob) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartDSix` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartDSix`(IN `pGraduateId` INT(11), IN `pExpMonths` INT(11), IN `pStudyExpReality` INT(1), IN `pUsefulKnowledge` VARCHAR(200), IN `pWorkContributes` INT(1), IN `pWorkSatisfaction` INT(1), IN `pStudyLevel` INT(1), IN `pAdditionalInterest` INT(1), IN `pOtherWork` INT(1), IN `pShouldEarnMore` INT(1))
    NO SQL
insert into part_d_six (graduate_id, exp_months, study_exp_reality, useful_knowledge, work_contributes, work_satisfaction, study_level, additional_interest, other_work, should_earn_more) values (pGraduateId, pExpMonths, pStudyExpReality, pUsefulKnowledge, pWorkContributes, pWorkSatisfaction, pStudyLevel, pAdditionalInterest, pOtherWork, pShouldEarnMore) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartDThree` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartDThree`(IN `pGraduateId` INT(11), IN `pFirstWork` INT(1), IN `pCareerRelat` INT(1), IN `pLabourForms` INT(1), IN `pEcoActivity` VARCHAR(200), IN `pMonthlyIncome` FLOAT)
    NO SQL
insert into part_d_three (graduate_id, first_work, career_relat, labour_forms, eco_activity, monthly_income) values (pGraduateId, pFirstWork, pCareerRelat, pLabourForms, pEcoActivity, pMonthlyIncome) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartDTwo` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartDTwo`(IN `pGraduateId` INT(11), IN `pFirstWork` INT(1), IN `pSearchCh` INT(1), IN `pTypeLink` INT(1), IN `pCurrentOccup` VARCHAR(200), IN `pEcoActivity` VARCHAR(200), IN `pEmploymentRelat` INT(1), IN `pLastEntry` FLOAT, IN `pWeekWorkHoursAvg` FLOAT, IN `pFieldActivity` INT(1), IN `pInstLinks` INT(1))
    NO SQL
insert into part_d_two (graduate_id, first_work, search_ch, type_link, current_occup, eco_activity, employment_relat, last_entry, week_work_hours_avg, field_activity, inst_links) values (pGraduateId, pFirstWork, pSearchCh, pTypeLink, pCurrentOccup, pEcoActivity, pEmploymentRelat, pLastEntry, pWeekWorkHoursAvg, pFieldActivity, pInstLinks) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartE` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartE`(IN `pGraduateId` INT(11), IN `pClassifySenseBelong` INT(1), IN `pEvalWorkPossib` INT(1), IN `pStudyAgain` INT(1), IN `pReasonStudyAgain` VARCHAR(200), IN `pReasonNoStudyAgain` VARCHAR(200), IN `pWantOtherStudy` INT(1), IN `pOtherStudy` INT(1), IN `pRecommend` INT(1))
    NO SQL
insert into part_e (graduate_id, classify_sense_belong, eval_work_possib, study_again, reason_study_again, reason_no_study_again, want_other_study, other_study, recommend) values (pGraduateId, pClassifySenseBelong, pEvalWorkPossib, pStudyAgain, pReasonStudyAgain, pReasonNoStudyAgain, pWantOtherStudy, pOtherStudy, pRecommend) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartF` */;
ALTER DATABASE `questions` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartF`(IN `pGraduateId` INT(11), IN `pFullName` VARCHAR(45), IN `pRelationship` VARCHAR(45), IN `pCountry` VARCHAR(45), IN `pDepartament` VARCHAR(45), IN `pCity` VARCHAR(45), IN `pResPhone` VARCHAR(45), IN `pMobPhone` VARCHAR(45))
    NO SQL
insert into part_f (graduate_id, full_name, relationship, country, departament, city, res_phone, mob_phone) values (pGraduateId, pFullName, pRelationship, pCountry, pDepartament, pCity, pResPhone, pMobPhone) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `questions` CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-11 15:27:29
