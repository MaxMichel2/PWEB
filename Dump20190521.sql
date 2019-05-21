-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: pweb_international
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add country',7,'add_country'),(26,'Can change country',7,'change_country'),(27,'Can delete country',7,'delete_country'),(28,'Can view country',7,'view_country'),(29,'Can add city',8,'add_city'),(30,'Can change city',8,'change_city'),(31,'Can delete city',8,'delete_city'),(32,'Can view city',8,'view_city'),(33,'Can add university',9,'add_university'),(34,'Can change university',9,'change_university'),(35,'Can delete university',9,'delete_university'),(36,'Can view university',9,'view_university'),(37,'Can add university contracts',10,'add_universitycontracts'),(38,'Can change university contracts',10,'change_universitycontracts'),(39,'Can delete university contracts',10,'delete_universitycontracts'),(40,'Can view university contracts',10,'view_universitycontracts'),(41,'Can add university languages',11,'add_universitylanguages'),(42,'Can change university languages',11,'change_universitylanguages'),(43,'Can delete university languages',11,'delete_universitylanguages'),(44,'Can view university languages',11,'view_universitylanguages'),(45,'Can add department',12,'add_department'),(46,'Can change department',12,'change_department'),(47,'Can delete department',12,'delete_department'),(48,'Can view department',12,'view_department'),(49,'Can add student',13,'add_student'),(50,'Can change student',13,'change_student'),(51,'Can delete student',13,'delete_student'),(52,'Can view student',13,'view_student'),(53,'Can add financial aid',14,'add_financialaid'),(54,'Can change financial aid',14,'change_financialaid'),(55,'Can delete financial aid',14,'delete_financialaid'),(56,'Can view financial aid',14,'view_financialaid'),(57,'Can add exchange',15,'add_exchange'),(58,'Can change exchange',15,'change_exchange'),(59,'Can delete exchange',15,'delete_exchange'),(60,'Can view exchange',15,'view_exchange');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'exchange','city'),(7,'exchange','country'),(12,'exchange','department'),(15,'exchange','exchange'),(14,'exchange','financialaid'),(13,'exchange','student'),(9,'exchange','university'),(10,'exchange','universitycontracts'),(11,'exchange','universitylanguages'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-14 15:18:49.185788'),(2,'auth','0001_initial','2019-05-14 15:18:52.637856'),(3,'admin','0001_initial','2019-05-14 15:19:05.194131'),(4,'admin','0002_logentry_remove_auto_add','2019-05-14 15:19:07.895572'),(5,'admin','0003_logentry_add_action_flag_choices','2019-05-14 15:19:08.027511'),(6,'contenttypes','0002_remove_content_type_name','2019-05-14 15:19:10.342193'),(7,'auth','0002_alter_permission_name_max_length','2019-05-14 15:19:11.813335'),(8,'auth','0003_alter_user_email_max_length','2019-05-14 15:19:12.038216'),(9,'auth','0004_alter_user_username_opts','2019-05-14 15:19:12.135147'),(10,'auth','0005_alter_user_last_login_null','2019-05-14 15:19:13.361506'),(11,'auth','0006_require_contenttypes_0002','2019-05-14 15:19:13.474423'),(12,'auth','0007_alter_validators_add_error_messages','2019-05-14 15:19:13.590355'),(13,'auth','0008_alter_user_username_max_length','2019-05-14 15:19:15.544258'),(14,'auth','0009_alter_user_last_name_max_length','2019-05-14 15:19:17.110362'),(15,'auth','0010_alter_group_name_max_length','2019-05-14 15:19:17.335223'),(16,'auth','0011_update_proxy_permissions','2019-05-14 15:19:17.439183'),(17,'sessions','0001_initial','2019-05-14 15:19:18.093798'),(18,'exchange','0001_initial','2019-05-14 15:26:19.320259'),(19,'exchange','0002_auto_20190514_1758','2019-05-14 15:59:03.840926'),(20,'exchange','0003_auto_20190515_0823','2019-05-15 06:24:58.110739'),(21,'exchange','0004_auto_20190515_2238','2019-05-15 20:39:08.726140'),(22,'exchange','0002_auto_20190516_2129','2019-05-16 19:29:16.426779'),(23,'exchange','0003_auto_20190516_2153','2019-05-16 19:53:13.848336'),(24,'exchange','0004_auto_20190517_0953','2019-05-17 07:53:53.114180'),(25,'exchange','0005_auto_20190517_1104','2019-05-17 09:04:55.527514'),(26,'exchange','0006_auto_20190517_1306','2019-05-17 11:06:53.140125'),(27,'exchange','0007_auto_20190517_1541','2019-05-17 13:41:41.332540'),(28,'exchange','0008_auto_20190517_1937','2019-05-17 17:37:14.256400'),(29,'exchange','0009_auto_20190521_1803','2019-05-21 16:03:40.901413'),(30,'exchange','0010_auto_20190521_1805','2019-05-21 16:05:55.362557');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dwj4lfmmfb8m7dlzya08nzqyksm2bjsm','YjRmZTViNTVmNDIwMDc0ZmYwY2M0M2IxZWUyODJiMjkzNmI0ZjczNzp7IkNBU05FWFQiOiIvYWRtaW4vIn0=','2019-06-04 18:19:28.284133');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_city`
--

DROP TABLE IF EXISTS `exchange_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exchange_city` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CityName` varchar(100) NOT NULL,
  `Country_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `exchange_city_Country_id_35bea04f_fk_exchange_country_ID` (`Country_id`),
  CONSTRAINT `exchange_city_Country_id_35bea04f_fk_exchange_country_ID` FOREIGN KEY (`Country_id`) REFERENCES `exchange_country` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_city`
--

LOCK TABLES `exchange_city` WRITE;
/*!40000 ALTER TABLE `exchange_city` DISABLE KEYS */;
INSERT INTO `exchange_city` VALUES (1,'Shanghai',3),(2,'Séoul',19),(3,'Dresden',20),(4,'Sherbrooke',2),(5,'Göteborg',21),(6,'Stockholm',21),(7,'Dublin',22),(8,'Copenhague',23),(9,'Kobe',24),(10,'Valparaíso',25),(11,'Ottawa',2),(12,'Turin',9),(13,'Odense',23),(14,'Vienne',26),(15,'Campinas',27),(16,'Adelaide',28),(17,'Sendai',24),(18,'São Paulo',27),(19,'Daejeon',19),(20,'Espoo',29),(21,'Timisoara',30),(22,'Guerrouaou',31),(23,'Oued Smar',31),(24,'Sidi Amar',31),(25,'Kouba',31),(26,'Dély Brahim',31),(27,'Annaba',31),(28,'Ouagadougou',32),(29,'Abéché',33),(30,'Cocody',34),(31,'Rabat',35),(32,'El Jadida',35),(33,'Casablanca',35),(34,'Salé',35),(35,'Fez',35),(36,'Settat',35),(37,'Tétouan',35),(38,'Sfax',36),(39,'Tunis',36),(40,'Monastir',36),(41,'Phnom Penh',37),(42,'Pékin',3),(43,'Hong Kong',3),(44,'Xihu',3),(45,'Huayuan',3),(46,'Wuhan',3),(47,'Kunming',3),(48,'Xi\'an',3),(49,'Yingwu',3),(50,'Jing\'an',3),(51,'Nanjing City',3),(52,'Siming',3),(53,'Pune',6),(54,'Mumbai',6),(55,'Mehrauli',6),(56,'Kanpur',6),(57,'Chennai',6),(58,'Bengaluru',6),(59,'Sabzevar',8),(60,'Fukuoka',24),(61,'Taito',24),(62,'Beit Mery',38),(63,'Hadath',38),(64,'Beyrouth',38),(65,'Kuala Lumpur',39),(66,'Singapour',40),(67,'Cheonan-si',19),(68,'Pohang-si',19),(69,'Alep',41),(70,'Zaqzaqaniyah',41),(71,'Hsinchu',42),(72,'Bangkok',43),(73,'Istanbul',16),(74,'Hanoï',44),(75,'Hô-Chi-Minh-Ville',44),(76,'Graz',26),(77,'Leoben',26),(78,'Bruxelles',45),(79,'Gand',45),(80,'Leuven',45),(81,'Brno',46),(82,'Plzeň',46),(83,'Prague',46),(84,'Aalborg',23),(85,'Stampen',23),(86,'Tallinn',47),(87,'Turku',29),(88,'Helsinki',29),(89,'Jyväskylä',29),(90,'Lappeenranta',29),(91,'Tampere',29),(92,'Aachen',20),(93,'Berlin',20),(94,'Bochum',20),(95,'Bremerhaven',20),(96,'Cottbus',20),(97,'Darmstadt',20),(98,'Dortmund',20),(99,'Kaiserslautern',20),(100,'Karlsruhe',20),(101,'Munich',20),(102,'Passau',20),(103,'Stuttgart',20),(104,'Duisburg',20),(105,'Thessalonique',48),(106,'Budapest',49),(107,'Reykjavik',50),(108,'Limerick',22),(109,'L\'Aquila',9),(110,'Catania',9),(111,'Rome',9),(112,'Milan',9),(113,'Naples',9),(114,'Bari',9),(115,'Brescia',9),(116,'Florence',9),(117,'Vilnius',51),(118,'Delft',52),(119,'Enschede',52),(120,'Stavanger',14),(121,'Trondheim',14),(122,'Cracovie',53),(123,'Gdańsk',53),(124,'Łódź',53),(125,'Varsovie',53),(126,'Lisbonne',54),(127,'Paranhos',54),(128,'Bacău',30),(129,'Iași',30),(130,'Cluj-Napoca',30),(131,'Suceava',30),(132,'Oradea',30),(133,'Bucarest',30),(134,'Bratislava',55),(135,'Ljubljana',56),(136,'San Vicente del Raspeig',57),(137,'Sant Adrià de Besòs',57),(138,'Barcelone',57),(139,'Terrassa',57),(140,'Erandio',57),(141,'Tolède',57),(142,'Madrid',57),(143,'Castellón de la Plana',57),(144,'La Coruña',57),(145,'Leganés',57),(146,'Santander',57),(147,'Séville',57),(148,'Valence',57),(149,'Saragosse',57),(150,'Luleå',21),(151,'Lund',21),(152,'Maribor',21),(153,'Ecublens',58),(154,'Aberdeen',17),(155,'Bath',17),(156,'Birmingham',17),(157,'Bristol',17),(158,'Glasgow',17),(159,'Leeds',17),(160,'Londres',17),(161,'Loughborough',17),(162,'Sheffield',17),(163,'Montréal',2),(164,'Hamilton',12),(165,'Québec',2),(166,'Edmonton',2),(167,'Waterloo',2),(168,'Pòtoprens',59),(169,'Puebla',10),(170,'Reynosa',10),(171,'Mexicali',10),(172,'San Nicolás de los Garza',10),(173,'San Luis Potosí',10),(174,'Veracruz',10),(175,'Mérida',10),(176,'Pedregal de Tepepan',10),(177,'Guadalajara',10),(178,'Hermosillo',10),(179,'Pasadena',18),(180,'Pomona',18),(181,'Clemson',18),(182,'Tallahassee',18),(183,'Atlanta',18),(184,'Chicago',18),(185,'Houston',18),(186,'Barrie',18),(187,'Houghton',18),(188,'Newark',18),(189,'State College',18),(190,'Chapel Hill',18),(191,'Pittsburgh',18),(192,'Riverview',18),(193,'Canberra',28),(194,'Perth',28),(195,'Geelong',28),(196,'Victoria',28),(197,'Brisbane',28),(198,'Melbourne',28),(199,'Sydney',28),(200,'Tanzanie',28),(201,'Wollongong',28),(202,'Buenos Aires',60),(203,'Cordoba',60),(204,'Mar del Plata',60),(205,'Mendoza',60),(206,'La Plata',60),(207,'Las Higueras',60),(208,'Rosario',60),(209,'San Miguel de Tucumán',60),(210,'Santa Fe',62),(211,'Bahía Blanca',60),(212,'Municipio Nuestra Señora de La Paz',61),(213,'São José dos Campos',27),(214,'Rio de Janeiro',27),(215,'Campina Grande',27),(216,'Goiânia',27),(217,'Belo Horizonte',27),(218,'Natal',27),(219,'Florianópolis',27),(220,'Uberlândia',27),(221,'Fortaleza',27),(222,'Curitiba',27),(223,'Providencia',25),(224,'Santiago',25),(225,'Concepcion',25),(226,'Medellín',62),(227,'Candelaria',62),(228,'Chapinero',62),(229,'Teusaquillo',62),(230,'Montevideo',63),(231,'Hoyo de La Puerta',64);
/*!40000 ALTER TABLE `exchange_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_country`
--

DROP TABLE IF EXISTS `exchange_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exchange_country` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(100) NOT NULL,
  `ECTSConversion` double NOT NULL,
  `Continent` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_country`
