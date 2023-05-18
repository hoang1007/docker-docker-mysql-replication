-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: student_management
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int unsigned NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `major_id` int unsigned NOT NULL,
  `instructor_id` int unsigned NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `class_instructor_id_foreign` (`instructor_id`),
  KEY `class_major_id_foreign` (`major_id`),
  CONSTRAINT `class_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`),
  CONSTRAINT `class_major_id_foreign` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'CQ-CD',5,1),(2,'CQ-CB',5,2),(3,'CD-CC',5,3),(4,'CQ-AT',2,4),(5,'CQ-AG',18,5);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int unsigned NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_credit` int NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Tín hiệu và hệ thống',3),(2,'Chăn nuôi đại cương',3),(3,'Trồng cây không đất',2),(4,'Kỹ thuật cao tần',3),(5,'Nhập môn lập trình',3),(6,'Giải tích 2',3),(7,'Vật lý đại cương 2',3),(8,'Hệ quản trị cơ sở dữ liệu',2),(9,'Lập trình nâng cao',4),(10,'Mạng máy tính',3),(11,'Phương pháp tính',2),(12,'Tối ưu hóa',3),(13,'Kiểm thử và đảm bảo chất lượng phần mềm',3),(14,'Giải tích 1',2),(15,'Toán học rời rạc',2),(16,'Tư tưởng Hồ Chí Minh',4),(17,'Cơ học môi trường liên tục',4),(18,'Nguyên lý Kỹ thuật điện tử',4),(19,'Linh kiện bán dẫn và vi mạch',3),(20,'Kỹ thuật điện',2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `enrollment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `score` decimal(8,2) NOT NULL,
  `student_id` int unsigned NOT NULL,
  `semester_id` int unsigned NOT NULL,
  `course_id` int unsigned NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `enrollment_student_id_foreign` (`student_id`),
  KEY `enrollment_course_id_foreign` (`course_id`),
  KEY `enrollment_semester_id_foreign` (`semester_id`),
  CONSTRAINT `enrollment_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `enrollment_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`),
  CONSTRAINT `enrollment_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,3.00,19020877,3,6),(2,6.00,19020877,3,7),(3,10.00,19020877,3,8),(4,6.00,19020878,1,3),(5,5.00,19020878,2,1),(6,5.00,19020879,1,1),(7,1.00,19020879,1,2),(8,2.00,19020879,2,3),(9,6.00,19020880,1,15),(10,7.00,19020880,1,16),(11,9.00,19020880,1,17),(12,9.00,19020880,1,18),(13,1.00,19020880,1,19),(14,4.00,19020882,2,3),(15,1.00,19020882,1,7),(16,1.00,19020882,1,8),(17,8.00,19020883,1,2),(18,6.00,19020883,3,3),(19,3.00,19020883,4,4),(20,4.00,19020883,1,5),(21,4.00,19020886,2,1),(22,3.00,19020886,2,5),(23,2.00,19020886,3,7),(24,10.00,19020886,1,2),(25,0.00,19020887,1,3),(26,10.00,19020887,1,1),(27,1.00,19020887,2,2),(28,5.00,19020889,1,5),(29,9.00,19020889,2,7),(30,1.00,19020889,3,3),(31,3.00,19020893,1,9),(32,1.00,19020893,1,8),(33,1.00,19020893,1,20),(34,8.00,19020894,2,1),(35,7.00,19020894,2,1),(36,6.00,19020894,4,20),(37,8.00,19020896,1,18),(38,0.00,19020896,2,6),(39,7.00,19020896,3,3),(40,7.00,19020897,4,2),(41,7.00,19020897,1,5),(42,10.00,19020897,2,4),(43,6.00,19020898,3,7),(44,0.00,19020898,4,1),(45,10.00,19020898,1,8),(46,4.00,19020899,2,9),(47,7.00,19020899,3,10),(48,6.00,19020899,4,12),(49,10.00,19020902,1,16),(50,2.00,19020902,2,17),(51,4.00,19020902,3,19),(52,6.00,19020905,4,20),(53,9.00,19020905,1,13),(54,2.00,19020905,2,14),(55,6.00,19020906,3,15),(56,0.00,19020906,4,18),(57,6.00,19020906,1,6),(58,4.00,19020909,2,3),(59,8.00,19020909,3,2),(60,9.00,19020909,4,5),(61,1.00,19020910,1,4),(62,3.00,19020910,2,7),(63,9.00,19020910,3,1),(64,7.00,19020917,4,8),(65,1.00,19020917,1,9),(66,5.00,19020917,2,10),(67,1.00,19020918,3,12),(68,9.00,19020918,4,16),(69,8.00,19020918,1,17),(70,0.00,19020920,2,19),(71,6.00,19020920,3,20),(72,1.00,19020920,4,13),(73,4.00,19020922,1,14),(74,1.00,19020922,2,15),(75,0.00,19020922,3,18),(76,3.00,19020923,4,6),(77,10.00,19020923,1,3),(78,3.00,19020923,2,2),(79,2.00,19020925,3,5),(80,8.00,19020925,4,4),(81,2.00,19020925,1,7),(82,10.00,19020928,2,1),(83,2.00,19020928,3,8),(84,3.00,19020928,4,9),(85,4.00,19020929,1,10),(86,4.00,19020929,2,12),(87,4.00,19020929,3,16),(88,0.00,19020930,4,17),(89,4.00,19020930,1,19),(90,9.00,19020930,2,20),(91,1.00,19020931,3,13),(92,2.00,19020931,4,14),(93,4.00,19020931,1,15),(94,1.00,19020933,2,18),(95,9.00,19020933,3,6),(96,1.00,19020933,4,3),(97,2.00,19020935,1,2),(98,2.00,19020935,2,5),(99,8.00,19020935,3,4),(100,8.00,19020936,4,7),(101,9.00,19020936,1,1),(102,6.00,19020936,2,8),(103,5.00,19020937,3,9),(104,9.00,19020937,4,10),(105,1.00,19020937,1,12),(106,4.00,19020938,2,16),(107,3.00,19020938,3,17),(108,10.00,19020938,4,19),(109,6.00,19020939,1,20),(110,4.00,19020939,2,13),(111,0.00,19020939,3,14),(112,2.00,19020940,4,15),(113,7.00,19020940,1,18),(114,1.00,19020940,2,6),(115,2.00,19020941,3,3),(116,4.00,19020941,4,2),(117,2.00,19020941,1,5),(118,5.00,19020942,2,4),(119,5.00,19020942,3,7),(120,9.00,19020942,4,1),(121,4.00,19020943,1,8),(122,7.00,19020943,2,9),(123,7.00,19020943,3,10),(124,3.00,19020947,4,12),(125,5.00,19020947,1,16),(126,8.00,19020947,2,17),(127,8.00,19020948,3,19),(128,6.00,19020948,4,20),(129,9.00,19020948,1,13),(130,2.00,19020951,2,14),(131,1.00,19020951,3,15),(132,4.00,19020951,4,18),(133,5.00,19020953,1,6),(134,9.00,19020953,2,3),(135,5.00,19020953,3,2),(136,2.00,19020954,4,5),(137,9.00,19020954,1,4),(138,3.00,19020954,2,7),(139,9.00,19020956,3,1),(140,8.00,19020956,4,8),(141,1.00,19020956,1,9),(142,4.00,19020957,2,10),(143,7.00,19020957,3,12),(144,10.00,19020957,4,16),(145,4.00,19020959,1,18),(146,8.00,19020959,2,6),(147,0.00,19020959,3,3),(148,3.00,19020960,4,2),(149,1.00,19020960,1,5),(150,9.00,19020960,2,4),(151,2.00,20020967,3,18),(152,4.00,20020967,4,6),(153,4.00,20020967,1,3),(154,6.00,20020969,2,2),(155,1.00,20020969,3,5),(156,7.00,20020969,4,4),(157,2.00,20020984,1,7),(158,7.00,20020984,2,1),(159,2.00,20020984,3,8),(160,10.00,20020992,4,9),(161,5.00,20020992,1,10),(162,8.00,20020992,2,12),(163,9.00,20020996,3,16),(164,0.00,20020996,4,17),(165,10.00,20020996,1,19),(166,10.00,20020998,2,20),(167,6.00,20020998,3,18),(168,5.00,20020998,4,6),(169,6.00,20020999,1,3),(170,2.00,20020999,2,2),(171,3.00,20020999,3,5),(172,8.00,20021016,4,4),(173,9.00,20021016,1,7),(174,1.00,20021016,2,1),(175,7.00,20021020,3,8),(176,1.00,20021020,4,9),(177,9.00,20021020,1,10),(178,2.00,20021021,2,12),(179,0.00,20021021,3,16),(180,7.00,20021021,4,17),(181,10.00,20021026,1,19),(182,8.00,20021026,2,20),(183,2.00,20021026,3,13),(184,3.00,21021086,4,14),(185,5.00,21021086,1,15),(186,6.00,21021086,2,18),(187,7.00,21021157,3,6),(188,2.00,21021157,4,3),(189,4.00,21021157,1,2),(190,8.00,21021170,2,5),(191,1.00,21021170,3,4),(192,6.00,21021170,4,7),(193,7.00,21021183,1,1),(194,3.00,21021183,2,8),(195,5.00,21021183,1,9),(196,4.00,21021191,2,10),(197,5.00,21021191,3,12),(198,5.00,21021191,4,16),(199,4.00,21021193,1,17),(200,6.00,21021193,2,19),(201,1.00,21021193,3,20),(202,9.00,21021200,4,13),(203,6.00,21021200,1,14),(204,6.00,21021200,2,15),(205,1.00,21021207,3,1),(206,5.00,21021207,4,2),(207,9.00,21021207,1,3),(208,1.00,21021670,2,11),(209,5.00,21021670,3,15),(210,3.00,21021670,1,11),(211,6.00,21021670,1,12);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `instructor_id` int unsigned NOT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`instructor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Vũ Bá Duy','vbduy@vnu.edu.vn'),(2,'Trần Quốc Long','tqlong@vnu.edu.vn'),(3,'Nguyễn Thị Cẩm Vân','ntcamvan@vnu.edu.vn'),(4,'Lê Phê Đô','dolp@vnu.edu.vn'),(5,'Nguyễn Thị Thanh','ntthanh@vnu.edu.vn'),(6,'Nguyễn Quang Minh','nqminh@vnu.edu.vn'),(7,'Hoàng Xuân Tùng','hxtung@vnu.edu.vn'),(8,'Nguyễn Thị Vân','ntvan@vnu.edu.vn'),(9,'Nguyễn Thị Hồng','nthong@vnu.edu.vn');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `major_id` int unsigned NOT NULL,
  `major_name` varchar(255) NOT NULL,
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,'Công nghệ thông tin CLC'),(2,'Khoa học máy tính CLC'),(3,'Hệ thống thông tin CLC'),(4,'Mạng máy tính và truyền thông dữ liệu CLC'),(5,'Công nghệ thông tin'),(6,'Công nghệ thông tin định hướng thị trường Nhật Bản'),(7,'Trí tuệ nhân tạo'),(8,'Công nghệ kỹ thuât điện tử - viễn thông CLC'),(9,'Kỹ thuật máy tính'),(10,'Kỹ thuật robot'),(11,'Công nghệ kỹ thuật Cơ điện tử CLC'),(12,'Kỹ thuật điều khiển và tự động hóa'),(13,'Cơ kỹ thuật'),(14,'Vật lý kỹ thuật'),(15,'Kỹ thuật năng lượng'),(16,'Công nghệ kỹ thuật xây dựng'),(17,'Công nghệ hàng không vũ trụ'),(18,'Công nghệ nông nghiệp');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `semester_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`semester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,'Học kỳ 1 năm học 2021-2022','2021-08-29','2021-12-11'),(2,'Học kỳ 2 năm học 2021-2022','2022-01-30','2022-05-28'),(3,'Học kỳ 1 năm học 2022-2023','2022-08-29','2022-12-11'),(4,'Học kỳ 2 năm học 2022-2023','2023-01-30','2023-05-28');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `class_id` int unsigned NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_class_id_foreign` (`class_id`),
  CONSTRAINT `student_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (19020877,'Trần Minh Anh','2001-01-05','Nam','Hà Nội','2822557302',5),(19020878,'Lê Hải Anh','2001-03-27','Nam','Hồ Chí Minh','6342670839',3),(19020879,'Lê Đức Anh','2001-02-07','Nam','Hà Nội','9552328806',4),(19020880,'Trịnh Đình Đức Anh','2001-05-22','Nam','Hà Nội','9743931520',4),(19020882,'Phạm Quang Anh','2001-01-04','Nam','Hồ Chí Minh','9074136985',4),(19020883,'Nguyễn Tuấn Anh','2001-12-25','Nam','Hà Nội','3903159818',2),(19020886,'Trương Trọng Chiến','2001-05-26','Nữ','Hà Nội','1999644229',4),(19020887,'Nguyễn Văn Chinh','2001-03-15','Nữ','Hồ Chí Minh','9298496674',4),(19020889,'Trương Quốc Đạt','2001-01-01','Nữ','Hà Nội','7225084940',1),(19020893,'Phạm Tuấn Đạt','2001-04-24','Nữ','Hà Nội','5918401926',4),(19020894,'Phan Quốc Đạt','2001-03-31','Nữ','Hà Nội','9000371922',2),(19020896,'Lê Đàm Hồng Đức','2001-04-27','Nam','Hồ Chí Minh','1697714683',3),(19020897,'Hoàng Văn Đức','2001-12-02','Nam','Hồ Chí Minh','8635324135',5),(19020898,'Trần Lê Đức','2001-12-14','Nữ','Hồ Chí Minh','2717700922',4),(19020899,'Vũ Minh Đức','2001-11-12','Nữ','Hồ Chí Minh','9980218202',1),(19020902,'Văn Ngọc Đức','2000-10-20','Nam','Hồ Chí Minh','8513313545',3),(19020905,'Nguyễn Mạnh Dũng','2001-03-29','Nam','Hà Nội','1431925556',2),(19020906,'Ngô Đình Dương','2001-06-28','Nữ','Hồ Chí Minh','7322231157',4),(19020909,'Nguyễn Quang Duy','2001-03-16','Nam','Hà Nội','4233232850',4),(19020910,'Lê Ngọc Duy','2001-06-04','Nữ','Hồ Chí Minh','9158031840',3),(19020917,'Nguyễn Khánh Hiệp','2001-01-05','Nữ','Hà Nội','9743069041',5),(19020918,'Đỗ Hoàng Hiệp','2001-11-18','Nam','Hà Nội','5259335328',2),(19020920,'Phạm Trung Hiếu','2001-02-23','Nữ','Hồ Chí Minh','8287459311',5),(19020922,'Đào Mạnh Hoàng','2001-03-29','Nữ','Hà Nội','3002620481',5),(19020923,'Đặng Thế Hoàng','2001-06-04','Nam','Hồ Chí Minh','3898098548',4),(19020925,'Nguyễn Huy Hoàng','2001-02-22','Nam','Hà Nội','5115595607',1),(19020928,'Trần Duy Hưng','2001-02-10','Nam','Hà Nội','5951625743',2),(19020929,'Nguyễn Thái Hưng','2001-01-08','Nữ','Hồ Chí Minh','4833789348',3),(19020930,'Nguyễn Lâm Vĩnh Hưng','1999-08-20','Nam','Hà Nội','6378030505',5),(19020931,'Lê Xuân Huy','2001-12-09','Nam','Hồ Chí Minh','9057307317',3),(19020933,'Phạm Quốc Huy','2000-03-01','Nữ','Hồ Chí Minh','5681695919',1),(19020935,'Nguyễn Đức Huy','2001-05-27','Nữ','Hà Nội','1181760962',3),(19020936,'Phạm Thị Huyền','2001-07-31','Nam','Hồ Chí Minh','8603263016',1),(19020937,'Hoàng Xuân Khoa','2001-04-30','Nữ','Hà Nội','3164667133',1),(19020938,'Bùi Đình Khôi','2001-12-17','Nam','Hà Nội','9443819612',3),(19020939,'Hoàng Kim Trung Kiên','2000-09-23','Nam','Hồ Chí Minh','3389592861',5),(19020940,'Vũ Trung Kiên','2001-12-16','Nam','Hà Nội','3402349941',2),(19020941,'Hoàng Hách Trung Kiên','2001-07-17','Nữ','Hồ Chí Minh','8143631060',2),(19020942,'Nguyễn Hoàng Linh','2001-01-25','Nam','Hà Nội','8940114782',2),(19020943,'Lê Đức Lộc','2001-10-21','Nam','Hà Nội','2939839987',4),(19020947,'Hoàng Viết Lưu','2001-01-24','Nữ','Hồ Chí Minh','9954048686',3),(19020948,'Hà Văn Mạnh','2001-01-23','Nam','Hà Nội','3881817395',3),(19020951,'Hoàng Công Mạnh','2001-08-09','Nam','Hà Nội','9248550999',4),(19020953,'Hán Văn Minh','2001-06-19','Nữ','Hà Nội','6632785384',1),(19020954,'Vũ Đình Minh','2001-09-16','Nam','Hồ Chí Minh','6596539409',4),(19020956,'Nguyễn Ngọc Nam','1999-07-22','Nam','Hà Nội','3527200386',4),(19020957,'Đỗ Thành Nam','2001-10-23','Nữ','Hà Nội','9099150316',1),(19020959,'Nguyễn Hồ Nam','2001-11-22','Nam','Hồ Chí Minh','2223078843',4),(19020960,'Đặng Phương Nam','2001-04-07','Nữ','Hồ Chí Minh','5585430857',4),(19020963,'Trần Văn Ninh','2001-04-28','Nam','Hồ Chí Minh','9993763156',1),(19020964,'Đoàn Dương Phúc','2001-12-25','Nữ','Hồ Chí Minh','9457106237',4),(19020965,'Trần Duy Phúc','2001-08-13','Nữ','Hồ Chí Minh','2213803901',4),(19020966,'Cao Thanh Phương','2001-11-11','Nữ','Hà Nội','9629505180',1),(19020970,'Phạm Minh Quang','2001-03-24','Nữ','Hà Nội','8358310437',3),(19020971,'Nguyễn Ngọc Sơn','2001-11-18','Nam','Hà Nội','3643589354',5),(19020972,'Thân Văn Sơn','2001-03-21','Nam','Hà Nội','2816779660',4),(19020975,'Đỗ Trung Tá','2001-04-26','Nam','Hồ Chí Minh','6725546187',5),(19020976,'Phạm Hoàng Thạch','2001-02-04','Nữ','Hồ Chí Minh','4982477735',2),(19020977,'Nguyễn Văn Thái','2001-01-01','Nam','Hồ Chí Minh','9136810745',2),(19020978,'Đinh Hồng Thái','2001-08-22','Nữ','Hà Nội','4342784043',1),(19020980,'Nguyễn Xuân Thắng','2001-06-05','Nam','Hà Nội','7119906129',1),(19020982,'Tạ Huy Thiên','2001-01-14','Nam','Hồ Chí Minh','3846219774',2),(19020983,'Nguyễn Văn Thông','2001-06-27','Nữ','Hồ Chí Minh','1422876109',5),(19020987,'Vũ Huy Trình','2001-08-20','Nam','Hồ Chí Minh','7131562578',1),(19020988,'Nguyễn Văn Trung','2001-10-02','Nam','Hồ Chí Minh','8649166975',3),(19020989,'Vũ Xuân Trường','2001-01-26','Nam','Hà Nội','2806560084',3),(19020990,'Bùi Văn Trường','2001-06-12','Nữ','Hà Nội','4850793861',1),(19020991,'Nguyễn Thành Trưởng','2001-07-27','Nam','Hồ Chí Minh','7727081020',3),(19020995,'Nghiêm Xuân Việt','2001-09-28','Nữ','Hà Nội','8636648885',5),(19020996,'Đỗ Thành Vinh','2001-08-13','Nữ','Hồ Chí Minh','5516138094',1),(19020997,'Chu Nguyên Vũ','2001-08-24','Nữ','Hà Nội','8702079164',2),(20020967,'Trịnh Hùng Cường','2002-08-26','Nữ','Hà Nội','7362460889',5),(20020969,'Đàm Tiến Dũng','2002-09-22','Nam','Hà Nội','8142026290',1),(20020984,'Lê Bá Đức','2002-09-18','Nữ','Hồ Chí Minh','7747371893',5),(20020992,'Nguyễn Minh Hiếu','2002-04-01','Nữ','Hà Nội','4259917848',3),(20020996,'Đào Quốc Hoàn','2002-10-19','Nam','Hồ Chí Minh','6089253032',2),(20020998,'Lại Minh Hoàng','2002-02-03','Nữ','Hà Nội','4084985103',3),(20020999,'Nguyễn Phương Huế','2002-12-02','Nữ','Hà Nội','8849200151',5),(20021016,'Nguyễn Trọng Mạnh','2002-07-24','Nữ','Hồ Chí Minh','7694530398',2),(20021020,'Đặng Hoài Nam','2002-01-17','Nam','Hà Nội','6496091662',4),(20021021,'Hoàng Tiến Nam','2000-02-28','Nữ','Hồ Chí Minh','9750657878',5),(20021026,'Trần Bảo Ngọc','2002-10-10','Nam','Hà Nội','8442795388',1),(20021028,'Lê Quang Ninh','2002-06-04','Nam','Hồ Chí Minh','4716108789',5),(20021037,'Văn Đức Phúc','2002-12-22','Nữ','Hà Nội','7856274295',4),(20021063,'Lê Văn Thưởng','2002-04-14','Nam','Hà Nội','5047838451',2),(20021073,'Dương Đức Tuấn','2002-11-22','Nam','Hà Nội','7134194011',3),(20021076,'Nguyễn Mạnh Tường','2002-03-26','Nữ','Hà Nội','3320317920',5),(20021079,'Trần Thị Xen','2002-01-20','Nữ','Hà Nội','8148661150',5),(21021086,'Phạm Minh Hiển','2003-02-28','Nam','Hà Nội','7303645233',5),(21021157,'Đoàn Dung Cơ','2002-11-17','Nữ','Hà Nội','1542343072',3),(21021170,'Nguyễn Minh Đức','2003-11-14','Nam','Hồ Chí Minh','7241299542',5),(21021183,'Hoàng Minh Hiếu','2002-05-25','Nam','Hà Nội','8710437700',1),(21021191,'Phạm Đăng Hùng','2003-12-12','Nữ','Hồ Chí Minh','2736446783',3),(21021193,'Khuất Quang Huy','2003-08-07','Nữ','Hồ Chí Minh','3475149020',3),(21021200,'Nguyễn Thị Hương','2003-05-13','Nữ','Hà Nội','4277130610',4),(21021207,'Trương Hải Long','2002-11-21','Nam','Hà Nội','6097510022',3),(21021226,'Lê Thị Thu Phương','2001-06-18','Nam','Hồ Chí Minh','4047875197',5),(21021238,'Trần Xuân Thành','2003-04-17','Nam','Hồ Chí Minh','8336103473',4),(21021244,'Nguyễn Ngọc Toàn','2003-10-01','Nam','Hồ Chí Minh','8709783876',5),(21021670,'Đoàn Minh Châu','2002-01-11','Nữ','Hồ Chí Minh','3899333751',3);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-18  0:05:45
