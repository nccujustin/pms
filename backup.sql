-- MySQL dump 10.13  Distrib 8.0.22, for osx10.16 (x86_64)
--
-- Host: 34.97.221.65    Database: pms
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.8-MariaDB

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add production',7,'add_production'),(26,'Can change production',7,'change_production'),(27,'Can delete production',7,'delete_production'),(28,'Can view production',7,'view_production'),(29,'Can add consume',8,'add_consume'),(30,'Can change consume',8,'change_consume'),(31,'Can delete consume',8,'delete_consume'),(32,'Can view consume',8,'view_consume'),(33,'Can add manufacture',9,'add_manufacture'),(34,'Can change manufacture',9,'change_manufacture'),(35,'Can delete manufacture',9,'delete_manufacture'),(36,'Can view manufacture',9,'view_manufacture'),(37,'Can add store',10,'add_store'),(38,'Can change store',10,'change_store'),(39,'Can delete store',10,'delete_store'),(40,'Can view store',10,'view_store'),(41,'Can add order',11,'add_order'),(42,'Can change order',11,'change_order'),(43,'Can delete order',11,'delete_order'),(44,'Can view order',11,'view_order'),(45,'Can add inventory',12,'add_inventory'),(46,'Can change inventory',12,'change_inventory'),(47,'Can delete inventory',12,'delete_inventory'),(48,'Can view inventory',12,'view_inventory'),(49,'Can add order detail',13,'add_orderdetail'),(50,'Can change order detail',13,'change_orderdetail'),(51,'Can delete order detail',13,'delete_orderdetail'),(52,'Can view order detail',13,'view_orderdetail'),(53,'Can add rfm',14,'add_rfm'),(54,'Can change rfm',14,'change_rfm'),(55,'Can delete rfm',14,'delete_rfm'),(56,'Can view rfm',14,'view_rfm'),(57,'Can add cai',15,'add_cai'),(58,'Can change cai',15,'change_cai'),(59,'Can delete cai',15,'delete_cai'),(60,'Can view cai',15,'view_cai'),(61,'Can add ltv',16,'add_ltv'),(62,'Can change ltv',16,'change_ltv'),(63,'Can delete ltv',16,'delete_ltv'),(64,'Can view ltv',16,'view_ltv'),(65,'Can add supplier',17,'add_supplier'),(66,'Can change supplier',17,'change_supplier'),(67,'Can delete supplier',17,'delete_supplier'),(68,'Can view supplier',17,'view_supplier'),(69,'Can add order',18,'add_order'),(70,'Can change order',18,'change_order'),(71,'Can delete order',18,'delete_order'),(72,'Can view order',18,'view_order'),(73,'Can add inventory',19,'add_inventory'),(74,'Can change inventory',19,'change_inventory'),(75,'Can delete inventory',19,'delete_inventory'),(76,'Can view inventory',19,'view_inventory'),(77,'Can add order details',20,'add_orderdetails'),(78,'Can change order details',20,'change_orderdetails'),(79,'Can delete order details',20,'delete_orderdetails'),(80,'Can view order details',20,'view_orderdetails');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$mQd9WbCbDwMe$aaGmpFBltgL9RZH76gv/0X0xEvwo/u5tGEPIukR1WUA=','2021-03-09 14:42:14.380182',1,'admin','','','admin@example.com',1,1,'2021-03-07 08:30:09.198963');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-03-08 13:54:42.466377','1','南鄉麥芽工廠',1,'[{\"added\": {}}]',17,1),(2,'2021-03-08 13:55:35.372582','2','大園麥芽工廠',1,'[{\"added\": {}}]',17,1),(3,'2021-03-08 13:56:12.379783','3','東來啤酒花工廠',1,'[{\"added\": {}}]',17,1),(4,'2021-03-08 13:56:58.350167','4','嘉慶啤酒花工廠',1,'[{\"added\": {}}]',17,1),(5,'2021-03-08 13:57:39.065059','5','彰濱蓬萊米工廠',1,'[{\"added\": {}}]',17,1),(6,'2021-03-08 13:58:15.462986','6','徳里酵母工廠',1,'[{\"added\": {}}]',17,1),(7,'2021-03-08 13:58:59.019233','7','中興蜂蜜工廠',1,'[{\"added\": {}}]',17,1),(8,'2021-03-08 14:00:22.184960','8','蘭城檸檬酸工廠',1,'[{\"added\": {}}]',17,1),(9,'2021-03-08 14:00:57.660979','9','玉井水果工廠',1,'[{\"added\": {}}]',17,1),(10,'2021-03-08 14:01:29.012426','10','左鎮啤酒原物料工廠',1,'[{\"added\": {}}]',17,1),(11,'2021-03-08 14:02:08.300101','11','蓮香水果工廠',1,'[{\"added\": {}}]',17,1),(12,'2021-03-08 14:02:45.726702','12','竹青啤酒原物料工廠',1,'[{\"added\": {}}]',17,1),(13,'2021-03-08 14:04:29.454494','1','1',1,'[{\"added\": {}}]',19,1),(14,'2021-03-08 14:04:43.485304','2','2',1,'[{\"added\": {}}]',19,1),(15,'2021-03-08 14:04:52.333019','3','3',1,'[{\"added\": {}}]',19,1),(16,'2021-03-08 14:05:05.015437','4','4',1,'[{\"added\": {}}]',19,1),(17,'2021-03-08 14:05:14.278063','5','5',1,'[{\"added\": {}}]',19,1),(18,'2021-03-08 14:05:23.697009','6','6',1,'[{\"added\": {}}]',19,1),(19,'2021-03-08 14:05:34.466119','7','7',1,'[{\"added\": {}}]',19,1),(20,'2021-03-08 14:06:54.963501','1','1',1,'[{\"added\": {}}]',12,1),(21,'2021-03-08 14:07:07.971910','2','2',1,'[{\"added\": {}}]',12,1),(22,'2021-03-08 14:07:35.059779','3','3',1,'[{\"added\": {}}]',12,1),(23,'2021-03-08 14:07:43.847912','4','4',1,'[{\"added\": {}}]',12,1),(24,'2021-03-08 14:07:57.327134','5','5',1,'[{\"added\": {}}]',12,1),(25,'2021-03-08 14:08:13.446854','6','6',1,'[{\"added\": {}}]',12,1),(26,'2021-03-08 14:08:23.807950','7','7',1,'[{\"added\": {}}]',12,1),(27,'2021-03-08 14:08:34.215825','8','8',1,'[{\"added\": {}}]',12,1),(28,'2021-03-08 14:13:54.707370','1','7-11政大門市',1,'[{\"added\": {}}]',10,1),(29,'2021-03-08 14:14:38.982798','2','全家政富店',1,'[{\"added\": {}}]',10,1),(30,'2021-03-08 14:15:10.273062','3','全家木柵店',1,'[{\"added\": {}}]',10,1),(31,'2021-03-08 14:15:52.339153','4','全聯木新門市',1,'[{\"added\": {}}]',10,1),(32,'2021-03-08 14:16:40.538741','5','JASONS政大店',1,'[{\"added\": {}}]',10,1),(33,'2021-03-08 14:17:05.575572','6','頂好木新門市',1,'[{\"added\": {}}]',10,1),(34,'2021-03-08 14:17:54.261953','7','美聯社新光門市',1,'[{\"added\": {}}]',10,1),(35,'2021-03-08 14:18:39.965002','8','7-11新秀門市',1,'[{\"added\": {}}]',10,1),(36,'2021-03-08 14:19:34.512133','9','7-11金恩門市',1,'[{\"added\": {}}]',10,1),(37,'2021-03-08 14:20:40.132831','10','全家興政店',1,'[{\"added\": {}}]',10,1),(38,'2021-03-08 14:26:40.226555','1','1',1,'[{\"added\": {}}]',18,1),(39,'2021-03-08 14:27:29.136571','2','2',1,'[{\"added\": {}}]',18,1),(40,'2021-03-08 14:27:50.064004','3','3',1,'[{\"added\": {}}]',18,1),(41,'2021-03-08 14:28:45.913762','4','4',1,'[{\"added\": {}}]',18,1),(42,'2021-03-08 14:38:07.616298','1','1',1,'[{\"added\": {}}]',20,1),(43,'2021-03-08 14:40:25.535811','8','8',1,'[{\"added\": {}}]',19,1),(44,'2021-03-08 14:40:34.617824','9','9',1,'[{\"added\": {}}]',19,1),(45,'2021-03-08 14:40:41.816962','10','10',1,'[{\"added\": {}}]',19,1),(46,'2021-03-08 14:43:44.554231','2','2',1,'[{\"added\": {}}]',20,1),(47,'2021-03-08 14:44:54.178240','3','3',1,'[{\"added\": {}}]',20,1),(48,'2021-03-08 14:46:17.248134','4','4',1,'[{\"added\": {}}]',20,1),(49,'2021-03-09 14:46:52.717032','2','2',2,'[{\"changed\": {\"fields\": [\"PurchaseDate\"]}}]',18,1),(50,'2021-03-09 14:47:34.175036','1','1',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',20,1),(51,'2021-03-09 14:48:21.620800','2','2',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',20,1),(52,'2021-03-09 14:50:00.372652','2','2',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',20,1),(53,'2021-03-09 14:50:13.227282','3','3',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',20,1),(54,'2021-03-09 14:50:24.391520','4','4',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',20,1),(55,'2021-03-09 14:52:22.423457','4','4',2,'[{\"changed\": {\"fields\": [\"SupplierId\"]}}]',18,1),(56,'2021-03-09 14:55:29.140158','5','5',1,'[{\"added\": {}}]',20,1),(57,'2021-03-09 14:57:32.290157','6','6',1,'[{\"added\": {}}]',20,1),(58,'2021-03-09 14:59:38.658663','1','1',1,'[{\"added\": {}}]',11,1),(59,'2021-03-09 15:00:20.555564','2','2',1,'[{\"added\": {}}]',11,1),(60,'2021-03-09 15:00:54.782918','3','3',1,'[{\"added\": {}}]',11,1),(61,'2021-03-09 15:01:24.415223','4','4',1,'[{\"added\": {}}]',11,1),(62,'2021-03-09 15:01:50.060014','5','5',1,'[{\"added\": {}}]',11,1),(63,'2021-03-09 15:04:04.321231','1','1',1,'[{\"added\": {}}]',13,1),(64,'2021-03-09 15:04:36.599674','2','2',1,'[{\"added\": {}}]',13,1),(65,'2021-03-09 15:05:50.919418','3','3',1,'[{\"added\": {}}]',13,1),(66,'2021-03-09 15:06:27.662988','4','4',1,'[{\"added\": {}}]',13,1),(67,'2021-03-09 15:07:32.465433','1','1',2,'[{\"changed\": {\"fields\": [\"DeliveryDate\"]}}]',11,1),(68,'2021-03-09 15:07:54.995950','2','2',2,'[{\"changed\": {\"fields\": [\"DeliveryDate\"]}}]',11,1),(69,'2021-03-09 15:08:06.606340','3','3',2,'[{\"changed\": {\"fields\": [\"DeliveryDate\"]}}]',11,1),(70,'2021-03-09 15:08:15.585948','4','4',2,'[]',11,1),(71,'2021-03-09 15:08:54.494186','5','5',3,'',11,1),(72,'2021-03-09 15:09:58.866163','5','5',1,'[{\"added\": {}}]',13,1),(73,'2021-03-09 15:10:35.283208','6','6',1,'[{\"added\": {}}]',13,1),(74,'2021-03-09 15:12:10.103652','7','7',1,'[{\"added\": {}}]',13,1),(75,'2021-03-09 15:12:57.634828','8','8',1,'[{\"added\": {}}]',13,1),(76,'2021-03-09 15:13:28.719732','9','9',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(19,'material','inventory'),(18,'material','order'),(20,'material','orderdetails'),(17,'material','supplier'),(8,'product','consume'),(9,'product','manufacture'),(7,'product','production'),(6,'sessions','session'),(15,'store','cai'),(12,'store','inventory'),(16,'store','ltv'),(11,'store','order'),(13,'store','orderdetail'),(14,'store','rfm'),(10,'store','store');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-03-07 08:28:45.969390'),(2,'auth','0001_initial','2021-03-07 08:28:47.929485'),(3,'admin','0001_initial','2021-03-07 08:28:49.533911'),(4,'admin','0002_logentry_remove_auto_add','2021-03-07 08:28:50.049207'),(5,'admin','0003_logentry_add_action_flag_choices','2021-03-07 08:28:50.162089'),(6,'contenttypes','0002_remove_content_type_name','2021-03-07 08:28:50.561918'),(7,'auth','0002_alter_permission_name_max_length','2021-03-07 08:28:50.757508'),(8,'auth','0003_alter_user_email_max_length','2021-03-07 08:28:50.949539'),(9,'auth','0004_alter_user_username_opts','2021-03-07 08:28:51.065060'),(10,'auth','0005_alter_user_last_login_null','2021-03-07 08:28:51.249543'),(11,'auth','0006_require_contenttypes_0002','2021-03-07 08:28:51.349513'),(12,'auth','0007_alter_validators_add_error_messages','2021-03-07 08:28:51.457812'),(13,'auth','0008_alter_user_username_max_length','2021-03-07 08:28:51.621343'),(14,'auth','0009_alter_user_last_name_max_length','2021-03-07 08:28:51.781032'),(15,'auth','0010_alter_group_name_max_length','2021-03-07 08:28:51.972999'),(16,'auth','0011_update_proxy_permissions','2021-03-07 08:28:52.246071'),(17,'auth','0012_alter_user_first_name_max_length','2021-03-07 08:28:52.407531'),(18,'sessions','0001_initial','2021-03-07 08:28:52.721388'),(19,'material','0001_initial','2021-03-07 08:37:52.959701'),(20,'store','0001_initial','2021-03-07 08:37:55.991512'),(21,'product','0001_initial','2021-03-07 08:37:57.335701');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5lobhye8eckv69qtmpbe0jfqj1y4ofpi','.eJxVjMsOwiAUBf-FtSHA5enSfb-BABekaiAp7cr477ZJF7o9M3PexIdtrX4befEzkivh5PK7xZCeuR0AH6HdO029rcsc6aHQkw46dcyv2-n-HdQw6l7bKEowKnAWpUsaiwMLoIpj0iTAKK3ILDoDWisD1pVdLDwJwSUwFIl8vtIVNxE:1lJdYs:0vELnzw953tzJ4oQvRBLtHN2ydOqGmaWFYcaBEzCX6Y','2021-03-23 14:42:14.383826'),('dsqzsfzlmvjecfatog5lao41wi20qjbe','.eJxVjMsOwiAUBf-FtSHA5enSfb-BABekaiAp7cr477ZJF7o9M3PexIdtrX4befEzkivh5PK7xZCeuR0AH6HdO029rcsc6aHQkw46dcyv2-n-HdQw6l7bKEowKnAWpUsaiwMLoIpj0iTAKK3ILDoDWisD1pVdLDwJwSUwFIl8vtIVNxE:1lIpQR:Hto0Y2OEjQt0S_zMw3oOinvSFgR2dMB105QqJ_35o7c','2021-03-21 09:10:11.516520'),('mf9ww200xqwelcl608laet1gc5hrnvlr','.eJxVjMsOwiAUBf-FtSHA5enSfb-BABekaiAp7cr477ZJF7o9M3PexIdtrX4befEzkivh5PK7xZCeuR0AH6HdO029rcsc6aHQkw46dcyv2-n-HdQw6l7bKEowKnAWpUsaiwMLoIpj0iTAKK3ILDoDWisD1pVdLDwJwSUwFIl8vtIVNxE:1lIqmH:g5KPzAiUeVmcwcrNxJqwRyDkyWro2egqZL6xVIIwKBA','2021-03-21 10:36:49.909558'),('rkhi7fre94xg80dyi650i5omew46mjmr','.eJxVjMsOwiAUBf-FtSHA5enSfb-BABekaiAp7cr477ZJF7o9M3PexIdtrX4befEzkivh5PK7xZCeuR0AH6HdO029rcsc6aHQkw46dcyv2-n-HdQw6l7bKEowKnAWpUsaiwMLoIpj0iTAKK3ILDoDWisD1pVdLDwJwSUwFIl8vtIVNxE:1lIpmT:ad83YG2kyjhFDZ6nJBg61IkH4fwMovqwDj8D9xJlh5w','2021-03-21 09:32:57.439497'),('vzpq1rne59807sjzx1fg82c9w2y3fv4z','.eJxVjMsOwiAUBf-FtSHA5enSfb-BABekaiAp7cr477ZJF7o9M3PexIdtrX4befEzkivh5PK7xZCeuR0AH6HdO029rcsc6aHQkw46dcyv2-n-HdQw6l7bKEowKnAWpUsaiwMLoIpj0iTAKK3ILDoDWisD1pVdLDwJwSUwFIl8vtIVNxE:1lIq3y:B22M_3qwfa7_yZ8xW41mHom5z96Bh8zz38KrW74kNDM','2021-03-21 09:51:02.833281');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_inventory`
--

DROP TABLE IF EXISTS `material_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `currentAmount` int(11) NOT NULL,
  `creDate` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_inventory`
--

LOCK TABLES `material_inventory` WRITE;
/*!40000 ALTER TABLE `material_inventory` DISABLE KEYS */;
INSERT INTO `material_inventory` VALUES (1,'大麥芽',10000,'2021-03-08 14:04:29.453563'),(2,'啤酒花',10000,'2021-03-08 14:04:43.484315'),(3,'蓬萊米',10000,'2021-03-08 14:04:52.332120'),(4,'龍眼蜂蜜',3000,'2021-03-08 14:05:05.012054'),(5,'檸檬酸',3000,'2021-03-08 14:05:14.277126'),(6,'酵母',5000,'2021-03-08 14:05:23.695921'),(7,'特殊處理水',5000,'2021-03-08 14:05:34.465232'),(8,'葡萄',2000,'2021-03-08 14:40:25.534619'),(9,'鳳梨',3500,'2021-03-08 14:40:34.616925'),(10,'芒果',3000,'2021-03-08 14:40:41.815812');
/*!40000 ALTER TABLE `material_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_order`
--

DROP TABLE IF EXISTS `material_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date NOT NULL,
  `purchaseDate` date NOT NULL,
  `creDate` datetime(6) NOT NULL,
  `supplierId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `material_order_supplierId_id_0c1501c2_fk_material_supplier_id` (`supplierId_id`),
  CONSTRAINT `material_order_supplierId_id_0c1501c2_fk_material_supplier_id` FOREIGN KEY (`supplierId_id`) REFERENCES `material_supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_order`
--

LOCK TABLES `material_order` WRITE;
/*!40000 ALTER TABLE `material_order` DISABLE KEYS */;
INSERT INTO `material_order` VALUES (1,'2021-01-07','2021-01-17','2021-03-08 14:26:40.225527',2),(2,'2021-01-07','2021-02-07','2021-03-08 14:27:29.133605',9),(3,'2021-02-06','2021-03-16','2021-03-08 14:27:50.062992',1),(4,'2021-03-13','2021-03-23','2021-03-08 14:28:45.912463',6);
/*!40000 ALTER TABLE `material_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_orderdetails`
--

DROP TABLE IF EXISTS `material_orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weight` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `origin` varchar(100) NOT NULL,
  `EXP` date NOT NULL,
  `creDate` datetime(6) NOT NULL,
  `materialInventoryId_id` int(11) DEFAULT NULL,
  `materialOrderId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `material_orderdetail_materialInventoryId__945929c4_fk_material_` (`materialInventoryId_id`),
  KEY `material_orderdetail_materialOrderId_id_5da360e5_fk_material_` (`materialOrderId_id`),
  CONSTRAINT `material_orderdetail_materialInventoryId__945929c4_fk_material_` FOREIGN KEY (`materialInventoryId_id`) REFERENCES `material_inventory` (`id`),
  CONSTRAINT `material_orderdetail_materialOrderId_id_5da360e5_fk_material_` FOREIGN KEY (`materialOrderId_id`) REFERENCES `material_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_orderdetails`
--

LOCK TABLES `material_orderdetails` WRITE;
/*!40000 ALTER TABLE `material_orderdetails` DISABLE KEYS */;
INSERT INTO `material_orderdetails` VALUES (1,5000,55,'TW','2021-06-25','2021-03-08 14:38:07.615176',1,1),(2,1000,65,'TW','2021-02-28','2021-03-08 14:43:44.553110',8,2),(3,2000,75,'TW','2021-03-01','2021-03-08 14:44:54.177188',9,2),(4,1500,85,'TW','2021-02-22','2021-03-08 14:46:17.246929',10,2),(5,350,25,'TW','2021-09-18','2021-03-09 14:55:29.138876',1,3),(6,2300,50,'德國','2021-10-10','2021-03-09 14:57:32.289043',6,4);
/*!40000 ALTER TABLE `material_orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_supplier`
--

DROP TABLE IF EXISTS `material_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `creDate` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_supplier`
--

LOCK TABLES `material_supplier` WRITE;
/*!40000 ALTER TABLE `material_supplier` DISABLE KEYS */;
INSERT INTO `material_supplier` VALUES (1,'南鄉麥芽工廠','0917978922','台南市','2021-03-08 13:54:42.463213'),(2,'大園麥芽工廠','0972311942','桃園市','2021-03-08 13:55:35.370979'),(3,'東來啤酒花工廠','0927809773','台東縣','2021-03-08 13:56:12.378100'),(4,'嘉慶啤酒花工廠','0963456534','嘉義縣','2021-03-08 13:56:58.347873'),(5,'彰濱蓬萊米工廠','0912389587','彰化縣','2021-03-08 13:57:39.062410'),(6,'徳里酵母工廠','0955150022','德國','2021-03-08 13:58:15.461277'),(7,'中興蜂蜜工廠','0983777799','台中市','2021-03-08 13:58:59.018334'),(8,'蘭城檸檬酸工廠','0975112228','宜蘭縣','2021-03-08 14:00:22.183772'),(9,'玉井水果工廠','0908031750','台南市','2021-03-08 14:00:57.660077'),(10,'左鎮啤酒原物料工廠','0912453987','台南市','2021-03-08 14:01:29.011461'),(11,'蓮香水果工廠','0932453765','花蓮縣','2021-03-08 14:02:08.298984'),(12,'竹青啤酒原物料工廠','0945378660','新竹縣','2021-03-08 14:02:45.725770');
/*!40000 ALTER TABLE `material_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_consume`
--

DROP TABLE IF EXISTS `product_consume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_consume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `costAmount` int(11) NOT NULL,
  `creDate` datetime(6) NOT NULL,
  `materialInventoryId_id` int(11) DEFAULT NULL,
  `productionId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_consume_materialInventoryId__c2c285a0_fk_material_` (`materialInventoryId_id`),
  KEY `product_consume_productionId_id_4ff56554_fk_product_p` (`productionId_id`),
  CONSTRAINT `product_consume_materialInventoryId__c2c285a0_fk_material_` FOREIGN KEY (`materialInventoryId_id`) REFERENCES `material_inventory` (`id`),
  CONSTRAINT `product_consume_productionId_id_4ff56554_fk_product_p` FOREIGN KEY (`productionId_id`) REFERENCES `product_production` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_consume`
--

LOCK TABLES `product_consume` WRITE;
/*!40000 ALTER TABLE `product_consume` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_consume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_manufacture`
--

DROP TABLE IF EXISTS `product_manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_manufacture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `creDate` datetime(6) NOT NULL,
  `productInventoryId_id` int(11) DEFAULT NULL,
  `productionId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_manufacture_productInventoryId_i_89f17b93_fk_store_inv` (`productInventoryId_id`),
  KEY `product_manufacture_productionId_id_beec29ec_fk_product_p` (`productionId_id`),
  CONSTRAINT `product_manufacture_productInventoryId_i_89f17b93_fk_store_inv` FOREIGN KEY (`productInventoryId_id`) REFERENCES `store_inventory` (`id`),
  CONSTRAINT `product_manufacture_productionId_id_beec29ec_fk_product_p` FOREIGN KEY (`productionId_id`) REFERENCES `product_production` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_manufacture`
--

LOCK TABLES `product_manufacture` WRITE;
/*!40000 ALTER TABLE `product_manufacture` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_manufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_production`
--

DROP TABLE IF EXISTS `product_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_production` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productionDate` date NOT NULL,
  `creDate` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_production`
--

LOCK TABLES `product_production` WRITE;
/*!40000 ALTER TABLE `product_production` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cai`
--

DROP TABLE IF EXISTS `store_cai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_cai` (
  `time` varchar(20) NOT NULL,
  `AIT` varchar(20) NOT NULL,
  `duration` varchar(20) NOT NULL,
  `retentionRate` varchar(20) NOT NULL,
  `survivalRate` varchar(20) NOT NULL,
  `activeProbability` varchar(20) NOT NULL,
  `creDate` datetime(6) NOT NULL,
  `storeId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`time`),
  KEY `store_cai_storeId_id_faa6f11d_fk_store_store_id` (`storeId_id`),
  CONSTRAINT `store_cai_storeId_id_faa6f11d_fk_store_store_id` FOREIGN KEY (`storeId_id`) REFERENCES `store_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cai`
--

LOCK TABLES `store_cai` WRITE;
/*!40000 ALTER TABLE `store_cai` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_cai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_inventory`
--

DROP TABLE IF EXISTS `store_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `currentAmount` int(11) NOT NULL,
  `creDate` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_inventory`
--

LOCK TABLES `store_inventory` WRITE;
/*!40000 ALTER TABLE `store_inventory` DISABLE KEYS */;
INSERT INTO `store_inventory` VALUES (1,'經典台灣啤酒',1100,'2021-03-08 14:06:54.962370'),(2,'金牌台灣啤酒',3000,'2021-03-08 14:07:07.970806'),(3,'18天台灣生啤酒',810,'2021-03-08 14:07:35.058877'),(4,'爽啤酒',4400,'2021-03-08 14:07:43.846748'),(5,'桶裝啤酒',730,'2021-03-08 14:07:57.326228'),(6,'金牌free',1400,'2021-03-08 14:08:13.445767'),(7,'蜂蜜啤酒',3050,'2021-03-08 14:08:23.806764'),(8,'水果啤酒',4500,'2021-03-08 14:08:34.214658');
/*!40000 ALTER TABLE `store_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_ltv`
--

DROP TABLE IF EXISTS `store_ltv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_ltv` (
  `time` varchar(20) NOT NULL,
  `SCR` varchar(20) NOT NULL,
  `SW` varchar(20) NOT NULL,
  `sizeOfWallet` varchar(20) NOT NULL,
  `creDate` datetime(6) NOT NULL,
  `storeId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`time`),
  KEY `store_ltv_storeId_id_5b4e6694_fk_store_store_id` (`storeId_id`),
  CONSTRAINT `store_ltv_storeId_id_5b4e6694_fk_store_store_id` FOREIGN KEY (`storeId_id`) REFERENCES `store_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_ltv`
--

LOCK TABLES `store_ltv` WRITE;
/*!40000 ALTER TABLE `store_ltv` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_ltv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order`
--

DROP TABLE IF EXISTS `store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date NOT NULL,
  `deliveryDate` date NOT NULL,
  `creDate` datetime(6) NOT NULL,
  `storeId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_order_storeId_id_f8e48ee1_fk_store_store_id` (`storeId_id`),
  CONSTRAINT `store_order_storeId_id_f8e48ee1_fk_store_store_id` FOREIGN KEY (`storeId_id`) REFERENCES `store_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order`
--

LOCK TABLES `store_order` WRITE;
/*!40000 ALTER TABLE `store_order` DISABLE KEYS */;
INSERT INTO `store_order` VALUES (1,'2020-12-11','2020-12-21','2021-03-09 14:59:38.657646',5),(2,'2021-01-14','2021-02-14','2021-03-09 15:00:20.554348',1),(3,'2021-02-08','2021-02-18','2021-03-09 15:00:54.781938',10),(4,'2021-03-21','2021-04-01','2021-03-09 15:01:24.414023',6);
/*!40000 ALTER TABLE `store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_orderdetail`
--

DROP TABLE IF EXISTS `store_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(10) NOT NULL,
  `price` varchar(20) NOT NULL,
  `EXP` date NOT NULL,
  `creDate` datetime(6) NOT NULL,
  `productInventoryId_id` int(11) DEFAULT NULL,
  `productOrderId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_orderdetail_productInventoryId_i_c35f1fab_fk_store_inv` (`productInventoryId_id`),
  KEY `store_orderdetail_productOrderId_id_e7048aee_fk_store_order_id` (`productOrderId_id`),
  CONSTRAINT `store_orderdetail_productInventoryId_i_c35f1fab_fk_store_inv` FOREIGN KEY (`productInventoryId_id`) REFERENCES `store_inventory` (`id`),
  CONSTRAINT `store_orderdetail_productOrderId_id_e7048aee_fk_store_order_id` FOREIGN KEY (`productOrderId_id`) REFERENCES `store_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_orderdetail`
--

LOCK TABLES `store_orderdetail` WRITE;
/*!40000 ALTER TABLE `store_orderdetail` DISABLE KEYS */;
INSERT INTO `store_orderdetail` VALUES (1,'230','40','2021-09-27','2021-03-09 15:04:04.320154',7,1),(2,'200','40','2021-09-03','2021-03-09 15:04:36.598436',8,1),(3,'350','30','2021-09-24','2021-03-09 15:05:50.918359',1,2),(4,'275','30','2021-10-14','2021-03-09 15:06:27.661786',4,2),(5,'360','30','2021-12-23','2021-03-09 15:09:58.865191',2,3),(6,'245','30','2021-12-16','2021-03-09 15:10:35.282028',3,3),(7,'290','30','2022-01-25','2021-03-09 15:12:10.102596',2,4),(8,'185','30','2021-12-19','2021-03-09 15:12:57.633630',6,4),(9,'260','40','2022-01-11','2021-03-09 15:13:28.718754',8,4);
/*!40000 ALTER TABLE `store_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_rfm`
--

DROP TABLE IF EXISTS `store_rfm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_rfm` (
  `time` varchar(20) NOT NULL,
  `recency` datetime(6) NOT NULL,
  `frequency` varchar(20) NOT NULL,
  `monetaryValue` int(11) NOT NULL,
  `creDate` datetime(6) NOT NULL,
  `storeId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`time`),
  KEY `store_rfm_storeId_id_5d99f8d5_fk_store_store_id` (`storeId_id`),
  CONSTRAINT `store_rfm_storeId_id_5d99f8d5_fk_store_store_id` FOREIGN KEY (`storeId_id`) REFERENCES `store_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_rfm`
--

LOCK TABLES `store_rfm` WRITE;
/*!40000 ALTER TABLE `store_rfm` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_rfm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_store`
--

DROP TABLE IF EXISTS `store_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `creDate` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_store`
--

LOCK TABLES `store_store` WRITE;
/*!40000 ALTER TABLE `store_store` DISABLE KEYS */;
INSERT INTO `store_store` VALUES (1,'7-11政大門市','0929362025','台北市文山區','2021-03-08 14:13:54.706336'),(2,'全家政富店','0975654234','台北市文山區','2021-03-08 14:14:38.981219'),(3,'全家木柵店','0912329297','台北市文山區','2021-03-08 14:15:10.271000'),(4,'全聯木新門市','0938705591','台北市文山區','2021-03-08 14:15:52.337722'),(5,'JASONS政大店','0934576482','台北市文山區','2021-03-08 14:16:40.537818'),(6,'頂好木新門市','0975978921','台北市文山區','2021-03-08 14:17:05.574473'),(7,'美聯社新光門市','0988127517','台北市文山區','2021-03-08 14:17:54.261019'),(8,'7-11新秀門市','0984250625','台北市文山區','2021-03-08 14:18:39.963752'),(9,'7-11金恩門市','0981658784','台北市文山區','2021-03-08 14:19:34.511217'),(10,'全家興政店','0909050586','台北市文山區','2021-03-08 14:20:40.131355');
/*!40000 ALTER TABLE `store_store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-09 23:37:05