--

LOCK TABLES `exchange_country` WRITE;
/*!40000 ALTER TABLE `exchange_country` DISABLE KEYS */;
INSERT INTO `exchange_country` VALUES (1,'Bangladesh',-1,'AS'),(2,'Canada',-1,'AdN'),(3,'Chine',1.5,'AS'),(4,'Éthiopie',1.5,'AF'),(5,'Ghana',2,'AF'),(6,'Inde',-1,'AS'),(7,'Indonésie',2,'AS'),(8,'Iran',-1,'AS'),(9,'Italie',1,'EU'),(10,'Mexique',1,'AdN'),(11,'Népal',-1,'AS'),(12,'Nouvelle-Zélande',0.5,'OC'),(13,'Nigeria',1.5,'AF'),(14,'Norvège',1,'EU'),(15,'Pakistan',-1,'AS'),(16,'Turquie',2,'AS'),(17,'Royaume-Uni',0.5,'EU'),(18,'États-Unis',2,'AdN'),(19,'Corée du Sud',-1,'AS'),(20,'Allemagne',-1,'EU'),(21,'Suède',-1,'EU'),(22,'Irlande',-1,'EU'),(23,'Danemark',-1,'EU'),(24,'Japon',-1,'AS'),(25,'Chili',-1,'AdS'),(26,'Autriche',-1,'EU'),(27,'Brésil',-1,'AdS'),(28,'Australie',-1,'OC'),(29,'Finlande',-1,'EU'),(30,'Roumanie',-1,'EU'),(31,'Algérie',-1,'AF'),(32,'Burkina Faso',-1,'AF'),(33,'Tchad',-1,'AF'),(34,'Côte d\'Ivoire',-1,'AF'),(35,'Maroc',-1,'AF'),(36,'Tunisie',-1,'AF'),(37,'Cambodge',-1,'AS'),(38,'Liban',-1,'AS'),(39,'Malaisie',-1,'AS'),(40,'Singapour',-1,'AS'),(41,'Syrie',-1,'AS'),(42,'Taïwan',-1,'AS'),(43,'Thaïlande',-1,'AS'),(44,'Vietnam',-1,'AS'),(45,'Belgique',-1,'EU'),(46,'République Tchèque',-1,'EU'),(47,'Estonie',-1,'EU'),(48,'Grèce',-1,'EU'),(49,'Hongrie',-1,'EU'),(50,'Islande',-1,'EU'),(51,'Lituanie',-1,'EU'),(52,'Pays-Bas',-1,'EU'),(53,'Pologne',-1,'EU'),(54,'Portugal',-1,'EU'),(55,'Slovaquie',-1,'EU'),(56,'Solvénie',-1,'EU'),(57,'Espagne',-1,'EU'),(58,'Suisse',-1,'EU'),(59,'Haïti',-1,'AdN'),(60,'Argentine',-1,'AdS'),(61,'Bolivie',-1,'AdS'),(62,'Colombie',-1,'AdS'),(63,'Uruguay',-1,'AdS'),(64,'Venzuela',-1,'AdS');
/*!40000 ALTER TABLE `exchange_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_department`
--

DROP TABLE IF EXISTS `exchange_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exchange_department` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Rank` int(11) NOT NULL,
  `University_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `exchange_department_University_id_139a46c1_fk_exchange_` (`University_id`),
  CONSTRAINT `exchange_department_University_id_139a46c1_fk_exchange_` FOREIGN KEY (`University_id`) REFERENCES `exchange_university` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_department`
--

LOCK TABLES `exchange_department` WRITE;
/*!40000 ALTER TABLE `exchange_department` DISABLE KEYS */;
INSERT INTO `exchange_department` VALUES (1,'Inconnu',-1,1),(2,'Inconnu',-1,2),(3,'Inconnu',-1,3),(4,'Inconnu',-1,4),(5,'Inconnu',-1,5),(6,'Inconnu',-1,6),(7,'Inconnu',-1,7),(8,'Inconnu',-1,8),(9,'Inconnu',-1,9),(10,'Inconnu',-1,10),(11,'Inconnu',-1,11),(12,'Inconnu',-1,12),(13,'Inconnu',-1,13),(14,'Inconnu',-1,14),(15,'Inconnu',-1,15),(16,'Inconnu',-1,16),(17,'Inconnu',-1,17),(18,'Inconnu',-1,18),(19,'Inconnu',-1,19),(20,'Inconnu',-1,20),(21,'Inconnu',-1,21),(22,'Inconnu',-1,22),(23,'Inconnu',-1,23),(24,'Inconnu',-1,24),(25,'Inconnu',-1,25),(26,'Inconnu',-1,26),(27,'Inconnu',-1,27),(28,'Inconnu',-1,28),(29,'Inconnu',-1,29),(30,'Inconnu',-1,30),(31,'Inconnu',-1,31),(32,'Inconnu',-1,32),(33,'Inconnu',-1,33),(34,'Inconnu',-1,34),(35,'Inconnu',-1,35),(36,'Inconnu',-1,36),(37,'Inconnu',-1,37),(38,'Inconnu',-1,38),(39,'Inconnu',-1,39),(40,'Inconnu',-1,40),(41,'Inconnu',-1,41),(42,'Inconnu',-1,42),(43,'Inconnu',-1,43),(44,'Inconnu',-1,44),(45,'Inconnu',-1,45),(46,'Inconnu',-1,46),(47,'Inconnu',-1,47),(48,'Inconnu',-1,48),(49,'Inconnu',-1,49),(50,'Inconnu',-1,50),(51,'Inconnu',-1,51),(52,'Inconnu',-1,52),(53,'Inconnu',-1,53),(54,'Inconnu',-1,54),(55,'Inconnu',-1,55),(56,'Inconnu',-1,56),(57,'Inconnu',-1,57),(58,'Inconnu',-1,58),(59,'Inconnu',-1,59),(60,'Inconnu',-1,60),(61,'Inconnu',-1,61),(62,'Inconnu',-1,62),(63,'Inconnu',-1,63),(64,'Inconnu',-1,64),(65,'Inconnu',-1,65),(66,'Inconnu',-1,66),(67,'Inconnu',-1,67),(68,'Inconnu',-1,68),(69,'Inconnu',-1,69),(70,'Inconnu',-1,70),(71,'Inconnu',-1,71),(72,'Inconnu',-1,72),(73,'Inconnu',-1,73),(74,'Inconnu',-1,74),(75,'Inconnu',-1,75),(76,'Inconnu',-1,76),(77,'Inconnu',-1,77),(78,'Inconnu',-1,78),(79,'Inconnu',-1,79),(80,'Inconnu',-1,80),(81,'Inconnu',-1,81),(82,'Inconnu',-1,82),(83,'Inconnu',-1,83),(84,'Inconnu',-1,84),(85,'Inconnu',-1,85),(86,'Inconnu',-1,86),(87,'Inconnu',-1,87),(88,'Inconnu',-1,88),(89,'Inconnu',-1,89),(90,'Inconnu',-1,90),(91,'Inconnu',-1,91),(92,'Inconnu',-1,92),(93,'Inconnu',-1,93),(94,'Inconnu',-1,94),(95,'Inconnu',-1,95),(96,'Inconnu',-1,96),(97,'Inconnu',-1,97),(98,'Inconnu',-1,98),(99,'Inconnu',-1,99),(100,'Inconnu',-1,100),(101,'Inconnu',-1,101),(102,'Inconnu',-1,102),(103,'Inconnu',-1,103),(104,'Inconnu',-1,104),(105,'Inconnu',-1,105),(106,'Inconnu',-1,106),(107,'Inconnu',-1,107),(108,'Inconnu',-1,108),(109,'Inconnu',-1,109),(110,'Inconnu',-1,110),(111,'Inconnu',-1,111),(112,'Inconnu',-1,112),(113,'Inconnu',-1,113),(114,'Inconnu',-1,114),(115,'Inconnu',-1,115),(116,'Inconnu',-1,116),(117,'Inconnu',-1,117),(118,'Inconnu',-1,118),(119,'Inconnu',-1,119),(120,'Inconnu',-1,120),(121,'Inconnu',-1,121),(122,'Inconnu',-1,122),(123,'Inconnu',-1,123),(124,'Inconnu',-1,124),(125,'Inconnu',-1,125),(126,'Inconnu',-1,126),(127,'Inconnu',-1,127),(128,'Inconnu',-1,128),(129,'Inconnu',-1,129),(130,'Inconnu',-1,130),(131,'Inconnu',-1,131),(132,'Inconnu',-1,132),(133,'Inconnu',-1,133),(134,'Inconnu',-1,134),(135,'Inconnu',-1,135),(136,'Inconnu',-1,136),(137,'Inconnu',-1,137),(138,'Inconnu',-1,138),(139,'Inconnu',-1,139),(140,'Inconnu',-1,140),(141,'Inconnu',-1,141),(142,'Inconnu',-1,142),(143,'Inconnu',-1,143),(144,'Inconnu',-1,144),(145,'Inconnu',-1,145),(146,'Inconnu',-1,146),(147,'Inconnu',-1,147),(148,'Inconnu',-1,148),(149,'Inconnu',-1,149),(150,'Inconnu',-1,150),(151,'Inconnu',-1,151),(152,'Inconnu',-1,152),(153,'Inconnu',-1,153),(154,'Inconnu',-1,154),(155,'Inconnu',-1,155),(156,'Inconnu',-1,156),(157,'Inconnu',-1,157),(158,'Inconnu',-1,158),(159,'Inconnu',-1,159),(160,'Inconnu',-1,160),(161,'Inconnu',-1,161),(162,'Inconnu',-1,162),(163,'Inconnu',-1,163),(164,'Inconnu',-1,164),(165,'Inconnu',-1,165),(166,'Inconnu',-1,166),(167,'Inconnu',-1,167),(168,'Inconnu',-1,168),(169,'Inconnu',-1,169),(170,'Inconnu',-1,170),(171,'Inconnu',-1,171),(172,'Inconnu',-1,172),(173,'Inconnu',-1,173),(174,'Inconnu',-1,174),(175,'Inconnu',-1,175),(176,'Inconnu',-1,176),(177,'Inconnu',-1,177),(178,'Inconnu',-1,178),(179,'Inconnu',-1,179),(180,'Inconnu',-1,180),(181,'Inconnu',-1,181),(182,'Inconnu',-1,182),(183,'Inconnu',-1,183),(184,'Inconnu',-1,184),(185,'Inconnu',-1,185),(186,'Inconnu',-1,186),(187,'Inconnu',-1,187),(188,'Inconnu',-1,188),(189,'Inconnu',-1,189),(190,'Inconnu',-1,190),(191,'Inconnu',-1,191),(192,'Inconnu',-1,192),(193,'Inconnu',-1,193),(194,'Inconnu',-1,194),(195,'Inconnu',-1,195),(196,'Inconnu',-1,196),(197,'Inconnu',-1,197),(198,'Inconnu',-1,198),(199,'Inconnu',-1,199),(200,'Inconnu',-1,200),(201,'Inconnu',-1,201),(202,'Inconnu',-1,202),(203,'Inconnu',-1,203),(204,'Inconnu',-1,204),(205,'Inconnu',-1,205),(206,'Inconnu',-1,206),(207,'Inconnu',-1,207),(208,'Inconnu',-1,208),(209,'Inconnu',-1,209),(210,'Inconnu',-1,210),(211,'Inconnu',-1,211),(212,'Inconnu',-1,212),(213,'Inconnu',-1,213),(214,'Inconnu',-1,214),(215,'Inconnu',-1,215),(216,'Inconnu',-1,216),(217,'Inconnu',-1,217),(218,'Inconnu',-1,218),(219,'Inconnu',-1,219),(220,'Inconnu',-1,220),(221,'Inconnu',-1,221),(222,'Inconnu',-1,222),(223,'Inconnu',-1,223),(224,'Inconnu',-1,224),(225,'Inconnu',-1,225),(226,'Inconnu',-1,226),(227,'Inconnu',-1,227),(228,'Inconnu',-1,228),(229,'Inconnu',-1,229),(230,'Inconnu',-1,230),(231,'Inconnu',-1,231),(232,'Inconnu',-1,232),(233,'Inconnu',-1,233),(234,'Inconnu',-1,234),(235,'Inconnu',-1,235),(236,'Inconnu',-1,236),(237,'Inconnu',-1,237),(238,'Inconnu',-1,238),(239,'Inconnu',-1,239),(240,'Inconnu',-1,240),(241,'Inconnu',-1,241),(242,'Inconnu',-1,242),(243,'Inconnu',-1,243),(244,'Inconnu',-1,244),(245,'Inconnu',-1,245),(246,'Inconnu',-1,246),(247,'Inconnu',-1,247),(248,'Inconnu',-1,248),(249,'Inconnu',-1,249),(250,'Inconnu',-1,250),(251,'Inconnu',-1,251),(252,'Inconnu',-1,252),(253,'Inconnu',-1,253),(254,'Inconnu',-1,254),(255,'Inconnu',-1,255),(256,'Inconnu',-1,256),(257,'Inconnu',-1,257),(258,'Inconnu',-1,258),(259,'Inconnu',-1,259),(260,'Inconnu',-1,260),(261,'Inconnu',-1,261);
/*!40000 ALTER TABLE `exchange_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_exchange`
--

DROP TABLE IF EXISTS `exchange_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exchange_exchange` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Year` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Semester` int(11) NOT NULL,
  `Visa` tinyint(1) NOT NULL,
  `Comment` varchar(1000) DEFAULT NULL,
  `Rent` int(11) DEFAULT NULL,
  `MonthlyExpenses` int(11) DEFAULT NULL,
  `NightLifeGrade` int(11) DEFAULT NULL,
  `CulturalLifeGrade` int(11) DEFAULT NULL,
  `Security` int(11) DEFAULT NULL,
  `Student_id` int(11) NOT NULL,
  `University_id` int(11) NOT NULL,
  `VisaDays` int(11),
  `VisaMonths` int(11),
  `VisaWeeks` int(11),
  PRIMARY KEY (`ID`),
  KEY `exchange_exchange_Student_id_7e1b25e0_fk_exchange_student_ID` (`Student_id`),
  KEY `exchange_exchange_University_id_3a4501a0_fk_exchange_` (`University_id`),
  CONSTRAINT `exchange_exchange_Student_id_7e1b25e0_fk_exchange_student_ID` FOREIGN KEY (`Student_id`) REFERENCES `exchange_student` (`ID`),
  CONSTRAINT `exchange_exchange_University_id_3a4501a0_fk_exchange_` FOREIGN KEY (`University_id`) REFERENCES `exchange_university` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_exchange`
--

LOCK TABLES `exchange_exchange` WRITE;
/*!40000 ALTER TABLE `exchange_exchange` DISABLE KEYS */;
INSERT INTO `exchange_exchange` VALUES (1,4,'2018-10-09','2019-12-01',-1,1,NULL,150,350,5,5,5,1,32,-1,-1,-1),(2,4,'2018-09-01','2018-12-22',-1,1,NULL,450,250,5,4,5,2,60,-1,-1,-1),(3,4,'2018-10-15','2019-02-08',-1,0,NULL,150,450,3,3,5,3,96,-1,-1,-1),(4,5,'2018-09-10','2019-11-06',-1,0,'Vis à vis de la culture/vie nocture, en vrai c\'est hyper dispersé donc tu te fais chier si tu restes à Sherbrooke, mais loues une caisse et balade toi c\'est juste magnifique le Québec. Sinon c\'est vraiment chill comme échange, les Québecois sont maxi cools, les loyers pas chère, la bouffe comme en France, les cours c\'est chill et y a des bêtes de RoadTrip à faire',250,150,4,3,5,4,187,-1,-1,-1),(5,4,'2018-09-03','2019-01-19',-1,0,'Si vous pouvez aller ailleurs, faites-le.',350,250,3,4,5,5,164,-1,-1,-1),(6,4,'2018-09-03','2019-01-10',-1,0,NULL,450,350,4,4,5,6,169,-1,-1,-1),(7,4,'2017-09-17','2018-01-18',-1,1,NULL,650,950,4,3,4,7,106,-1,-1,-1),(8,4,'2017-09-05','2017-12-19',-1,0,NULL,550,350,4,4,5,8,80,-1,-1,-1),(9,4,'2017-08-28','2018-01-13',-1,0,NULL,450,250,4,4,5,9,164,-1,-1,-1),(10,4,'2017-08-20','2018-01-10',-1,0,'Allez-y !',250,750,4,4,5,10,165,-1,-1,-1),(11,4,'2017-10-03','2018-07-20',-1,1,'C\'était parfait, ne pas avoir peur de la barrière de la langue (je suis parti avec 1an de japonais à l\'insa ... )  + Partir 1an, pas 6mois, ce serait dommage de pas profiter au maximum',150,450,4,5,5,11,45,-1,-1,-1),(12,4,'2017-08-07','2018-07-13',-1,1,'Super ville, ne surtout pas hésiter!!!',350,750,5,5,3,12,254,-1,-1,-1),(13,4,'2018-09-05','2018-12-20',-1,0,NULL,450,150,4,4,5,13,184,-1,-1,-1),(14,4,'2018-02-10','2019-01-03',-1,0,NULL,350,350,4,2,4,14,117,-1,-1,-1),(15,4,'2019-02-04','2019-06-26',-1,0,'Génial si un TC veut y aller n\'hésitez pas !! Faite seulement attention de choisir u bon projet si vous partez en S2 et d\'éviter de choisir mon tuteur Emad Ebaid qui n\'aide pas correctement l\'élève malgré un sujet plutôt compliqué',350,250,5,4,4,15,81,-1,-1,-1),(16,4,'2017-09-04','2018-06-29',-1,0,NULL,600,250,4,5,5,16,72,-1,-1,-1),(17,4,'2017-08-01','2017-12-10',-1,1,NULL,250,650,5,3,3,17,238,-1,-1,-1),(18,4,'2017-08-21','2018-01-13',-1,0,'génial',750,250,5,4,5,18,164,-1,-1,-1),(19,5,'2019-03-04','2019-07-05',-1,1,NULL,550,350,3,3,5,19,210,-1,-1,-1),(20,4,'2017-09-01','2018-02-01',-1,1,NULL,150,650,5,5,5,20,48,-1,-1,-1),(21,5,'2018-09-24','2019-01-11',-1,0,NULL,650,150,4,3,4,21,106,-1,-1,-1),(22,5,'2018-08-01','2018-12-08',-1,1,'Excellent échange. Le Brésil vous change la vie !',450,350,5,5,4,22,237,-1,-1,-1),(23,4,'2018-09-01','2019-01-15',-1,1,NULL,550,950,5,4,5,23,169,-1,-1,-1),(24,4,'2017-09-20','2018-05-14',-1,0,NULL,750,250,5,4,4,24,109,-1,-1,-1),(25,4,'2019-02-22','2019-06-21',-1,1,NULL,250,450,5,5,5,25,61,-1,-1,-1),(26,4,'2018-08-27','2018-12-12',-1,1,NULL,150,350,4,5,5,26,57,-1,-1,-1),(27,4,'2017-09-04','2017-12-14',-1,0,'Beaucoup d\'activités sur le campus, une culture étudiante super riche, un pays très paisible avec des habitants discrets mais toujours serviables, il ne faut pas hésiter :)',450,-1,4,5,5,27,83,-1,-1,-1),(28,5,'2018-09-24','2019-02-01',-1,0,NULL,350,150,4,3,3,28,135,-1,-1,-1),(29,4,'2018-09-03','2018-12-10',-1,0,NULL,450,150,4,4,5,29,83,-1,-1,-1),(30,5,'2018-09-10','2018-12-21',-1,0,NULL,950,250,5,4,5,30,109,-1,-1,-1),(31,4,'2018-08-30','2018-01-23',-1,0,'Peu d\'étudiants Erasmus y sont, du moins en télécom, on ne rencontre que des locaux (pas génial, sincèrement).',350,250,4,5,4,31,151,-1,-1,-1),(32,4,'2018-10-01','2019-02-01',-1,0,NULL,150,150,4,5,4,32,96,-1,-1,-1);
/*!40000 ALTER TABLE `exchange_exchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_financialaid`
--

DROP TABLE IF EXISTS `exchange_financialaid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exchange_financialaid` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Value` int(11) DEFAULT NULL,
  `ReceivedEvery` varchar(15) DEFAULT NULL,
  `Exchange_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `exchange_financialai_Exchange_id_97d32e2d_fk_exchange_` (`Exchange_id`),
  CONSTRAINT `exchange_financialai_Exchange_id_97d32e2d_fk_exchange_` FOREIGN KEY (`Exchange_id`) REFERENCES `exchange_exchange` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_financialaid`
--

LOCK TABLES `exchange_financialaid` WRITE;
/*!40000 ALTER TABLE `exchange_financialaid` DISABLE KEYS */;
/*!40000 ALTER TABLE `exchange_financialaid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_student`
--

DROP TABLE IF EXISTS `exchange_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exchange_student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(254) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Surname` varchar(100) NOT NULL,
  `INSADepartment` varchar(10) NOT NULL,
  `Nationality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_student`
--

LOCK TABLES `exchange_student` WRITE;
/*!40000 ALTER TABLE `exchange_student` DISABLE KEYS */;
INSERT INTO `exchange_student` VALUES (1,'prenom.nom@insa-lyon.fr','Claire','Laverne','TC','Française'),(2,'prenom.nom@insa-lyon.fr','Rémy','Hidra','TC','Française'),(3,'prenom.nom@insa-lyon.fr','Daniel','del Pozo Sanchez','TC','Espagnole'),(4,'baptiste.cauchard@insa-lyon.fr','Baptiste','Cauchard','TC','Française'),(5,'prenom.nom@insa-lyon.fr','Evelyne','Akopyan','TC','Française'),(6,'yannis.banos@insa-lyon.fr','Yannis','Banos','TC','Française'),(7,'najib.raji@insa-lyon.fr','Najib','Raji','TC','Marocaine'),(8,'robin.cartier@insa-lyon.fr','Robin','Cartier','TC','Française'),(9,'prenom.nom@insa-lyon.fr','Emmanuel','Gublin','TC','Française'),(10,'max.marie@insa-lyon.fr','Max','Marie','TC','Française'),(11,'william.gounot@insa-lyon.fr','William','Gounot','TC','Française'),(12,'charlotte.antolini@insa-lyon.fr','Charlotte','Antolini','TC','Française'),(13,'anton.claes@insa-lyon.fr','Anton','Claes','TC','Française'),(14,'thibaut.giandomenico@insa-lyon.fr','Thibaut','Giandomenico','TC','Française'),(15,'nicolas.jacquiot@insa-lyon.fr','Nicolas','Jacquiot','TC','Française'),(16,'prenom.nom@insa-lyon.fr','Alexandre','Heit','TC','Française'),(17,'prenom.nom@insa-lyon.fr','Yassine','Zouggari','TC','Marocaine'),(18,'nolwenn.madec@insa-lyon.fr','Nolwenn','Madec','TC','Française'),(19,'yann.bellanger@insa-lyon.fr','Yann','Bellanger','TC','Française'),(20,'shiqi.wang@insa-lyon.fr','Shiqi','Wang','TC','Chinoise'),(21,'nicolas.jacquelin@insa-lyon.fr','Nicolas','Jacquelin','TC','Française'),(22,'anne-sophie.narcisse@insa-lyon.fr','Anne-Sophie','Narcisse','TC','Française'),(23,'prenom.nom@insa-lyon.fr','Réda','Diouri','TC','Marocaine'),(24,'timothee.craig@insa-lyon.fr','Timothée','Craig','TC','Française'),(25,'zhiyi.zhang@insa-lyon.fr','Zhiyi','Zhang','TC','Chinoise'),(26,'prenom.nom@insa-lyon.fr','Ludovic','Prigent','TC','Française'),(27,'ophelia.rey@insa-lyon.fr','Ophélia','Rey','TC','Française'),(28,'prenom.nom@insa-lyon.fr','Paul','Quentel','TC','Française'),(29,'nicolas.theveniot@insa-lyon.fr','Nicolas','Theveniot','TC','Française'),(30,'prenom.nom@insa-lyon.fr','Jonathan','Miard','TC','Française'),(31,'noemie.hennequin@insa-lyon.fr','Noémie','Hennequin','TC','Française'),(32,'jean-baptiste.lanneluc@insa-lyon.fr','Jean-Baptiste','Lanneluc','TC','Française');
/*!40000 ALTER TABLE `exchange_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_university`
--

DROP TABLE IF EXISTS `exchange_university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exchange_university` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(1000) NOT NULL,
  `WebLink` varchar(200) NOT NULL,
  `Places` int(11) NOT NULL,
  `Demand` int(11) NOT NULL,
  `SplitableYear` tinyint(1) NOT NULL,
  `Project` tinyint(1) NOT NULL,
  `CWURRank` int(11) DEFAULT NULL,
  `City_id` int(11) NOT NULL,
  `Lat` decimal(11,6) DEFAULT NULL,
  `Long` decimal(11,6) DEFAULT NULL,
  `LifeMetric` decimal(3,2) NOT NULL,
  `RankMetric` decimal(3,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `exchange_university_City_id_5c43426f_fk_exchange_city_ID` (`City_id`),
  CONSTRAINT `exchange_university_City_id_5c43426f_fk_exchange_city_ID` FOREIGN KEY (`City_id`) REFERENCES `exchange_city` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_university`
--

LOCK TABLES `exchange_university` WRITE;
/*!40000 ALTER TABLE `exchange_university` DISABLE KEYS */;
INSERT INTO `exchange_university` VALUES (1,'Ecole Nationale Supérieure d\'Hydraulique de Blida','https://pas.renseigne',-1,-1,0,0,0,22,36.510707,2.890451,-1.00,-1.00),(2,'Ecole Nationale Supérieure d\'Informatique','https://pas.renseigne',-1,-1,0,0,0,23,36.705030,3.173916,-1.00,-1.00),(3,'Ecole Nationale Supérieure des Mines et de la Métallurgie - Annaba','https://pas.renseigne',-1,-1,0,0,0,24,36.820339,7.727133,-1.00,-1.00),(4,'Ecole Nationale Supérieure des Travaux Publics','https://pas.renseigne',-1,-1,0,0,0,25,36.725638,3.069654,-1.00,-1.00),(5,'Ecole Nationale Supérieure des Sciences de la Mer et de l\'Aménagement du Littoral','https://pas.renseigne',-1,-1,0,0,0,26,36.755190,2.981930,-1.00,-1.00),(6,'Université Badji Mokhtar de Annaba','https://pas.renseigne',-1,-1,0,0,0,27,36.868872,7.718392,-1.00,-1.00),(7,'Institut International d\'Ingénierie de l\'Eau et de l\'Environnement','https://pas.renseigne',-1,-1,0,0,0,28,12.378764,-1.503695,-1.00,-1.00),(8,'Institut Universitaire des Sciences et Techniques d\'Abeche','https://pas.renseigne',-1,-1,0,0,0,29,13.835912,20.843371,-1.00,-1.00),(9,'Université Félix Houphouët-Boigny','https://pas.renseigne',-1,-1,0,0,0,30,5.347050,-3.985292,-1.00,-1.00),(10,'Ecole Mohammadia d\'Ingénieurs','https://pas.renseigne',-1,-1,0,0,0,31,33.997617,-6.853569,-1.00,-1.00),(11,'Ecole Nationale des Sciences Appliquées de l\'Université Chouaib Doukkali d\'el Jadida','https://pas.renseigne',-1,-1,0,0,0,32,33.227273,-8.488019,-1.00,-1.00),(12,'Ecole Nationale Supérieure d\'Electricité et de Mécanique','https://pas.renseigne',-1,-1,0,0,0,33,33.541032,-7.657074,-1.00,-1.00),(13,'Ecole Nationale Supérieure des Mines de Rabat','https://pas.renseigne',-1,-1,0,0,0,31,34.000275,-6.854867,-1.00,-1.00),(14,'Ecole Supérieure de Technologie de Salé','https://pas.renseigne',-1,-1,0,0,0,34,34.049981,-6.812764,-1.00,-1.00),(15,'Université Sidi Mohamed Ben Abdellah','https://pas.renseigne',-1,-1,0,0,0,35,34.033437,-4.976866,-1.00,-1.00),(16,'Faculté des sciences et techniques de Settat','https://pas.renseigne',-1,-1,0,0,0,36,33.030908,-7.616505,-1.00,-1.00),(17,'Institut National des Postes et Télécommunications','https://pas.renseigne',-1,-1,0,0,0,31,33.979107,-6.866603,-1.00,-1.00),(18,'Université Abdelmalek Essaadi','https://pas.renseigne',-1,-1,0,0,0,37,35.560596,-5.364568,-1.00,-1.00),(19,'Ecole Nationale d\'Ingénieurs de Sfax','https://pas.renseigne',-1,-1,0,0,0,38,34.726594,10.717184,-1.00,-1.00),(20,'Ecole Nationale de Tunis','https://pas.renseigne',-1,-1,0,0,0,39,36.831102,10.147424,-1.00,-1.00),(21,'Université de Monastir','https://pas.renseigne',-1,-1,0,0,0,40,35.763326,10.829131,-1.00,-1.00),(22,'Institut de Technologie du Cambodge','https://pas.renseigne',-1,-1,0,0,0,41,11.570401,104.898085,-1.00,-1.00),(23,'Beijing Jiao Tong University','https://pas.renseigne',-1,-1,0,0,0,42,39.952371,116.347005,-1.00,-1.00),(24,'City University of Hong Kong','https://pas.renseigne',-1,-1,0,0,0,43,22.336679,114.172423,-1.00,-1.00),(25,'College of Info Science and engineering Zhe Jiang University','https://pas.renseigne',-1,-1,0,0,0,44,30.286085,120.133289,-1.00,-1.00),(26,'Harbin Institute of Technology','https://pas.renseigne',-1,-1,0,0,0,45,45.747044,126.633431,-1.00,-1.00),(27,'Huazhong University of Science and Technology','https://pas.renseigne',-1,-1,0,0,0,46,30.508964,114.410577,-1.00,-1.00),(28,'Institute of Automation Academy of Science China','https://pas.renseigne',-1,-1,0,0,0,42,39.980196,116.333305,-1.00,-1.00),(29,'Kunming University of Science & Technology','https://pas.renseigne',-1,-1,0,0,0,47,25.023088,102.682988,-1.00,-1.00),(30,'Northern Jiaotong University','https://pas.renseigne',-1,-1,0,0,0,42,39.952371,116.347005,-1.00,-1.00),(31,'Northwestern Polytechnical University','https://pas.renseigne',-1,-1,0,0,0,48,34.241661,108.936739,-1.00,-1.00),(32,'Shanghai Jiao Tong University','https://pas.renseigne',-1,-1,0,0,0,49,31.025220,121.433778,5.00,-1.00),(33,'The Hong Kong Polytechnic University','https://pas.renseigne',-1,-1,0,0,0,43,22.304572,114.179564,-1.00,-1.00),(34,'Tongji University','https://pas.renseigne',-1,-1,0,0,0,50,31.262721,121.459898,-1.00,-1.00),(35,'TsingHua University','https://pas.renseigne',-1,-1,0,0,0,42,39.999667,116.326444,-1.00,-1.00),(36,'Xiamen University','https://pas.renseigne',-1,-1,0,0,0,52,24.437348,118.097855,-1.00,-1.00),(37,'Council for Scientific & Industrial Research/National Chemical Laboratory','https://pas.renseigne',-1,-1,0,0,0,53,18.541565,73.811553,-1.00,-1.00),(38,'IIT Bombay','https://pas.renseigne',-1,-1,0,0,0,54,19.133430,72.913268,-1.00,-1.00),(39,'IIT Delhi','https://pas.renseigne',-1,-1,0,0,0,55,28.545955,77.186140,-1.00,-1.00),(40,'IIT Kanpur','https://pas.renseigne',-1,-1,0,0,0,56,26.512339,80.232900,-1.00,-1.00),(41,'IIT Madras','https://pas.renseigne',-1,-1,0,0,0,57,12.991493,80.233691,-1.00,-1.00),(42,'Indian Institute of Science','https://pas.renseigne',-1,-1,0,0,0,58,13.021860,77.567142,-1.00,-1.00),(43,'Hakim Sabzevari University','https://pas.renseigne',-1,-1,0,0,0,59,36.302632,57.680685,-1.00,-1.00),(44,'Kobe University - Faculty of Engineering and Graduate School of Science and Engineering','https://pas.renseigne',-1,-1,0,0,0,9,34.727031,135.237569,-1.00,-1.00),(45,'Kobe University - Faculty of Engineering and Graduate School of Systems Informatics','https://pas.renseigne',-1,-1,0,0,0,9,34.727031,135.237569,4.67,-1.00),(46,'Kobe University - Faculty of Maritime Sciences and Graduate School of Maritime Sciences','https://pas.renseigne',-1,-1,0,0,0,9,34.725702,135.233643,-1.00,-1.00),(47,'Kyushu University - Graduate School of Engineering','https://pas.renseigne',-1,-1,0,0,0,60,33.626658,130.425045,-1.00,-1.00),(48,'Tohoku University','https://pas.renseigne',-1,-1,0,0,0,17,38.253834,140.874074,5.00,-1.00),(49,'University of Tokyo','https://pas.renseigne',-1,-1,0,0,0,61,35.712677,139.761989,-1.00,-1.00),(50,'Faculté de génie de l\'Université Libanaise','https://pas.renseigne',-1,-1,0,0,0,62,33.879638,35.606959,-1.00,-1.00),(51,'Université Antonine','https://pas.renseigne',-1,-1,0,0,0,63,33.837478,35.537729,-1.00,-1.00),(52,'Université Libanaise','https://pas.renseigne',-1,-1,0,0,0,64,33.827870,35.521773,-1.00,-1.00),(53,'Campus France','https://pas.renseigne',-1,-1,0,0,0,65,3.147460,101.711833,-1.00,-1.00),(54,'Nanyang Technological University','https://pas.renseigne',-1,-1,0,0,0,66,1.348310,103.683135,-1.00,-1.00),(55,'National University of Singapore','https://pas.renseigne',-1,-1,0,0,0,66,1.296643,103.776394,-1.00,-1.00),(56,'Hoseo University','https://pas.renseigne',-1,-1,0,0,0,67,36.827973,127.183439,-1.00,-1.00),(57,'Korea Advanced Institute of Science and Technology','https://pas.renseigne',-1,-1,0,0,0,19,36.372143,127.360390,4.67,-1.00),(58,'Korea University','https://pas.renseigne',-1,-1,0,0,0,2,37.590799,127.027777,-1.00,-1.00),(59,'Pohang University of Science and Technology','https://pas.renseigne',-1,-1,0,0,0,68,36.013886,129.323184,-1.00,-1.00),(60,'Sogang University','https://pas.renseigne',-1,-1,0,0,0,2,37.550944,126.941002,4.67,-1.00),(61,'Yonsei University','https://pas.renseigne',-1,-1,0,0,0,2,37.565784,126.938572,5.00,-1.00),(62,'Université d\'Alep','https://pas.renseigne',-1,-1,0,0,0,69,36.210391,37.124111,-1.00,-1.00),(63,'Université de Tichrine de Lattaquié','https://pas.renseigne',-1,-1,0,0,0,70,35.522631,35.807290,-1.00,-1.00),(64,'National Tsing Hua University','https://pas.renseigne',-1,-1,0,0,0,71,24.794725,120.993232,-1.00,-1.00),(65,'Asian Institute of Technology','https://pas.renseigne',-1,-1,0,0,0,72,14.078500,100.614036,-1.00,-1.00),(66,'Boğaziçi University','https://pas.renseigne',-1,-1,0,0,0,73,41.084757,29.051040,-1.00,-1.00),(67,'Galatasaray University','https://pas.renseigne',-1,-1,0,0,0,73,41.045990,29.019900,-1.00,-1.00),(68,'Ecole Nationale Supérieure de Génie Civil de Hanoï','https://pas.renseigne',-1,-1,0,0,0,74,21.027764,105.834160,-1.00,-1.00),(69,'Institut Polytechnique d\'Hô-Chi-Minh-Ville','https://pas.renseigne',-1,-1,0,0,0,75,10.773331,106.659423,-1.00,-1.00),(70,'Graz UT','https://pas.renseigne',-1,-1,0,0,0,76,47.070714,15.439504,-1.00,-1.00),(71,'Montan University','https://pas.renseigne',-1,-1,0,0,0,77,47.384737,15.093020,-1.00,-1.00),(72,'Technische Universität Wien','https://pas.renseigne',-1,-1,0,0,0,14,48.198655,16.368463,4.67,-1.00),(73,'Université Libre de Bruxelles','https://pas.renseigne',-1,-1,0,0,0,78,50.813207,4.382222,-1.00,-1.00),(74,'Ghent University','https://pas.renseigne',-1,-1,0,0,0,79,51.046562,3.727918,-1.00,-1.00),(75,'KU Leuven','https://pas.renseigne',-1,-1,0,0,0,80,50.877954,4.700295,-1.00,-1.00),(76,'BRNO UT','https://pas.renseigne',-1,-1,0,0,0,81,49.201720,16.603317,-1.00,-1.00),(77,'Pilsen-West Bohemia University-Zapadoceska','https://pas.renseigne',-1,-1,0,0,0,82,49.723644,13.351554,-1.00,-1.00),(78,'Prague CTU','https://pas.renseigne',-1,-1,0,0,0,83,50.103036,14.391284,-1.00,-1.00),(79,'Aalborg University','https://pas.renseigne',-1,-1,0,0,0,84,57.014567,9.981853,-1.00,-1.00),(80,'DTU','https://pas.renseigne',-1,-1,0,0,0,85,55.785574,12.521381,4.33,-1.00),(81,'University of Southern Denmark','https://pas.renseigne',-1,-1,0,0,0,13,55.368983,10.428236,4.33,-1.00),(82,'TalTech University - Tallinn UT','https://pas.renseigne',-1,-1,0,0,0,86,59.395884,24.671431,-1.00,-1.00),(83,'Aalto University','https://pas.renseigne',-1,-1,0,0,0,20,60.186669,24.827682,4.50,-1.00),(84,'ABO Akademy University Turku','https://pas.renseigne',-1,-1,0,0,0,87,60.450987,22.277600,-1.00,-1.00),(85,'Helsinki University','https://pas.renseigne',-1,-1,0,0,0,88,60.172635,24.951042,-1.00,-1.00),(86,'Jyvaskyla University','https://pas.renseigne',-1,-1,0,0,0,89,62.236532,25.731634,-1.00,-1.00),(87,'Lappeenranta UT (LUT)','https://pas.renseigne',-1,-1,0,0,0,90,61.064926,28.093988,-1.00,-1.00),(88,'Tampere UT (TUT)','https://pas.renseigne',-1,-1,0,0,0,91,61.448980,23.859062,-1.00,-1.00),(89,'Aachen RWTH','https://pas.renseigne',-1,-1,0,0,0,92,50.780078,6.065687,-1.00,-1.00),(90,'Berlin TU','https://pas.renseigne',-1,-1,0,0,0,93,52.512532,13.326945,-1.00,-1.00),(91,'Bochum University','https://pas.renseigne',-1,-1,0,0,0,94,51.445666,7.261609,-1.00,-1.00),(92,'Bremerhaven Hochschule','https://pas.renseigne',-1,-1,0,0,0,95,53.539770,8.582050,-1.00,-1.00),(93,'Brandenburgische TU','https://pas.renseigne',-1,-1,0,0,0,96,51.766987,14.326950,-1.00,-1.00),(94,'Darmstadt TU','https://pas.renseigne',-1,-1,0,0,0,97,49.876673,8.656580,-1.00,-1.00),(95,'Dortmund TU','https://pas.renseigne',-1,-1,0,0,0,98,51.492190,7.414136,-1.00,-1.00),(96,'Dresden TU','https://pas.renseigne',-1,-1,0,0,0,3,51.029273,13.728996,4.00,-1.00),(97,'Kaiserslautern TU','https://pas.renseigne',-1,-1,0,0,0,99,49.425389,7.755320,-1.00,-1.00),(98,'Karlsruher Instituts für Technologie','https://pas.renseigne',-1,-1,0,0,0,100,49.011920,8.417030,-1.00,-1.00),(99,'Munchen LMU','https://pas.renseigne',-1,-1,0,0,0,101,48.150483,11.580236,-1.00,-1.00),(100,'Munchen TUM','https://pas.renseigne',-1,-1,0,0,0,101,48.149660,11.567860,-1.00,-1.00),(101,'Passau University','https://pas.renseigne',-1,-1,0,0,0,102,48.567778,13.452797,-1.00,-1.00),(102,'Stuttgart University','https://pas.renseigne',-1,-1,0,0,0,103,48.781647,9.172498,-1.00,-1.00),(103,'Université Aristote de Thessalonique','https://pas.renseigne',-1,-1,0,0,0,105,40.630828,22.959222,-1.00,-1.00),(104,'UT and Economics Budapest','https://pas.renseigne',-1,-1,0,0,0,106,47.481326,19.055483,-1.00,-1.00),(105,'Iceland University Reykjavik','https://pas.renseigne',-1,-1,0,0,0,107,64.123722,-21.926896,-1.00,-1.00),(106,'Dublin City University','https://pas.renseigne',-1,-1,0,0,0,7,53.386094,-6.256369,3.67,-1.00),(107,'Limerick University','https://pas.renseigne',-1,-1,0,0,0,108,52.673588,-8.572437,-1.00,-1.00),(108,'Trinity College Dublin','https://pas.renseigne',-1,-1,0,0,0,7,53.343793,-6.254572,-1.00,-1.00),(109,'University College of Dublin','https://pas.renseigne',-1,-1,0,0,0,7,53.308231,-6.224133,4.50,-1.00),(110,'Aquila University','https://pas.renseigne',-1,-1,0,0,0,109,42.351430,13.397299,-1.00,-1.00),(111,'Catania University','https://pas.renseigne',-1,-1,0,0,0,110,37.503565,15.086498,-1.00,-1.00),(112,'La Sapienza Roma University','https://pas.renseigne',-1,-1,0,0,0,111,41.903763,12.514438,-1.00,-1.00),(113,'Milano University','https://pas.renseigne',-1,-1,0,0,0,112,45.460144,9.194584,-1.00,-1.00),(114,'Napoli University Frederico II','https://pas.renseigne',-1,-1,0,0,0,113,40.845492,14.257806,-1.00,-1.00),(115,'Politecnico di Bari','https://pas.renseigne',-1,-1,0,0,0,114,41.109048,16.878375,-1.00,-1.00),(116,'Politecnico di Milano','https://pas.renseigne',-1,-1,0,0,0,112,45.478091,9.228238,-1.00,-1.00),(117,'Politecnico di Torino','https://pas.renseigne',-1,-1,0,0,0,12,45.062485,7.662456,3.33,-1.00),(118,'Vilnius Gediminas Tech University (VGTU)','https://pas.renseigne',-1,-1,0,0,0,117,54.722468,25.337669,-1.00,-1.00),(119,'DELFT TU','https://pas.renseigne',-1,-1,0,0,0,118,52.002126,4.373298,-1.00,-1.00),(120,'Twente University','https://pas.renseigne',-1,-1,0,0,0,119,52.239797,6.849988,-1.00,-1.00),(121,'Stavanger University','https://pas.renseigne',-1,-1,0,0,0,120,58.937299,5.697201,-1.00,-1.00),(122,'Trondheim University','https://pas.renseigne',-1,-1,0,0,0,121,63.419499,10.402077,-1.00,-1.00),(123,'AGH University of Science and Technology','https://pas.renseigne',-1,-1,0,0,0,122,50.066886,19.913619,-1.00,-1.00),(124,'Gdansk UT','https://pas.renseigne',-1,-1,0,0,0,123,54.352025,18.646638,-1.00,-1.00),(125,'Lodz - IFE','https://pas.renseigne',-1,-1,0,0,0,124,51.755159,19.451476,-1.00,-1.00),(126,'Lodz UT','https://pas.renseigne',-1,-1,0,0,0,124,51.753438,19.510551,-1.00,-1.00),(127,'WUT Poli Warszawa','https://pas.renseigne',-1,-1,0,0,0,125,52.221201,21.008086,-1.00,-1.00),(128,'Lisboa - UT - IST','https://pas.renseigne',-1,-1,0,0,0,126,38.736819,-9.138705,-1.00,-1.00),(129,'Porto University','https://pas.renseigne',-1,-1,0,0,0,127,41.177940,-8.597688,-1.00,-1.00),(130,'Bacau University','https://pas.renseigne',-1,-1,0,0,0,128,46.554354,26.913847,-1.00,-1.00),(131,'IASI - UT Asachi ((TUIASI))','https://pas.renseigne',-1,-1,0,0,0,129,47.154542,27.599406,-1.00,-1.00),(132,'La Cluj-Napoca - (UTCN)','https://pas.renseigne',-1,-1,0,0,0,130,46.769299,23.585613,-1.00,-1.00),(133,'Sapientia University','https://pas.renseigne',-1,-1,0,0,0,130,46.770964,23.587936,-1.00,-1.00),(134,'Stefan cel Mare University of Suceava','https://pas.renseigne',-1,-1,0,0,0,131,47.641883,26.245573,-1.00,-1.00),(135,'Timisoara Politehnica University (UPT)','https://pas.renseigne',-1,-1,0,0,0,21,45.753639,21.225162,3.33,-1.00),(136,'Université d\'Oradea','https://pas.renseigne',-1,-1,0,0,0,132,47.044611,21.920614,-1.00,-1.00),(137,'Université Politehnica de Bucarest','https://pas.renseigne',-1,-1,0,0,0,133,44.438606,26.049493,-1.00,-1.00),(138,'UTCB Bucarest','https://pas.renseigne',-1,-1,0,0,0,133,44.463386,26.124614,-1.00,-1.00),(139,'Slovak UT - STU','https://pas.renseigne',-1,-1,0,0,0,134,48.154703,17.117527,-1.00,-1.00),(140,'Ljubljana University','https://pas.renseigne',-1,-1,0,0,0,135,46.049194,14.504155,-1.00,-1.00),(141,'Barcelone - UPC - EEBE','https://pas.renseigne',-1,-1,0,0,0,137,41.413693,2.222206,-1.00,-1.00),(142,'Barcelone - UPC - ETSECCPB','https://pas.renseigne',-1,-1,0,0,0,138,41.388503,2.111544,-1.00,-1.00),(143,'Barcelone - UPC - ETSEIAT-ESEIAAT','https://pas.renseigne',-1,-1,0,0,0,139,41.562478,2.023583,-1.00,-1.00),(144,'Barcelone - UPC - ETSEIB','https://pas.renseigne',-1,-1,0,0,0,138,41.384792,2.115638,-1.00,-1.00),(145,'Barcelone - UPC - ETSETB','https://pas.renseigne',-1,-1,0,0,0,138,41.388469,2.112097,-1.00,-1.00),(146,'Barcelone - UPC - FIB','https://pas.renseigne',-1,-1,0,0,0,138,41.389484,2.113386,-1.00,-1.00),(147,'Bilbao-Pays Vasco University','https://pas.renseigne',-1,-1,0,0,0,140,43.330943,-2.967892,-1.00,-1.00),(148,'Castilla la Mancha University','https://pas.renseigne',-1,-1,0,0,0,141,39.859309,-4.025580,-1.00,-1.00),(149,'Comillas - UP','https://pas.renseigne',-1,-1,0,0,0,142,40.429581,-3.711425,-1.00,-1.00),(150,'La Coruña University','https://pas.renseigne',-1,-1,0,0,0,144,53.343793,-6.254572,-1.00,-1.00),(151,'Madrid Carlos III University','https://pas.renseigne',-1,-1,0,0,0,145,40.332532,-3.765317,4.33,-1.00),(152,'Madrid UPM /ETS de Ing. Informaticos','https://pas.renseigne',-1,-1,0,0,0,142,40.389603,-3.628543,-1.00,-1.00),(153,'Madrid UPM /ETSI Caminos','https://pas.renseigne',-1,-1,0,0,0,142,40.446737,-3.731843,-1.00,-1.00),(154,'Madrid UPM /ETSI Industriales','https://pas.renseigne',-1,-1,0,0,0,142,40.440506,-3.689842,-1.00,-1.00),(155,'Madrid UPM /ETSI Telecom','https://pas.renseigne',-1,-1,0,0,0,142,40.452587,-3.726434,-1.00,-1.00),(156,'Madrid UPM /ETSIAAB','https://pas.renseigne',-1,-1,0,0,0,142,40.442284,-3.728211,-1.00,-1.00),(157,'Cantabria University - UNICAM','https://pas.renseigne',-1,-1,0,0,0,146,43.471704,-3.801974,-1.00,-1.00),(158,'Sevilla University','https://pas.renseigne',-1,-1,0,0,0,147,37.380758,-5.991231,-1.00,-1.00),(159,'Universidad Politécnica de Madrid','https://pas.renseigne',-1,-1,0,0,0,142,40.447997,-3.717555,-1.00,-1.00),(160,'Universitat Jaume I de Castellón','https://pas.renseigne',-1,-1,0,0,0,143,39.994571,-0.068900,-1.00,-1.00),(161,'Universitat Politécnica de Catalunya','https://pas.renseigne',-1,-1,0,0,0,138,41.388004,2.113280,-1.00,-1.00),(162,'Valencia - UP - ETSICCP (GCU) ETSIT (Telecom) ETSII (Industriales)','https://pas.renseigne',-1,-1,0,0,0,148,39.480641,-0.344010,-1.00,-1.00),(163,'Zaragoza University','https://pas.renseigne',-1,-1,0,0,0,149,41.642064,-0.901506,-1.00,-1.00),(164,'Chalmers University of Technology','https://pas.renseigne',-1,-1,0,0,0,5,57.689706,11.974165,4.33,-1.00),(165,'Kungliga Tekniska Högskolan','https://pas.renseigne',-1,-1,0,0,0,6,59.349806,18.070665,4.33,-1.00),(166,'Lulea UT','https://pas.renseigne',-1,-1,0,0,0,150,65.617996,22.140179,-1.00,-1.00),(167,'Lund University (LTH)','https://pas.renseigne',-1,-1,0,0,0,151,55.711948,13.203493,-1.00,-1.00),(168,'Maribor University','https://pas.renseigne',-1,-1,0,0,0,152,46.559188,15.643307,-1.00,-1.00),(169,'Stockholm University','https://pas.renseigne',-1,-1,0,0,0,6,59.362174,18.057831,4.50,-1.00),(170,'Ecole Polytechnique Fédérale de Lausanne','https://pas.renseigne',-1,-1,0,0,0,153,46.519056,6.566758,-1.00,-1.00),(171,'Aberdeen University','https://pas.renseigne',-1,-1,0,0,0,154,57.164760,-2.101526,-1.00,-1.00),(172,'Bath University','https://pas.renseigne',-1,-1,0,0,0,155,51.378223,-2.326399,-1.00,-1.00),(173,'Birmingham University','https://pas.renseigne',-1,-1,0,0,0,156,52.450817,-1.930513,-1.00,-1.00),(174,'Bristol University','https://pas.renseigne',-1,-1,0,0,0,157,51.458417,-2.602979,-1.00,-1.00),(175,'Glasgow-Strathclyde University','https://pas.renseigne',-1,-1,0,0,0,158,55.862122,-4.242285,-1.00,-1.00),(176,'Leeds University','https://pas.renseigne',-1,-1,0,0,0,159,53.806682,-1.555033,-1.00,-1.00),(177,'London Imperial College','https://pas.renseigne',-1,-1,0,0,0,160,51.498800,-0.174877,-1.00,-1.00),(178,'Loughborough University','https://pas.renseigne',-1,-1,0,0,0,161,52.765081,-1.232053,-1.00,-1.00),(179,'Sheffield University','https://pas.renseigne',-1,-1,0,0,0,162,53.380941,-1.487947,-1.00,-1.00),(180,'Carleton University Ottawa','https://pas.renseigne',-1,-1,0,0,0,11,45.387581,-75.696020,-1.00,-1.00),(181,'Concordia University','https://pas.renseigne',-1,-1,0,0,0,163,45.494505,-73.577281,-1.00,-1.00),(182,'Ecole de Technologie Supérieure','https://pas.renseigne',-1,-1,0,0,0,163,45.494546,-73.562246,-1.00,-1.00),(183,'Ecole Polytechnique de Montréal','https://pas.renseigne',-1,-1,0,0,0,163,45.504384,-73.612883,-1.00,-1.00),(184,'Université d\'Ottawa','https://pas.renseigne',-1,-1,0,0,0,11,45.423106,-75.683133,4.33,-1.00),(185,'Université Laval','https://pas.renseigne',-1,-1,0,0,0,165,46.781746,-71.274742,-1.00,-1.00),(186,'University of Alberta','https://pas.renseigne',-1,-1,0,0,0,166,53.523219,-113.526319,-1.00,-1.00),(187,'University of Sherbrooke','https://pas.renseigne',-1,-1,0,0,0,4,45.379432,-71.927816,4.00,-1.00),(188,'University of Waterloo','https://pas.renseigne',-1,-1,0,0,0,167,43.472285,-80.544858,-1.00,-1.00),(189,'Université Quisqueya','https://pas.renseigne',-1,-1,0,0,0,168,18.526211,-72.321449,-1.00,-1.00),(190,'Benemérita Universidad Autónoma de Puebla','https://pas.renseigne',-1,-1,0,0,0,169,19.041440,-98.206273,-1.00,-1.00),(191,'Instituto Politécnico Nacional','https://pas.renseigne',-1,-1,0,0,0,170,26.069681,-98.313509,-1.00,-1.00),(192,'Universidad de Guadalajara','https://pas.renseigne',-1,-1,0,0,0,177,20.674875,-103.358967,-1.00,-1.00),(193,'California Institute of Technology','https://pas.renseigne',-1,-1,0,0,0,179,34.137658,-118.125269,-1.00,-1.00),(194,'California State Polytechnic University','https://pas.renseigne',-1,-1,0,0,0,180,34.057565,-117.820741,-1.00,-1.00),(195,'Clemson University','https://pas.renseigne',-1,-1,0,0,0,181,34.676111,-82.836637,-1.00,-1.00),(196,'Florida State University','https://pas.renseigne',-1,-1,0,0,0,182,30.441878,-84.298489,-1.00,-1.00),(197,'Georgia Institute of Technology','https://pas.renseigne',-1,-1,0,0,0,183,33.775618,-84.396285,-1.00,-1.00),(198,'Illinois Institute of Technology','https://pas.renseigne',-1,-1,0,0,0,184,41.834873,-87.627006,-1.00,-1.00),(199,'Institute of International Education','https://pas.renseigne',-1,-1,0,0,0,185,29.748870,-95.457117,-1.00,-1.00),(200,'International Student Exchange Program','https://pas.renseigne',-1,-1,0,0,0,186,44.382607,-79.713695,-1.00,-1.00),(201,'Michigan Technological University','https://pas.renseigne',-1,-1,0,0,0,187,47.116775,-88.546022,-1.00,-1.00),(202,'New Jersey Institute of Technology','https://pas.renseigne',-1,-1,0,0,0,188,40.742334,-74.179341,-1.00,-1.00),(203,'Pennsylvania State University','https://pas.renseigne',-1,-1,0,0,0,189,40.798213,-77.859908,-1.00,-1.00),(204,'University of North Carolina at Chapel Hill','https://pas.renseigne',-1,-1,0,0,0,190,35.904912,-79.046913,-1.00,-1.00),(205,'University of Pittsburgh','https://pas.renseigne',-1,-1,0,0,0,191,40.444353,-79.960835,-1.00,-1.00),(206,'University of West Florida','https://pas.renseigne',-1,-1,0,0,0,192,30.547469,-87.216141,-1.00,-1.00),(207,'Australian National University Canberra','https://pas.renseigne',-1,-1,0,0,0,193,-35.277700,149.118527,-1.00,-1.00),(208,'Curtin University of Technology Perth','https://pas.renseigne',-1,-1,0,0,0,194,-32.006195,115.894418,-1.00,-1.00),(209,'Deakin University','https://pas.renseigne',-1,-1,0,0,0,195,-38.143815,144.360186,-1.00,-1.00),(210,'Flinders University','https://pas.renseigne',-1,-1,0,0,0,16,-35.024495,138.571328,3.67,-1.00),(211,'Monash University','https://pas.renseigne',-1,-1,0,0,0,196,-37.910524,145.136218,-1.00,-1.00),(212,'Queensland University of Technology','https://pas.renseigne',-1,-1,0,0,0,197,-27.477357,153.028415,-1.00,-1.00),(213,'Royal Melbourne Institute of Technology','https://pas.renseigne',-1,-1,0,0,0,198,-37.809286,144.964409,-1.00,-1.00),(214,'University of New South Wales','https://pas.renseigne',-1,-1,0,0,0,199,-33.917347,151.231268,-1.00,-1.00),(215,'University of Queensland','https://pas.renseigne',-1,-1,0,0,0,197,-27.497503,153.013690,-1.00,-1.00),(216,'University of Tasmania','https://pas.renseigne',-1,-1,0,0,0,200,-42.903646,147.325848,-1.00,-1.00),(217,'University of Technology Sydney','https://pas.renseigne',-1,-1,0,0,0,199,-33.883238,151.200494,-1.00,-1.00),(218,'University of Wollongong','https://pas.renseigne',-1,-1,0,0,0,201,-34.405404,150.878430,-1.00,-1.00),(219,'University of Waikato','https://pas.renseigne',-1,-1,0,0,0,164,-37.786861,175.318458,-1.00,-1.00),(220,'Instituto Tecnológico de Buenos Aires','https://pas.renseigne',-1,-1,0,0,0,202,-34.603193,-58.367785,-1.00,-1.00),(221,'Instituto Universitario Aeronáutico','https://pas.renseigne',-1,-1,0,0,0,203,-31.433722,-64.275789,-1.00,-1.00),(222,'Universidad de Buenos Aires (Facultad de Ingeniería)','https://pas.renseigne',-1,-1,0,0,0,202,-34.617529,-58.368317,-1.00,-1.00),(223,'Universidad Mar del Plata - Facultad de Ingeniería','https://pas.renseigne',-1,-1,0,0,0,204,-38.012037,-57.581448,-1.00,-1.00),(224,'Universidad Nacional de Cuyo','https://pas.renseigne',-1,-1,0,0,0,205,-32.880732,-68.877986,-1.00,-1.00),(225,'Universidad Nacional de La Plata','https://pas.renseigne',-1,-1,0,0,0,206,-34.900326,-57.931789,-1.00,-1.00),(226,'Universidad Nacional de Río Cuarto','https://pas.renseigne',-1,-1,0,0,0,207,-33.110605,-64.299869,-1.00,-1.00),(227,'Universidad Nacional de Rosario','https://pas.renseigne',-1,-1,0,0,0,208,-32.950273,-60.636032,-1.00,-1.00),(228,'Universidad Nacional de Tucumán','https://pas.renseigne',-1,-1,0,0,0,209,-26.836396,-65.211141,-1.00,-1.00),(229,'Universidad Nacional del Sur','https://pas.renseigne',-1,-1,0,0,0,211,-38.701841,-62.270232,-1.00,-1.00),(230,'Universidad Tecnológica Nacional','https://pas.renseigne',-1,-1,0,0,0,202,-34.604538,-58.372781,-1.00,-1.00),(231,'Universidad Tecnológica Nacional - Facultad Regional Bahía Blanca','https://pas.renseigne',-1,-1,0,0,0,211,-38.710330,-62.264402,-1.00,-1.00),(232,'Universidad Tecnológica Nacional - Facultad Regional Córdoba','https://pas.renseigne',-1,-1,0,0,0,203,-31.442250,-64.193166,-1.00,-1.00),(233,'Universidad Tecnológica Nacional - Facultad Regional Santa Fe','https://pas.renseigne',-1,-1,0,0,0,210,-31.616853,-60.675328,-1.00,-1.00),(234,'Escuela Militar de Ingeniería (La Paz)','https://pas.renseigne',-1,-1,0,0,0,212,-16.534898,-68.086822,-1.00,-1.00),(235,'Instituto Tecnológico de Aeronáutica','https://pas.renseigne',-1,-1,0,0,0,213,-23.210871,-45.875305,-1.00,-1.00),(236,'Pontificia Universidade Catolica do Rio de Janeiro','https://pas.renseigne',-1,-1,0,0,0,214,-22.979397,-43.233087,-1.00,-1.00),(237,'Universidade de Sao Paulo','https://pas.renseigne',-1,-1,0,0,0,18,-23.561399,-46.730789,4.67,-1.00),(238,'Universidade Estadual de Campinas','https://pas.renseigne',-1,-1,0,0,0,15,-22.818439,-47.064721,3.67,-1.00),(239,'Universidade Estadual Paulista Julio de Mesquita Filho','https://pas.renseigne',-1,-1,0,0,0,18,-23.547903,-46.640947,-1.00,-1.00),(240,'Universidade Federal da Paraiba','https://pas.renseigne',-1,-1,0,0,0,215,-7.137370,-34.845551,-1.00,-1.00),(241,'Universidade Federal de Campina Grande','https://pas.renseigne',-1,-1,0,0,0,215,-7.217137,-35.909754,-1.00,-1.00),(242,'Universidade Federal de Goiás','https://pas.renseigne',-1,-1,0,0,0,216,-16.606208,-49.261459,-1.00,-1.00),(243,'Universidade Federal de Minas Gerais','https://pas.renseigne',-1,-1,0,0,0,217,-19.870682,-43.967736,-1.00,-1.00),(244,'Universidade Federal de Santa Catarina','https://pas.renseigne',-1,-1,0,0,0,219,-27.600703,-48.519178,-1.00,-1.00),(245,'Universidade Federal de Uberlandia','https://pas.renseigne',-1,-1,0,0,0,220,-18.918114,-48.257636,-1.00,-1.00),(246,'Universidade Federal do Ceara','https://pas.renseigne',-1,-1,0,0,0,221,-3.741753,-38.538685,-1.00,-1.00),(247,'Universidade Federal do Rio de Janeiro','https://pas.renseigne',-1,-1,0,0,0,214,-22.954141,-43.175364,-1.00,-1.00),(248,'Universidade Federale do Paraná','https://pas.renseigne',-1,-1,0,0,0,222,-25.426908,-49.261766,-1.00,-1.00),(249,'Universidade Tecnologica Federal do Paraná','https://pas.renseigne',-1,-1,0,0,0,222,-25.439297,-49.268876,-1.00,-1.00),(250,'Pontificia Universidad Catolica','https://pas.renseigne',-1,-1,0,0,0,223,-33.441128,-70.640793,-1.00,-1.00),(251,'Pontificia Universidad Catolica de Valparaiso','https://pas.renseigne',-1,-1,0,0,0,10,-33.044407,-71.605872,-1.00,-1.00),(252,'Universidad de Concepción','https://pas.renseigne',-1,-1,0,0,0,225,-36.829476,-73.034182,-1.00,-1.00),(253,'Universidad de Santiago de Chile','https://pas.renseigne',-1,-1,0,0,0,224,-33.449590,-70.680195,-1.00,-1.00),(254,'Universidad Técnica Federico Santa María','https://pas.renseigne',-1,-1,0,0,0,10,-33.035239,-71.596779,4.33,-1.00),(255,'Pontificia Universidad Javeriana','https://pas.renseigne',-1,-1,0,0,0,210,4.628458,-74.064908,-1.00,-1.00),(256,'Universidad de Antoioquia','https://pas.renseigne',-1,-1,0,0,0,226,6.267748,-75.568842,-1.00,-1.00),(257,'Universidad de Los Andes','https://pas.renseigne',-1,-1,0,0,0,227,4.601787,-74.066077,-1.00,-1.00),(258,'Universidad Militar Nueva Granada','https://pas.renseigne',-1,-1,0,0,0,228,4.683010,-74.042243,-1.00,-1.00),(259,'Universidad Nacional de Colombia','https://pas.renseigne',-1,-1,0,0,0,229,4.638194,-74.084046,-1.00,-1.00),(260,'Universidad de la República','https://pas.renseigne',-1,-1,0,0,0,230,-34.901059,-56.173338,-1.00,-1.00),(261,'Universidad Simon Bolivar','https://pas.renseigne',-1,-1,0,0,0,231,10.408363,-66.875573,-1.00,-1.00);
/*!40000 ALTER TABLE `exchange_university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_universitycontracts`
--

DROP TABLE IF EXISTS `exchange_universitycontracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exchange_universitycontracts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ContractType` varchar(200) NOT NULL,
  `University_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `exchange_universityc_University_id_517f02d0_fk_exchange_` (`University_id`),
  CONSTRAINT `exchange_universityc_University_id_517f02d0_fk_exchange_` FOREIGN KEY (`University_id`) REFERENCES `exchange_university` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_universitycontracts`
--

LOCK TABLES `exchange_universitycontracts` WRITE;
/*!40000 ALTER TABLE `exchange_universitycontracts` DISABLE KEYS */;
INSERT INTO `exchange_universitycontracts` VALUES (1,'X',1),(2,'X',2),(3,'X',3),(4,'X',4),(5,'X',5),(6,'X',6),(7,'X',7),(8,'X',8),(9,'X',9),(10,'X',10),(11,'X',11),(12,'X',12),(13,'X',13),(14,'X',14),(15,'X',15),(16,'X',16),(17,'X',17),(18,'X',18),(19,'X',19),(20,'X',20),(21,'X',21),(22,'X',22),(23,'X',23),(24,'X',24),(25,'X',25),(26,'X',26),(27,'X',27),(28,'X',28),(29,'X',29),(30,'X',30),(31,'X',31),(32,'X',32),(33,'X',33),(34,'X',34),(35,'X',35),(36,'X',36),(37,'X',37),(38,'X',38),(39,'X',39),(40,'X',40),(41,'X',41),(42,'X',42),(43,'X',43),(44,'X',44),(45,'X',45),(46,'X',46),(47,'X',47),(48,'X',48),(49,'X',49),(50,'X',50),(51,'X',51),(52,'X',52),(53,'X',53),(54,'X',54),(55,'X',55),(56,'X',56),(57,'X',57),(58,'X',58),(59,'X',59),(60,'X',60),(61,'X',61),(62,'X',62),(63,'X',63),(64,'X',64),(65,'X',65),(66,'X',66),(67,'X',67),(68,'X',68),(69,'X',69),(70,'X',70),(71,'X',71),(72,'X',72),(73,'X',73),(74,'X',74),(75,'X',75),(76,'X',76),(77,'X',77),(78,'X',78),(79,'X',79),(80,'X',80),(81,'X',81),(82,'X',82),(83,'X',83),(84,'X',84),(85,'X',85),(86,'X',86),(87,'X',87),(88,'X',88),(89,'X',89),(90,'X',90),(91,'X',91),(92,'X',92),(93,'X',93),(94,'X',94),(95,'X',95),(96,'X',96),(97,'X',97),(98,'X',98),(99,'X',99),(100,'X',100),(101,'X',101),(102,'X',102),(103,'X',103),(104,'X',104),(105,'X',105),(106,'X',106),(107,'X',107),(108,'X',108),(109,'X',109),(110,'X',110),(111,'X',111),(112,'X',112),(113,'X',113),(114,'X',114),(115,'X',115),(116,'X',116),(117,'X',117),(118,'X',118),(119,'X',119),(120,'X',120),(121,'X',121),(122,'X',122),(123,'X',123),(124,'X',124),(125,'X',125),(126,'X',126),(127,'X',127),(128,'X',128),(129,'X',129),(130,'X',130),(131,'X',131),(132,'X',132),(133,'X',133),(134,'X',134),(135,'X',135),(136,'X',136),(137,'X',137),(138,'X',138),(139,'X',139),(140,'X',140),(141,'X',141),(142,'X',142),(143,'X',143),(144,'X',144),(145,'X',145),(146,'X',146),(147,'X',147),(148,'X',148),(149,'X',149),(150,'X',150),(151,'X',151),(152,'X',152),(153,'X',153),(154,'X',154),(155,'X',155),(156,'X',156),(157,'X',157),(158,'X',158),(159,'X',159),(160,'X',160),(161,'X',161),(162,'X',162),(163,'X',163),(164,'X',164),(165,'X',165),(166,'X',166),(167,'X',167),(168,'X',168),(169,'X',169),(170,'X',170),(171,'X',171),(172,'X',172),(173,'X',173),(174,'X',174),(175,'X',175),(176,'X',176),(177,'X',177),(178,'X',178),(179,'X',179),(180,'X',180),(181,'X',181),(182,'X',182),(183,'X',183),(184,'X',184),(185,'X',185),(186,'X',186),(187,'X',187),(188,'X',188),(189,'X',189),(190,'X',190),(191,'X',191),(192,'X',192),(193,'X',193),(194,'X',194),(195,'X',195),(196,'X',196),(197,'X',197),(198,'X',198),(199,'X',199),(200,'X',200),(201,'X',201),(202,'X',202),(203,'X',203),(204,'X',204),(205,'X',205),(206,'X',206),(207,'X',207),(208,'X',208),(209,'X',209),(210,'X',210),(211,'X',211),(212,'X',212),(213,'X',213),(214,'X',214),(215,'X',215),(216,'X',216),(217,'X',217),(218,'X',218),(219,'X',219),(220,'X',220),(221,'X',221),(222,'X',222),(223,'X',223),(224,'X',224),(225,'X',225),(226,'X',226),(227,'X',227),(228,'X',228),(229,'X',229),(230,'X',230),(231,'X',231),(232,'X',232),(233,'X',233),(234,'X',234),(235,'X',235),(236,'X',236),(237,'X',237),(238,'X',238),(239,'X',239),(240,'X',240),(241,'X',241),(242,'X',242),(243,'X',243),(244,'X',244),(245,'X',245),(246,'X',246),(247,'X',247),(248,'X',248),(249,'X',249),(250,'X',250),(251,'X',251),(252,'X',252),(253,'X',253),(254,'X',254),(255,'X',255),(256,'X',256),(257,'X',257),(258,'X',258),(259,'X',259),(260,'X',260),(261,'X',261);
/*!40000 ALTER TABLE `exchange_universitycontracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_universitylanguages`
--

DROP TABLE IF EXISTS `exchange_universitylanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exchange_universitylanguages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Language` varchar(50) NOT NULL,
  `LanguageDiploma` varchar(200) DEFAULT NULL,
  `LanguageLevel` varchar(10) DEFAULT NULL,
  `University_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `exchange_universityl_University_id_09fc647f_fk_exchange_` (`University_id`),
  CONSTRAINT `exchange_universityl_University_id_09fc647f_fk_exchange_` FOREIGN KEY (`University_id`) REFERENCES `exchange_university` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_universitylanguages`
--

LOCK TABLES `exchange_universitylanguages` WRITE;
/*!40000 ALTER TABLE `exchange_universitylanguages` DISABLE KEYS */;
INSERT INTO `exchange_universitylanguages` VALUES (1,'Inconnu',NULL,'X',1),(2,'Inconnu',NULL,'X',2),(3,'Inconnu',NULL,'X',3),(4,'Inconnu',NULL,'X',4),(5,'Inconnu',NULL,'X',5),(6,'Inconnu',NULL,'X',6),(7,'Inconnu',NULL,'X',7),(8,'Inconnu',NULL,'X',8),(9,'Inconnu',NULL,'X',9),(10,'Inconnu',NULL,'X',10),(11,'Inconnu',NULL,'X',11),(12,'Inconnu',NULL,'X',12),(13,'Inconnu',NULL,'X',13),(14,'Inconnu',NULL,'X',14),(15,'Inconnu',NULL,'X',15),(16,'Inconnu',NULL,'X',16),(17,'Inconnu',NULL,'X',17),(18,'Inconnu',NULL,'X',18),(19,'Inconnu',NULL,'X',19),(20,'Inconnu',NULL,'X',20),(21,'Inconnu',NULL,'X',21),(22,'Inconnu',NULL,'X',22),(23,'Inconnu',NULL,'X',23),(24,'Inconnu',NULL,'X',24),(25,'Inconnu',NULL,'X',25),(26,'Inconnu',NULL,'X',26),(27,'Inconnu',NULL,'X',27),(28,'Inconnu',NULL,'X',28),(29,'Inconnu',NULL,'X',29),(30,'Inconnu',NULL,'X',30),(31,'Inconnu',NULL,'X',31),(32,'Anglais',NULL,'B2',32),(33,'Inconnu',NULL,'X',33),(34,'Inconnu',NULL,'X',34),(35,'Inconnu',NULL,'X',35),(36,'Inconnu',NULL,'X',36),(37,'Inconnu',NULL,'X',37),(38,'Inconnu',NULL,'X',38),(39,'Inconnu',NULL,'X',39),(40,'Inconnu',NULL,'X',40),(41,'Inconnu',NULL,'X',41),(42,'Inconnu',NULL,'X',42),(43,'Inconnu',NULL,'X',43),(44,'Inconnu',NULL,'X',44),(45,'Anglais',NULL,'X',45),(46,'Inconnu',NULL,'X',46),(47,'Inconnu',NULL,'X',47),(48,'Anglais',NULL,'X',48),(49,'Inconnu',NULL,'X',49),(50,'Inconnu',NULL,'X',50),(51,'Inconnu',NULL,'X',51),(52,'Inconnu',NULL,'X',52),(53,'Inconnu',NULL,'X',53),(54,'Inconnu',NULL,'X',54),(55,'Inconnu',NULL,'X',55),(56,'Inconnu',NULL,'X',56),(57,'Anglais','TOEIC','B2',57),(58,'Inconnu',NULL,'X',58),(59,'Inconnu',NULL,'X',59),(60,'Anglais',NULL,'X',60),(61,'Anglais',NULL,'B2',61),(62,'Inconnu',NULL,'X',62),(63,'Inconnu',NULL,'X',63),(64,'Inconnu',NULL,'X',64),(65,'Inconnu',NULL,'X',65),(66,'Inconnu',NULL,'X',66),(67,'Inconnu',NULL,'X',67),(68,'Inconnu',NULL,'X',68),(69,'Inconnu',NULL,'X',69),(70,'Inconnu',NULL,'X',70),(71,'Inconnu',NULL,'X',71),(72,'Anglais',NULL,'X',72),(73,'Inconnu',NULL,'X',73),(74,'Inconnu',NULL,'X',74),(75,'Inconnu',NULL,'X',75),(76,'Inconnu',NULL,'X',76),(77,'Inconnu',NULL,'X',77),(78,'Inconnu',NULL,'X',78),(79,'Inconnu',NULL,'X',79),(80,'Anglais',NULL,'B2',80),(81,'Anglais',NULL,'B2',81),(82,'Inconnu',NULL,'X',82),(83,'Anglais',NULL,'B2',83),(84,'Inconnu',NULL,'X',84),(85,'Inconnu',NULL,'X',85),(86,'Inconnu',NULL,'X',86),(87,'Inconnu',NULL,'X',87),(88,'Inconnu',NULL,'X',88),(89,'Inconnu',NULL,'X',89),(90,'Inconnu',NULL,'X',90),(91,'Inconnu',NULL,'X',91),(92,'Inconnu',NULL,'X',92),(93,'Inconnu',NULL,'X',93),(94,'Inconnu',NULL,'X',94),(95,'Inconnu',NULL,'X',95),(96,'Anglais','CAE','B2',96),(97,'Inconnu',NULL,'X',97),(98,'Inconnu',NULL,'X',98),(99,'Inconnu',NULL,'X',99),(100,'Inconnu',NULL,'X',100),(101,'Inconnu',NULL,'X',101),(102,'Inconnu',NULL,'X',102),(103,'Inconnu',NULL,'X',103),(104,'Inconnu',NULL,'X',104),(105,'Inconnu',NULL,'X',105),(106,'Anglais',NULL,'X',106),(107,'Inconnu',NULL,'X',107),(108,'Inconnu',NULL,'X',108),(109,'Anglais',NULL,'A2',109),(110,'Inconnu',NULL,'X',110),(111,'Inconnu',NULL,'X',111),(112,'Inconnu',NULL,'X',112),(113,'Inconnu',NULL,'X',113),(114,'Inconnu',NULL,'X',114),(115,'Inconnu',NULL,'X',115),(116,'Inconnu',NULL,'X',116),(117,'Anglais',NULL,'B2',117),(118,'Inconnu',NULL,'X',118),(119,'Inconnu',NULL,'X',119),(120,'Inconnu',NULL,'X',120),(121,'Inconnu',NULL,'X',121),(122,'Inconnu',NULL,'X',122),(123,'Inconnu',NULL,'X',123),(124,'Inconnu',NULL,'X',124),(125,'Inconnu',NULL,'X',125),(126,'Inconnu',NULL,'X',126),(127,'Inconnu',NULL,'X',127),(128,'Inconnu',NULL,'X',128),(129,'Inconnu',NULL,'X',129),(130,'Inconnu',NULL,'X',130),(131,'Inconnu',NULL,'X',131),(132,'Inconnu',NULL,'X',132),(133,'Inconnu',NULL,'X',133),(134,'Inconnu',NULL,'X',134),(135,'Anglais',NULL,'X',135),(136,'Inconnu',NULL,'X',136),(137,'Inconnu',NULL,'X',137),(138,'Inconnu',NULL,'X',138),(139,'Inconnu',NULL,'X',139),(140,'Inconnu',NULL,'X',140),(141,'Inconnu',NULL,'X',141),(142,'Inconnu',NULL,'X',142),(143,'Inconnu',NULL,'X',143),(144,'Inconnu',NULL,'X',144),(145,'Inconnu',NULL,'X',145),(146,'Inconnu',NULL,'X',146),(147,'Inconnu',NULL,'X',147),(148,'Inconnu',NULL,'X',148),(149,'Inconnu',NULL,'X',149),(150,'Inconnu',NULL,'X',150),(151,'Espagnol',NULL,'B2',151),(152,'Inconnu',NULL,'X',152),(153,'Inconnu',NULL,'X',153),(154,'Inconnu',NULL,'X',154),(155,'Inconnu',NULL,'X',155),(156,'Inconnu',NULL,'X',156),(157,'Inconnu',NULL,'X',157),(158,'Inconnu',NULL,'X',158),(159,'Inconnu',NULL,'X',159),(160,'Inconnu',NULL,'X',160),(161,'Inconnu',NULL,'X',161),(162,'Inconnu',NULL,'X',162),(163,'Inconnu',NULL,'X',163),(164,'Anglais',NULL,'X',164),(165,'Anglais',NULL,'X',165),(166,'Inconnu',NULL,'X',166),(167,'Inconnu',NULL,'X',167),(168,'Inconnu',NULL,'X',168),(169,'Anglais','TOEIC','B2',169),(170,'Inconnu',NULL,'X',170),(171,'Inconnu',NULL,'X',171),(172,'Inconnu',NULL,'X',172),(173,'Inconnu',NULL,'X',173),(174,'Inconnu',NULL,'X',174),(175,'Inconnu',NULL,'X',175),(176,'Inconnu',NULL,'X',176),(177,'Inconnu',NULL,'X',177),(178,'Inconnu',NULL,'X',178),(179,'Inconnu',NULL,'X',179),(180,'Inconnu',NULL,'X',180),(181,'Inconnu',NULL,'X',181),(182,'Inconnu',NULL,'X',182),(183,'Inconnu',NULL,'X',183),(184,'Anglais','TOEFL','C1',184),(185,'Inconnu',NULL,'X',185),(186,'Inconnu',NULL,'X',186),(187,'Anglais',NULL,'X',187),(188,'Inconnu',NULL,'X',188),(189,'Inconnu',NULL,'X',189),(190,'Inconnu',NULL,'X',190),(191,'Inconnu',NULL,'X',191),(192,'Inconnu',NULL,'X',192),(193,'Inconnu',NULL,'X',193),(194,'Inconnu',NULL,'X',194),(195,'Inconnu',NULL,'X',195),(196,'Inconnu',NULL,'X',196),(197,'Inconnu',NULL,'X',197),(198,'Inconnu',NULL,'X',198),(199,'Inconnu',NULL,'X',199),(200,'Inconnu',NULL,'X',200),(201,'Inconnu',NULL,'X',201),(202,'Inconnu',NULL,'X',202),(203,'Inconnu',NULL,'X',203),(204,'Inconnu',NULL,'X',204),(205,'Inconnu',NULL,'X',205),(206,'Inconnu',NULL,'X',206),(207,'Inconnu',NULL,'X',207),(208,'Inconnu',NULL,'X',208),(209,'Inconnu',NULL,'X',209),(210,'Anglais','TOEFL','B2',210),(211,'Inconnu',NULL,'X',211),(212,'Inconnu',NULL,'X',212),(213,'Inconnu',NULL,'X',213),(214,'Inconnu',NULL,'X',214),(215,'Inconnu',NULL,'X',215),(216,'Inconnu',NULL,'X',216),(217,'Inconnu',NULL,'X',217),(218,'Inconnu',NULL,'X',218),(219,'Inconnu',NULL,'X',219),(220,'Inconnu',NULL,'X',220),(221,'Inconnu',NULL,'X',221),(222,'Inconnu',NULL,'X',222),(223,'Inconnu',NULL,'X',223),(224,'Inconnu',NULL,'X',224),(225,'Inconnu',NULL,'X',225),(226,'Inconnu',NULL,'X',226),(227,'Inconnu',NULL,'X',227),(228,'Inconnu',NULL,'X',228),(229,'Inconnu',NULL,'X',229),(230,'Inconnu',NULL,'X',230),(231,'Inconnu',NULL,'X',231),(232,'Inconnu',NULL,'X',232),(233,'Inconnu',NULL,'X',233),(234,'Inconnu',NULL,'X',234),(235,'Inconnu',NULL,'X',235),(236,'Inconnu',NULL,'X',236),(237,'Anglais',NULL,'X',237),(238,'Portugais',NULL,'X',238),(239,'Inconnu',NULL,'X',239),(240,'Inconnu',NULL,'X',240),(241,'Inconnu',NULL,'X',241),(242,'Inconnu',NULL,'X',242),(243,'Inconnu',NULL,'X',243),(244,'Inconnu',NULL,'X',244),(245,'Inconnu',NULL,'X',245),(246,'Inconnu',NULL,'X',246),(247,'Inconnu',NULL,'X',247),(248,'Inconnu',NULL,'X',248),(249,'Inconnu',NULL,'X',249),(250,'Inconnu',NULL,'X',250),(251,'Inconnu',NULL,'X',251),(252,'Inconnu',NULL,'X',252),(253,'Inconnu',NULL,'X',253),(254,'Espagnol',NULL,'A2',254),(255,'Inconnu',NULL,'X',255),(256,'Inconnu',NULL,'X',256),(257,'Inconnu',NULL,'X',257),(258,'Inconnu',NULL,'X',258),(259,'Inconnu',NULL,'X',259),(260,'Inconnu',NULL,'X',260),(261,'Inconnu',NULL,'X',261),(262,'Japonais',NULL,'X',45),(263,'Anglais',NULL,'X',151),(264,'Allemand',NULL,'X',96);
/*!40000 ALTER TABLE `exchange_universitylanguages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-21 21:10:58
