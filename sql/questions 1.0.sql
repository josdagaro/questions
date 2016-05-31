CREATE DATABASE  IF NOT EXISTS `questions` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `questions`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: questions
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Graduate dataset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graduate`
--

LOCK TABLES `graduate` WRITE;
/*!40000 ALTER TABLE `graduate` DISABLE KEYS */;
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
  `civil_state` int(1) DEFAULT NULL,
  `children_numb` int(2) DEFAULT NULL,
  `housing` int(1) DEFAULT NULL,
  `limitations` varchar(100) DEFAULT NULL COMMENT 'Multiple answers.',
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
  `languages` varchar(200) DEFAULT NULL COMMENT 'Multiple answers.',
  `present_ideas` int(1) DEFAULT NULL,
  `com_orally` int(1) DEFAULT NULL,
  `pers_convince` int(1) DEFAULT NULL,
  `iden_symb` int(1) DEFAULT NULL,
  `accept_dif` int(1) DEFAULT NULL,
  `use_tools` int(1) DEFAULT NULL,
  `learn_update` int(1) DEFAULT NULL,
  `creative_innovative` int(1) DEFAULT NULL,
  `search_analyze_manage_share` int(1) DEFAULT NULL,
  `design_implement` int(1) DEFAULT NULL,
  `solve_problem` int(1) DEFAULT NULL,
  `abstraction` int(1) DEFAULT NULL,
  `underst` int(1) DEFAULT NULL,
  `take_culture` int(1) DEFAULT NULL,
  `assume_resp` int(1) DEFAULT NULL,
  `planning_time` int(1) DEFAULT NULL,
  `computer_tools` int(1) DEFAULT NULL,
  `imp_projects` int(1) DEFAULT NULL,
  `team_work` int(1) DEFAULT NULL,
  `indep_work` int(1) DEFAULT NULL,
  `apply_val` int(1) DEFAULT NULL,
  `adapt_changes` int(1) DEFAULT NULL,
  `pressure_work` int(1) DEFAULT NULL,
  `strong_comp` int(2) DEFAULT NULL,
  `weak_comp` int(2) DEFAULT NULL,
  `useful_comp` int(2) DEFAULT NULL,
  `useless_comp` int(2) DEFAULT NULL,
  KEY `graduate_id_foreign_key_b_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_b` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_b`
--

LOCK TABLES `part_b` WRITE;
/*!40000 ALTER TABLE `part_b` DISABLE KEYS */;
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
  `long_term` varchar(100) DEFAULT NULL COMMENT 'Multiple answers.',
  `activity` varchar(100) DEFAULT NULL COMMENT 'Multiple answers.',
  KEY `graduate_id_foreign_key_c_idx` (`graduate_id`),
  CONSTRAINT `graduate_id_foreign_key_c` FOREIGN KEY (`graduate_id`) REFERENCES `graduate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_c`
--

LOCK TABLES `part_c` WRITE;
/*!40000 ALTER TABLE `part_c` DISABLE KEYS */;
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
  `eco_activity_company` varchar(100) DEFAULT NULL,
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
  `more_time_activity` int(1) DEFAULT NULL,
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
  `difficult_get_job` varchar(100) DEFAULT NULL COMMENT 'Unique answer with comment (option "other").',
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
  `useful_knowledge` varchar(100) DEFAULT NULL,
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
  `eco_activity` varchar(100) DEFAULT NULL,
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
  `current_occup` varchar(100) DEFAULT NULL,
  `eco_activity` varchar(100) DEFAULT NULL,
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
  `classify_sense_belong` int(1) DEFAULT NULL,
  `eval_work_possib` int(1) DEFAULT NULL,
  `study_again` int(1) DEFAULT NULL,
  `reason_study_again` varchar(100) DEFAULT NULL COMMENT 'Unique answer with comment (option "other").',
  `reason_no_study_again` varchar(100) DEFAULT NULL COMMENT 'Unique answer with comment (option "other").',
  `want_other_study` int(1) DEFAULT NULL,
  `other_study` int(1) DEFAULT NULL,
  `recommend` int(1) DEFAULT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-30 17:21:34
