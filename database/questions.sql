CREATE DATABASE  IF NOT EXISTS `questions` /*!40100 DEFAULT CHARACTER SET latin1 */;
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
  `languages` varchar(300) NOT NULL COMMENT 'Multiple answers.',
  `present_ideas` int(1) NOT NULL,
  `com_orally` int(1) NOT NULL,
  `pers_convince` int(1) NOT NULL,
  `iden_symb` int(1) NOT NULL,
  `accept_dif` int(1) NOT NULL,
  `use_tools` int(1) NOT NULL,
  `learn_update` int(1) NOT NULL,
  `creative_innovative` int(1) NOT NULL,
  `search_analyze_manage_share` int(1) NOT NULL,
  `create_innovate` int(1) NOT NULL,
  `design_implement` int(1) NOT NULL,
  `solve_problem` int(1) NOT NULL,
  `abstraction` int(1) NOT NULL,
  `underst` int(1) NOT NULL,
  `take_culture` int(1) NOT NULL,
  `assume_resp` int(1) NOT NULL,
  `planning_time` int(1) NOT NULL,
  `computer_tools` int(1) NOT NULL,
  `imp_projects` int(1) NOT NULL,
  `team_work` int(1) NOT NULL,
  `indep_work` int(1) NOT NULL,
  `apply_val` int(1) NOT NULL,
  `adapt_changes` int(1) NOT NULL,
  `pressure_work` int(1) NOT NULL,
  `strong_comp` int(2) NOT NULL,
  `weak_comp` int(2) NOT NULL,
  `useful_comp` int(2) NOT NULL,
  `useless_comp` int(2) NOT NULL,
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
  `reason_study_again` varchar(100) DEFAULT NULL COMMENT 'Unique answer with comment (option "other").',
  `reason_no_study_again` varchar(100) DEFAULT NULL COMMENT 'Unique answer with comment (option "other").',
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
/*!50003 DROP PROCEDURE IF EXISTS `getSpecificGraduate` */;
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
/*!50003 DROP PROCEDURE IF EXISTS `setGraduate` */;
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
/*!50003 DROP PROCEDURE IF EXISTS `setPartA` */;
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
/*!50003 DROP PROCEDURE IF EXISTS `setPartB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setPartB`(IN `pGraduateId` INT(11), IN `pLanguages` VARCHAR(300), IN `pPresentIdeas` INT(1), IN `pComOrally` INT(1), IN `pPersConvince` INT(1), IN `pIdenSymb` INT(1), IN `pAcceptDif` INT(1), IN `pUseTools` INT(1), IN `pLearnUpdate` INT(1), IN `pCreativeInnovative` INT(1), IN `pSearchAnalyzeManageShare` INT(1), IN `pDesignImplement` INT(1), IN `pSolveProblem` INT(1), IN `pAbstraction` INT(1), IN `pUnderst` INT(1), IN `pTakeCulture` INT(1), IN `pAssumeResp` INT(1), IN `pPlanningTime` INT(1), IN `pComputerTools` INT(1), IN `pImpProjects` INT(1), IN `pTeamWork` INT(1), IN `pIndepWork` INT(1), IN `pApplyVal` INT(1), IN `pAdaptChanges` INT(1), IN `pPressureWork` INT(1), IN `pStrongComp` INT(2), IN `pWeakComp` INT(2), IN `pUsefulComp` INT(2), IN `pUselessComp` INT(2))
    NO SQL
insert into part_b (graduate_id, languages, present_ideas, com_orally, pers_convince, iden_symb, accpet_dif, use_tools, learn_update, creative_innovative, search_analyze_manage_share, design_implement, solve_problem, abstraction, underst, take_culture, assume_resp, planning_time, computer_tools, imp_projects, team_work, indep_work, apply_val, adapt_changes, pressure_work, strong_comp, weak_comp, useful_comp, useless_comp) values (pGraduateId, pLanguages, pPresentIdeas, pComOrally, pPersConvince, pIdenSymb, pAcceptDif, pUseTools, pLearnUpdate, pCreativeInnovative, pSearchAnalyzeManageShare, pDesignImplement, pSolveProblem, pAbstraction, pUnderst, pTakeCulture, pAssumeResp, pPlanningTime, pComputerTools, pImpProjects, pTeamWork, pIndepWork, pApplyVal, pAdaptChanges, pPressureWork, pStrongComp, pWeakComp, pUsefulComp, pUselessComp) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setPartC` */;
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
/*!50003 DROP PROCEDURE IF EXISTS `setPartDFive` */;
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
/*!50003 DROP PROCEDURE IF EXISTS `setPartDFour` */;
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
/*!50003 DROP PROCEDURE IF EXISTS `setPartDOne` */;
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
/*!50003 DROP PROCEDURE IF EXISTS `setPartDSeven` */;
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
/*!50003 DROP PROCEDURE IF EXISTS `setPartDSix` */;
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
/*!50003 DROP PROCEDURE IF EXISTS `setPartDThree` */;
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
/*!50003 DROP PROCEDURE IF EXISTS `setPartDTwo` */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-03 23:14:11
