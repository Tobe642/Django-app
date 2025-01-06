-- MySQL dump 10.13  Distrib 8.4.3, for Linux (x86_64)
--
-- Host: c2088748.mysql.database.azure.com    Database: module_registration_system
-- ------------------------------------------------------
-- Server version	8.0.39-azure

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (7,'auditing'),(2,'biology'),(1,'entrepreneurship'),(5,'game development'),(6,'iot'),(3,'management'),(8,'marketing'),(4,'paracetamol class');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add student',7,'add_student'),(26,'Can change student',7,'change_student'),(27,'Can delete student',7,'delete_student'),(28,'Can view student',7,'view_student'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add course',9,'add_course'),(34,'Can change course',9,'change_course'),(35,'Can delete course',9,'delete_course'),(36,'Can view course',9,'view_course'),(37,'Can add module',10,'add_module'),(38,'Can change module',10,'change_module'),(39,'Can delete module',10,'delete_module'),(40,'Can view module',10,'view_module'),(41,'Can add registration',11,'add_registration'),(42,'Can change registration',11,'change_registration'),(43,'Can delete registration',11,'delete_registration'),(44,'Can view registration',11,'view_registration');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$2EFhcSLupNbh1R2MjXrbFA$GKjzj9E2ADxBmWuonv2gwAfTs/YBW1l477W1OaM8UCI=','2024-12-17 23:40:02.861534',1,'c2088748','','','Tobeagunenye@gmail.com',1,1,'2024-12-09 20:03:45.482725'),(2,'pbkdf2_sha256$870000$vkJzUjhb0AqBBJTXyAzb92$FjAk2h7onIJ4qoUeuiYFtjbPisG2uzKvAlPp3PsZ1yI=','2024-12-13 15:32:27.086455',1,'vee','','','vee@shu.local',1,1,'2024-12-13 15:32:15.476059'),(3,'pbkdf2_sha256$870000$LaYmkWow8vnal7vzXirqxS$idl2MGbq1+Yg2HXgfo8VMmPTxcNBXt2vuCsI1X2pSy4=',NULL,0,'steve','','','',0,1,'2024-12-15 16:05:04.953087'),(4,'pbkdf2_sha256$870000$eTtXBNWuxwwDNyCAnWS9Lj$MNfPpJP+AbvMFMC4ACNS6Es5CSDZmww/JPRMQOYPGa0=',NULL,0,'john','','','',0,1,'2024-12-15 16:07:10.881240'),(5,'pbkdf2_sha256$870000$PmjH2c9k0lBbfjsm8stNlR$7s07irNGCewEU8Ai8uLskpKSPnqYT+VRdJ359TAa+MQ=',NULL,0,'ella','ella','jude','ellajude@gmail.com',0,1,'2024-12-15 16:18:34.000000'),(6,'pbkdf2_sha256$870000$I3sPavvPdAvF90eO4iViw6$EjLfNzkft8mQ7orZBiXJvkW8u/SyuDSjSkj7lpW9Cxw=',NULL,0,'timmy','tim','timothy','Tim@tim.com',0,1,'2024-12-15 16:22:29.372632'),(7,'pbkdf2_sha256$870000$4VY3MZRmGypHFpnNjcDv5M$HRRzlsXHq0nduO71aViVVayObojX21a36rS1vPprJmM=',NULL,0,'joey123','joey','Johnson','Tim@tim.com',0,1,'2024-12-15 16:28:39.007291'),(8,'pbkdf2_sha256$870000$JG69rHguKqWbm4ZQVpdYrt$uIq/rUPqEF38BV4twokWVEvvA9F+G1a/oTs2wciUDk0=','2024-12-16 10:53:56.970307',0,'percy','percy','zim','percy@percy.cvom',0,1,'2024-12-15 16:40:37.523385'),(9,'pbkdf2_sha256$870000$zQfPzp4q3DgB71JvOLi5CE$dyd9OjbSe1J4akvxYgKZN5wPeJ7i37SIo11FGJTUYb4=',NULL,0,'lola','','','',0,1,'2024-12-15 16:41:25.981455'),(10,'pbkdf2_sha256$870000$PiKbvfGKl9YZnZcjWsNHxN$oWkYMrOo20aDO53GL9DBTuGeJSX1GxhyVEPQGxhF080=',NULL,0,'sam','samuel','olu','sam@sam.com',0,1,'2024-12-15 16:59:37.000000'),(11,'pbkdf2_sha256$870000$gp1zWIkGQuNhcPLSfRbp8G$ZRd38YgCF/6u+MQimsR3LJes9fzN6dapn5QFaH1Fc88=',NULL,0,'darren','','','',0,1,'2024-12-15 17:00:16.338126'),(12,'pbkdf2_sha256$870000$CgtUvjYwy1in6gqHvBoJzd$VmBBN4Rcpvq82uST0TNdbLvM9lf7jRLcCDz1lbm9yxg=',NULL,0,'steph','steph','ulo','steph@ulo.com',0,1,'2024-12-15 17:10:02.442581'),(13,'pbkdf2_sha256$870000$V6lWtXyP0brz0DnvTEWvtt$684ZqMUMDio2A7MzNX98+JwBXy0jx2cWwMowoKkUrjw=','2024-12-17 16:13:28.598339',0,'Tobe1242','Tobe','Agunenye','Tobeagunenye@gmail.com',0,1,'2024-12-16 06:24:23.067168'),(14,'pbkdf2_sha256$870000$ZyfTSmbs3jwc56dSnpQBWv$crbZfjpcw2E+Yfa+DwwCflYlQySMKeQG+yaTfTgnREM=','2024-12-16 06:50:47.667956',0,'jenny','jen','jenny','jen@jen.com',0,1,'2024-12-16 06:50:35.302760'),(15,'pbkdf2_sha256$870000$Jsn3H2iNtHxKcL6VUAmHz7$/hvyKPLQYbF9qBPrNV4AyFChn33qHAzPulwW05nHiZk=','2025-01-02 19:33:11.257064',0,'ceesokoh','chenille','sokoh','ceesokoh@gmail.com',0,1,'2024-12-16 10:35:01.959877'),(16,'pbkdf2_sha256$870000$RCzLBRFOuwdsbB0Z8xjJeW$b9siiJoatf0hCyXjj3VkV/QgHJEARjChUUH4ouGtgdc=','2024-12-16 10:56:02.482007',0,'jonathan123','johnathan','michaels','jonathanmichaels@gmail.com',0,1,'2024-12-16 10:54:51.842107'),(17,'pbkdf2_sha256$870000$OiKEgfRWLzT8iw6EoPC6j5$z42IG+C3rOTIGmD3B8rJjITfj/Of59Qsil6xPg3cLos=','2025-01-01 12:23:18.712458',0,'tobe642','tobe','agunenye','tobe@hotmail.com',0,1,'2024-12-16 11:01:53.912210'),(18,'pbkdf2_sha256$870000$yA4SewLgO7IPadvFC2U18T$kLyWjt8kfrKsGxkxMqJLLOhAjfkuj8aQwLGexybkMMY=',NULL,0,'rs3mybrevvva','wasim','khan','owimbo@im.com',0,1,'2024-12-17 13:43:04.763343'),(19,'pbkdf2_sha256$870000$8EWMVKSOxweJXtkI0OFQbz$dUnMGgd420k/WJksqBICGhmCJYMNEhPFdjEIxwX8vcM=','2025-01-01 12:53:48.219911',0,'jacky123','mikeson','jacky','jackymike@shu.com',0,1,'2025-01-01 12:53:19.558891'),(20,'pbkdf2_sha256$870000$vQKYPIgbLusdHUely3hlJD$2Qg4zVI9qufnijRmLvigrtBGZG0oJp9fXLoQcmuvOSQ=','2025-01-02 22:54:43.892796',1,'student','','','Student@shu.co.uk',1,1,'2025-01-01 15:22:32.664686');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,1,2),(3,1,3),(6,1,4),(17,1,6),(19,1,8),(27,15,1),(22,17,2),(21,17,7),(26,20,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_category`
--

