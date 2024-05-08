CREATE DATABASE  IF NOT EXISTS `polish_it_jobs` /*!40100 DEFAULT CHARACTER SET utf8mb4 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `polish_it_jobs`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: polish_it_jobs
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `company_details`
--

DROP TABLE IF EXISTS `company_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_details` (
  `company_id` int NOT NULL,
  `company_size_from` decimal(10,5) DEFAULT NULL,
  `company_size_to` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_details`
--

LOCK TABLES `company_details` WRITE;
/*!40000 ALTER TABLE `company_details` DISABLE KEYS */;
INSERT INTO `company_details` VALUES (1,32996.60215,47136.38710),(2,32487.52743,46409.16243),(3,31387.43804,44837.66003),(4,31606.67566,45150.84589),(5,13116.94244,17489.25658),(6,12980.26133,17307.01511),(7,16524.58439,24786.87658),(8,16537.22063,27562.03438),(9,16476.96350,27461.60584),(10,43630.04695,57989.30291),(11,22091.16301,38659.53527),(12,16456.85630,16456.85630),(13,20315.63986,23060.99660),(14,25680.97700,36726.55851),(15,25680.97700,35345.86082),(16,42294.60406,48972.41826),(17,11876.52377,23753.04754),(18,17672.93041,22091.16301),(19,31505.38506,38023.74059),(20,30366.70011,38648.52742),(21,31107.52688,39591.39785),(22,31107.52688,39591.39785),(23,42054.81464,78502.32066),(24,41764.90499,77961.15598),(25,26772.85154,31234.99346),(26,24210.39959,29590.48838);
/*!40000 ALTER TABLE `company_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `experience_id` int NOT NULL,
  `experience_level` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`experience_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,'senior'),(2,'mid'),(3,'junior');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` int NOT NULL,
  `title_id` int NOT NULL,
  `open_to_hire_ukranians` varchar(45) DEFAULT NULL,
  `if_permanent` varchar(45) DEFAULT NULL,
  `experience_id` int NOT NULL,
  `if_remote` varchar(45) DEFAULT NULL,
  `location_id` int NOT NULL,
  `salary_id` int NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`job_id`),
  KEY `fk_Job_Title_idx` (`title_id`),
  KEY `fk_Job_experience1_idx` (`experience_id`),
  KEY `fk_Job_locations1_idx` (`location_id`),
  KEY `fk_Job_Salary1_idx` (`salary_id`),
  KEY `fk_job_skills1_idx` (`skill_id`),
  CONSTRAINT `fk_Job_experience1` FOREIGN KEY (`experience_id`) REFERENCES `experience` (`experience_id`),
  CONSTRAINT `fk_Job_locations1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  CONSTRAINT `fk_Job_Salary1` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`salary_id`),
  CONSTRAINT `fk_job_skills1` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`),
  CONSTRAINT `fk_Job_Title` FOREIGN KEY (`title_id`) REFERENCES `title` (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,11,'TRUE','TRUE',1,'TRUE',1,1,1),(2,1,'TRUE','TRUE',1,'TRUE',2,2,2),(3,1,'TRUE','TRUE',1,'TRUE',3,3,2),(4,1,'TRUE','TRUE',1,'TRUE',1,4,2),(5,2,'FALSE','FALSE',2,'TRUE',4,5,3),(6,2,'FALSE','FALSE',2,'TRUE',5,6,3),(7,3,'TRUE','FALSE',2,'TRUE',6,7,4),(8,4,'TRUE','FALSE',1,'TRUE',2,8,4),(9,5,'TRUE','FALSE',1,'TRUE',1,9,4),(10,6,'FALSE','FALSE',1,'TRUE',1,10,5),(11,7,'TRUE','TRUE',1,'TRUE',1,11,6),(12,8,'FALSE','FALSE',1,'TRUE',7,12,7),(13,9,'FALSE','FALSE',1,'TRUE',1,13,7),(14,10,'TRUE','FALSE',2,'TRUE',1,14,8),(15,1,'TRUE','FALSE',1,'TRUE',1,14,9),(16,1,'TRUE','FALSE',1,'TRUE',6,14,9),(17,10,'TRUE','FALSE',2,'TRUE',6,14,10),(18,12,'FALSE','FALSE',1,'TRUE',6,15,11),(19,13,'TRUE','FALSE',2,'TRUE',8,16,12),(20,14,'TRUE','FALSE',1,'TRUE',6,17,13),(21,15,'FALSE','FALSE',1,'TRUE',1,18,14),(22,16,'TRUE','FALSE',1,'TRUE',6,18,15),(23,21,'TRUE','FALSE',1,'TRUE',6,19,16),(24,16,'TRUE','FALSE',1,'TRUE',6,19,17),(25,21,'TRUE','FALSE',1,'TRUE',6,20,21),(26,17,'FALSE','FALSE',1,'TRUE',9,21,17),(27,17,'FALSE','FALSE',1,'FALSE',10,21,17),(28,17,'FALSE','FALSE',1,'TRUE',6,22,17),(29,18,'TRUE','FALSE',1,'TRUE',7,23,19),(30,19,'TRUE','FALSE',1,'TRUE',1,24,20);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_has_company_details`
--

DROP TABLE IF EXISTS `job_has_company_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_has_company_details` (
  `job_id` int NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`job_id`,`company_id`),
  KEY `fk_Job_has_company_details_company_details1_idx` (`company_id`),
  KEY `fk_Job_has_company_details_Job1_idx` (`job_id`),
  CONSTRAINT `fk_Job_has_company_details_company_details1` FOREIGN KEY (`company_id`) REFERENCES `company_details` (`company_id`),
  CONSTRAINT `fk_Job_has_company_details_Job1` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_has_company_details`
--

LOCK TABLES `job_has_company_details` WRITE;
/*!40000 ALTER TABLE `job_has_company_details` DISABLE KEYS */;
INSERT INTO `job_has_company_details` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(16,14),(17,14),(15,15),(18,16),(19,17),(20,18),(21,19),(22,20),(23,20),(24,21),(25,22),(26,23),(27,23),(28,24),(29,25),(30,26);
/*!40000 ALTER TABLE `job_has_company_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_has_workplace_type`
--

DROP TABLE IF EXISTS `job_has_workplace_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_has_workplace_type` (
  `job_id` int NOT NULL,
  `workplace_type_id` int NOT NULL,
  PRIMARY KEY (`job_id`,`workplace_type_id`),
  KEY `fk_Job_has_workplace_type_workplace_type1_idx` (`workplace_type_id`),
  KEY `fk_Job_has_workplace_type_Job1_idx` (`job_id`),
  CONSTRAINT `fk_Job_has_workplace_type_Job1` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `fk_Job_has_workplace_type_workplace_type1` FOREIGN KEY (`workplace_type_id`) REFERENCES `workplace_type` (`workplace_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_has_workplace_type`
--

LOCK TABLES `job_has_workplace_type` WRITE;
/*!40000 ALTER TABLE `job_has_workplace_type` DISABLE KEYS */;
INSERT INTO `job_has_workplace_type` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(28,1),(29,1),(30,1),(27,2);
/*!40000 ALTER TABLE `job_has_workplace_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int NOT NULL,
  `country_code` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'GB','London'),(2,'DE','Berlin'),(3,'PL','Katowice'),(4,'PL','BiaCystok'),(5,'PL','Krakw'),(6,'PL','Warszawa'),(7,'NL','Amsterdam'),(8,'CH','Zug'),(9,'PL','WrocCaw'),(10,'GB','Southampton'),(11,'CZ','Brno'),(12,'CZ','Prague'),(13,'DK','Kopenhaga'),(14,'EE','Tallinn'),(15,'FI','Helsinki'),(16,'PL','Gdynia'),(17,'ES','Almucar'),(18,'PL','Gorzw Wielkopolski'),(19,'RS','Ni'),(20,'DE','Munchen');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `salary_id` int NOT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `salary_from` decimal(10,4) DEFAULT NULL,
  `salary_to` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'gbp',32996.6022,47136.3871),(2,'gbp',32487.5274,46409.1624),(3,'gbp',31387.4380,44837.6600),(4,'gbp',31606.6757,45150.8459),(5,'gbp',13116.9424,17489.2566),(6,'gbp',12980.2613,17307.0151),(7,'gbp',16524.5844,24786.8766),(8,'gbp',16537.2206,27562.0344),(9,'gbp',16476.9635,27461.6058),(10,'gbp',43630.0470,57989.3029),(11,'gbp',22091.1630,38659.5353),(12,'gbp',16456.8563,16456.8563),(13,'gbp',20315.6399,23060.9966),(14,'gbp',25680.9770,36726.5585),(15,'gbp',42294.6041,48972.4183),(16,'chf',11876.5238,23753.0475),(17,'gbp',17672.9304,22091.1630),(18,'gbp',31505.3851,38023.7406),(19,'gbp',30366.7001,38648.5274),(20,'gbp',31107.5269,39591.3979),(21,'gbp',42054.8146,78502.3207),(22,'gbp',41764.9050,77961.1560),(23,'gbp',26772.8515,31234.9935),(24,'gbp',24210.3996,29590.4884),(25,'gbp',12354.1053,24708.2107),(26,'eur',14029.5000,23382.5000),(27,'eur',11691.2500,18706.0000),(28,'eur',14031.9000,21047.8500),(29,'eur',28143.0000,36585.9000),(30,'eur',18706.0000,30397.2500);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skill_id` int NOT NULL,
  `skill_name_1` varchar(45) DEFAULT NULL,
  `skill_name_2` varchar(45) DEFAULT NULL,
  `skill_name_3` varchar(45) DEFAULT NULL,
  `skill_value_1` int DEFAULT NULL,
  `skill_value_2` int DEFAULT NULL,
  `skill_value_3` int DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'React','TypeScript','unknown',5,5,0),(2,'Kotlin','Backend','Java',3,4,4),(3,'Flask','English','Python',3,4,4),(4,'Node.js','TypeScript','React',2,3,3),(5,'Mobile','iOS','Swift',4,4,4),(6,'Go','Git','Design Patterns',4,4,4),(7,'JavaScript','CSS','HTML5',5,5,5),(8,'Terraform','Jenkins','AWS',2,3,4),(9,'React','TypeScript','Node.js',3,4,4),(10,'Amazon AWS','PostgreSQL','Elixir',3,3,5),(11,'Bootstrap','ERP','ServiceNow',3,3,4),(12,'Azure','TypeScript','ReactJS',1,2,4),(13,'Testing','Web Applications','Team Leadership',4,4,4),(14,'ETL','Pandas','unknown',3,3,0),(15,'TypeScript','Next.js','unknown',1,4,0),(16,'API','Python','CI/CD',4,4,4),(17,'Node.js','Three.js','Angular',1,3,4),(18,'Core Data','JavaScript','TypeScript',4,4,4),(19,'Python','unknown','unknown',4,0,0),(20,'REST API','TypeScript','ReactJS',3,3,4),(21,'TypeScript','GraphQL','Next.js',1,3,4);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title`
--

DROP TABLE IF EXISTS `title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `title` (
  `title_id` int NOT NULL,
  `title_name` varchar(100) DEFAULT NULL,
  `marker_icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title`
--

LOCK TABLES `title` WRITE;
/*!40000 ALTER TABLE `title` DISABLE KEYS */;
INSERT INTO `title` VALUES (1,'Sr. Backend Engineer','java'),(2,'Python Developer (4 days/week)','python'),(3,'Mid Full-stack Engineer (React/TypeScript)','javascript'),(4,'Full-stack Engineer (React/TypeScript)','javascript'),(5,'Senior/Regular Full-stack Engineer (React/TypeScript)','javascript'),(6,'Senior iOS Engineer','mobile'),(7,'Golang Developer','go'),(8,'Mid/Senior Ad Banner Developer','javascript'),(9,'Mid/Senior Creative Frontend Developer','javascript'),(10,'Platform Engineer - AWS','devops'),(11,'Senior Frontend Software Engineer','javascript'),(12,'Senior Elixir Backend Developer','other'),(13,'ServiceNow Developer','erp'),(14,'Front-end developer (ReactJS)','javascript'),(15,'Development Team Lead - EMEA Region','pm'),(16,'Senior Data Engineer (REMOTE)','data'),(17,'Python Developer','python'),(18,'Web Developer','javascript'),(19,'Head of Engineering','javascript'),(20,'Mid/Senior React Developer','javascript'),(21,'Fullstack Software Engineer (REMOTE)','javascript');
/*!40000 ALTER TABLE `title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workplace_type`
--

DROP TABLE IF EXISTS `workplace_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workplace_type` (
  `workplace_type_id` int NOT NULL,
  `workplace_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`workplace_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workplace_type`
--

LOCK TABLES `workplace_type` WRITE;
/*!40000 ALTER TABLE `workplace_type` DISABLE KEYS */;
INSERT INTO `workplace_type` VALUES (1,'remote'),(2,'partly_remote'),(3,'office');
/*!40000 ALTER TABLE `workplace_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-08 13:29:33
