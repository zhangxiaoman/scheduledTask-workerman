-- MySQL dump 10.13  Distrib 5.7.17, for osx10.12 (x86_64)
--
-- Host: localhost    Database: timer
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `t_alarm`
--

DROP TABLE IF EXISTS `t_alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_alarm` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL COMMENT '任务ID',
  `d_id` int(11) NOT NULL COMMENT '报警人',
  `d_realname` varchar(50) NOT NULL COMMENT '负责人',
  `a_addtime` datetime NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `c_id` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报警日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_alarm`
--

LOCK TABLES `t_alarm` WRITE;
/*!40000 ALTER TABLE `t_alarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron`
--

DROP TABLE IF EXISTS `t_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_title` varchar(255) NOT NULL COMMENT '任务标题',
  `c_type` tinyint(4) NOT NULL COMMENT '任务类型：1 url，2Cli',
  `c_content` varchar(255) NOT NULL COMMENT '执行内容',
  `c_interval` decimal(5,2) NOT NULL COMMENT '间隔执行时间',
  `c_start_time` int(11) NOT NULL COMMENT '任务开始时间',
  `c_end_time` bigint(11) NOT NULL,
  `c_execute_time` int(11) DEFAULT NULL COMMENT '程序执行时间',
  `c_persistent` int(1) NOT NULL DEFAULT '1' COMMENT '1循环执行,2每天执行一次，3只执行一次, 4 crontab',
  `c_crontab_expression` varchar(60) NOT NULL DEFAULT '' COMMENT 'crontab 表达式',
  `c_run_time` datetime DEFAULT NULL COMMENT '开始执行时间',
  `c_stop_time` datetime DEFAULT NULL COMMENT '停止运行时间',
  `c_timer_id` int(11) NOT NULL DEFAULT '0' COMMENT '定时程序ID',
  `c_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1正常，2禁用',
  `c_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '运行状态：1未运行，2运行',
  `c_update_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `c_addtime` datetime NOT NULL COMMENT '添加时间',
  `c_alarm` int(11) NOT NULL DEFAULT '10' COMMENT '每天报警次数',
  `d_id` int(11) NOT NULL COMMENT '程序负责人ID',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='计划任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron`
--