DROP TABLE IF EXISTS `categories_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_category`
--

LOCK TABLES `categories_category` WRITE;
/*!40000 ALTER TABLE `categories_category` DISABLE KEYS */;
INSERT INTO `categories_category` VALUES (1,'Classroom','Classroom based Courses only');
/*!40000 ALTER TABLE `categories_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` longtext,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'Business','1','Welcome to business','course_images/resize.jpeg'),(2,'Medicine','2','Welcome to medicine','course_images/medicine1.jpg'),(3,'Accounting','3','Welcome to accounting','course_images/accounting.webp'),(4,'Computer science','4','Welcome to computer science','course_images/computingh.jpeg'),(5,'Engineering','5','Welcome to engineering','course_images/engineering.jpg');
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-12-12 23:06:44.359082','1','Business',1,'[{\"added\": {}}]',9,1),(2,'2024-12-12 23:07:20.997470','2','Medicine',1,'[{\"added\": {}}]',9,1),(3,'2024-12-12 23:07:43.912191','3','Accounting',1,'[{\"added\": {}}]',9,1),(4,'2024-12-12 23:08:04.725252','4','Computer science',1,'[{\"added\": {}}]',9,1),(5,'2024-12-13 15:38:36.051263','1','Classroom',1,'[{\"added\": {}}]',8,2),(6,'2024-12-13 15:39:35.888666','1','Designing Cloud-based Systems',1,'[{\"added\": {}}]',10,2),(7,'2024-12-14 20:31:32.358929','1',' ',1,'[{\"added\": {}}]',7,1),(8,'2024-12-14 22:48:55.867070','2','iot',1,'[{\"added\": {}}]',10,1),(9,'2024-12-14 22:49:26.447116','3','finance',1,'[{\"added\": {}}]',10,1),(10,'2024-12-14 22:49:44.735370','4','budgeting',1,'[{\"added\": {}}]',10,1),(11,'2024-12-14 22:50:23.502440','5','biochemistry',1,'[{\"added\": {}}]',10,1),(12,'2024-12-14 22:50:43.299675','6','paracetamol class',1,'[{\"added\": {}}]',10,1),(13,'2024-12-14 22:51:04.280056','7','marketing',1,'[{\"added\": {}}]',10,1),(14,'2024-12-14 22:51:30.460763','8','entrepreneurship',1,'[{\"added\": {}}]',10,1),(15,'2024-12-15 16:05:05.618978','3','steve',1,'[{\"added\": {}}]',4,1),(16,'2024-12-15 16:07:11.546868','4','john',1,'[{\"added\": {}}]',4,1),(17,'2024-12-15 16:18:34.924327','5','ella',1,'[{\"added\": {}}]',4,1),(18,'2024-12-15 16:25:34.411245','4','tim timothy',1,'[{\"added\": {}}]',7,1),(19,'2024-12-15 16:33:57.755115','5','ella',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(20,'2024-12-15 16:35:13.322834','5','ella',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(21,'2024-12-15 16:41:26.678664','9','lola',1,'[{\"added\": {}}]',4,1),(22,'2024-12-15 17:00:16.979578','11','darren',1,'[{\"added\": {}}]',4,1),(23,'2024-12-15 17:26:00.865743','10','sam',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',4,1),(24,'2024-12-16 00:44:28.169381','5','engineering',1,'[{\"added\": {}}]',9,1),(25,'2024-12-16 00:44:50.822590','5','Engineering',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(26,'2024-12-16 10:54:52.501681','16','jonathan123',1,'[{\"added\": {}}]',4,1),(27,'2024-12-16 17:31:01.331093','6','paracetamol class',2,'[{\"changed\": {\"fields\": [\"Courses\"]}}]',10,1),(28,'2024-12-16 17:38:47.384853','5','biochemistry',2,'[{\"changed\": {\"fields\": [\"Courses\"]}}]',10,1),(29,'2024-12-16 17:39:40.172802','9','management',1,'[{\"added\": {}}]',10,1),(30,'2024-12-16 17:44:19.967544','10','biology',1,'[{\"added\": {}}]',10,1),(31,'2024-12-16 17:44:52.086254','11','auditing',1,'[{\"added\": {}}]',10,1),(32,'2024-12-16 17:45:27.996447','12','game development',1,'[{\"added\": {}}]',10,1),(33,'2024-12-17 13:02:56.153341','1','c2088748 iot',1,'[{\"added\": {}}]',11,1),(34,'2024-12-17 13:38:43.024484','5','c2088748 paracetamol class',3,'',11,1),(35,'2024-12-17 13:38:56.979300','4','c2088748 management',3,'',11,1),(36,'2024-12-17 13:38:56.979338','3','c2088748 biology',3,'',11,1),(37,'2024-12-17 13:38:56.979358','2','c2088748 entrepreneurship',3,'',11,1),(38,'2024-12-17 13:38:56.979375','1','c2088748 iot',3,'',11,1),(39,'2024-12-17 23:28:04.368351','7','marketing',2,'[{\"changed\": {\"fields\": [\"Available\"]}}]',10,1),(40,'2024-12-17 23:52:36.132174','5','Engineering',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(41,'2024-12-17 23:59:50.441447','2','Medicine',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(42,'2024-12-18 00:01:32.366859','2','Medicine',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(43,'2024-12-18 00:06:48.208021','3','Accounting',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(44,'2024-12-18 00:07:48.415827','4','Computer science',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1),(45,'2024-12-18 00:08:04.215779','2','Medicine',2,'[]',9,1),(46,'2024-12-18 00:09:15.372171','1','Business',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'categories','category'),(5,'contenttypes','contenttype'),(9,'courses','course'),(10,'modules','module'),(11,'registrations','registration'),(6,'sessions','session'),(7,'students','student');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-12-09 18:54:54.541378'),(2,'auth','0001_initial','2024-12-09 18:54:56.516587'),(3,'admin','0001_initial','2024-12-09 18:54:56.999272'),(4,'admin','0002_logentry_remove_auto_add','2024-12-09 18:54:57.022360'),(5,'admin','0003_logentry_add_action_flag_choices','2024-12-09 18:54:57.047018'),(6,'contenttypes','0002_remove_content_type_name','2024-12-09 18:54:57.320958'),(7,'auth','0002_alter_permission_name_max_length','2024-12-09 18:54:57.520310'),(8,'auth','0003_alter_user_email_max_length','2024-12-09 18:54:57.709925'),(9,'auth','0004_alter_user_username_opts','2024-12-09 18:54:57.732892'),(10,'auth','0005_alter_user_last_login_null','2024-12-09 18:54:57.926272'),(11,'auth','0006_require_contenttypes_0002','2024-12-09 18:54:57.944477'),(12,'auth','0007_alter_validators_add_error_messages','2024-12-09 18:54:57.968407'),(13,'auth','0008_alter_user_username_max_length','2024-12-09 18:54:58.179042'),(14,'auth','0009_alter_user_last_name_max_length','2024-12-09 18:54:58.375680'),(15,'auth','0010_alter_group_name_max_length','2024-12-09 18:54:58.563470'),(16,'auth','0011_update_proxy_permissions','2024-12-09 18:54:58.618044'),(17,'auth','0012_alter_user_first_name_max_length','2024-12-09 18:54:58.817576'),(18,'sessions','0001_initial','2024-12-09 18:54:58.955597'),(19,'students','0001_initial','2024-12-09 18:54:59.227339'),(20,'categories','0001_initial','2024-12-09 19:41:43.317354'),(21,'courses','0001_initial','2024-12-09 20:00:34.621015'),(22,'modules','0001_initial','2024-12-09 23:01:55.988131'),(23,'modules','0002_alter_module_available','2024-12-09 23:30:48.472582'),(24,'modules','0003_alter_module_available','2024-12-09 23:30:48.496335'),(25,'registrations','0001_initial','2024-12-09 23:30:48.955136'),(26,'registrations','0002_alter_registration_date','2024-12-09 23:30:49.143312'),(27,'modules','0004_alter_module_available','2024-12-13 15:36:19.399316'),(28,'categories','0002_alter_category_options','2024-12-15 17:09:06.348824'),(29,'modules','0005_alter_module_available','2024-12-15 17:09:06.371141'),(30,'modules','0006_alter_module_available','2024-12-15 17:13:33.068133'),(31,'modules','0007_alter_module_available','2024-12-15 17:31:16.192162'),(32,'modules','0008_alter_module_available','2024-12-15 17:31:16.214208'),(33,'modules','0009_alter_module_available','2024-12-16 16:14:58.623819'),(34,'modules','0010_alter_module_available','2024-12-16 16:14:58.645622'),(35,'modules','0011_alter_module_available','2024-12-16 16:14:58.666713'),(36,'modules','0012_module_enrolled_students_module_instructors_and_more','2024-12-16 16:14:59.743947'),(37,'modules','0013_remove_module_instructors_alter_module_available','2024-12-16 16:14:59.836629'),(38,'modules','0014_remove_module_enrolled_students','2024-12-16 16:14:59.922953'),(39,'modules','0015_module_enrolled_students_alter_module_available','2024-12-16 16:15:00.461302'),(40,'modules','0016_alter_module_available','2024-12-16 16:15:00.489851'),(41,'courses','0002_course_image','2024-12-17 23:38:51.357328'),(42,'modules','0017_alter_module_available','2024-12-17 23:38:51.384223'),(43,'modules','0018_alter_module_available','2024-12-30 13:23:30.514757'),(44,'modules','0019_alter_module_available','2025-01-01 15:19:50.611466'),(45,'registrations','0003_alter_registration_unique_together','2025-01-01 15:19:50.870074');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4f9rqlhi51ln964qp0oj5y4wl1lee1js','e30:1tN4X0:Ufow3Z-S4on6gFM3dlYXl3623XO3xdCsyekCZNOm-jE','2024-12-30 06:24:38.992121'),('5no5onsodysupqqrf3ll87c6z9377uku','e30:1tN5YF:YK1y24I8DijkyzHpSF1W7Rk2luItgUX7vL08xaFk3U4','2024-12-30 07:29:59.263740'),('8jva2rpde0ha2d0h4plz1xwfwbcn7dw7','.eJxVjDsOwjAQBe_iGlk4_lPS5wzWeneNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUkTiYtQ4vS7ZcAHtx3QHdptlji3dZmy3BV50C7Hmfh5Pdy_gwq9fmuP4G0x2iMxZquKy1pDDJYMg7NWO-RAA3oCKMZHyCWGAbPRjtXZknh_AAg8OM4:1tNYBC:XbolMCcxFEENdcOshNKRmM9pCG-ERc1IAseKS-57nWo','2024-12-31 14:04:06.772824'),('9rxvrjfpefh3zf95dkx1metqmf3lsxys','e30:1tN4wJ:ot1UWgKQoF_ychLCShi1qFp2A5l3rO-hRtEhVpXXfk8','2024-12-30 06:50:47.616477'),('b1x4reh5wqn6k0ldtnclszykloe4r3xd','.eJxVjEEOwiAQRe_C2hBgSmlduvcMZGBmpGpoUtqV8e7apAvd_vfef6mI21ri1niJE6mzskGdfseE-cF1J3THept1nuu6TEnvij5o09eZ-Hk53L-Dgq1868zYu845Fo_SiyP2QH4IErIlwxkCsxhwNAZjRt8RCCebBSyCwIDq_QEuyDj1:1tN8xh:7CTzhCXuT1-TIk2kIVUwUm6lneIEaeu_FgWCcn0AMsI','2024-12-30 11:08:29.967671'),('bsmhps6sdglglcugkh4za1xapmf9y37u','.eJxVjDsOwjAQBe_iGlk4_lPS5wzWeneNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUkTiYtQ4vS7ZcAHtx3QHdptlji3dZmy3BV50C7Hmfh5Pdy_gwq9fmuP4G0x2iMxZquKy1pDDJYMg7NWO-RAA3oCKMZHyCWGAbPRjtXZknh_AAg8OM4:1tNhAY:GOoFHN96vRljRnh_cJLzwLvwAadiQC2rFaM7qp1kAos','2024-12-31 23:40:02.892998'),('cp5cfs840ewtaeqsnu7bfnd0o4jixzh2','.eJxVjDsOwjAQBe_iGlk4_lPS5wzWeneNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUkTiYtQ4vS7ZcAHtx3QHdptlji3dZmy3BV50C7Hmfh5Pdy_gwq9fmuP4G0x2iMxZquKy1pDDJYMg7NWO-RAA3oCKMZHyCWGAbPRjtXZknh_AAg8OM4:1tKjzS:lsS0H9zKfD_ybPSbY4_TWgZa9BWagTZ0A_LN6hHoyGI','2024-12-23 20:04:22.239431'),('h4yxoqcq2jfeorp43tg9sufqz6s5rmg0','e30:1tN5XR:86vg-sjiFQgi4wBDQh0PmcUv7UyshJDBkyarHnqOvAo','2024-12-30 07:29:09.868717'),('ist7euyqcuj45swlwujd10hu5gktya1h','e30:1tN4iK:2CyyaEQOQQ9HdualAMA7Rv4FhgtZ13HrFVN81OY8cw8','2024-12-30 06:36:20.221158'),('mc3iuwguigs6txj7nlgusqqf9uv3whr3','.eJxVjDsOwjAQBe_iGlk4_lPS5wzWeneNA8iR4qRC3B0ipYD2zcx7iQTbWtPWeUkTiYtQ4vS7ZcAHtx3QHdptlji3dZmy3BV50C7Hmfh5Pdy_gwq9fmuP4G0x2iMxZquKy1pDDJYMg7NWO-RAA3oCKMZHyCWGAbPRjtXZknh_AAg8OM4:1tLsG9:KlmMAtzUSwaUzhkCw2dZuZZS1bjoGe4WhTQWxwAadhc','2024-12-26 23:06:17.768042'),('v2xeit46x21urbfnxoa35o40239hjnik','e30:1tN4kB:Rmt1kc1iiWPr4GdVg4KHeytDYh6TOs3yXRQev-ULGLI','2024-12-30 06:38:15.509136'),('wlmsxxgr1fa5pgdln673p3tyml55hrip','.eJxVjMsOwiAQRf-FtSG8B1y69xvIAINUDU1KuzL-uzbpQrf3nHNfLOK2trgNWuJU2JkpdvrdEuYH9R2UO_bbzPPc12VKfFf4QQe_zoWel8P9O2g42reWGlXA5AwSWQGAWkEga0MmCSACGp1tEDZJb3ytoKs0TnqRSgIjnWDvD8suNuY:1tM7eV:6aX_rIG8isGTQ_ZfU4AJM-TYvMk2aDCcoQxxBgiJCsQ','2024-12-27 15:32:27.105431'),('y1fkj3za8hq5588dd89o3xqcct5od2g1','e30:1tN51G:MhEKp-jT5Ey8QgUVouebf02BQqIXwo4pxtHW8DM6Elg','2024-12-30 06:55:54.284542'),('y55onwduqd55p0mm2a9jlkf05zif7mmr','e30:1tN4is:BSrZnlKYcY8roFOWdxNMevldl88HIiB6wJH5HU9XyHc','2024-12-30 06:36:54.942142'),('z00o5bitzvetmqfedlg1dmbkcoh11df0','.eJxVzM0OwiAQBOB34WwI0PLn0XufgewCK1VDk9KejO9uSXrQ63wz82YB9q2EveU1zIldmRLs8hsixGeuXdID6n3hcanbOiPvFX5q49OS8ut2dv8OCrTS15KURQOUPUWtBmfBDIAInhDH0TkCGX2S1hyihNDpYJmiEppIG2SfLytvOL8:1tTU5T:6W_DQ1AxO5cuYhhz7e1z04W8xcBekb7AtMFPv8BZ_LQ','2025-01-16 22:54:43.912739');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules_module`
--

DROP TABLE IF EXISTS `modules_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules_module` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `credit` int NOT NULL,
  `description` longtext,
  `available` varchar(255) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modules_module_category_id_c1b9642a_fk_categories_category_id` (`category_id`),
  CONSTRAINT `modules_module_category_id_c1b9642a_fk_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules_module`
--

LOCK TABLES `modules_module` WRITE;
/*!40000 ALTER TABLE `modules_module` DISABLE KEYS */;
INSERT INTO `modules_module` VALUES (1,'Designing Cloud-based Systems','55-606366',30,'Some Course about Designing computer systems in the cloud','WAITLIST',1),(2,'iot','123',30,'','OPEN',1),(3,'finance','1234',30,'','CLOSED',1),(4,'budgeting','54321',30,'','WAITLIST',1),(5,'biochemistry','6161',30,'','WAITLIST',1),(6,'paracetamol class','71717',30,'','OPEN',1),(7,'marketing','818181',30,'','OPEN',1),(8,'entrepreneurship','100',30,'','OPEN',1),(9,'management','456',30,'','OPEN',1),(10,'biology','6787',30,'','OPEN',1),(11,'auditing','789',30,'','OPEN',1),(12,'game development','134',30,'','OPEN',1);
/*!40000 ALTER TABLE `modules_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules_module_courses`
--

DROP TABLE IF EXISTS `modules_module_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules_module_courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_id` bigint NOT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modules_module_courses_module_id_course_id_48ceabd1_uniq` (`module_id`,`course_id`),
  KEY `modules_module_courses_course_id_b3b421b5_fk_courses_course_id` (`course_id`),
  CONSTRAINT `modules_module_courses_course_id_b3b421b5_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `modules_module_courses_module_id_85c88147_fk_modules_module_id` FOREIGN KEY (`module_id`) REFERENCES `modules_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules_module_courses`
--

LOCK TABLES `modules_module_courses` WRITE;
/*!40000 ALTER TABLE `modules_module_courses` DISABLE KEYS */;
INSERT INTO `modules_module_courses` VALUES (1,1,4),(2,2,4),(3,3,3),(4,4,3),(8,5,2),(7,6,2),(5,7,1),(6,8,1),(9,9,1),(10,10,2),(11,11,3),(12,12,4);
/*!40000 ALTER TABLE `modules_module_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules_module_enrolled_students`
--

DROP TABLE IF EXISTS `modules_module_enrolled_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules_module_enrolled_students` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modules_module_enrolled_students_module_id_user_id_f9cb2258_uniq` (`module_id`,`user_id`),
  KEY `modules_module_enrol_user_id_354aa806_fk_auth_user` (`user_id`),
  CONSTRAINT `modules_module_enrol_module_id_ddf8e595_fk_modules_m` FOREIGN KEY (`module_id`) REFERENCES `modules_module` (`id`),
  CONSTRAINT `modules_module_enrol_user_id_354aa806_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules_module_enrolled_students`
--

LOCK TABLES `modules_module_enrolled_students` WRITE;
/*!40000 ALTER TABLE `modules_module_enrolled_students` DISABLE KEYS */;
INSERT INTO `modules_module_enrolled_students` VALUES (9,8,15),(8,9,1);
/*!40000 ALTER TABLE `modules_module_enrolled_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations_registration`
--

DROP TABLE IF EXISTS `registrations_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) DEFAULT NULL,
  `module_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registrations_registration_student_id_module_id_efc03bd9_uniq` (`student_id`,`module_id`),
  KEY `registrations_regist_module_id_f1d61892_fk_modules_m` (`module_id`),
  CONSTRAINT `registrations_regist_module_id_f1d61892_fk_modules_m` FOREIGN KEY (`module_id`) REFERENCES `modules_module` (`id`),
  CONSTRAINT `registrations_regist_student_id_4904cb27_fk_students_` FOREIGN KEY (`student_id`) REFERENCES `students_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations_registration`
--

LOCK TABLES `registrations_registration` WRITE;
/*!40000 ALTER TABLE `registrations_registration` DISABLE KEYS */;
INSERT INTO `registrations_registration` VALUES (15,'2024-12-17 23:23:23.732185',2,1),(17,'2024-12-17 23:28:11.019991',7,1),(19,'2025-01-01 12:35:42.254576',11,15),(20,'2025-01-01 12:48:22.956747',10,15),(25,'2025-01-02 19:32:48.691536',8,18),(26,'2025-01-02 19:33:40.931839',8,13);
/*!40000 ALTER TABLE `registrations_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_student`
--

DROP TABLE IF EXISTS `students_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `students_student_user_id_56286dbb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_student`
--

LOCK TABLES `students_student` WRITE;
/*!40000 ALTER TABLE `students_student` DISABLE KEYS */;
INSERT INTO `students_student` VALUES (1,'2024-12-14','1 lane','sheffield','uk','profile_pics/91abe5ff3a042475a3d7cf02d8e76cc6_XP8ZaSP.jpg',1),(2,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',3),(3,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',4),(4,'2024-12-15',NULL,NULL,NULL,'media/profile_pics/default.png',6),(5,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',7),(6,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',8),(7,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',9),(8,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',10),(9,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',11),(10,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',12),(11,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',13),(12,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',14),(13,NULL,NULL,NULL,NULL,'profile_pics/channels4_profile.jpg',15),(14,'2003-10-30','1 street lane','town city','uk','media/profile_pics/default.png',16),(15,'2003-10-30',NULL,NULL,NULL,'profile_pics/91abe5ff3a042475a3d7cf02d8e76cc6_VPXogUa.jpg',17),(16,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',18),(17,NULL,NULL,NULL,NULL,'media/profile_pics/default.png',19),(18,NULL,NULL,NULL,NULL,'profile_pics/91abe5ff3a042475a3d7cf02d8e76cc6_qoipm5y.jpg',20);
/*!40000 ALTER TABLE `students_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-02 23:12:17
