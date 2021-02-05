-- MySQL dump 10.16  Distrib 10.1.45-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: sealtalk
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB

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
-- Current Database: `sealtalk`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sealtalk` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sealtalk`;

--
-- Table structure for table `blacklists`
--

DROP TABLE IF EXISTS `blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `friendId` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blacklists_user_id_friend_id` (`userId`,`friendId`),
  KEY `blacklists_user_id_timestamp` (`userId`,`timestamp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklists`
--

LOCK TABLES `blacklists` WRITE;
/*!40000 ALTER TABLE `blacklists` DISABLE KEYS */;
INSERT INTO `blacklists` VALUES (1,10377799,10377766,0,1611310240653,'2021-01-22 17:48:51','2021-01-22 18:10:41'),(2,10377766,10377799,0,1611310219691,'2021-01-22 18:00:36','2021-01-22 18:10:20');
/*!40000 ALTER TABLE `blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_versions`
--

DROP TABLE IF EXISTS `data_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_versions` (
  `userId` int(10) unsigned NOT NULL,
  `userVersion` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blacklistVersion` bigint(20) unsigned NOT NULL DEFAULT '0',
  `friendshipVersion` bigint(20) unsigned NOT NULL DEFAULT '0',
  `groupVersion` bigint(20) unsigned NOT NULL DEFAULT '0',
  `groupMemberVersion` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_versions`
--

LOCK TABLES `data_versions` WRITE;
/*!40000 ALTER TABLE `data_versions` DISABLE KEYS */;
INSERT INTO `data_versions` VALUES (10377765,0,0,1611749231515,1611637580228,1611637580228),(10377766,0,1611310219691,1611310279206,1611637580228,1611637580228),(10377768,0,0,0,0,0),(10377769,0,0,0,0,0),(10377770,0,0,0,0,0),(10377799,0,1611310240653,1611749231515,1611637580228,1611637580228),(10378869,0,0,0,0,0);
/*!40000 ALTER TABLE `data_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
INSERT INTO `flyway_schema_history` VALUES (1,'2','baselines','BASELINE','baselines',NULL,'root','2021-01-14 10:05:49',0,1);
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendships`
--

DROP TABLE IF EXISTS `friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendships` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `friendId` int(10) unsigned NOT NULL,
  `displayName` varchar(32) NOT NULL DEFAULT '',
  `message` varchar(64) NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `region` varchar(32) DEFAULT '',
  `phone` varchar(32) DEFAULT '',
  `description` varchar(500) DEFAULT '',
  `imageUri` varchar(256) DEFAULT '',
  `timestamp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `friendships_user_id_friend_id` (`userId`,`friendId`),
  KEY `friendships_user_id_timestamp` (`userId`,`timestamp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendships`
--

LOCK TABLES `friendships` WRITE;
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
INSERT INTO `friendships` VALUES (1,10377766,10377765,'','',20,'','','','',1610618952059,'2021-01-14 18:09:06','2021-01-14 18:09:06'),(2,10377765,10377766,'','我是17810377766',20,'','','','',1610618952059,'2021-01-14 18:09:06','2021-01-14 18:09:06'),(3,10377799,10377766,'','',20,'','','','',1611310279206,'2021-01-22 17:39:05','2021-01-22 17:39:05'),(4,10377766,10377799,'','我是17810377799',20,'','','','',1611310279206,'2021-01-22 17:39:05','2021-01-22 17:39:05'),(5,10377799,10377765,'','',20,'','','','',1611749231515,'2021-01-22 17:59:55','2021-01-22 17:59:55'),(6,10377765,10377799,'','我是17810377799',20,'','','','',1611749231515,'2021-01-22 17:59:55','2021-01-22 17:59:55');
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_bulletins`
--

DROP TABLE IF EXISTS `group_bulletins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_bulletins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupId` char(64) NOT NULL,
  `content` text,
  `timestamp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_bulletins`
--

LOCK TABLES `group_bulletins` WRITE;
/*!40000 ALTER TABLE `group_bulletins` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_bulletins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_exited_lists`
--

DROP TABLE IF EXISTS `group_exited_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_exited_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupId` char(64) NOT NULL,
  `quitUserId` int(10) unsigned NOT NULL,
  `quitNickname` varchar(32) NOT NULL,
  `quitPortraitUri` varchar(256) NOT NULL DEFAULT '',
  `quitReason` int(10) unsigned NOT NULL,
  `quitTime` bigint(20) NOT NULL,
  `operatorId` int(10) unsigned DEFAULT NULL,
  `operatorName` varchar(32) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_exited_lists_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_exited_lists`
--

LOCK TABLES `group_exited_lists` WRITE;
/*!40000 ALTER TABLE `group_exited_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_exited_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_favs`
--

DROP TABLE IF EXISTS `group_favs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_favs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `groupId` char(64) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupfavindex` (`userId`,`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_favs`
--

LOCK TABLES `group_favs` WRITE;
/*!40000 ALTER TABLE `group_favs` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_favs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_members`
--

DROP TABLE IF EXISTS `group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupId` char(64) NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `displayName` varchar(32) NOT NULL DEFAULT '',
  `role` int(10) unsigned NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `groupNickname` varchar(32) NOT NULL DEFAULT '',
  `region` varchar(32) DEFAULT '',
  `phone` varchar(32) DEFAULT '',
  `WeChat` varchar(32) DEFAULT '',
  `Alipay` varchar(32) DEFAULT '',
  `memberDesc` varchar(800) DEFAULT '',
  `timestamp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_members_group_id_member_id_is_deleted` (`groupId`,`memberId`,`isDeleted`),
  KEY `group_members_member_id_timestamp` (`memberId`,`timestamp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_members`
--

LOCK TABLES `group_members` WRITE;
/*!40000 ALTER TABLE `group_members` DISABLE KEYS */;
INSERT INTO `group_members` VALUES (1,'1',10377799,'',1,0,'','','','','','',1611563640780,'2021-01-25 16:34:01','2021-01-25 16:34:01'),(2,'1',10377766,'',0,0,'','','','','','',1611563640780,'2021-01-25 16:34:01','2021-01-25 16:34:01'),(3,'2',10377799,'',1,0,'','','','','','',1611563717444,'2021-01-25 16:35:54','2021-01-25 16:35:54'),(4,'2',10377766,'',0,0,'','','','','','',1611563717444,'2021-01-25 16:35:54','2021-01-25 16:35:54'),(5,'3',10377765,'',1,0,'','','','','','',1611578308186,'2021-01-25 20:38:29','2021-01-25 20:38:29'),(6,'3',10377799,'',1,0,'','','','','','',1611578308186,'2021-01-25 20:38:29','2021-01-25 20:38:29'),(7,'3',10377766,'',0,0,'','','','','','',1611578308186,'2021-01-25 20:38:29','2021-01-25 20:38:29'),(8,'4',10377765,'',1,0,'','','','','','',1611579646296,'2021-01-25 21:00:47','2021-01-25 21:00:47'),(9,'4',10377799,'',1,0,'','','','','','',1611579646296,'2021-01-25 21:00:47','2021-01-25 21:00:47'),(10,'4',10377766,'',0,0,'','','','','','',1611579646296,'2021-01-25 21:00:47','2021-01-25 21:00:47'),(11,'5',10377765,'',1,0,'','','','','','',1611579739643,'2021-01-25 21:02:20','2021-01-25 21:02:20'),(12,'5',10377799,'',1,0,'','','','','','',1611579739643,'2021-01-25 21:02:20','2021-01-25 21:02:20'),(13,'5',10377766,'',0,0,'','','','','','',1611579739643,'2021-01-25 21:02:20','2021-01-25 21:02:20'),(14,'6',10377765,'',1,0,'','','','','','',1611579824189,'2021-01-25 21:03:44','2021-01-25 21:03:44'),(15,'6',10377799,'',1,0,'','','','','','',1611579824189,'2021-01-25 21:03:44','2021-01-25 21:03:44'),(16,'6',10377766,'',0,0,'','','','','','',1611579824189,'2021-01-25 21:03:44','2021-01-25 21:03:44'),(17,'138662831521793',10377765,'',1,0,'','','','','','',1611637580228,'2021-01-26 13:06:21','2021-01-26 13:06:21'),(18,'138662831521793',10377799,'',1,0,'','','','','','',1611637580228,'2021-01-26 13:06:21','2021-01-26 13:06:21'),(19,'138662831521793',10377766,'',0,0,'','','','','','',1611637580228,'2021-01-26 13:06:21','2021-01-26 13:06:21');
/*!40000 ALTER TABLE `group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_receivers`
--

DROP TABLE IF EXISTS `group_receivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_receivers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `groupId` char(64) DEFAULT NULL,
  `groupName` varchar(32) NOT NULL DEFAULT '',
  `groupPortraitUri` varchar(256) NOT NULL DEFAULT '',
  `requesterId` int(10) unsigned DEFAULT NULL,
  `receiverId` int(10) unsigned DEFAULT NULL,
  `type` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `deletedUsers` varchar(256) NOT NULL DEFAULT '',
  `isRead` int(10) unsigned NOT NULL,
  `joinInfo` varchar(256) NOT NULL DEFAULT '',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupId` (`groupId`),
  KEY `requesterId` (`requesterId`),
  KEY `receiverId` (`receiverId`),
  CONSTRAINT `group_receivers_ibfk_2` FOREIGN KEY (`requesterId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `group_receivers_ibfk_3` FOREIGN KEY (`receiverId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_receivers`
--

LOCK TABLES `group_receivers` WRITE;
/*!40000 ALTER TABLE `group_receivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_receivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_syncs`
--

DROP TABLE IF EXISTS `group_syncs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_syncs` (
  `groupId` char(64) NOT NULL,
  `syncInfo` tinyint(1) NOT NULL DEFAULT '0',
  `syncMember` tinyint(1) NOT NULL DEFAULT '0',
  `dismiss` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_syncs`
--

LOCK TABLES `group_syncs` WRITE;
/*!40000 ALTER TABLE `group_syncs` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_syncs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` char(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `portraitUri` varchar(256) NOT NULL DEFAULT '',
  `memberCount` int(10) unsigned NOT NULL DEFAULT '0',
  `maxMemberCount` int(10) unsigned NOT NULL DEFAULT '500',
  `creatorId` int(10) unsigned NOT NULL,
  `bulletin` text,
  `certiStatus` int(10) unsigned NOT NULL DEFAULT '1',
  `isMute` int(10) unsigned NOT NULL DEFAULT '0',
  `clearStatus` int(10) unsigned NOT NULL DEFAULT '0',
  `clearTimeAt` bigint(20) unsigned NOT NULL DEFAULT '0',
  `memberProtection` int(10) unsigned NOT NULL DEFAULT '0',
  `copiedTime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `timestamp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `easemobGroupId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_id_timestamp` (`id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES ('1','和扣扣','http://dev.sealtalk.yujianlu.clouddn.com/Fraxl9zyCNWmYJg-vEIbBOBgFBIr',2,500,10377766,NULL,1,0,0,0,1,0,1611563642107,'2021-01-25 16:34:00','2021-01-25 16:34:00',NULL,NULL),('138662831521793','个~吃点东西宣传册','',3,500,10377766,NULL,1,0,0,0,1,0,1611637580228,'2021-01-26 13:06:20','2021-01-26 13:06:20',NULL,'138662831521793'),('2','u健健康康','',2,500,10377766,NULL,1,0,0,0,1,0,1611563717444,'2021-01-25 16:35:17','2021-01-25 16:35:17',NULL,NULL),('3','hhhh','',3,500,10377766,NULL,1,0,0,0,1,0,1611578308186,'2021-01-25 20:38:28','2021-01-25 20:38:28',NULL,'138600680325121'),('4','哈哈哈哈','',3,500,10377766,NULL,1,0,0,0,1,0,1611579646296,'2021-01-25 21:00:46','2021-01-25 21:00:46',NULL,'138602083319809'),('5','uu也有意见','',3,500,10377766,NULL,1,0,0,0,1,0,1611579739643,'2021-01-25 21:02:19','2021-01-25 21:02:19',NULL,'138602180837377'),('6','uu好v','',3,500,10377766,NULL,1,0,0,0,1,0,1611579824189,'2021-01-25 21:03:44','2021-01-25 21:03:44',NULL,'138602268917762');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_logs`
--

DROP TABLE IF EXISTS `login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `ipAddress` int(10) unsigned NOT NULL,
  `os` varchar(64) NOT NULL,
  `osVersion` varchar(64) NOT NULL,
  `carrier` varchar(64) NOT NULL,
  `device` varchar(64) DEFAULT NULL,
  `manufacturer` varchar(64) DEFAULT NULL,
  `userAgent` varchar(256) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_logs`
--

LOCK TABLES `login_logs` WRITE;
/*!40000 ALTER TABLE `login_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_statuses`
--

DROP TABLE IF EXISTS `screen_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operateId` char(40) NOT NULL,
  `conversationType` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `screen_statuses_operate_id` (`operateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_statuses`
--

LOCK TABLES `screen_statuses` WRITE;
/*!40000 ALTER TABLE `screen_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(5) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  `portraitUri` varchar(256) NOT NULL DEFAULT '',
  `passwordHash` char(40) NOT NULL,
  `passwordSalt` char(4) NOT NULL,
  `rongCloudToken` varchar(256) NOT NULL DEFAULT '',
  `easemobToken` varchar(256) NOT NULL DEFAULT '',
  `easemobId` varchar(256) NOT NULL DEFAULT '',
  `gender` varchar(32) NOT NULL DEFAULT 'male',
  `stAccount` varchar(32) NOT NULL DEFAULT '',
  `phoneVerify` int(10) unsigned NOT NULL DEFAULT '1',
  `stSearchVerify` int(10) unsigned NOT NULL DEFAULT '1',
  `friVerify` int(10) unsigned NOT NULL DEFAULT '1',
  `groupVerify` int(10) unsigned NOT NULL DEFAULT '1',
  `pokeStatus` int(10) unsigned NOT NULL DEFAULT '1',
  `groupCount` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_region_phone` (`region`,`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10378870 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10377765,'86','17810377765','17810377765','http://www.rongcloud.cn/images/icon-57.png','449b334bfb5941d94648f40c593a3d3cd2d9bd0d','7098','+8nfrgT3TbJKOqZmNhmDn2Q/EcyPUsTNmW1pyqLp1wo=@3l7q.cn.rongnav.com;3l7q.cn.rongcfg.com','YWMtUO_K3lZQEeuRXLOo0ndph8E5r6cHI0Wel3EcGy8nUn1PJjrQVlAR64ZHLVub9b6UAwMAAAF3AF1SswBPGgC3vwrhApiJ-XX84TTI-ECdVjRpkIY74HIfRch_xPnjMg','10377765','male','',1,1,1,1,1,0,0,'2021-01-14 18:07:30','2021-01-14 18:08:24',NULL),(10377766,'86','17810377766','17810377766','http://www.rongcloud.cn/images/icon-57.png','3c6cf6235ba52a5fd0f956a632cf1b2cc72f030f','6288','+8nfrgT3TbIifl7KkOSMwWQ/EcyPUsTN0usEIAV6Slk=@3l7q.cn.rongnav.com;3l7q.cn.rongcfg.com','YWMtalHHhFZQEeuWXWE08nNC0cE5r6cHI0Wel3EcGy8nUn1r14FwVlAR66MODTAlYVWiAwMAAAF3AF35DABPGgA1RgMUC6EMeDv_z7iE2eCSL0CClBUWWNRTiQs0yuUadw','10377766','male','',1,1,1,1,1,0,0,'2021-01-14 18:08:16','2021-01-14 18:08:47',NULL),(10377768,'86','17810377768','17810377768','http://www.rongcloud.cn/images/icon-57.png','6d3b5c6de44fe1ff81a7a53441cf957f630b9144','6575','+8nfrgT3TbJrm6fZEnUea2Q/EcyPUsTNhPWTdzH/XYo=@3l7q.cn.rongnav.com;3l7q.cn.rongcfg.com','YWMtpb2-glcIEeuP48dHCjdbJsE5r6cHI0Wel3EcGy8nUn2lqgTwVwgR66irdy5UXaMZAwMAAAF3BRVbQABPGgBnU335K8_MDnU_fR6MnH-irS5sAZksJW84jnLAU0Hx_A','10377768','male','',1,1,1,1,1,0,0,'2021-01-15 16:07:00','2021-01-21 10:43:45',NULL),(10377769,'86','17810377769','17810377769','http://www.rongcloud.cn/images/icon-57.png','a60445c04baa91dd10fd40b7702eec470e89364a','5340','+8nfrgT3TbLfDBtZRo5YHWQ/EcyPUsTNkBIstS8f8wE=@3l7q.cn.rongnav.com;3l7q.cn.rongcfg.com','YWMt9nXiBlcHEeugv2nugfqdysE5r6cHI0Wel3EcGy8nUn32YliAVwcR64FAAd37NWzIAwMAAAF3BRDeiABPGgBs6tQuEapbc07R7LdrXPWYLHPo7lkAwJEBwmtk3dkFcQ','10377769','male','',1,1,1,1,1,0,0,'2021-01-15 16:02:06','2021-01-21 10:26:26',NULL),(10377770,'86','17810377770','17810377770','http://www.rongcloud.cn/images/icon-57.png','adb49cdfc7c23f977aa58d92af4a815396fbaacb','1393','','YWMtxryKoFcIEeuNouXGN3_yyME5r6cHI0Wel3EcGy8nUn3GqqiAVwgR642mZT-a5XWaAwMAAAF3BRYzfQBPGgBZABFuJINqnfCcJM-QdD3vfVpBxDXnXHA93kl0_m64cg','10377770','male','',1,1,1,1,1,0,0,'2021-01-15 16:07:56','2021-01-15 16:07:56',NULL),(10377799,'86','17810377799','17810377799','http://www.rongcloud.cn/images/icon-57.png','55976a0ccd2ce9f8180744f172499be5ebf2ca0d','9194','+8nfrgT3TbKTIXmNtyppQ2Q/EcyPUsTN9FIY2LIF3ZY=@3l7q.cn.rongnav.com;3l7q.cn.rongcfg.com','YWMtVXm-RlySEeuquBPoS-SGMME5r6cHI0Wel3EcGy8nUn1VZzWgXJIR67R45XDSbzd6AwMAAAF3KWBOcwBPGgA7tBkta7qqYGpPEaY30qe4IYo6XQwoHtpqIDGCpjGoIw','10377799','male','',1,1,1,1,1,0,0,'2021-01-22 17:15:12','2021-01-22 17:15:37',NULL),(10378869,'86','17810378869','17810378869','http://www.rongcloud.cn/images/icon-57.png','8775ef4e0858b5333fbc858547b64c613d416d07','5613','','YWMtpg0mEllQEeu1nitFH8m2pcE5r6cHI0Wel3EcGy8nUn2l_GdQWVAR6590_9ZTBoqpAwMAAAF3FAiqsgBPGgDJ0gvwfJbiCqq5TNWwvfKvr38PTuj81yzuJmQBrLviVw','10378869','male','',1,1,1,1,1,0,0,'2021-01-18 13:47:24','2021-01-18 13:47:25',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_codes`
--

DROP TABLE IF EXISTS `verification_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verification_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(5) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `sessionId` varchar(32) NOT NULL,
  `token` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`,`region`,`phone`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `verification_codes_region_phone` (`region`,`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_codes`
--

LOCK TABLES `verification_codes` WRITE;
/*!40000 ALTER TABLE `verification_codes` DISABLE KEYS */;
INSERT INTO `verification_codes` VALUES (1,'86','17810377765','','f159d3eb-4831-47d4-8c43-7651c735e637','2021-01-14 18:07:22','2021-01-14 18:07:22'),(2,'86','17810377766','','be2a698d-d547-4edc-945f-dba9b4690c8b','2021-01-14 18:08:12','2021-01-14 18:08:12'),(3,'86','17810377769','','93237dba-e032-4e3d-b454-5053bc5400b3','2021-01-15 16:01:58','2021-01-15 16:01:58'),(4,'86','17810377768','','7f4fa5bb-884e-45d2-9249-d1c78c0ece59','2021-01-15 16:06:54','2021-01-15 16:06:54'),(5,'86','17810377770','','5f191821-64af-45a2-a48d-769323af7b63','2021-01-15 16:07:49','2021-01-15 16:07:49'),(6,'86','17810378869','','5b773234-d29e-4896-ae3e-188cf10bd3a8','2021-01-18 13:47:20','2021-01-18 13:47:20'),(7,'86','13911783192','','42583d39-d191-49b7-984b-d5e68e7527cb','2021-01-21 12:10:52','2021-01-21 12:10:52'),(8,'86','17810377799','','3996f6fd-b85b-4cd1-b12e-b7acfd888a35','2021-01-22 17:14:29','2021-01-22 17:14:29');
/*!40000 ALTER TABLE `verification_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_violations`
--

DROP TABLE IF EXISTS `verification_violations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verification_violations` (
  `ip` varchar(64) NOT NULL,
  `time` datetime NOT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_violations`
--

LOCK TABLES `verification_violations` WRITE;
/*!40000 ALTER TABLE `verification_violations` DISABLE KEYS */;
INSERT INTO `verification_violations` VALUES ('127.0.0.1','2021-01-22 17:14:29',1);
/*!40000 ALTER TABLE `verification_violations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sealtalk'
--

--
-- Dumping routines for database 'sealtalk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-04 20:23:41