LOCK TABLES `t_cron` WRITE;
/*!40000 ALTER TABLE `t_cron` DISABLE KEYS */;
INSERT INTO `t_cron` VALUES (22,'只执行一次的任务',2,'/user/list/',60.00,1474880400,1474881000,1474880700,3,'','2016-09-26 17:02:58','2016-09-27 17:38:07',0,1,1,'2016-09-26 16:21:42','2016-09-23 14:44:36',10,1001),(23,'循环执行',2,'/user/list',60.00,1511266560,1512045300,NULL,1,'','2017-11-29 11:55:35','2017-11-29 12:00:13',0,1,1,'2017-11-29 11:51:57','2016-09-23 14:45:24',10,1041),(26,'linux crontab test',2,'/user/list',1.00,0,4102329600,NULL,4,'*/2 * * * * *','2017-11-29 11:55:31','2017-11-29 12:00:11',0,1,1,'2017-11-29 11:37:31','2017-11-28 14:38:48',10,1041),(27,'每天执行一次',2,'/user/list',60.00,1511927640,1511949000,1511928000,2,'','2017-11-29 11:55:26','2017-11-29 12:00:08',0,1,1,NULL,'2017-11-29 11:55:09',10,1041);
/*!40000 ALTER TABLE `t_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_0`
--

DROP TABLE IF EXISTS `t_cron_log_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_0` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_0`
--

LOCK TABLES `t_cron_log_0` WRITE;
/*!40000 ALTER TABLE `t_cron_log_0` DISABLE KEYS */;
INSERT INTO `t_cron_log_0` VALUES (1,22,2,'',0.034477,512,1474623607),(2,22,1,'{\"code\":1,\"info\":2}',0.0690389,1000,1474877155),(3,22,1,'{\"code\":1,\"info\":2}',0.0583179,1000,1474880758),(4,22,1,'{\"code\":1,\"info\":2}',0.0733991,1000,1474880759);
/*!40000 ALTER TABLE `t_cron_log_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_1`
--

DROP TABLE IF EXISTS `t_cron_log_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_1` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_1`
--

LOCK TABLES `t_cron_log_1` WRITE;
/*!40000 ALTER TABLE `t_cron_log_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_2`
--

DROP TABLE IF EXISTS `t_cron_log_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_2` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_2`
--

LOCK TABLES `t_cron_log_2` WRITE;
/*!40000 ALTER TABLE `t_cron_log_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_3`
--

DROP TABLE IF EXISTS `t_cron_log_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_3` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_3`
--

LOCK TABLES `t_cron_log_3` WRITE;
/*!40000 ALTER TABLE `t_cron_log_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_4`
--

DROP TABLE IF EXISTS `t_cron_log_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_4` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_4`
--

LOCK TABLES `t_cron_log_4` WRITE;
/*!40000 ALTER TABLE `t_cron_log_4` DISABLE KEYS */;
INSERT INTO `t_cron_log_4` VALUES (1,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.155769,608,1466478939),(2,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.132609,608,1466482539),(3,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.138587,608,1466486140),(4,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.116076,608,1466489740),(5,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.130038,608,1466493340),(6,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.13792,608,1466496940),(7,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.123851,608,1466500540),(8,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.132289,608,1466504140),(9,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.141207,608,1466507740),(10,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.138908,608,1466511340),(11,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.126036,608,1466514940),(12,14,1,'{\"code\":1,\"info\":\"ID: 12,13,14,15,17,18\"}',0.30367,624,1469072976),(13,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.084969,608,1469076576),(14,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.0843151,608,1469082539),(15,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.091238,608,1469086139),(16,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.0809231,608,1469090493),(17,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.100396,608,1469094093),(18,14,1,'{\"code\":1,\"info\":\"No data processing\"}',0.114952,608,1469097693);
/*!40000 ALTER TABLE `t_cron_log_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_5`
--

DROP TABLE IF EXISTS `t_cron_log_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_5` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_5`
--

LOCK TABLES `t_cron_log_5` WRITE;
/*!40000 ALTER TABLE `t_cron_log_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_6`
--

DROP TABLE IF EXISTS `t_cron_log_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_6` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_6`
--

LOCK TABLES `t_cron_log_6` WRITE;
/*!40000 ALTER TABLE `t_cron_log_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_7`
--

DROP TABLE IF EXISTS `t_cron_log_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_7` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_7`
--

LOCK TABLES `t_cron_log_7` WRITE;
/*!40000 ALTER TABLE `t_cron_log_7` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_8`
--

DROP TABLE IF EXISTS `t_cron_log_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_8` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_8`
--

LOCK TABLES `t_cron_log_8` WRITE;
/*!40000 ALTER TABLE `t_cron_log_8` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_9`
--

DROP TABLE IF EXISTS `t_cron_log_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_9` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_9`
--

LOCK TABLES `t_cron_log_9` WRITE;
/*!40000 ALTER TABLE `t_cron_log_9` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_A`
--

DROP TABLE IF EXISTS `t_cron_log_A`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_A` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_A`
--

LOCK TABLES `t_cron_log_A` WRITE;
/*!40000 ALTER TABLE `t_cron_log_A` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_A` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_B`
--

DROP TABLE IF EXISTS `t_cron_log_B`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_B` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_B`
--

LOCK TABLES `t_cron_log_B` WRITE;
/*!40000 ALTER TABLE `t_cron_log_B` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_B` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_C`
--

DROP TABLE IF EXISTS `t_cron_log_C`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_C` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_C`
--

LOCK TABLES `t_cron_log_C` WRITE;
/*!40000 ALTER TABLE `t_cron_log_C` DISABLE KEYS */;
INSERT INTO `t_cron_log_C` VALUES (1,11,1,'{\"code\":1,\"info\":2}',0.052999,544,1461726615);
/*!40000 ALTER TABLE `t_cron_log_C` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_D`
--

DROP TABLE IF EXISTS `t_cron_log_D`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_D` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_D`
--

LOCK TABLES `t_cron_log_D` WRITE;
/*!40000 ALTER TABLE `t_cron_log_D` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_D` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_E`
--

DROP TABLE IF EXISTS `t_cron_log_E`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_E` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_E`
--

LOCK TABLES `t_cron_log_E` WRITE;
/*!40000 ALTER TABLE `t_cron_log_E` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_E` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_F`
--

DROP TABLE IF EXISTS `t_cron_log_F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_F` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_F`
--

LOCK TABLES `t_cron_log_F` WRITE;
/*!40000 ALTER TABLE `t_cron_log_F` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_F` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_G`
--

DROP TABLE IF EXISTS `t_cron_log_G`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_G` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1226 DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_G`
--

LOCK TABLES `t_cron_log_G` WRITE;
/*!40000 ALTER TABLE `t_cron_log_G` DISABLE KEYS */;
INSERT INTO `t_cron_log_G` VALUES (1,23,1,'{\"code\":1,\"info\":2}',0.0916228,1056,1511267380),(2,23,1,'{\"code\":1,\"info\":2}',0.0429029,1056,1511267440),(3,23,1,'{\"code\":1,\"info\":2}',0.0584888,1056,1511267500),(4,23,1,'{\"code\":1,\"info\":2}',0.0796559,1056,1511267560),(5,23,1,'{\"code\":1,\"info\":2}',0.0712111,1056,1511267620),(6,23,1,'{\"code\":1,\"info\":2}',0.057162,1056,1511267680),(7,23,1,'{\"code\":1,\"info\":2}',0.119727,1056,1511267740),(8,23,1,'{\"code\":1,\"info\":2}',0.0725322,1056,1511267800),(9,23,1,'{\"code\":1,\"info\":2}',0.0458419,1056,1511267860),(10,23,1,'{\"code\":1,\"info\":2}',0.0455561,1056,1511267920),(11,23,1,'{\"code\":1,\"info\":2}',0.0604451,1056,1511267980),(12,23,1,'{\"code\":1,\"info\":2}',0.118039,1056,1511268040),(13,23,1,'{\"code\":1,\"info\":2}',0.0676379,1056,1511268100),(14,23,1,'{\"code\":1,\"info\":2}',0.0966079,1056,1511268160),(15,23,1,'{\"code\":1,\"info\":2}',0.0393369,1056,1511268220),(16,23,1,'{\"code\":1,\"info\":2}',0.0725889,1056,1511268280),(17,23,1,'{\"code\":1,\"info\":2}',0.0595791,1056,1511268340),(18,23,1,'{\"code\":1,\"info\":2}',0.039489,1056,1511268400),(19,23,1,'{\"code\":1,\"info\":2}',0.0361149,1056,1511268460),(20,23,1,'{\"code\":1,\"info\":2}',0.040375,1056,1511268520),(21,23,1,'{\"code\":1,\"info\":2}',0.0413542,1056,1511268580),(22,23,1,'{\"code\":1,\"info\":2}',0.0417452,1056,1511268640),(23,23,1,'{\"code\":1,\"info\":2}',0.0413561,1056,1511268700),(24,23,1,'{\"code\":1,\"info\":2}',0.041358,1056,1511268760),(25,23,1,'{\"code\":1,\"info\":2}',0.0365961,1056,1511268820),(26,23,1,'{\"code\":1,\"info\":2}',0.0424161,1056,1511268880),(27,23,1,'{\"code\":1,\"info\":2}',0.0592961,1056,1511268940),(28,23,1,'{\"code\":1,\"info\":2}',0.0407679,1056,1511269000),(29,23,1,'{\"code\":1,\"info\":2}',0.041667,1056,1511269060),(30,23,1,'{\"code\":1,\"info\":2}',0.0442722,1056,1511269120),(31,23,1,'{\"code\":1,\"info\":2}',0.042372,1056,1511269180),(32,23,1,'{\"code\":1,\"info\":2}',0.041491,1056,1511269240),(33,23,1,'{\"code\":1,\"info\":2}',0.0497961,1056,1511269300),(34,23,1,'{\"code\":1,\"info\":2}',0.040417,1056,1511269360),(35,23,1,'{\"code\":1,\"info\":2}',0.056169,1056,1511269420),(36,23,1,'{\"code\":1,\"info\":2}',0.0447831,1056,1511269480),(37,23,1,'{\"code\":1,\"info\":2}',0.0594521,1056,1511269540),(38,23,1,'{\"code\":1,\"info\":2}',0.040524,1056,1511269600),(39,23,1,'{\"code\":1,\"info\":2}',0.0401311,1056,1511269660),(40,23,1,'{\"code\":1,\"info\":2}',0.0413001,1056,1511269720),(41,23,1,'{\"code\":1,\"info\":2}',0.0423241,1056,1511269780),(42,23,1,'{\"code\":1,\"info\":2}',0.061723,1056,1511269840),(43,23,1,'{\"code\":1,\"info\":2}',0.065989,1056,1511269900),(44,23,1,'{\"code\":1,\"info\":2}',0.438114,1056,1511269973),(45,23,1,'{\"code\":1,\"info\":2}',0.0737622,1056,1511272279),(46,23,1,'{\"code\":1,\"info\":2}',0.0713239,1056,1511272339),(47,23,1,'{\"code\":1,\"info\":2}',0.0654559,1056,1511272399),(48,23,1,'{\"code\":1,\"info\":2}',0.236053,1056,1511272459),(49,23,1,'{\"code\":1,\"info\":2}',0.0564399,1056,1511272519),(50,23,1,'{\"code\":1,\"info\":2}',0.0613601,1056,1511272579),(51,23,1,'{\"code\":1,\"info\":2}',0.0752652,1056,1511272639),(52,23,1,'{\"code\":1,\"info\":2}',0.148501,1056,1511272699),(53,23,1,'{\"code\":1,\"info\":2}',0.043299,1056,1511272759),(54,23,1,'{\"code\":1,\"info\":2}',0.069731,1056,1511272819),(55,23,1,'{\"code\":1,\"info\":2}',0.0720899,1056,1511272879),(56,23,1,'{\"code\":1,\"info\":2}',0.06089,1056,1511272939),(57,23,1,'{\"code\":1,\"info\":2}',0.0844488,1056,1511272999),(58,23,1,'{\"code\":1,\"info\":2}',0.061832,1056,1511273059),(59,23,1,'{\"code\":1,\"info\":2}',0.103968,1056,1511273119),(60,23,1,'{\"code\":1,\"info\":2}',0.125429,1056,1511273179),(61,23,1,'{\"code\":1,\"info\":2}',0.148828,1056,1511273239),(62,23,1,'{\"code\":1,\"info\":2}',0.253678,1056,1511273299),(63,23,1,'{\"code\":1,\"info\":2}',0.0664561,1056,1511273359),(64,23,1,'{\"code\":1,\"info\":2}',0.076509,1056,1511273419),(65,23,1,'{\"code\":1,\"info\":2}',0.0436881,1056,1511273479),(66,23,1,'{\"code\":1,\"info\":2}',0.0398402,1056,1511273539),(67,23,1,'{\"code\":1,\"info\":2}',0.0404091,1056,1511273599),(68,23,1,'{\"code\":1,\"info\":2}',0.04339,1056,1511273659),(69,23,1,'{\"code\":1,\"info\":2}',0.0437291,1056,1511273719),(70,23,1,'{\"code\":1,\"info\":2}',0.0448339,1056,1511273779),(71,23,1,'{\"code\":1,\"info\":2}',0.0859151,1056,1511273839),(72,23,1,'{\"code\":1,\"info\":2}',0.0420179,1056,1511273899),(73,23,1,'{\"code\":1,\"info\":2}',0.0421491,1056,1511273959),(74,23,1,'{\"code\":1,\"info\":2}',0.0382631,1056,1511274019),(75,23,1,'{\"code\":1,\"info\":2}',0.0569301,1056,1511274079),(76,23,1,'{\"code\":1,\"info\":2}',0.0614591,1056,1511274139),(77,23,1,'{\"code\":1,\"info\":2}',0.0725009,1056,1511274199),(78,23,1,'{\"code\":1,\"info\":2}',0.0429261,1056,1511274259),(79,23,1,'{\"code\":1,\"info\":2}',0.0628068,1056,1511274319),(80,23,1,'{\"code\":1,\"info\":2}',0.306196,1056,1511274379),(81,23,1,'{\"code\":1,\"info\":2}',0.314599,1056,1511274439),(82,23,1,'{\"code\":1,\"info\":2}',0.175273,1056,1511274499),(83,23,1,'{\"code\":1,\"info\":2}',0.0827711,1056,1511274559),(84,23,1,'{\"code\":1,\"info\":2}',0.345021,1056,1511274619),(85,23,1,'{\"code\":1,\"info\":2}',0.172528,1056,1511274679),(86,23,1,'{\"code\":1,\"info\":2}',0.138827,1056,1511274739),(87,23,1,'{\"code\":1,\"info\":2}',0.0718942,1056,1511274799),(88,23,1,'{\"code\":1,\"info\":2}',0.04285,1056,1511274859),(89,23,1,'{\"code\":1,\"info\":2}',0.042341,1056,1511274919),(90,23,1,'{\"code\":1,\"info\":2}',0.042515,1056,1511274979),(91,23,1,'{\"code\":1,\"info\":2}',0.0427539,1056,1511275039),(92,23,1,'{\"code\":1,\"info\":2}',0.0624249,1056,1511275099),(93,23,1,'{\"code\":1,\"info\":2}',0.181752,1056,1511275159),(94,23,1,'{\"code\":1,\"info\":2}',0.111835,1056,1511275219),(95,23,1,'{\"code\":1,\"info\":2}',0.071507,1056,1511275279),(96,23,1,'{\"code\":1,\"info\":2}',0.065213,1056,1511275339),(97,23,1,'{\"code\":1,\"info\":2}',0.0573621,1056,1511275399),(98,23,1,'{\"code\":1,\"info\":2}',0.0403221,1056,1511275459),(99,23,1,'{\"code\":1,\"info\":2}',0.0468762,1056,1511275519),(100,23,1,'{\"code\":1,\"info\":2}',0.0744209,1056,1511275579),(101,23,1,'{\"code\":1,\"info\":2}',0.055351,1056,1511275639),(102,23,1,'{\"code\":1,\"info\":2}',0.065289,1056,1511275699),(103,23,1,'{\"code\":1,\"info\":2}',0.0407469,1056,1511275759),(104,23,1,'{\"code\":1,\"info\":2}',0.0402882,1056,1511275819),(105,23,1,'{\"code\":1,\"info\":2}',0.0423059,1056,1511275879),(106,23,1,'{\"code\":1,\"info\":2}',0.0430899,1056,1511275939),(107,23,1,'{\"code\":1,\"info\":2}',0.0440221,1056,1511275999),(108,23,1,'{\"code\":1,\"info\":2}',0.0450008,1056,1511276059),(109,23,1,'{\"code\":1,\"info\":2}',0.0408731,1056,1511276119),(110,23,1,'{\"code\":1,\"info\":2}',0.0420899,1056,1511276179),(111,23,1,'{\"code\":1,\"info\":2}',0.0426371,1056,1511276239),(112,23,1,'{\"code\":1,\"info\":2}',0.042244,1056,1511276299),(113,23,1,'{\"code\":1,\"info\":2}',0.0403371,1056,1511276359),(114,23,1,'{\"code\":1,\"info\":2}',0.0419731,1056,1511276419),(115,23,1,'{\"code\":1,\"info\":2}',0.261293,1056,1511277678),(116,23,1,'{\"code\":1,\"info\":2}',0.0470841,1056,1511278630),(117,23,1,'{\"code\":1,\"info\":2}',0.282854,1056,1511279938),(118,23,1,'{\"code\":1,\"info\":2}',0.117659,1056,1511281112),(119,23,1,'{\"code\":1,\"info\":2}',0.0887818,1056,1511281729),(120,23,1,'{\"code\":1,\"info\":2}',2.2944,1056,1511282920),(121,23,1,'{\"code\":1,\"info\":2}',0.680833,1056,1511283538),(122,23,1,'{\"code\":1,\"info\":2}',0.495137,1056,1511284159),(123,23,1,'{\"code\":1,\"info\":2}',0.860776,1056,1511285342),(124,23,1,'{\"code\":1,\"info\":2}',0.267957,1056,1511285963),(125,23,1,'{\"code\":1,\"info\":2}',0.8755,1056,1511287144),(126,23,1,'{\"code\":1,\"info\":2}',0.30481,1056,1511287764),(127,23,1,'{\"code\":1,\"info\":2}',0.305501,1056,1511288386),(128,23,1,'{\"code\":1,\"info\":2}',0.549801,1056,1511296187),(129,23,1,'{\"code\":1,\"info\":2}',0.293706,1056,1511296807),(130,23,1,'{\"code\":1,\"info\":2}',0.78798,1056,1511297989),(131,23,1,'{\"code\":1,\"info\":2}',0.288998,1056,1511298609),(132,23,1,'{\"code\":1,\"info\":2}',0.263995,1056,1511299790),(133,23,1,'{\"code\":1,\"info\":2}',0.342031,1056,1511300412),(134,23,1,'{\"code\":1,\"info\":2}',0.447422,1056,1511301593),(135,23,1,'{\"code\":1,\"info\":2}',0.248342,1056,1511302213),(136,23,1,'{\"code\":1,\"info\":2}',1.18562,1056,1511303396),(137,23,1,'{\"code\":1,\"info\":2}',0.422938,1056,1511304017),(138,23,1,'{\"code\":1,\"info\":2}',565.79,1056,1511305203),(139,23,1,'{\"code\":1,\"info\":2}',0.080229,1056,1511305203),(140,23,1,'{\"code\":1,\"info\":2}',0.429465,1056,1511305824),(141,23,1,'{\"code\":1,\"info\":2}',1.47958,1056,1511307010),(142,23,1,'{\"code\":1,\"info\":2}',0.232282,1056,1511307630),(143,23,1,'{\"code\":1,\"info\":2}',0.329468,1056,1511313827),(144,23,1,'{\"code\":1,\"info\":2}',0.0382829,1056,1511315000),(145,23,1,'{\"code\":1,\"info\":2}',0.034831,1056,1511315617),(146,23,1,'{\"code\":1,\"info\":2}',0.25366,1056,1511316964),(147,23,1,'{\"code\":1,\"info\":2}',0.0364079,1056,1511317036),(148,23,1,'{\"code\":1,\"info\":2}',0.246046,1056,1511317122),(149,23,1,'{\"code\":1,\"info\":2}',0.118953,1056,1511318480),(150,23,1,'{\"code\":1,\"info\":2}',0.0817649,1056,1511318539),(151,23,1,'{\"code\":1,\"info\":2}',0.0794101,1056,1511318599),(152,23,1,'{\"code\":1,\"info\":2}',0.0940499,1056,1511318660),(153,23,1,'{\"code\":1,\"info\":2}',0.07675,1056,1511318719),(154,23,1,'{\"code\":1,\"info\":2}',0.0811939,1056,1511318779),(155,23,1,'{\"code\":1,\"info\":2}',0.181543,1056,1511318840),(156,23,1,'{\"code\":1,\"info\":2}',0.105627,1056,1511318900),(157,23,1,'{\"code\":1,\"info\":2}',0.047205,1056,1511318959),(158,23,1,'{\"code\":1,\"info\":2}',0.039006,1056,1511319019),(159,23,1,'{\"code\":1,\"info\":2}',0.111018,1056,1511319080),(160,23,1,'{\"code\":1,\"info\":2}',0.0433419,1056,1511319139),(161,23,1,'{\"code\":1,\"info\":2}',0.0397971,1056,1511319199),(162,23,1,'{\"code\":1,\"info\":2}',0.042768,1056,1511319259),(163,23,1,'{\"code\":1,\"info\":2}',0.046473,1056,1511319319),(164,23,1,'{\"code\":1,\"info\":2}',0.0502341,1056,1511319379),(165,23,1,'{\"code\":1,\"info\":2}',0.054836,1056,1511319439),(166,23,1,'{\"code\":1,\"info\":2}',0.03895,1056,1511319499),(167,23,1,'{\"code\":1,\"info\":2}',0.099946,1056,1511319560),(168,23,1,'{\"code\":1,\"info\":2}',0.0441999,1056,1511319619),(169,23,1,'{\"code\":1,\"info\":2}',0.0389211,1056,1511319679),(170,23,1,'{\"code\":1,\"info\":2}',0.039705,1056,1511319739),(171,23,1,'{\"code\":1,\"info\":2}',0.0400469,1056,1511319799),(172,23,1,'{\"code\":1,\"info\":2}',0.0414989,1056,1511319859),(173,23,1,'{\"code\":1,\"info\":2}',0.040612,1056,1511319919),(174,23,1,'{\"code\":1,\"info\":2}',0.09709,1056,1511319980),(175,23,1,'{\"code\":1,\"info\":2}',0.0823951,1056,1511320040),(176,23,1,'{\"code\":1,\"info\":2}',0.186958,1056,1511320100),(177,23,1,'{\"code\":1,\"info\":2}',0.09953,1056,1511320160),(178,23,1,'{\"code\":1,\"info\":2}',0.070617,1056,1511320220),(179,23,1,'{\"code\":1,\"info\":2}',0.111538,1056,1511320280),(180,23,1,'{\"code\":1,\"info\":2}',0.0723689,1056,1511320340),(181,23,1,'{\"code\":1,\"info\":2}',0.0793989,1056,1511320400),(182,23,1,'{\"code\":1,\"info\":2}',0.0425999,1056,1511320459),(183,23,1,'{\"code\":1,\"info\":2}',0.0401268,1056,1511320519),(184,23,1,'{\"code\":1,\"info\":2}',0.0407488,1056,1511320579),(185,23,1,'{\"code\":1,\"info\":2}',0.0403159,1056,1511320639),(186,23,1,'{\"code\":1,\"info\":2}',0.040813,1056,1511320699),(187,23,1,'{\"code\":1,\"info\":2}',0.039974,1056,1511320760),(188,23,1,'{\"code\":1,\"info\":2}',0.0399749,1056,1511320820),(189,23,1,'{\"code\":1,\"info\":2}',0.040524,1056,1511320880),(190,23,1,'{\"code\":1,\"info\":2}',0.040802,1056,1511320940),(191,23,1,'{\"code\":1,\"info\":2}',0.106154,1056,1511321000),(192,23,1,'{\"code\":1,\"info\":2}',0.039798,1056,1511321060),(193,23,1,'{\"code\":1,\"info\":2}',0.082577,1056,1511321120),(194,23,1,'{\"code\":1,\"info\":2}',0.0763111,1056,1511321180),(195,23,1,'{\"code\":1,\"info\":2}',0.059871,1056,1511321240),(196,23,1,'{\"code\":1,\"info\":2}',0.0759411,1056,1511321300),(197,23,1,'{\"code\":1,\"info\":2}',0.037591,1056,1511321360),(198,23,1,'{\"code\":1,\"info\":2}',0.061749,1056,1511321420),(199,23,1,'{\"code\":1,\"info\":2}',0.0461521,1056,1511321480),(200,23,1,'{\"code\":1,\"info\":2}',0.108197,1056,1511321540),(201,23,1,'{\"code\":1,\"info\":2}',0.077117,1056,1511321600),(202,23,1,'{\"code\":1,\"info\":2}',0.0664561,1056,1511321660),(203,23,1,'{\"code\":1,\"info\":2}',0.0912578,1056,1511321720),(204,23,1,'{\"code\":1,\"info\":2}',0.089313,1056,1511321780),(205,23,1,'{\"code\":1,\"info\":2}',0.081805,1056,1511321840),(206,23,1,'{\"code\":1,\"info\":2}',0.0471771,1056,1511321900),(207,23,1,'{\"code\":1,\"info\":2}',0.0936859,1056,1511321960),(208,23,1,'{\"code\":1,\"info\":2}',0.0887949,1056,1511322020),(209,23,1,'{\"code\":1,\"info\":2}',0.0431929,1056,1511322080),(210,23,1,'{\"code\":1,\"info\":2}',0.039932,1056,1511322140),(211,23,1,'{\"code\":1,\"info\":2}',0.040415,1056,1511322200),(212,23,1,'{\"code\":1,\"info\":2}',0.0650508,1056,1511322260),(213,23,1,'{\"code\":1,\"info\":2}',0.0962088,1056,1511322320),(214,23,1,'{\"code\":1,\"info\":2}',0.130265,1056,1511322380),(215,23,1,'{\"code\":1,\"info\":2}',0.079231,1056,1511322440),(216,23,1,'{\"code\":1,\"info\":2}',0.047507,1056,1511322500),(217,23,1,'{\"code\":1,\"info\":2}',0.0385721,1056,1511322560),(218,23,1,'{\"code\":1,\"info\":2}',0.088341,1056,1511322620),(219,23,1,'{\"code\":1,\"info\":2}',0.0404239,1056,1511322680),(220,23,1,'{\"code\":1,\"info\":2}',0.0832021,1056,1511322740),(221,23,1,'{\"code\":1,\"info\":2}',0.0440471,1056,1511322800),(222,23,1,'{\"code\":1,\"info\":2}',0.041491,1056,1511322860),(223,23,1,'{\"code\":1,\"info\":2}',0.081094,1056,1511322920),(224,23,1,'{\"code\":1,\"info\":2}',0.0385771,1056,1511322980),(225,23,1,'{\"code\":1,\"info\":2}',0.110272,1056,1511323040),(226,23,1,'{\"code\":1,\"info\":2}',0.0827372,1056,1511323100),(227,23,1,'{\"code\":1,\"info\":2}',0.0427339,1056,1511323160),(228,23,1,'{\"code\":1,\"info\":2}',0.041029,1056,1511323220),(229,23,1,'{\"code\":1,\"info\":2}',0.0415442,1056,1511323280),(230,23,1,'{\"code\":1,\"info\":2}',0.0412149,1056,1511323340),(231,23,1,'{\"code\":1,\"info\":2}',0.0533049,1056,1511323400),(232,23,1,'{\"code\":1,\"info\":2}',0.0433838,1056,1511323460),(233,23,1,'{\"code\":1,\"info\":2}',0.0373571,1056,1511323520),(234,23,1,'{\"code\":1,\"info\":2}',0.0454469,1056,1511323580),(235,23,1,'{\"code\":1,\"info\":2}',0.0686979,1056,1511323640),(236,23,1,'{\"code\":1,\"info\":2}',0.08078,1056,1511323700),(237,23,1,'{\"code\":1,\"info\":2}',0.090338,1056,1511323760),(238,23,1,'{\"code\":1,\"info\":2}',0.106235,1056,1511323820),(239,23,1,'{\"code\":1,\"info\":2}',0.092859,1056,1511323880),(240,23,1,'{\"code\":1,\"info\":2}',0.0722151,1056,1511323940),(241,23,1,'{\"code\":1,\"info\":2}',0.0472481,1056,1511324000),(242,23,1,'{\"code\":1,\"info\":2}',0.0828021,1056,1511324060),(243,23,1,'{\"code\":1,\"info\":2}',0.054431,1056,1511324120),(244,23,1,'{\"code\":1,\"info\":2}',0.057888,1056,1511324180),(245,23,1,'{\"code\":1,\"info\":2}',0.0473979,1056,1511324240),(246,23,1,'{\"code\":1,\"info\":2}',0.047442,1056,1511324300),(247,23,1,'{\"code\":1,\"info\":2}',0.0861919,1056,1511324360),(248,23,1,'{\"code\":1,\"info\":2}',0.042551,1056,1511324420),(249,23,1,'{\"code\":1,\"info\":2}',0.0440309,1056,1511324480),(250,23,1,'{\"code\":1,\"info\":2}',0.120959,1056,1511324540),(251,23,1,'{\"code\":1,\"info\":2}',0.194003,1056,1511324600),(252,23,1,'{\"code\":1,\"info\":2}',0.0475299,1056,1511324660),(253,23,1,'{\"code\":1,\"info\":2}',0.0358691,1056,1511324720),(254,23,1,'{\"code\":1,\"info\":2}',0.0486979,1056,1511324780),(255,23,1,'{\"code\":1,\"info\":2}',0.130339,1056,1511324840),(256,23,1,'{\"code\":1,\"info\":2}',0.0726359,1056,1511324900),(257,23,1,'{\"code\":1,\"info\":2}',0.0418971,1056,1511324960),(258,23,1,'{\"code\":1,\"info\":2}',0.063803,1056,1511325020),(259,23,1,'{\"code\":1,\"info\":2}',0.0436909,1056,1511325080),(260,23,1,'{\"code\":1,\"info\":2}',0.0939019,1056,1511325140),(261,23,1,'{\"code\":1,\"info\":2}',0.0866611,1056,1511325200),(262,23,1,'{\"code\":1,\"info\":2}',0.11519,1056,1511325260),(263,23,1,'{\"code\":1,\"info\":2}',0.112407,1056,1511325320),(264,23,1,'{\"code\":1,\"info\":2}',0.267047,1056,1511325380),(265,23,1,'{\"code\":1,\"info\":2}',0.0435331,1056,1511325440),(266,23,1,'{\"code\":1,\"info\":2}',0.0469499,1056,1511325500),(267,23,1,'{\"code\":1,\"info\":2}',0.0419898,1056,1511325560),(268,23,1,'{\"code\":1,\"info\":2}',0.0468652,1056,1511325620),(269,23,1,'{\"code\":1,\"info\":2}',0.042064,1056,1511325680),(270,23,1,'{\"code\":1,\"info\":2}',0.118672,1056,1511325740),(271,23,1,'{\"code\":1,\"info\":2}',0.0863869,1056,1511325800),(272,23,1,'{\"code\":1,\"info\":2}',0.0781889,1056,1511325860),(273,23,1,'{\"code\":1,\"info\":2}',0.0421169,1056,1511325920),(274,23,1,'{\"code\":1,\"info\":2}',0.043525,1056,1511325980),(275,23,1,'{\"code\":1,\"info\":2}',0.0428309,1056,1511326040),(276,23,1,'{\"code\":1,\"info\":2}',0.0417261,1056,1511326100),(277,23,1,'{\"code\":1,\"info\":2}',0.0413721,1056,1511326160),(278,23,1,'{\"code\":1,\"info\":2}',0.0422511,1056,1511326220),(279,23,1,'{\"code\":1,\"info\":2}',0.0437832,1056,1511326280),(280,23,1,'{\"code\":1,\"info\":2}',0.0422251,1056,1511326340),(281,23,1,'{\"code\":1,\"info\":2}',0.0407531,1056,1511326400),(282,23,1,'{\"code\":1,\"info\":2}',0.0789349,1056,1511326460),(283,23,1,'{\"code\":1,\"info\":2}',0.0789909,1056,1511326520),(284,23,1,'{\"code\":1,\"info\":2}',0.0386851,1056,1511326580),(285,23,1,'{\"code\":1,\"info\":2}',0.0845699,1056,1511326640),(286,23,1,'{\"code\":1,\"info\":2}',0.079221,1056,1511326700),(287,23,1,'{\"code\":1,\"info\":2}',0.0495579,1056,1511326760),(288,23,1,'{\"code\":1,\"info\":2}',0.097451,1056,1511326820),(289,23,1,'{\"code\":1,\"info\":2}',0.123561,1056,1511326880),(290,23,1,'{\"code\":1,\"info\":2}',0.0651541,1056,1511326940),(291,23,1,'{\"code\":1,\"info\":2}',0.0411189,1056,1511327000),(292,23,1,'{\"code\":1,\"info\":2}',0.0416901,1056,1511327060),(293,23,1,'{\"code\":1,\"info\":2}',0.040247,1056,1511327120),(294,23,1,'{\"code\":1,\"info\":2}',0.0391769,1056,1511327180),(295,23,1,'{\"code\":1,\"info\":2}',0.0787411,1056,1511327240),(296,23,1,'{\"code\":1,\"info\":2}',0.0698628,1056,1511327300),(297,23,1,'{\"code\":1,\"info\":2}',0.040415,1056,1511327360),(298,23,1,'{\"code\":1,\"info\":2}',0.043,1056,1511327420),(299,23,1,'{\"code\":1,\"info\":2}',0.0908699,1056,1511327480),(300,23,1,'{\"code\":1,\"info\":2}',0.280806,1056,1511327540),(301,23,1,'{\"code\":1,\"info\":2}',0.040621,1056,1511327600),(302,23,1,'{\"code\":1,\"info\":2}',0.057245,1056,1511327660),(303,23,1,'{\"code\":1,\"info\":2}',0.0406919,1056,1511327720),(304,23,1,'{\"code\":1,\"info\":2}',0.076941,1056,1511327780),(305,23,1,'{\"code\":1,\"info\":2}',0.085907,1056,1511327840),(306,23,1,'{\"code\":1,\"info\":2}',0.040663,1056,1511327900),(307,23,1,'{\"code\":1,\"info\":2}',0.0414281,1056,1511327960),(308,23,1,'{\"code\":1,\"info\":2}',0.047823,1056,1511328020),(309,23,1,'{\"code\":1,\"info\":2}',0.080694,1056,1511328080),(310,23,1,'{\"code\":1,\"info\":2}',0.0418181,1056,1511328140),(311,23,1,'{\"code\":1,\"info\":2}',0.066782,1056,1511328200),(312,23,1,'{\"code\":1,\"info\":2}',0.0410318,1056,1511328260),(313,23,1,'{\"code\":1,\"info\":2}',0.042496,1056,1511328320),(314,23,1,'{\"code\":1,\"info\":2}',0.065619,1056,1511328380),(315,23,1,'{\"code\":1,\"info\":2}',0.0422211,1056,1511328440),(316,23,1,'{\"code\":1,\"info\":2}',0.042321,1056,1511328500),(317,23,1,'{\"code\":1,\"info\":2}',0.0396001,1056,1511328560),(318,23,1,'{\"code\":1,\"info\":2}',0.0405509,1056,1511328620),(319,23,1,'{\"code\":1,\"info\":2}',0.080188,1056,1511328680),(320,23,1,'{\"code\":1,\"info\":2}',0.0638101,1056,1511328740),(321,23,1,'{\"code\":1,\"info\":2}',0.0719681,1056,1511328800),(322,23,1,'{\"code\":1,\"info\":2}',0.040931,1056,1511328860),(323,23,1,'{\"code\":1,\"info\":2}',0.0405931,1056,1511328920),(324,23,1,'{\"code\":1,\"info\":2}',0.094878,1056,1511328980),(325,23,1,'{\"code\":1,\"info\":2}',0.101033,1056,1511329040),(326,23,1,'{\"code\":1,\"info\":2}',0.142304,1056,1511329100),(327,23,1,'{\"code\":1,\"info\":2}',0.295547,1056,1511329160),(328,23,1,'{\"code\":1,\"info\":2}',0.06934,1056,1511329220),(329,23,1,'{\"code\":1,\"info\":2}',0.0928812,1056,1511329280),(330,23,1,'{\"code\":1,\"info\":2}',0.0931458,1056,1511329340),(331,23,1,'{\"code\":1,\"info\":2}',0.109702,1056,1511329400),(332,23,1,'{\"code\":1,\"info\":2}',0.0779421,1056,1511329460),(333,23,1,'{\"code\":1,\"info\":2}',0.178117,1056,1511329520),(334,23,1,'{\"code\":1,\"info\":2}',0.0412831,1056,1511329580),(335,23,1,'{\"code\":1,\"info\":2}',0.041281,1056,1511329640),(336,23,1,'{\"code\":1,\"info\":2}',0.0426979,1056,1511329700),(337,23,1,'{\"code\":1,\"info\":2}',0.0411608,1056,1511329760),(338,23,1,'{\"code\":1,\"info\":2}',0.0409119,1056,1511329820),(339,23,1,'{\"code\":1,\"info\":2}',0.0415778,1056,1511329880),(340,23,1,'{\"code\":1,\"info\":2}',0.0625439,1056,1511329940),(341,23,1,'{\"code\":1,\"info\":2}',0.0418901,1056,1511330000),(342,23,1,'{\"code\":1,\"info\":2}',0.0417681,1056,1511330060),(343,23,1,'{\"code\":1,\"info\":2}',0.0470998,1056,1511330120),(344,23,1,'{\"code\":1,\"info\":2}',0.041209,1056,1511330180),(345,23,1,'{\"code\":1,\"info\":2}',0.0392551,1056,1511330240),(346,23,1,'{\"code\":1,\"info\":2}',0.041821,1056,1511330300),(347,23,1,'{\"code\":1,\"info\":2}',0.040936,1056,1511330360),(348,23,1,'{\"code\":1,\"info\":2}',0.040765,1056,1511330420),(349,23,1,'{\"code\":1,\"info\":2}',0.080399,1056,1511330480),(350,23,1,'{\"code\":1,\"info\":2}',0.0897551,1056,1511330540),(351,23,1,'{\"code\":1,\"info\":2}',0.041877,1056,1511330600),(352,23,1,'{\"code\":1,\"info\":2}',0.0403969,1056,1511330660),(353,23,1,'{\"code\":1,\"info\":2}',0.255065,1056,1511330720),(354,23,1,'{\"code\":1,\"info\":2}',0.039984,1056,1511330780),(355,23,1,'{\"code\":1,\"info\":2}',0.0817661,1056,1511330840),(356,23,1,'{\"code\":1,\"info\":2}',0.0974259,1056,1511330900),(357,23,1,'{\"code\":1,\"info\":2}',0.111055,1056,1511330960),(358,23,1,'{\"code\":1,\"info\":2}',0.08604,1056,1511331020),(359,23,1,'{\"code\":1,\"info\":2}',0.098253,1056,1511331080),(360,23,1,'{\"code\":1,\"info\":2}',0.0893111,1056,1511331140),(361,23,1,'{\"code\":1,\"info\":2}',0.160793,1056,1511331200),(362,23,1,'{\"code\":1,\"info\":2}',0.087683,1056,1511331260),(363,23,1,'{\"code\":1,\"info\":2}',0.116891,1056,1511331320),(364,23,1,'{\"code\":1,\"info\":2}',0.117856,1056,1511331380),(365,23,1,'{\"code\":1,\"info\":2}',0.042753,1056,1511331440),(366,23,1,'{\"code\":1,\"info\":2}',0.094836,1056,1511331500),(367,23,1,'{\"code\":1,\"info\":2}',0.0482321,1056,1511331560),(368,23,1,'{\"code\":1,\"info\":2}',0.0693281,1056,1511331620),(369,23,1,'{\"code\":1,\"info\":2}',0.0472732,1056,1511331680),(370,23,1,'{\"code\":1,\"info\":2}',0.085763,1056,1511331740),(371,23,1,'{\"code\":1,\"info\":2}',0.214305,1056,1511331800),(372,23,1,'{\"code\":1,\"info\":2}',0.0497909,1056,1511331860),(373,23,1,'{\"code\":1,\"info\":2}',0.046576,1056,1511331920),(374,23,1,'{\"code\":1,\"info\":2}',0.0953159,1056,1511331980),(375,23,1,'{\"code\":1,\"info\":2}',0.0791531,1056,1511332040),(376,23,1,'{\"code\":1,\"info\":2}',0.0727751,1056,1511332100),(377,23,1,'{\"code\":1,\"info\":2}',0.283339,1056,1511332160),(378,23,1,'{\"code\":1,\"info\":2}',0.339114,1056,1511332220),(379,23,1,'{\"code\":1,\"info\":2}',0.11643,1056,1511332280),(380,23,1,'{\"code\":1,\"info\":2}',0.0402031,1056,1511332340),(381,23,1,'{\"code\":1,\"info\":2}',0.04039,1056,1511332400),(382,23,1,'{\"code\":1,\"info\":2}',0.0762401,1056,1511332460),(383,23,1,'{\"code\":1,\"info\":2}',0.125462,1056,1511332520),(384,23,1,'{\"code\":1,\"info\":2}',0.0653012,1056,1511332580),(385,23,1,'{\"code\":1,\"info\":2}',0.046072,1056,1511332640),(386,23,1,'{\"code\":1,\"info\":2}',0.107668,1056,1511332700),(387,23,1,'{\"code\":1,\"info\":2}',0.0469201,1056,1511332760),(388,23,1,'{\"code\":1,\"info\":2}',0.039412,1056,1511332820),(389,23,1,'{\"code\":1,\"info\":2}',0.077143,1056,1511332880),(390,23,1,'{\"code\":1,\"info\":2}',0.060823,1056,1511332940),(391,23,1,'{\"code\":1,\"info\":2}',0.0863819,1056,1511333000),(392,23,1,'{\"code\":1,\"info\":2}',0.116212,1056,1511333060),(393,23,1,'{\"code\":1,\"info\":2}',0.073679,1056,1511333120),(394,23,1,'{\"code\":1,\"info\":2}',0.058291,1056,1511333180),(395,23,1,'{\"code\":1,\"info\":2}',0.0654402,1056,1511333240),(396,23,1,'{\"code\":1,\"info\":2}',0.0839372,1056,1511333300),(397,23,1,'{\"code\":1,\"info\":2}',0.0766759,1056,1511333360),(398,23,1,'{\"code\":1,\"info\":2}',0.098762,1056,1511333420),(399,23,1,'{\"code\":1,\"info\":2}',0.0646899,1056,1511333480),(400,23,1,'{\"code\":1,\"info\":2}',0.091378,1056,1511333540),(401,23,1,'{\"code\":1,\"info\":2}',0.0828111,1056,1511333600),(402,23,1,'{\"code\":1,\"info\":2}',0.088053,1056,1511333660),(403,23,1,'{\"code\":1,\"info\":2}',0.0643489,1056,1511333720),(404,23,1,'{\"code\":1,\"info\":2}',0.122116,1056,1511333780),(405,23,1,'{\"code\":1,\"info\":2}',0.108472,1056,1511333840),(406,23,1,'{\"code\":1,\"info\":2}',0.077708,1056,1511333900),(407,23,1,'{\"code\":1,\"info\":2}',0.0873539,1056,1511333960),(408,23,1,'{\"code\":1,\"info\":2}',0.0917571,1056,1511334020),(409,23,1,'{\"code\":1,\"info\":2}',0.0842092,1056,1511334080),(410,23,1,'{\"code\":1,\"info\":2}',0.0702751,1056,1511334140),(411,23,1,'{\"code\":1,\"info\":2}',0.050468,1056,1511334200),(412,23,1,'{\"code\":1,\"info\":2}',0.102407,1056,1511334260),(413,23,1,'{\"code\":1,\"info\":2}',0.064482,1056,1511334320),(414,23,1,'{\"code\":1,\"info\":2}',0.0401502,1056,1511334380),(415,23,1,'{\"code\":1,\"info\":2}',0.101335,1056,1511334440),(416,23,1,'{\"code\":1,\"info\":2}',0.192041,1056,1511334500),(417,23,1,'{\"code\":1,\"info\":2}',0.090735,1056,1511334560),(418,23,1,'{\"code\":1,\"info\":2}',0.0820148,1056,1511334620),(419,23,1,'{\"code\":1,\"info\":2}',0.103807,1056,1511334680),(420,23,1,'{\"code\":1,\"info\":2}',0.127234,1056,1511334740),(421,23,1,'{\"code\":1,\"info\":2}',0.086642,1056,1511334800),(422,23,1,'{\"code\":1,\"info\":2}',0.084069,1056,1511334860),(423,23,1,'{\"code\":1,\"info\":2}',0.109117,1056,1511334920),(424,23,1,'{\"code\":1,\"info\":2}',0.088511,1056,1511334980),(425,23,1,'{\"code\":1,\"info\":2}',0.0631981,1056,1511335040),(426,23,1,'{\"code\":1,\"info\":2}',0.088387,1056,1511335100),(427,23,1,'{\"code\":1,\"info\":2}',0.098351,1056,1511335160),(428,23,1,'{\"code\":1,\"info\":2}',0.0473809,1056,1511335220),(429,23,1,'{\"code\":1,\"info\":2}',0.0993009,1056,1511335280),(430,23,1,'{\"code\":1,\"info\":2}',0.0535691,1056,1511335340),(431,23,1,'{\"code\":1,\"info\":2}',0.0720091,1056,1511335400),(432,23,1,'{\"code\":1,\"info\":2}',0.0734169,1056,1511335460),(433,23,1,'{\"code\":1,\"info\":2}',0.0880179,1056,1511335520),(434,23,1,'{\"code\":1,\"info\":2}',0.0632951,1056,1511335580),(435,23,1,'{\"code\":1,\"info\":2}',0.0395079,1056,1511335640),(436,23,1,'{\"code\":1,\"info\":2}',0.077585,1056,1511335700),(437,23,1,'{\"code\":1,\"info\":2}',0.039942,1056,1511335760),(438,23,1,'{\"code\":1,\"info\":2}',0.0417812,1056,1511335820),(439,23,1,'{\"code\":1,\"info\":2}',0.0485802,1056,1511335880),(440,23,1,'{\"code\":1,\"info\":2}',0.090806,1056,1511335940),(441,23,1,'{\"code\":1,\"info\":2}',0.0434771,1056,1511336000),(442,23,1,'{\"code\":1,\"info\":2}',0.0640161,1056,1511336060),(443,23,1,'{\"code\":1,\"info\":2}',0.0811429,1056,1511336120),(444,23,1,'{\"code\":1,\"info\":2}',0.062211,1056,1511336180),(445,23,1,'{\"code\":1,\"info\":2}',0.089411,1056,1511336240),(446,23,1,'{\"code\":1,\"info\":2}',0.0415709,1056,1511336300),(447,23,1,'{\"code\":1,\"info\":2}',0.0865929,1056,1511336360),(448,23,1,'{\"code\":1,\"info\":2}',0.0705729,1056,1511336420),(449,23,1,'{\"code\":1,\"info\":2}',0.100842,1056,1511336480),(450,23,1,'{\"code\":1,\"info\":2}',0.090369,1056,1511336540),(451,23,1,'{\"code\":1,\"info\":2}',0.080004,1056,1511336600),(452,23,1,'{\"code\":1,\"info\":2}',0.083955,1056,1511336660),(453,23,1,'{\"code\":1,\"info\":2}',0.086154,1056,1511336720),(454,23,1,'{\"code\":1,\"info\":2}',0.105087,1056,1511336780),(455,23,1,'{\"code\":1,\"info\":2}',0.0974138,1056,1511336840),(456,23,1,'{\"code\":1,\"info\":2}',0.102825,1056,1511336900),(457,23,1,'{\"code\":1,\"info\":2}',0.0867279,1056,1511336960),(458,23,1,'{\"code\":1,\"info\":2}',0.097152,1056,1511337020),(459,23,1,'{\"code\":1,\"info\":2}',0.0861599,1056,1511337080),(460,23,1,'{\"code\":1,\"info\":2}',0.0438769,1056,1511337140),(461,23,1,'{\"code\":1,\"info\":2}',0.112446,1056,1511337200),(462,23,1,'{\"code\":1,\"info\":2}',0.0917239,1056,1511337260),(463,23,1,'{\"code\":1,\"info\":2}',0.0778072,1056,1511337320),(464,23,1,'{\"code\":1,\"info\":2}',0.163251,1056,1511337380),(465,23,1,'{\"code\":1,\"info\":2}',0.0961449,1056,1511337440),(466,23,1,'{\"code\":1,\"info\":2}',0.03736,1056,1511337500),(467,23,1,'{\"code\":1,\"info\":2}',0.105047,1056,1511337560),(468,23,1,'{\"code\":1,\"info\":2}',0.0839829,1056,1511337620),(469,23,1,'{\"code\":1,\"info\":2}',0.0804071,1056,1511337680),(470,23,1,'{\"code\":1,\"info\":2}',0.085572,1056,1511337740),(471,23,1,'{\"code\":1,\"info\":2}',0.100083,1056,1511337800),(472,23,1,'{\"code\":1,\"info\":2}',0.0675199,1056,1511337860),(473,23,1,'{\"code\":1,\"info\":2}',0.0878911,1056,1511337920),(474,23,1,'{\"code\":1,\"info\":2}',0.0728931,1056,1511337980),(475,23,1,'{\"code\":1,\"info\":2}',0.108625,1056,1511338040),(476,23,1,'{\"code\":1,\"info\":2}',0.0796211,1056,1511338100),(477,23,1,'{\"code\":1,\"info\":2}',0.0706332,1056,1511338160),(478,23,1,'{\"code\":1,\"info\":2}',0.0577121,1056,1511338220),(479,23,1,'{\"code\":1,\"info\":2}',0.0632889,1056,1511338280),(480,23,1,'{\"code\":1,\"info\":2}',0.089916,1056,1511338340),(481,23,1,'{\"code\":1,\"info\":2}',0.068625,1056,1511338400),(482,23,1,'{\"code\":1,\"info\":2}',0.0690579,1056,1511338460),(483,23,1,'{\"code\":1,\"info\":2}',0.0461898,1056,1511338520),(484,23,1,'{\"code\":1,\"info\":2}',0.041985,1056,1511338580),(485,23,1,'{\"code\":1,\"info\":2}',0.10032,1056,1511338640),(486,23,1,'{\"code\":1,\"info\":2}',0.092602,1056,1511338700),(487,23,1,'{\"code\":1,\"info\":2}',0.0925729,1056,1511338760),(488,23,1,'{\"code\":1,\"info\":2}',0.0416172,1056,1511338820),(489,23,1,'{\"code\":1,\"info\":2}',0.065439,1056,1511338880),(490,23,1,'{\"code\":1,\"info\":2}',0.065516,1056,1511338940),(491,23,1,'{\"code\":1,\"info\":2}',0.099489,1056,1511339000),(492,23,1,'{\"code\":1,\"info\":2}',0.065208,1056,1511339060),(493,23,1,'{\"code\":1,\"info\":2}',0.077457,1056,1511339120),(494,23,1,'{\"code\":1,\"info\":2}',0.300612,1056,1511339180),(495,23,1,'{\"code\":1,\"info\":2}',0.0712631,1056,1511339240),(496,23,1,'{\"code\":1,\"info\":2}',0.133839,1056,1511339300),(497,23,1,'{\"code\":1,\"info\":2}',0.085377,1056,1511339360),(498,23,1,'{\"code\":1,\"info\":2}',0.072408,1056,1511339420),(499,23,1,'{\"code\":1,\"info\":2}',0.0883732,1056,1511339480),(500,23,1,'{\"code\":1,\"info\":2}',0.120704,1056,1511339540),(501,23,1,'{\"code\":1,\"info\":2}',0.036206,1056,1511339600),(502,23,1,'{\"code\":1,\"info\":2}',0.0418119,1056,1511339660),(503,23,1,'{\"code\":1,\"info\":2}',0.0707922,1056,1511339720),(504,23,1,'{\"code\":1,\"info\":2}',0.0429859,1056,1511339780),(505,23,1,'{\"code\":1,\"info\":2}',0.05867,1056,1511339840),(506,23,1,'{\"code\":1,\"info\":2}',0.10515,1056,1511339900),(507,23,1,'{\"code\":1,\"info\":2}',0.0642881,1056,1511339960),(508,23,1,'{\"code\":1,\"info\":2}',0.0761619,1056,1511340020),(509,23,1,'{\"code\":1,\"info\":2}',0.0917621,1056,1511340080),(510,23,1,'{\"code\":1,\"info\":2}',0.0679679,1056,1511340140),(511,23,1,'{\"code\":1,\"info\":2}',0.120714,1056,1511340200),(512,23,1,'{\"code\":1,\"info\":2}',0.0936949,1056,1511340260),(513,23,1,'{\"code\":1,\"info\":2}',0.255386,1056,1511340320),(514,23,1,'{\"code\":1,\"info\":2}',0.0415709,1056,1511340380),(515,23,1,'{\"code\":1,\"info\":2}',0.064431,1056,1511340440),(516,23,1,'{\"code\":1,\"info\":2}',0.090379,1056,1511340500),(517,23,1,'{\"code\":1,\"info\":2}',0.0905869,1056,1511340560),(518,23,1,'{\"code\":1,\"info\":2}',0.085254,1056,1511340620),(519,23,1,'{\"code\":1,\"info\":2}',0.0417221,1056,1511340680),(520,23,1,'{\"code\":1,\"info\":2}',0.0984101,1056,1511340740),(521,23,1,'{\"code\":1,\"info\":2}',0.040411,1056,1511340800),(522,23,1,'{\"code\":1,\"info\":2}',0.082953,1056,1511340860),(523,23,1,'{\"code\":1,\"info\":2}',0.129139,1056,1511340920),(524,23,1,'{\"code\":1,\"info\":2}',0.0421572,1056,1511340980),(525,23,1,'{\"code\":1,\"info\":2}',0.103847,1056,1511341040),(526,23,1,'{\"code\":1,\"info\":2}',0.0940449,1056,1511341100),(527,23,1,'{\"code\":1,\"info\":2}',0.100575,1056,1511341160),(528,23,1,'{\"code\":1,\"info\":2}',0.0862591,1056,1511341220),(529,23,1,'{\"code\":1,\"info\":2}',0.0425589,1056,1511341280),(530,23,1,'{\"code\":1,\"info\":2}',0.0563638,1056,1511341340),(531,23,1,'{\"code\":1,\"info\":2}',0.092592,1056,1511341400),(532,23,1,'{\"code\":1,\"info\":2}',0.0628479,1056,1511341460),(533,23,1,'{\"code\":1,\"info\":2}',0.211131,1056,1511341520),(534,23,1,'{\"code\":1,\"info\":2}',0.099787,1056,1511341580),(535,23,1,'{\"code\":1,\"info\":2}',0.119887,1056,1511341640),(536,23,1,'{\"code\":1,\"info\":2}',0.0970919,1056,1511341700),(537,23,1,'{\"code\":1,\"info\":2}',0.106464,1056,1511341760),(538,23,1,'{\"code\":1,\"info\":2}',0.0969179,1056,1511341820),(539,23,1,'{\"code\":1,\"info\":2}',0.314799,1056,1511341880),(540,23,1,'{\"code\":1,\"info\":2}',0.102674,1056,1511341940),(541,23,1,'{\"code\":1,\"info\":2}',0.087898,1056,1511342000),(542,23,1,'{\"code\":1,\"info\":2}',0.211035,1056,1511342060),(543,23,1,'{\"code\":1,\"info\":2}',0.0963321,1056,1511342120),(544,23,1,'{\"code\":1,\"info\":2}',0.075526,1056,1511342180),(545,23,1,'{\"code\":1,\"info\":2}',0.0419419,1056,1511342240),(546,23,1,'{\"code\":1,\"info\":2}',0.0857499,1056,1511342300),(547,23,1,'{\"code\":1,\"info\":2}',0.0661058,1056,1511342360),(548,23,1,'{\"code\":1,\"info\":2}',0.0417452,1056,1511342420),(549,23,1,'{\"code\":1,\"info\":2}',0.043189,1056,1511342480),(550,23,1,'{\"code\":1,\"info\":2}',0.0414779,1056,1511342540),(551,23,1,'{\"code\":1,\"info\":2}',0.0514719,1056,1511342600),(552,23,1,'{\"code\":1,\"info\":2}',0.0863171,1056,1511342660),(553,23,1,'{\"code\":1,\"info\":2}',0.089678,1056,1511342720),(554,23,1,'{\"code\":1,\"info\":2}',0.053988,1056,1511342780),(555,23,1,'{\"code\":1,\"info\":2}',0.0518241,1056,1511342840),(556,23,1,'{\"code\":1,\"info\":2}',0.0677569,1056,1511342900),(557,23,1,'{\"code\":1,\"info\":2}',0.209542,1056,1511342960),(558,23,1,'{\"code\":1,\"info\":2}',0.0894001,1056,1511343020),(559,23,1,'{\"code\":1,\"info\":2}',0.056505,1056,1511343080),(560,23,1,'{\"code\":1,\"info\":2}',0.091069,1056,1511343140),(561,23,1,'{\"code\":1,\"info\":2}',0.0473149,1056,1511343200),(562,23,1,'{\"code\":1,\"info\":2}',0.0543451,1056,1511343260),(563,23,1,'{\"code\":1,\"info\":2}',0.0558541,1056,1511343320),(564,23,1,'{\"code\":1,\"info\":2}',0.085542,1056,1511343380),(565,23,1,'{\"code\":1,\"info\":2}',0.111688,1056,1511343440),(566,23,1,'{\"code\":1,\"info\":2}',0.0943079,1056,1511343500),(567,23,1,'{\"code\":1,\"info\":2}',0.072156,1056,1511343560),(568,23,1,'{\"code\":1,\"info\":2}',0.0550039,1056,1511343620),(569,23,1,'{\"code\":1,\"info\":2}',0.101688,1056,1511343680),(570,23,1,'{\"code\":1,\"info\":2}',0.104906,1056,1511343740),(571,23,1,'{\"code\":1,\"info\":2}',0.0567369,1056,1511343800),(572,23,1,'{\"code\":1,\"info\":2}',0.0822651,1056,1511343860),(573,23,1,'{\"code\":1,\"info\":2}',0.065165,1056,1511343920),(574,23,1,'{\"code\":1,\"info\":2}',0.0732,1056,1511343980),(575,23,1,'{\"code\":1,\"info\":2}',0.0842628,1056,1511344040),(576,23,1,'{\"code\":1,\"info\":2}',0.041616,1056,1511344100),(577,23,1,'{\"code\":1,\"info\":2}',0.0960369,1056,1511344160),(578,23,1,'{\"code\":1,\"info\":2}',0.058264,1056,1511344220),(579,23,1,'{\"code\":1,\"info\":2}',0.073211,1056,1511344280),(580,23,1,'{\"code\":1,\"info\":2}',0.0615752,1056,1511344340),(581,23,1,'{\"code\":1,\"info\":2}',0.0465121,1056,1511344400),(582,23,1,'{\"code\":1,\"info\":2}',0.049979,1056,1511344460),(583,23,1,'{\"code\":1,\"info\":2}',0.0841682,1056,1511344520),(584,23,1,'{\"code\":1,\"info\":2}',0.088712,1056,1511344580),(585,23,1,'{\"code\":1,\"info\":2}',0.0433609,1056,1511344640),(586,23,1,'{\"code\":1,\"info\":2}',0.0837531,1056,1511344700),(587,23,1,'{\"code\":1,\"info\":2}',0.095458,1056,1511344760),(588,23,1,'{\"code\":1,\"info\":2}',0.10797,1056,1511344820),(589,23,1,'{\"code\":1,\"info\":2}',0.1346,1056,1511344880),(590,23,1,'{\"code\":1,\"info\":2}',0.0745699,1056,1511344940),(591,23,1,'{\"code\":1,\"info\":2}',0.08286,1056,1511345000),(592,23,1,'{\"code\":1,\"info\":2}',0.112537,1056,1511345060),(593,23,1,'{\"code\":1,\"info\":2}',0.103131,1056,1511345120),(594,23,1,'{\"code\":1,\"info\":2}',0.0703142,1056,1511345180),(595,23,1,'{\"code\":1,\"info\":2}',0.0950291,1056,1511345240),(596,23,1,'{\"code\":1,\"info\":2}',0.064028,1056,1511345300),(597,23,1,'{\"code\":1,\"info\":2}',0.0742211,1056,1511345360),(598,23,1,'{\"code\":1,\"info\":2}',0.0573452,1056,1511345420),(599,23,1,'{\"code\":1,\"info\":2}',0.0947731,1056,1511345480),(600,23,1,'{\"code\":1,\"info\":2}',0.0735829,1056,1511345540),(601,23,1,'{\"code\":1,\"info\":2}',0.0606592,1056,1511345600),(602,23,1,'{\"code\":1,\"info\":2}',0.0522869,1056,1511345660),(603,23,1,'{\"code\":1,\"info\":2}',0.147963,1056,1511345720),(604,23,1,'{\"code\":1,\"info\":2}',0.080961,1056,1511345780),(605,23,1,'{\"code\":1,\"info\":2}',0.0916851,1056,1511345840),(606,23,1,'{\"code\":1,\"info\":2}',0.0527439,1056,1511345900),(607,23,1,'{\"code\":1,\"info\":2}',0.0947409,1056,1511345960),(608,23,1,'{\"code\":1,\"info\":2}',0.0862541,1056,1511346020),(609,23,1,'{\"code\":1,\"info\":2}',0.076926,1056,1511346080),(610,23,1,'{\"code\":1,\"info\":2}',0.071945,1056,1511346140),(611,23,1,'{\"code\":1,\"info\":2}',0.0578251,1056,1511346200),(612,23,1,'{\"code\":1,\"info\":2}',0.0815129,1056,1511346260),(613,23,1,'{\"code\":1,\"info\":2}',0.0628681,1056,1511346320),(614,23,1,'{\"code\":1,\"info\":2}',0.0989621,1056,1511346380),(615,23,1,'{\"code\":1,\"info\":2}',0.079747,1056,1511346440),(616,23,1,'{\"code\":1,\"info\":2}',0.24907,1056,1511346500),(617,23,1,'{\"code\":1,\"info\":2}',0.0825191,1056,1511346560),(618,23,1,'{\"code\":1,\"info\":2}',0.043505,1056,1511346620),(619,23,1,'{\"code\":1,\"info\":2}',0.118665,1056,1511346680),(620,23,1,'{\"code\":1,\"info\":2}',0.0907462,1056,1511346740),(621,23,1,'{\"code\":1,\"info\":2}',0.0742619,1056,1511346800),(622,23,1,'{\"code\":1,\"info\":2}',0.101249,1056,1511346860),(623,23,1,'{\"code\":1,\"info\":2}',0.201124,1056,1511346920),(624,23,1,'{\"code\":1,\"info\":2}',0.091826,1056,1511346980),(625,23,1,'{\"code\":1,\"info\":2}',0.0949612,1056,1511347040),(626,23,1,'{\"code\":1,\"info\":2}',0.0455489,1056,1511347100),(627,23,1,'{\"code\":1,\"info\":2}',0.119279,1056,1511347160),(628,23,1,'{\"code\":1,\"info\":2}',0.0474081,1056,1511347220),(629,23,1,'{\"code\":1,\"info\":2}',0.0833709,1056,1511347280),(630,23,1,'{\"code\":1,\"info\":2}',0.081511,1056,1511347340),(631,23,1,'{\"code\":1,\"info\":2}',0.109339,1056,1511347400),(632,23,1,'{\"code\":1,\"info\":2}',0.0787661,1056,1511347460),(633,23,1,'{\"code\":1,\"info\":2}',0.123763,1056,1511347520),(634,23,1,'{\"code\":1,\"info\":2}',0.2514,1056,1511347580),(635,23,1,'{\"code\":1,\"info\":2}',0.0947649,1056,1511347640),(636,23,1,'{\"code\":1,\"info\":2}',0.062093,1056,1511347700),(637,23,1,'{\"code\":1,\"info\":2}',0.084446,1056,1511347760),(638,23,1,'{\"code\":1,\"info\":2}',0.0849578,1056,1511347820),(639,23,1,'{\"code\":1,\"info\":2}',0.180904,1056,1511347880),(640,23,1,'{\"code\":1,\"info\":2}',0.150119,1056,1511347940),(641,23,1,'{\"code\":1,\"info\":2}',0.110662,1056,1511348000),(642,23,1,'{\"code\":1,\"info\":2}',0.145802,1056,1511348060),(643,23,1,'{\"code\":1,\"info\":2}',0.121301,1056,1511348120),(644,23,1,'{\"code\":1,\"info\":2}',0.0782399,1056,1511348180),(645,23,1,'{\"code\":1,\"info\":2}',0.0984249,1056,1511348240),(646,23,1,'{\"code\":1,\"info\":2}',0.0409141,1056,1511348300),(647,23,1,'{\"code\":1,\"info\":2}',0.08126,1056,1511348360),(648,23,1,'{\"code\":1,\"info\":2}',0.07481,1056,1511348420),(649,23,1,'{\"code\":1,\"info\":2}',0.103369,1056,1511348480),(650,23,1,'{\"code\":1,\"info\":2}',0.0714471,1056,1511348540),(651,23,1,'{\"code\":1,\"info\":2}',0.0417571,1056,1511348600),(652,23,1,'{\"code\":1,\"info\":2}',0.0425839,1056,1511348660),(653,23,1,'{\"code\":1,\"info\":2}',0.543355,1056,1511351354),(654,23,1,'{\"code\":1,\"info\":2}',0.0911431,1056,1511408096),(655,23,1,'{\"code\":1,\"info\":2}',0.06826,1056,1511408156),(656,23,1,'{\"code\":1,\"info\":2}',0.0588071,1056,1511408216),(657,23,1,'{\"code\":1,\"info\":2}',0.10727,1056,1511408276),(658,23,1,'{\"code\":1,\"info\":2}',0.0862231,1056,1511408336),(659,23,1,'{\"code\":1,\"info\":2}',0.0766721,1056,1511408396),(660,23,1,'{\"code\":1,\"info\":2}',0.205342,1056,1511408456),(661,23,1,'{\"code\":1,\"info\":2}',0.13376,1056,1511408516),(662,23,1,'{\"code\":1,\"info\":2}',0.061506,1056,1511408576),(663,23,1,'{\"code\":1,\"info\":2}',0.0726728,1056,1511408636),(664,23,1,'{\"code\":1,\"info\":2}',0.109448,1056,1511408696),(665,23,1,'{\"code\":1,\"info\":2}',0.074801,1056,1511408756),(666,23,1,'{\"code\":1,\"info\":2}',0.04,1056,1511408816),(667,23,1,'{\"code\":1,\"info\":2}',0.0394711,1056,1511408876),(668,23,1,'{\"code\":1,\"info\":2}',0.0387089,1056,1511408936),(669,23,1,'{\"code\":1,\"info\":2}',0.0399041,1056,1511408996),(670,23,1,'{\"code\":1,\"info\":2}',0.039974,1056,1511409056),(671,23,1,'{\"code\":1,\"info\":2}',0.039427,1056,1511409116),(672,23,1,'{\"code\":1,\"info\":2}',0.0438712,1056,1511409176),(673,23,1,'{\"code\":1,\"info\":2}',0.0385032,1056,1511409236),(674,23,1,'{\"code\":1,\"info\":2}',0.0596559,1056,1511409296),(675,23,1,'{\"code\":1,\"info\":2}',0.038933,1056,1511409356),(676,23,1,'{\"code\":1,\"info\":2}',0.0473871,1056,1511409416),(677,23,1,'{\"code\":1,\"info\":2}',0.0953138,1056,1511409476),(678,23,1,'{\"code\":1,\"info\":2}',0.070261,1056,1511409536),(679,23,1,'{\"code\":1,\"info\":2}',0.099144,1056,1511409596),(680,23,1,'{\"code\":1,\"info\":2}',0.0411141,1056,1511409656),(681,23,1,'{\"code\":1,\"info\":2}',0.0639191,1056,1511409716),(682,23,1,'{\"code\":1,\"info\":2}',0.071013,1056,1511409776),(683,23,1,'{\"code\":1,\"info\":2}',0.1193,1056,1511409836),(684,23,1,'{\"code\":1,\"info\":2}',0.044878,1056,1511409896),(685,23,1,'{\"code\":1,\"info\":2}',0.041558,1056,1511409956),(686,23,1,'{\"code\":1,\"info\":2}',0.040082,1056,1511410016),(687,23,1,'{\"code\":1,\"info\":2}',0.041575,1056,1511410076),(688,23,1,'{\"code\":1,\"info\":2}',0.040647,1056,1511410136),(689,23,1,'{\"code\":1,\"info\":2}',0.0608728,1056,1511410196),(690,23,1,'{\"code\":1,\"info\":2}',0.0428429,1056,1511410256),(691,23,1,'{\"code\":1,\"info\":2}',0.0409601,1056,1511410316),(692,23,1,'{\"code\":1,\"info\":2}',0.0405941,1056,1511410376),(693,23,1,'{\"code\":1,\"info\":2}',0.0403969,1056,1511410436),(694,23,1,'{\"code\":1,\"info\":2}',0.0516551,1056,1511410496),(695,23,1,'{\"code\":1,\"info\":2}',0.063103,1056,1511410556),(696,23,1,'{\"code\":1,\"info\":2}',0.0393519,1056,1511410616),(697,23,1,'{\"code\":1,\"info\":2}',0.0390639,1056,1511410676),(698,23,1,'{\"code\":1,\"info\":2}',0.0807569,1056,1511410736),(699,23,1,'{\"code\":1,\"info\":2}',0.077018,1056,1511410796),(700,23,1,'{\"code\":1,\"info\":2}',0.0381961,1056,1511410856),(701,23,1,'{\"code\":1,\"info\":2}',0.0387459,1056,1511410916),(702,23,1,'{\"code\":1,\"info\":2}',0.0387042,1056,1511410976),(703,23,1,'{\"code\":1,\"info\":2}',0.038548,1056,1511411036),(704,23,1,'{\"code\":1,\"info\":2}',0.0381479,1056,1511411096),(705,23,1,'{\"code\":1,\"info\":2}',0.072979,1056,1511411156),(706,23,1,'{\"code\":1,\"info\":2}',0.039464,1056,1511411216),(707,23,1,'{\"code\":1,\"info\":2}',0.0401211,1056,1511411276),(708,23,1,'{\"code\":1,\"info\":2}',0.038131,1056,1511411336),(709,23,1,'{\"code\":1,\"info\":2}',0.0795059,1056,1511411396),(710,23,1,'{\"code\":1,\"info\":2}',0.071233,1056,1511411456),(711,23,1,'{\"code\":1,\"info\":2}',0.0390871,1056,1511411516),(712,23,1,'{\"code\":1,\"info\":2}',0.0423291,1056,1511411576),(713,23,1,'{\"code\":1,\"info\":2}',0.0388072,1056,1511411636),(714,23,1,'{\"code\":1,\"info\":2}',0.0874321,1056,1511411696),(715,23,1,'{\"code\":1,\"info\":2}',0.07851,1056,1511411756),(716,23,1,'{\"code\":1,\"info\":2}',0.0389011,1056,1511411816),(717,23,1,'{\"code\":1,\"info\":2}',0.0383852,1056,1511411876),(718,23,1,'{\"code\":1,\"info\":2}',0.094285,1056,1511411936),(719,23,1,'{\"code\":1,\"info\":2}',0.0394819,1056,1511411996),(720,23,1,'{\"code\":1,\"info\":2}',0.066761,1056,1511412056),(721,23,1,'{\"code\":1,\"info\":2}',0.03948,1056,1511412116),(722,23,1,'{\"code\":1,\"info\":2}',0.039957,1056,1511412176),(723,23,1,'{\"code\":1,\"info\":2}',0.0393419,1056,1511412236),(724,23,1,'{\"code\":1,\"info\":2}',0.0774329,1056,1511412296),(725,23,1,'{\"code\":1,\"info\":2}',0.0399201,1056,1511412356),(726,23,1,'{\"code\":1,\"info\":2}',0.0383589,1056,1511412416),(727,23,1,'{\"code\":1,\"info\":2}',0.038537,1056,1511412476),(728,23,1,'{\"code\":1,\"info\":2}',0.0636091,1056,1511412536),(729,23,1,'{\"code\":1,\"info\":2}',0.149322,1056,1511412596),(730,23,1,'{\"code\":1,\"info\":2}',0.068954,1056,1511412656),(731,23,1,'{\"code\":1,\"info\":2}',0.093188,1056,1511412716),(732,23,1,'{\"code\":1,\"info\":2}',0.08866,1056,1511412776),(733,23,1,'{\"code\":1,\"info\":2}',0.0456119,1056,1511412836),(734,23,1,'{\"code\":1,\"info\":2}',0.057548,1056,1511412896),(735,23,1,'{\"code\":1,\"info\":2}',0.0701091,1056,1511412956),(736,23,1,'{\"code\":1,\"info\":2}',0.0701308,1056,1511413016),(737,23,1,'{\"code\":1,\"info\":2}',0.0394671,1056,1511413076),(738,23,1,'{\"code\":1,\"info\":2}',0.0821242,1056,1511413136),(739,23,1,'{\"code\":1,\"info\":2}',0.072861,1056,1511413196),(740,23,1,'{\"code\":1,\"info\":2}',0.0382938,1056,1511413256),(741,23,1,'{\"code\":1,\"info\":2}',0.037395,1056,1511413316),(742,23,1,'{\"code\":1,\"info\":2}',0.057374,1056,1511413376),(743,23,1,'{\"code\":1,\"info\":2}',0.039525,1056,1511413436),(744,23,1,'{\"code\":1,\"info\":2}',0.0427439,1056,1511413496),(745,23,1,'{\"code\":1,\"info\":2}',0.038204,1056,1511413556),(746,23,1,'{\"code\":1,\"info\":2}',0.040447,1056,1511413616),(747,23,1,'{\"code\":1,\"info\":2}',0.0971389,1056,1511413676),(748,23,1,'{\"code\":1,\"info\":2}',0.0406489,1056,1511413736),(749,23,1,'{\"code\":1,\"info\":2}',0.0393958,1056,1511413796),(750,23,1,'{\"code\":1,\"info\":2}',0.0395832,1056,1511413856),(751,23,1,'{\"code\":1,\"info\":2}',0.0397789,1056,1511413916),(752,23,1,'{\"code\":1,\"info\":2}',0.073097,1056,1511413976),(753,23,1,'{\"code\":1,\"info\":2}',0.041393,1056,1511414036),(754,23,1,'{\"code\":1,\"info\":2}',0.041559,1056,1511414096),(755,23,1,'{\"code\":1,\"info\":2}',0.0406342,1056,1511414156),(756,23,1,'{\"code\":1,\"info\":2}',0.038332,1056,1511414216),(757,23,1,'{\"code\":1,\"info\":2}',0.038934,1056,1511414276),(758,23,1,'{\"code\":1,\"info\":2}',0.0836999,1056,1511414336),(759,23,1,'{\"code\":1,\"info\":2}',0.0859721,1056,1511414396),(760,23,1,'{\"code\":1,\"info\":2}',0.0676868,1056,1511414456),(761,23,1,'{\"code\":1,\"info\":2}',0.076205,1056,1511414516),(762,23,1,'{\"code\":1,\"info\":2}',0.0408819,1056,1511414576),(763,23,1,'{\"code\":1,\"info\":2}',0.0917571,1056,1511414636),(764,23,1,'{\"code\":1,\"info\":2}',0.077986,1056,1511414696),(765,23,1,'{\"code\":1,\"info\":2}',0.058341,1056,1511414756),(766,23,1,'{\"code\":1,\"info\":2}',0.0339749,1056,1511414816),(767,23,1,'{\"code\":1,\"info\":2}',0.041795,1056,1511414876),(768,23,1,'{\"code\":1,\"info\":2}',0.0374651,1056,1511414936),(769,23,1,'{\"code\":1,\"info\":2}',0.123496,1056,1511414996),(770,23,1,'{\"code\":1,\"info\":2}',0.0686781,1056,1511415056),(771,23,1,'{\"code\":1,\"info\":2}',0.041003,1056,1511415116),(772,23,1,'{\"code\":1,\"info\":2}',0.0400379,1056,1511415176),(773,23,1,'{\"code\":1,\"info\":2}',0.0759461,1056,1511415236),(774,23,1,'{\"code\":1,\"info\":2}',0.0725851,1056,1511415296),(775,23,1,'{\"code\":1,\"info\":2}',0.077575,1056,1511415356),(776,23,1,'{\"code\":1,\"info\":2}',0.040777,1056,1511415416),(777,23,1,'{\"code\":1,\"info\":2}',0.0406699,1056,1511415476),(778,23,1,'{\"code\":1,\"info\":2}',0.0446289,1056,1511415536),(779,23,1,'{\"code\":1,\"info\":2}',0.0591779,1056,1511415596),(780,23,1,'{\"code\":1,\"info\":2}',0.071707,1056,1511415656),(781,23,1,'{\"code\":1,\"info\":2}',0.083457,1056,1511415716),(782,23,1,'{\"code\":1,\"info\":2}',0.109791,1056,1511415776),(783,23,1,'{\"code\":1,\"info\":2}',0.167186,1056,1511415836),(784,23,1,'{\"code\":1,\"info\":2}',0.10315,1056,1511415896),(785,23,1,'{\"code\":1,\"info\":2}',0.0720201,1056,1511415956),(786,23,1,'{\"code\":1,\"info\":2}',0.0425241,1056,1511416016),(787,23,1,'{\"code\":1,\"info\":2}',0.0783541,1056,1511416076),(788,23,1,'{\"code\":1,\"info\":2}',0.0487158,1056,1511416136),(789,23,1,'{\"code\":1,\"info\":2}',0.041255,1056,1511416196),(790,23,1,'{\"code\":1,\"info\":2}',0.0644231,1056,1511416256),(791,23,1,'{\"code\":1,\"info\":2}',0.0888121,1056,1511416316),(792,23,1,'{\"code\":1,\"info\":2}',0.0419211,1056,1511416376),(793,23,1,'{\"code\":1,\"info\":2}',0.0423722,1056,1511416436),(794,23,1,'{\"code\":1,\"info\":2}',0.0441818,1056,1511416496),(795,23,1,'{\"code\":1,\"info\":2}',0.041049,1056,1511416556),(796,23,1,'{\"code\":1,\"info\":2}',0.069597,1056,1511416616),(797,23,1,'{\"code\":1,\"info\":2}',0.0491221,1056,1511416676),(798,23,1,'{\"code\":1,\"info\":2}',0.117528,1056,1511416736),(799,23,1,'{\"code\":1,\"info\":2}',0.131146,1056,1511416796),(800,23,1,'{\"code\":1,\"info\":2}',0.062284,1056,1511416856),(801,23,1,'{\"code\":1,\"info\":2}',0.082634,1056,1511416916),(802,23,1,'{\"code\":1,\"info\":2}',0.0428231,1056,1511416976),(803,23,1,'{\"code\":1,\"info\":2}',0.048229,1056,1511417036),(804,23,1,'{\"code\":1,\"info\":2}',0.0427971,1056,1511417096),(805,23,1,'{\"code\":1,\"info\":2}',0.077183,1056,1511417156),(806,23,1,'{\"code\":1,\"info\":2}',0.106689,1056,1511417216),(807,23,1,'{\"code\":1,\"info\":2}',0.0713191,1056,1511417276),(808,23,1,'{\"code\":1,\"info\":2}',0.0778871,1056,1511417336),(809,23,1,'{\"code\":1,\"info\":2}',0.110446,1056,1511417396),(810,23,1,'{\"code\":1,\"info\":2}',0.072875,1056,1511417456),(811,23,1,'{\"code\":1,\"info\":2}',0.0401909,1056,1511417516),(812,23,1,'{\"code\":1,\"info\":2}',0.0395081,1056,1511417576),(813,23,1,'{\"code\":1,\"info\":2}',0.0420339,1056,1511417636),(814,23,1,'{\"code\":1,\"info\":2}',0.0733662,1056,1511417696),(815,23,1,'{\"code\":1,\"info\":2}',0.075346,1056,1511417756),(816,23,1,'{\"code\":1,\"info\":2}',0.039778,1056,1511417816),(817,23,1,'{\"code\":1,\"info\":2}',0.0744069,1056,1511417876),(818,23,1,'{\"code\":1,\"info\":2}',0.0794859,1056,1511417936),(819,23,1,'{\"code\":1,\"info\":2}',0.0789511,1056,1511417996),(820,23,1,'{\"code\":1,\"info\":2}',0.137557,1056,1511418056),(821,23,1,'{\"code\":1,\"info\":2}',0.0406129,1056,1511418116),(822,23,1,'{\"code\":1,\"info\":2}',0.0738208,1056,1511418176),(823,23,1,'{\"code\":1,\"info\":2}',0.041364,1056,1511418236),(824,23,1,'{\"code\":1,\"info\":2}',0.0826719,1056,1511418296),(825,23,1,'{\"code\":1,\"info\":2}',0.082372,1056,1511418356),(826,23,1,'{\"code\":1,\"info\":2}',0.069663,1056,1511418416),(827,23,1,'{\"code\":1,\"info\":2}',0.0408559,1056,1511418476),(828,23,1,'{\"code\":1,\"info\":2}',0.101778,1056,1511418536),(829,23,1,'{\"code\":1,\"info\":2}',0.0793531,1056,1511418596),(830,23,1,'{\"code\":1,\"info\":2}',0.0608091,1056,1511418656),(831,23,1,'{\"code\":1,\"info\":2}',0.0902781,1056,1511418716),(832,23,1,'{\"code\":1,\"info\":2}',0.102719,1056,1511418776),(833,23,1,'{\"code\":1,\"info\":2}',0.042243,1056,1511418836),(834,23,1,'{\"code\":1,\"info\":2}',0.133388,1056,1511418896),(835,23,1,'{\"code\":1,\"info\":2}',0.070642,1056,1511418956),(836,23,1,'{\"code\":1,\"info\":2}',0.0426559,1056,1511419016),(837,23,1,'{\"code\":1,\"info\":2}',0.103298,1056,1511419076),(838,23,1,'{\"code\":1,\"info\":2}',0.127623,1056,1511419136),(839,23,1,'{\"code\":1,\"info\":2}',0.0415001,1056,1511419196),(840,23,1,'{\"code\":1,\"info\":2}',0.041688,1056,1511419256),(841,23,1,'{\"code\":1,\"info\":2}',0.0685339,1056,1511419316),(842,23,1,'{\"code\":1,\"info\":2}',0.165568,1056,1511419376),(843,23,1,'{\"code\":1,\"info\":2}',0.0439188,1056,1511419436),(844,23,1,'{\"code\":1,\"info\":2}',0.039505,1056,1511419496),(845,23,1,'{\"code\":1,\"info\":2}',0.0433762,1056,1511419556),(846,23,1,'{\"code\":1,\"info\":2}',0.070323,1056,1511419616),(847,23,1,'{\"code\":1,\"info\":2}',0.0796111,1056,1511419676),(848,23,1,'{\"code\":1,\"info\":2}',0.0579631,1056,1511419736),(849,23,1,'{\"code\":1,\"info\":2}',0.0886481,1056,1511419796),(850,23,1,'{\"code\":1,\"info\":2}',0.0812161,1056,1511419856),(851,23,1,'{\"code\":1,\"info\":2}',0.07532,1056,1511419916),(852,23,1,'{\"code\":1,\"info\":2}',0.04582,1056,1511419976),(853,23,1,'{\"code\":1,\"info\":2}',0.0608749,1056,1511420036),(854,23,1,'{\"code\":1,\"info\":2}',0.0992699,1056,1511420096),(855,23,1,'{\"code\":1,\"info\":2}',0.142332,1056,1511420156),(856,23,1,'{\"code\":1,\"info\":2}',0.0395598,1056,1511420216),(857,23,1,'{\"code\":1,\"info\":2}',0.095366,1056,1511420276),(858,23,1,'{\"code\":1,\"info\":2}',0.0929079,1056,1511420336),(859,23,1,'{\"code\":1,\"info\":2}',0.112161,1056,1511420396),(860,23,1,'{\"code\":1,\"info\":2}',0.125762,1056,1511420456),(861,23,1,'{\"code\":1,\"info\":2}',0.048404,1056,1511420516),(862,23,1,'{\"code\":1,\"info\":2}',0.0718679,1056,1511420576),(863,23,1,'{\"code\":1,\"info\":2}',0.0493181,1056,1511420636),(864,23,1,'{\"code\":1,\"info\":2}',0.141697,1056,1511420696),(865,23,1,'{\"code\":1,\"info\":2}',0.0796878,1056,1511420756),(866,23,1,'{\"code\":1,\"info\":2}',0.0412641,1056,1511420816),(867,23,1,'{\"code\":1,\"info\":2}',0.040771,1056,1511420876),(868,23,1,'{\"code\":1,\"info\":2}',0.087244,1056,1511420936),(869,23,1,'{\"code\":1,\"info\":2}',0.0653419,1056,1511420996),(870,23,1,'{\"code\":1,\"info\":2}',0.10441,1056,1511421056),(871,23,1,'{\"code\":1,\"info\":2}',0.0356121,1056,1511421116),(872,23,1,'{\"code\":1,\"info\":2}',0.075228,1056,1511421176),(873,23,1,'{\"code\":1,\"info\":2}',0.142726,1056,1511421236),(874,23,1,'{\"code\":1,\"info\":2}',0.142011,1056,1511421296),(875,23,1,'{\"code\":1,\"info\":2}',0.082448,1056,1511421356),(876,23,1,'{\"code\":1,\"info\":2}',0.111257,1056,1511421416),(877,23,1,'{\"code\":1,\"info\":2}',0.0886428,1056,1511421476),(878,23,1,'{\"code\":1,\"info\":2}',0.0406492,1056,1511421536),(879,23,1,'{\"code\":1,\"info\":2}',0.0675249,1056,1511421596),(880,23,1,'{\"code\":1,\"info\":2}',0.0634511,1056,1511421656),(881,23,1,'{\"code\":1,\"info\":2}',0.154041,1056,1511421716),(882,23,1,'{\"code\":1,\"info\":2}',0.0755479,1056,1511421776),(883,23,1,'{\"code\":1,\"info\":2}',0.127795,1056,1511421836),(884,23,1,'{\"code\":1,\"info\":2}',0.134377,1056,1511421896),(885,23,1,'{\"code\":1,\"info\":2}',0.040529,1056,1511421956),(886,23,1,'{\"code\":1,\"info\":2}',0.0343051,1056,1511422016),(887,23,1,'{\"code\":1,\"info\":2}',0.070751,1056,1511422076),(888,23,1,'{\"code\":1,\"info\":2}',0.082458,1056,1511422136),(889,23,1,'{\"code\":1,\"info\":2}',0.127606,1056,1511422196),(890,23,1,'{\"code\":1,\"info\":2}',0.0636749,1056,1511422256),(891,23,1,'{\"code\":1,\"info\":2}',0.114559,1056,1511422316),(892,23,1,'{\"code\":1,\"info\":2}',0.141313,1056,1511422376),(893,23,1,'{\"code\":1,\"info\":2}',0.133806,1056,1511422436),(894,23,1,'{\"code\":1,\"info\":2}',0.136414,1056,1511422496),(895,23,1,'{\"code\":1,\"info\":2}',0.196671,1056,1511422556),(896,23,1,'{\"code\":1,\"info\":2}',0.088311,1056,1511422616),(897,23,1,'{\"code\":1,\"info\":2}',0.096226,1056,1511422676),(898,23,1,'{\"code\":1,\"info\":2}',0.0993581,1056,1511422736),(899,23,1,'{\"code\":1,\"info\":2}',0.136594,1056,1511422796),(900,23,1,'{\"code\":1,\"info\":2}',0.041621,1056,1511422856),(901,23,1,'{\"code\":1,\"info\":2}',0.0437651,1056,1511422916),(902,23,1,'{\"code\":1,\"info\":2}',0.0891402,1056,1511422976),(903,23,1,'{\"code\":1,\"info\":2}',0.0745049,1056,1511423036),(904,23,1,'{\"code\":1,\"info\":2}',0.0413301,1056,1511423096),(905,23,1,'{\"code\":1,\"info\":2}',0.128254,1056,1511423156),(906,23,1,'{\"code\":1,\"info\":2}',0.0403519,1056,1511423216),(907,23,1,'{\"code\":1,\"info\":2}',0.204988,1056,1511423276),(908,23,1,'{\"code\":1,\"info\":2}',0.0946171,1056,1511423336),(909,23,1,'{\"code\":1,\"info\":2}',0.118689,1056,1511423396),(910,23,1,'{\"code\":1,\"info\":2}',0.0862119,1056,1511423456),(911,23,1,'{\"code\":1,\"info\":2}',0.129345,1056,1511423516),(912,23,1,'{\"code\":1,\"info\":2}',0.105815,1056,1511423576),(913,23,1,'{\"code\":1,\"info\":2}',0.0398879,1056,1511423636),(914,23,1,'{\"code\":1,\"info\":2}',0.126618,1056,1511423696),(915,23,1,'{\"code\":1,\"info\":2}',0.0423119,1056,1511423756),(916,23,1,'{\"code\":1,\"info\":2}',0.122535,1056,1511423816),(917,23,1,'{\"code\":1,\"info\":2}',0.133077,1056,1511423876),(918,23,1,'{\"code\":1,\"info\":2}',0.143941,1056,1511423936),(919,23,1,'{\"code\":1,\"info\":2}',0.146225,1056,1511423996),(920,23,1,'{\"code\":1,\"info\":2}',0.0963888,1056,1511424056),(921,23,1,'{\"code\":1,\"info\":2}',0.0388381,1056,1511424116),(922,23,1,'{\"code\":1,\"info\":2}',0.138645,1056,1511424176),(923,23,1,'{\"code\":1,\"info\":2}',0.041841,1056,1511424236),(924,23,1,'{\"code\":1,\"info\":2}',0.0430071,1056,1511424296),(925,23,1,'{\"code\":1,\"info\":2}',0.083945,1056,1511424356),(926,23,1,'{\"code\":1,\"info\":2}',0.141128,1056,1511424416),(927,23,1,'{\"code\":1,\"info\":2}',0.0450921,1056,1511424476),(928,23,1,'{\"code\":1,\"info\":2}',0.081928,1056,1511424536),(929,23,1,'{\"code\":1,\"info\":2}',0.076288,1056,1511424596),(930,23,1,'{\"code\":1,\"info\":2}',0.087121,1056,1511424656),(931,23,1,'{\"code\":1,\"info\":2}',0.040653,1056,1511424716),(932,23,1,'{\"code\":1,\"info\":2}',0.130998,1056,1511424776),(933,23,1,'{\"code\":1,\"info\":2}',0.117138,1056,1511424836),(934,23,1,'{\"code\":1,\"info\":2}',0.089689,1056,1511424896),(935,23,1,'{\"code\":1,\"info\":2}',0.101727,1056,1511424956),(936,23,1,'{\"code\":1,\"info\":2}',0.0826311,1056,1511425016),(937,23,1,'{\"code\":1,\"info\":2}',0.112399,1056,1511425076),(938,23,1,'{\"code\":1,\"info\":2}',0.0871429,1056,1511425136),(939,23,1,'{\"code\":1,\"info\":2}',0.032501,1056,1511425196),(940,23,1,'{\"code\":1,\"info\":2}',0.04022,1056,1511425256),(941,23,1,'{\"code\":1,\"info\":2}',0.039942,1056,1511425316),(942,23,1,'{\"code\":1,\"info\":2}',0.038151,1056,1511425376),(943,23,1,'{\"code\":1,\"info\":2}',0.039845,1056,1511425436),(944,23,1,'{\"code\":1,\"info\":2}',0.082274,1056,1511425496),(945,23,1,'{\"code\":1,\"info\":2}',0.075398,1056,1511425556),(946,23,1,'{\"code\":1,\"info\":2}',0.0711951,1056,1511425616),(947,23,1,'{\"code\":1,\"info\":2}',0.0411911,1056,1511425676),(948,23,1,'{\"code\":1,\"info\":2}',0.0651038,1056,1511425736),(949,23,1,'{\"code\":1,\"info\":2}',0.074636,1056,1511425796),(950,23,1,'{\"code\":1,\"info\":2}',0.071784,1056,1511425856),(951,23,1,'{\"code\":1,\"info\":2}',0.0633421,1056,1511425916),(952,23,1,'{\"code\":1,\"info\":2}',0.0398738,1056,1511425976),(953,23,1,'{\"code\":1,\"info\":2}',0.114763,1056,1511426036),(954,23,1,'{\"code\":1,\"info\":2}',0.081718,1056,1511426096),(955,23,1,'{\"code\":1,\"info\":2}',0.0669019,1056,1511426156),(956,23,1,'{\"code\":1,\"info\":2}',0.140221,1056,1511426216),(957,23,1,'{\"code\":1,\"info\":2}',0.066314,1056,1511426276),(958,23,1,'{\"code\":1,\"info\":2}',0.111826,1056,1511426336),(959,23,1,'{\"code\":1,\"info\":2}',0.128235,1056,1511426396),(960,23,1,'{\"code\":1,\"info\":2}',0.0801308,1056,1511426456),(961,23,1,'{\"code\":1,\"info\":2}',0.079349,1056,1511426516),(962,23,1,'{\"code\":1,\"info\":2}',0.0857971,1056,1511426576),(963,23,1,'{\"code\":1,\"info\":2}',0.0904028,1056,1511426636),(964,23,1,'{\"code\":1,\"info\":2}',0.06973,1056,1511426696),(965,23,1,'{\"code\":1,\"info\":2}',0.118023,1056,1511426756),(966,23,1,'{\"code\":1,\"info\":2}',0.0756671,1056,1511426816),(967,23,1,'{\"code\":1,\"info\":2}',0.040056,1056,1511426876),(968,23,1,'{\"code\":1,\"info\":2}',0.0899081,1056,1511426936),(969,23,1,'{\"code\":1,\"info\":2}',0.0899322,1056,1511426996),(970,23,1,'{\"code\":1,\"info\":2}',2.74574,1056,1511427059),(971,23,1,'{\"code\":1,\"info\":2}',0.435069,1056,1511427117),(972,23,1,'{\"code\":1,\"info\":2}',0.0752699,1056,1511427176),(973,23,1,'{\"code\":1,\"info\":2}',0.0395281,1056,1511427236),(974,23,1,'{\"code\":1,\"info\":2}',0.0645921,1056,1511427296),(975,23,1,'{\"code\":1,\"info\":2}',0.113559,1056,1511427356),(976,23,1,'{\"code\":1,\"info\":2}',0.135905,1056,1511427416),(977,23,1,'{\"code\":1,\"info\":2}',0.0389321,1056,1511427476),(978,23,1,'{\"code\":1,\"info\":2}',0.0433228,1056,1511427536),(979,23,1,'{\"code\":1,\"info\":2}',0.0387971,1056,1511427596),(980,23,1,'{\"code\":1,\"info\":2}',0.0428629,1056,1511427656),(981,23,1,'{\"code\":1,\"info\":2}',0.0422142,1056,1511427716),(982,23,1,'{\"code\":1,\"info\":2}',0.0406971,1056,1511427776),(983,23,1,'{\"code\":1,\"info\":2}',0.040061,1056,1511427836),(984,23,1,'{\"code\":1,\"info\":2}',0.0984919,1056,1511427896),(985,23,1,'{\"code\":1,\"info\":2}',0.114432,1056,1511427956),(986,23,1,'{\"code\":1,\"info\":2}',0.0401969,1056,1511428016),(987,23,1,'{\"code\":1,\"info\":2}',0.0426948,1056,1511428076),(988,23,1,'{\"code\":1,\"info\":2}',0.0411129,1056,1511428136),(989,23,1,'{\"code\":1,\"info\":2}',0.0396941,1056,1511428196),(990,23,1,'{\"code\":1,\"info\":2}',0.0410461,1056,1511428256),(991,23,1,'{\"code\":1,\"info\":2}',0.0391512,1056,1511428316),(992,23,1,'{\"code\":1,\"info\":2}',0.0392728,1056,1511428376),(993,23,1,'{\"code\":1,\"info\":2}',0.0638571,1056,1511428436),(994,23,1,'{\"code\":1,\"info\":2}',0.0394909,1056,1511428496),(995,23,1,'{\"code\":1,\"info\":2}',0.0370851,1056,1511428556),(996,23,1,'{\"code\":1,\"info\":2}',0.034523,1056,1511428616),(997,23,1,'{\"code\":1,\"info\":2}',0.0388219,1056,1511428676),(998,23,1,'{\"code\":1,\"info\":2}',0.039603,1056,1511428736),(999,23,1,'{\"code\":1,\"info\":2}',0.0387902,1056,1511428796),(1000,23,1,'{\"code\":1,\"info\":2}',0.03933,1056,1511428856),(1001,23,1,'{\"code\":1,\"info\":2}',0.0628829,1056,1511428916),(1002,23,1,'{\"code\":1,\"info\":2}',0.088423,1056,1511428976),(1003,23,1,'{\"code\":1,\"info\":2}',0.136351,1056,1511429036),(1004,23,1,'{\"code\":1,\"info\":2}',0.134731,1056,1511429096),(1005,23,1,'{\"code\":1,\"info\":2}',0.079519,1056,1511429156),(1006,23,1,'{\"code\":1,\"info\":2}',0.0589449,1056,1511429216),(1007,23,1,'{\"code\":1,\"info\":2}',0.0746,1056,1511429276),(1008,23,1,'{\"code\":1,\"info\":2}',0.0827529,1056,1511429336),(1009,23,1,'{\"code\":1,\"info\":2}',0.085758,1056,1511429396),(1010,23,1,'{\"code\":1,\"info\":2}',0.0573258,1056,1511429456),(1011,23,1,'{\"code\":1,\"info\":2}',0.0514252,1056,1511429516),(1012,23,1,'{\"code\":1,\"info\":2}',0.046761,1056,1511429576),(1013,23,1,'{\"code\":1,\"info\":2}',0.0767891,1056,1511429636),(1014,23,1,'{\"code\":1,\"info\":2}',0.0373399,1056,1511429696),(1015,23,1,'{\"code\":1,\"info\":2}',0.0943179,1056,1511429756),(1016,23,1,'{\"code\":1,\"info\":2}',0.077749,1056,1511429816),(1017,23,1,'{\"code\":1,\"info\":2}',0.0472851,1056,1511429876),(1018,23,1,'{\"code\":1,\"info\":2}',0.0350368,1056,1511429936),(1019,23,1,'{\"code\":1,\"info\":2}',0.0434339,1056,1511429996),(1020,23,1,'{\"code\":1,\"info\":2}',0.045841,1056,1511430056),(1021,23,1,'{\"code\":1,\"info\":2}',0.04001,1056,1511430116),(1022,23,1,'{\"code\":1,\"info\":2}',0.0432761,1056,1511430176),(1023,23,1,'{\"code\":1,\"info\":2}',0.09587,1056,1511430236),(1024,23,1,'{\"code\":1,\"info\":2}',0.085609,1056,1511430296),(1025,23,1,'{\"code\":1,\"info\":2}',0.0547521,1056,1511430356),(1026,23,1,'{\"code\":1,\"info\":2}',0.066668,1056,1511430416),(1027,23,1,'{\"code\":1,\"info\":2}',0.0420051,1056,1511430476),(1028,23,1,'{\"code\":1,\"info\":2}',0.0414789,1056,1511430536),(1029,23,1,'{\"code\":1,\"info\":2}',0.117476,1056,1511430596),(1030,23,1,'{\"code\":1,\"info\":2}',0.088546,1056,1511430656),(1031,23,1,'{\"code\":1,\"info\":2}',0.272617,1056,1511430717),(1032,23,1,'{\"code\":1,\"info\":2}',0.065973,1056,1511430776),(1033,23,1,'{\"code\":1,\"info\":2}',0.046711,1056,1511430836),(1034,23,1,'{\"code\":1,\"info\":2}',0.0566769,1056,1511430896),(1035,23,1,'{\"code\":1,\"info\":2}',0.043165,1056,1511430956),(1036,23,1,'{\"code\":1,\"info\":2}',0.0723929,1056,1511431016),(1037,23,1,'{\"code\":1,\"info\":2}',0.0810089,1056,1511431076),(1038,23,1,'{\"code\":1,\"info\":2}',0.0398712,1056,1511431136),(1039,23,1,'{\"code\":1,\"info\":2}',0.114943,1056,1511431196),(1040,23,1,'{\"code\":1,\"info\":2}',0.0605559,1056,1511431256),(1041,23,1,'{\"code\":1,\"info\":2}',0.106608,1056,1511431316),(1042,23,1,'{\"code\":1,\"info\":2}',0.073283,1056,1511431376),(1043,23,1,'{\"code\":1,\"info\":2}',0.112076,1056,1511431436),(1044,23,1,'{\"code\":1,\"info\":2}',0.0925541,1056,1511431496),(1045,23,1,'{\"code\":1,\"info\":2}',0.075047,1056,1511431556),(1046,23,1,'{\"code\":1,\"info\":2}',0.104772,1056,1511431616),(1047,23,1,'{\"code\":1,\"info\":2}',0.034348,1056,1511431676),(1048,23,1,'{\"code\":1,\"info\":2}',0.0423191,1056,1511431736),(1049,23,1,'{\"code\":1,\"info\":2}',0.073251,1056,1511431796),(1050,23,1,'{\"code\":1,\"info\":2}',0.082557,1056,1511431856),(1051,23,1,'{\"code\":1,\"info\":2}',0.112712,1056,1511431916),(1052,23,1,'{\"code\":1,\"info\":2}',0.0942318,1056,1511431976),(1053,23,1,'{\"code\":1,\"info\":2}',0.133102,1056,1511432036),(1054,23,1,'{\"code\":1,\"info\":2}',0.0896101,1056,1511432096),(1055,23,1,'{\"code\":1,\"info\":2}',0.054882,1056,1511432156),(1056,23,1,'{\"code\":1,\"info\":2}',0.100428,1056,1511432216),(1057,23,1,'{\"code\":1,\"info\":2}',0.0389559,1056,1511432276),(1058,23,1,'{\"code\":1,\"info\":2}',0.0382478,1056,1511432336),(1059,23,1,'{\"code\":1,\"info\":2}',0.0405469,1056,1511432396),(1060,23,1,'{\"code\":1,\"info\":2}',0.0874228,1056,1511432456),(1061,23,1,'{\"code\":1,\"info\":2}',0.112928,1056,1511432516),(1062,23,1,'{\"code\":1,\"info\":2}',0.0669179,1056,1511432576),(1063,23,1,'{\"code\":1,\"info\":2}',0.116609,1056,1511432636),(1064,23,1,'{\"code\":1,\"info\":2}',0.122104,1056,1511432696),(1065,23,1,'{\"code\":1,\"info\":2}',0.0850279,1056,1511432756),(1066,23,1,'{\"code\":1,\"info\":2}',0.0626581,1056,1511432816),(1067,23,1,'{\"code\":1,\"info\":2}',0.0346119,1056,1511432876),(1068,23,1,'{\"code\":1,\"info\":2}',0.106722,1056,1511432936),(1069,23,1,'{\"code\":1,\"info\":2}',0.0809851,1056,1511432996),(1070,23,1,'{\"code\":1,\"info\":2}',0.074512,1056,1511433056),(1071,23,1,'{\"code\":1,\"info\":2}',0.076421,1056,1511433116),(1072,23,1,'{\"code\":1,\"info\":2}',0.085861,1056,1511433176),(1073,23,1,'{\"code\":1,\"info\":2}',0.0714052,1056,1511433236),(1074,23,1,'{\"code\":1,\"info\":2}',0.0743618,1056,1511433296),(1075,23,1,'{\"code\":1,\"info\":2}',0.0429819,1056,1511433356),(1076,23,1,'{\"code\":1,\"info\":2}',0.153622,1056,1511433417),(1077,23,1,'{\"code\":1,\"info\":2}',0.041868,1056,1511433476),(1078,23,1,'{\"code\":1,\"info\":2}',0.0853369,1056,1511433536),(1079,23,1,'{\"code\":1,\"info\":2}',0.0863659,1056,1511433596),(1080,23,1,'{\"code\":1,\"info\":2}',0.0826421,1056,1511433656),(1081,23,1,'{\"code\":1,\"info\":2}',0.0529869,1056,1511433716),(1082,23,1,'{\"code\":1,\"info\":2}',0.0483398,1056,1511433776),(1083,23,1,'{\"code\":1,\"info\":2}',0.0720599,1056,1511433836),(1084,23,1,'{\"code\":1,\"info\":2}',0.113323,1056,1511433897),(1085,23,1,'{\"code\":1,\"info\":2}',0.0823941,1056,1511433956),(1086,23,1,'{\"code\":1,\"info\":2}',0.108448,1056,1511434017),(1087,23,1,'{\"code\":1,\"info\":2}',0.0809972,1056,1511434076),(1088,23,1,'{\"code\":1,\"info\":2}',0.0914218,1056,1511434136),(1089,23,1,'{\"code\":1,\"info\":2}',0.173143,1056,1511434197),(1090,23,1,'{\"code\":1,\"info\":2}',0.152648,1056,1511434257),(1091,23,1,'{\"code\":1,\"info\":2}',0.105103,1056,1511434317),(1092,23,1,'{\"code\":1,\"info\":2}',0.0950248,1056,1511434377),(1093,23,1,'{\"code\":1,\"info\":2}',0.079417,1056,1511440032),(1094,23,1,'{\"code\":1,\"info\":2}',0.097532,1056,1511440092),(1095,23,1,'{\"code\":1,\"info\":2}',0.0738039,1056,1511440152),(1096,23,1,'{\"code\":1,\"info\":2}',0.159202,1056,1511440212),(1097,23,1,'{\"code\":1,\"info\":2}',0.127309,1056,1511440272),(1098,23,1,'{\"code\":1,\"info\":2}',0.164332,1056,1511440332),(1099,23,1,'{\"code\":1,\"info\":2}',0.069236,1056,1511440392),(1100,23,1,'{\"code\":1,\"info\":2}',0.043174,1056,1511440452),(1101,23,1,'{\"code\":1,\"info\":2}',0.0850689,1056,1511440512),(1102,23,1,'{\"code\":1,\"info\":2}',0.063185,1056,1511440572),(1103,23,1,'{\"code\":1,\"info\":2}',0.055902,1056,1511440632),(1104,23,1,'{\"code\":1,\"info\":2}',0.0396369,1056,1511440692),(1105,23,1,'{\"code\":1,\"info\":2}',0.040457,1056,1511440752),(1106,23,1,'{\"code\":1,\"info\":2}',0.0690989,1056,1511440812),(1107,23,1,'{\"code\":1,\"info\":2}',0.074847,1056,1511440872),(1108,23,1,'{\"code\":1,\"info\":2}',0.038379,1056,1511440932),(1109,23,1,'{\"code\":1,\"info\":2}',0.0369349,1056,1511440992),(1110,23,1,'{\"code\":1,\"info\":2}',0.0359268,1056,1511441052),(1111,23,1,'{\"code\":1,\"info\":2}',0.037549,1056,1511441112),(1112,23,1,'{\"code\":1,\"info\":2}',0.0369458,1056,1511441172),(1113,23,1,'{\"code\":1,\"info\":2}',0.0368609,1056,1511441232),(1114,23,1,'{\"code\":1,\"info\":2}',0.0362308,1056,1511441292),(1115,23,1,'{\"code\":1,\"info\":2}',0.0372531,1056,1511441352),(1116,23,1,'{\"code\":1,\"info\":2}',0.036602,1056,1511441412),(1117,23,1,'{\"code\":1,\"info\":2}',0.037735,1056,1511441472),(1118,23,1,'{\"code\":1,\"info\":2}',0.039643,1056,1511441532),(1119,23,1,'{\"code\":1,\"info\":2}',0.034893,1056,1511441592),(1120,23,1,'{\"code\":1,\"info\":2}',0.0362351,1056,1511441652),(1121,23,1,'{\"code\":1,\"info\":2}',0.0386,1056,1511441712),(1122,23,1,'{\"code\":1,\"info\":2}',0.037329,1056,1511441772),(1123,23,1,'{\"code\":1,\"info\":2}',0.0374589,1056,1511441832),(1124,23,1,'{\"code\":1,\"info\":2}',0.036649,1056,1511441892),(1125,23,1,'{\"code\":1,\"info\":2}',0.0369911,1056,1511441952),(1126,23,1,'{\"code\":1,\"info\":2}',0.036974,1056,1511442012),(1127,23,1,'{\"code\":1,\"info\":2}',0.0372419,1056,1511442072),(1128,23,1,'{\"code\":1,\"info\":2}',0.0379949,1056,1511442132),(1129,23,1,'{\"code\":1,\"info\":2}',0.0372419,1056,1511442192),(1130,23,1,'{\"code\":1,\"info\":2}',0.0371211,1056,1511442252),(1131,23,1,'{\"code\":1,\"info\":2}',0.037431,1056,1511442312),(1132,23,1,'{\"code\":1,\"info\":2}',0.0725541,1056,1511442372),(1133,23,1,'{\"code\":1,\"info\":2}',0.107477,1056,1511442432),(1134,23,1,'{\"code\":1,\"info\":2}',0.08477,1056,1511442492),(1135,23,1,'{\"code\":1,\"info\":2}',0.037889,1056,1511442552),(1136,23,1,'{\"code\":1,\"info\":2}',0.037904,1056,1511442612),(1137,23,1,'{\"code\":1,\"info\":2}',0.0366681,1056,1511442672),(1138,23,1,'{\"code\":1,\"info\":2}',0.036782,1056,1511442732),(1139,23,1,'{\"code\":1,\"info\":2}',0.0371571,1056,1511442792),(1140,23,1,'{\"code\":1,\"info\":2}',0.318441,1056,1511444050),(1141,23,1,'{\"code\":1,\"info\":2}',0.037725,1056,1511445003),(1142,23,1,'{\"code\":1,\"info\":2}',0.224557,1056,1511446311),(1143,23,1,'{\"code\":1,\"info\":2}',0.0710008,1056,1511446928),(1144,23,1,'{\"code\":1,\"info\":2}',0.264525,1056,1511448103),(1145,23,1,'{\"code\":1,\"info\":2}',0.0335009,1056,1511449276),(1146,23,1,'{\"code\":1,\"info\":2}',0.036993,1056,1511449893),(1147,23,1,'{\"code\":1,\"info\":2}',0.0383639,1056,1511451067),(1148,23,1,'{\"code\":1,\"info\":2}',0.037075,1056,1511451684),(1149,23,1,'{\"code\":1,\"info\":2}',0.075099,1056,1511452857),(1150,23,1,'{\"code\":1,\"info\":2}',0.0370479,1056,1511453474),(1151,23,1,'{\"code\":1,\"info\":2}',0.789303,1056,1511454250),(1152,23,1,'{\"code\":1,\"info\":2}',0.371869,1056,1511454870),(1153,23,1,'{\"code\":1,\"info\":2}',0.610466,1056,1511456050),(1154,23,1,'{\"code\":1,\"info\":2}',0.862398,1056,1511463288),(1155,23,1,'{\"code\":1,\"info\":2}',0.383693,1056,1511463908),(1156,23,1,'{\"code\":1,\"info\":2}',0.788272,1056,1511465090),(1157,23,1,'{\"code\":1,\"info\":2}',0.338105,1056,1511465710),(1158,23,1,'{\"code\":1,\"info\":2}',0.470684,1056,1511466891),(1159,23,1,'{\"code\":1,\"info\":2}',0.274862,1056,1511467512),(1160,23,1,'{\"code\":1,\"info\":2}',1.25963,1056,1511468695),(1161,23,1,'{\"code\":1,\"info\":2}',0.469868,1056,1511469315),(1162,23,1,'{\"code\":1,\"info\":2}',2.03087,1056,1511470501),(1163,23,1,'{\"code\":1,\"info\":2}',0.365719,1056,1511471121),(1164,23,1,'{\"code\":1,\"info\":2}',0.402077,1056,1511471742),(1165,23,1,'{\"code\":1,\"info\":2}',0.706166,1056,1511472923),(1166,23,1,'{\"code\":1,\"info\":2}',0.544264,1056,1511473544),(1167,23,1,'{\"code\":1,\"info\":2}',0.841997,1056,1511474726),(1168,23,1,'{\"code\":1,\"info\":2}',0.385057,1056,1511475345),(1169,23,1,'{\"code\":1,\"info\":2}',0.381722,1056,1511476526),(1170,23,1,'{\"code\":1,\"info\":2}',1.03001,1056,1511477148),(1171,23,1,'{\"code\":1,\"info\":2}',1.80319,1056,1511478330),(1172,23,1,'{\"code\":1,\"info\":2}',0.351115,1056,1511478949),(1173,23,1,'{\"code\":1,\"info\":2}',1.38581,1056,1511480135),(1174,23,1,'{\"code\":1,\"info\":2}',0.48622,1056,1511480755),(1175,23,1,'{\"code\":1,\"info\":2}',0.160792,1056,1511481375),(1176,23,1,'{\"code\":1,\"info\":2}',0.857462,1056,1511482557),(1177,23,1,'{\"code\":1,\"info\":2}',0.336971,1056,1511483177),(1178,23,1,'{\"code\":1,\"info\":2}',0.701298,1056,1511484359),(1179,23,1,'{\"code\":1,\"info\":2}',0.514993,1056,1511484980),(1180,23,1,'{\"code\":1,\"info\":2}',1.47357,1056,1511486095),(1181,23,1,'{\"code\":1,\"info\":2}',0.0702031,1056,1511849853),(1182,23,1,'{\"code\":1,\"info\":2}',0.136022,1056,1511849914),(1183,23,1,'{\"code\":1,\"info\":2}',0.073164,1056,1511849973),(1184,23,1,'{\"code\":1,\"info\":2}',0.081058,1056,1511850033),(1185,23,1,'{\"code\":1,\"info\":2}',0.0823081,1056,1511850093),(1186,23,1,'{\"code\":1,\"info\":2}',0.0431681,1056,1511851756),(1187,23,1,'{\"code\":1,\"info\":2}',0.047256,1056,1511851816),(1188,23,1,'{\"code\":1,\"info\":2}',0.040566,1056,1511851876),(1189,23,1,'{\"code\":1,\"info\":2}',0.0353699,1056,1511851936),(1190,23,1,'{\"code\":1,\"info\":2}',0.0384719,1056,1511851996),(1191,23,1,'{\"code\":1,\"info\":2}',0.041414,1056,1511852056),(1192,23,1,'{\"code\":1,\"info\":2}',0.0397429,1056,1511852116),(1193,23,1,'{\"code\":1,\"info\":2}',0.042021,1056,1511852176),(1194,23,1,'{\"code\":1,\"info\":2}',0.039969,1056,1511852236),(1195,23,1,'{\"code\":1,\"info\":2}',0.048156,1056,1511852296),(1196,23,1,'{\"code\":1,\"info\":2}',0.0394821,1056,1511852356),(1197,23,1,'{\"code\":1,\"info\":2}',0.0417089,1056,1511852416),(1198,23,1,'{\"code\":1,\"info\":2}',0.0945909,1056,1511854694),(1199,23,1,'{\"code\":1,\"info\":2}',0.04563,1056,1511855009),(1200,23,1,'{\"code\":1,\"info\":2}',0.0456431,1056,1511855123),(1201,23,1,'{\"code\":1,\"info\":2}',0.04494,1056,1511855183),(1202,23,1,'{\"code\":1,\"info\":2}',0.182185,1056,1511855243),(1203,23,1,'{\"code\":1,\"info\":2}',0.0453749,1056,1511926413),(1204,23,1,'{\"code\":1,\"info\":2}',0.056495,1056,1511926473),(1205,23,1,'{\"code\":1,\"info\":2}',0.080364,1056,1511926533),(1206,23,1,'{\"code\":1,\"info\":2}',0.069885,1056,1511926593),(1207,23,1,'{\"code\":1,\"info\":2}',0.0758379,1056,1511926653),(1208,23,1,'{\"code\":1,\"info\":2}',0.0401399,1056,1511926713),(1209,23,1,'{\"code\":1,\"info\":2}',0.0408559,1056,1511926773),(1210,23,1,'{\"code\":1,\"info\":2}',0.0419888,1056,1511926833),(1211,23,1,'{\"code\":1,\"info\":2}',0.037015,1056,1511926893),(1212,23,1,'{\"code\":1,\"info\":2}',0.0437109,1056,1511926953),(1213,23,1,'{\"code\":1,\"info\":2}',0.0417061,1056,1511927013),(1214,23,1,'{\"code\":1,\"info\":2}',0.0416119,1056,1511927073),(1215,23,1,'{\"code\":1,\"info\":2}',0.048604,1056,1511927133),(1216,23,1,'{\"code\":1,\"info\":2}',0.05931,1056,1511927193),(1217,23,1,'{\"code\":1,\"info\":2}',0.062562,1056,1511927253),(1218,23,1,'{\"code\":1,\"info\":2}',0.070081,1056,1511927313),(1219,23,1,'{\"code\":1,\"info\":2}',0.0689309,1056,1511927373),(1220,23,1,'{\"code\":1,\"info\":2}',0.0902081,1056,1511927433),(1221,23,1,'{\"code\":1,\"info\":2}',0.198599,1056,1511927493),(1222,23,1,'{\"code\":1,\"info\":2}',0.0407059,1056,1511927795),(1223,23,1,'{\"code\":1,\"info\":2}',0.0645659,1056,1511927855),(1224,23,1,'{\"code\":1,\"info\":2}',0.0357358,1056,1511927915),(1225,23,1,'{\"code\":1,\"info\":2}',0.0414689,1056,1511927975);
/*!40000 ALTER TABLE `t_cron_log_G` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_H`
--

DROP TABLE IF EXISTS `t_cron_log_H`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_H` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_H`
--

LOCK TABLES `t_cron_log_H` WRITE;
/*!40000 ALTER TABLE `t_cron_log_H` DISABLE KEYS */;
INSERT INTO `t_cron_log_H` VALUES (1,12,1,'{\"code\":1,\"info\":17587}',0.129746,544,1461868247),(2,12,1,'{\"code\":1,\"info\":10828}',0.150774,544,1461954636),(3,12,1,'{\"code\":1,\"info\":13534}',0.113525,544,1462041024),(4,12,1,'{\"code\":1,\"info\":10708}',0.113744,544,1462127411),(5,12,1,'{\"code\":1,\"info\":13646}',0.138839,544,1462213856),(6,12,1,'{\"code\":1,\"info\":11075}',0.471775,544,1462300242),(7,12,1,'{\"code\":1,\"info\":15245}',0.0934451,544,1462386627),(8,12,1,'{\"code\":1,\"info\":12172}',0.441084,544,1462473014),(9,12,1,'{\"code\":1,\"info\":10403}',0.160736,544,1462559455),(10,12,1,'{\"code\":1,\"info\":15044}',0.118175,544,1462645840);
/*!40000 ALTER TABLE `t_cron_log_H` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_I`
--

DROP TABLE IF EXISTS `t_cron_log_I`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_I` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_I`
--

LOCK TABLES `t_cron_log_I` WRITE;
/*!40000 ALTER TABLE `t_cron_log_I` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_I` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_J`
--

DROP TABLE IF EXISTS `t_cron_log_J`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_J` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_J`
--

LOCK TABLES `t_cron_log_J` WRITE;
/*!40000 ALTER TABLE `t_cron_log_J` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_J` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_K`
--

DROP TABLE IF EXISTS `t_cron_log_K`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_K` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_K`
--

LOCK TABLES `t_cron_log_K` WRITE;
/*!40000 ALTER TABLE `t_cron_log_K` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_K` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_L`
--

DROP TABLE IF EXISTS `t_cron_log_L`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_L` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_L`
--

LOCK TABLES `t_cron_log_L` WRITE;
/*!40000 ALTER TABLE `t_cron_log_L` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_L` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_M`
--

DROP TABLE IF EXISTS `t_cron_log_M`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_M` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_M`
--

LOCK TABLES `t_cron_log_M` WRITE;
/*!40000 ALTER TABLE `t_cron_log_M` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_M` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_N`
--

DROP TABLE IF EXISTS `t_cron_log_N`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_N` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_N`
--

LOCK TABLES `t_cron_log_N` WRITE;
/*!40000 ALTER TABLE `t_cron_log_N` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_N` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_O`
--

DROP TABLE IF EXISTS `t_cron_log_O`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_O` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_O`
--

LOCK TABLES `t_cron_log_O` WRITE;
/*!40000 ALTER TABLE `t_cron_log_O` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_O` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_P`
--

DROP TABLE IF EXISTS `t_cron_log_P`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_P` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_P`
--

LOCK TABLES `t_cron_log_P` WRITE;
/*!40000 ALTER TABLE `t_cron_log_P` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_P` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_Q`
--

DROP TABLE IF EXISTS `t_cron_log_Q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_Q` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_Q`
--

LOCK TABLES `t_cron_log_Q` WRITE;
/*!40000 ALTER TABLE `t_cron_log_Q` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_Q` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_R`
--

DROP TABLE IF EXISTS `t_cron_log_R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_R` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_R`
--

LOCK TABLES `t_cron_log_R` WRITE;
/*!40000 ALTER TABLE `t_cron_log_R` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_R` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_S`
--

DROP TABLE IF EXISTS `t_cron_log_S`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_S` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1263 DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_S`
--

LOCK TABLES `t_cron_log_S` WRITE;
/*!40000 ALTER TABLE `t_cron_log_S` DISABLE KEYS */;
INSERT INTO `t_cron_log_S` VALUES (1,26,1,'{\"code\":1,\"info\":2}',0.0721478,1056,1511851697),(2,26,1,'{\"code\":1,\"info\":2}',0.044462,1056,1511851698),(3,26,1,'{\"code\":1,\"info\":2}',0.0955622,1056,1511851699),(4,26,1,'{\"code\":1,\"info\":2}',0.043432,1056,1511851700),(5,26,1,'{\"code\":1,\"info\":2}',0.0513289,1056,1511851701),(6,26,1,'{\"code\":1,\"info\":2}',0.0391898,1056,1511851702),(7,26,1,'{\"code\":1,\"info\":2}',0.0412891,1056,1511851703),(8,26,1,'{\"code\":1,\"info\":2}',0.044452,1056,1511851704),(9,26,1,'{\"code\":1,\"info\":2}',0.040781,1056,1511851704),(10,26,1,'{\"code\":1,\"info\":2}',0.0387261,1056,1511851705),(11,26,1,'{\"code\":1,\"info\":2}',0.0362611,1056,1511851706),(12,26,1,'{\"code\":1,\"info\":2}',0.040283,1056,1511851707),(13,26,1,'{\"code\":1,\"info\":2}',0.0439749,1056,1511851708),(14,26,1,'{\"code\":1,\"info\":2}',0.050343,1056,1511851709),(15,26,1,'{\"code\":1,\"info\":2}',0.04584,1056,1511851710),(16,26,1,'{\"code\":1,\"info\":2}',0.0601749,1056,1511851711),(17,26,1,'{\"code\":1,\"info\":2}',0.047693,1056,1511851712),(18,26,1,'{\"code\":1,\"info\":2}',0.0369852,1056,1511851713),(19,26,1,'{\"code\":1,\"info\":2}',0.0376229,1056,1511851713),(20,26,1,'{\"code\":1,\"info\":2}',0.0604849,1056,1511851714),(21,26,1,'{\"code\":1,\"info\":2}',0.080565,1056,1511851715),(22,26,1,'{\"code\":1,\"info\":2}',0.042444,1056,1511851716),(23,26,1,'{\"code\":1,\"info\":2}',0.0426509,1056,1511851717),(24,26,1,'{\"code\":1,\"info\":2}',0.0416198,1056,1511851718),(25,26,1,'{\"code\":1,\"info\":2}',0.044174,1056,1511851719),(26,26,1,'{\"code\":1,\"info\":2}',0.042671,1056,1511851720),(27,26,1,'{\"code\":1,\"info\":2}',0.047334,1056,1511851721),(28,26,1,'{\"code\":1,\"info\":2}',0.101342,1056,1511851722),(29,26,1,'{\"code\":1,\"info\":2}',0.0546908,1056,1511851722),(30,26,1,'{\"code\":1,\"info\":2}',0.045759,1056,1511851723),(31,26,1,'{\"code\":1,\"info\":2}',0.0569069,1056,1511851724),(32,26,1,'{\"code\":1,\"info\":2}',0.074631,1056,1511851725),(33,26,1,'{\"code\":1,\"info\":2}',0.038028,1056,1511851726),(34,26,1,'{\"code\":1,\"info\":2}',0.042207,1056,1511851727),(35,26,1,'{\"code\":1,\"info\":2}',0.0413661,1056,1511851728),(36,26,1,'{\"code\":1,\"info\":2}',0.0421541,1056,1511851729),(37,26,1,'{\"code\":1,\"info\":2}',0.0727608,1056,1511851730),(38,26,1,'{\"code\":1,\"info\":2}',0.0448229,1056,1511851731),(39,26,1,'{\"code\":1,\"info\":2}',0.183616,1056,1511851732),(40,26,1,'{\"code\":1,\"info\":2}',0.0465152,1056,1511851732),(41,26,1,'{\"code\":1,\"info\":2}',0.0475841,1056,1511851733),(42,26,1,'{\"code\":1,\"info\":2}',0.0623839,1056,1511851734),(43,26,1,'{\"code\":1,\"info\":2}',0.0467801,1056,1511851735),(44,26,1,'{\"code\":1,\"info\":2}',0.041914,1056,1511851736),(45,26,1,'{\"code\":1,\"info\":2}',0.041517,1056,1511851737),(46,26,1,'{\"code\":1,\"info\":2}',0.125204,1056,1511851738),(47,26,1,'{\"code\":1,\"info\":2}',0.0455279,1056,1511851739),(48,26,1,'{\"code\":1,\"info\":2}',0.0514491,1056,1511851740),(49,26,1,'{\"code\":1,\"info\":2}',0.04422,1056,1511851740),(50,26,1,'{\"code\":1,\"info\":2}',0.0467761,1056,1511851741),(51,26,1,'{\"code\":1,\"info\":2}',0.0448961,1056,1511851742),(52,26,1,'{\"code\":1,\"info\":2}',0.0423112,1056,1511851743),(53,26,1,'{\"code\":1,\"info\":2}',0.0451329,1056,1511851744),(54,26,1,'{\"code\":1,\"info\":2}',0.0458169,1056,1511851745),(55,26,1,'{\"code\":1,\"info\":2}',0.047961,1056,1511851746),(56,26,1,'{\"code\":1,\"info\":2}',0.0410469,1056,1511851747),(57,26,1,'{\"code\":1,\"info\":2}',0.04004,1056,1511851748),(58,26,1,'{\"code\":1,\"info\":2}',0.0433831,1056,1511851749),(59,26,1,'{\"code\":1,\"info\":2}',0.039623,1056,1511851749),(60,26,1,'{\"code\":1,\"info\":2}',0.0449069,1056,1511851750),(61,26,1,'{\"code\":1,\"info\":2}',0.043905,1056,1511851751),(62,26,1,'{\"code\":1,\"info\":2}',0.0428829,1056,1511851752),(63,26,1,'{\"code\":1,\"info\":2}',0.0452979,1056,1511851753),(64,26,1,'{\"code\":1,\"info\":2}',0.041384,1056,1511851754),(65,26,1,'{\"code\":1,\"info\":2}',0.0423701,1056,1511851755),(66,26,1,'{\"code\":1,\"info\":2}',0.037981,1056,1511851756),(67,26,1,'{\"code\":1,\"info\":2}',0.04229,1056,1511851757),(68,26,1,'{\"code\":1,\"info\":2}',0.041573,1056,1511851758),(69,26,1,'{\"code\":1,\"info\":2}',0.0403709,1056,1511851758),(70,26,1,'{\"code\":1,\"info\":2}',0.0447838,1056,1511851759),(71,26,1,'{\"code\":1,\"info\":2}',0.0403991,1056,1511851760),(72,26,1,'{\"code\":1,\"info\":2}',0.041815,1056,1511851761),(73,26,1,'{\"code\":1,\"info\":2}',0.0412078,1056,1511851762),(74,26,1,'{\"code\":1,\"info\":2}',0.040755,1056,1511851763),(75,26,1,'{\"code\":1,\"info\":2}',0.0451689,1056,1511851764),(76,26,1,'{\"code\":1,\"info\":2}',0.0450659,1056,1511851765),(77,26,1,'{\"code\":1,\"info\":2}',0.0444429,1056,1511851766),(78,26,1,'{\"code\":1,\"info\":2}',0.044991,1056,1511851767),(79,26,1,'{\"code\":1,\"info\":2}',0.043644,1056,1511851767),(80,26,1,'{\"code\":1,\"info\":2}',0.038063,1056,1511851768),(81,26,1,'{\"code\":1,\"info\":2}',0.0486169,1056,1511851769),(82,26,1,'{\"code\":1,\"info\":2}',0.045289,1056,1511851770),(83,26,1,'{\"code\":1,\"info\":2}',0.0432329,1056,1511851771),(84,26,1,'{\"code\":1,\"info\":2}',0.0479791,1056,1511851772),(85,26,1,'{\"code\":1,\"info\":2}',0.0468102,1056,1511851773),(86,26,1,'{\"code\":1,\"info\":2}',0.0357831,1056,1511851774),(87,26,1,'{\"code\":1,\"info\":2}',0.0668502,1056,1511851775),(88,26,1,'{\"code\":1,\"info\":2}',0.086792,1056,1511851776),(89,26,1,'{\"code\":1,\"info\":2}',0.0479519,1056,1511851776),(90,26,1,'{\"code\":1,\"info\":2}',0.0425711,1056,1511851777),(91,26,1,'{\"code\":1,\"info\":2}',0.05003,1056,1511851778),(92,26,1,'{\"code\":1,\"info\":2}',0.0483,1056,1511851779),(93,26,1,'{\"code\":1,\"info\":2}',0.0404949,1056,1511851780),(94,26,1,'{\"code\":1,\"info\":2}',0.0409949,1056,1511851781),(95,26,1,'{\"code\":1,\"info\":2}',0.0454831,1056,1511851782),(96,26,1,'{\"code\":1,\"info\":2}',0.0570099,1056,1511851783),(97,26,1,'{\"code\":1,\"info\":2}',0.0649121,1056,1511851784),(98,26,1,'{\"code\":1,\"info\":2}',0.0466309,1056,1511851785),(99,26,1,'{\"code\":1,\"info\":2}',0.04649,1056,1511851785),(100,26,1,'{\"code\":1,\"info\":2}',0.0460329,1056,1511851786),(101,26,1,'{\"code\":1,\"info\":2}',0.0459509,1056,1511851787),(102,26,1,'{\"code\":1,\"info\":2}',0.0428479,1056,1511851788),(103,26,1,'{\"code\":1,\"info\":2}',0.041127,1056,1511851789),(104,26,1,'{\"code\":1,\"info\":2}',0.0625908,1056,1511851790),(105,26,1,'{\"code\":1,\"info\":2}',0.0509892,1056,1511851791),(106,26,1,'{\"code\":1,\"info\":2}',0.086838,1056,1511851792),(107,26,1,'{\"code\":1,\"info\":2}',0.0412209,1056,1511851793),(108,26,1,'{\"code\":1,\"info\":2}',0.0395551,1056,1511851794),(109,26,1,'{\"code\":1,\"info\":2}',0.0414491,1056,1511851794),(110,26,1,'{\"code\":1,\"info\":2}',0.053283,1056,1511851795),(111,26,1,'{\"code\":1,\"info\":2}',0.0493701,1056,1511851796),(112,26,1,'{\"code\":1,\"info\":2}',0.042088,1056,1511851797),(113,26,1,'{\"code\":1,\"info\":2}',0.0461929,1056,1511851798),(114,26,1,'{\"code\":1,\"info\":2}',0.0454299,1056,1511851799),(115,26,1,'{\"code\":1,\"info\":2}',0.04282,1056,1511851800),(116,26,1,'{\"code\":1,\"info\":2}',0.0604379,1056,1511851801),(117,26,1,'{\"code\":1,\"info\":2}',0.037328,1056,1511851802),(118,26,1,'{\"code\":1,\"info\":2}',0.069881,1056,1511851803),(119,26,1,'{\"code\":1,\"info\":2}',0.0412209,1056,1511851803),(120,26,1,'{\"code\":1,\"info\":2}',0.0535021,1056,1511851804),(121,26,1,'{\"code\":1,\"info\":2}',0.0468931,1056,1511851805),(122,26,1,'{\"code\":1,\"info\":2}',0.0411839,1056,1511851806),(123,26,1,'{\"code\":1,\"info\":2}',0.0459371,1056,1511851807),(124,26,1,'{\"code\":1,\"info\":2}',0.0424891,1056,1511851808),(125,26,1,'{\"code\":1,\"info\":2}',0.0392449,1056,1511851809),(126,26,1,'{\"code\":1,\"info\":2}',0.0436702,1056,1511851810),(127,26,1,'{\"code\":1,\"info\":2}',0.0374119,1056,1511851811),(128,26,1,'{\"code\":1,\"info\":2}',0.0417831,1056,1511851812),(129,26,1,'{\"code\":1,\"info\":2}',0.050298,1056,1511851813),(130,26,1,'{\"code\":1,\"info\":2}',0.0404358,1056,1511851813),(131,26,1,'{\"code\":1,\"info\":2}',0.043011,1056,1511851814),(132,26,1,'{\"code\":1,\"info\":2}',0.039809,1056,1511851815),(133,26,1,'{\"code\":1,\"info\":2}',0.109442,1056,1511851816),(134,26,1,'{\"code\":1,\"info\":2}',0.0421569,1056,1511851817),(135,26,1,'{\"code\":1,\"info\":2}',0.040132,1056,1511851818),(136,26,1,'{\"code\":1,\"info\":2}',0.0432329,1056,1511851819),(137,26,1,'{\"code\":1,\"info\":2}',0.0440099,1056,1511851820),(138,26,1,'{\"code\":1,\"info\":2}',0.0392699,1056,1511851821),(139,26,1,'{\"code\":1,\"info\":2}',0.041271,1056,1511851822),(140,26,1,'{\"code\":1,\"info\":2}',0.0426838,1056,1511851822),(141,26,1,'{\"code\":1,\"info\":2}',0.0499129,1056,1511851823),(142,26,1,'{\"code\":1,\"info\":2}',0.045279,1056,1511851824),(143,26,1,'{\"code\":1,\"info\":2}',0.0481861,1056,1511851825),(144,26,1,'{\"code\":1,\"info\":2}',0.110712,1056,1511851826),(145,26,1,'{\"code\":1,\"info\":2}',0.044368,1056,1511851827),(146,26,1,'{\"code\":1,\"info\":2}',0.040345,1056,1511851828),(147,26,1,'{\"code\":1,\"info\":2}',0.0402,1056,1511851829),(148,26,1,'{\"code\":1,\"info\":2}',0.0494339,1056,1511851830),(149,26,1,'{\"code\":1,\"info\":2}',0.0379961,1056,1511851831),(150,26,1,'{\"code\":1,\"info\":2}',0.0628638,1056,1511851831),(151,26,1,'{\"code\":1,\"info\":2}',0.101065,1056,1511851832),(152,26,1,'{\"code\":1,\"info\":2}',0.0462489,1056,1511851833),(153,26,1,'{\"code\":1,\"info\":2}',0.0507059,1056,1511851834),(154,26,1,'{\"code\":1,\"info\":2}',0.0408318,1056,1511851835),(155,26,1,'{\"code\":1,\"info\":2}',0.03794,1056,1511851836),(156,26,1,'{\"code\":1,\"info\":2}',0.0399771,1056,1511851837),(157,26,1,'{\"code\":1,\"info\":2}',0.0411229,1056,1511851838),(158,26,1,'{\"code\":1,\"info\":2}',0.0325289,1056,1511851839),(159,26,1,'{\"code\":1,\"info\":2}',0.0392232,1056,1511851840),(160,26,1,'{\"code\":1,\"info\":2}',0.0361221,1056,1511851840),(161,26,1,'{\"code\":1,\"info\":2}',0.0401402,1056,1511851841),(162,26,1,'{\"code\":1,\"info\":2}',0.082761,1056,1511851842),(163,26,1,'{\"code\":1,\"info\":2}',0.0508769,1056,1511851843),(164,26,1,'{\"code\":1,\"info\":2}',0.038501,1056,1511851844),(165,26,1,'{\"code\":1,\"info\":2}',0.04654,1056,1511851845),(166,26,1,'{\"code\":1,\"info\":2}',0.0531888,1056,1511851846),(167,26,1,'{\"code\":1,\"info\":2}',0.0402939,1056,1511851847),(168,26,1,'{\"code\":1,\"info\":2}',0.0392251,1056,1511851848),(169,26,1,'{\"code\":1,\"info\":2}',0.0397532,1056,1511851849),(170,26,1,'{\"code\":1,\"info\":2}',0.0375409,1056,1511851849),(171,26,1,'{\"code\":1,\"info\":2}',0.036768,1056,1511851850),(172,26,1,'{\"code\":1,\"info\":2}',0.0397761,1056,1511851851),(173,26,1,'{\"code\":1,\"info\":2}',0.0384121,1056,1511851852),(174,26,1,'{\"code\":1,\"info\":2}',0.0435421,1056,1511851853),(175,26,1,'{\"code\":1,\"info\":2}',0.0410769,1056,1511851854),(176,26,1,'{\"code\":1,\"info\":2}',0.0420148,1056,1511851855),(177,26,1,'{\"code\":1,\"info\":2}',0.0406229,1056,1511851856),(178,26,1,'{\"code\":1,\"info\":2}',0.0435801,1056,1511851857),(179,26,1,'{\"code\":1,\"info\":2}',0.049716,1056,1511851858),(180,26,1,'{\"code\":1,\"info\":2}',0.042897,1056,1511851858),(181,26,1,'{\"code\":1,\"info\":2}',0.0431778,1056,1511851859),(182,26,1,'{\"code\":1,\"info\":2}',0.116942,1056,1511851860),(183,26,1,'{\"code\":1,\"info\":2}',0.0430171,1056,1511851861),(184,26,1,'{\"code\":1,\"info\":2}',0.046504,1056,1511851862),(185,26,1,'{\"code\":1,\"info\":2}',0.0407889,1056,1511851863),(186,26,1,'{\"code\":1,\"info\":2}',0.0763311,1056,1511851864),(187,26,1,'{\"code\":1,\"info\":2}',0.0456822,1056,1511851865),(188,26,1,'{\"code\":1,\"info\":2}',0.0688579,1056,1511851866),(189,26,1,'{\"code\":1,\"info\":2}',0.0429111,1056,1511851867),(190,26,1,'{\"code\":1,\"info\":2}',0.0420291,1056,1511851867),(191,26,1,'{\"code\":1,\"info\":2}',0.0420239,1056,1511851868),(192,26,1,'{\"code\":1,\"info\":2}',0.039978,1056,1511851869),(193,26,1,'{\"code\":1,\"info\":2}',0.041127,1056,1511851870),(194,26,1,'{\"code\":1,\"info\":2}',0.0411568,1056,1511851871),(195,26,1,'{\"code\":1,\"info\":2}',0.0431352,1056,1511851872),(196,26,1,'{\"code\":1,\"info\":2}',0.0405741,1056,1511851873),(197,26,1,'{\"code\":1,\"info\":2}',0.040997,1056,1511851874),(198,26,1,'{\"code\":1,\"info\":2}',0.0369689,1056,1511851875),(199,26,1,'{\"code\":1,\"info\":2}',0.0405281,1056,1511851876),(200,26,1,'{\"code\":1,\"info\":2}',0.0409808,1056,1511851876),(201,26,1,'{\"code\":1,\"info\":2}',0.041415,1056,1511851877),(202,26,1,'{\"code\":1,\"info\":2}',0.0696559,1056,1511851878),(203,26,1,'{\"code\":1,\"info\":2}',0.035279,1056,1511851879),(204,26,1,'{\"code\":1,\"info\":2}',0.0438981,1056,1511851880),(205,26,1,'{\"code\":1,\"info\":2}',0.0411532,1056,1511851881),(206,26,1,'{\"code\":1,\"info\":2}',0.0410471,1056,1511851882),(207,26,1,'{\"code\":1,\"info\":2}',0.0421572,1056,1511851883),(208,26,1,'{\"code\":1,\"info\":2}',0.0415521,1056,1511851884),(209,26,1,'{\"code\":1,\"info\":2}',0.0412529,1056,1511851885),(210,26,1,'{\"code\":1,\"info\":2}',0.0452201,1056,1511851885),(211,26,1,'{\"code\":1,\"info\":2}',0.0413921,1056,1511851886),(212,26,1,'{\"code\":1,\"info\":2}',0.0410941,1056,1511851887),(213,26,1,'{\"code\":1,\"info\":2}',0.0407012,1056,1511851888),(214,26,1,'{\"code\":1,\"info\":2}',0.0445859,1056,1511851889),(215,26,1,'{\"code\":1,\"info\":2}',0.0392041,1056,1511851890),(216,26,1,'{\"code\":1,\"info\":2}',0.102658,1056,1511851891),(217,26,1,'{\"code\":1,\"info\":2}',0.0409601,1056,1511851892),(218,26,1,'{\"code\":1,\"info\":2}',0.0398679,1056,1511851893),(219,26,1,'{\"code\":1,\"info\":2}',0.0400259,1056,1511851894),(220,26,1,'{\"code\":1,\"info\":2}',0.0407441,1056,1511851894),(221,26,1,'{\"code\":1,\"info\":2}',0.0400431,1056,1511851895),(222,26,1,'{\"code\":1,\"info\":2}',0.039726,1056,1511851896),(223,26,1,'{\"code\":1,\"info\":2}',0.0404849,1056,1511851897),(224,26,1,'{\"code\":1,\"info\":2}',0.0456641,1056,1511851898),(225,26,1,'{\"code\":1,\"info\":2}',0.107256,1056,1511851899),(226,26,1,'{\"code\":1,\"info\":2}',0.041482,1056,1511851900),(227,26,1,'{\"code\":1,\"info\":2}',0.041271,1056,1511851901),(228,26,1,'{\"code\":1,\"info\":2}',0.041209,1056,1511851902),(229,26,1,'{\"code\":1,\"info\":2}',0.040941,1056,1511851903),(230,26,1,'{\"code\":1,\"info\":2}',0.0419128,1056,1511851903),(231,26,1,'{\"code\":1,\"info\":2}',0.041487,1056,1511851904),(232,26,1,'{\"code\":1,\"info\":2}',0.0421269,1056,1511851905),(233,26,1,'{\"code\":1,\"info\":2}',0.041682,1056,1511851906),(234,26,1,'{\"code\":1,\"info\":2}',0.0408962,1056,1511851907),(235,26,1,'{\"code\":1,\"info\":2}',0.0406332,1056,1511851908),(236,26,1,'{\"code\":1,\"info\":2}',0.0418291,1056,1511851909),(237,26,1,'{\"code\":1,\"info\":2}',0.0412579,1056,1511851910),(238,26,1,'{\"code\":1,\"info\":2}',0.0401819,1056,1511851911),(239,26,1,'{\"code\":1,\"info\":2}',0.0396688,1056,1511851912),(240,26,1,'{\"code\":1,\"info\":2}',0.0562429,1056,1511851913),(241,26,1,'{\"code\":1,\"info\":2}',0.0442381,1056,1511851913),(242,26,1,'{\"code\":1,\"info\":2}',0.100328,1056,1511851914),(243,26,1,'{\"code\":1,\"info\":2}',0.035419,1056,1511851915),(244,26,1,'{\"code\":1,\"info\":2}',0.0433931,1056,1511851916),(245,26,1,'{\"code\":1,\"info\":2}',0.0503631,1056,1511851917),(246,26,1,'{\"code\":1,\"info\":2}',0.0554602,1056,1511851918),(247,26,1,'{\"code\":1,\"info\":2}',0.0601051,1056,1511851919),(248,26,1,'{\"code\":1,\"info\":2}',0.041724,1056,1511851920),(249,26,1,'{\"code\":1,\"info\":2}',0.0596809,1056,1511851921),(250,26,1,'{\"code\":1,\"info\":2}',0.0418439,1056,1511851922),(251,26,1,'{\"code\":1,\"info\":2}',0.0428491,1056,1511851922),(252,26,1,'{\"code\":1,\"info\":2}',0.054563,1056,1511851923),(253,26,1,'{\"code\":1,\"info\":2}',0.04269,1056,1511851924),(254,26,1,'{\"code\":1,\"info\":2}',0.040844,1056,1511851925),(255,26,1,'{\"code\":1,\"info\":2}',0.0390191,1056,1511851926),(256,26,1,'{\"code\":1,\"info\":2}',0.0369411,1056,1511851927),(257,26,1,'{\"code\":1,\"info\":2}',0.0366719,1056,1511851928),(258,26,1,'{\"code\":1,\"info\":2}',0.0350242,1056,1511851929),(259,26,1,'{\"code\":1,\"info\":2}',0.0365832,1056,1511851930),(260,26,1,'{\"code\":1,\"info\":2}',0.0343938,1056,1511851931),(261,26,1,'{\"code\":1,\"info\":2}',0.0330729,1056,1511851931),(262,26,1,'{\"code\":1,\"info\":2}',0.0365791,1056,1511851932),(263,26,1,'{\"code\":1,\"info\":2}',0.0496969,1056,1511851933),(264,26,1,'{\"code\":1,\"info\":2}',0.0629201,1056,1511851934),(265,26,1,'{\"code\":1,\"info\":2}',0.043803,1056,1511851935),(266,26,1,'{\"code\":1,\"info\":2}',0.060812,1056,1511851936),(267,26,1,'{\"code\":1,\"info\":2}',0.036783,1056,1511851937),(268,26,1,'{\"code\":1,\"info\":2}',0.0851369,1056,1511851938),(269,26,1,'{\"code\":1,\"info\":2}',0.036046,1056,1511851939),(270,26,1,'{\"code\":1,\"info\":2}',0.0338891,1056,1511851940),(271,26,1,'{\"code\":1,\"info\":2}',0.0336218,1056,1511851940),(272,26,1,'{\"code\":1,\"info\":2}',0.127065,1056,1511851941),(273,26,1,'{\"code\":1,\"info\":2}',0.0333059,1056,1511851942),(274,26,1,'{\"code\":1,\"info\":2}',0.0360892,1056,1511851943),(275,26,1,'{\"code\":1,\"info\":2}',0.0345609,1056,1511851944),(276,26,1,'{\"code\":1,\"info\":2}',0.0328581,1056,1511851945),(277,26,1,'{\"code\":1,\"info\":2}',0.0328281,1056,1511851946),(278,26,1,'{\"code\":1,\"info\":2}',0.0359721,1056,1511851947),(279,26,1,'{\"code\":1,\"info\":2}',0.034389,1056,1511851948),(280,26,1,'{\"code\":1,\"info\":2}',0.0398881,1056,1511851949),(281,26,1,'{\"code\":1,\"info\":2}',0.043215,1056,1511851949),(282,26,1,'{\"code\":1,\"info\":2}',0.0391998,1056,1511851950),(283,26,1,'{\"code\":1,\"info\":2}',0.041415,1056,1511851951),(284,26,1,'{\"code\":1,\"info\":2}',0.0406621,1056,1511851952),(285,26,1,'{\"code\":1,\"info\":2}',0.121982,1056,1511851953),(286,26,1,'{\"code\":1,\"info\":2}',0.0417521,1056,1511851954),(287,26,1,'{\"code\":1,\"info\":2}',0.045501,1056,1511851955),(288,26,1,'{\"code\":1,\"info\":2}',0.044338,1056,1511851956),(289,26,1,'{\"code\":1,\"info\":2}',0.042742,1056,1511851957),(290,26,1,'{\"code\":1,\"info\":2}',0.043997,1056,1511851958),(291,26,1,'{\"code\":1,\"info\":2}',0.0423021,1056,1511851958),(292,26,1,'{\"code\":1,\"info\":2}',0.040457,1056,1511851959),(293,26,1,'{\"code\":1,\"info\":2}',0.047792,1056,1511851960),(294,26,1,'{\"code\":1,\"info\":2}',0.0453329,1056,1511851961),(295,26,1,'{\"code\":1,\"info\":2}',0.0416648,1056,1511851962),(296,26,1,'{\"code\":1,\"info\":2}',0.041116,1056,1511851963),(297,26,1,'{\"code\":1,\"info\":2}',0.0404999,1056,1511851964),(298,26,1,'{\"code\":1,\"info\":2}',0.044265,1056,1511851965),(299,26,1,'{\"code\":1,\"info\":2}',0.145636,1056,1511851966),(300,26,1,'{\"code\":1,\"info\":2}',0.0597079,1056,1511851967),(301,26,1,'{\"code\":1,\"info\":2}',0.0499649,1056,1511851967),(302,26,1,'{\"code\":1,\"info\":2}',0.041924,1056,1511851968),(303,26,1,'{\"code\":1,\"info\":2}',0.044513,1056,1511851969),(304,26,1,'{\"code\":1,\"info\":2}',0.042954,1056,1511851970),(305,26,1,'{\"code\":1,\"info\":2}',0.0421541,1056,1511851971),(306,26,1,'{\"code\":1,\"info\":2}',0.041646,1056,1511851972),(307,26,1,'{\"code\":1,\"info\":2}',0.0392561,1056,1511851973),(308,26,1,'{\"code\":1,\"info\":2}',0.0421672,1056,1511851974),(309,26,1,'{\"code\":1,\"info\":2}',0.044935,1056,1511851975),(310,26,1,'{\"code\":1,\"info\":2}',0.0429909,1056,1511851976),(311,26,1,'{\"code\":1,\"info\":2}',0.0459249,1056,1511851976),(312,26,1,'{\"code\":1,\"info\":2}',0.0403972,1056,1511851977),(313,26,1,'{\"code\":1,\"info\":2}',0.0414789,1056,1511851978),(314,26,1,'{\"code\":1,\"info\":2}',0.048981,1056,1511851979),(315,26,1,'{\"code\":1,\"info\":2}',0.067955,1056,1511851980),(316,26,1,'{\"code\":1,\"info\":2}',0.0421641,1056,1511851981),(317,26,1,'{\"code\":1,\"info\":2}',0.0531759,1056,1511851982),(318,26,1,'{\"code\":1,\"info\":2}',0.0398579,1056,1511851983),(319,26,1,'{\"code\":1,\"info\":2}',0.04269,1056,1511851984),(320,26,1,'{\"code\":1,\"info\":2}',0.048126,1056,1511851985),(321,26,1,'{\"code\":1,\"info\":2}',0.0429161,1056,1511851985),(322,26,1,'{\"code\":1,\"info\":2}',0.0439222,1056,1511851986),(323,26,1,'{\"code\":1,\"info\":2}',0.0437169,1056,1511851987),(324,26,1,'{\"code\":1,\"info\":2}',0.0967009,1056,1511851988),(325,26,1,'{\"code\":1,\"info\":2}',0.0677719,1056,1511851989),(326,26,1,'{\"code\":1,\"info\":2}',0.0451739,1056,1511851990),(327,26,1,'{\"code\":1,\"info\":2}',0.0429411,1056,1511851991),(328,26,1,'{\"code\":1,\"info\":2}',0.0327139,1056,1511851992),(329,26,1,'{\"code\":1,\"info\":2}',0.0424101,1056,1511851993),(330,26,1,'{\"code\":1,\"info\":2}',0.041229,1056,1511851994),(331,26,1,'{\"code\":1,\"info\":2}',0.0357199,1056,1511851994),(332,26,1,'{\"code\":1,\"info\":2}',0.0415821,1056,1511851995),(333,26,1,'{\"code\":1,\"info\":2}',0.111705,1056,1511851996),(334,26,1,'{\"code\":1,\"info\":2}',0.0413649,1056,1511851997),(335,26,1,'{\"code\":1,\"info\":2}',0.043138,1056,1511851998),(336,26,1,'{\"code\":1,\"info\":2}',0.0495338,1056,1511851999),(337,26,1,'{\"code\":1,\"info\":2}',0.0443149,1056,1511852000),(338,26,1,'{\"code\":1,\"info\":2}',0.0455029,1056,1511852001),(339,26,1,'{\"code\":1,\"info\":2}',0.0414281,1056,1511852002),(340,26,1,'{\"code\":1,\"info\":2}',0.0439389,1056,1511852003),(341,26,1,'{\"code\":1,\"info\":2}',0.0416601,1056,1511852003),(342,26,1,'{\"code\":1,\"info\":2}',0.041172,1056,1511852004),(343,26,1,'{\"code\":1,\"info\":2}',0.0409982,1056,1511852005),(344,26,1,'{\"code\":1,\"info\":2}',0.0420859,1056,1511852006),(345,26,1,'{\"code\":1,\"info\":2}',0.0376029,1056,1511852007),(346,26,1,'{\"code\":1,\"info\":2}',0.0419071,1056,1511852008),(347,26,1,'{\"code\":1,\"info\":2}',0.045105,1056,1511852009),(348,26,1,'{\"code\":1,\"info\":2}',0.0392411,1056,1511852010),(349,26,1,'{\"code\":1,\"info\":2}',0.0438392,1056,1511852011),(350,26,1,'{\"code\":1,\"info\":2}',0.04251,1056,1511852012),(351,26,1,'{\"code\":1,\"info\":2}',0.0409009,1056,1511852012),(352,26,1,'{\"code\":1,\"info\":2}',0.042192,1056,1511852013),(353,26,1,'{\"code\":1,\"info\":2}',0.046016,1056,1511852014),(354,26,1,'{\"code\":1,\"info\":2}',0.0428259,1056,1511852015),(355,26,1,'{\"code\":1,\"info\":2}',0.0409672,1056,1511852016),(356,26,1,'{\"code\":1,\"info\":2}',0.0418921,1056,1511852017),(357,26,1,'{\"code\":1,\"info\":2}',0.0432069,1056,1511852018),(358,26,1,'{\"code\":1,\"info\":2}',0.045959,1056,1511852019),(359,26,1,'{\"code\":1,\"info\":2}',0.065697,1056,1511852020),(360,26,1,'{\"code\":1,\"info\":2}',0.048907,1056,1511852021),(361,26,1,'{\"code\":1,\"info\":2}',0.0412798,1056,1511852021),(362,26,1,'{\"code\":1,\"info\":2}',0.044148,1056,1511852022),(363,26,1,'{\"code\":1,\"info\":2}',0.0402641,1056,1511852023),(364,26,1,'{\"code\":1,\"info\":2}',0.0412328,1056,1511852024),(365,26,1,'{\"code\":1,\"info\":2}',0.0426998,1056,1511852025),(366,26,1,'{\"code\":1,\"info\":2}',0.041702,1056,1511852026),(367,26,1,'{\"code\":1,\"info\":2}',0.0419919,1056,1511852027),(368,26,1,'{\"code\":1,\"info\":2}',0.035491,1056,1511852028),(369,26,1,'{\"code\":1,\"info\":2}',0.0413649,1056,1511852029),(370,26,1,'{\"code\":1,\"info\":2}',0.0519009,1056,1511852030),(371,26,1,'{\"code\":1,\"info\":2}',0.036046,1056,1511852030),(372,26,1,'{\"code\":1,\"info\":2}',0.0461729,1056,1511852031),(373,26,1,'{\"code\":1,\"info\":2}',0.133,1056,1511852032),(374,26,1,'{\"code\":1,\"info\":2}',0.0383019,1056,1511852033),(375,26,1,'{\"code\":1,\"info\":2}',0.0626109,1056,1511852034),(376,26,1,'{\"code\":1,\"info\":2}',0.0484481,1056,1511852035),(377,26,1,'{\"code\":1,\"info\":2}',0.0440979,1056,1511852036),(378,26,1,'{\"code\":1,\"info\":2}',0.042624,1056,1511852037),(379,26,1,'{\"code\":1,\"info\":2}',0.042098,1056,1511852038),(380,26,1,'{\"code\":1,\"info\":2}',0.0411539,1056,1511852039),(381,26,1,'{\"code\":1,\"info\":2}',0.0419319,1056,1511852039),(382,26,1,'{\"code\":1,\"info\":2}',0.0408671,1056,1511852040),(383,26,1,'{\"code\":1,\"info\":2}',0.0412741,1056,1511852041),(384,26,1,'{\"code\":1,\"info\":2}',0.131474,1056,1511852042),(385,26,1,'{\"code\":1,\"info\":2}',0.04215,1056,1511852043),(386,26,1,'{\"code\":1,\"info\":2}',0.0435631,1056,1511852044),(387,26,1,'{\"code\":1,\"info\":2}',0.0466931,1056,1511852045),(388,26,1,'{\"code\":1,\"info\":2}',0.0411298,1056,1511852046),(389,26,1,'{\"code\":1,\"info\":2}',0.041769,1056,1511852047),(390,26,1,'{\"code\":1,\"info\":2}',0.04355,1056,1511852048),(391,26,1,'{\"code\":1,\"info\":2}',0.136386,1056,1511852049),(392,26,1,'{\"code\":1,\"info\":2}',0.047286,1056,1511852049),(393,26,1,'{\"code\":1,\"info\":2}',0.044704,1056,1511852050),(394,26,1,'{\"code\":1,\"info\":2}',0.060569,1056,1511852051),(395,26,1,'{\"code\":1,\"info\":2}',0.0468431,1056,1511852052),(396,26,1,'{\"code\":1,\"info\":2}',0.077091,1056,1511852053),(397,26,1,'{\"code\":1,\"info\":2}',0.042784,1056,1511852054),(398,26,1,'{\"code\":1,\"info\":2}',0.0414522,1056,1511852055),(399,26,1,'{\"code\":1,\"info\":2}',0.039459,1056,1511852056),(400,26,1,'{\"code\":1,\"info\":2}',0.041894,1056,1511852057),(401,26,1,'{\"code\":1,\"info\":2}',0.0393031,1056,1511852058),(402,26,1,'{\"code\":1,\"info\":2}',0.0518091,1056,1511852058),(403,26,1,'{\"code\":1,\"info\":2}',0.109235,1056,1511852059),(404,26,1,'{\"code\":1,\"info\":2}',0.0423481,1056,1511852060),(405,26,1,'{\"code\":1,\"info\":2}',0.0450342,1056,1511852061),(406,26,1,'{\"code\":1,\"info\":2}',0.0448818,1056,1511852062),(407,26,1,'{\"code\":1,\"info\":2}',0.0430019,1056,1511852063),(408,26,1,'{\"code\":1,\"info\":2}',0.0355029,1056,1511852064),(409,26,1,'{\"code\":1,\"info\":2}',0.0427721,1056,1511852065),(410,26,1,'{\"code\":1,\"info\":2}',0.039072,1056,1511852066),(411,26,1,'{\"code\":1,\"info\":2}',0.04198,1056,1511852067),(412,26,1,'{\"code\":1,\"info\":2}',0.0406692,1056,1511852067),(413,26,1,'{\"code\":1,\"info\":2}',0.0415289,1056,1511852068),(414,26,1,'{\"code\":1,\"info\":2}',0.042902,1056,1511852069),(415,26,1,'{\"code\":1,\"info\":2}',0.0426769,1056,1511852070),(416,26,1,'{\"code\":1,\"info\":2}',0.041481,1056,1511852071),(417,26,1,'{\"code\":1,\"info\":2}',0.0410972,1056,1511852072),(418,26,1,'{\"code\":1,\"info\":2}',0.0527802,1056,1511852073),(419,26,1,'{\"code\":1,\"info\":2}',0.0445621,1056,1511852074),(420,26,1,'{\"code\":1,\"info\":2}',0.0578671,1056,1511852075),(421,26,1,'{\"code\":1,\"info\":2}',0.044127,1056,1511852076),(422,26,1,'{\"code\":1,\"info\":2}',0.040616,1056,1511852076),(423,26,1,'{\"code\":1,\"info\":2}',0.04035,1056,1511852077),(424,26,1,'{\"code\":1,\"info\":2}',0.040849,1056,1511852078),(425,26,1,'{\"code\":1,\"info\":2}',0.0417311,1056,1511852079),(426,26,1,'{\"code\":1,\"info\":2}',0.0412209,1056,1511852080),(427,26,1,'{\"code\":1,\"info\":2}',0.032733,1056,1511852081),(428,26,1,'{\"code\":1,\"info\":2}',0.0425441,1056,1511852082),(429,26,1,'{\"code\":1,\"info\":2}',0.0416441,1056,1511852083),(430,26,1,'{\"code\":1,\"info\":2}',0.0447271,1056,1511852084),(431,26,1,'{\"code\":1,\"info\":2}',0.0417929,1056,1511852085),(432,26,1,'{\"code\":1,\"info\":2}',0.0410898,1056,1511852085),(433,26,1,'{\"code\":1,\"info\":2}',0.0410941,1056,1511852086),(434,26,1,'{\"code\":1,\"info\":2}',0.041213,1056,1511852087),(435,26,1,'{\"code\":1,\"info\":2}',0.0408759,1056,1511852088),(436,26,1,'{\"code\":1,\"info\":2}',0.041187,1056,1511852089),(437,26,1,'{\"code\":1,\"info\":2}',0.0466721,1056,1511852090),(438,26,1,'{\"code\":1,\"info\":2}',0.0499709,1056,1511852091),(439,26,1,'{\"code\":1,\"info\":2}',0.0550239,1056,1511852092),(440,26,1,'{\"code\":1,\"info\":2}',0.039377,1056,1511852093),(441,26,1,'{\"code\":1,\"info\":2}',0.0399702,1056,1511852094),(442,26,1,'{\"code\":1,\"info\":2}',0.0404289,1056,1511852094),(443,26,1,'{\"code\":1,\"info\":2}',0.0425248,1056,1511852095),(444,26,1,'{\"code\":1,\"info\":2}',0.043813,1056,1511852096),(445,26,1,'{\"code\":1,\"info\":2}',0.0421,1056,1511852097),(446,26,1,'{\"code\":1,\"info\":2}',0.0411491,1056,1511852098),(447,26,1,'{\"code\":1,\"info\":2}',0.042078,1056,1511852099),(448,26,1,'{\"code\":1,\"info\":2}',0.0416892,1056,1511852100),(449,26,1,'{\"code\":1,\"info\":2}',0.03759,1056,1511852101),(450,26,1,'{\"code\":1,\"info\":2}',0.04054,1056,1511852102),(451,26,1,'{\"code\":1,\"info\":2}',0.0402918,1056,1511852103),(452,26,1,'{\"code\":1,\"info\":2}',0.0419779,1056,1511852103),(453,26,1,'{\"code\":1,\"info\":2}',0.040206,1056,1511852104),(454,26,1,'{\"code\":1,\"info\":2}',0.0402739,1056,1511852105),(455,26,1,'{\"code\":1,\"info\":2}',0.0416651,1056,1511852106),(456,26,1,'{\"code\":1,\"info\":2}',0.0404849,1056,1511852107),(457,26,1,'{\"code\":1,\"info\":2}',0.0406899,1056,1511852108),(458,26,1,'{\"code\":1,\"info\":2}',0.0409222,1056,1511852109),(459,26,1,'{\"code\":1,\"info\":2}',0.0420661,1056,1511852110),(460,26,1,'{\"code\":1,\"info\":2}',0.039773,1056,1511852111),(461,26,1,'{\"code\":1,\"info\":2}',0.040946,1056,1511852112),(462,26,1,'{\"code\":1,\"info\":2}',0.0416241,1056,1511852112),(463,26,1,'{\"code\":1,\"info\":2}',0.048872,1056,1511852113),(464,26,1,'{\"code\":1,\"info\":2}',0.0406129,1056,1511852114),(465,26,1,'{\"code\":1,\"info\":2}',0.0419381,1056,1511852115),(466,26,1,'{\"code\":1,\"info\":2}',0.0406702,1056,1511852116),(467,26,1,'{\"code\":1,\"info\":2}',0.051518,1056,1511852117),(468,26,1,'{\"code\":1,\"info\":2}',0.0410981,1056,1511852118),(469,26,1,'{\"code\":1,\"info\":2}',0.040617,1056,1511852119),(470,26,1,'{\"code\":1,\"info\":2}',0.041018,1056,1511852120),(471,26,1,'{\"code\":1,\"info\":2}',0.042109,1056,1511852121),(472,26,1,'{\"code\":1,\"info\":2}',0.0418611,1056,1511852121),(473,26,1,'{\"code\":1,\"info\":2}',0.040554,1056,1511852122),(474,26,1,'{\"code\":1,\"info\":2}',0.0390272,1056,1511852123),(475,26,1,'{\"code\":1,\"info\":2}',0.042666,1056,1511852124),(476,26,1,'{\"code\":1,\"info\":2}',0.0420501,1056,1511852125),(477,26,1,'{\"code\":1,\"info\":2}',0.056802,1056,1511852126),(478,26,1,'{\"code\":1,\"info\":2}',0.040899,1056,1511852127),(479,26,1,'{\"code\":1,\"info\":2}',0.0408258,1056,1511852128),(480,26,1,'{\"code\":1,\"info\":2}',0.041646,1056,1511852129),(481,26,1,'{\"code\":1,\"info\":2}',0.040906,1056,1511852130),(482,26,1,'{\"code\":1,\"info\":2}',0.0410328,1056,1511852130),(483,26,1,'{\"code\":1,\"info\":2}',0.0421021,1056,1511852131),(484,26,1,'{\"code\":1,\"info\":2}',0.0408161,1056,1511852132),(485,26,1,'{\"code\":1,\"info\":2}',0.0406291,1056,1511852133),(486,26,1,'{\"code\":1,\"info\":2}',0.0408289,1056,1511852134),(487,26,1,'{\"code\":1,\"info\":2}',0.039902,1056,1511852135),(488,26,1,'{\"code\":1,\"info\":2}',0.0409598,1056,1511852136),(489,26,1,'{\"code\":1,\"info\":2}',0.0409501,1056,1511852137),(490,26,1,'{\"code\":1,\"info\":2}',0.0407729,1056,1511852138),(491,26,1,'{\"code\":1,\"info\":2}',0.040313,1056,1511852139),(492,26,1,'{\"code\":1,\"info\":2}',0.041456,1056,1511852139),(493,26,1,'{\"code\":1,\"info\":2}',0.0412199,1056,1511852140),(494,26,1,'{\"code\":1,\"info\":2}',0.0415211,1056,1511852141),(495,26,1,'{\"code\":1,\"info\":2}',0.0342808,1056,1511852142),(496,26,1,'{\"code\":1,\"info\":2}',0.0398631,1056,1511852143),(497,26,1,'{\"code\":1,\"info\":2}',0.0408869,1056,1511852144),(498,26,1,'{\"code\":1,\"info\":2}',0.0411642,1056,1511852145),(499,26,1,'{\"code\":1,\"info\":2}',0.0416422,1056,1511852146),(500,26,1,'{\"code\":1,\"info\":2}',0.041589,1056,1511852147),(501,26,1,'{\"code\":1,\"info\":2}',0.0415192,1056,1511852148),(502,26,1,'{\"code\":1,\"info\":2}',0.0401118,1056,1511852148),(503,26,1,'{\"code\":1,\"info\":2}',0.0414999,1056,1511852149),(504,26,1,'{\"code\":1,\"info\":2}',0.0428281,1056,1511852150),(505,26,1,'{\"code\":1,\"info\":2}',0.041621,1056,1511852151),(506,26,1,'{\"code\":1,\"info\":2}',0.0393369,1056,1511852152),(507,26,1,'{\"code\":1,\"info\":2}',0.0414591,1056,1511852153),(508,26,1,'{\"code\":1,\"info\":2}',0.041466,1056,1511852154),(509,26,1,'{\"code\":1,\"info\":2}',0.040935,1056,1511852155),(510,26,1,'{\"code\":1,\"info\":2}',0.0406139,1056,1511852156),(511,26,1,'{\"code\":1,\"info\":2}',0.0390201,1056,1511852157),(512,26,1,'{\"code\":1,\"info\":2}',0.0397658,1056,1511852157),(513,26,1,'{\"code\":1,\"info\":2}',0.0356948,1056,1511852158),(514,26,1,'{\"code\":1,\"info\":2}',0.045357,1056,1511852159),(515,26,1,'{\"code\":1,\"info\":2}',0.03988,1056,1511852160),(516,26,1,'{\"code\":1,\"info\":2}',0.0407548,1056,1511852161),(517,26,1,'{\"code\":1,\"info\":2}',0.041029,1056,1511852162),(518,26,1,'{\"code\":1,\"info\":2}',0.05389,1056,1511852163),(519,26,1,'{\"code\":1,\"info\":2}',0.0417881,1056,1511852164),(520,26,1,'{\"code\":1,\"info\":2}',0.0420389,1056,1511852165),(521,26,1,'{\"code\":1,\"info\":2}',0.041651,1056,1511852166),(522,26,1,'{\"code\":1,\"info\":2}',0.040072,1056,1511852167),(523,26,1,'{\"code\":1,\"info\":2}',0.0419571,1056,1511852167),(524,26,1,'{\"code\":1,\"info\":2}',0.0410569,1056,1511852168),(525,26,1,'{\"code\":1,\"info\":2}',0.0406539,1056,1511852169),(526,26,1,'{\"code\":1,\"info\":2}',0.0405748,1056,1511852170),(527,26,1,'{\"code\":1,\"info\":2}',0.041187,1056,1511852171),(528,26,1,'{\"code\":1,\"info\":2}',0.0411458,1056,1511852172),(529,26,1,'{\"code\":1,\"info\":2}',0.0411632,1056,1511852173),(530,26,1,'{\"code\":1,\"info\":2}',0.0404181,1056,1511852174),(531,26,1,'{\"code\":1,\"info\":2}',0.041496,1056,1511852175),(532,26,1,'{\"code\":1,\"info\":2}',0.0389562,1056,1511852176),(533,26,1,'{\"code\":1,\"info\":2}',0.0366681,1056,1511852176),(534,26,1,'{\"code\":1,\"info\":2}',0.0412948,1056,1511852177),(535,26,1,'{\"code\":1,\"info\":2}',0.0414121,1056,1511852178),(536,26,1,'{\"code\":1,\"info\":2}',0.041008,1056,1511852179),(537,26,1,'{\"code\":1,\"info\":2}',0.0412891,1056,1511852180),(538,26,1,'{\"code\":1,\"info\":2}',0.0411592,1056,1511852181),(539,26,1,'{\"code\":1,\"info\":2}',0.0408299,1056,1511852182),(540,26,1,'{\"code\":1,\"info\":2}',0.0413799,1056,1511852183),(541,26,1,'{\"code\":1,\"info\":2}',0.0414662,1056,1511852184),(542,26,1,'{\"code\":1,\"info\":2}',0.0413821,1056,1511852185),(543,26,1,'{\"code\":1,\"info\":2}',0.0416069,1056,1511852185),(544,26,1,'{\"code\":1,\"info\":2}',0.0409009,1056,1511852186),(545,26,1,'{\"code\":1,\"info\":2}',0.0420909,1056,1511852187),(546,26,1,'{\"code\":1,\"info\":2}',0.0406642,1056,1511852188),(547,26,1,'{\"code\":1,\"info\":2}',0.0360441,1056,1511852189),(548,26,1,'{\"code\":1,\"info\":2}',0.0421252,1056,1511852190),(549,26,1,'{\"code\":1,\"info\":2}',0.0445838,1056,1511852191),(550,26,1,'{\"code\":1,\"info\":2}',0.0409009,1056,1511852192),(551,26,1,'{\"code\":1,\"info\":2}',0.040931,1056,1511852193),(552,26,1,'{\"code\":1,\"info\":2}',0.040761,1056,1511852194),(553,26,1,'{\"code\":1,\"info\":2}',0.041204,1056,1511852194),(554,26,1,'{\"code\":1,\"info\":2}',0.0412369,1056,1511852195),(555,26,1,'{\"code\":1,\"info\":2}',0.041085,1056,1511852196),(556,26,1,'{\"code\":1,\"info\":2}',0.040453,1056,1511852197),(557,26,1,'{\"code\":1,\"info\":2}',0.0400579,1056,1511852198),(558,26,1,'{\"code\":1,\"info\":2}',0.0429301,1056,1511852199),(559,26,1,'{\"code\":1,\"info\":2}',0.040405,1056,1511852200),(560,26,1,'{\"code\":1,\"info\":2}',0.036557,1056,1511852201),(561,26,1,'{\"code\":1,\"info\":2}',0.0412581,1056,1511852202),(562,26,1,'{\"code\":1,\"info\":2}',0.0407071,1056,1511852203),(563,26,1,'{\"code\":1,\"info\":2}',0.041676,1056,1511852203),(564,26,1,'{\"code\":1,\"info\":2}',0.041467,1056,1511852204),(565,26,1,'{\"code\":1,\"info\":2}',0.0412149,1056,1511852205),(566,26,1,'{\"code\":1,\"info\":2}',0.041348,1056,1511852206),(567,26,1,'{\"code\":1,\"info\":2}',0.041013,1056,1511852207),(568,26,1,'{\"code\":1,\"info\":2}',0.0399191,1056,1511852208),(569,26,1,'{\"code\":1,\"info\":2}',0.0424058,1056,1511852209),(570,26,1,'{\"code\":1,\"info\":2}',0.043591,1056,1511852210),(571,26,1,'{\"code\":1,\"info\":2}',0.0408058,1056,1511852211),(572,26,1,'{\"code\":1,\"info\":2}',0.0406229,1056,1511852212),(573,26,1,'{\"code\":1,\"info\":2}',0.0405381,1056,1511852212),(574,26,1,'{\"code\":1,\"info\":2}',0.0406041,1056,1511852213),(575,26,1,'{\"code\":1,\"info\":2}',0.0405569,1056,1511852214),(576,26,1,'{\"code\":1,\"info\":2}',0.040127,1056,1511852215),(577,26,1,'{\"code\":1,\"info\":2}',0.0365019,1056,1511852216),(578,26,1,'{\"code\":1,\"info\":2}',0.0413361,1056,1511852217),(579,26,1,'{\"code\":1,\"info\":2}',0.0402451,1056,1511852218),(580,26,1,'{\"code\":1,\"info\":2}',0.0412178,1056,1511852219),(581,26,1,'{\"code\":1,\"info\":2}',0.041059,1056,1511852220),(582,26,1,'{\"code\":1,\"info\":2}',0.041959,1056,1511852221),(583,26,1,'{\"code\":1,\"info\":2}',0.0469398,1056,1511852221),(584,26,1,'{\"code\":1,\"info\":2}',0.116497,1056,1511852222),(585,26,1,'{\"code\":1,\"info\":2}',0.042074,1056,1511852223),(586,26,1,'{\"code\":1,\"info\":2}',0.0413239,1056,1511852224),(587,26,1,'{\"code\":1,\"info\":2}',0.0398269,1056,1511852225),(588,26,1,'{\"code\":1,\"info\":2}',0.0396369,1056,1511852226),(589,26,1,'{\"code\":1,\"info\":2}',0.0408669,1056,1511852227),(590,26,1,'{\"code\":1,\"info\":2}',0.046006,1056,1511852228),(591,26,1,'{\"code\":1,\"info\":2}',0.043689,1056,1511852229),(592,26,1,'{\"code\":1,\"info\":2}',0.0355299,1056,1511852230),(593,26,1,'{\"code\":1,\"info\":2}',0.039866,1056,1511852230),(594,26,1,'{\"code\":1,\"info\":2}',0.0398359,1056,1511852231),(595,26,1,'{\"code\":1,\"info\":2}',0.0414221,1056,1511852232),(596,26,1,'{\"code\":1,\"info\":2}',0.044117,1056,1511852233),(597,26,1,'{\"code\":1,\"info\":2}',0.0420978,1056,1511852234),(598,26,1,'{\"code\":1,\"info\":2}',0.0808139,1056,1511852235),(599,26,1,'{\"code\":1,\"info\":2}',0.0457551,1056,1511852236),(600,26,1,'{\"code\":1,\"info\":2}',0.0400589,1056,1511852237),(601,26,1,'{\"code\":1,\"info\":2}',0.0405741,1056,1511852238),(602,26,1,'{\"code\":1,\"info\":2}',0.0403168,1056,1511852239),(603,26,1,'{\"code\":1,\"info\":2}',0.078779,1056,1511852240),(604,26,1,'{\"code\":1,\"info\":2}',0.049597,1056,1511852240),(605,26,1,'{\"code\":1,\"info\":2}',0.0572031,1056,1511852241),(606,26,1,'{\"code\":1,\"info\":2}',0.0846999,1056,1511852242),(607,26,1,'{\"code\":1,\"info\":2}',0.12844,1056,1511852243),(608,26,1,'{\"code\":1,\"info\":2}',0.046026,1056,1511852244),(609,26,1,'{\"code\":1,\"info\":2}',0.04373,1056,1511852245),(610,26,1,'{\"code\":1,\"info\":2}',0.0422699,1056,1511852246),(611,26,1,'{\"code\":1,\"info\":2}',0.043633,1056,1511852247),(612,26,1,'{\"code\":1,\"info\":2}',0.039428,1056,1511852248),(613,26,1,'{\"code\":1,\"info\":2}',0.041908,1056,1511852248),(614,26,1,'{\"code\":1,\"info\":2}',0.0411611,1056,1511852249),(615,26,1,'{\"code\":1,\"info\":2}',0.0407641,1056,1511852250),(616,26,1,'{\"code\":1,\"info\":2}',0.040647,1056,1511852251),(617,26,1,'{\"code\":1,\"info\":2}',0.04263,1056,1511852252),(618,26,1,'{\"code\":1,\"info\":2}',0.0448279,1056,1511852253),(619,26,1,'{\"code\":1,\"info\":2}',0.0438581,1056,1511852254),(620,26,1,'{\"code\":1,\"info\":2}',0.0414009,1056,1511852255),(621,26,1,'{\"code\":1,\"info\":2}',0.0405982,1056,1511852256),(622,26,1,'{\"code\":1,\"info\":2}',0.0426729,1056,1511852257),(623,26,1,'{\"code\":1,\"info\":2}',0.041254,1056,1511852258),(624,26,1,'{\"code\":1,\"info\":2}',0.0408061,1056,1511852258),(625,26,1,'{\"code\":1,\"info\":2}',0.045697,1056,1511852259),(626,26,1,'{\"code\":1,\"info\":2}',0.0483508,1056,1511852260),(627,26,1,'{\"code\":1,\"info\":2}',0.040369,1056,1511852261),(628,26,1,'{\"code\":1,\"info\":2}',0.0402989,1056,1511852262),(629,26,1,'{\"code\":1,\"info\":2}',0.0413959,1056,1511852263),(630,26,1,'{\"code\":1,\"info\":2}',0.040457,1056,1511852264),(631,26,1,'{\"code\":1,\"info\":2}',0.0398281,1056,1511852265),(632,26,1,'{\"code\":1,\"info\":2}',0.0407412,1056,1511852266),(633,26,1,'{\"code\":1,\"info\":2}',0.0380871,1056,1511852267),(634,26,1,'{\"code\":1,\"info\":2}',0.041595,1056,1511852267),(635,26,1,'{\"code\":1,\"info\":2}',0.0406091,1056,1511852268),(636,26,1,'{\"code\":1,\"info\":2}',0.0414839,1056,1511852269),(637,26,1,'{\"code\":1,\"info\":2}',0.0403719,1056,1511852270),(638,26,1,'{\"code\":1,\"info\":2}',0.042645,1056,1511852271),(639,26,1,'{\"code\":1,\"info\":2}',0.0405099,1056,1511852272),(640,26,1,'{\"code\":1,\"info\":2}',0.0410321,1056,1511852273),(641,26,1,'{\"code\":1,\"info\":2}',0.0419641,1056,1511852274),(642,26,1,'{\"code\":1,\"info\":2}',0.0412881,1056,1511852275),(643,26,1,'{\"code\":1,\"info\":2}',0.0413771,1056,1511852276),(644,26,1,'{\"code\":1,\"info\":2}',0.0406752,1056,1511852276),(645,26,1,'{\"code\":1,\"info\":2}',0.0408969,1056,1511852277),(646,26,1,'{\"code\":1,\"info\":2}',0.040426,1056,1511852278),(647,26,1,'{\"code\":1,\"info\":2}',0.040509,1056,1511852279),(648,26,1,'{\"code\":1,\"info\":2}',0.038949,1056,1511852280),(649,26,1,'{\"code\":1,\"info\":2}',0.0425401,1056,1511852281),(650,26,1,'{\"code\":1,\"info\":2}',0.0455699,1056,1511852282),(651,26,1,'{\"code\":1,\"info\":2}',0.0409751,1056,1511852283),(652,26,1,'{\"code\":1,\"info\":2}',0.040782,1056,1511852284),(653,26,1,'{\"code\":1,\"info\":2}',0.041512,1056,1511852285),(654,26,1,'{\"code\":1,\"info\":2}',0.0518951,1056,1511852285),(655,26,1,'{\"code\":1,\"info\":2}',0.0428231,1056,1511852286),(656,26,1,'{\"code\":1,\"info\":2}',0.0438099,1056,1511852287),(657,26,1,'{\"code\":1,\"info\":2}',0.085362,1056,1511852288),(658,26,1,'{\"code\":1,\"info\":2}',0.0430911,1056,1511852289),(659,26,1,'{\"code\":1,\"info\":2}',0.0399809,1056,1511852290),(660,26,1,'{\"code\":1,\"info\":2}',0.0432038,1056,1511852291),(661,26,1,'{\"code\":1,\"info\":2}',0.0506909,1056,1511852292),(662,26,1,'{\"code\":1,\"info\":2}',0.039206,1056,1511852293),(663,26,1,'{\"code\":1,\"info\":2}',0.041115,1056,1511852294),(664,26,1,'{\"code\":1,\"info\":2}',0.097554,1056,1511852294),(665,26,1,'{\"code\":1,\"info\":2}',0.041898,1056,1511852295),(666,26,1,'{\"code\":1,\"info\":2}',0.0452559,1056,1511852296),(667,26,1,'{\"code\":1,\"info\":2}',0.04444,1056,1511852297),(668,26,1,'{\"code\":1,\"info\":2}',0.0444531,1056,1511852298),(669,26,1,'{\"code\":1,\"info\":2}',0.051511,1056,1511852299),(670,26,1,'{\"code\":1,\"info\":2}',0.042161,1056,1511852300),(671,26,1,'{\"code\":1,\"info\":2}',0.107173,1056,1511852301),(672,26,1,'{\"code\":1,\"info\":2}',0.0393081,1056,1511852302),(673,26,1,'{\"code\":1,\"info\":2}',0.0410209,1056,1511852303),(674,26,1,'{\"code\":1,\"info\":2}',0.0429459,1056,1511852303),(675,26,1,'{\"code\":1,\"info\":2}',0.0435638,1056,1511852304),(676,26,1,'{\"code\":1,\"info\":2}',0.047044,1056,1511852305),(677,26,1,'{\"code\":1,\"info\":2}',0.0501659,1056,1511852306),(678,26,1,'{\"code\":1,\"info\":2}',0.034018,1056,1511852307),(679,26,1,'{\"code\":1,\"info\":2}',0.0632901,1056,1511852308),(680,26,1,'{\"code\":1,\"info\":2}',0.0497291,1056,1511852309),(681,26,1,'{\"code\":1,\"info\":2}',0.0407901,1056,1511852310),(682,26,1,'{\"code\":1,\"info\":2}',0.0473309,1056,1511852311),(683,26,1,'{\"code\":1,\"info\":2}',0.0478799,1056,1511852312),(684,26,1,'{\"code\":1,\"info\":2}',0.045733,1056,1511852312),(685,26,1,'{\"code\":1,\"info\":2}',0.042382,1056,1511852313),(686,26,1,'{\"code\":1,\"info\":2}',0.0433919,1056,1511852314),(687,26,1,'{\"code\":1,\"info\":2}',0.0489039,1056,1511852315),(688,26,1,'{\"code\":1,\"info\":2}',0.0446811,1056,1511852316),(689,26,1,'{\"code\":1,\"info\":2}',0.0452831,1056,1511852317),(690,26,1,'{\"code\":1,\"info\":2}',0.0414941,1056,1511852318),(691,26,1,'{\"code\":1,\"info\":2}',0.0405021,1056,1511852319),(692,26,1,'{\"code\":1,\"info\":2}',0.0423191,1056,1511852320),(693,26,1,'{\"code\":1,\"info\":2}',0.0403728,1056,1511852321),(694,26,1,'{\"code\":1,\"info\":2}',0.058619,1056,1511852321),(695,26,1,'{\"code\":1,\"info\":2}',0.0400839,1056,1511852322),(696,26,1,'{\"code\":1,\"info\":2}',0.0490768,1056,1511852323),(697,26,1,'{\"code\":1,\"info\":2}',0.041739,1056,1511852324),(698,26,1,'{\"code\":1,\"info\":2}',0.0422339,1056,1511852325),(699,26,1,'{\"code\":1,\"info\":2}',0.0554821,1056,1511852326),(700,26,1,'{\"code\":1,\"info\":2}',0.054189,1056,1511852327),(701,26,1,'{\"code\":1,\"info\":2}',0.041434,1056,1511852328),(702,26,1,'{\"code\":1,\"info\":2}',0.0410211,1056,1511852329),(703,26,1,'{\"code\":1,\"info\":2}',0.0378671,1056,1511852330),(704,26,1,'{\"code\":1,\"info\":2}',0.040957,1056,1511852330),(705,26,1,'{\"code\":1,\"info\":2}',0.0450919,1056,1511852331),(706,26,1,'{\"code\":1,\"info\":2}',0.0468321,1056,1511852332),(707,26,1,'{\"code\":1,\"info\":2}',0.040314,1056,1511852333),(708,26,1,'{\"code\":1,\"info\":2}',0.039964,1056,1511852334),(709,26,1,'{\"code\":1,\"info\":2}',0.040164,1056,1511852335),(710,26,1,'{\"code\":1,\"info\":2}',0.0412209,1056,1511852336),(711,26,1,'{\"code\":1,\"info\":2}',0.0417609,1056,1511852337),(712,26,1,'{\"code\":1,\"info\":2}',0.0407789,1056,1511852338),(713,26,1,'{\"code\":1,\"info\":2}',0.040889,1056,1511852339),(714,26,1,'{\"code\":1,\"info\":2}',0.0450919,1056,1511852339),(715,26,1,'{\"code\":1,\"info\":2}',0.043884,1056,1511852340),(716,26,1,'{\"code\":1,\"info\":2}',0.041903,1056,1511852341),(717,26,1,'{\"code\":1,\"info\":2}',0.0405591,1056,1511852342),(718,26,1,'{\"code\":1,\"info\":2}',0.0408669,1056,1511852343),(719,26,1,'{\"code\":1,\"info\":2}',0.041044,1056,1511852344),(720,26,1,'{\"code\":1,\"info\":2}',0.041786,1056,1511852345),(721,26,1,'{\"code\":1,\"info\":2}',0.0411429,1056,1511852346),(722,26,1,'{\"code\":1,\"info\":2}',0.041038,1056,1511852347),(723,26,1,'{\"code\":1,\"info\":2}',0.0435781,1056,1511852348),(724,26,1,'{\"code\":1,\"info\":2}',0.041292,1056,1511852348),(725,26,1,'{\"code\":1,\"info\":2}',0.0429549,1056,1511852349),(726,26,1,'{\"code\":1,\"info\":2}',0.041456,1056,1511852350),(727,26,1,'{\"code\":1,\"info\":2}',0.0447459,1056,1511852351),(728,26,1,'{\"code\":1,\"info\":2}',0.0411649,1056,1511852352),(729,26,1,'{\"code\":1,\"info\":2}',0.040441,1056,1511852353),(730,26,1,'{\"code\":1,\"info\":2}',0.07528,1056,1511852354),(731,26,1,'{\"code\":1,\"info\":2}',0.0452709,1056,1511852355),(732,26,1,'{\"code\":1,\"info\":2}',0.041245,1056,1511852356),(733,26,1,'{\"code\":1,\"info\":2}',0.0421371,1056,1511852357),(734,26,1,'{\"code\":1,\"info\":2}',0.038336,1056,1511852357),(735,26,1,'{\"code\":1,\"info\":2}',0.0423679,1056,1511852358),(736,26,1,'{\"code\":1,\"info\":2}',0.044008,1056,1511852359),(737,26,1,'{\"code\":1,\"info\":2}',0.0431249,1056,1511852360),(738,26,1,'{\"code\":1,\"info\":2}',0.046572,1056,1511852361),(739,26,1,'{\"code\":1,\"info\":2}',0.0386651,1056,1511852362),(740,26,1,'{\"code\":1,\"info\":2}',0.0367851,1056,1511852363),(741,26,1,'{\"code\":1,\"info\":2}',0.039125,1056,1511852364),(742,26,1,'{\"code\":1,\"info\":2}',0.0340199,1056,1511852365),(743,26,1,'{\"code\":1,\"info\":2}',0.0420048,1056,1511852366),(744,26,1,'{\"code\":1,\"info\":2}',0.0633101,1056,1511852367),(745,26,1,'{\"code\":1,\"info\":2}',0.0436041,1056,1511852367),(746,26,1,'{\"code\":1,\"info\":2}',0.0519779,1056,1511852368),(747,26,1,'{\"code\":1,\"info\":2}',0.996119,1056,1511852370),(748,26,1,'{\"code\":1,\"info\":2}',0.043406,1056,1511852370),(749,26,1,'{\"code\":1,\"info\":2}',0.078917,1056,1511852371),(750,26,1,'{\"code\":1,\"info\":2}',0.0441201,1056,1511852372),(751,26,1,'{\"code\":1,\"info\":2}',0.038043,1056,1511852373),(752,26,1,'{\"code\":1,\"info\":2}',0.0459881,1056,1511852374),(753,26,1,'{\"code\":1,\"info\":2}',0.048367,1056,1511852375),(754,26,1,'{\"code\":1,\"info\":2}',0.0413871,1056,1511852376),(755,26,1,'{\"code\":1,\"info\":2}',0.042505,1056,1511852377),(756,26,1,'{\"code\":1,\"info\":2}',0.106554,1056,1511852377),(757,26,1,'{\"code\":1,\"info\":2}',0.0498071,1056,1511852378),(758,26,1,'{\"code\":1,\"info\":2}',0.0439851,1056,1511852379),(759,26,1,'{\"code\":1,\"info\":2}',0.046073,1056,1511852380),(760,26,1,'{\"code\":1,\"info\":2}',0.0409911,1056,1511852381),(761,26,1,'{\"code\":1,\"info\":2}',0.0528331,1056,1511852382),(762,26,1,'{\"code\":1,\"info\":2}',0.072969,1056,1511852383),(763,26,1,'{\"code\":1,\"info\":2}',0.0450799,1056,1511852384),(764,26,1,'{\"code\":1,\"info\":2}',0.043498,1056,1511852385),(765,26,1,'{\"code\":1,\"info\":2}',0.0428021,1056,1511852386),(766,26,1,'{\"code\":1,\"info\":2}',0.0437319,1056,1511852386),(767,26,1,'{\"code\":1,\"info\":2}',0.046319,1056,1511852387),(768,26,1,'{\"code\":1,\"info\":2}',0.0439801,1056,1511852388),(769,26,1,'{\"code\":1,\"info\":2}',0.041682,1056,1511852389),(770,26,1,'{\"code\":1,\"info\":2}',0.041791,1056,1511852390),(771,26,1,'{\"code\":1,\"info\":2}',0.0384831,1056,1511852391),(772,26,1,'{\"code\":1,\"info\":2}',0.0464649,1056,1511852392),(773,26,1,'{\"code\":1,\"info\":2}',0.0446029,1056,1511852393),(774,26,1,'{\"code\":1,\"info\":2}',0.114865,1056,1511852394),(775,26,1,'{\"code\":1,\"info\":2}',0.0411692,1056,1511852395),(776,26,1,'{\"code\":1,\"info\":2}',0.0724401,1056,1511852395),(777,26,1,'{\"code\":1,\"info\":2}',0.0687091,1056,1511852396),(778,26,1,'{\"code\":1,\"info\":2}',0.044477,1056,1511852397),(779,26,1,'{\"code\":1,\"info\":2}',0.0410941,1056,1511852398),(780,26,1,'{\"code\":1,\"info\":2}',0.052938,1056,1511852399),(781,26,1,'{\"code\":1,\"info\":2}',0.0419271,1056,1511852400),(782,26,1,'{\"code\":1,\"info\":2}',0.158137,1056,1511852401),(783,26,1,'{\"code\":1,\"info\":2}',0.0416579,1056,1511852402),(784,26,1,'{\"code\":1,\"info\":2}',0.0453689,1056,1511852403),(785,26,1,'{\"code\":1,\"info\":2}',0.061733,1056,1511852404),(786,26,1,'{\"code\":1,\"info\":2}',0.039788,1056,1511852404),(787,26,1,'{\"code\":1,\"info\":2}',0.044291,1056,1511852405),(788,26,1,'{\"code\":1,\"info\":2}',0.040379,1056,1511852406),(789,26,1,'{\"code\":1,\"info\":2}',0.0420389,1056,1511852407),(790,26,1,'{\"code\":1,\"info\":2}',0.0413699,1056,1511852408),(791,26,1,'{\"code\":1,\"info\":2}',0.043051,1056,1511852409),(792,26,1,'{\"code\":1,\"info\":2}',0.041599,1056,1511852410),(793,26,1,'{\"code\":1,\"info\":2}',0.044445,1056,1511852411),(794,26,1,'{\"code\":1,\"info\":2}',0.042001,1056,1511852412),(795,26,1,'{\"code\":1,\"info\":2}',0.0379639,1056,1511852413),(796,26,1,'{\"code\":1,\"info\":2}',0.0491471,1056,1511852413),(797,26,1,'{\"code\":1,\"info\":2}',0.065196,1056,1511852414),(798,26,1,'{\"code\":1,\"info\":2}',0.0469189,1056,1511852415),(799,26,1,'{\"code\":1,\"info\":2}',0.0420711,1056,1511852416),(800,26,1,'{\"code\":1,\"info\":2}',0.042381,1056,1511852417),(801,26,1,'{\"code\":1,\"info\":2}',0.047518,1056,1511852418),(802,26,1,'{\"code\":1,\"info\":2}',0.0410509,1056,1511852419),(803,26,1,'{\"code\":1,\"info\":2}',0.04335,1056,1511852420),(804,26,1,'{\"code\":1,\"info\":2}',0.0433941,1056,1511852421),(805,26,1,'{\"code\":1,\"info\":2}',0.0407181,1056,1511852422),(806,26,1,'{\"code\":1,\"info\":2}',0.0437381,1056,1511852422),(807,26,1,'{\"code\":1,\"info\":2}',0.0485909,1056,1511852423),(808,26,1,'{\"code\":1,\"info\":2}',0.0431011,1056,1511852424),(809,26,1,'{\"code\":1,\"info\":2}',0.0429142,1056,1511852425),(810,26,1,'{\"code\":1,\"info\":2}',0.0545239,1056,1511852426),(811,26,1,'{\"code\":1,\"info\":2}',0.0485961,1056,1511852427),(812,26,1,'{\"code\":1,\"info\":2}',0.039763,1056,1511852428),(813,26,1,'{\"code\":1,\"info\":2}',0.0412769,1056,1511852429),(814,26,1,'{\"code\":1,\"info\":2}',0.158443,1056,1511852430),(815,26,1,'{\"code\":1,\"info\":2}',0.0400271,1056,1511852431),(816,26,1,'{\"code\":1,\"info\":2}',0.045085,1056,1511852431),(817,26,1,'{\"code\":1,\"info\":2}',0.0425739,1056,1511852432),(818,26,1,'{\"code\":1,\"info\":2}',0.045675,1056,1511852433),(819,26,1,'{\"code\":1,\"info\":2}',0.0426359,1056,1511852434),(820,26,1,'{\"code\":1,\"info\":2}',0.059164,1056,1511854950),(821,26,1,'{\"code\":1,\"info\":2}',0.0415981,1056,1511854955),(822,26,1,'{\"code\":1,\"info\":2}',0.0412378,1056,1511854955),(823,26,1,'{\"code\":1,\"info\":2}',0.042331,1056,1511854960),(824,26,1,'{\"code\":1,\"info\":2}',0.0728638,1056,1511854965),(825,26,1,'{\"code\":1,\"info\":2}',0.041863,1056,1511854970),(826,26,1,'{\"code\":1,\"info\":2}',0.0624001,1056,1511854975),(827,26,1,'{\"code\":1,\"info\":2}',0.040463,1056,1511854980),(828,26,1,'{\"code\":1,\"info\":2}',0.0418069,1056,1511854985),(829,26,1,'{\"code\":1,\"info\":2}',0.104804,1056,1511854990),(830,26,1,'{\"code\":1,\"info\":2}',0.040947,1056,1511854995),(831,26,1,'{\"code\":1,\"info\":2}',0.0769961,1056,1511855000),(832,26,1,'{\"code\":1,\"info\":2}',0.04354,1056,1511855000),(833,26,1,'{\"code\":1,\"info\":2}',0.0541911,1056,1511855005),(834,26,1,'{\"code\":1,\"info\":2}',0.04268,1056,1511855010),(835,26,1,'{\"code\":1,\"info\":2}',0.0429471,1056,1511855065),(836,26,1,'{\"code\":1,\"info\":2}',0.14453,1056,1511855070),(837,26,1,'{\"code\":1,\"info\":2}',0.04509,1056,1511855075),(838,26,1,'{\"code\":1,\"info\":2}',0.066623,1056,1511855080),(839,26,1,'{\"code\":1,\"info\":2}',0.046864,1056,1511855085),(840,26,1,'{\"code\":1,\"info\":2}',0.107233,1056,1511855090),(841,26,1,'{\"code\":1,\"info\":2}',0.0433481,1056,1511855095),(842,26,1,'{\"code\":1,\"info\":2}',0.064002,1056,1511855100),(843,26,1,'{\"code\":1,\"info\":2}',0.044152,1056,1511855105),(844,26,1,'{\"code\":1,\"info\":2}',0.0973349,1056,1511855145),(845,26,1,'{\"code\":1,\"info\":2}',0.048537,1056,1511855150),(846,26,1,'{\"code\":1,\"info\":2}',0.0805569,1056,1511855155),(847,26,1,'{\"code\":1,\"info\":2}',0.043072,1056,1511855160),(848,26,1,'{\"code\":1,\"info\":2}',0.0429399,1056,1511855165),(849,26,1,'{\"code\":1,\"info\":2}',0.0414481,1056,1511855170),(850,26,1,'{\"code\":1,\"info\":2}',0.045975,1056,1511855175),(851,26,1,'{\"code\":1,\"info\":2}',0.0475001,1056,1511926354),(852,26,1,'{\"code\":1,\"info\":2}',0.04351,1056,1511926355),(853,26,1,'{\"code\":1,\"info\":2}',0.044883,1056,1511926356),(854,26,1,'{\"code\":1,\"info\":2}',0.0391679,1056,1511926357),(855,26,1,'{\"code\":1,\"info\":2}',0.0618801,1056,1511926358),(856,26,1,'{\"code\":1,\"info\":2}',0.0435801,1056,1511926359),(857,26,1,'{\"code\":1,\"info\":2}',0.051326,1056,1511926360),(858,26,1,'{\"code\":1,\"info\":2}',0.040416,1056,1511926361),(859,26,1,'{\"code\":1,\"info\":2}',0.062675,1056,1511926362),(860,26,1,'{\"code\":1,\"info\":2}',0.07372,1056,1511926363),(861,26,1,'{\"code\":1,\"info\":2}',0.0561192,1056,1511926364),(862,26,1,'{\"code\":1,\"info\":2}',0.0521228,1056,1511926365),(863,26,1,'{\"code\":1,\"info\":2}',0.0490029,1056,1511926366),(864,26,1,'{\"code\":1,\"info\":2}',0.0583899,1056,1511926367),(865,26,1,'{\"code\":1,\"info\":2}',0.0405419,1056,1511926368),(866,26,1,'{\"code\":1,\"info\":2}',0.0404711,1056,1511926369),(867,26,1,'{\"code\":1,\"info\":2}',0.041081,1056,1511926370),(868,26,1,'{\"code\":1,\"info\":2}',0.0421441,1056,1511926371),(869,26,1,'{\"code\":1,\"info\":2}',0.0389621,1056,1511926372),(870,26,1,'{\"code\":1,\"info\":2}',0.0411179,1056,1511926373),(871,26,1,'{\"code\":1,\"info\":2}',0.0404601,1056,1511926374),(872,26,1,'{\"code\":1,\"info\":2}',0.0409021,1056,1511926375),(873,26,1,'{\"code\":1,\"info\":2}',0.0407891,1056,1511926376),(874,26,1,'{\"code\":1,\"info\":2}',0.044163,1056,1511926377),(875,26,1,'{\"code\":1,\"info\":2}',0.0421519,1056,1511926378),(876,26,1,'{\"code\":1,\"info\":2}',0.0410399,1056,1511926379),(877,26,1,'{\"code\":1,\"info\":2}',0.0441711,1056,1511926380),(878,26,1,'{\"code\":1,\"info\":2}',0.0444062,1056,1511926381),(879,26,1,'{\"code\":1,\"info\":2}',0.044785,1056,1511926382),(880,26,1,'{\"code\":1,\"info\":2}',0.0457559,1056,1511926383),(881,26,1,'{\"code\":1,\"info\":2}',0.0476599,1056,1511926384),(882,26,1,'{\"code\":1,\"info\":2}',0.0476279,1056,1511926385),(883,26,1,'{\"code\":1,\"info\":2}',0.0885141,1056,1511926667),(884,26,1,'{\"code\":1,\"info\":2}',0.0676222,1056,1511926669),(885,26,1,'{\"code\":1,\"info\":2}',0.0415339,1056,1511926670),(886,26,1,'{\"code\":1,\"info\":2}',0.0448511,1056,1511926673),(887,26,1,'{\"code\":1,\"info\":2}',0.040977,1056,1511926675),(888,26,1,'{\"code\":1,\"info\":2}',0.0488801,1056,1511926677),(889,26,1,'{\"code\":1,\"info\":2}',0.0396841,1056,1511926679),(890,26,1,'{\"code\":1,\"info\":2}',0.038763,1056,1511926681),(891,26,1,'{\"code\":1,\"info\":2}',0.045223,1056,1511926683),(892,26,1,'{\"code\":1,\"info\":2}',0.0391691,1056,1511926685),(893,26,1,'{\"code\":1,\"info\":2}',0.0394979,1056,1511926687),(894,26,1,'{\"code\":1,\"info\":2}',0.0551741,1056,1511926689),(895,26,1,'{\"code\":1,\"info\":2}',0.0790911,1056,1511926691),(896,26,1,'{\"code\":1,\"info\":2}',0.0628588,1056,1511926693),(897,26,1,'{\"code\":1,\"info\":2}',0.0411911,1056,1511926695),(898,26,1,'{\"code\":1,\"info\":2}',0.045526,1056,1511926697),(899,26,1,'{\"code\":1,\"info\":2}',0.040585,1056,1511926699),(900,26,1,'{\"code\":1,\"info\":2}',0.0416028,1056,1511926701),(901,26,1,'{\"code\":1,\"info\":2}',0.0416789,1056,1511926703),(902,26,1,'{\"code\":1,\"info\":2}',0.041558,1056,1511926705),(903,26,1,'{\"code\":1,\"info\":2}',0.0428259,1056,1511926707),(904,26,1,'{\"code\":1,\"info\":2}',0.042922,1056,1511926709),(905,26,1,'{\"code\":1,\"info\":2}',0.045665,1056,1511926711),(906,26,1,'{\"code\":1,\"info\":2}',0.0402901,1056,1511926713),(907,26,1,'{\"code\":1,\"info\":2}',0.039644,1056,1511926715),(908,26,1,'{\"code\":1,\"info\":2}',0.03935,1056,1511926717),(909,26,1,'{\"code\":1,\"info\":2}',0.076664,1056,1511926719),(910,26,1,'{\"code\":1,\"info\":2}',0.089397,1056,1511926721),(911,26,1,'{\"code\":1,\"info\":2}',0.0624168,1056,1511926723),(912,26,1,'{\"code\":1,\"info\":2}',0.0435641,1056,1511926725),(913,26,1,'{\"code\":1,\"info\":2}',0.122974,1056,1511926727),(914,26,1,'{\"code\":1,\"info\":2}',0.0689561,1056,1511926728),(915,26,1,'{\"code\":1,\"info\":2}',0.0437131,1056,1511926730),(916,26,1,'{\"code\":1,\"info\":2}',0.0425889,1056,1511926732),(917,26,1,'{\"code\":1,\"info\":2}',0.040318,1056,1511926734),(918,26,1,'{\"code\":1,\"info\":2}',0.03583,1056,1511926736),(919,26,1,'{\"code\":1,\"info\":2}',0.0426202,1056,1511926738),(920,26,1,'{\"code\":1,\"info\":2}',0.0849309,1056,1511926740),(921,26,1,'{\"code\":1,\"info\":2}',0.0355861,1056,1511926742),(922,26,1,'{\"code\":1,\"info\":2}',0.043961,1056,1511926744),(923,26,1,'{\"code\":1,\"info\":2}',0.041609,1056,1511926746),(924,26,1,'{\"code\":1,\"info\":2}',0.034472,1056,1511926748),(925,26,1,'{\"code\":1,\"info\":2}',0.0461941,1056,1511926750),(926,26,1,'{\"code\":1,\"info\":2}',0.040498,1056,1511926752),(927,26,1,'{\"code\":1,\"info\":2}',0.04177,1056,1511926754),(928,26,1,'{\"code\":1,\"info\":2}',0.0431631,1056,1511926756),(929,26,1,'{\"code\":1,\"info\":2}',0.042269,1056,1511926758),(930,26,1,'{\"code\":1,\"info\":2}',0.0431151,1056,1511926760),(931,26,1,'{\"code\":1,\"info\":2}',0.043133,1056,1511926762),(932,26,1,'{\"code\":1,\"info\":2}',0.0392301,1056,1511926764),(933,26,1,'{\"code\":1,\"info\":2}',0.0424361,1056,1511926766),(934,26,1,'{\"code\":1,\"info\":2}',0.040519,1056,1511926768),(935,26,1,'{\"code\":1,\"info\":2}',0.039624,1056,1511926770),(936,26,1,'{\"code\":1,\"info\":2}',0.0420599,1056,1511926772),(937,26,1,'{\"code\":1,\"info\":2}',0.0415599,1056,1511926774),(938,26,1,'{\"code\":1,\"info\":2}',0.0450041,1056,1511926776),(939,26,1,'{\"code\":1,\"info\":2}',0.0428538,1056,1511926778),(940,26,1,'{\"code\":1,\"info\":2}',0.035934,1056,1511926780),(941,26,1,'{\"code\":1,\"info\":2}',0.0409839,1056,1511926782),(942,26,1,'{\"code\":1,\"info\":2}',0.041188,1056,1511926784),(943,26,1,'{\"code\":1,\"info\":2}',0.0392721,1056,1511926786),(944,26,1,'{\"code\":1,\"info\":2}',0.042654,1056,1511926788),(945,26,1,'{\"code\":1,\"info\":2}',0.0407529,1056,1511926790),(946,26,1,'{\"code\":1,\"info\":2}',0.0405838,1056,1511926792),(947,26,1,'{\"code\":1,\"info\":2}',0.0433969,1056,1511926794),(948,26,1,'{\"code\":1,\"info\":2}',0.0450571,1056,1511926796),(949,26,1,'{\"code\":1,\"info\":2}',0.0402501,1056,1511926798),(950,26,1,'{\"code\":1,\"info\":2}',0.044287,1056,1511926800),(951,26,1,'{\"code\":1,\"info\":2}',0.0433681,1056,1511926802),(952,26,1,'{\"code\":1,\"info\":2}',0.039633,1056,1511926804),(953,26,1,'{\"code\":1,\"info\":2}',0.040678,1056,1511926806),(954,26,1,'{\"code\":1,\"info\":2}',0.0429008,1056,1511926808),(955,26,1,'{\"code\":1,\"info\":2}',0.0425951,1056,1511926810),(956,26,1,'{\"code\":1,\"info\":2}',0.0406401,1056,1511926812),(957,26,1,'{\"code\":1,\"info\":2}',0.0417469,1056,1511926814),(958,26,1,'{\"code\":1,\"info\":2}',0.044297,1056,1511926816),(959,26,1,'{\"code\":1,\"info\":2}',0.046664,1056,1511926818),(960,26,1,'{\"code\":1,\"info\":2}',0.0760682,1056,1511926820),(961,26,1,'{\"code\":1,\"info\":2}',0.0407791,1056,1511926822),(962,26,1,'{\"code\":1,\"info\":2}',0.0425129,1056,1511926824),(963,26,1,'{\"code\":1,\"info\":2}',0.0432889,1056,1511926826),(964,26,1,'{\"code\":1,\"info\":2}',0.0420969,1056,1511926828),(965,26,1,'{\"code\":1,\"info\":2}',0.0405531,1056,1511926830),(966,26,1,'{\"code\":1,\"info\":2}',0.0396731,1056,1511926832),(967,26,1,'{\"code\":1,\"info\":2}',0.0398431,1056,1511926834),(968,26,1,'{\"code\":1,\"info\":2}',0.039989,1056,1511926836),(969,26,1,'{\"code\":1,\"info\":2}',0.04004,1056,1511926838),(970,26,1,'{\"code\":1,\"info\":2}',0.0408392,1056,1511926840),(971,26,1,'{\"code\":1,\"info\":2}',0.041966,1056,1511926842),(972,26,1,'{\"code\":1,\"info\":2}',0.05511,1056,1511926844),(973,26,1,'{\"code\":1,\"info\":2}',0.0659201,1056,1511926846),(974,26,1,'{\"code\":1,\"info\":2}',0.0441279,1056,1511926848),(975,26,1,'{\"code\":1,\"info\":2}',0.040417,1056,1511926850),(976,26,1,'{\"code\":1,\"info\":2}',0.040946,1056,1511926852),(977,26,1,'{\"code\":1,\"info\":2}',0.0419061,1056,1511926854),(978,26,1,'{\"code\":1,\"info\":2}',0.04004,1056,1511926856),(979,26,1,'{\"code\":1,\"info\":2}',0.042469,1056,1511926858),(980,26,1,'{\"code\":1,\"info\":2}',0.0430059,1056,1511926860),(981,26,1,'{\"code\":1,\"info\":2}',0.0414839,1056,1511926862),(982,26,1,'{\"code\":1,\"info\":2}',0.0427911,1056,1511926864),(983,26,1,'{\"code\":1,\"info\":2}',0.0407081,1056,1511926866),(984,26,1,'{\"code\":1,\"info\":2}',0.0891981,1056,1511926868),(985,26,1,'{\"code\":1,\"info\":2}',0.0410242,1056,1511926870),(986,26,1,'{\"code\":1,\"info\":2}',0.0433729,1056,1511926872),(987,26,1,'{\"code\":1,\"info\":2}',0.0424259,1056,1511926874),(988,26,1,'{\"code\":1,\"info\":2}',0.0386131,1056,1511926876),(989,26,1,'{\"code\":1,\"info\":2}',0.0414629,1056,1511926878),(990,26,1,'{\"code\":1,\"info\":2}',0.039937,1056,1511926880),(991,26,1,'{\"code\":1,\"info\":2}',0.040251,1056,1511926882),(992,26,1,'{\"code\":1,\"info\":2}',0.0409,1056,1511926884),(993,26,1,'{\"code\":1,\"info\":2}',0.04304,1056,1511926886),(994,26,1,'{\"code\":1,\"info\":2}',0.137991,1056,1511926888),(995,26,1,'{\"code\":1,\"info\":2}',0.045054,1056,1511926890),(996,26,1,'{\"code\":1,\"info\":2}',0.039397,1056,1511926892),(997,26,1,'{\"code\":1,\"info\":2}',0.0400279,1056,1511926894),(998,26,1,'{\"code\":1,\"info\":2}',0.0410058,1056,1511926896),(999,26,1,'{\"code\":1,\"info\":2}',0.0411479,1056,1511926898),(1000,26,1,'{\"code\":1,\"info\":2}',0.039767,1056,1511926900),(1001,26,1,'{\"code\":1,\"info\":2}',0.04092,1056,1511926902),(1002,26,1,'{\"code\":1,\"info\":2}',0.0412948,1056,1511926904),(1003,26,1,'{\"code\":1,\"info\":2}',0.0422049,1056,1511926906),(1004,26,1,'{\"code\":1,\"info\":2}',0.042834,1056,1511926908),(1005,26,1,'{\"code\":1,\"info\":2}',0.0612049,1056,1511926910),(1006,26,1,'{\"code\":1,\"info\":2}',0.0834079,1056,1511926912),(1007,26,1,'{\"code\":1,\"info\":2}',0.0405412,1056,1511926914),(1008,26,1,'{\"code\":1,\"info\":2}',0.043906,1056,1511926916),(1009,26,1,'{\"code\":1,\"info\":2}',0.153934,1056,1511926918),(1010,26,1,'{\"code\":1,\"info\":2}',0.0426049,1056,1511926920),(1011,26,1,'{\"code\":1,\"info\":2}',0.0420361,1056,1511926922),(1012,26,1,'{\"code\":1,\"info\":2}',0.043756,1056,1511926924),(1013,26,1,'{\"code\":1,\"info\":2}',0.0445731,1056,1511926926),(1014,26,1,'{\"code\":1,\"info\":2}',0.0446231,1056,1511926928),(1015,26,1,'{\"code\":1,\"info\":2}',0.0399978,1056,1511926930),(1016,26,1,'{\"code\":1,\"info\":2}',0.039973,1056,1511926932),(1017,26,1,'{\"code\":1,\"info\":2}',0.0422521,1056,1511926934),(1018,26,1,'{\"code\":1,\"info\":2}',0.0401011,1056,1511926936),(1019,26,1,'{\"code\":1,\"info\":2}',0.0410769,1056,1511926938),(1020,26,1,'{\"code\":1,\"info\":2}',0.044241,1056,1511926940),(1021,26,1,'{\"code\":1,\"info\":2}',0.046273,1056,1511926942),(1022,26,1,'{\"code\":1,\"info\":2}',0.109073,1056,1511926944),(1023,26,1,'{\"code\":1,\"info\":2}',0.0526061,1056,1511926946),(1024,26,1,'{\"code\":1,\"info\":2}',0.043422,1056,1511926948),(1025,26,1,'{\"code\":1,\"info\":2}',0.0418811,1056,1511926950),(1026,26,1,'{\"code\":1,\"info\":2}',0.071466,1056,1511926952),(1027,26,1,'{\"code\":1,\"info\":2}',0.0429749,1056,1511926954),(1028,26,1,'{\"code\":1,\"info\":2}',0.043607,1056,1511926956),(1029,26,1,'{\"code\":1,\"info\":2}',0.104138,1056,1511926958),(1030,26,1,'{\"code\":1,\"info\":2}',0.0503209,1056,1511926960),(1031,26,1,'{\"code\":1,\"info\":2}',0.0415258,1056,1511926962),(1032,26,1,'{\"code\":1,\"info\":2}',0.044421,1056,1511926964),(1033,26,1,'{\"code\":1,\"info\":2}',0.0426941,1056,1511926966),(1034,26,1,'{\"code\":1,\"info\":2}',0.0425498,1056,1511926968),(1035,26,1,'{\"code\":1,\"info\":2}',0.0441451,1056,1511926970),(1036,26,1,'{\"code\":1,\"info\":2}',0.0449369,1056,1511926972),(1037,26,1,'{\"code\":1,\"info\":2}',0.039871,1056,1511926974),(1038,26,1,'{\"code\":1,\"info\":2}',0.0436628,1056,1511926976),(1039,26,1,'{\"code\":1,\"info\":2}',0.041826,1056,1511926978),(1040,26,1,'{\"code\":1,\"info\":2}',0.0430679,1056,1511926980),(1041,26,1,'{\"code\":1,\"info\":2}',0.0409651,1056,1511926982),(1042,26,1,'{\"code\":1,\"info\":2}',0.0441341,1056,1511926984),(1043,26,1,'{\"code\":1,\"info\":2}',0.0407591,1056,1511926986),(1044,26,1,'{\"code\":1,\"info\":2}',0.0419428,1056,1511926988),(1045,26,1,'{\"code\":1,\"info\":2}',0.10736,1056,1511926990),(1046,26,1,'{\"code\":1,\"info\":2}',0.044663,1056,1511926992),(1047,26,1,'{\"code\":1,\"info\":2}',0.0325038,1056,1511926994),(1048,26,1,'{\"code\":1,\"info\":2}',0.0396502,1056,1511926996),(1049,26,1,'{\"code\":1,\"info\":2}',0.040844,1056,1511926998),(1050,26,1,'{\"code\":1,\"info\":2}',0.039361,1056,1511927000),(1051,26,1,'{\"code\":1,\"info\":2}',0.0403731,1056,1511927002),(1052,26,1,'{\"code\":1,\"info\":2}',0.040246,1056,1511927004),(1053,26,1,'{\"code\":1,\"info\":2}',0.041183,1056,1511927006),(1054,26,1,'{\"code\":1,\"info\":2}',0.040221,1056,1511927008),(1055,26,1,'{\"code\":1,\"info\":2}',0.040406,1056,1511927010),(1056,26,1,'{\"code\":1,\"info\":2}',0.0397899,1056,1511927012),(1057,26,1,'{\"code\":1,\"info\":2}',0.041358,1056,1511927014),(1058,26,1,'{\"code\":1,\"info\":2}',0.0409291,1056,1511927016),(1059,26,1,'{\"code\":1,\"info\":2}',0.041358,1056,1511927018),(1060,26,1,'{\"code\":1,\"info\":2}',0.0413959,1056,1511927020),(1061,26,1,'{\"code\":1,\"info\":2}',0.041225,1056,1511927022),(1062,26,1,'{\"code\":1,\"info\":2}',0.040719,1056,1511927024),(1063,26,1,'{\"code\":1,\"info\":2}',0.041723,1056,1511927026),(1064,26,1,'{\"code\":1,\"info\":2}',0.0424161,1056,1511927028),(1065,26,1,'{\"code\":1,\"info\":2}',0.0408111,1056,1511927030),(1066,26,1,'{\"code\":1,\"info\":2}',0.0392652,1056,1511927032),(1067,26,1,'{\"code\":1,\"info\":2}',0.0409691,1056,1511927034),(1068,26,1,'{\"code\":1,\"info\":2}',0.0408549,1056,1511927036),(1069,26,1,'{\"code\":1,\"info\":2}',0.040863,1056,1511927038),(1070,26,1,'{\"code\":1,\"info\":2}',0.0413918,1056,1511927040),(1071,26,1,'{\"code\":1,\"info\":2}',0.0415311,1056,1511927042),(1072,26,1,'{\"code\":1,\"info\":2}',0.0418558,1056,1511927044),(1073,26,1,'{\"code\":1,\"info\":2}',0.0413251,1056,1511927046),(1074,26,1,'{\"code\":1,\"info\":2}',0.0413251,1056,1511927048),(1075,26,1,'{\"code\":1,\"info\":2}',0.0414882,1056,1511927050),(1076,26,1,'{\"code\":1,\"info\":2}',0.041079,1056,1511927052),(1077,26,1,'{\"code\":1,\"info\":2}',0.041821,1056,1511927054),(1078,26,1,'{\"code\":1,\"info\":2}',0.0424421,1056,1511927056),(1079,26,1,'{\"code\":1,\"info\":2}',0.041177,1056,1511927058),(1080,26,1,'{\"code\":1,\"info\":2}',0.040941,1056,1511927060),(1081,26,1,'{\"code\":1,\"info\":2}',0.041759,1056,1511927062),(1082,26,1,'{\"code\":1,\"info\":2}',0.0416729,1056,1511927064),(1083,26,1,'{\"code\":1,\"info\":2}',0.0421109,1056,1511927066),(1084,26,1,'{\"code\":1,\"info\":2}',0.040688,1056,1511927068),(1085,26,1,'{\"code\":1,\"info\":2}',0.040956,1056,1511927070),(1086,26,1,'{\"code\":1,\"info\":2}',0.041271,1056,1511927072),(1087,26,1,'{\"code\":1,\"info\":2}',0.0416439,1056,1511927074),(1088,26,1,'{\"code\":1,\"info\":2}',0.041266,1056,1511927076),(1089,26,1,'{\"code\":1,\"info\":2}',0.0404341,1056,1511927078),(1090,26,1,'{\"code\":1,\"info\":2}',0.0407329,1056,1511927080),(1091,26,1,'{\"code\":1,\"info\":2}',0.041333,1056,1511927082),(1092,26,1,'{\"code\":1,\"info\":2}',0.0426011,1056,1511927084),(1093,26,1,'{\"code\":1,\"info\":2}',0.040875,1056,1511927086),(1094,26,1,'{\"code\":1,\"info\":2}',0.0409338,1056,1511927088),(1095,26,1,'{\"code\":1,\"info\":2}',0.0409818,1056,1511927090),(1096,26,1,'{\"code\":1,\"info\":2}',0.0414751,1056,1511927092),(1097,26,1,'{\"code\":1,\"info\":2}',0.0381522,1056,1511927094),(1098,26,1,'{\"code\":1,\"info\":2}',0.0399981,1056,1511927096),(1099,26,1,'{\"code\":1,\"info\":2}',0.0430281,1056,1511927098),(1100,26,1,'{\"code\":1,\"info\":2}',0.041744,1056,1511927100),(1101,26,1,'{\"code\":1,\"info\":2}',0.0411022,1056,1511927102),(1102,26,1,'{\"code\":1,\"info\":2}',0.0400529,1056,1511927104),(1103,26,1,'{\"code\":1,\"info\":2}',0.0420609,1056,1511927106),(1104,26,1,'{\"code\":1,\"info\":2}',0.062099,1056,1511927108),(1105,26,1,'{\"code\":1,\"info\":2}',0.0414698,1056,1511927110),(1106,26,1,'{\"code\":1,\"info\":2}',0.0530958,1056,1511927112),(1107,26,1,'{\"code\":1,\"info\":2}',0.041537,1056,1511927114),(1108,26,1,'{\"code\":1,\"info\":2}',0.055428,1056,1511927116),(1109,26,1,'{\"code\":1,\"info\":2}',0.041961,1056,1511927118),(1110,26,1,'{\"code\":1,\"info\":2}',0.0405278,1056,1511927120),(1111,26,1,'{\"code\":1,\"info\":2}',0.0423892,1056,1511927122),(1112,26,1,'{\"code\":1,\"info\":2}',0.0405791,1056,1511927124),(1113,26,1,'{\"code\":1,\"info\":2}',0.040231,1056,1511927126),(1114,26,1,'{\"code\":1,\"info\":2}',0.041533,1056,1511927128),(1115,26,1,'{\"code\":1,\"info\":2}',0.0425181,1056,1511927130),(1116,26,1,'{\"code\":1,\"info\":2}',0.044817,1056,1511927132),(1117,26,1,'{\"code\":1,\"info\":2}',0.0607538,1056,1511927134),(1118,26,1,'{\"code\":1,\"info\":2}',0.0953109,1056,1511927136),(1119,26,1,'{\"code\":1,\"info\":2}',0.044044,1056,1511927138),(1120,26,1,'{\"code\":1,\"info\":2}',0.043164,1056,1511927140),(1121,26,1,'{\"code\":1,\"info\":2}',0.228158,1056,1511927142),(1122,26,1,'{\"code\":1,\"info\":2}',0.045155,1056,1511927144),(1123,26,1,'{\"code\":1,\"info\":2}',0.044538,1056,1511927146),(1124,26,1,'{\"code\":1,\"info\":2}',0.246897,1056,1511927733),(1125,26,1,'{\"code\":1,\"info\":2}',0.0433581,1056,1511927734),(1126,26,1,'{\"code\":1,\"info\":2}',0.046304,1056,1511927736),(1127,26,1,'{\"code\":1,\"info\":2}',0.048589,1056,1511927738),(1128,26,1,'{\"code\":1,\"info\":2}',0.092592,1056,1511927741),(1129,26,1,'{\"code\":1,\"info\":2}',0.0479341,1056,1511927742),(1130,26,1,'{\"code\":1,\"info\":2}',0.040689,1056,1511927744),(1131,26,1,'{\"code\":1,\"info\":2}',0.068213,1056,1511927746),(1132,26,1,'{\"code\":1,\"info\":2}',0.0412459,1056,1511927748),(1133,26,1,'{\"code\":1,\"info\":2}',0.040695,1056,1511927750),(1134,26,1,'{\"code\":1,\"info\":2}',0.0426731,1056,1511927752),(1135,26,1,'{\"code\":1,\"info\":2}',0.0417218,1056,1511927754),(1136,26,1,'{\"code\":1,\"info\":2}',0.0430739,1056,1511927756),(1137,26,1,'{\"code\":1,\"info\":2}',0.0423539,1056,1511927758),(1138,26,1,'{\"code\":1,\"info\":2}',0.0436609,1056,1511927760),(1139,26,1,'{\"code\":1,\"info\":2}',0.0430951,1056,1511927762),(1140,26,1,'{\"code\":1,\"info\":2}',0.0408881,1056,1511927764),(1141,26,1,'{\"code\":1,\"info\":2}',0.0432041,1056,1511927766),(1142,26,1,'{\"code\":1,\"info\":2}',0.044744,1056,1511927768),(1143,26,1,'{\"code\":1,\"info\":2}',0.042407,1056,1511927770),(1144,26,1,'{\"code\":1,\"info\":2}',0.0445352,1056,1511927772),(1145,26,1,'{\"code\":1,\"info\":2}',0.119019,1056,1511927775),(1146,26,1,'{\"code\":1,\"info\":2}',0.0447252,1056,1511927776),(1147,26,1,'{\"code\":1,\"info\":2}',0.0401869,1056,1511927778),(1148,26,1,'{\"code\":1,\"info\":2}',0.038991,1056,1511927780),(1149,26,1,'{\"code\":1,\"info\":2}',0.0413909,1056,1511927782),(1150,26,1,'{\"code\":1,\"info\":2}',0.0396838,1056,1511927784),(1151,26,1,'{\"code\":1,\"info\":2}',0.0404091,1056,1511927786),(1152,26,1,'{\"code\":1,\"info\":2}',0.0411789,1056,1511927788),(1153,26,1,'{\"code\":1,\"info\":2}',0.0407629,1056,1511927790),(1154,26,1,'{\"code\":1,\"info\":2}',0.0404551,1056,1511927792),(1155,26,1,'{\"code\":1,\"info\":2}',0.0403709,1056,1511927794),(1156,26,1,'{\"code\":1,\"info\":2}',0.0403829,1056,1511927796),(1157,26,1,'{\"code\":1,\"info\":2}',0.040102,1056,1511927799),(1158,26,1,'{\"code\":1,\"info\":2}',0.0389891,1056,1511927801),(1159,26,1,'{\"code\":1,\"info\":2}',0.0401151,1056,1511927803),(1160,26,1,'{\"code\":1,\"info\":2}',0.0405259,1056,1511927805),(1161,26,1,'{\"code\":1,\"info\":2}',0.040508,1056,1511927807),(1162,26,1,'{\"code\":1,\"info\":2}',0.0393088,1056,1511927809),(1163,26,1,'{\"code\":1,\"info\":2}',0.041486,1056,1511927811),(1164,26,1,'{\"code\":1,\"info\":2}',0.0394151,1056,1511927813),(1165,26,1,'{\"code\":1,\"info\":2}',0.051466,1056,1511927815),(1166,26,1,'{\"code\":1,\"info\":2}',0.039772,1056,1511927817),(1167,26,1,'{\"code\":1,\"info\":2}',0.0379219,1056,1511927819),(1168,26,1,'{\"code\":1,\"info\":2}',0.0410089,1056,1511927821),(1169,26,1,'{\"code\":1,\"info\":2}',0.038738,1056,1511927823),(1170,26,1,'{\"code\":1,\"info\":2}',0.035471,1056,1511927825),(1171,26,1,'{\"code\":1,\"info\":2}',0.0396669,1056,1511927827),(1172,26,1,'{\"code\":1,\"info\":2}',0.037338,1056,1511927829),(1173,26,1,'{\"code\":1,\"info\":2}',0.036911,1056,1511927831),(1174,26,1,'{\"code\":1,\"info\":2}',0.0397232,1056,1511927833),(1175,26,1,'{\"code\":1,\"info\":2}',0.039412,1056,1511927835),(1176,26,1,'{\"code\":1,\"info\":2}',0.0390849,1056,1511927837),(1177,26,1,'{\"code\":1,\"info\":2}',0.0371749,1056,1511927839),(1178,26,1,'{\"code\":1,\"info\":2}',0.038574,1056,1511927841),(1179,26,1,'{\"code\":1,\"info\":2}',0.0360088,1056,1511927843),(1180,26,1,'{\"code\":1,\"info\":2}',0.0401042,1056,1511927845),(1181,26,1,'{\"code\":1,\"info\":2}',0.0441549,1056,1511927847),(1182,26,1,'{\"code\":1,\"info\":2}',0.0420661,1056,1511927849),(1183,26,1,'{\"code\":1,\"info\":2}',0.049221,1056,1511927851),(1184,26,1,'{\"code\":1,\"info\":2}',0.041882,1056,1511927854),(1185,26,1,'{\"code\":1,\"info\":2}',0.040448,1056,1511927856),(1186,26,1,'{\"code\":1,\"info\":2}',0.042918,1056,1511927858),(1187,26,1,'{\"code\":1,\"info\":2}',0.0422521,1056,1511927860),(1188,26,1,'{\"code\":1,\"info\":2}',0.0389891,1056,1511927862),(1189,26,1,'{\"code\":1,\"info\":2}',0.0397198,1056,1511927864),(1190,26,1,'{\"code\":1,\"info\":2}',0.0425041,1056,1511927866),(1191,26,1,'{\"code\":1,\"info\":2}',0.043643,1056,1511927868),(1192,26,1,'{\"code\":1,\"info\":2}',0.040288,1056,1511927870),(1193,26,1,'{\"code\":1,\"info\":2}',0.0609071,1056,1511927872),(1194,26,1,'{\"code\":1,\"info\":2}',0.0348871,1056,1511927874),(1195,26,1,'{\"code\":1,\"info\":2}',0.042686,1056,1511927876),(1196,26,1,'{\"code\":1,\"info\":2}',0.0383699,1056,1511927878),(1197,26,1,'{\"code\":1,\"info\":2}',0.0419681,1056,1511927880),(1198,26,1,'{\"code\":1,\"info\":2}',0.0461159,1056,1511927882),(1199,26,1,'{\"code\":1,\"info\":2}',0.0342269,1056,1511927884),(1200,26,1,'{\"code\":1,\"info\":2}',0.040874,1056,1511927886),(1201,26,1,'{\"code\":1,\"info\":2}',0.071306,1056,1511927888),(1202,26,1,'{\"code\":1,\"info\":2}',0.0514681,1056,1511927890),(1203,26,1,'{\"code\":1,\"info\":2}',0.0332909,1056,1511927892),(1204,26,1,'{\"code\":1,\"info\":2}',0.037746,1056,1511927894),(1205,26,1,'{\"code\":1,\"info\":2}',0.051899,1056,1511927896),(1206,26,1,'{\"code\":1,\"info\":2}',0.0520101,1056,1511927898),(1207,26,1,'{\"code\":1,\"info\":2}',0.037977,1056,1511927900),(1208,26,1,'{\"code\":1,\"info\":2}',0.0468311,1056,1511927902),(1209,26,1,'{\"code\":1,\"info\":2}',0.040143,1056,1511927904),(1210,26,1,'{\"code\":1,\"info\":2}',0.0475891,1056,1511927906),(1211,26,1,'{\"code\":1,\"info\":2}',0.0421689,1056,1511927908),(1212,26,1,'{\"code\":1,\"info\":2}',0.0449641,1056,1511927910),(1213,26,1,'{\"code\":1,\"info\":2}',0.040971,1056,1511927912),(1214,26,1,'{\"code\":1,\"info\":2}',0.074966,1056,1511927914),(1215,26,1,'{\"code\":1,\"info\":2}',0.036993,1056,1511927916),(1216,26,1,'{\"code\":1,\"info\":2}',0.042304,1056,1511927918),(1217,26,1,'{\"code\":1,\"info\":2}',0.0433071,1056,1511927920),(1218,26,1,'{\"code\":1,\"info\":2}',0.0387762,1056,1511927922),(1219,26,1,'{\"code\":1,\"info\":2}',0.0995569,1056,1511927924),(1220,26,1,'{\"code\":1,\"info\":2}',0.0472808,1056,1511927926),(1221,26,1,'{\"code\":1,\"info\":2}',0.0382552,1056,1511927928),(1222,26,1,'{\"code\":1,\"info\":2}',0.0419011,1056,1511927930),(1223,26,1,'{\"code\":1,\"info\":2}',0.0423341,1056,1511927932),(1224,26,1,'{\"code\":1,\"info\":2}',0.0782909,1056,1511927934),(1225,26,1,'{\"code\":1,\"info\":2}',0.0703101,1056,1511927936),(1226,26,1,'{\"code\":1,\"info\":2}',0.0407529,1056,1511927938),(1227,26,1,'{\"code\":1,\"info\":2}',0.0419881,1056,1511927940),(1228,26,1,'{\"code\":1,\"info\":2}',0.120814,1056,1511927942),(1229,26,1,'{\"code\":1,\"info\":2}',0.0475671,1056,1511927944),(1230,26,1,'{\"code\":1,\"info\":2}',0.0521669,1056,1511927946),(1231,26,1,'{\"code\":1,\"info\":2}',0.119626,1056,1511927948),(1232,26,1,'{\"code\":1,\"info\":2}',0.045187,1056,1511927950),(1233,26,1,'{\"code\":1,\"info\":2}',0.05323,1056,1511927952),(1234,26,1,'{\"code\":1,\"info\":2}',0.0866928,1056,1511927954),(1235,26,1,'{\"code\":1,\"info\":2}',0.0695701,1056,1511927956),(1236,26,1,'{\"code\":1,\"info\":2}',0.0543568,1056,1511927958),(1237,26,1,'{\"code\":1,\"info\":2}',0.038651,1056,1511927960),(1238,26,1,'{\"code\":1,\"info\":2}',0.0407391,1056,1511927962),(1239,26,1,'{\"code\":1,\"info\":2}',0.0431809,1056,1511927964),(1240,26,1,'{\"code\":1,\"info\":2}',0.043709,1056,1511927966),(1241,26,1,'{\"code\":1,\"info\":2}',0.0418789,1056,1511927968),(1242,26,1,'{\"code\":1,\"info\":2}',0.0412869,1056,1511927970),(1243,26,1,'{\"code\":1,\"info\":2}',0.041147,1056,1511927972),(1244,26,1,'{\"code\":1,\"info\":2}',0.041595,1056,1511927974),(1245,26,1,'{\"code\":1,\"info\":2}',0.0422521,1056,1511927976),(1246,26,1,'{\"code\":1,\"info\":2}',0.041013,1056,1511927978),(1247,26,1,'{\"code\":1,\"info\":2}',0.040683,1056,1511927980),(1248,26,1,'{\"code\":1,\"info\":2}',0.039741,1056,1511927982),(1249,26,1,'{\"code\":1,\"info\":2}',0.108147,1056,1511927984),(1250,26,1,'{\"code\":1,\"info\":2}',0.043983,1056,1511927986),(1251,26,1,'{\"code\":1,\"info\":2}',0.0445549,1056,1511927988),(1252,26,1,'{\"code\":1,\"info\":2}',0.0425241,1056,1511927990),(1253,26,1,'{\"code\":1,\"info\":2}',0.042825,1056,1511927992),(1254,26,1,'{\"code\":1,\"info\":2}',0.0394149,1056,1511927994),(1255,26,1,'{\"code\":1,\"info\":2}',0.0401461,1056,1511927996),(1256,26,1,'{\"code\":1,\"info\":2}',0.069283,1056,1511927998),(1257,26,1,'{\"code\":1,\"info\":2}',0.0881948,1056,1511928000),(1258,26,1,'{\"code\":1,\"info\":2}',0.0445619,1056,1511928002),(1259,26,1,'{\"code\":1,\"info\":2}',0.0429091,1056,1511928004),(1260,26,1,'{\"code\":1,\"info\":2}',0.0412719,1056,1511928006),(1261,26,1,'{\"code\":1,\"info\":2}',0.0948641,1056,1511928008),(1262,26,1,'{\"code\":1,\"info\":2}',0.0599351,1056,1511928010);
/*!40000 ALTER TABLE `t_cron_log_S` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_T`
--

DROP TABLE IF EXISTS `t_cron_log_T`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_T` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_T`
--

LOCK TABLES `t_cron_log_T` WRITE;
/*!40000 ALTER TABLE `t_cron_log_T` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_T` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_U`
--

DROP TABLE IF EXISTS `t_cron_log_U`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_U` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_U`
--

LOCK TABLES `t_cron_log_U` WRITE;
/*!40000 ALTER TABLE `t_cron_log_U` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_U` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_V`
--

DROP TABLE IF EXISTS `t_cron_log_V`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_V` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_V`
--

LOCK TABLES `t_cron_log_V` WRITE;
/*!40000 ALTER TABLE `t_cron_log_V` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_V` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_W`
--

DROP TABLE IF EXISTS `t_cron_log_W`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_W` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_W`
--

LOCK TABLES `t_cron_log_W` WRITE;
/*!40000 ALTER TABLE `t_cron_log_W` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_W` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_X`
--

DROP TABLE IF EXISTS `t_cron_log_X`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_X` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_X`
--

LOCK TABLES `t_cron_log_X` WRITE;
/*!40000 ALTER TABLE `t_cron_log_X` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_X` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_Y`
--

DROP TABLE IF EXISTS `t_cron_log_Y`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_Y` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_Y`
--

LOCK TABLES `t_cron_log_Y` WRITE;
/*!40000 ALTER TABLE `t_cron_log_Y` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_Y` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cron_log_Z`
--

DROP TABLE IF EXISTS `t_cron_log_Z`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cron_log_Z` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cl_status` tinyint(4) NOT NULL COMMENT '任务执行结果：1成功，2失败',
  `cl_result` varchar(255) NOT NULL COMMENT '任务执行结果',
  `cl_consume_time` float NOT NULL COMMENT '程序消耗时间,单位秒',
  `cl_consume_memory` int(11) NOT NULL COMMENT '消耗内存,单位字节',
  `cl_datetime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cron_log_Z`
--

LOCK TABLES `t_cron_log_Z` WRITE;
/*!40000 ALTER TABLE `t_cron_log_Z` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cron_log_Z` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `u_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `u_username` varchar(20) NOT NULL COMMENT '员工用户名',
  `u_realname` varchar(20) NOT NULL COMMENT '员工真实名称',
  `u_password` char(32) NOT NULL COMMENT '密码',
  `u_phone` varchar(11) NOT NULL COMMENT '电话',
  `u_email` varchar(50) NOT NULL COMMENT '邮件',
  `u_role` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '员工权限： 1-普通员工; 2-系统管理员',
  `u_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态，1: 可用，2:禁用',
  `u_addtime` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`u_id`),
  KEY `username` (`u_username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1042 DEFAULT CHARSET=utf8 COMMENT='员工登陆相关信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1001,' admin','admin','2bb079b78672d94de23af4d9bb5837a4','13600000000','',2,1,'2016-09-19 11:40:52'),(1041,'xiaoman','章小慢','2bb079b78672d94de23af4d9bb5837a4','13600000000','xiaoman@wulibb.com',1,1,'2016-09-19 16:15:06');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-30 15:33:43
