-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: kumar24214616
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `candi_skills`
--

DROP TABLE IF EXISTS `candi_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candi_skills` (
  `candidate_id` varchar(45) NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`candidate_id`,`skill_id`),
  KEY `skill_id_idx` (`skill_id`),
  CONSTRAINT `candidate_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`candidate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skill_for_job` (`skill_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Skills each candidate possesses this is the many to many relationship b/w cand and skills';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candi_skills`
--

LOCK TABLES `candi_skills` WRITE;
/*!40000 ALTER TABLE `candi_skills` DISABLE KEYS */;
INSERT INTO `candi_skills` VALUES ('BB013',9980),('GG012',9980),('GC014',9981),('NL019',9981),('SD017',9981),('BB013',9982),('GG012',9982),('GG012',9983),('HG003',9984),('LL018',9984),('SS005',9984),('AE010',9985),('DM007',9985),('GW008',9985),('LG011',9985),('RW004',9985),('SG015',9985),('SM016',9985),('FW020',9986),('NL019',9986),('SB006',9986),('HP001',9987),('SB006',9987),('FW020',9988),('GC014',9989),('SM016',9989),('LG011',9990),('TR002',9990),('FB009',9991),('SD017',9991),('GW008',9992),('SG015',9992),('HG003',9993),('LL018',9993),('SS005',9993),('AE010',9994),('FB009',9994),('NL019',9994),('SD017',9994),('HG003',9995),('LL018',9995),('SS005',9995),('GW008',9996),('SG015',9996),('DM007',9997),('FW020',9997),('HP001',9997),('RW004',9997),('TR002',9997),('FB009',9998),('LG011',9998),('SB006',9998),('SM016',9998),('AE010',9999),('DM007',9999),('FW020',9999),('GC014',9999),('HP001',9999),('RW004',9999),('TR002',9999);
/*!40000 ALTER TABLE `candi_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_details`
--

DROP TABLE IF EXISTS `candidate_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_details` (
  `candidate_id` varchar(45) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tel_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table provides info about each candidate ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_details`
--

LOCK TABLES `candidate_details` WRITE;
/*!40000 ALTER TABLE `candidate_details` DISABLE KEYS */;
INSERT INTO `candidate_details` VALUES ('','','',NULL,NULL),('AE010','Aragorn','Elessar','234 Nevsky Prospekt, St. Petersburg, Russia','+7-812-1234567'),('BB013','Bilbo','Baggins','99 Tahrir Square, Cairo, Egypt','+20-2-12345678'),('DM007','Draco','Malfoy','98 Rue de Rivoli, Paris, France','+33-1-23456789'),('FB009','Frodo','Baggins','101 Avenida Paulista, São Paulo, Brazil','+55-11-98765432'),('FW020','Fred','Weasley','200 King Street, Wellington, New Zealand','+64-4-9876543'),('GC014','Galadriel','Celeborn','678 Zmaj Jovina, Belgrade, Serbia','+381-11-2345678'),('GG012','Gandalf','Grey','567 Beijing Road, Shanghai, China','+86-21-65432100'),('GW008','George','Weasley','67 Corniche Road, Abu Dhabi, UAE','971-2-5678900'),('HG003','Hermione','Granger','789 Sakura Avenue, Tokyo, Japan','81-3-1234-5678'),('HP001','Harry ','Potter','123 Elm Street, New York, USA','+1-555-1234'),('LG011','Legolas','Greenleaf','45 Collins Street, Melbourne, Australia','+61-3-98765432'),('LL018','Luna','Lovegood','22 Strada Victoriei, Bucharest, Romania','+40-21-9876543'),('NL019','Neville ','Longbottom','10 Rua das Flores, Lisbon, Portugal','+351-21-9876543'),('RW004','Ronald','Weasley','Crescent Road, Lahore, Pakistan','+92-42-34567890'),('SB006','Sirius ','Black','23 Park Lane, London, UK','+44-20-78901234'),('SD017','Smaug','theDragon','88 Victoria Street, Dhaka, Bangladesh','+880-2-9876543'),('SG015','Samwise','Gamgee','55 Calle Ocho, Mexico City, Mexico','+52-55-12345678'),('SM016','Sauron','Mairon','111 Maple Avenue, Toronto, Canada','+1-416-2345678'),('SS005','Severus','Snape','12 Via Roma, Milan, Italy','+39-02-12345678'),('TR002','Tom','Riddle','\'456 Pine Street, Barcelona, Spain\'','+34-932-123456');
/*!40000 ALTER TABLE `candidate_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_info`
--

DROP TABLE IF EXISTS `hospital_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_info` (
  `hospital_id` varchar(45) NOT NULL,
  `hospital_name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table goes into details about the hospitals that need positions filled';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_info`
--

LOCK TABLES `hospital_info` WRITE;
/*!40000 ALTER TABLE `hospital_info` DISABLE KEYS */;
INSERT INTO `hospital_info` VALUES ('HJ-001','Tokyo General Hospital','2-1-1 Marunouchi, Chiyoda-ku, Tokyo 100-0005','+81-3-1234-5678'),('HJ-002','Osaka Central Medical Center','1-2-3 Namba, Chuo-ku, Osaka 542-0076','+81-6-2345-6789'),('HJ-003','Kyoto University Hospital','54 Kawaramachi, Sakyo-ku, Kyoto 606-8507','+81-75-3456-7890'),('HJ-004','Hokkaido University Medical Center','Kita 15, Nishi 7, Kita-ku, Sapporo 060-8648','+81-11-4567-8901'),('HJ-005',' Nagoya City Hospital','1-1-1 Sakae, Naka-ku, Nagoya 460-0008','+81-52-5678-9012'),('HJ-006','Fukuoka International Medical Center','5-10-1 Tenjin, Chuo-ku, Fukuoka 810-0001','+81-92-6789-0123'),('HJ-007','Sendai Regional Hospital','3-15-2 Ichibancho, Aoba-ku, Sendai 980-0811','+81-22-7890-1234'),('HJ-008',' Hiroshima Peace Memorial Hospital','7-5-3 Otemachi, Naka-ku, Hiroshima 730-0051','+81-82-8901-2345'),('HJ-009','Kobe Seaside Medical Center','8-9-1 Minatojima, Chuo-ku, Kobe 650-0046','+81-78-9012-3456'),('HJ-010','Matsuyama Bayfront Hospital','3-2-1 Sanbancho, Matsuyama, Ehime 790-0001','+81-45-0123-4567');
/*!40000 ALTER TABLE `hospital_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_details`
--

DROP TABLE IF EXISTS `interview_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interview_details` (
  `interview_id` int NOT NULL,
  `position_id` int DEFAULT NULL,
  `candidate_id` varchar(45) DEFAULT NULL,
  `Interview_date` date DEFAULT NULL,
  `offer_made` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`interview_id`),
  KEY `position_id_idx` (`position_id`),
  KEY `can_id_idx` (`candidate_id`),
  CONSTRAINT `can_id` FOREIGN KEY (`candidate_id`) REFERENCES `candidate_details` (`candidate_id`),
  CONSTRAINT `pos_id` FOREIGN KEY (`position_id`) REFERENCES `position_needed` (`position_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='stores the details of the interview also includes info if the candidate got an offer ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_details`
--

LOCK TABLES `interview_details` WRITE;
/*!40000 ALTER TABLE `interview_details` DISABLE KEYS */;
INSERT INTO `interview_details` VALUES (107628,1003,'SG015','2024-01-17','no'),(112439,1006,'AE010','2023-11-18','no'),(130014,1008,'LL018','2024-07-01','yes'),(139551,1011,'TR002','2024-09-23','no'),(162522,1012,'SS005','2024-04-19','yes'),(208575,1005,'GG012','2024-10-06','yes'),(221524,1003,'SM016','2024-09-08','no'),(329976,1009,'SD017','2024-01-31','no'),(384700,1003,'DM007','2024-04-03','no'),(385911,1008,'LL018','2024-01-31','yes'),(395872,1002,'AE010','2024-05-29','yes'),(412043,1013,'HP001','2024-07-17','yes'),(427814,1013,'HP001','2024-05-12','no'),(469795,1014,'BB013','2024-05-05','no'),(506714,1013,'LL018','2023-12-22','yes'),(510769,1005,'GG012','2024-10-18','no'),(653944,1012,'SS005','2024-04-20','yes'),(670536,1008,'HG003','2024-03-19','yes'),(670609,1010,'GG012','2024-02-01','no'),(698479,1014,'GG012','2024-08-07','yes'),(715093,1008,'HG003','2024-02-12','yes'),(788294,1008,'LL018','2024-08-19','yes'),(876631,1014,'GG012','2023-12-20','yes'),(881293,1004,'SG015','2024-04-17','yes'),(935674,1015,'GC014','2024-03-02','no');
/*!40000 ALTER TABLE `interview_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_needed`
--

DROP TABLE IF EXISTS `position_needed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_needed` (
  `position_id` int NOT NULL,
  `position_name` varchar(100) DEFAULT NULL,
  `hospital_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`position_id`),
  KEY `hospital_id_idx` (`hospital_id`),
  CONSTRAINT `hospital_id` FOREIGN KEY (`hospital_id`) REFERENCES `hospital_info` (`hospital_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='this table will go into the various positions needed from hospitals and the required skills for the postion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_needed`
--

LOCK TABLES `position_needed` WRITE;
/*!40000 ALTER TABLE `position_needed` DISABLE KEYS */;
INSERT INTO `position_needed` VALUES (1001,'Nurse','HJ-010'),(1002,'Doctor','HJ-010'),(1003,'Surgeon','HJ-007'),(1004,'Lab Technician','HJ-007'),(1005,'Administrative Assistant','HJ-005'),(1006,'Pharmacist','HJ-005'),(1007,'Radiologist','HJ-004'),(1008,'Therapist','HJ-004'),(1009,'Pediatrician','HJ-002'),(1010,'Receptionist','HJ-002'),(1011,'Paramedic','HJ-003'),(1012,'Psychiatrist','HJ-003'),(1013,'Nutritionist','HJ-001'),(1014,'IT Support Specialist','HJ-001'),(1015,'Occupational Therapist','HJ-008');
/*!40000 ALTER TABLE `position_needed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_skill_needed`
--

DROP TABLE IF EXISTS `position_skill_needed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_skill_needed` (
  `position_id` int NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`position_id`,`skill_id`),
  KEY `skill_id_idx` (`skill_id`),
  CONSTRAINT `position_id` FOREIGN KEY (`position_id`) REFERENCES `position_needed` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skills_id` FOREIGN KEY (`skill_id`) REFERENCES `skill_for_job` (`skill_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='this table is for the skills needed for a give position it is many to many between positions and skills';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_skill_needed`
--

LOCK TABLES `position_skill_needed` WRITE;
/*!40000 ALTER TABLE `position_skill_needed` DISABLE KEYS */;
INSERT INTO `position_skill_needed` VALUES (1014,9980),(1001,9981),(1005,9982),(1010,9982),(1014,9982),(1005,9983),(1010,9983),(1010,9984),(1015,9984),(1003,9985),(1002,9986),(1007,9987),(1013,9987),(1015,9988),(1003,9989),(1007,9989),(1006,9990),(1013,9990),(1009,9991),(1011,9991),(1004,9992),(1014,9992),(1008,9993),(1012,9993),(1002,9994),(1006,9994),(1011,9994),(1008,9995),(1012,9995),(1013,9995),(1004,9996),(1001,9997),(1009,9997),(1011,9997),(1002,9998),(1003,9998),(1001,9999),(1015,9999);
/*!40000 ALTER TABLE `position_skill_needed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_for_job`
--

DROP TABLE IF EXISTS `skill_for_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_for_job` (
  `skill_id` int NOT NULL,
  `skill_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A list of skills that candidates can have, and positions can require.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_for_job`
--

LOCK TABLES `skill_for_job` WRITE;
/*!40000 ALTER TABLE `skill_for_job` DISABLE KEYS */;
INSERT INTO `skill_for_job` VALUES (9980,'Computer Maintenance'),(9981,'CPR'),(9982,'Time Management'),(9983,'Customer Service'),(9984,'Therapeutic Techniques'),(9985,'Anatomy'),(9986,'Medical Diagnosis'),(9987,'Health Consultation'),(9988,'Rehabilitation'),(9989,'Radiology'),(9990,'Pharmaceutical Knowledge'),(9991,'Emergency Care'),(9992,'Data Analysis'),(9993,'Counseling'),(9994,'First Aid'),(9995,'Mental Health Support'),(9996,'Laboratory Testing'),(9997,'Patient Care'),(9998,'Surgery'),(9999,'Nursing');
/*!40000 ALTER TABLE `skill_for_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'kumar24214616'
--

--
-- Dumping routines for database 'kumar24214616'
--
/*!50003 DROP PROCEDURE IF EXISTS `InsertCandidate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCandidate`(
	in cand_id varchar(45),
	in cand_firstname varchar(100), 
	in cand_lastname varchar(100), 
	in cand_address varchar(100), 
	in cand_tel  varchar(100)
)
BEGIN
	INSERT INTO candidate_details (candidate_id, firstname, lastname, address, tel_number) 
    VALUES (cand_id, cand_firstname, cand_lastname, cand_address, cand_tel);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCandiSkills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCandiSkills`(
	in can_id varchar(45),
    in ski_id int
)
BEGIN
	insert into candi_skills (candidate_id, skill_id) 
    values (can_id, ski_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertHospital` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertHospital`(
	in hosp_id varchar(45), 
	in hosp_name varchar(45),
	in hosp_address varchar(45),
	in hosp_telephone varchar(45)
)
BEGIN
	INSERT INTO hospital_info (hospital_id, hospital_name, address, telephone) 
    VALUES (hosp_id, hosp_name, hosp_address, hosp_telephone);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertInterviewDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertInterviewDetails`(
	in inte_id int,
    in posit_id int, 
    in candid_id varchar(45),
    in inter_date date, 
    in off_made tinyint
)
BEGIN
	insert into interview_details (interview_id, position_id, candidate_id, interview_date, offer_made)
    values (inte_id, posit_id, candid_id, inter_date, off_made);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertPositionNeeded` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPositionNeeded`(
	in posi_id int, 
    in posi_name varchar(100),
    in hos_id varchar(100)
)
BEGIN
	insert into position_needed(position_id, position_name, hospital_id)
    values (posi_id, posi_name, hos_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertPosSkillNeeded` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertPosSkillNeeded`(
	in posit_id int,
    in skil_id int
)
BEGIN
	insert into position_skill_needed(position_id, skill_id)
    values (posit_id, skil_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertSkillForJob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSkillForJob`(
	in sk_id INT, 
    in sk_name VARCHAR(100)
)
BEGIN
	Insert into skill_for_job (skill_id, skill_name)
    Values (sk_id, sk_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q10FindCandiOnSpecificInterDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q10FindCandiOnSpecificInterDate`(in inter_date date)
BEGIN
	select candidate_id 
    from interview_details 
    group by candidate_id 
    and candidate_id not in(
		select candidate_id 
        from interview_details 
        where interview_date != inter_date
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q11FindCandiInterviewedTwice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q11FindCandiInterviewedTwice`()
BEGIN
	select candidate_id 
    from (
		select candidate_id, count(*) as interview_count
		from interview_details
        group by candidate_id
	) as interview_counts
    where interview_count >= 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q1FindHospitalById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q1FindHospitalById`(in hosp_id varchar(45))
BEGIN
	select *
    from hospital_info 
    where hospital_id = hosp_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q2FindHosByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q2FindHosByName`(in hosp_name varchar(45))
BEGIN
	select *
    from hospital_info
    where hospital_name = hosp_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q3FindCandidateByLastName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q3FindCandidateByLastName`(in cand_lastname varchar(100))
BEGIN
	select *
    from candidate_details
    where lastname = cand_lastname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q4FindCandiByPosSkill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q4FindCandiByPosSkill`(in pos_id int)
BEGIN
	select distinct c.candidate_id, c.firstname, c.lastname
    from candidate_details c 
    join candi_skills cs on c.candidate_id = cs.candidate_id
    join position_skill_needed psn on cs.skill_id = psn.skill_id
    where psn.position_id = pos_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q5CandiWithOffers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q5CandiWithOffers`()
BEGIN
	select count(distinct candidate_id) as count_of_offers
    from interview_details
    where offer_made = 1;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q6FindPosBySkill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q6FindPosBySkill`(in skil_id int)
BEGIN
	select p.position_id, p.position_name
    from position_needed p 
    join position_skill_needed ps on p.position_id = ps.position_id
    where ps.skill_id = skil_id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q7CountPosRequiredForNursing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q7CountPosRequiredForNursing`()
BEGIN
	select count(*) as total_nursing_positions
    from position_skill_needed ps 
    join skill_for_job sj on ps.skill_id = sj.skill_id
    where sj.skill_name = 'nursing';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q8PosSortedByHosp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q8PosSortedByHosp`()
BEGIN
	select p.position_id, p.position_name, h.hospital_name
    from position_needed p 
    join hospital_info h on p.hospital_id = h.hospital_id
    order by h.hospital_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Q9FindInterByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q9FindInterByDate`(in inter_date date)
BEGIN
	select *
    from interview_details 
    where interview_date = inter_date;
END ;;
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

-- Dump completed on 2024-11-09 13:16:43
