-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: student
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (455,'朱娜娜','5677'),(889,'朱玩玩','5677'),(2345,'方嘉佳','8977'),(2944,'weiyuha','507843'),(25563,'注释','45rffg'),(34545,'24','344'),(454546,'232','12222'),(3454555,'24','344');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac`
--

DROP TABLE IF EXISTS `fac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fac` (
  `id` varchar(20) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `speid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `speid` (`speid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac`
--

LOCK TABLES `fac` WRITE;
/*!40000 ALTER TABLE `fac` DISABLE KEYS */;
INSERT INTO `fac` VALUES ('56','英语',12),('76','物联网',19),('77','电子技术',19),('78','计算机科学与技术',13);
/*!40000 ALTER TABLE `fac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `h2`
--

DROP TABLE IF EXISTS `h2`;
/*!50001 DROP VIEW IF EXISTS `h2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `h2` AS SELECT 
 1 AS `id`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `kc`
--

DROP TABLE IF EXISTS `kc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kc` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `yearD` int NOT NULL,
  `teaId` varchar(20) NOT NULL,
  `yearE` int NOT NULL,
  `xuef` decimal(2,1) NOT NULL,
  `speid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `yearDE` (`yearD`,`yearE`) USING BTREE,
  KEY `spekcid` (`speid`),
  KEY `teatkc` (`teaId`),
  CONSTRAINT `spekcid` FOREIGN KEY (`speid`) REFERENCES `spe` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `teatkc` FOREIGN KEY (`teaId`) REFERENCES `teat` (`id`),
  CONSTRAINT `kc-chk-2` CHECK (((`yearE` = 0) or (`yearE` = 1))),
  CONSTRAINT `kc_chk_1` CHECK (((`yearD` > 0) and (`yearD` <= 5000)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kc`
--

LOCK TABLES `kc` WRITE;
/*!40000 ALTER TABLE `kc` DISABLE KEYS */;
INSERT INTO `kc` VALUES ('1234','Java',2006,'2345',0,2.0,'12'),('12349','Java',2006,'2345',0,2.0,NULL),('2345','Database',2003,'1234',0,1.0,'19'),('2347','C++',2004,'2034',0,2.0,'13'),('253','Vue',2006,'2034',1,1.5,'13'),('2534','Vue',2006,'2034',1,1.5,'13'),('25349','Vue',2006,'2034',1,1.5,'13'),('5623','Python',2006,'1023',0,1.5,'45'),('56237','Python',2006,'1023',0,1.5,'45'),('6789','PHP',2006,'2034',0,2.0,'45'),('7877','易语言',2006,'1023',0,2.5,'45'),('8900','PHP',2006,'2345',0,4.0,'45');
/*!40000 ALTER TABLE `kc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `kc2006`
--

DROP TABLE IF EXISTS `kc2006`;
/*!50001 DROP VIEW IF EXISTS `kc2006`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kc2006` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `yearD`,
 1 AS `teaId`,
 1 AS `yearE`,
 1 AS `xuef`,
 1 AS `speid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `kcinf`
--

DROP TABLE IF EXISTS `kcinf`;
/*!50001 DROP VIEW IF EXISTS `kcinf`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `kcinf` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `yearD`,
 1 AS `teaId`,
 1 AS `yearE`,
 1 AS `xuef`,
 1 AS `tname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `spe`
--

DROP TABLE IF EXISTS `spe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spe` (
  `id` varchar(20) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spe`
--

LOCK TABLES `spe` WRITE;
/*!40000 ALTER TABLE `spe` DISABLE KEYS */;
INSERT INTO `spe` VALUES ('12','外国语系'),('45','生命工程系'),('19','电子信息系'),('13','计算机系');
/*!40000 ALTER TABLE `spe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `stuinf`
--

DROP TABLE IF EXISTS `stuinf`;
/*!50001 DROP VIEW IF EXISTS `stuinf`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stuinf` AS SELECT 
 1 AS `id`,
 1 AS `Sname`,
 1 AS `Kid`,
 1 AS `Kname`,
 1 AS `xuef`,
 1 AS `grade`,
 1 AS `Tname`,
 1 AS `teaid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stut`
--

DROP TABLE IF EXISTS `stut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stut` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `facid` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facids` (`facid`),
  CONSTRAINT `facids` FOREIGN KEY (`facid`) REFERENCES `fac` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `agea` CHECK ((`age` >= 0)),
  CONSTRAINT `sexc` CHECK (((`sex` = _utf8mb4'男') or (`sex` = _utf8mb4'女') or (`sex` = NULL)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stut`
--

LOCK TABLES `stut` WRITE;
/*!40000 ALTER TABLE `stut` DISABLE KEYS */;
INSERT INTO `stut` VALUES ('100','Victor','2020','123 Cherry St.',NULL,'',117),('1001','Victor','2020','123 Cherry St.',NULL,'男',117),('1002','Victor','2020','123 Cherry St.',NULL,'',117),('11','Kate','2019','456 Elm St.',NULL,'女',28),('12','Liam','2021','789 Oak St.',NULL,'男',29),('13','Mia','2020','234 Pine St.',NULL,'女',30),('14','Noah','2019','567 Cedar St.',NULL,'男',31),('15','Olivia','2021','890 Maple St.',NULL,'女',32),('16','Peter','2020','345 Walnut St.',NULL,'男',33),('17','Quinn','2019','678 Birch St.',NULL,'女',34),('18','Ryan','2021','901 Ash St.',NULL,'男',35),('19','Sophie','2020','123 Cherry St.',NULL,'女',36),('2','Bob','2019','456 Elm St.',NULL,'男',19),('20','Tyler','2019','456 Elm St.',NULL,'男',37),('202101','朱自强','12345','安徽文昌','78','男',56),('202102','储字阳','1234',NULL,'78','女',57),('202121','杨戈','we3477','贺州','78','男',58),('202156','王志','202156',NULL,'78','女',34),('202188','朱大雷','202188','安徽亳州','78','男',23),('202199','于海','5677',NULL,'78','男',23),('21','Ursula','2021','789 Oak St.',NULL,'女',38),('22','Victor','2020','234 Pine St.',NULL,'男',39),('23','Wendy','2019','567 Cedar St.',NULL,'女',40),('234','wew','we','ewe',NULL,'男',34),('24','Xavier','2021','890 Maple St.',NULL,'男',41),('25','Yara','2020','345 Walnut St.',NULL,'女',42),('26','Zach','2019','678 Birch St.',NULL,'男',43),('27','Amy','2021','901 Ash St.',NULL,'女',44),('28','Ben','2020','123 Cherry St.',NULL,'男',45),('29','Cindy','2019','456 Elm St.',NULL,'女',46),('3','Claire','2021','789 Oak St.',NULL,'女',20),('30','Dan','2021','789 Oak St.',NULL,'男',47),('31','Eliza','2020','234 Pine St.',NULL,'女',48),('32','Fred','2019','567 Cedar St.',NULL,'男',49),('322','Claire','2021','789 Oak St.',NULL,'女',20),('33','Gina','2021','890 Maple St.',NULL,'女',50),('34','Harry','2020','345 Walnut St.',NULL,'男',51),('35','Iris','2019','678 Birch St.',NULL,'女',52),('36','Jack','2021','901 Ash St.',NULL,'男',53),('37','Kim','2020','123 Cherry St.',NULL,'女',54),('38','Luke','2019','456 Elm St.',NULL,'男',55),('39','Molly','2021','789 Oak St.',NULL,'女',56),('4','David','2020','234 Pine St.',NULL,'男',21),('40','Nick','2020','234 Pine St.',NULL,'男',57),('41','Olivia','2019','567 Cedar St.',NULL,'女',58),('42','Peter','2021','890 Maple St.',NULL,'男',59),('43','Quinn','2020','345 Walnut St.',NULL,'女',60),('44','Ryan','2019','678 Birch St.',NULL,'男',61),('45','Sarah','2021','901 Ash St.',NULL,'女',62),('46','Tom','2020','123 Cherry St.',NULL,'男',63),('47','Ursula','2019','456 Elm St.',NULL,'女',64),('48','Victor','2021','789 Oak St.',NULL,'男',65),('49','Wendy','2020','234 Pine St.',NULL,'女',66),('5','Emily','2019','567 Cedar St.',NULL,'女',22),('50','Xavier','2019','567 Cedar St.',NULL,'男',67),('51','Yara','2021','890 Maple St.',NULL,'女',68),('52','Zach','2020','345 Walnut St.',NULL,'男',69),('53','Amy','2019','678 Birch St.',NULL,'女',70),('54','Ben','2021','901 Ash St.',NULL,'男',71),('55','Cindy','2020','123 Cherry St.',NULL,'女',72),('56','Dan','2019','456 Elm St.',NULL,'男',73),('57','Eliza','2021','789 Oak St.',NULL,'女',74),('58','Fred','2020','234 Pine St.','76','男',75),('59','Gina','2019','567 Cedar St.','77','女',76),('6','Frank','2021','890 Maple St.',NULL,'男',23),('60','Harry','2021','890 Maple St.',NULL,'男',77),('61','Iris','2020','345 Walnut St.','77','女',78),('62','Jack','2019','678 Birch St.',NULL,'男',79),('63','Kim','2021','901 Ash St.',NULL,'女',80),('64','Luke','2020','123 Cherry St.',NULL,'男',81),('65','Molly','2019','456 Elm St.',NULL,'女',82),('66','Nick','2021','789 Oak St.',NULL,'男',83),('67','Olivia','2020','234 Pine St.',NULL,'女',84),('68','Peter','2019','567 Cedar St.',NULL,'男',85),('69','Quinn','2021','890 Maple St.',NULL,'女',86),('7','Grace','2020','345 Walnut St.',NULL,'女',24),('70','Ryan','2020','345 Walnut St.',NULL,'男',87),('71','Sarah','2019','678 Birch St.',NULL,'女',88),('72','Tom','2021','901 Ash St.',NULL,'男',89),('73','Ursula','2020','123 Cherry St.',NULL,'女',90),('74','Victor','2019','456 Elm St.',NULL,'男',91),('75','Wendy','2021','789 Oak St.',NULL,'女',92),('76','Xavier','2020','234 Pine St.',NULL,'男',93),('77','Yara','2019','567 Cedar St.',NULL,'女',94),('78','Zach','2021','890 Maple St.',NULL,'男',95),('79','Amy','2020','345 Walnut St.',NULL,'女',96),('8','Henry','2019','678 Birch St.',NULL,'男',25),('80','Ben','2019','678 Birch St.',NULL,'男',97),('81','Cindy','2021','901 Ash St.',NULL,'女',98),('82','Dan','2020','123 Cherry St.',NULL,'男',99),('83','Eliza','2019','456 Elm St.',NULL,'女',100),('84','Fred','2021','789 Oak St.',NULL,'男',101),('85','Gina','2020','234 Pine St.',NULL,'女',102),('86','Harry','2019','567 Cedar St.',NULL,'男',103),('87','Iris','2021','890 Maple St.',NULL,'女',104),('88','Jack','2020','345 Walnut St.',NULL,'男',105),('89','Kim','2019','678 Birch St.',NULL,'女',106),('9','Isabella','2021','901 Ash St.',NULL,'女',26),('90','Luke','2021','901 Ash St.',NULL,'男',107),('91','Molly','2020','123 Cherry St.',NULL,'女',108),('92','Nick','2019','456 Elm St.',NULL,'男',109),('93','Olivia','2021','789 Oak St.',NULL,'女',110),('94','Peter','2020','234 Pine St.',NULL,'男',111),('95','Quinn','2019','567 Cedar St.',NULL,'女',112),('96','Ryan','2021','890 Maple St.',NULL,'男',113),('97','Sarah','2020','345 Walnut St.',NULL,'女',114),('98','Tom','2019','678 Birch St.',NULL,'男',115),('99','Ursula','2021','901 Ash St.',NULL,'女',116);
/*!40000 ALTER TABLE `stut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teat`
--

DROP TABLE IF EXISTS `teat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teat` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `jobt` varchar(40) DEFAULT NULL,
  `speid` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spec` (`speid`),
  CONSTRAINT `agec` CHECK ((`age` >= 0)),
  CONSTRAINT `sexc2` CHECK (((`sex` = _utf8mb4'男') or (`sex` = _utf8mb4'女')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teat`
--

LOCK TABLES `teat` WRITE;
/*!40000 ALTER TABLE `teat` DISABLE KEYS */;
INSERT INTO `teat` VALUES ('1023','朱哈哈','1023',NULL,'女','副教授',19,46),('11','Watanabe Takuya','lbAlqDyn9G',NULL,'男','教授',13,37),('1111','Watanabe Takuya','lbAlqDyn9G',NULL,'男','教授',NULL,37),('12','Shi Yunxi','tkkgEYqXRF',NULL,'女','副教授',45,38),('1234','北答燕','1234',NULL,'男','副教授',13,34),('13','Ng Chung Yin','SwIfrHaD3O',NULL,'男','教授',19,29),('14','Jamie Hawkins','Wl9jdgxtlv',NULL,'女','副教授',45,25),('15','Larry Vasquez','VkhC6iCdm4',NULL,'男','副教授',13,26),('16','Yin Ling Ling','6sjVE8UqBw',NULL,NULL,NULL,45,28),('17','Chang Zhennan','JSlidU3dwU',NULL,NULL,NULL,19,29),('18','Bobby Reed','zR6QjA6ebi',NULL,NULL,NULL,45,56),('19','Gong Zitao','yEYaFa4LtS',NULL,NULL,NULL,13,34),('20','Cheng Shihan','PmFOX64d5m',NULL,NULL,NULL,45,45),('2034','南问鱼','2034',NULL,'女','副教授',45,45),('2345','Jasson','2345','加利福尼亚','男','副教授',13,34),('3','余海强','7x6smjo0Vg','幽州','男','教授',45,23),('4','Yao Yunxi','QcyVdM8UY4',NULL,'女','副教授',12,20),('5','Nakayama Mitsuki','rkhkmCzGCv',NULL,'男','教授',45,25),('6','Ikeda Rin','f8lTTANG4c',NULL,NULL,'教授',19,34),('7','Man Ming Sze','ph8sjIy2L6',NULL,'男','教授',19,45),('7768','宾韦','7768','海南','男','副教授',45,45),('8','Kwong Tin Lok','c0TyLZiATy','枞阳','男','教授',13,34),('9','Cho Sai Wing','sMabhOCLeT',NULL,'男','教授',13,35);
/*!40000 ALTER TABLE `teat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `viewtea`
--

DROP TABLE IF EXISTS `viewtea`;
/*!50001 DROP VIEW IF EXISTS `viewtea`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewtea` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `spename`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewteakc`
--

DROP TABLE IF EXISTS `viewteakc`;
/*!50001 DROP VIEW IF EXISTS `viewteakc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewteakc` AS SELECT 
 1 AS `id`,
 1 AS `kcid`,
 1 AS `name`,
 1 AS `numstu`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `xsxk`
--

DROP TABLE IF EXISTS `xsxk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xsxk` (
  `stuId` varchar(20) NOT NULL,
  `kcId` varchar(20) NOT NULL,
  `grade` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`stuId`,`kcId` DESC) USING BTREE,
  KEY `stuId` (`stuId`) USING BTREE,
  KEY `x2` (`kcId`),
  CONSTRAINT `x11` FOREIGN KEY (`stuId`) REFERENCES `stut` (`id`),
  CONSTRAINT `x2` FOREIGN KEY (`kcId`) REFERENCES `kc` (`id`),
  CONSTRAINT `gradec` CHECK (((`grade` >= 0) and (`grade` <= 100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xsxk`
--

LOCK TABLES `xsxk` WRITE;
/*!40000 ALTER TABLE `xsxk` DISABLE KEYS */;
INSERT INTO `xsxk` VALUES ('202101','253',0.0),('202101','2345',99.9),('202101','1234',67.7),('202102','8900',96.0),('202102','253',56.0),('202102','2345',23.6),('202121','8900',99.7),('202121','5623',67.9),('4','5623',72.0),('6','5623',67.0),('7','5623',89.0);
/*!40000 ALTER TABLE `xsxk` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `h1` BEFORE INSERT ON `xsxk` FOR EACH ROW BEGIN
    IF EXISTS(SELECT *from xsxk where new.stuId=xsxk.stuId and new.kcId=xsxk.kcId) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate entry6';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'student'
--
/*!50003 DROP FUNCTION IF EXISTS `counts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `counts`(kcid VARCHAR(20)) RETURNS int
BEGIN
	DECLARE	 sumh INT;
    SELECT count(DISTINCT xsxk.stuid) INTO sumh from xsxk where kcid=xsxk.kcId;
    RETURN sumh;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `delekc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `delekc`(kcid VARCHAR(20)) RETURNS int
BEGIN
    IF EXISTS(SELECT * FROM kc WHERE kc.id=kcid) THEN
        DELETE FROM xsxk WHERE xsxk.kcId = kcid;
        DELETE FROM kc WHERE kc.id = kcid;
        RETURN 1;
    END IF;
    RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `delestu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `delestu`(stuid VARCHAR(20)) RETURNS int
BEGIN
    IF EXISTS(SELECT * FROM stut WHERE stut.id=stuid) THEN
        DELETE FROM xsxk WHERE xsxk.stuId = stuid;
        DELETE FROM stut WHERE stut.id = stuid;
        RETURN 1;
    END IF;
    RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `deletea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `deletea`(teaid VARCHAR(20)) RETURNS int
BEGIN
    IF EXISTS(SELECT * FROM teat WHERE teat.id=teaid) THEN
        UPDATE kc set kc.teaId=null where kc.teaId=teaid;
        DELETE FROM teat WHERE teat.id = teaid;
        RETURN 1;
    END IF;
    RETURN 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `countstu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `countstu`(in kcid VARCHAR(20),out sumh int)
BEGIN
	set sumh=0;
	SELECT count(DISTINCT xsxk.stuid) INTO sumh from xsxk where kcid=xsxk.kcId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `h3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `h3`(in teaID VARCHAR(20),in kcID VARCHAR(20), out counTi int)
BEGIN
	SELECT COUNT(DISTINCT xsxk.stuId) into counTi from xsxk,kc where xsxk.kcId=kc.id and kc.id=kcID and kc.teaId=teaID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `h4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `h4`(in teaID VARCHAR(20), out counTi int)
BEGIN
	SELECT COUNT(DISTINCT xsxk.stuId) into counTi from xsxk,kc where xsxk.kcId=kc.id  and kc.teaId=teaID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TUXF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TUXF`(in sId VARCHAR(20),in yD int,in yE int,out sumh FLOAT)
BEGIN
	SELECT SUM(xuef) INTO sumh from stut,xsxk,kc where stut.id=xsxk.stuId and xsxk.kcId =kc.id and stut.id=sId and kc.yearD=yD and kc.yearE=yE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `h2`
--

/*!50001 DROP VIEW IF EXISTS `h2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `h2` AS select `kc`.`id` AS `id`,`kc`.`name` AS `name` from `kc` where ((`kc`.`yearD` = 2006) and `kc`.`id` in (select `xsxk`.`kcId` from `xsxk`) is false) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kc2006`
--

/*!50001 DROP VIEW IF EXISTS `kc2006`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kc2006` AS select `kc`.`id` AS `id`,`kc`.`name` AS `name`,`kc`.`yearD` AS `yearD`,`kc`.`teaId` AS `teaId`,`kc`.`yearE` AS `yearE`,`kc`.`xuef` AS `xuef`,`kc`.`speid` AS `speid` from `kc` where (exists(select 1 from `xsxk` where ((`kc`.`id` = `xsxk`.`kcId`) and (`kc`.`yearD` = 2006))) is false and (`kc`.`yearD` = 2006)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `kcinf`
--

/*!50001 DROP VIEW IF EXISTS `kcinf`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `kcinf` AS select `kc`.`id` AS `id`,`kc`.`name` AS `name`,`kc`.`yearD` AS `yearD`,`kc`.`teaId` AS `teaId`,`kc`.`yearE` AS `yearE`,`kc`.`xuef` AS `xuef`,`teat`.`name` AS `tname` from (`kc` join `teat`) where (`kc`.`teaId` = `teat`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stuinf`
--

/*!50001 DROP VIEW IF EXISTS `stuinf`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stuinf` AS select `stut`.`id` AS `id`,`stut`.`name` AS `Sname`,`kc`.`id` AS `Kid`,`kc`.`name` AS `Kname`,`kc`.`xuef` AS `xuef`,`xsxk`.`grade` AS `grade`,`teat`.`name` AS `Tname`,`teat`.`id` AS `teaid` from (((`stut` join `teat`) join `kc`) join `xsxk`) where ((`stut`.`id` = `xsxk`.`stuId`) and (`xsxk`.`kcId` = `kc`.`id`) and (`kc`.`teaId` = `teat`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewtea`
--

/*!50001 DROP VIEW IF EXISTS `viewtea`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewtea` AS select `teat`.`id` AS `id`,`teat`.`name` AS `name`,`spe`.`name` AS `spename` from (`spe` join `teat`) where (`teat`.`speid` = `spe`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewteakc`
--

/*!50001 DROP VIEW IF EXISTS `viewteakc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewteakc` AS select `teat`.`id` AS `id`,`kc`.`id` AS `kcid`,`kc`.`name` AS `name`,`counts`(`kc`.`id`) AS `numstu` from (`kc` join `teat`) where (`teat`.`id` = `kc`.`teaId`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-22 20:28:21
