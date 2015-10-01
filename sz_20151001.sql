-- MySQL dump 10.13  Distrib 5.1.73, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: sz
-- ------------------------------------------------------
-- Server version	5.1.73-0ubuntu0.10.04.1-log

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
-- Table structure for table `yourphp_access`
--

DROP TABLE IF EXISTS `yourphp_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_access` (
  `role_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `node_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `model` varchar(50) NOT NULL DEFAULT '',
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_access`
--

LOCK TABLES `yourphp_access` WRITE;
/*!40000 ALTER TABLE `yourphp_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_area`
--

DROP TABLE IF EXISTS `yourphp_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_area`
--

LOCK TABLES `yourphp_area` WRITE;
/*!40000 ALTER TABLE `yourphp_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_article`
--

DROP TABLE IF EXISTS `yourphp_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_article` (
  `id` mediumint(8) unsigned NOT NULL,
  `copyfrom` varchar(55) NOT NULL DEFAULT '',
  `fromlink` varchar(80) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_article`
--

LOCK TABLES `yourphp_article` WRITE;
/*!40000 ALTER TABLE `yourphp_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_attachment`
--

DROP TABLE IF EXISTS `yourphp_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` int(8) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(50) NOT NULL DEFAULT '',
  `filepath` varchar(80) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL DEFAULT '',
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_attachment`
--

LOCK TABLES `yourphp_attachment` WRITE;
/*!40000 ALTER TABLE `yourphp_attachment` DISABLE KEYS */;
INSERT INTO `yourphp_attachment` VALUES (1,10,0,1,'s1.jpg','/Uploads/201407/53c23876d8ead.jpg',16176,'jpg',1,0,1,1405237366,'127.0.0.1',1),(2,10,0,5,'s1.jpg','/Uploads/201407/53c23e178d550.jpg',16176,'jpg',1,0,1,1405238807,'127.0.0.1',1),(3,10,0,6,'s1.jpg','/Uploads/201407/53c23f88c738f.jpg',16176,'jpg',1,0,1,1405239176,'127.0.0.1',1),(17,10,0,3,'1.png','/Uploads/201410/5448f594254fa.png',3792,'png',1,0,1,1414067604,'58.62.105.94',1),(5,10,0,6,'QQ截图20140825145807.jpg','/Uploads/201408/53fadc99f381f.jpg',34472,'jpg',1,0,1,1408949401,'183.2.140.148',1),(6,10,0,7,'d62a6059252dd42a878297de033b5bb5c9eab838.jpg','/Uploads/201408/53fc5b3307278.jpg',98586,'jpg',1,0,1,1409047347,'61.140.49.251',1),(18,11,0,6,'1.png','/Uploads/201410/5448f72963dec.png',3792,'png',1,0,1,1414068009,'58.62.105.94',1),(20,17,0,2,'wuliu8-v1005-201411151909.apk','/Uploads/201411/546735009846d.apk',2470807,'apk',0,0,1,1416049920,'113.119.140.156',1),(21,17,0,2,'wuliu8-v1006-20141117.apk','/Uploads/201411/54699770e1b82.apk',2470757,'apk',0,0,1,1416206192,'113.67.219.124',1),(10,10,0,8,'A000侧滑菜单.jpg','/Uploads/201409/54070f0e1172c.jpg',108694,'jpg',1,0,1,1409748750,'219.136.29.3',1),(11,10,0,9,'device-2014-09-21-110044.png','/Uploads/201409/541e7827d34dd.png',240655,'png',1,0,1,1411282983,'27.47.129.100',1),(19,17,0,2,'wuliu8-v1003-201410231545.apk','/Uploads/201410/544b0664cafbc.apk',2580559,'apk',0,0,1,1414202980,'113.105.139.212',1),(22,11,0,0,'QQ图片20150113141515.JPG','/Uploads/201501/54b4b89b5bd11.jpg',69430,'jpg',1,0,1,1421129883,'121.15.51.238',0),(23,10,0,1,'QQ图片20150113141515.JPG','/Uploads/201501/54b4b958903af.jpg',69430,'jpg',1,0,1,1421130072,'121.15.51.238',1),(24,10,0,1,'s_635283373786281285.jpg','/Uploads/201501/54b4b99e5b73b.jpg',184160,'jpg',1,0,1,1421130142,'121.15.51.238',1),(25,11,0,73,'12445502.jpg','/Uploads/201501/54b5f4ab1fca1.jpg',52829,'jpg',1,0,1,1421210795,'14.127.205.249',1);
/*!40000 ALTER TABLE `yourphp_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_block`
--

DROP TABLE IF EXISTS `yourphp_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pos` char(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_block`
--

LOCK TABLES `yourphp_block` WRITE;
/*!40000 ALTER TABLE `yourphp_block` DISABLE KEYS */;
INSERT INTO `yourphp_block` VALUES (1,'about','首页公司简介',1,'<img src=\"Template/Default/images/cpbox.jpg\" alt=\"\" align=\"left\" height=\"160\" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yourphp网站管理系统,是一款完全开源免费的PHP+MYSQL系统.核心采用了Thinkphp框架等众多开源软件,同时核心功能也作为开源软件发布。 集众多开源项目于一身的特点,使本系统从安全,效率,易用及可扩展性上更加突出.程序内置SEO优化机制，使企业网站更容易被推广.拥有企业网站常用的模块功能（企业简介模块、新闻模块、产品模块、下载模块、图片模块、招聘模块、在线留言、友情链接、会员与权限管理）。'),(2,'contact','右侧联系我们',1,'<li><label>电 &nbsp;&nbsp;话:</label>0317-5022625</li> <li><label>手 &nbsp;&nbsp;机:</label>13290000000</li> <li><label>联系人:</label>liuxun</li> <li><label>邮 &nbsp;&nbsp;箱:</label>admin@yourphp.cn</li> <li><label>网 &nbsp;&nbsp;址:</label>http://www.yourphp.cn</li> <li><label>地 &nbsp;&nbsp;址:</label>河北省沧州市肃宁县宅南村</li> '),(3,'footer','页底',1,'<p>Powered by <a href=\"http://www.yourphp.cn\" target=\"_blank\"><span style=\"color:#000000;\">Yourphp</span></a> 版权所有 &copy; 2008-2011, All right reserved</p>'),(4,'about','index about',2,'Yourphp site management system, is a completely free open source PHP+MYSQL system. The core uses Thinkphp frame and many other open source software, at the same time the core function is also released as open source software. Set many open source projects in a characteristic, make the system from the security, efficiency, ease of use and scalability is more outstanding. Program built-in SEO optimization mechanism, make the enterprise website is easier to spread. Has the enterprise web site commonly used modules ( company profile module, news module, module, module, the picture download module, recruitment, online messages, links, membership and rights management ).'),(5,'contact','contact us',2,'<li><label>Tel:</label>0317-5022625</li> <li><label>Mobile:</label>13292793176</li> <li><label>Contact:</label>liuxun</li> <li><label>Email:</label>admin@yourphp.cn</li> <li><label>Site:</label>http://demo2.yourphp.cn</li> <li><label>Address:</label>China Hebei suning</li> '),(6,'footer','footer',2,'Powered by <a href=\"http://www.yourphp.cn\" target=\"_blank\">Yourphp</a>&nbsp;&nbsp;Copyright &copy; 2008-2011, All right reserved<br />');
/*!40000 ALTER TABLE `yourphp_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_carsrc`
--

DROP TABLE IF EXISTS `yourphp_carsrc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_carsrc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_s` int(11) unsigned NOT NULL DEFAULT '0',
  `date_f` int(11) unsigned NOT NULL DEFAULT '0',
  `exp` mediumtext NOT NULL,
  `car_master` varchar(255) NOT NULL DEFAULT '',
  `car_phone` varchar(255) NOT NULL DEFAULT '',
  `car_vin` varchar(255) NOT NULL DEFAULT '',
  `car_number` varchar(255) NOT NULL DEFAULT '',
  `car_long` varchar(50) NOT NULL DEFAULT '0',
  `start_name` varchar(50) NOT NULL,
  `end_name` varchar(50) NOT NULL,
  `s_province` int(11) NOT NULL,
  `s_city` int(11) NOT NULL,
  `s_town` int(11) NOT NULL,
  `e_province` int(11) NOT NULL,
  `e_city` int(11) NOT NULL,
  `e_town` int(11) NOT NULL,
  `car_load` varchar(255) NOT NULL DEFAULT '',
  `car_driver_type` varchar(255) NOT NULL DEFAULT '',
  `car_type` varchar(255) NOT NULL DEFAULT '',
  `car_status` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_carsrc`
--

LOCK TABLES `yourphp_carsrc` WRITE;
/*!40000 ALTER TABLE `yourphp_carsrc` DISABLE KEYS */;
INSERT INTO `yourphp_carsrc` VALUES (1,0,1,'','',0,0,0,1,28,1422529189,1422700200,'','','','','','9','浙江 金华 婺城区','福建 三明 梅列区',0,0,3255,0,0,575,'40','','货车','前四后八'),(2,0,1,'','',0,0,0,1,34,1429949470,0,'','罗升勤','18773178979','','湘M52292','9','湖南 永州 江华','湖南 长沙 长沙县',0,0,1741,0,0,1654,'18','本地车','货车','单桥'),(3,0,1,'','',0,0,0,1,34,1429949676,1429948800,'','罗升勤','18773178979','','湘M52292','9','湖南 永州 江华','广东 广州 市郊',0,0,1741,0,0,704,'16','本地车','货车','高栏');
/*!40000 ALTER TABLE `yourphp_carsrc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_carsrcfavo`
--

DROP TABLE IF EXISTS `yourphp_carsrcfavo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_carsrcfavo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `carsrc_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`carsrc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_carsrcfavo`
--

LOCK TABLES `yourphp_carsrcfavo` WRITE;
/*!40000 ALTER TABLE `yourphp_carsrcfavo` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_carsrcfavo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_carsrcinform`
--

DROP TABLE IF EXISTS `yourphp_carsrcinform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_carsrcinform` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `carsrc_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`carsrc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_carsrcinform`
--

LOCK TABLES `yourphp_carsrcinform` WRITE;
/*!40000 ALTER TABLE `yourphp_carsrcinform` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_carsrcinform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_carsrcpub`
--

DROP TABLE IF EXISTS `yourphp_carsrcpub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_carsrcpub` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `carsrc_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_carsrcpub`
--

LOCK TABLES `yourphp_carsrcpub` WRITE;
/*!40000 ALTER TABLE `yourphp_carsrcpub` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_carsrcpub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_cart`
--

DROP TABLE IF EXISTS `yourphp_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sessionid` char(32) NOT NULL DEFAULT '',
  `moduleid` smallint(3) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_thumb` varchar(120) NOT NULL DEFAULT '',
  `product_name` varchar(120) NOT NULL DEFAULT '',
  `product_url` varchar(120) NOT NULL DEFAULT '',
  `product_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr` text NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isgift` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessionid` (`sessionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_cart`
--

LOCK TABLES `yourphp_cart` WRITE;
/*!40000 ALTER TABLE `yourphp_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_category`
--

DROP TABLE IF EXISTS `yourphp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `catname` varchar(30) NOT NULL DEFAULT '',
  `catdir` varchar(30) NOT NULL DEFAULT '',
  `parentdir` varchar(50) NOT NULL DEFAULT '',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `moduleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `module` char(24) NOT NULL DEFAULT '',
  `arrparentid` varchar(255) NOT NULL DEFAULT '',
  `arrchildid` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `keywords` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT '',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(150) NOT NULL DEFAULT '',
  `template_list` varchar(20) NOT NULL DEFAULT '',
  `template_show` varchar(20) NOT NULL DEFAULT '',
  `pagesize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `listtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlruleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `presentpoint` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `chargepoint` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `repeatchargedays` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `postgroup` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_category`
--

LOCK TABLES `yourphp_category` WRITE;
/*!40000 ALTER TABLE `yourphp_category` DISABLE KEYS */;
INSERT INTO `yourphp_category` VALUES (1,'新闻中心','news','',0,2,'Article','0','1,2,3,10,16',0,'公司新闻11','公司新闻','公司新闻',0,0,1,0,'',1,'/index.php?m=Article&a=index&id=1','','',0,'',1,1,4,0,0,0,0,''),(2,'行业新闻','hangye','news/',1,2,'Article','0,1','2',0,'行业新闻','行业新闻','行业新闻',0,0,1,0,'',0,'/index.php?m=Article&a=index&id=2','','',0,'',0,1,4,0,0,0,0,''),(3,'公司新闻','gongsi','news/',1,2,'Article','0,1','3',0,'公司新闻','公司新闻','公司新闻',0,0,1,0,'',0,'/index.php?m=Article&a=index&id=3','','',0,'',0,1,4,0,0,0,0,''),(4,'产品展示','Product','',0,3,'Product','0','4,5,6,7,9,13',0,'产品展示标题','产品展示关键词','产品展示栏目简介',0,0,1,0,'',1,'/index.php?m=Product&a=index&id=4','','',0,'',0,1,0,0,0,0,0,''),(5,'产品分类1','cp1','Product/',4,3,'Product','0,4','5',0,'产品分类1','产品分类1产品分类1','产品分类1',0,0,1,0,'',0,'/index.php?m=Product&a=index&id=5','','',0,'2,3,4',0,1,0,0,0,0,0,''),(6,'产品分类2','cp2','Product/',4,3,'Product','0,4','6',0,'产品分类2','产品分类2','产品分类2',0,0,1,0,'',0,'/index.php?m=Product&a=index&id=6','','',0,'',0,1,0,0,0,0,0,''),(7,'产品分类3','cp3','Product/',4,3,'Product','0,4','7',0,'产品分类3','产品分类3','产品分类3',0,0,1,0,'',0,'/index.php?m=Product&a=index&id=7','','',0,'',0,1,0,0,0,0,0,''),(8,'关于我们','about','',0,1,'Page','0','8,11,12',0,'','','',99,0,1,0,'',1,'/index.php?m=Page&a=index&id=8','','',0,'',0,1,0,0,0,0,0,''),(10,'行业资讯','zixun','news/',1,2,'Article','0,1','10',0,'','','',0,0,1,0,'',0,'/index.php?m=Article&a=index&id=10','','',0,'',0,1,4,0,0,0,0,''),(13,'产品分类5','cp5','Product/cp4/',9,3,'Product','0,4,9','13',0,'','','',0,0,1,0,'',0,'/index.php?m=Product&a=index&id=13','','Product_show',0,'',0,1,0,0,0,0,0,''),(9,'产品分类4','cp4','Product/',4,3,'Product','0,4','9,13',0,'','','',0,0,1,0,'',1,'/index.php?m=Product&a=index&id=9','','',0,'2,3',0,1,0,0,0,0,0,''),(11,'公司简介','info','about/',8,1,'Page','0,8','11',0,'','','',0,0,1,0,'',0,'/index.php?m=Page&a=index&id=11','','',0,'',0,1,0,0,0,0,0,''),(12,'联系我们','contactus','about/',8,1,'Page','0,8','12',0,'联系我们','联系我们','联系我们',0,0,1,0,'',0,'/index.php?m=Page&a=index&id=12','','',0,'',0,1,0,0,0,0,0,''),(14,'图片展示','pics','',0,4,'Picture','0','14',0,'','','',0,0,1,0,'',0,'/index.php?m=Picture&a=index&id=14','','',0,'',0,1,0,0,0,0,0,''),(17,'文档下载','down','',0,5,'Download','0','17',0,'','','',0,0,1,0,'',0,'/index.php?m=Download&a=index&id=17','','',0,'',0,1,0,0,0,0,0,''),(16,'国内新闻','cnnews','news/',1,2,'Article','0,1','16',0,'','','',0,0,1,0,'',0,'/index.php?m=Article&a=index&id=16','','',0,'',0,1,4,0,0,0,0,''),(18,'信息反馈','Feedback','Guestbook/',19,6,'Feedback','0,19','18',0,'','','',0,0,1,0,'',0,'/index.php?m=Feedback&a=index&id=18','','',0,'',0,1,0,0,0,0,0,'1,2,3,4'),(19,'在线留言','Guestbook','',0,8,'Guestbook','0','19,18',0,'','','',0,0,1,0,'',1,'/index.php?m=Guestbook&a=index&id=19','','',5,'',0,1,0,0,0,0,0,'1,2,3,4');
/*!40000 ALTER TABLE `yourphp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_companys`
--

DROP TABLE IF EXISTS `yourphp_companys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_companys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `is_recommend` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_approve` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `exp` mediumtext NOT NULL,
  `about` mediumtext NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `img_url` varchar(80) NOT NULL DEFAULT '',
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_companys`
--

LOCK TABLES `yourphp_companys` WRITE;
/*!40000 ALTER TABLE `yourphp_companys` DISABLE KEYS */;
INSERT INTO `yourphp_companys` VALUES (1,1,1,'admin','/index.php?m=&a=show&id=1',1,1421129140,1421210169,1,'深圳市龙岗区平湖镇平安大道乾龙物流园4栋',1,1,'品质源于服务、好友物流汇集好友、传递快乐  全国免费热线：4008356568','好友汇品牌实现货运公路物流的全程信息化服务，从全程全自动的条码分拣、装载、配送，减低流通环节中的货损、货差，客户通过互联网、400电话以及移动终端APP随时跟踪货物运输的全过程，做到物流全流程信息透明及互通。','深圳市好友汇物流有限公司','/Uploads/201501/54b4b99e5b73b.jpg',88),(2,1,1,'admin','/index.php?m=&a=show&id=2',0,1421209589,1421209596,1,'深圳市龙岗区布吉李朗大道宝丹路宝鼎威货运市场A区19-20号',1,1,'深圳唯一一家直达宜昌、荆州专线！','深圳市华安通物流有限公司成立于2006年，公司自成立以来，一直秉承“诚信为本，三方共赢，专线服务，力求完美”的服务宗旨，赢得广大客户的良好口碑，使公司得到迅速发展。','深圳市华安通物流有限公司','/Uploads/201501/9e3cc0f3685654199a4a0654f68dcb15.db',89),(3,1,1,'admin','',0,0,0,1,'深圳市罗湖区长城货代市场83号',0,0,'暂无经验说明','暂无公司简介','深圳深湘物流有限公司','/Uploads/201501/4b35a0a856e616eeceb2ed054ae3e20a.db',90),(4,1,1,'admin','/index.php?m=&a=show&id=4',0,1421210205,1421210208,1,'深圳市布吉丹竹头金鹏物流园A区C栋35-37号',0,1,'暂无经验说明','暂无公司简介','深圳永强阳光物流','/Uploads/201501/fbb1fad97fe5cff0542ebe2ea6747ee7.db',91),(5,1,1,'admin','',0,0,0,1,'深圳市龙华明治大道与民乐路交汇处深国际华通源物流中心C1区26-28档',0,0,'暂无经验说明','暂无公司简介','深圳立凯物流广西专线','/Uploads/201501/c21ca5fd4fc61407c992a400f47c348a.db',92),(6,1,1,'admin','',0,0,0,1,'深圳市布吉丹竹头金鹏物流园B区C栋34-38档',0,0,'暂无经验说明','暂无公司简介','深圳市吉运发物流有限公司','/Uploads/201501/1bcf3e7f57609d499b38dfd8ce76b2b2.db',93),(7,1,1,'admin','',0,0,0,1,'深圳市罗湖区清水河一路加油站旁',0,0,'暂无经验说明','暂无公司简介','深圳市诚信货运有限公司','/Uploads/201501/9d1f3dc8f58127b57e5fd5aa467d00e6.db',94),(8,1,1,'admin','',0,0,0,1,'深圳市龙华民治大道2号深国际华通源物流中心C1栋20号',0,0,'暂无经验说明','暂无公司简介','深圳市昌胜达物流','/Uploads/201501/7714bcb4aa9334dd6c59b089e17f3987.db',95),(9,1,1,'admin','',0,0,0,1,'深圳市龙岗区丹竹头金鹏物流园B区B栋25号',0,0,'全国免费热线：40063-88856','暂无公司简介','深圳市金华航物流','/Uploads/201501/a08ba0771cf9f78537c3a2d2f8f0b695.db',96),(10,1,1,'admin','',0,0,0,1,'深圳市龙岗区平湖白泥坑机荷高速平湖沙湾出口100米宇达物流园二期1栋',0,0,'暂无经验说明','暂无公司简介','深圳市速能快运','/Uploads/201501/ab679fcca9d1dbfe81979cce703dcac6.jpg',97),(11,1,1,'admin','',0,0,0,1,'深圳市布吉丹竹头金鹏物流园A区B栋52-56档',0,0,'暂无经验说明','暂无公司简介','深圳市粤发物流有限公司','/Uploads/201501/dd0f9b18645435b2290404769b075f25.jpg',98),(12,1,1,'admin','',0,0,0,1,'深圳市宝安区西乡镇宝运达物流中心综合楼2号',0,0,'暂无经验说明','暂无公司简介','深圳市长顺通货物运输有限公司','/Uploads/201501/a91e7fc0abee986d5e0c7e578c2a0373.jpg',99),(13,1,1,'admin','',0,0,0,1,'深圳市布吉镇李朗大道宝鼎威物流园A区43-47号',0,0,'全部集装箱运输、安全无破损！价格优惠力求为客户降低运输成本！全程高速直达万州：36小时到达','暂无公司简介','深圳市博弈通物流有限公司','/Uploads/201501/243b2e23c51b3299fb67e4df097d53dd.jpg',100),(14,1,1,'admin','',0,0,0,1,'深圳市布吉丹竹头金鹏物流园A区7栋15档',0,0,'福建、潮汕各种类型回程车调车专家，全市最低价！','暂无公司简介','深圳市鑫伟达物流','/Uploads/201501/c5f361f67df64d7525febbd09b2188be.jpg',101),(15,1,1,'admin','',0,0,0,1,'深圳市龙华民治华通源物流中心C4栋138-139号',0,0,'用心服务 合理的价格 天天发车 创山东精品专线','暂无公司简介','深圳市昇宏业物流有限公司','/Uploads/201501/fb8078e683cf332343983ce1e57cf1bb.jpg',102),(16,1,1,'admin','',0,0,0,1,'深圳市宝安西乡前进二路宝运达物流中心B区13号',0,0,'深圳收件热线：0755-22319843  普宁查货电话：0663-2929886','暂无公司简介','深圳市万物达物流有限公司','/Uploads/201501/433ca9ba5c3383aec3048df26fc5f218.jpg',103),(17,1,1,'admin','/index.php?m=&a=show&id=17',0,1421210229,1421210233,1,'深圳市布吉丹竹头金鹏物流园B区4栋37-40号',0,0,'服务 时效 质量 全程闭集装箱','暂无公司简介','深圳市纳百川物流','/Uploads/201501/1b27203507b7f100c692bba0fc3bf93b.jpg',104),(18,1,1,'admin','',0,0,0,1,'深圳市罗湖区宝岗路长城货运市场172号',0,0,'高效 安全 快捷 低价  川渝全境','暂无公司简介','深圳市中易达物流有限公司','/Uploads/201501/3c72a7417acd3a3c11096bf329d5347c.db',105),(19,1,1,'admin','',0,0,0,1,'深圳市布吉李朗东西干道南岭大龙山物流园G栋1-3号',0,0,'专线往返','暂无公司简介','深圳市鑫金叶物流有限公司','/Uploads/201501/8660e4a941ffa52a40dec3f003ac9671.db',106),(20,1,1,'admin','',0,0,0,1,'深圳市宝安石岩洲石路口石岩物流园32-38档',0,0,'暂无经验说明','暂无公司简介','深圳市鸿运通人物流有限公司','/Uploads/201501/43059c89cf633215d2e4df6a4ee93197.db',107),(21,1,1,'admin','',0,0,0,1,'深圳市布吉丹竹头金鹏物流园B区8栋3-5号',0,0,'邵阳专线！轻货100元/方    重货300元/吨','暂无公司简介','深圳市福鑫湘物流有限公司','/Uploads/201501/e391cdf8f3cc9db9809493b2f484deb5.db',108),(22,1,1,'admin','',0,0,0,1,'深圳市罗湖区清水河五路货运市场3档',0,0,'第二天上午8点准时到达','暂无公司简介','深圳市君通达物流','/Uploads/201501/fe89afa3bed497349e2bbef515a8d670.db',109),(23,1,1,'admin','',0,0,0,1,'深圳市布吉丹竹头金鹏物流园',0,0,'直达-邯郸  邢台450元/吨    130元/方','心物流   新管理  心承诺  新时代','深圳市捷安峰物流有限公司','/Uploads/201501/210cb35bf96d0dde9e67346568410a6d.db',110),(24,1,1,'admin','',0,0,0,1,'深圳市丹竹头金鹏物流园B区7栋8-17号',0,0,'暂无经验说明','暂无公司简介','深圳市天顺通达物流公司','/Uploads/201501/0046d88bb562159a399e4d93bc8e7beb.db',111),(25,1,1,'admin','',0,0,0,1,'深圳市布吉丹竹头金鹏物流园B区A16-19号',0,0,'专线汕头、揭阳、普宁、海丰特快往返','暂无公司简介','深圳市鹏发物流','/Uploads/201501/912592f78736dff91d36fb2931d7a118.db',112),(26,1,1,'admin','',0,0,0,1,'深圳市宝运达物流园A栋009-013档',0,0,'暂无经验说明','暂无公司简介','深圳市宏华物流','/Uploads/201501/b849ad87479da2098cbb82fb4c1e6b47.db',113),(27,1,1,'admin','',0,0,0,1,'深圳市龙华民治华通源物流中心C5栋183-185号',0,0,'全国公路整车  零担  铁路行包  集装箱运输  大宗货物空运  海运业务咨询','北京 天津 汽车专线  卡车航班  大量返程车辆，欢迎来电咨询，全粤最低价','深圳市龙达国际货运代理有限公司','/Uploads/201501/0ef451d228c6aae04ecf4b98e8f8b86a.db',114);
/*!40000 ALTER TABLE `yourphp_companys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_companysfavo`
--

DROP TABLE IF EXISTS `yourphp_companysfavo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_companysfavo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `company_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_companysfavo`
--

LOCK TABLES `yourphp_companysfavo` WRITE;
/*!40000 ALTER TABLE `yourphp_companysfavo` DISABLE KEYS */;
INSERT INTO `yourphp_companysfavo` VALUES (2,0,1,'','',0,0,0,1,21,13),(3,0,1,'','',0,0,0,1,13,15),(4,0,1,'','',0,0,0,1,24,13);
/*!40000 ALTER TABLE `yourphp_companysfavo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_config`
--

DROP TABLE IF EXISTS `yourphp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_config` (
  `varname` varchar(20) NOT NULL DEFAULT '',
  `info` varchar(100) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `value` text NOT NULL,
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `varname` (`varname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_config`
--

LOCK TABLES `yourphp_config` WRITE;
/*!40000 ALTER TABLE `yourphp_config` DISABLE KEYS */;
INSERT INTO `yourphp_config` VALUES ('site_name','网站名称',2,'物流8',1),('site_url','网站网址',2,'http://sz56568.com',1),('logo','网站LOGO',2,'/Public/Images/logo.gif',1),('site_email','站点邮箱',2,'zeekcen@gmail.com',1),('seo_title','网站标题',2,'yourphp企业网站管理系统-企业建站-企业网站-行业网站建设-门户网站建设',1),('seo_keywords','关键词',2,'物流8',1),('seo_description','网站简介',2,'',1),('mail_type','邮件发送模式',4,'1',0),('mail_server','邮件服务器',4,'smtp.qq.com',0),('mail_port','邮件发送端口',4,'25',0),('mail_from','发件人地址',4,'admin@yourphp.cn',0),('mail_auth','AUTH LOGIN验证',4,'1',0),('mail_user','验证用户名',4,'admin@yourphp.cn',0),('mail_password','验证密码',4,'',0),('attach_maxsize','允许上传附件大小',5,'5200000',0),('attach_allowext','允许上传附件类型',5,'jpg,jpeg,gif,png,doc,docx,rar,zip,swf',0),('watermark_enable','是否开启图片水印',5,'0',0),('watemard_text','水印文字内容',5,'YourPHP',0),('watemard_text_size','文字大小',5,'18',0),('watemard_text_color','watemard_text_color',5,'#FFFFFF',0),('watemard_text_face','字体',5,'elephant.ttf',0),('watermark_minwidth','图片最小宽度',5,'300',0),('watermark_minheight','水印最小高度',5,'300',0),('watermark_img','水印图片名称',5,'mark.png',0),('watermark_pct','水印透明度',5,'80',0),('watermark_quality','JPEG 水印质量',5,'100',0),('watermark_pospadding','水印边距',5,'10',0),('watermark_pos','水印位置',5,'9',0),('PAGE_LISTROWS','列表分页数',6,'15',0),('URL_MODEL','URL访问模式',6,'0',0),('URL_PATHINFO_DEPR','参数分割符',6,'/',0),('URL_HTML_SUFFIX','URL伪静态后缀',6,'.html',0),('TMPL_CACHE_ON','模板编译缓存',6,'0',0),('TMPL_CACHE_TIME','模板缓存有效期',6,'3600',0),('HTML_CACHE_ON','静态缓存',6,'0',0),('HTML_CACHE_TIME','缓存有效期',6,'3600',0),('HTML_READ_TYPE','缓存读取方式',6,'0',0),('HTML_FILE_SUFFIX','静态文件后缀',6,'.html',0),('ADMIN_ACCESS','ADMIN_ACCESS',6,'7d94f772cab1e7d003b6f294ee78f6b8',0),('DEFAULT_THEME','默认模板',6,'Default',0),('HOME_ISHTML','首页生成html',6,'0',0),('URL_URLRULE','URL',6,'{$catdir}/show/{$id}.html|{$catdir}/show/{$id}_{$p}.html:::{$catdir}/|{$catdir}/{$p}.html',0),('DEFAULT_LANG','默认语言',6,'cn',0),('member_register','允许新会员注册',3,'0',1),('member_emailcheck','新会员注册需要邮件验证',3,'0',1),('member_registecheck','新会员注册需要审核',3,'1',1),('member_login_verify','注册登陆开启验证码',3,'1',1),('member_emailchecktpl','邮件认证模板',3,' 欢迎您注册成为yourphp用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}',1),('member_getpwdemaitpl','密码找回邮件内容',3,'尊敬的用户{username}，请点击进入<a href=\"{url}\">重置密码</a>,或者将网址复制到浏览器：{url}（链接3天内有效）。<br>感谢您对本站的支持。<br>　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　{sitename}<br>此邮件为系统自动邮件，无需回复。',1),('LAYOUT_ON','布局模板',6,'1',0),('ADMIN_VERIFY','后台登陆验证码',6,'1',0),('APP_DEBUG','调试模式',6,'1',0),('isuserbuy','是否开启游客购物',3,'0',1),('use_address','订单收货人地址必填',3,'0',1),('credit_exchange','积分兑换',3,'10',1),('site_name','网站名称',2,'Yourphp cms',2),('site_url','网站网址',2,'http://sz56568.com',2),('logo','网站LOGO',2,'./Public/Images/logo.gif',2),('site_email','站点邮箱',2,'zeekcen@gmail.com',2),('seo_title','网站标题',2,'yourphp cms',2),('seo_keywords','关键词',2,'Yourphp cms',2),('seo_description','网站简介',2,'Yourphp1',2),('member_register','允许新会员注册',3,'1',2),('member_emailcheck','新会员注册需要邮件验证',3,'0',2),('member_registecheck','新会员注册需要审核',3,'1',2),('member_login_verify','注册登陆开启验证码',3,'1',2),('member_emailchecktpl','邮件认证模板',3,' Welcome to register as yourphp user, you need to mail account authentication, click the following link authentication: {click}  r  n or copy the URL into your browser: {url}',2),('member_getpwdemaitpl','密码找回邮件内容',3,'Dear user {username}, please click <a href=\"{url}\"> Reset Password </ a>, or copy the URL into your browser: {url} (link 3 days valid). <br> Thank you for your support site. <br> 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　{sitename} <br> This message is automatically e-mail, no reply.',2),('isuserbuy','是否开启游客购物',3,'0',2),('use_address','订单收货人地址必填',3,'0',2),('credit_exchange','积分兑换',3,'10',2);
/*!40000 ALTER TABLE `yourphp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_content`
--

DROP TABLE IF EXISTS `yourphp_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(40) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(150) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `template` varchar(30) NOT NULL DEFAULT '',
  `readpoint` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`,`lang`,`catid`,`status`,`id`),
  KEY `status` (`status`,`lang`,`catid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_content`
--

LOCK TABLES `yourphp_content` WRITE;
/*!40000 ALTER TABLE `yourphp_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_dbsource`
--

DROP TABLE IF EXISTS `yourphp_dbsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_dbsource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `host` varchar(20) NOT NULL DEFAULT '',
  `port` int(5) unsigned NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `dbname` varchar(50) NOT NULL DEFAULT '',
  `dbtablepre` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_dbsource`
--

LOCK TABLES `yourphp_dbsource` WRITE;
/*!40000 ALTER TABLE `yourphp_dbsource` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_dbsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_download`
--

DROP TABLE IF EXISTS `yourphp_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_download` (
  `id` mediumint(8) unsigned NOT NULL,
  `file` varchar(80) NOT NULL DEFAULT '',
  `ext` varchar(10) NOT NULL DEFAULT '',
  `size` varchar(10) NOT NULL DEFAULT '',
  `downs` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_download`
--

LOCK TABLES `yourphp_download` WRITE;
/*!40000 ALTER TABLE `yourphp_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_feedback`
--

DROP TABLE IF EXISTS `yourphp_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `telephone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_feedback`
--

LOCK TABLES `yourphp_feedback` WRITE;
/*!40000 ALTER TABLE `yourphp_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_field`
--

DROP TABLE IF EXISTS `yourphp_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `tips` varchar(150) NOT NULL DEFAULT '',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `errormsg` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `setup` mediumtext NOT NULL,
  `ispost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `unpostgroup` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_field`
--

LOCK TABLES `yourphp_field` WRITE;
/*!40000 ALTER TABLE `yourphp_field` DISABLE KEYS */;
INSERT INTO `yourphp_field` VALUES (1,1,'title','标题','',1,3,80,'','标题必填3-80个字','','title','array (\n  \'thumb\' => \'1\',\n  \'style\' => \'0\',\n  \'size\' => \'\',\n)',1,'',0,1,1),(2,1,'keywords','关键词','',0,0,0,'','','','text','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n)',1,'',0,1,1),(3,1,'description','SEO简介','',0,0,0,'','','','textarea','array (\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)',1,'',0,1,1),(4,1,'content','内容','',0,0,0,'','','','editor','array (\n  \'toolbar\' => \'full\',\n  \'default\' => \'\',\n  \'height\' => \'\',\n  \'showpage\' => \'1\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'\',\n  \'enablesaveimage\' => \'0\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'jpg,jpeg,gif,doc,rar,zip,xls\',\n)',1,'',0,1,1),(5,2,'catid','栏目','',1,1,6,'digits','必须选择一个栏目','','catid','',1,'',0,1,1),(6,2,'title','标题','',1,0,0,'','标题必须为1-80个字符','','title','array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)',1,'',0,1,1),(7,2,'keywords','关键词','',0,0,0,'','','','text','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n)',1,'',0,1,1),(8,2,'description','SEO简介','',0,0,0,'','','','textarea','array (\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)',1,'',0,1,1),(9,2,'content','内容','',0,0,0,'','','','editor','array (\n  \'toolbar\' => \'full\',\n  \'default\' => \'\',\n  \'height\' => \'\',\n  \'show_add_description\' => \'1\',\n  \'show_auto_thumb\' => \'1\',\n  \'showpage\' => \'1\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'\',\n  \'enablesaveimage\' => \'0\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)',1,'',0,1,1),(10,2,'createtime','发布时间','',1,0,0,'','','','datetime','',1,'3,4',0,1,1),(11,2,'copyfrom','来源','',0,0,0,'0','','','text','array (\n  \'size\' => \'20\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',0,1,1),(12,2,'fromlink','来源网址','',0,0,0,'','','','text','array (\n  \'size\' => \'20\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n)',1,'',0,1,1),(13,2,'readgroup','访问权限','',0,0,0,'','','','groupid','array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)',1,'3,4',0,1,1),(14,2,'posid','推荐位','',0,0,0,'','','','posid','',1,'3,4',0,1,1),(15,2,'template','模板','',0,0,0,'','','','template','',1,'3,4',0,1,1),(16,2,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',1,'3,4',0,1,1),(17,3,'catid','栏目','',1,1,6,'','必须选择一个栏目','','catid','',1,'',0,1,1),(18,3,'title','标题','',1,1,80,'','标题必须为1-80个字符','','title','array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)',1,'',0,1,1),(19,3,'keywords','关键词','',0,0,80,'','','','text','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',0,1,1),(20,3,'description','SEO简介','',0,0,0,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)',1,'',0,1,1),(21,3,'content','内容','',0,0,0,'','','','editor','array (\n  \'toolbar\' => \'full\',\n  \'default\' => \'\',\n  \'height\' => \'\',\n  \'showpage\' => \'1\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'\',\n  \'enablesaveimage\' => \'0\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)',1,'',10,1,1),(22,3,'createtime','发布时间','',1,0,0,'','','','datetime','',1,'3,4',93,1,1),(31,2,'recommend','允许评论','',0,0,1,'','','','radio','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'1\',\n)',1,'3,4',0,0,0),(30,3,'xinghao','型号','',0,0,30,'','','','text','array (\n  \'size\' => \'20\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',0,1,1),(25,3,'readgroup','访问权限','',0,0,0,'','','','groupid','array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)',1,'3,4',96,0,1),(26,3,'posid','推荐位','',0,0,0,'','','','posid','',1,'3,4',97,1,1),(27,3,'template','模板','',0,0,0,'','','','template','',1,'3,4',98,1,1),(28,3,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',1,'3,4',99,1,1),(29,3,'price','价格','',0,0,0,'','','','number','array (\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'2\',\n  \'default\' => \'0\',\n)',1,'',0,1,1),(34,3,'recommend','允许评论','',0,0,1,'','','','radio','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)',1,'3,4',0,0,0),(32,2,'readpoint','阅读收费','',0,0,3,'','','','number','array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)',1,'3,4',0,0,0),(33,2,'hits','点击次数','',0,0,8,'','','','number','array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)',1,'',0,0,0),(35,3,'readpoint','阅读收费','',0,0,5,'','','','number','array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'3,4',0,0,0),(36,3,'hits','点击次数','',0,0,8,'','','','number','array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',0,0,0),(37,4,'catid','栏目','',1,1,6,'','必须选择一个栏目','','catid','',1,'',0,1,1),(38,4,'title','标题','',1,1,80,'','标题必须为1-80个字符','','title','array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)',1,'',0,1,1),(39,4,'keywords','关键词','',0,0,80,'','','','text','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',0,1,1),(40,4,'description','SEO简介','',0,0,0,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)',1,'',0,1,1),(41,4,'content','内容','',0,0,0,'','','','editor','array (\n  \'toolbar\' => \'full\',\n  \'default\' => \'\',\n  \'height\' => \'\',\n  \'showpage\' => \'1\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'\',\n  \'enablesaveimage\' => \'0\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)',1,'',10,1,1),(42,4,'createtime','发布时间','',1,0,0,'','','','datetime','',1,'3,4',93,1,1),(43,4,'recommend','允许评论','',0,0,1,'','','','radio','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)',1,'3,4',0,0,0),(44,4,'readpoint','阅读收费','',0,0,5,'','','','number','array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'3,4',0,0,0),(45,4,'hits','点击次数','',0,0,8,'','','','number','array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',0,0,0),(46,4,'readgroup','访问权限','',0,0,0,'','','','groupid','array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)',1,'3,4',96,0,1),(47,4,'posid','推荐位','',0,0,0,'','','','posid','',1,'3,4',97,1,1),(48,4,'template','模板','',0,0,0,'','','','template','',1,'3,4',98,1,1),(49,4,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',1,'3,4',99,1,1),(50,5,'catid','栏目','',1,1,6,'','必须选择一个栏目','','catid','',1,'',0,1,1),(51,5,'title','标题','',1,1,80,'','标题必须为1-80个字符','','title','array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)',1,'',0,1,1),(52,5,'keywords','关键词','',0,0,80,'','','','text','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',0,1,1),(53,5,'description','SEO简介','',0,0,0,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)',1,'',0,1,1),(54,5,'content','内容','',0,0,0,'','','','editor','array (\n  \'toolbar\' => \'full\',\n  \'default\' => \'\',\n  \'height\' => \'\',\n  \'showpage\' => \'1\',\n  \'enablekeylink\' => \'0\',\n  \'replacenum\' => \'\',\n  \'enablesaveimage\' => \'0\',\n  \'flashupload\' => \'1\',\n  \'alowuploadexts\' => \'\',\n)',1,'',10,1,1),(55,5,'createtime','发布时间','',1,0,0,'','','','datetime','',1,'3,4',93,1,1),(56,5,'recommend','允许评论','',0,0,1,'','','','radio','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)',1,'3,4',0,0,0),(57,5,'readpoint','阅读收费','',0,0,5,'','','','number','array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'3,4',0,0,0),(58,5,'hits','点击次数','',0,0,8,'','','','number','array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',0,0,0),(59,5,'readgroup','访问权限','',0,0,0,'','','','groupid','array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)',1,'3,4',96,0,1),(60,5,'posid','推荐位','',0,0,0,'','','','posid','',1,'3,4',97,1,1),(61,5,'template','模板','',0,0,0,'','','','template','',1,'3,4',98,1,1),(62,5,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',1,'3,4',99,1,1),(63,3,'pics','图片','',0,0,0,'','','','images','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'upload_maxnum\' => \'10\',\n  \'upload_maxsize\' => \'2\',\n  \'upload_allowext\' => \'jpeg,jpg,gif\',\n  \'watermark\' => \'0\',\n  \'more\' => \'1\',\n)',1,'',0,1,0),(64,4,'pics','图组','',0,0,0,'','','','images','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'upload_maxnum\' => \'20\',\n  \'upload_maxsize\' => \'2\',\n  \'upload_allowext\' => \'jpeg,jpg,png,gif\',\n  \'watermark\' => \'0\',\n  \'more\' => \'1\',\n)',1,'',0,1,0),(65,5,'file','上传文件','',0,0,0,'','','','file','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'upload_maxsize\' => \'2\',\n  \'upload_allowext\' => \'zip,rar,doc,ppt\',\n  \'more\' => \'1\',\n)',1,'',0,1,0),(66,5,'ext','文档类型','',0,0,10,'','','','text','array (\n  \'size\' => \'10\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',0,1,0),(67,5,'size','文档大小','',0,0,10,'','','','text','array (\n  \'size\' => \'10\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',0,1,0),(68,5,'downs','下载次数','',0,0,0,'','','','number','array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)',1,'',0,0,0),(69,6,'username','姓名','',1,2,20,'cn_username','','','text','array (\n  \'size\' => \'10\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',2,1,0),(70,6,'telephone','电话','',0,0,0,'tel','','','text','array (\n  \'size\' => \'20\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',4,1,0),(71,6,'email','邮箱','',1,0,50,'email','','','text','array (\n  \'size\' => \'20\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',2,1,0),(72,6,'content','内容','',1,4,200,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'5\',\n  \'cols\' => \'60\',\n  \'default\' => \'\',\n)',1,'',5,1,0),(81,7,'status','状态','',0,0,1,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',1,'3,4',99,1,1),(73,6,'ip','提交IP','',0,0,0,'','','','text','array (\n  \'size\' => \'20\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',0,'3,4',6,1,0),(74,6,'title','标题','',1,4,50,'','','','text','array (\n  \'size\' => \'40\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'3,4',1,1,0),(80,35,'createtime','发布时间','',1,0,0,'','','','datetime','',1,'3,4',93,1,1),(76,6,'createtime','提交时间','',0,0,0,'','','','datetime','',0,'3,4',98,1,0),(79,6,'typeid','反馈类别','',0,0,0,'','','','typeid','array (\n  \'inputtype\' => \'select\',\n  \'fieldtype\' => \'smallint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'4\',\n)',1,'',0,1,0),(78,6,'status','审核状态','',0,0,1,'','','','radio','array (\n  \'options\' => \'己审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'0\',\n)',0,'3,4',99,1,0),(82,7,'name','网站名称','',1,2,50,'','','','text','array (\n  \'size\' => \'40\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',1,1,0),(83,7,'logo','网站LOGO','',0,0,0,'','','','image','array (\n  \'size\' => \'50\',\n  \'default\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'upload_allowext\' => \'jpg,jpeg,gif,png\',\n  \'watermark\' => \'0\',\n  \'more\' => \'0\',\n)',1,'',2,1,0),(84,7,'siteurl','网站地址','',1,10,150,'url','','','text','array (\n  \'size\' => \'50\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',3,1,0),(85,7,'typeid','友情链接分类','',0,0,0,'','','','typeid','array (\n  \'inputtype\' => \'select\',\n  \'fieldtype\' => \'smallint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'1\',\n)',1,'',0,1,0),(86,7,'linktype','链接类型','',0,0,1,'','','','radio','array (\n  \'options\' => \'文字链接|1\r\nLOGO链接|2\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'1\',\n)',1,'',0,1,0),(87,7,'siteinfo','站点简介','',0,0,0,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'3\',\n  \'cols\' => \'60\',\n  \'default\' => \'\',\n)',1,'',4,1,0),(88,8,'createtime','提交时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(89,8,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'0\',\n)',0,'3,4',99,1,1),(90,8,'title','标题','',1,2,50,'','','','text','array (\n  \'size\' => \'40\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',0,1,0),(91,8,'username','姓名','',1,2,20,'','','','text','array (\n  \'size\' => \'10\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',0,1,0),(92,8,'telephone','电话','',0,0,0,'tel','','','text','array (\n  \'size\' => \'20\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',1,1,0),(93,8,'email','邮箱','',1,0,40,'email','','','text','array (\n  \'size\' => \'20\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',0,1,0),(94,8,'content','内容','',1,2,200,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'50\',\n  \'default\' => \'\',\n)',1,'',10,1,0),(95,8,'reply_content','回复','',0,0,0,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'50\',\n  \'default\' => \'\',\n)',0,'3,4',10,1,0),(96,8,'ip','IP','',0,0,15,'','','','text','array (\n  \'size\' => \'15\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',0,'3,4',90,1,0),(97,9,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(98,9,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(99,9,'name','客服名称','',0,2,20,'','','','text','array (\n  \'size\' => \'20\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',0,'',0,1,0),(100,9,'type','客服类型','',1,1,2,'0','','','select','array (\n  \'options\' => \'QQ|1\r\nMSN|2\r\n旺旺|3\r\n贸易通|6\r\n电话|4\r\n代码|5\',\n  \'multiple\' => \'0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'size\' => \'\',\n  \'default\' => \'\',\n)',0,'',0,1,0),(101,9,'code','ID或代码','',0,2,0,'0','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'50\',\n  \'default\' => \'\',\n)',0,'',10,1,0),(102,9,'skin','风格样式','',0,0,3,'0','','','select','array (\n  \'options\' => \'无风格图标|0\r\nQQ风格1|q1\r\nQQ风格2|q2\r\nQQ风格3|q3\r\nQQ风格4|q4\r\nQQ风格5|q5\r\nQQ风格6|q6\r\nQQ风格7|q7\r\nMSN小图|m1\r\nMSN大图1|m2\r\nMSN大图2|m3\r\nMSN大图3|m4\r\n旺旺小图|w2\r\n旺旺大图|w1\r\n贸易通|al1\',\n  \'multiple\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'size\' => \'\',\n  \'default\' => \'\',\n)',0,'',0,1,0),(103,2,'typeid','类型','',0,0,6,'','','','typeid','array (\'inputtype\' => \'select\', \'fieldtype\' => \'smallint\',\'numbertype\' => \'1\',\'labelwidth\' => \'\',\'default\' => \'0\',)',1,'',0,0,1),(104,3,'typeid','类型','',0,0,6,'','','','typeid','array (\'inputtype\' => \'select\', \'fieldtype\' => \'smallint\',\'numbertype\' => \'1\',\'labelwidth\' => \'\',\'default\' => \'0\',)',1,'',0,0,1),(105,4,'typeid','类型','',0,0,6,'','','','typeid','array (\'inputtype\' => \'select\', \'fieldtype\' => \'smallint\',\'numbertype\' => \'1\',\'labelwidth\' => \'\',\'default\' => \'0\',)',1,'',0,0,1),(106,5,'typeid','类型','',0,0,6,'','','','typeid','array (\'inputtype\' => \'select\', \'fieldtype\' => \'smallint\',\'numbertype\' => \'1\',\'labelwidth\' => \'\',\'default\' => \'0\',)',1,'',0,0,1),(107,10,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(108,10,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(168,10,'name','公司名称','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(110,10,'address','地址','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(111,10,'is_recommend','是否推荐','',0,0,0,'0','','','radio','array (\n  \'options\' => \'是|1\r\n否|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'0\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(112,10,'is_approve','是否认证','',0,0,0,'0','','','radio','array (\n  \'options\' => \'是|1\r\n否|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'0\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(139,15,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(140,15,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(114,11,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(115,11,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(116,11,'title','标题','',0,0,0,'0','','','title','array (\n  \'thumb\' => \'0\',\n  \'style\' => \'0\',\n  \'size\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(117,11,'img_url','图片','',0,0,0,'0','','','image','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'upload_allowext\' => \'jpg,jpeg,gif,png\',\n  \'watermark\' => \'0\',\n  \'more\' => \'0\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(118,12,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(119,12,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(172,17,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(173,17,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(170,12,'start_name','出发地','',0,0,0,'0','','','linkage','array (\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(171,12,'end_name','目的地','',0,0,0,'0','','','linkage','array (\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(122,13,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(123,13,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(124,13,'name','模块名称','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(125,13,'address','模块地址','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(126,13,'longitude','经度','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(127,13,'latitude','纬度','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(128,13,'contact','联系人','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(129,13,'phone','电话号码','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(143,15,'user_id','发布者id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(142,16,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(141,16,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(137,10,'about','公司简介','',0,0,0,'0','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'\',\n  \'cols\' => \'\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(136,10,'exp','经验说明','',0,0,0,'0','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'\',\n  \'cols\' => \'\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(182,18,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(183,18,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(180,15,'start_name','出发地','',0,0,0,'0','','','linkage','array (\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(181,15,'end_name','目的地','',0,0,0,'0','','','linkage','array (\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(146,15,'date_s','发布时间','',0,0,0,'0','','','datetime','array (\n  \'default\' => \'\',\n  \'dateformat\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(147,15,'date_f','发车时间','',0,0,0,'0','','','datetime','array (\n  \'default\' => \'\',\n  \'dateformat\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(148,15,'exp','经验说明','',0,0,0,'0','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'\',\n  \'cols\' => \'\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(149,15,'car_master','车辆所有人名称','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(150,15,'car_phone','联系电话','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(151,15,'car_vin','车辆识别码','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(152,15,'car_number','车牌','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(214,15,'car_long','车长','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(209,15,'car_load','车载重','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(217,15,'car_status','车体情况','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(218,17,'app','软件','',0,0,0,'0','','','file','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'upload_maxsize\' => \'10\',\n  \'upload_allowext\' => \'zip,rar,doc,ppt,apk\',\n  \'more\' => \'0\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(216,15,'car_type','车辆类型','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(215,15,'car_driver_type','行驶类型','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(158,16,'user_id','发布者id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(210,24,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(211,24,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(207,16,'start_name','出发地','',0,0,0,'0','','','linkage','array (\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(208,16,'end_name','目的地','',0,0,0,'0','','','linkage','array (\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(161,16,'date_s','发布时间','',0,0,0,'0','','','datetime','array (\n  \'default\' => \'\',\n  \'dateformat\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(162,16,'date_f','截止时间','',0,0,0,'0','','','datetime','array (\n  \'default\' => \'\',\n  \'dateformat\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(163,16,'about','说明','',0,0,0,'0','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'\',\n  \'cols\' => \'\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(164,16,'contact','联系人','',0,0,0,'0','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'\',\n  \'cols\' => \'\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(165,16,'phone','电话号码','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(169,10,'img_url','公司图片','',0,0,0,'0','','','image','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'upload_maxsize\' => \'\',\n  \'upload_allowext\' => \'jpg,jpeg,gif,png\',\n  \'watermark\' => \'0\',\n  \'more\' => \'0\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(174,17,'version','版本号','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(175,17,'os','平台','',0,0,0,'0','','','radio','array (\n  \'options\' => \'安卓版|android\r\n苹果版|ios\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(176,17,'remark','软件描述','',0,0,0,'0','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'\',\n  \'cols\' => \'\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(177,17,'dl_url','下载地址','',0,0,0,'0','','','text','array (\n  \'size\' => \'\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(178,13,'company_id','所属公司id','',0,0,0,'0','','','typeid','array (\n  \'inputtype\' => \'select\',\n  \'fieldtype\' => \'smallint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'8\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(179,12,'company_id','所属公司id','',0,0,0,'0','','','typeid','array (\n  \'inputtype\' => \'select\',\n  \'fieldtype\' => \'smallint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'8\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(184,18,'user_id','用户id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(185,18,'carsrc_id','车源id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(190,20,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(191,20,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(192,20,'user_id','用户id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(193,20,'carsrc_id','车源id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(194,21,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(195,21,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(196,21,'user_id','用户id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(197,21,'company_id','公司id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(198,22,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(199,22,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(200,22,'user_id','用户id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(201,22,'service_id','服务id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(202,11,'company_id','所属公司id','',0,0,0,'0','','','typeid','array (\n  \'inputtype\' => \'select\',\n  \'fieldtype\' => \'smallint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'8\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(203,23,'createtime','发布时间','',1,0,0,'','','','datetime','',0,'3,4',93,1,1),(204,23,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'已审核|1\r\n未审核|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',0,'3,4',99,1,1),(205,23,'user_id','所属用户id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(206,23,'goods_id','货源id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(212,24,'user_id','举报的用户id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0),(213,24,'goods_id','举报的货源id','',0,0,0,'0','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n  \'safefun\' => \'\',\n)',0,'',0,1,0);
/*!40000 ALTER TABLE `yourphp_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_goodsinform`
--

DROP TABLE IF EXISTS `yourphp_goodsinform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_goodsinform` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_goodsinform`
--

LOCK TABLES `yourphp_goodsinform` WRITE;
/*!40000 ALTER TABLE `yourphp_goodsinform` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_goodsinform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_goodsrc`
--

DROP TABLE IF EXISTS `yourphp_goodsrc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_goodsrc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_s` int(11) unsigned NOT NULL DEFAULT '0',
  `date_f` int(11) unsigned NOT NULL DEFAULT '0',
  `about` mediumtext NOT NULL,
  `contact` mediumtext NOT NULL,
  `phone` varchar(255) NOT NULL DEFAULT '',
  `start_name` varchar(50) NOT NULL,
  `end_name` varchar(50) NOT NULL,
  `s_province` int(11) NOT NULL,
  `s_city` int(11) NOT NULL,
  `s_town` int(11) NOT NULL,
  `e_province` int(11) NOT NULL,
  `e_city` int(11) NOT NULL,
  `e_town` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_goodsrc`
--

LOCK TABLES `yourphp_goodsrc` WRITE;
/*!40000 ALTER TABLE `yourphp_goodsrc` DISABLE KEYS */;
INSERT INTO `yourphp_goodsrc` VALUES (3,0,1,'','',0,0,0,1,32,1427962470,1428221670,'已发3年，随时有货，半挂有边布，高栏2米以下，散装。','张','15705151666','浙江 温州 洞头县','江苏 连云港 海州区',0,0,3310,0,0,1897),(4,0,1,'','',0,0,0,1,38,1438370798,1438629998,'护肤品，面膜，奶粉，狗粮，手机，化妆品重量20kg左右','何小姐','0903553796','台湾 台湾 桃园县','湖南 邵阳 双清区',0,0,3392,0,0,1711);
/*!40000 ALTER TABLE `yourphp_goodsrc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_goodsrcfavo`
--

DROP TABLE IF EXISTS `yourphp_goodsrcfavo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_goodsrcfavo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_goodsrcfavo`
--

LOCK TABLES `yourphp_goodsrcfavo` WRITE;
/*!40000 ALTER TABLE `yourphp_goodsrcfavo` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_goodsrcfavo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_guestbook`
--

DROP TABLE IF EXISTS `yourphp_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_guestbook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL DEFAULT '',
  `telephone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `reply_content` mediumtext NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_guestbook`
--

LOCK TABLES `yourphp_guestbook` WRITE;
/*!40000 ALTER TABLE `yourphp_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_kefu`
--

DROP TABLE IF EXISTS `yourphp_kefu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_kefu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL DEFAULT '',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `code` mediumtext NOT NULL,
  `skin` varchar(3) NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_kefu`
--

LOCK TABLES `yourphp_kefu` WRITE;
/*!40000 ALTER TABLE `yourphp_kefu` DISABLE KEYS */;
INSERT INTO `yourphp_kefu` VALUES (1,1,4,1306807701,'咨询电话',4,'0317-508888','0',1),(2,1,3,1306808886,'QQ客服',1,'10000','q3',1);
/*!40000 ALTER TABLE `yourphp_kefu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_lang`
--

DROP TABLE IF EXISTS `yourphp_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `mark` varchar(30) NOT NULL DEFAULT '',
  `flag` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `path` varchar(30) NOT NULL DEFAULT '',
  `domain` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_lang`
--

LOCK TABLES `yourphp_lang` WRITE;
/*!40000 ALTER TABLE `yourphp_lang` DISABLE KEYS */;
INSERT INTO `yourphp_lang` VALUES (1,'中文','cn','cn.gif',1,'','',1),(2,'英文','en','en.gif',1,'','',2);
/*!40000 ALTER TABLE `yourphp_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_link`
--

DROP TABLE IF EXISTS `yourphp_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(80) NOT NULL DEFAULT '',
  `siteurl` varchar(150) NOT NULL DEFAULT '',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `siteinfo` mediumtext NOT NULL,
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `lang` (`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_link`
--

LOCK TABLES `yourphp_link` WRITE;
/*!40000 ALTER TABLE `yourphp_link` DISABLE KEYS */;
INSERT INTO `yourphp_link` VALUES (1,1,0,1306547518,'Yourphp企业网站管理系统','http://www.yourphp.cn/Public/Images/logo.gif','http://www.yourphp.cn',2,2,'php企业网站管理系统',1),(2,1,0,1306554684,'企业网站管理系统','','http://www.yourphp.cn',2,1,'',1);
/*!40000 ALTER TABLE `yourphp_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_log`
--

DROP TABLE IF EXISTS `yourphp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `error` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `note` varchar(50) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`,`time`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_log`
--

LOCK TABLES `yourphp_log` WRITE;
/*!40000 ALTER TABLE `yourphp_log` DISABLE KEYS */;
INSERT INTO `yourphp_log` VALUES (1,0,0,'admin','登录成功','127.0.0.1',1405346368),(2,0,0,'admin','登录成功','127.0.0.1',1405817791),(3,0,0,'admin','登录成功','113.67.216.106',1406973904),(4,0,0,'admin','登录成功','183.131.11.7',1407031698),(5,0,0,'admin','登录成功','203.69.195.44',1407119577),(6,0,0,'admin','登录成功','203.69.195.44',1407152168),(7,0,0,'admin','登录成功','14.18.237.221',1407164862),(8,0,0,'admin','登录成功','183.239.178.41',1407566545),(9,0,0,'admin','登录成功','183.63.68.130',1408174821),(10,0,0,'admin','登录成功','122.13.132.204',1408266354),(11,0,0,'admin','登录成功','14.18.237.211',1408546090),(12,0,0,'admin','登录成功','183.2.140.148',1408948061),(13,0,0,'admin','登录成功','61.140.49.251',1409047176),(14,0,0,'admin','登录成功','183.2.143.19',1409639123),(15,0,0,'admin','登录成功','203.69.195.44',1409658213),(16,0,0,'admin','登录成功','183.2.143.19',1409662479),(17,0,0,'admin','登录成功','183.131.11.66',1409670651),(18,0,0,'admin','登录成功','113.67.217.222',1409710562),(19,0,0,'admin','登录成功','219.136.29.3',1409747185),(20,0,0,'admin','登录成功','112.94.116.178',1409750061),(21,0,0,'admin','登录成功','183.60.183.78',1409756459),(22,0,0,'admin','登录成功','113.105.139.201',1409842975),(23,0,0,'admin','登录成功','116.17.83.169',1410003284),(24,0,0,'admin','登录成功','116.17.97.189',1410079369),(25,0,0,'admin','登录成功','116.17.87.187',1410243401),(26,0,0,'admin','登录成功','58.62.103.20',1410699331),(27,0,0,'admin','登录成功','113.119.141.57',1410702909),(28,0,0,'admin','登录成功','113.119.141.57',1410706053),(29,0,0,'admin','登录成功','58.249.65.202',1410795577),(30,0,0,'admin','登录成功','61.140.49.185',1410861539),(31,0,0,'admin','登录成功','203.69.195.44',1410863302),(32,0,0,'admin','登录成功','113.67.218.49',1410963681),(33,0,0,'admin','登录成功','113.67.218.49',1411050391),(34,0,0,'admin','登录成功','203.69.195.44',1411131790),(35,0,0,'admin','登录成功','183.239.178.160',1411278184),(36,0,0,'admin','登录成功','27.47.129.100',1411282830),(37,0,0,'admin','登录成功','153.0.153.187',1411303162),(38,0,0,'admin','登录成功','27.47.129.100',1411304161),(39,0,0,'admin','登录成功','112.90.231.103',1411564269),(40,0,0,'admin','登录成功','120.85.142.169',1411570697),(41,0,0,'admin','登录成功','112.90.231.103',1411571331),(42,0,0,'admin','登录成功','27.47.194.12',1411571596),(43,0,0,'admin','登录成功','58.249.26.188',1411793806),(44,0,0,'admin','登录成功','218.107.22.76',1411798884),(45,0,0,'admin','登录成功','203.69.195.44',1411800727),(46,0,0,'admin','登录成功','119.147.153.73',1411821558),(47,0,0,'admin','登录成功','60.223.231.149',1412583537),(48,0,0,'admin','登录成功','113.105.139.212',1412649179),(49,0,0,'admin','登录成功','183.239.179.132',1413091245),(50,1,0,'admin','密码错误:admin','113.67.75.194',1413982201),(51,1,0,'admin','密码错误:admin','113.67.75.194',1413982213),(52,0,0,'admin','登录成功','113.67.75.194',1413982781),(53,0,0,'admin','登录成功','113.67.75.194',1413983019),(54,0,0,'admin','登录成功','183.131.11.5',1413987710),(55,0,0,'admin','登录成功','113.67.75.194',1413996926),(56,0,0,'admin','登录成功','113.119.143.156',1414047701),(57,1,0,'admin','密码错误:admin','58.62.105.94',1414067336),(58,1,0,'admin','密码错误:111111','58.62.105.94',1414067346),(59,0,0,'admin','登录成功','58.62.105.94',1414067362),(60,0,0,'admin','登录成功','113.105.139.212',1414202934),(61,0,0,'admin','登录成功','119.131.56.40',1414213918),(62,0,0,'admin','登录成功','119.131.56.40',1414214396),(63,0,0,'admin','登录成功','218.20.158.147',1414845820),(64,0,0,'admin','登录成功','119.139.48.225',1415351702),(65,0,0,'admin','登录成功','59.40.171.29',1415855502),(66,0,0,'admin','登录成功','14.18.243.117',1415964727),(67,0,0,'admin','登录成功','121.12.109.109',1415968248),(68,0,0,'admin','登录成功','113.119.140.156',1416049896),(69,0,0,'admin','登录成功','113.67.219.124',1416206171),(70,1,0,'admin','密码错误:admin','119.139.51.131',1420607520),(71,0,0,'admin','登录成功','119.139.51.131',1420608702),(72,0,0,'admin','登录成功','119.139.48.63',1420775226),(73,0,0,'admin','登录成功','121.15.51.238',1421128809),(74,0,0,'admin','登录成功','14.127.205.249',1421209467),(75,1,0,'yourphp','密码错误:yourphp','219.137.134.54',1425882671);
/*!40000 ALTER TABLE `yourphp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_menu`
--

DROP TABLE IF EXISTS `yourphp_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `model` char(20) NOT NULL DEFAULT '',
  `action` char(20) NOT NULL DEFAULT '',
  `data` char(50) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_menu`
--

LOCK TABLES `yourphp_menu` WRITE;
/*!40000 ALTER TABLE `yourphp_menu` DISABLE KEYS */;
INSERT INTO `yourphp_menu` VALUES (1,0,'Index','main','menuid=42',1,1,0,'后台首页','',0),(2,0,'Config','','menuid=50',1,1,0,'系统设置','系统设置',1),(3,0,'Category','','menuid=17',1,1,0,'内容管理','模型管理',2),(4,0,'Module','index','type=2&menuid=51',1,1,0,'模块管理','',4),(5,0,'User','','menuid=9',1,1,0,'会员管理','',90),(6,0,'Createhtml','','menuid=33',1,1,0,'网站更新','',99),(7,0,'Template','index','menuid=60',1,1,0,'模板管理','',99),(39,2,'Menu','','',1,1,0,'后台管理菜单','后台管理菜单',11),(15,39,'Menu','add','',1,1,0,'添加菜单','',0),(50,2,'Config','','',1,1,0,'站点配置','',0),(22,3,'Product','','',1,0,0,'产品模型','',3),(8,50,'Config','sys','',1,1,0,'系统参数','',0),(32,50,'Config','member','',1,1,0,'用户中心设置','',0),(59,50,'Config','add','',1,1,0,'添加系统变量','',99),(9,5,'User','','',1,1,0,'会员资料管理','',0),(10,9,'User','add','',1,1,0,'添加会员','',0),(11,5,'Role','','',1,1,0,'会员组管理','',0),(12,11,'Role','add','',1,1,0,'添加会员组','',0),(13,5,'Node','','',1,1,0,'权限节点管理','',0),(14,13,'Node','add','',1,1,0,'添加权限节点','',0),(16,3,'Module','','',1,1,0,'模型管理','',99),(17,3,'Category','','',1,1,0,'栏目管理','栏目管理',1),(18,16,'Module','add','',1,1,0,'添加模型','',0),(19,17,'Category','add','',1,1,0,'添加栏目','',0),(20,3,'Article','','',1,0,0,'文章模型','',2),(21,20,'Article','add','',1,1,0,'添加文章','',0),(23,2,'Posid','','',1,1,0,'推荐位管理','',1),(24,23,'Posid','add','',1,1,0,'添加推荐位','',0),(25,22,'Product','add','',1,1,0,'添加产品','',0),(26,3,'Picture','','',1,0,0,'图片模型','',4),(27,3,'Download','','',1,0,0,'下载模型','',5),(28,2,'Type','','',1,1,0,'类别管理','',6),(29,50,'Config','mail','',1,1,0,'系统邮箱','',0),(30,50,'Config','attach','',1,1,0,'附件配置','',0),(31,17,'Category','repair_cache','',1,1,0,'恢复栏目数据','',0),(33,6,'Createhtml','index','',1,1,0,'更新首页','',0),(34,6,'Createhtml','Createlist','',1,1,0,'更新列表页','',0),(35,6,'Createhtml','Createshow','',1,1,0,'更新内容页','',0),(36,6,'Createhtml','Updateurl','',1,1,0,'更新内容页url','',0),(37,26,'Picture','add','',1,1,0,'添加图片','',0),(38,27,'Download','add','',1,1,0,'添加文件','',0),(40,1,'Index','password','',1,1,0,'修改密码','',2),(41,1,'Index','profile','',1,1,0,'个人资料','',3),(42,1,'Index','main','',1,1,0,'后台首页','',1),(43,17,'Category','add','&type=1',1,1,0,'添加外部链接','',0),(44,2,'Database','','',1,1,0,'数据库管理','',1),(45,44,'Database','query','',1,1,0,'执行SQL语句','',0),(46,44,'Database','recover','',1,1,0,'恢复数据库','',0),(47,1,'Index','cache','menuid=47',1,1,0,'更新缓存','',4),(48,51,'Module','add','type=2',1,1,0,'创建模块','',0),(49,4,'Feedback','index','',1,1,0,'信息反馈','信息反馈',7),(51,4,'Module','index','type=2',1,1,0,'模块管理','',0),(52,28,'Type','add','',1,1,0,'添加类别','',0),(53,4,'Link','index','',1,1,0,'友情链接','',0),(54,53,'Link','add','',1,1,0,'添加链接','',0),(55,4,'Guestbook','index','',1,1,0,'在线留言','',8),(56,4,'Kefu','index','',1,1,0,'在线客服','',0),(57,56,'Kefu','add','',1,1,0,'添加客服','',0),(58,4,'Order','index','',1,1,0,'订单管理','',0),(60,7,'Template','index','',1,1,0,'模板管理','',0),(61,60,'Template','add','',1,1,0,'添加模板','',0),(62,60,'Template','index','type=css',1,1,0,'CSS管理','',0),(63,60,'Template','index','type=js',1,1,0,'JS管理','',0),(64,60,'Template','images','',1,1,0,'媒体文件管理','',0),(65,7,'Theme','index','menuid=65',1,1,0,'风格管理','',0),(66,65,'Theme','upload','',1,1,0,'上传风格','',0),(67,2,'Urlrule','index','',1,1,0,'URL规则','',1),(68,67,'Urlrule','add','',1,1,0,'添加规则','',0),(69,2,'Dbsource','index','',1,1,0,'DB数据源','',1),(70,69,'Dbsource','add','',1,1,0,'添加数据源','',0),(71,2,'Lang','index','',1,1,0,'多语言管理','语言管理',1),(72,71,'Lang','add','',1,1,0,'添加语言','',0),(73,71,'Lang','param','',1,1,0,'设置语言包','',0),(74,7,'Block','index','',1,1,0,'碎片管理','',0),(75,74,'Block','add','',1,1,0,'添加碎片','',0),(76,60,'Template','config','',1,1,0,'模板参数配置','',0),(77,7,'Slide','index','',1,1,0,'幻灯片管理','',0),(78,77,'Slide','add','',1,1,0,'添加幻灯片','',0),(79,4,'Payment','index','',1,1,0,'在线支付','',0),(80,79,'Shipping','','',1,1,0,'配送方式','',0),(81,79,'Shipping','add','',1,1,0,'添加配送方式','',0),(82,58,'Order','orderlist','',1,1,0,'单据管理','',0),(83,1,'Log','index','',1,1,0,'后台登陆日志','',83),(84,2,'Upgrade','index','',1,1,0,'在线升级','',1),(85,84,'Upgrade','checkfile','',1,1,0,'文件校检','',0),(86,6,'Createhtml','createsitemap','',1,1,0,'生成网站地图','',0),(87,4,'Pay','','',1,1,0,'财务管理','',0),(88,87,'Pay','pay','',1,1,0,'充值入帐','',0),(89,87,'Pay','spend','',1,1,0,'消费记录','',0),(90,87,'Pay','showcount','',1,1,0,'财务总计','',0),(91,3,'Companys','index','',1,1,0,'公司列表','',9),(92,91,'Companys','add','',1,1,0,'添加信息','',9),(93,3,'Pictures','index','',1,1,0,'图册信息','',9),(94,93,'Pictures','add','',1,1,0,'添加信息','',9),(95,3,'Services','index','',1,1,0,'公司服务信息','',9),(96,95,'Services','add','',1,1,0,'添加信息','',9),(97,3,'Modules','index','',1,1,0,'公司模块信息','',9),(98,97,'Modules','add','',1,1,0,'添加信息','',9),(102,101,'Carsrc','add','',1,1,0,'添加信息','',9),(101,3,'Carsrc','index','',1,1,0,'车源列表','',9),(103,3,'Goodsrc','index','',1,1,0,'货源列表','',9),(104,103,'Goodsrc','add','',1,1,0,'添加信息','',9),(105,3,'Versions','index','',1,1,0,'版本列表','',9),(106,105,'Versions','add','',1,1,0,'添加信息','',9),(107,3,'Carsrcfavo','index','',1,1,0,'收藏的车源','',9),(108,107,'Carsrcfavo','add','',1,1,0,'添加信息','',9),(111,3,'Carsrcinform','index','',1,1,0,'举报的车源','',9),(112,111,'Carsrcinform','add','',1,1,0,'添加信息','',9),(113,3,'Companysfavo','index','',1,1,0,'收藏的公司','',9),(114,113,'Companysfavo','add','',1,1,0,'添加信息','',9),(115,3,'Servicesfavo','index','',1,1,0,'收藏的专线','',9),(116,115,'Servicesfavo','add','',1,1,0,'添加信息','',9),(117,3,'Goodsrcfavo','index','',1,1,0,'收藏的货源','',9),(118,117,'Goodsrcfavo','add','',1,1,0,'添加信息','',9),(119,3,'Goodsinform','index','',1,1,0,'举报的货源','',9),(120,119,'Goodsinform','add','',1,1,0,'添加信息','',9);
/*!40000 ALTER TABLE `yourphp_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_module`
--

DROP TABLE IF EXISTS `yourphp_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_module` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `setup` mediumtext NOT NULL,
  `listorder` smallint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `postgroup` varchar(100) NOT NULL DEFAULT '',
  `ispost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_module`
--

LOCK TABLES `yourphp_module` WRITE;
/*!40000 ALTER TABLE `yourphp_module` DISABLE KEYS */;
INSERT INTO `yourphp_module` VALUES (1,'单页模型','Page','单页模型',1,0,'',0,0,'',0),(2,'文章模型','Article','新闻文章',1,1,'',0,1,'',0),(3,'产品模型','Product','产品展示',1,1,'',0,1,'',0),(4,'图片模型','Picture','图片展示',1,1,'',0,1,'',0),(5,'下载模型','Download','文件下载',1,1,'',0,1,'',0),(6,'信息反馈','Feedback','信息反馈',1,0,'',0,0,'1,2,3,4',0),(7,'友情链接','Link','友情链接',2,0,'',0,0,'',0),(8,'在线留言','Guestbook','在线留言',1,0,'',0,0,'1,2,3,4',0),(9,'在线客服','Kefu','在线客服',2,0,'',0,0,'',0),(10,'公司列表','Companys','',0,0,'',0,1,'',0),(11,'图册信息','Pictures','',0,0,'',0,0,'',0),(12,'公司服务信息','Services','',0,0,'',0,0,'',0),(13,'公司模块信息','Modules','',0,0,'',0,0,'',0),(15,'车源列表','Carsrc','',0,0,'',0,0,'',0),(16,'货源列表','Goodsrc','',0,0,'',0,0,'',0),(17,'版本列表','Versions','',0,0,'',0,0,'',0),(18,'收藏的车源','Carsrcfavo','',0,0,'',0,0,'',0),(20,'举报的车源','Carsrcinform','',0,0,'',0,0,'',0),(21,'收藏的公司','Companysfavo','',0,0,'',0,0,'',0),(22,'收藏的专线','Servicesfavo','',0,0,'',0,0,'',0),(23,'收藏的货源','Goodsrcfavo','',0,0,'',0,0,'',0),(24,'举报的货源','Goodsinform','',0,0,'',0,0,'',0);
/*!40000 ALTER TABLE `yourphp_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_modules`
--

DROP TABLE IF EXISTS `yourphp_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `longitude` varchar(255) NOT NULL DEFAULT '',
  `latitude` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `company_id` smallint(8) unsigned NOT NULL DEFAULT '8',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_modules`
--

LOCK TABLES `yourphp_modules` WRITE;
/*!40000 ALTER TABLE `yourphp_modules` DISABLE KEYS */;
INSERT INTO `yourphp_modules` VALUES (1,1,1,'admin','',0,0,0,1,'深圳市好友汇物流有限公司','深圳市龙岗区平湖镇平安大道乾龙物流园4栋','114.141055','22.687983','','4008356568',88),(2,1,1,'admin','',0,0,0,1,'深圳市好友汇物流横岗分公司','深圳市龙岗区横岗广达路28号','114.216934','22.662749','胡经理','15999508829、4008356568',88),(3,1,1,'admin','',0,0,0,1,'深圳市华安通物流有限公司','深圳市龙岗区布吉李朗大道宝丹路宝鼎威货运市场A区19-20号','114.150269','22.635452','龙先生','13480999981、0755-61238123',89),(4,1,1,'admin','',0,0,0,1,'深圳市华安通物流龙华分公司','深圳市龙华民治大道深国际华通源物流中心进大门左侧11号','114.053015','22.611783','龙先生','13480999981',89),(5,1,1,'admin','',0,0,0,1,'深圳深湘物流有限公司','深圳市罗湖区长城货代市场83号','114.120223','22.578404','龙先生','13670108859、0755-22319640、0755-22315179、0755-82058463',90),(6,1,1,'admin','',0,0,0,1,'深湘物流长沙分公司','长沙市雨花区劳动东路川河工业区','113.064822','28.161894','','0731-84784372、15717519819',90),(7,1,1,'admin','',0,0,0,1,'深圳永强阳光物流','深圳市布吉丹竹头金鹏物流园A区C栋35-37号','114.162901','22.638312','侯永强','18938650988、0755-89709169、0755-89709725、0755-89968457',91),(8,1,1,'admin','',0,0,0,1,'永强阳光物流宁波分公司','宁波江南公路55号围春旧质楼下梅墟与小港中间','','','屈先生','13082911266',91),(9,1,1,'admin','',0,0,0,1,'永强阳光物流义乌分公司','义乌市绣湖西湖好安居对面','120.071451','29.304313','屈先生','13094648838',91),(10,1,1,'admin','',0,0,0,1,'深圳立凯物流广西专线','深圳市龙华明治大道与民乐路交汇处深国际华通源物流中心C1区26-28档','114.053015','22.611783','王先生','13609622926、13632891008、0755-29459788、0755-29235655',92),(11,1,1,'admin','',0,0,0,1,'深圳市吉运发物流有限公司','深圳市布吉丹竹头金鹏物流园B区C栋34-38档','114.162901','22.638312','胡经辉','13509656939、0755-89574939、0755-89574969',93),(12,1,1,'admin','',0,0,0,1,'深圳市诚信货运有限公司','深圳市罗湖区清水河一路加油站旁','114.119124','22.58806','虞先生','13827431185、0755-22314353、0755-81002742',94),(13,1,1,'admin','',0,0,0,1,'深圳市昌胜达物流','深圳市龙华民治大道2号深国际华通源物流中心C1栋20号','114.053015','22.611783','游先生','13602600119、0755-29434546',95),(14,1,1,'admin','',0,0,0,1,'深圳市金华航物流龙岗分公司','深圳市龙岗区丹竹头金鹏物流园B区B栋25号','114.162901','22.638312','','0755-61217667',96),(15,1,1,'admin','',0,0,0,1,'深圳市金华航物流宝安分公司','深圳市龙华民治华通源物流中心B3栋1楼','114.053015','22.611783','','0755-23022756、0755-23022856、0755-23022956',96),(16,1,1,'admin','',0,0,0,1,'深圳市金华航物流罗湖分公司','深圳市清水河一路共发达物流园一期28号','114.053015','22.611783','','0755-22303791',96),(17,1,1,'admin','',0,0,0,1,'深圳市速能快运','深圳市龙岗区平湖白泥坑机荷高速平湖沙湾出口100米宇达物流园二期1栋','114.153179','22.655356','单先生','13828796158、0755-89575579、0755-89575283、0755-89570339',97),(18,1,1,'admin','',0,0,0,1,'深圳市粤发物流有限公司','深圳市布吉丹竹头金鹏物流园A区B栋52-56档','114.162901','22.638312','文先生','13699889101、0755-61217339、0755-61217229、0755-61217329',98),(19,1,1,'admin','',0,0,0,1,'深圳市长顺通货物运输有限公司','深圳市宝安区西乡镇宝运达物流中心综合楼2号','113.891341','22.59641','张先生','13922844955、0755-27494820、0755-27494821',99),(20,1,1,'admin','',0,0,0,1,'深圳市博弈通物流有限公司','深圳市布吉镇李朗大道宝鼎威物流园A区43-47号','114.150269','22.635452','金忠虎','15818744113、0755-22317399、0755-25845717',100),(21,1,1,'admin','',0,0,0,1,'深圳市鑫伟达物流','深圳市布吉丹竹头金鹏物流园A区7栋15档','114.162901','22.638312','林先生','18923703952、0755-28212013',101),(22,1,1,'admin','',0,0,0,1,'深圳市昇宏业物流有限公司','深圳市龙华民治华通源物流中心C4栋138-139号','114.053015','22.611783','宋文刚','13530551551、0755-89313335、0755-89313336',102),(23,1,1,'admin','',0,0,0,1,'深圳市昇宏业物流宝安分公司','深圳市宝安西乡前进二路宝运达物流中心B栋15号','113.891341','22.59641','鞠先生','0755-23467556、13510539501',102),(24,1,1,'admin','',0,0,0,1,'深圳市万物达物流有限公司','深圳市宝安西乡前进二路宝运达物流中心B区13号','113.891341','22.59641','李先生','13760333922、0755-22319843',103),(25,1,1,'admin','',0,0,0,1,'深圳市纳百川物流','深圳市布吉丹竹头金鹏物流园B区4栋37-40号','114.162901','22.638312','陈杰','13602693199、0755-28711166、0755-28711266、0755-82401556',104),(26,1,1,'admin','',0,0,0,1,'深圳市中易达物流有限公司','深圳市罗湖区宝岗路长城货运市场172号','114.120223','22.578404','韦先生','18923467491、0755-22659858',105),(27,1,1,'admin','',0,0,0,1,'深圳市鑫金叶物流有限公司','深圳市布吉李朗东西干道南岭大龙山物流园G栋1-3号','114.144762','22.626603','金经理','13906667228、0755-28753533、13825255557',106),(28,1,1,'admin','',0,0,0,1,'深圳市鸿运通人物流有限公司','深圳市宝安石岩洲石路口石岩物流园32-38档','','','','0755-27508338',107),(29,1,1,'admin','',0,0,0,1,'深圳市福鑫湘物流有限公司','深圳市布吉丹竹头金鹏物流园B区8栋3-5号','114.162901','22.638312','周先生','13802296248、0755-89574182',108),(30,1,1,'admin','',0,0,0,1,'深圳市君通达物流','深圳市罗湖区清水河五路货运市场3档','114.053015','22.611783','王先生','13823634707、0755-82441364',109),(31,1,1,'admin','',0,0,0,1,'深圳市捷安峰物流有限公司','深圳市布吉丹竹头金鹏物流园','114.162901','22.638312','魏先生','13823531264、0755-61217402、0755-61217403、0755-61217400',110),(32,1,1,'admin','',0,0,0,1,'深圳市天顺通达物流公司','深圳市丹竹头金鹏物流园B区7栋8-17号','114.162901','22.638312','王先生','13925274087、0755-89575827、0755-89575837、0755-89575857',111),(33,1,1,'admin','',0,0,0,1,'深圳市鹏发物流','深圳市布吉丹竹头金鹏物流园B区A16-19号','114.162901','22.638312','杨先生','13802584429、0755-61217567、0755-61217568',112),(34,1,1,'admin','',0,0,0,1,'深圳市宏华物流','深圳市宝运达物流园A栋009-013档','','','张先生','13682651928、0755-27817059、13509615301',113),(35,1,1,'admin','',0,0,0,1,'深圳市龙达国际货运代理有限公司','深圳市龙华民治华通源物流中心C5栋183-185号','114.053015','22.611783','石先生','13713780480、0755-23495430、0755-23495421',114);
/*!40000 ALTER TABLE `yourphp_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_node`
--

DROP TABLE IF EXISTS `yourphp_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_node` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`status`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_node`
--

LOCK TABLES `yourphp_node` WRITE;
/*!40000 ALTER TABLE `yourphp_node` DISABLE KEYS */;
INSERT INTO `yourphp_node` VALUES (170,'Carsrc','车源列表',1,'Carsrc',0,1,2,3),(2,'Index','后台默认',1,'',0,1,2,1),(3,'Config','站点配置',1,'',0,1,2,2),(4,'index','站点配置',1,'',0,3,3,2),(5,'sys','系统参数',1,'',0,3,3,2),(6,'member','用户中心设置',1,'',0,3,3,2),(7,'add','添加变量',1,'',0,3,3,2),(8,'Menu','菜单管理',1,'',0,1,2,2),(11,'index','默认动作',1,'',0,2,3,1),(12,'Public','全局操作',1,'',0,1,2,0),(13,'index','默认',1,'',0,12,3,0),(14,'add','添加',1,'',0,12,3,0),(15,'edit','编辑',1,'',0,12,3,0),(16,'insert','插入',1,'',0,12,3,0),(17,'attach','附件设置',1,'',0,3,3,2),(18,'mail','系统邮箱',1,'',0,3,3,2),(19,'Posid','推荐位',1,'',0,1,2,2),(21,'update','更新',1,'',0,12,3,0),(22,'status','状态',1,'',0,12,3,0),(23,'deleteall','批量删除',1,'',0,12,3,0),(24,'delete','删除',1,'',0,12,3,0),(25,'listorder','排序',1,'',0,12,3,0),(26,'password','修改密码',1,'',0,2,3,1),(27,'profile','个人资料',1,'',0,2,3,1),(28,'cache','更新缓存',1,'',0,2,3,1),(30,'main','系统信息',1,'',0,2,3,1),(40,'Urlrule','URL规则',1,'',0,1,2,2),(48,'Dbsource','DB数据源',1,'',0,1,2,2),(55,'Type','类别管理',1,'',0,1,2,2),(65,'Lang','多语言管理',1,'',0,1,2,2),(75,'Database','数据库管理',1,'',0,1,2,2),(76,'docommand','优化操作',1,'',0,75,3,2),(77,'backup','备份',1,'',0,75,3,2),(78,'recover','恢复',1,'',0,75,3,2),(79,'query','sql查询',1,'',0,75,3,2),(80,'doquery','运行sql',1,'',0,75,3,2),(81,'Category','栏目管理',1,'',0,1,2,3),(88,'repair_cache','修复栏目数据',1,'',0,81,3,3),(90,'Module','模型管理',1,'',0,1,2,3),(98,'Field','模型字段',1,'',0,1,2,3),(107,'Page','单页模型',1,'',0,1,2,3),(110,'Article','文章模型',1,'',0,1,2,3),(111,'Product','产品模型',1,'',0,1,2,3),(112,'Picture','图片模型',1,'',0,1,2,3),(113,'Download','下载模型',1,'',0,1,2,3),(114,'Feedback','信息反馈',1,'',0,1,2,4),(115,'Guestbook','在线留言',1,'',0,1,2,4),(116,'Link','友情链接',1,'',0,1,2,4),(117,'Kefu','在线客服',1,'',0,1,2,4),(118,'Order','订单管理',1,'',0,1,2,4),(119,'Payment','在线支付',1,'',0,1,2,4),(120,'Shipping','配送方式',1,'',0,1,2,4),(121,'User','会员管理',1,'',0,1,2,5),(122,'Role','会员组管理',1,'',0,1,2,5),(123,'Node','节点管理',1,'',0,1,2,5),(124,'Access','授权查询',1,'',0,1,2,5),(125,'Createhtml','网站更新',1,'',0,1,2,6),(126,'Template','模板管理',1,'',0,1,2,7),(127,'Theme','模板管理',1,'',0,1,2,7),(128,'Block','碎片管理',1,'',0,1,2,7),(129,'Slide','幻灯片管理',1,'',0,1,2,7),(130,'show','查看订单',1,'',0,118,3,4),(131,'index','更新首页',1,'',0,125,3,6),(132,'docreateindex','生成首页',1,'',0,125,3,6),(133,'createlist','更新列表页',1,'',0,125,3,6),(134,'createshow','更新内容页',1,'',0,125,3,6),(135,'updateurl','更新url',1,'',0,125,3,6),(136,'doCreatelist','生成列表页',1,'',0,125,3,6),(137,'doCreateshow','生成内容页',1,'',0,125,3,6),(138,'doUpdateurl','生成url',1,'',0,125,3,6),(139,'statusallok','批量审核',1,'',0,12,3,0),(140,'images','媒体文件',1,'',0,126,3,7),(141,'config','模板参数',1,'',0,126,3,7),(142,'index','列表',1,'',0,127,3,7),(143,'chose','更换',1,'',0,127,3,7),(144,'upload','上传风格',1,'',0,127,3,7),(145,'picmanage','图片管理',1,'',0,129,3,7),(146,'addpic','添加图片',1,'',0,129,3,7),(147,'editpic','编辑图片',1,'',0,129,3,7),(148,'insertpic','插入图片',1,'',0,129,3,7),(149,'updatepic','更新图片',1,'',0,129,3,7),(150,'listorder','图片排序',1,'',0,129,3,7),(151,'Attachment','附件管理',1,'',0,1,2,0),(152,'index','默认操作',1,'',0,151,3,0),(153,'upload','上传文件',1,'',0,151,3,0),(154,'filelist','浏览文件',1,'',0,151,3,0),(155,'delfile','删除文件',1,'',0,151,3,0),(156,'cleanfile','清理文件',1,'',0,151,3,0),(158,'testmail','邮件测试',1,'',0,3,3,2),(157,'dosite','保存配置',1,'',0,3,3,2),(159,'Pay','财务管理',1,'',0,1,2,4),(160,'pay','充值入帐',1,'',0,159,3,4),(161,'spend','消费记录',1,'',0,159,3,4),(162,'showcount','财务总计',1,'',0,159,3,4),(163,'paystatus','修改支付状态',1,'',0,159,3,4),(164,'show','查看支付详细',1,'',0,159,3,4),(165,'Companys','公司列表',1,'Companys',0,1,2,3),(166,'Pictures','图册信息',1,'Pictures',0,1,2,3),(167,'Services','公司服务信息',1,'Services',0,1,2,3),(168,'Modules','公司模块信息',1,'Modules',0,1,2,3),(171,'Goodsrc','货源列表',1,'Goodsrc',0,1,2,3),(172,'Versions','版本列表',1,'Versions',0,1,2,3),(173,'Carsrcfavo','收藏的车源',1,'Carsrcfavo',0,1,2,3),(175,'Carsrcinform','举报的车源',1,'Carsrcinform',0,1,2,3),(176,'Companysfavo','收藏的公司',1,'Companysfavo',0,1,2,3),(177,'Servicesfavo','收藏的专线',1,'Servicesfavo',0,1,2,3),(178,'Goodsrcfavo','收藏的货源',1,'Goodsrcfavo',0,1,2,3),(179,'Goodsinform','举报的货源',1,'Goodsinform',0,1,2,3);
/*!40000 ALTER TABLE `yourphp_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_online`
--

DROP TABLE IF EXISTS `yourphp_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_online` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL,
  `lastvisit` int(11) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_online`
--

LOCK TABLES `yourphp_online` WRITE;
/*!40000 ALTER TABLE `yourphp_online` DISABLE KEYS */;
INSERT INTO `yourphp_online` VALUES ('042cfbb385b18e052df92ab1a49235ba',0,'','46.4.123.172',1443673263,4);
/*!40000 ALTER TABLE `yourphp_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_order`
--

DROP TABLE IF EXISTS `yourphp_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sn` bigint(19) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) unsigned NOT NULL DEFAULT '0',
  `province` smallint(5) unsigned NOT NULL DEFAULT '0',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `shipping_sn` varchar(100) NOT NULL DEFAULT '',
  `pay_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `pay_code` varchar(120) NOT NULL DEFAULT '',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `pay_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `insure_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `invoice_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0',
  `accept_time` int(10) unsigned NOT NULL DEFAULT '0',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0',
  `point` int(5) unsigned NOT NULL DEFAULT '0',
  `invoice` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `invoice_title` varchar(100) NOT NULL DEFAULT '',
  `postmessage` varchar(255) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `userid` (`userid`),
  KEY `status` (`status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_order`
--

LOCK TABLES `yourphp_order` WRITE;
/*!40000 ALTER TABLE `yourphp_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_order_data`
--

DROP TABLE IF EXISTS `yourphp_order_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_order_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `moduleid` smallint(3) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_thumb` varchar(120) NOT NULL DEFAULT '',
  `product_name` varchar(120) NOT NULL DEFAULT '',
  `product_url` varchar(120) NOT NULL DEFAULT '',
  `product_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr` text NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isgift` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `userid` (`userid`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_order_data`
--

LOCK TABLES `yourphp_order_data` WRITE;
/*!40000 ALTER TABLE `yourphp_order_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_order_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_page`
--

DROP TABLE IF EXISTS `yourphp_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_page` (
  `id` smallint(5) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` varchar(250) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` mediumtext NOT NULL,
  `template` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_page`
--

LOCK TABLES `yourphp_page` WRITE;
/*!40000 ALTER TABLE `yourphp_page` DISABLE KEYS */;
INSERT INTO `yourphp_page` VALUES (8,'关于我们','','yourphp,企业建站系统,发布','yourphp,企业建站系统,发布','<p>\r\n	关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们lllll</p>\r\n<p>\r\n	[page]</p>\r\n<p>\r\n	sdfgasdfaf中华人民共和国关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我</p>\r\n<p>\r\n	111</p>\r\n','',0),(11,'公司简介','','','公司简介','<p>\r\n	公司简介</p>\r\n','',0),(12,'联系我们','','联系我们','联系我们','<p>\r\n	联系我们</p>\r\n','',0);
/*!40000 ALTER TABLE `yourphp_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_pay`
--

DROP TABLE IF EXISTS `yourphp_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_pay` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sn` bigint(19) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `money` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `paytime` int(10) unsigned NOT NULL DEFAULT '0',
  `usernote` varchar(255) NOT NULL,
  `pay_id` tinyint(3) unsigned NOT NULL,
  `pay_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `payment` varchar(20) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `sn` (`sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_pay`
--

LOCK TABLES `yourphp_pay` WRITE;
/*!40000 ALTER TABLE `yourphp_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_pay_spend`
--

DROP TABLE IF EXISTS `yourphp_pay_spend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `catid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(5) unsigned NOT NULL DEFAULT '0',
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `note` varchar(255) NOT NULL,
  `order_sn` bigint(19) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `createtime` (`createtime`),
  KEY `contentid` (`contentid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_pay_spend`
--

LOCK TABLES `yourphp_pay_spend` WRITE;
/*!40000 ALTER TABLE `yourphp_pay_spend` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_pay_spend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_payment`
--

DROP TABLE IF EXISTS `yourphp_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_payment` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pay_code` varchar(20) NOT NULL DEFAULT '',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `pay_fee` varchar(10) NOT NULL DEFAULT '0',
  `pay_fee_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_desc` text NOT NULL,
  `pay_config` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_payment`
--

LOCK TABLES `yourphp_payment` WRITE;
/*!40000 ALTER TABLE `yourphp_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_picture`
--

DROP TABLE IF EXISTS `yourphp_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_picture` (
  `id` mediumint(8) unsigned NOT NULL,
  `pics` mediumtext NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_picture`
--

LOCK TABLES `yourphp_picture` WRITE;
/*!40000 ALTER TABLE `yourphp_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_pictures`
--

DROP TABLE IF EXISTS `yourphp_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_pictures` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `title_style` varchar(40) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `img_url` varchar(80) NOT NULL DEFAULT '',
  `company_id` smallint(8) unsigned NOT NULL DEFAULT '8',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_pictures`
--

LOCK TABLES `yourphp_pictures` WRITE;
/*!40000 ALTER TABLE `yourphp_pictures` DISABLE KEYS */;
INSERT INTO `yourphp_pictures` VALUES (6,1,1,'admin','',0,1414068015,1414068015,1,'test','','','/Uploads/201410/5448f72963dec.png',0),(7,1,1,'','',0,0,0,1,'','','','/Uploads/201425/ea03c4c8d844d9957204b35c92b6825f.jpg',70),(8,1,1,'','',0,0,0,1,'','','','/Uploads/201425/a3e4fe6bb1717838c09db6c2130a9fa6.jpg',76),(9,1,1,'','',0,0,0,1,'','','','/Uploads/201425/4a2d71e210814826866ec0e245a563c3.jpg',69),(10,1,1,'','',0,0,0,1,'','','','/Uploads/201425/0062c74947359dae1bc52a75739c1ba6.jpg',69),(11,1,1,'','',0,0,0,1,'','','','/Uploads/201425/dd0f9b18645435b2290404769b075f25.jpg',78),(12,1,1,'','',0,0,0,1,'','','','/Uploads/201425/78b12975b4a288ad88eba655286c873e.jpg',68),(13,1,1,'','',0,0,0,1,'','','','/Uploads/201425/2ae6f0c4642fe73c911978e56f1eab5e.jpg',68),(14,1,1,'','',0,0,0,1,'','','','/Uploads/201425/fb8078e683cf332343983ce1e57cf1bb.jpg',82),(15,1,1,'','',0,0,0,1,'','','','/Uploads/201425/46dcf70aec0c009e933a45e8841bc7b7.jpg',71),(16,1,1,'','',0,0,0,1,'','','','/Uploads/201425/243b2e23c51b3299fb67e4df097d53dd.jpg',80),(17,1,1,'','',0,0,0,1,'','','','/Uploads/201425/b36096e2de169410358229408bf7fb70.jpg',73),(18,1,1,'','',0,0,0,1,'','','','/Uploads/201425/2145a827aebc57250c825cd8c8395c29.jpg',72),(19,1,1,'','',0,0,0,1,'','','','/Uploads/201425/ab679fcca9d1dbfe81979cce703dcac6.jpg',77),(20,1,1,'','',0,0,0,1,'','','','/Uploads/201425/1b27203507b7f100c692bba0fc3bf93b.jpg',84),(21,1,1,'','',0,0,0,1,'','','','/Uploads/201425/2b6e666cb9e90056a186996fda25abdd.jpg',74),(22,1,1,'','',0,0,0,1,'','','','/Uploads/201425/433ca9ba5c3383aec3048df26fc5f218.jpg',83),(23,1,1,'','',0,0,0,1,'','','','/Uploads/201425/a91e7fc0abee986d5e0c7e578c2a0373.jpg',79),(24,1,1,'','',0,0,0,1,'','','','/Uploads/201425/c5f361f67df64d7525febbd09b2188be.jpg',81),(25,1,1,'','',0,0,0,1,'','','','/Uploads/201425/4c0fea633e9600b5e6ea421bb017c91d.jpg',75),(26,1,1,'','',0,0,0,1,'','','','/Uploads/201501/e391cdf8f3cc9db9809493b2f484deb5.db',108),(27,1,1,'','',0,0,0,1,'','','','/Uploads/201501/4961c8c3deff314c133424193f257345.jpg',108),(28,1,1,'','',0,0,0,1,'','','','/Uploads/201501/4b35a0a856e616eeceb2ed054ae3e20a.db',90),(29,1,1,'','',0,0,0,1,'','','','/Uploads/201501/ea03c4c8d844d9957204b35c92b6825f.jpg',90),(30,1,1,'','',0,0,0,1,'','','','/Uploads/201501/a08ba0771cf9f78537c3a2d2f8f0b695.db',96),(31,1,1,'','',0,0,0,1,'','','','/Uploads/201501/a3e4fe6bb1717838c09db6c2130a9fa6.jpg',96),(73,1,1,'admin','',0,1421210803,1421210803,1,'','','','/Uploads/201501/54b5f4ab1fca1.jpg',89),(33,1,1,'','',0,0,0,1,'','','','/Uploads/201501/4a2d71e210814826866ec0e245a563c3.jpg',89),(34,1,1,'','',0,0,0,1,'','','','/Uploads/201501/0062c74947359dae1bc52a75739c1ba6.jpg',89),(35,1,1,'','',0,0,0,1,'','','','/Uploads/201501/dd0f9b18645435b2290404769b075f25.jpg',98),(36,1,1,'','',0,0,0,1,'','','','/Uploads/201501/43059c89cf633215d2e4df6a4ee93197.db',107),(37,1,1,'','',0,0,0,1,'','','','/Uploads/201501/180e140b3ec38ae0d84618b3a57c3a8f.jpg',107),(39,1,1,'','',0,0,0,1,'','','','/Uploads/201501/87db4918ef8e44edec9c53b2da9e2b49.jpg',88),(40,1,1,'','',0,0,0,1,'','','','/Uploads/201501/fb8078e683cf332343983ce1e57cf1bb.jpg',102),(41,1,1,'','',0,0,0,1,'','','','/Uploads/201501/fbb1fad97fe5cff0542ebe2ea6747ee7.db',91),(42,1,1,'','',0,0,0,1,'','','','/Uploads/201501/46dcf70aec0c009e933a45e8841bc7b7.jpg',91),(43,1,1,'','',0,0,0,1,'','','','/Uploads/201501/243b2e23c51b3299fb67e4df097d53dd.jpg',100),(44,1,1,'','',0,0,0,1,'','','','/Uploads/201501/8660e4a941ffa52a40dec3f003ac9671.db',106),(45,1,1,'','',0,0,0,1,'','','','/Uploads/201501/0284317431fec3e058412c2d041acd41.jpg',106),(46,1,1,'','',0,0,0,1,'','','','/Uploads/201501/0ef451d228c6aae04ecf4b98e8f8b86a.db',114),(47,1,1,'','',0,0,0,1,'','','','/Uploads/201501/f6954b63041af8e2e6b1080a39517b9d.jpg',114),(48,1,1,'','',0,0,0,1,'','','','/Uploads/201501/b849ad87479da2098cbb82fb4c1e6b47.db',113),(49,1,1,'','',0,0,0,1,'','','','/Uploads/201501/bf0bd3d7f4f516dddb35474914690ae1.jpg',113),(50,1,1,'','',0,0,0,1,'','','','/Uploads/201501/1bcf3e7f57609d499b38dfd8ce76b2b2.db',93),(51,1,1,'','',0,0,0,1,'','','','/Uploads/201501/b36096e2de169410358229408bf7fb70.jpg',93),(52,1,1,'','',0,0,0,1,'','','','/Uploads/201501/0046d88bb562159a399e4d93bc8e7beb.db',111),(53,1,1,'','',0,0,0,1,'','','','/Uploads/201501/fb4dbaa8c4bbe2abdc22a6ddd8f56691.jpg',111),(54,1,1,'','',0,0,0,1,'','','','/Uploads/201501/c21ca5fd4fc61407c992a400f47c348a.db',92),(55,1,1,'','',0,0,0,1,'','','','/Uploads/201501/2145a827aebc57250c825cd8c8395c29.jpg',92),(56,1,1,'','',0,0,0,1,'','','','/Uploads/201501/ab679fcca9d1dbfe81979cce703dcac6.jpg',97),(57,1,1,'','',0,0,0,1,'','','','/Uploads/201501/210cb35bf96d0dde9e67346568410a6d.db',110),(58,1,1,'','',0,0,0,1,'','','','/Uploads/201501/8e0df3ff4766bfe436bb98fc6af1aed9.jpg',110),(59,1,1,'','',0,0,0,1,'','','','/Uploads/201501/1b27203507b7f100c692bba0fc3bf93b.jpg',104),(60,1,1,'','',0,0,0,1,'','','','/Uploads/201501/9d1f3dc8f58127b57e5fd5aa467d00e6.db',94),(61,1,1,'','',0,0,0,1,'','','','/Uploads/201501/2b6e666cb9e90056a186996fda25abdd.jpg',94),(62,1,1,'','',0,0,0,1,'','','','/Uploads/201501/fe89afa3bed497349e2bbef515a8d670.db',109),(63,1,1,'','',0,0,0,1,'','','','/Uploads/201501/63261f045a00c40e38a1d8ca561ced47.jpg',109),(64,1,1,'','',0,0,0,1,'','','','/Uploads/201501/433ca9ba5c3383aec3048df26fc5f218.jpg',103),(65,1,1,'','',0,0,0,1,'','','','/Uploads/201501/a91e7fc0abee986d5e0c7e578c2a0373.jpg',99),(66,1,1,'','',0,0,0,1,'','','','/Uploads/201501/912592f78736dff91d36fb2931d7a118.db',112),(67,1,1,'','',0,0,0,1,'','','','/Uploads/201501/b0641a01803ace0af948f1decf8512da.jpg',112),(68,1,1,'','',0,0,0,1,'','','','/Uploads/201501/3c72a7417acd3a3c11096bf329d5347c.db',105),(69,1,1,'','',0,0,0,1,'','','','/Uploads/201501/b6ae5f545b1a0b2908a12f0ea0fa273d.jpg',105),(70,1,1,'','',0,0,0,1,'','','','/Uploads/201501/c5f361f67df64d7525febbd09b2188be.jpg',101),(71,1,1,'','',0,0,0,1,'','','','/Uploads/201501/7714bcb4aa9334dd6c59b089e17f3987.db',95),(72,1,1,'','',0,0,0,1,'','','','/Uploads/201501/4c0fea633e9600b5e6ea421bb017c91d.jpg',95);
/*!40000 ALTER TABLE `yourphp_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_posid`
--

DROP TABLE IF EXISTS `yourphp_posid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_posid` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `listorder` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_posid`
--

LOCK TABLES `yourphp_posid` WRITE;
/*!40000 ALTER TABLE `yourphp_posid` DISABLE KEYS */;
INSERT INTO `yourphp_posid` VALUES (1,'首页推荐',0),(2,'首页幻灯片',0),(3,'推荐产品',0),(4,'促销产品',0);
/*!40000 ALTER TABLE `yourphp_posid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_product`
--

DROP TABLE IF EXISTS `yourphp_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_product` (
  `id` mediumint(8) unsigned NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `xinghao` varchar(30) NOT NULL DEFAULT '',
  `pics` mediumtext NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_product`
--

LOCK TABLES `yourphp_product` WRITE;
/*!40000 ALTER TABLE `yourphp_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_region`
--

DROP TABLE IF EXISTS `yourphp_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_region`
--

LOCK TABLES `yourphp_region` WRITE;
/*!40000 ALTER TABLE `yourphp_region` DISABLE KEYS */;
INSERT INTO `yourphp_region` VALUES (1,0,'中国',0,0),(2,1,'北京',1,0),(3,1,'安徽',1,0),(4,1,'福建',1,0),(5,1,'甘肃',1,0),(6,1,'广东',1,0),(7,1,'广西',1,0),(8,1,'贵州',1,0),(9,1,'海南',1,0),(10,1,'河北',1,0),(11,1,'河南',1,0),(12,1,'黑龙江',1,0),(13,1,'湖北',1,0),(14,1,'湖南',1,0),(15,1,'吉林',1,0),(16,1,'江苏',1,0),(17,1,'江西',1,0),(18,1,'辽宁',1,0),(19,1,'内蒙古',1,0),(20,1,'宁夏',1,0),(21,1,'青海',1,0),(22,1,'山东',1,0),(23,1,'山西',1,0),(24,1,'陕西',1,0),(25,1,'上海',1,0),(26,1,'四川',1,0),(27,1,'天津',1,0),(28,1,'西藏',1,0),(29,1,'新疆',1,0),(30,1,'云南',1,0),(31,1,'浙江',1,0),(32,1,'重庆',1,0),(33,1,'香港',1,0),(34,1,'澳门',1,0),(35,1,'台湾',1,0),(36,3,'安庆',2,0),(37,3,'蚌埠',2,0),(38,3,'巢湖',2,0),(39,3,'池州',2,0),(40,3,'滁州',2,0),(41,3,'阜阳',2,0),(42,3,'淮北',2,0),(43,3,'淮南',2,0),(44,3,'黄山',2,0),(45,3,'六安',2,0),(46,3,'马鞍山',2,0),(47,3,'宿州',2,0),(48,3,'铜陵',2,0),(49,3,'芜湖',2,0),(50,3,'宣城',2,0),(51,3,'亳州',2,0),(52,2,'北京',2,0),(53,4,'福州',2,0),(54,4,'龙岩',2,0),(55,4,'南平',2,0),(56,4,'宁德',2,0),(57,4,'莆田',2,0),(58,4,'泉州',2,0),(59,4,'三明',2,0),(60,4,'厦门',2,0),(61,4,'漳州',2,0),(62,5,'兰州',2,0),(63,5,'白银',2,0),(64,5,'定西',2,0),(65,5,'甘南',2,0),(66,5,'嘉峪关',2,0),(67,5,'金昌',2,0),(68,5,'酒泉',2,0),(69,5,'临夏',2,0),(70,5,'陇南',2,0),(71,5,'平凉',2,0),(72,5,'庆阳',2,0),(73,5,'天水',2,0),(74,5,'武威',2,0),(75,5,'张掖',2,0),(76,6,'广州',2,0),(77,6,'深圳',2,0),(78,6,'潮州',2,0),(79,6,'东莞',2,0),(80,6,'佛山',2,0),(81,6,'河源',2,0),(82,6,'惠州',2,0),(83,6,'江门',2,0),(84,6,'揭阳',2,0),(85,6,'茂名',2,0),(86,6,'梅州',2,0),(87,6,'清远',2,0),(88,6,'汕头',2,0),(89,6,'汕尾',2,0),(90,6,'韶关',2,0),(91,6,'阳江',2,0),(92,6,'云浮',2,0),(93,6,'湛江',2,0),(94,6,'肇庆',2,0),(95,6,'中山',2,0),(96,6,'珠海',2,0),(97,7,'南宁',2,0),(98,7,'桂林',2,0),(99,7,'百色',2,0),(100,7,'北海',2,0),(101,7,'崇左',2,0),(102,7,'防城港',2,0),(103,7,'贵港',2,0),(104,7,'河池',2,0),(105,7,'贺州',2,0),(106,7,'来宾',2,0),(107,7,'柳州',2,0),(108,7,'钦州',2,0),(109,7,'梧州',2,0),(110,7,'玉林',2,0),(111,8,'贵阳',2,0),(112,8,'安顺',2,0),(113,8,'毕节',2,0),(114,8,'六盘水',2,0),(115,8,'黔东南',2,0),(116,8,'黔南',2,0),(117,8,'黔西南',2,0),(118,8,'铜仁',2,0),(119,8,'遵义',2,0),(120,9,'海口',2,0),(121,9,'三亚',2,0),(122,9,'白沙',2,0),(123,9,'保亭',2,0),(124,9,'昌江',2,0),(125,9,'澄迈县',2,0),(126,9,'定安县',2,0),(127,9,'东方',2,0),(128,9,'乐东',2,0),(129,9,'临高县',2,0),(130,9,'陵水',2,0),(131,9,'琼海',2,0),(132,9,'琼中',2,0),(133,9,'屯昌县',2,0),(134,9,'万宁',2,0),(135,9,'文昌',2,0),(136,9,'五指山',2,0),(137,9,'儋州',2,0),(138,10,'石家庄',2,0),(139,10,'保定',2,0),(140,10,'沧州',2,0),(141,10,'承德',2,0),(142,10,'邯郸',2,0),(143,10,'衡水',2,0),(144,10,'廊坊',2,0),(145,10,'秦皇岛',2,0),(146,10,'唐山',2,0),(147,10,'邢台',2,0),(148,10,'张家口',2,0),(149,11,'郑州',2,0),(150,11,'洛阳',2,0),(151,11,'开封',2,0),(152,11,'安阳',2,0),(153,11,'鹤壁',2,0),(154,11,'济源',2,0),(155,11,'焦作',2,0),(156,11,'南阳',2,0),(157,11,'平顶山',2,0),(158,11,'三门峡',2,0),(159,11,'商丘',2,0),(160,11,'新乡',2,0),(161,11,'信阳',2,0),(162,11,'许昌',2,0),(163,11,'周口',2,0),(164,11,'驻马店',2,0),(165,11,'漯河',2,0),(166,11,'濮阳',2,0),(167,12,'哈尔滨',2,0),(168,12,'大庆',2,0),(169,12,'大兴安岭',2,0),(170,12,'鹤岗',2,0),(171,12,'黑河',2,0),(172,12,'鸡西',2,0),(173,12,'佳木斯',2,0),(174,12,'牡丹江',2,0),(175,12,'七台河',2,0),(176,12,'齐齐哈尔',2,0),(177,12,'双鸭山',2,0),(178,12,'绥化',2,0),(179,12,'伊春',2,0),(180,13,'武汉',2,0),(181,13,'仙桃',2,0),(182,13,'鄂州',2,0),(183,13,'黄冈',2,0),(184,13,'黄石',2,0),(185,13,'荆门',2,0),(186,13,'荆州',2,0),(187,13,'潜江',2,0),(188,13,'神农架林区',2,0),(189,13,'十堰',2,0),(190,13,'随州',2,0),(191,13,'天门',2,0),(192,13,'咸宁',2,0),(193,13,'襄樊',2,0),(194,13,'孝感',2,0),(195,13,'宜昌',2,0),(196,13,'恩施',2,0),(197,14,'长沙',2,0),(198,14,'张家界',2,0),(199,14,'常德',2,0),(200,14,'郴州',2,0),(201,14,'衡阳',2,0),(202,14,'怀化',2,0),(203,14,'娄底',2,0),(204,14,'邵阳',2,0),(205,14,'湘潭',2,0),(206,14,'湘西',2,0),(207,14,'益阳',2,0),(208,14,'永州',2,0),(209,14,'岳阳',2,0),(210,14,'株洲',2,0),(211,15,'长春',2,0),(212,15,'吉林',2,0),(213,15,'白城',2,0),(214,15,'白山',2,0),(215,15,'辽源',2,0),(216,15,'四平',2,0),(217,15,'松原',2,0),(218,15,'通化',2,0),(219,15,'延边',2,0),(220,16,'南京',2,0),(221,16,'苏州',2,0),(222,16,'无锡',2,0),(223,16,'常州',2,0),(224,16,'淮安',2,0),(225,16,'连云港',2,0),(226,16,'南通',2,0),(227,16,'宿迁',2,0),(228,16,'泰州',2,0),(229,16,'徐州',2,0),(230,16,'盐城',2,0),(231,16,'扬州',2,0),(232,16,'镇江',2,0),(233,17,'南昌',2,0),(234,17,'抚州',2,0),(235,17,'赣州',2,0),(236,17,'吉安',2,0),(237,17,'景德镇',2,0),(238,17,'九江',2,0),(239,17,'萍乡',2,0),(240,17,'上饶',2,0),(241,17,'新余',2,0),(242,17,'宜春',2,0),(243,17,'鹰潭',2,0),(244,18,'沈阳',2,0),(245,18,'大连',2,0),(246,18,'鞍山',2,0),(247,18,'本溪',2,0),(248,18,'朝阳',2,0),(249,18,'丹东',2,0),(250,18,'抚顺',2,0),(251,18,'阜新',2,0),(252,18,'葫芦岛',2,0),(253,18,'锦州',2,0),(254,18,'辽阳',2,0),(255,18,'盘锦',2,0),(256,18,'铁岭',2,0),(257,18,'营口',2,0),(258,19,'呼和浩特',2,0),(259,19,'阿拉善盟',2,0),(260,19,'巴彦淖尔盟',2,0),(261,19,'包头',2,0),(262,19,'赤峰',2,0),(263,19,'鄂尔多斯',2,0),(264,19,'呼伦贝尔',2,0),(265,19,'通辽',2,0),(266,19,'乌海',2,0),(267,19,'乌兰察布市',2,0),(268,19,'锡林郭勒盟',2,0),(269,19,'兴安盟',2,0),(270,20,'银川',2,0),(271,20,'固原',2,0),(272,20,'石嘴山',2,0),(273,20,'吴忠',2,0),(274,20,'中卫',2,0),(275,21,'西宁',2,0),(276,21,'果洛',2,0),(277,21,'海北',2,0),(278,21,'海东',2,0),(279,21,'海南',2,0),(280,21,'海西',2,0),(281,21,'黄南',2,0),(282,21,'玉树',2,0),(283,22,'济南',2,0),(284,22,'青岛',2,0),(285,22,'滨州',2,0),(286,22,'德州',2,0),(287,22,'东营',2,0),(288,22,'菏泽',2,0),(289,22,'济宁',2,0),(290,22,'莱芜',2,0),(291,22,'聊城',2,0),(292,22,'临沂',2,0),(293,22,'日照',2,0),(294,22,'泰安',2,0),(295,22,'威海',2,0),(296,22,'潍坊',2,0),(297,22,'烟台',2,0),(298,22,'枣庄',2,0),(299,22,'淄博',2,0),(300,23,'太原',2,0),(301,23,'长治',2,0),(302,23,'大同',2,0),(303,23,'晋城',2,0),(304,23,'晋中',2,0),(305,23,'临汾',2,0),(306,23,'吕梁',2,0),(307,23,'朔州',2,0),(308,23,'忻州',2,0),(309,23,'阳泉',2,0),(310,23,'运城',2,0),(311,24,'西安',2,0),(312,24,'安康',2,0),(313,24,'宝鸡',2,0),(314,24,'汉中',2,0),(315,24,'商洛',2,0),(316,24,'铜川',2,0),(317,24,'渭南',2,0),(318,24,'咸阳',2,0),(319,24,'延安',2,0),(320,24,'榆林',2,0),(321,25,'上海',2,0),(322,26,'成都',2,0),(323,26,'绵阳',2,0),(324,26,'阿坝',2,0),(325,26,'巴中',2,0),(326,26,'达州',2,0),(327,26,'德阳',2,0),(328,26,'甘孜',2,0),(329,26,'广安',2,0),(330,26,'广元',2,0),(331,26,'乐山',2,0),(332,26,'凉山',2,0),(333,26,'眉山',2,0),(334,26,'南充',2,0),(335,26,'内江',2,0),(336,26,'攀枝花',2,0),(337,26,'遂宁',2,0),(338,26,'雅安',2,0),(339,26,'宜宾',2,0),(340,26,'资阳',2,0),(341,26,'自贡',2,0),(342,26,'泸州',2,0),(343,27,'天津',2,0),(344,28,'拉萨',2,0),(345,28,'阿里',2,0),(346,28,'昌都',2,0),(347,28,'林芝',2,0),(348,28,'那曲',2,0),(349,28,'日喀则',2,0),(350,28,'山南',2,0),(351,29,'乌鲁木齐',2,0),(352,29,'阿克苏',2,0),(353,29,'阿拉尔',2,0),(354,29,'巴音郭楞',2,0),(355,29,'博尔塔拉',2,0),(356,29,'昌吉',2,0),(357,29,'哈密',2,0),(358,29,'和田',2,0),(359,29,'喀什',2,0),(360,29,'克拉玛依',2,0),(361,29,'克孜勒苏',2,0),(362,29,'石河子',2,0),(363,29,'图木舒克',2,0),(364,29,'吐鲁番',2,0),(365,29,'五家渠',2,0),(366,29,'伊犁',2,0),(367,30,'昆明',2,0),(368,30,'怒江',2,0),(369,30,'普洱',2,0),(370,30,'丽江',2,0),(371,30,'保山',2,0),(372,30,'楚雄',2,0),(373,30,'大理',2,0),(374,30,'德宏',2,0),(375,30,'迪庆',2,0),(376,30,'红河',2,0),(377,30,'临沧',2,0),(378,30,'曲靖',2,0),(379,30,'文山',2,0),(380,30,'西双版纳',2,0),(381,30,'玉溪',2,0),(382,30,'昭通',2,0),(383,31,'杭州',2,0),(384,31,'湖州',2,0),(385,31,'嘉兴',2,0),(386,31,'金华',2,0),(387,31,'丽水',2,0),(388,31,'宁波',2,0),(389,31,'绍兴',2,0),(390,31,'台州',2,0),(391,31,'温州',2,0),(392,31,'舟山',2,0),(393,31,'衢州',2,0),(394,32,'重庆',2,0),(395,33,'香港',2,0),(396,34,'澳门',2,0),(397,35,'台湾',2,0),(398,36,'迎江区',3,0),(399,36,'大观区',3,0),(400,36,'宜秀区',3,0),(401,36,'桐城市',3,0),(402,36,'怀宁县',3,0),(403,36,'枞阳县',3,0),(404,36,'潜山县',3,0),(405,36,'太湖县',3,0),(406,36,'宿松县',3,0),(407,36,'望江县',3,0),(408,36,'岳西县',3,0),(409,37,'中市区',3,0),(410,37,'东市区',3,0),(411,37,'西市区',3,0),(412,37,'郊区',3,0),(413,37,'怀远县',3,0),(414,37,'五河县',3,0),(415,37,'固镇县',3,0),(416,38,'居巢区',3,0),(417,38,'庐江县',3,0),(418,38,'无为县',3,0),(419,38,'含山县',3,0),(420,38,'和县',3,0),(421,39,'贵池区',3,0),(422,39,'东至县',3,0),(423,39,'石台县',3,0),(424,39,'青阳县',3,0),(425,40,'琅琊区',3,0),(426,40,'南谯区',3,0),(427,40,'天长市',3,0),(428,40,'明光市',3,0),(429,40,'来安县',3,0),(430,40,'全椒县',3,0),(431,40,'定远县',3,0),(432,40,'凤阳县',3,0),(433,41,'蚌山区',3,0),(434,41,'龙子湖区',3,0),(435,41,'禹会区',3,0),(436,41,'淮上区',3,0),(437,41,'颍州区',3,0),(438,41,'颍东区',3,0),(439,41,'颍泉区',3,0),(440,41,'界首市',3,0),(441,41,'临泉县',3,0),(442,41,'太和县',3,0),(443,41,'阜南县',3,0),(444,41,'颖上县',3,0),(445,42,'相山区',3,0),(446,42,'杜集区',3,0),(447,42,'烈山区',3,0),(448,42,'濉溪县',3,0),(449,43,'田家庵区',3,0),(450,43,'大通区',3,0),(451,43,'谢家集区',3,0),(452,43,'八公山区',3,0),(453,43,'潘集区',3,0),(454,43,'凤台县',3,0),(455,44,'屯溪区',3,0),(456,44,'黄山区',3,0),(457,44,'徽州区',3,0),(458,44,'歙县',3,0),(459,44,'休宁县',3,0),(460,44,'黟县',3,0),(461,44,'祁门县',3,0),(462,45,'金安区',3,0),(463,45,'裕安区',3,0),(464,45,'寿县',3,0),(465,45,'霍邱县',3,0),(466,45,'舒城县',3,0),(467,45,'金寨县',3,0),(468,45,'霍山县',3,0),(469,46,'雨山区',3,0),(470,46,'花山区',3,0),(471,46,'金家庄区',3,0),(472,46,'当涂县',3,0),(473,47,'埇桥区',3,0),(474,47,'砀山县',3,0),(475,47,'萧县',3,0),(476,47,'灵璧县',3,0),(477,47,'泗县',3,0),(478,48,'铜官山区',3,0),(479,48,'狮子山区',3,0),(480,48,'郊区',3,0),(481,48,'铜陵县',3,0),(482,49,'镜湖区',3,0),(483,49,'弋江区',3,0),(484,49,'鸠江区',3,0),(485,49,'三山区',3,0),(486,49,'芜湖县',3,0),(487,49,'繁昌县',3,0),(488,49,'南陵县',3,0),(489,50,'宣州区',3,0),(490,50,'宁国市',3,0),(491,50,'郎溪县',3,0),(492,50,'广德县',3,0),(493,50,'泾县',3,0),(494,50,'绩溪县',3,0),(495,50,'旌德县',3,0),(496,51,'涡阳县',3,0),(497,51,'蒙城县',3,0),(498,51,'利辛县',3,0),(499,51,'谯城区',3,0),(500,52,'东城区',3,0),(501,52,'西城区',3,0),(502,52,'海淀区',3,0),(503,52,'朝阳区',3,0),(504,52,'崇文区',3,0),(505,52,'宣武区',3,0),(506,52,'丰台区',3,0),(507,52,'石景山区',3,0),(508,52,'房山区',3,0),(509,52,'门头沟区',3,0),(510,52,'通州区',3,0),(511,52,'顺义区',3,0),(512,52,'昌平区',3,0),(513,52,'怀柔区',3,0),(514,52,'平谷区',3,0),(515,52,'大兴区',3,0),(516,52,'密云县',3,0),(517,52,'延庆县',3,0),(518,53,'鼓楼区',3,0),(519,53,'台江区',3,0),(520,53,'仓山区',3,0),(521,53,'马尾区',3,0),(522,53,'晋安区',3,0),(523,53,'福清市',3,0),(524,53,'长乐市',3,0),(525,53,'闽侯县',3,0),(526,53,'连江县',3,0),(527,53,'罗源县',3,0),(528,53,'闽清县',3,0),(529,53,'永泰县',3,0),(530,53,'平潭县',3,0),(531,54,'新罗区',3,0),(532,54,'漳平市',3,0),(533,54,'长汀县',3,0),(534,54,'永定县',3,0),(535,54,'上杭县',3,0),(536,54,'武平县',3,0),(537,54,'连城县',3,0),(538,55,'延平区',3,0),(539,55,'邵武市',3,0),(540,55,'武夷山市',3,0),(541,55,'建瓯市',3,0),(542,55,'建阳市',3,0),(543,55,'顺昌县',3,0),(544,55,'浦城县',3,0),(545,55,'光泽县',3,0),(546,55,'松溪县',3,0),(547,55,'政和县',3,0),(548,56,'蕉城区',3,0),(549,56,'福安市',3,0),(550,56,'福鼎市',3,0),(551,56,'霞浦县',3,0),(552,56,'古田县',3,0),(553,56,'屏南县',3,0),(554,56,'寿宁县',3,0),(555,56,'周宁县',3,0),(556,56,'柘荣县',3,0),(557,57,'城厢区',3,0),(558,57,'涵江区',3,0),(559,57,'荔城区',3,0),(560,57,'秀屿区',3,0),(561,57,'仙游县',3,0),(562,58,'鲤城区',3,0),(563,58,'丰泽区',3,0),(564,58,'洛江区',3,0),(565,58,'清濛开发区',3,0),(566,58,'泉港区',3,0),(567,58,'石狮市',3,0),(568,58,'晋江市',3,0),(569,58,'南安市',3,0),(570,58,'惠安县',3,0),(571,58,'安溪县',3,0),(572,58,'永春县',3,0),(573,58,'德化县',3,0),(574,58,'金门县',3,0),(575,59,'梅列区',3,0),(576,59,'三元区',3,0),(577,59,'永安市',3,0),(578,59,'明溪县',3,0),(579,59,'清流县',3,0),(580,59,'宁化县',3,0),(581,59,'大田县',3,0),(582,59,'尤溪县',3,0),(583,59,'沙县',3,0),(584,59,'将乐县',3,0),(585,59,'泰宁县',3,0),(586,59,'建宁县',3,0),(587,60,'思明区',3,0),(588,60,'海沧区',3,0),(589,60,'湖里区',3,0),(590,60,'集美区',3,0),(591,60,'同安区',3,0),(592,60,'翔安区',3,0),(593,61,'芗城区',3,0),(594,61,'龙文区',3,0),(595,61,'龙海市',3,0),(596,61,'云霄县',3,0),(597,61,'漳浦县',3,0),(598,61,'诏安县',3,0),(599,61,'长泰县',3,0),(600,61,'东山县',3,0),(601,61,'南靖县',3,0),(602,61,'平和县',3,0),(603,61,'华安县',3,0),(604,62,'皋兰县',3,0),(605,62,'城关区',3,0),(606,62,'七里河区',3,0),(607,62,'西固区',3,0),(608,62,'安宁区',3,0),(609,62,'红古区',3,0),(610,62,'永登县',3,0),(611,62,'榆中县',3,0),(612,63,'白银区',3,0),(613,63,'平川区',3,0),(614,63,'会宁县',3,0),(615,63,'景泰县',3,0),(616,63,'靖远县',3,0),(617,64,'临洮县',3,0),(618,64,'陇西县',3,0),(619,64,'通渭县',3,0),(620,64,'渭源县',3,0),(621,64,'漳县',3,0),(622,64,'岷县',3,0),(623,64,'安定区',3,0),(624,64,'安定区',3,0),(625,65,'合作市',3,0),(626,65,'临潭县',3,0),(627,65,'卓尼县',3,0),(628,65,'舟曲县',3,0),(629,65,'迭部县',3,0),(630,65,'玛曲县',3,0),(631,65,'碌曲县',3,0),(632,65,'夏河县',3,0),(633,66,'嘉峪关市',3,0),(634,67,'金川区',3,0),(635,67,'永昌县',3,0),(636,68,'肃州区',3,0),(637,68,'玉门市',3,0),(638,68,'敦煌市',3,0),(639,68,'金塔县',3,0),(640,68,'瓜州县',3,0),(641,68,'肃北',3,0),(642,68,'阿克塞',3,0),(643,69,'临夏市',3,0),(644,69,'临夏县',3,0),(645,69,'康乐县',3,0),(646,69,'永靖县',3,0),(647,69,'广河县',3,0),(648,69,'和政县',3,0),(649,69,'东乡族自治县',3,0),(650,69,'积石山',3,0),(651,70,'成县',3,0),(652,70,'徽县',3,0),(653,70,'康县',3,0),(654,70,'礼县',3,0),(655,70,'两当县',3,0),(656,70,'文县',3,0),(657,70,'西和县',3,0),(658,70,'宕昌县',3,0),(659,70,'武都区',3,0),(660,71,'崇信县',3,0),(661,71,'华亭县',3,0),(662,71,'静宁县',3,0),(663,71,'灵台县',3,0),(664,71,'崆峒区',3,0),(665,71,'庄浪县',3,0),(666,71,'泾川县',3,0),(667,72,'合水县',3,0),(668,72,'华池县',3,0),(669,72,'环县',3,0),(670,72,'宁县',3,0),(671,72,'庆城县',3,0),(672,72,'西峰区',3,0),(673,72,'镇原县',3,0),(674,72,'正宁县',3,0),(675,73,'甘谷县',3,0),(676,73,'秦安县',3,0),(677,73,'清水县',3,0),(678,73,'秦州区',3,0),(679,73,'麦积区',3,0),(680,73,'武山县',3,0),(681,73,'张家川',3,0),(682,74,'古浪县',3,0),(683,74,'民勤县',3,0),(684,74,'天祝',3,0),(685,74,'凉州区',3,0),(686,75,'高台县',3,0),(687,75,'临泽县',3,0),(688,75,'民乐县',3,0),(689,75,'山丹县',3,0),(690,75,'肃南',3,0),(691,75,'甘州区',3,0),(692,76,'从化市',3,0),(693,76,'天河区',3,0),(694,76,'东山区',3,0),(695,76,'白云区',3,0),(696,76,'海珠区',3,0),(697,76,'荔湾区',3,0),(698,76,'越秀区',3,0),(699,76,'黄埔区',3,0),(700,76,'番禺区',3,0),(701,76,'花都区',3,0),(702,76,'增城区',3,0),(703,76,'从化区',3,0),(704,76,'市郊',3,0),(705,77,'福田区',3,0),(706,77,'罗湖区',3,0),(707,77,'南山区',3,0),(708,77,'宝安区',3,0),(709,77,'龙岗区',3,0),(710,77,'盐田区',3,0),(711,78,'湘桥区',3,0),(712,78,'潮安县',3,0),(713,78,'饶平县',3,0),(714,79,'南城区',3,0),(715,79,'东城区',3,0),(716,79,'万江区',3,0),(717,79,'莞城区',3,0),(718,79,'石龙镇',3,0),(719,79,'虎门镇',3,0),(720,79,'麻涌镇',3,0),(721,79,'道滘镇',3,0),(722,79,'石碣镇',3,0),(723,79,'沙田镇',3,0),(724,79,'望牛墩镇',3,0),(725,79,'洪梅镇',3,0),(726,79,'茶山镇',3,0),(727,79,'寮步镇',3,0),(728,79,'大岭山镇',3,0),(729,79,'大朗镇',3,0),(730,79,'黄江镇',3,0),(731,79,'樟木头',3,0),(732,79,'凤岗镇',3,0),(733,79,'塘厦镇',3,0),(734,79,'谢岗镇',3,0),(735,79,'厚街镇',3,0),(736,79,'清溪镇',3,0),(737,79,'常平镇',3,0),(738,79,'桥头镇',3,0),(739,79,'横沥镇',3,0),(740,79,'东坑镇',3,0),(741,79,'企石镇',3,0),(742,79,'石排镇',3,0),(743,79,'长安镇',3,0),(744,79,'中堂镇',3,0),(745,79,'高埗镇',3,0),(746,80,'禅城区',3,0),(747,80,'南海区',3,0),(748,80,'顺德区',3,0),(749,80,'三水区',3,0),(750,80,'高明区',3,0),(751,81,'东源县',3,0),(752,81,'和平县',3,0),(753,81,'源城区',3,0),(754,81,'连平县',3,0),(755,81,'龙川县',3,0),(756,81,'紫金县',3,0),(757,82,'惠阳区',3,0),(758,82,'惠城区',3,0),(759,82,'大亚湾',3,0),(760,82,'博罗县',3,0),(761,82,'惠东县',3,0),(762,82,'龙门县',3,0),(763,83,'江海区',3,0),(764,83,'蓬江区',3,0),(765,83,'新会区',3,0),(766,83,'台山市',3,0),(767,83,'开平市',3,0),(768,83,'鹤山市',3,0),(769,83,'恩平市',3,0),(770,84,'榕城区',3,0),(771,84,'普宁市',3,0),(772,84,'揭东县',3,0),(773,84,'揭西县',3,0),(774,84,'惠来县',3,0),(775,85,'茂南区',3,0),(776,85,'茂港区',3,0),(777,85,'高州市',3,0),(778,85,'化州市',3,0),(779,85,'信宜市',3,0),(780,85,'电白县',3,0),(781,86,'梅县',3,0),(782,86,'梅江区',3,0),(783,86,'兴宁市',3,0),(784,86,'大埔县',3,0),(785,86,'丰顺县',3,0),(786,86,'五华县',3,0),(787,86,'平远县',3,0),(788,86,'蕉岭县',3,0),(789,87,'清城区',3,0),(790,87,'英德市',3,0),(791,87,'连州市',3,0),(792,87,'佛冈县',3,0),(793,87,'阳山县',3,0),(794,87,'清新县',3,0),(795,87,'连山',3,0),(796,87,'连南',3,0),(797,88,'南澳县',3,0),(798,88,'潮阳区',3,0),(799,88,'澄海区',3,0),(800,88,'龙湖区',3,0),(801,88,'金平区',3,0),(802,88,'濠江区',3,0),(803,88,'潮南区',3,0),(804,89,'城区',3,0),(805,89,'陆丰市',3,0),(806,89,'海丰县',3,0),(807,89,'陆河县',3,0),(808,90,'曲江县',3,0),(809,90,'浈江区',3,0),(810,90,'武江区',3,0),(811,90,'曲江区',3,0),(812,90,'乐昌市',3,0),(813,90,'南雄市',3,0),(814,90,'始兴县',3,0),(815,90,'仁化县',3,0),(816,90,'翁源县',3,0),(817,90,'新丰县',3,0),(818,90,'乳源',3,0),(819,91,'江城区',3,0),(820,91,'阳春市',3,0),(821,91,'阳西县',3,0),(822,91,'阳东县',3,0),(823,92,'云城区',3,0),(824,92,'罗定市',3,0),(825,92,'新兴县',3,0),(826,92,'郁南县',3,0),(827,92,'云安县',3,0),(828,93,'赤坎区',3,0),(829,93,'霞山区',3,0),(830,93,'坡头区',3,0),(831,93,'麻章区',3,0),(832,93,'廉江市',3,0),(833,93,'雷州市',3,0),(834,93,'吴川市',3,0),(835,93,'遂溪县',3,0),(836,93,'徐闻县',3,0),(837,94,'肇庆市',3,0),(838,94,'高要市',3,0),(839,94,'四会市',3,0),(840,94,'广宁县',3,0),(841,94,'怀集县',3,0),(842,94,'封开县',3,0),(843,94,'德庆县',3,0),(844,95,'石岐街道',3,0),(845,95,'东区街道',3,0),(846,95,'西区街道',3,0),(847,95,'环城街道',3,0),(848,95,'中山港街道',3,0),(849,95,'五桂山街道',3,0),(850,96,'香洲区',3,0),(851,96,'斗门区',3,0),(852,96,'金湾区',3,0),(853,97,'邕宁区',3,0),(854,97,'青秀区',3,0),(855,97,'兴宁区',3,0),(856,97,'良庆区',3,0),(857,97,'西乡塘区',3,0),(858,97,'江南区',3,0),(859,97,'武鸣县',3,0),(860,97,'隆安县',3,0),(861,97,'马山县',3,0),(862,97,'上林县',3,0),(863,97,'宾阳县',3,0),(864,97,'横县',3,0),(865,98,'秀峰区',3,0),(866,98,'叠彩区',3,0),(867,98,'象山区',3,0),(868,98,'七星区',3,0),(869,98,'雁山区',3,0),(870,98,'阳朔县',3,0),(871,98,'临桂县',3,0),(872,98,'灵川县',3,0),(873,98,'全州县',3,0),(874,98,'平乐县',3,0),(875,98,'兴安县',3,0),(876,98,'灌阳县',3,0),(877,98,'荔浦县',3,0),(878,98,'资源县',3,0),(879,98,'永福县',3,0),(880,98,'龙胜',3,0),(881,98,'恭城',3,0),(882,99,'右江区',3,0),(883,99,'凌云县',3,0),(884,99,'平果县',3,0),(885,99,'西林县',3,0),(886,99,'乐业县',3,0),(887,99,'德保县',3,0),(888,99,'田林县',3,0),(889,99,'田阳县',3,0),(890,99,'靖西县',3,0),(891,99,'田东县',3,0),(892,99,'那坡县',3,0),(893,99,'隆林',3,0),(894,100,'海城区',3,0),(895,100,'银海区',3,0),(896,100,'铁山港区',3,0),(897,100,'合浦县',3,0),(898,101,'江州区',3,0),(899,101,'凭祥市',3,0),(900,101,'宁明县',3,0),(901,101,'扶绥县',3,0),(902,101,'龙州县',3,0),(903,101,'大新县',3,0),(904,101,'天等县',3,0),(905,102,'港口区',3,0),(906,102,'防城区',3,0),(907,102,'东兴市',3,0),(908,102,'上思县',3,0),(909,103,'港北区',3,0),(910,103,'港南区',3,0),(911,103,'覃塘区',3,0),(912,103,'桂平市',3,0),(913,103,'平南县',3,0),(914,104,'金城江区',3,0),(915,104,'宜州市',3,0),(916,104,'天峨县',3,0),(917,104,'凤山县',3,0),(918,104,'南丹县',3,0),(919,104,'东兰县',3,0),(920,104,'都安',3,0),(921,104,'罗城',3,0),(922,104,'巴马',3,0),(923,104,'环江',3,0),(924,104,'大化',3,0),(925,105,'八步区',3,0),(926,105,'钟山县',3,0),(927,105,'昭平县',3,0),(928,105,'富川',3,0),(929,106,'兴宾区',3,0),(930,106,'合山市',3,0),(931,106,'象州县',3,0),(932,106,'武宣县',3,0),(933,106,'忻城县',3,0),(934,106,'金秀',3,0),(935,107,'城中区',3,0),(936,107,'鱼峰区',3,0),(937,107,'柳北区',3,0),(938,107,'柳南区',3,0),(939,107,'柳江县',3,0),(940,107,'柳城县',3,0),(941,107,'鹿寨县',3,0),(942,107,'融安县',3,0),(943,107,'融水',3,0),(944,107,'三江',3,0),(945,108,'钦南区',3,0),(946,108,'钦北区',3,0),(947,108,'灵山县',3,0),(948,108,'浦北县',3,0),(949,109,'万秀区',3,0),(950,109,'蝶山区',3,0),(951,109,'长洲区',3,0),(952,109,'岑溪市',3,0),(953,109,'苍梧县',3,0),(954,109,'藤县',3,0),(955,109,'蒙山县',3,0),(956,110,'玉州区',3,0),(957,110,'北流市',3,0),(958,110,'容县',3,0),(959,110,'陆川县',3,0),(960,110,'博白县',3,0),(961,110,'兴业县',3,0),(962,111,'南明区',3,0),(963,111,'云岩区',3,0),(964,111,'花溪区',3,0),(965,111,'乌当区',3,0),(966,111,'白云区',3,0),(967,111,'小河区',3,0),(968,111,'金阳新区',3,0),(969,111,'新天园区',3,0),(970,111,'清镇市',3,0),(971,111,'开阳县',3,0),(972,111,'修文县',3,0),(973,111,'息烽县',3,0),(974,112,'西秀区',3,0),(975,112,'关岭',3,0),(976,112,'镇宁',3,0),(977,112,'紫云',3,0),(978,112,'平坝县',3,0),(979,112,'普定县',3,0),(980,113,'毕节市',3,0),(981,113,'大方县',3,0),(982,113,'黔西县',3,0),(983,113,'金沙县',3,0),(984,113,'织金县',3,0),(985,113,'纳雍县',3,0),(986,113,'赫章县',3,0),(987,113,'威宁',3,0),(988,114,'钟山区',3,0),(989,114,'六枝特区',3,0),(990,114,'水城县',3,0),(991,114,'盘县',3,0),(992,115,'凯里市',3,0),(993,115,'黄平县',3,0),(994,115,'施秉县',3,0),(995,115,'三穗县',3,0),(996,115,'镇远县',3,0),(997,115,'岑巩县',3,0),(998,115,'天柱县',3,0),(999,115,'锦屏县',3,0),(1000,115,'剑河县',3,0),(1001,115,'台江县',3,0),(1002,115,'黎平县',3,0),(1003,115,'榕江县',3,0),(1004,115,'从江县',3,0),(1005,115,'雷山县',3,0),(1006,115,'麻江县',3,0),(1007,115,'丹寨县',3,0),(1008,116,'都匀市',3,0),(1009,116,'福泉市',3,0),(1010,116,'荔波县',3,0),(1011,116,'贵定县',3,0),(1012,116,'瓮安县',3,0),(1013,116,'独山县',3,0),(1014,116,'平塘县',3,0),(1015,116,'罗甸县',3,0),(1016,116,'长顺县',3,0),(1017,116,'龙里县',3,0),(1018,116,'惠水县',3,0),(1019,116,'三都',3,0),(1020,117,'兴义市',3,0),(1021,117,'兴仁县',3,0),(1022,117,'普安县',3,0),(1023,117,'晴隆县',3,0),(1024,117,'贞丰县',3,0),(1025,117,'望谟县',3,0),(1026,117,'册亨县',3,0),(1027,117,'安龙县',3,0),(1028,118,'铜仁市',3,0),(1029,118,'江口县',3,0),(1030,118,'石阡县',3,0),(1031,118,'思南县',3,0),(1032,118,'德江县',3,0),(1033,118,'玉屏',3,0),(1034,118,'印江',3,0),(1035,118,'沿河',3,0),(1036,118,'松桃',3,0),(1037,118,'万山特区',3,0),(1038,119,'红花岗区',3,0),(1039,119,'务川县',3,0),(1040,119,'道真县',3,0),(1041,119,'汇川区',3,0),(1042,119,'赤水市',3,0),(1043,119,'仁怀市',3,0),(1044,119,'遵义县',3,0),(1045,119,'桐梓县',3,0),(1046,119,'绥阳县',3,0),(1047,119,'正安县',3,0),(1048,119,'凤冈县',3,0),(1049,119,'湄潭县',3,0),(1050,119,'余庆县',3,0),(1051,119,'习水县',3,0),(1052,119,'道真',3,0),(1053,119,'务川',3,0),(1054,120,'秀英区',3,0),(1055,120,'龙华区',3,0),(1056,120,'琼山区',3,0),(1057,120,'美兰区',3,0),(1058,137,'市区',3,0),(1059,137,'洋浦开发区',3,0),(1060,137,'那大镇',3,0),(1061,137,'王五镇',3,0),(1062,137,'雅星镇',3,0),(1063,137,'大成镇',3,0),(1064,137,'中和镇',3,0),(1065,137,'峨蔓镇',3,0),(1066,137,'南丰镇',3,0),(1067,137,'白马井镇',3,0),(1068,137,'兰洋镇',3,0),(1069,137,'和庆镇',3,0),(1070,137,'海头镇',3,0),(1071,137,'排浦镇',3,0),(1072,137,'东成镇',3,0),(1073,137,'光村镇',3,0),(1074,137,'木棠镇',3,0),(1075,137,'新州镇',3,0),(1076,137,'三都镇',3,0),(1077,137,'其他',3,0),(1078,138,'长安区',3,0),(1079,138,'桥东区',3,0),(1080,138,'桥西区',3,0),(1081,138,'新华区',3,0),(1082,138,'裕华区',3,0),(1083,138,'井陉矿区',3,0),(1084,138,'高新区',3,0),(1085,138,'辛集市',3,0),(1086,138,'藁城市',3,0),(1087,138,'晋州市',3,0),(1088,138,'新乐市',3,0),(1089,138,'鹿泉市',3,0),(1090,138,'井陉县',3,0),(1091,138,'正定县',3,0),(1092,138,'栾城县',3,0),(1093,138,'行唐县',3,0),(1094,138,'灵寿县',3,0),(1095,138,'高邑县',3,0),(1096,138,'深泽县',3,0),(1097,138,'赞皇县',3,0),(1098,138,'无极县',3,0),(1099,138,'平山县',3,0),(1100,138,'元氏县',3,0),(1101,138,'赵县',3,0),(1102,139,'新市区',3,0),(1103,139,'南市区',3,0),(1104,139,'北市区',3,0),(1105,139,'涿州市',3,0),(1106,139,'定州市',3,0),(1107,139,'安国市',3,0),(1108,139,'高碑店市',3,0),(1109,139,'满城县',3,0),(1110,139,'清苑县',3,0),(1111,139,'涞水县',3,0),(1112,139,'阜平县',3,0),(1113,139,'徐水县',3,0),(1114,139,'定兴县',3,0),(1115,139,'唐县',3,0),(1116,139,'高阳县',3,0),(1117,139,'容城县',3,0),(1118,139,'涞源县',3,0),(1119,139,'望都县',3,0),(1120,139,'安新县',3,0),(1121,139,'易县',3,0),(1122,139,'曲阳县',3,0),(1123,139,'蠡县',3,0),(1124,139,'顺平县',3,0),(1125,139,'博野县',3,0),(1126,139,'雄县',3,0),(1127,140,'运河区',3,0),(1128,140,'新华区',3,0),(1129,140,'泊头市',3,0),(1130,140,'任丘市',3,0),(1131,140,'黄骅市',3,0),(1132,140,'河间市',3,0),(1133,140,'沧县',3,0),(1134,140,'青县',3,0),(1135,140,'东光县',3,0),(1136,140,'海兴县',3,0),(1137,140,'盐山县',3,0),(1138,140,'肃宁县',3,0),(1139,140,'南皮县',3,0),(1140,140,'吴桥县',3,0),(1141,140,'献县',3,0),(1142,140,'孟村',3,0),(1143,141,'双桥区',3,0),(1144,141,'双滦区',3,0),(1145,141,'鹰手营子矿区',3,0),(1146,141,'承德县',3,0),(1147,141,'兴隆县',3,0),(1148,141,'平泉县',3,0),(1149,141,'滦平县',3,0),(1150,141,'隆化县',3,0),(1151,141,'丰宁',3,0),(1152,141,'宽城',3,0),(1153,141,'围场',3,0),(1154,142,'从台区',3,0),(1155,142,'复兴区',3,0),(1156,142,'邯山区',3,0),(1157,142,'峰峰矿区',3,0),(1158,142,'武安市',3,0),(1159,142,'邯郸县',3,0),(1160,142,'临漳县',3,0),(1161,142,'成安县',3,0),(1162,142,'大名县',3,0),(1163,142,'涉县',3,0),(1164,142,'磁县',3,0),(1165,142,'肥乡县',3,0),(1166,142,'永年县',3,0),(1167,142,'邱县',3,0),(1168,142,'鸡泽县',3,0),(1169,142,'广平县',3,0),(1170,142,'馆陶县',3,0),(1171,142,'魏县',3,0),(1172,142,'曲周县',3,0),(1173,143,'桃城区',3,0),(1174,143,'冀州市',3,0),(1175,143,'深州市',3,0),(1176,143,'枣强县',3,0),(1177,143,'武邑县',3,0),(1178,143,'武强县',3,0),(1179,143,'饶阳县',3,0),(1180,143,'安平县',3,0),(1181,143,'故城县',3,0),(1182,143,'景县',3,0),(1183,143,'阜城县',3,0),(1184,144,'安次区',3,0),(1185,144,'广阳区',3,0),(1186,144,'霸州市',3,0),(1187,144,'三河市',3,0),(1188,144,'固安县',3,0),(1189,144,'永清县',3,0),(1190,144,'香河县',3,0),(1191,144,'大城县',3,0),(1192,144,'文安县',3,0),(1193,144,'大厂',3,0),(1194,145,'海港区',3,0),(1195,145,'山海关区',3,0),(1196,145,'北戴河区',3,0),(1197,145,'昌黎县',3,0),(1198,145,'抚宁县',3,0),(1199,145,'卢龙县',3,0),(1200,145,'青龙',3,0),(1201,146,'路北区',3,0),(1202,146,'路南区',3,0),(1203,146,'古冶区',3,0),(1204,146,'开平区',3,0),(1205,146,'丰南区',3,0),(1206,146,'丰润区',3,0),(1207,146,'遵化市',3,0),(1208,146,'迁安市',3,0),(1209,146,'滦县',3,0),(1210,146,'滦南县',3,0),(1211,146,'乐亭县',3,0),(1212,146,'迁西县',3,0),(1213,146,'玉田县',3,0),(1214,146,'唐海县',3,0),(1215,147,'桥东区',3,0),(1216,147,'桥西区',3,0),(1217,147,'南宫市',3,0),(1218,147,'沙河市',3,0),(1219,147,'邢台县',3,0),(1220,147,'临城县',3,0),(1221,147,'内丘县',3,0),(1222,147,'柏乡县',3,0),(1223,147,'隆尧县',3,0),(1224,147,'任县',3,0),(1225,147,'南和县',3,0),(1226,147,'宁晋县',3,0),(1227,147,'巨鹿县',3,0),(1228,147,'新河县',3,0),(1229,147,'广宗县',3,0),(1230,147,'平乡县',3,0),(1231,147,'威县',3,0),(1232,147,'清河县',3,0),(1233,147,'临西县',3,0),(1234,148,'桥西区',3,0),(1235,148,'桥东区',3,0),(1236,148,'宣化区',3,0),(1237,148,'下花园区',3,0),(1238,148,'宣化县',3,0),(1239,148,'张北县',3,0),(1240,148,'康保县',3,0),(1241,148,'沽源县',3,0),(1242,148,'尚义县',3,0),(1243,148,'蔚县',3,0),(1244,148,'阳原县',3,0),(1245,148,'怀安县',3,0),(1246,148,'万全县',3,0),(1247,148,'怀来县',3,0),(1248,148,'涿鹿县',3,0),(1249,148,'赤城县',3,0),(1250,148,'崇礼县',3,0),(1251,149,'金水区',3,0),(1252,149,'邙山区',3,0),(1253,149,'二七区',3,0),(1254,149,'管城区',3,0),(1255,149,'中原区',3,0),(1256,149,'上街区',3,0),(1257,149,'惠济区',3,0),(1258,149,'郑东新区',3,0),(1259,149,'经济技术开发区',3,0),(1260,149,'高新开发区',3,0),(1261,149,'出口加工区',3,0),(1262,149,'巩义市',3,0),(1263,149,'荥阳市',3,0),(1264,149,'新密市',3,0),(1265,149,'新郑市',3,0),(1266,149,'登封市',3,0),(1267,149,'中牟县',3,0),(1268,150,'西工区',3,0),(1269,150,'老城区',3,0),(1270,150,'涧西区',3,0),(1271,150,'瀍河回族区',3,0),(1272,150,'洛龙区',3,0),(1273,150,'吉利区',3,0),(1274,150,'偃师市',3,0),(1275,150,'孟津县',3,0),(1276,150,'新安县',3,0),(1277,150,'栾川县',3,0),(1278,150,'嵩县',3,0),(1279,150,'汝阳县',3,0),(1280,150,'宜阳县',3,0),(1281,150,'洛宁县',3,0),(1282,150,'伊川县',3,0),(1283,151,'鼓楼区',3,0),(1284,151,'龙亭区',3,0),(1285,151,'顺河回族区',3,0),(1286,151,'金明区',3,0),(1287,151,'禹王台区',3,0),(1288,151,'杞县',3,0),(1289,151,'通许县',3,0),(1290,151,'尉氏县',3,0),(1291,151,'开封县',3,0),(1292,151,'兰考县',3,0),(1293,152,'北关区',3,0),(1294,152,'文峰区',3,0),(1295,152,'殷都区',3,0),(1296,152,'龙安区',3,0),(1297,152,'林州市',3,0),(1298,152,'安阳县',3,0),(1299,152,'汤阴县',3,0),(1300,152,'滑县',3,0),(1301,152,'内黄县',3,0),(1302,153,'淇滨区',3,0),(1303,153,'山城区',3,0),(1304,153,'鹤山区',3,0),(1305,153,'浚县',3,0),(1306,153,'淇县',3,0),(1307,154,'济源市',3,0),(1308,155,'解放区',3,0),(1309,155,'中站区',3,0),(1310,155,'马村区',3,0),(1311,155,'山阳区',3,0),(1312,155,'沁阳市',3,0),(1313,155,'孟州市',3,0),(1314,155,'修武县',3,0),(1315,155,'博爱县',3,0),(1316,155,'武陟县',3,0),(1317,155,'温县',3,0),(1318,156,'卧龙区',3,0),(1319,156,'宛城区',3,0),(1320,156,'邓州市',3,0),(1321,156,'南召县',3,0),(1322,156,'方城县',3,0),(1323,156,'西峡县',3,0),(1324,156,'镇平县',3,0),(1325,156,'内乡县',3,0),(1326,156,'淅川县',3,0),(1327,156,'社旗县',3,0),(1328,156,'唐河县',3,0),(1329,156,'新野县',3,0),(1330,156,'桐柏县',3,0),(1331,157,'新华区',3,0),(1332,157,'卫东区',3,0),(1333,157,'湛河区',3,0),(1334,157,'石龙区',3,0),(1335,157,'舞钢市',3,0),(1336,157,'汝州市',3,0),(1337,157,'宝丰县',3,0),(1338,157,'叶县',3,0),(1339,157,'鲁山县',3,0),(1340,157,'郏县',3,0),(1341,158,'湖滨区',3,0),(1342,158,'义马市',3,0),(1343,158,'灵宝市',3,0),(1344,158,'渑池县',3,0),(1345,158,'陕县',3,0),(1346,158,'卢氏县',3,0),(1347,159,'梁园区',3,0),(1348,159,'睢阳区',3,0),(1349,159,'永城市',3,0),(1350,159,'民权县',3,0),(1351,159,'睢县',3,0),(1352,159,'宁陵县',3,0),(1353,159,'虞城县',3,0),(1354,159,'柘城县',3,0),(1355,159,'夏邑县',3,0),(1356,160,'卫滨区',3,0),(1357,160,'红旗区',3,0),(1358,160,'凤泉区',3,0),(1359,160,'牧野区',3,0),(1360,160,'卫辉市',3,0),(1361,160,'辉县市',3,0),(1362,160,'新乡县',3,0),(1363,160,'获嘉县',3,0),(1364,160,'原阳县',3,0),(1365,160,'延津县',3,0),(1366,160,'封丘县',3,0),(1367,160,'长垣县',3,0),(1368,161,'浉河区',3,0),(1369,161,'平桥区',3,0),(1370,161,'罗山县',3,0),(1371,161,'光山县',3,0),(1372,161,'新县',3,0),(1373,161,'商城县',3,0),(1374,161,'固始县',3,0),(1375,161,'潢川县',3,0),(1376,161,'淮滨县',3,0),(1377,161,'息县',3,0),(1378,162,'魏都区',3,0),(1379,162,'禹州市',3,0),(1380,162,'长葛市',3,0),(1381,162,'许昌县',3,0),(1382,162,'鄢陵县',3,0),(1383,162,'襄城县',3,0),(1384,163,'川汇区',3,0),(1385,163,'项城市',3,0),(1386,163,'扶沟县',3,0),(1387,163,'西华县',3,0),(1388,163,'商水县',3,0),(1389,163,'沈丘县',3,0),(1390,163,'郸城县',3,0),(1391,163,'淮阳县',3,0),(1392,163,'太康县',3,0),(1393,163,'鹿邑县',3,0),(1394,164,'驿城区',3,0),(1395,164,'西平县',3,0),(1396,164,'上蔡县',3,0),(1397,164,'平舆县',3,0),(1398,164,'正阳县',3,0),(1399,164,'确山县',3,0),(1400,164,'泌阳县',3,0),(1401,164,'汝南县',3,0),(1402,164,'遂平县',3,0),(1403,164,'新蔡县',3,0),(1404,165,'郾城区',3,0),(1405,165,'源汇区',3,0),(1406,165,'召陵区',3,0),(1407,165,'舞阳县',3,0),(1408,165,'临颍县',3,0),(1409,166,'华龙区',3,0),(1410,166,'清丰县',3,0),(1411,166,'南乐县',3,0),(1412,166,'范县',3,0),(1413,166,'台前县',3,0),(1414,166,'濮阳县',3,0),(1415,167,'道里区',3,0),(1416,167,'南岗区',3,0),(1417,167,'动力区',3,0),(1418,167,'平房区',3,0),(1419,167,'香坊区',3,0),(1420,167,'太平区',3,0),(1421,167,'道外区',3,0),(1422,167,'阿城区',3,0),(1423,167,'呼兰区',3,0),(1424,167,'松北区',3,0),(1425,167,'尚志市',3,0),(1426,167,'双城市',3,0),(1427,167,'五常市',3,0),(1428,167,'方正县',3,0),(1429,167,'宾县',3,0),(1430,167,'依兰县',3,0),(1431,167,'巴彦县',3,0),(1432,167,'通河县',3,0),(1433,167,'木兰县',3,0),(1434,167,'延寿县',3,0),(1435,168,'萨尔图区',3,0),(1436,168,'红岗区',3,0),(1437,168,'龙凤区',3,0),(1438,168,'让胡路区',3,0),(1439,168,'大同区',3,0),(1440,168,'肇州县',3,0),(1441,168,'肇源县',3,0),(1442,168,'林甸县',3,0),(1443,168,'杜尔伯特',3,0),(1444,169,'呼玛县',3,0),(1445,169,'漠河县',3,0),(1446,169,'塔河县',3,0),(1447,170,'兴山区',3,0),(1448,170,'工农区',3,0),(1449,170,'南山区',3,0),(1450,170,'兴安区',3,0),(1451,170,'向阳区',3,0),(1452,170,'东山区',3,0),(1453,170,'萝北县',3,0),(1454,170,'绥滨县',3,0),(1455,171,'爱辉区',3,0),(1456,171,'五大连池市',3,0),(1457,171,'北安市',3,0),(1458,171,'嫩江县',3,0),(1459,171,'逊克县',3,0),(1460,171,'孙吴县',3,0),(1461,172,'鸡冠区',3,0),(1462,172,'恒山区',3,0),(1463,172,'城子河区',3,0),(1464,172,'滴道区',3,0),(1465,172,'梨树区',3,0),(1466,172,'虎林市',3,0),(1467,172,'密山市',3,0),(1468,172,'鸡东县',3,0),(1469,173,'前进区',3,0),(1470,173,'郊区',3,0),(1471,173,'向阳区',3,0),(1472,173,'东风区',3,0),(1473,173,'同江市',3,0),(1474,173,'富锦市',3,0),(1475,173,'桦南县',3,0),(1476,173,'桦川县',3,0),(1477,173,'汤原县',3,0),(1478,173,'抚远县',3,0),(1479,174,'爱民区',3,0),(1480,174,'东安区',3,0),(1481,174,'阳明区',3,0),(1482,174,'西安区',3,0),(1483,174,'绥芬河市',3,0),(1484,174,'海林市',3,0),(1485,174,'宁安市',3,0),(1486,174,'穆棱市',3,0),(1487,174,'东宁县',3,0),(1488,174,'林口县',3,0),(1489,175,'桃山区',3,0),(1490,175,'新兴区',3,0),(1491,175,'茄子河区',3,0),(1492,175,'勃利县',3,0),(1493,176,'龙沙区',3,0),(1494,176,'昂昂溪区',3,0),(1495,176,'铁峰区',3,0),(1496,176,'建华区',3,0),(1497,176,'富拉尔基区',3,0),(1498,176,'碾子山区',3,0),(1499,176,'梅里斯达斡尔区',3,0),(1500,176,'讷河市',3,0),(1501,176,'龙江县',3,0),(1502,176,'依安县',3,0),(1503,176,'泰来县',3,0),(1504,176,'甘南县',3,0),(1505,176,'富裕县',3,0),(1506,176,'克山县',3,0),(1507,176,'克东县',3,0),(1508,176,'拜泉县',3,0),(1509,177,'尖山区',3,0),(1510,177,'岭东区',3,0),(1511,177,'四方台区',3,0),(1512,177,'宝山区',3,0),(1513,177,'集贤县',3,0),(1514,177,'友谊县',3,0),(1515,177,'宝清县',3,0),(1516,177,'饶河县',3,0),(1517,178,'北林区',3,0),(1518,178,'安达市',3,0),(1519,178,'肇东市',3,0),(1520,178,'海伦市',3,0),(1521,178,'望奎县',3,0),(1522,178,'兰西县',3,0),(1523,178,'青冈县',3,0),(1524,178,'庆安县',3,0),(1525,178,'明水县',3,0),(1526,178,'绥棱县',3,0),(1527,179,'伊春区',3,0),(1528,179,'带岭区',3,0),(1529,179,'南岔区',3,0),(1530,179,'金山屯区',3,0),(1531,179,'西林区',3,0),(1532,179,'美溪区',3,0),(1533,179,'乌马河区',3,0),(1534,179,'翠峦区',3,0),(1535,179,'友好区',3,0),(1536,179,'上甘岭区',3,0),(1537,179,'五营区',3,0),(1538,179,'红星区',3,0),(1539,179,'新青区',3,0),(1540,179,'汤旺河区',3,0),(1541,179,'乌伊岭区',3,0),(1542,179,'铁力市',3,0),(1543,179,'嘉荫县',3,0),(1544,180,'江岸区',3,0),(1545,180,'武昌区',3,0),(1546,180,'江汉区',3,0),(1547,180,'硚口区',3,0),(1548,180,'汉阳区',3,0),(1549,180,'青山区',3,0),(1550,180,'洪山区',3,0),(1551,180,'东西湖区',3,0),(1552,180,'汉南区',3,0),(1553,180,'蔡甸区',3,0),(1554,180,'江夏区',3,0),(1555,180,'黄陂区',3,0),(1556,180,'新洲区',3,0),(1557,180,'经济开发区',3,0),(1558,181,'仙桃市',3,0),(1559,182,'鄂城区',3,0),(1560,182,'华容区',3,0),(1561,182,'梁子湖区',3,0),(1562,183,'黄州区',3,0),(1563,183,'麻城市',3,0),(1564,183,'武穴市',3,0),(1565,183,'团风县',3,0),(1566,183,'红安县',3,0),(1567,183,'罗田县',3,0),(1568,183,'英山县',3,0),(1569,183,'浠水县',3,0),(1570,183,'蕲春县',3,0),(1571,183,'黄梅县',3,0),(1572,184,'黄石港区',3,0),(1573,184,'西塞山区',3,0),(1574,184,'下陆区',3,0),(1575,184,'铁山区',3,0),(1576,184,'大冶市',3,0),(1577,184,'阳新县',3,0),(1578,185,'东宝区',3,0),(1579,185,'掇刀区',3,0),(1580,185,'钟祥市',3,0),(1581,185,'京山县',3,0),(1582,185,'沙洋县',3,0),(1583,186,'沙市区',3,0),(1584,186,'荆州区',3,0),(1585,186,'石首市',3,0),(1586,186,'洪湖市',3,0),(1587,186,'松滋市',3,0),(1588,186,'公安县',3,0),(1589,186,'监利县',3,0),(1590,186,'江陵县',3,0),(1591,187,'潜江市',3,0),(1592,188,'神农架林区',3,0),(1593,189,'张湾区',3,0),(1594,189,'茅箭区',3,0),(1595,189,'丹江口市',3,0),(1596,189,'郧县',3,0),(1597,189,'郧西县',3,0),(1598,189,'竹山县',3,0),(1599,189,'竹溪县',3,0),(1600,189,'房县',3,0),(1601,190,'曾都区',3,0),(1602,190,'广水市',3,0),(1603,191,'天门市',3,0),(1604,192,'咸安区',3,0),(1605,192,'赤壁市',3,0),(1606,192,'嘉鱼县',3,0),(1607,192,'通城县',3,0),(1608,192,'崇阳县',3,0),(1609,192,'通山县',3,0),(1610,193,'襄城区',3,0),(1611,193,'樊城区',3,0),(1612,193,'襄阳区',3,0),(1613,193,'老河口市',3,0),(1614,193,'枣阳市',3,0),(1615,193,'宜城市',3,0),(1616,193,'南漳县',3,0),(1617,193,'谷城县',3,0),(1618,193,'保康县',3,0),(1619,194,'孝南区',3,0),(1620,194,'应城市',3,0),(1621,194,'安陆市',3,0),(1622,194,'汉川市',3,0),(1623,194,'孝昌县',3,0),(1624,194,'大悟县',3,0),(1625,194,'云梦县',3,0),(1626,195,'长阳',3,0),(1627,195,'五峰',3,0),(1628,195,'西陵区',3,0),(1629,195,'伍家岗区',3,0),(1630,195,'点军区',3,0),(1631,195,'猇亭区',3,0),(1632,195,'夷陵区',3,0),(1633,195,'宜都市',3,0),(1634,195,'当阳市',3,0),(1635,195,'枝江市',3,0),(1636,195,'远安县',3,0),(1637,195,'兴山县',3,0),(1638,195,'秭归县',3,0),(1639,196,'恩施市',3,0),(1640,196,'利川市',3,0),(1641,196,'建始县',3,0),(1642,196,'巴东县',3,0),(1643,196,'宣恩县',3,0),(1644,196,'咸丰县',3,0),(1645,196,'来凤县',3,0),(1646,196,'鹤峰县',3,0),(1647,197,'岳麓区',3,0),(1648,197,'芙蓉区',3,0),(1649,197,'天心区',3,0),(1650,197,'开福区',3,0),(1651,197,'雨花区',3,0),(1652,197,'开发区',3,0),(1653,197,'浏阳市',3,0),(1654,197,'长沙县',3,0),(1655,197,'望城县',3,0),(1656,197,'宁乡县',3,0),(1657,198,'永定区',3,0),(1658,198,'武陵源区',3,0),(1659,198,'慈利县',3,0),(1660,198,'桑植县',3,0),(1661,199,'武陵区',3,0),(1662,199,'鼎城区',3,0),(1663,199,'津市市',3,0),(1664,199,'安乡县',3,0),(1665,199,'汉寿县',3,0),(1666,199,'澧县',3,0),(1667,199,'临澧县',3,0),(1668,199,'桃源县',3,0),(1669,199,'石门县',3,0),(1670,200,'北湖区',3,0),(1671,200,'苏仙区',3,0),(1672,200,'资兴市',3,0),(1673,200,'桂阳县',3,0),(1674,200,'宜章县',3,0),(1675,200,'永兴县',3,0),(1676,200,'嘉禾县',3,0),(1677,200,'临武县',3,0),(1678,200,'汝城县',3,0),(1679,200,'桂东县',3,0),(1680,200,'安仁县',3,0),(1681,201,'雁峰区',3,0),(1682,201,'珠晖区',3,0),(1683,201,'石鼓区',3,0),(1684,201,'蒸湘区',3,0),(1685,201,'南岳区',3,0),(1686,201,'耒阳市',3,0),(1687,201,'常宁市',3,0),(1688,201,'衡阳县',3,0),(1689,201,'衡南县',3,0),(1690,201,'衡山县',3,0),(1691,201,'衡东县',3,0),(1692,201,'祁东县',3,0),(1693,202,'鹤城区',3,0),(1694,202,'靖州',3,0),(1695,202,'麻阳',3,0),(1696,202,'通道',3,0),(1697,202,'新晃',3,0),(1698,202,'芷江',3,0),(1699,202,'沅陵县',3,0),(1700,202,'辰溪县',3,0),(1701,202,'溆浦县',3,0),(1702,202,'中方县',3,0),(1703,202,'会同县',3,0),(1704,202,'洪江市',3,0),(1705,203,'娄星区',3,0),(1706,203,'冷水江市',3,0),(1707,203,'涟源市',3,0),(1708,203,'双峰县',3,0),(1709,203,'新化县',3,0),(1710,204,'城步',3,0),(1711,204,'双清区',3,0),(1712,204,'大祥区',3,0),(1713,204,'北塔区',3,0),(1714,204,'武冈市',3,0),(1715,204,'邵东县',3,0),(1716,204,'新邵县',3,0),(1717,204,'邵阳县',3,0),(1718,204,'隆回县',3,0),(1719,204,'洞口县',3,0),(1720,204,'绥宁县',3,0),(1721,204,'新宁县',3,0),(1722,205,'岳塘区',3,0),(1723,205,'雨湖区',3,0),(1724,205,'湘乡市',3,0),(1725,205,'韶山市',3,0),(1726,205,'湘潭县',3,0),(1727,206,'吉首市',3,0),(1728,206,'泸溪县',3,0),(1729,206,'凤凰县',3,0),(1730,206,'花垣县',3,0),(1731,206,'保靖县',3,0),(1732,206,'古丈县',3,0),(1733,206,'永顺县',3,0),(1734,206,'龙山县',3,0),(1735,207,'赫山区',3,0),(1736,207,'资阳区',3,0),(1737,207,'沅江市',3,0),(1738,207,'南县',3,0),(1739,207,'桃江县',3,0),(1740,207,'安化县',3,0),(1741,208,'江华',3,0),(1742,208,'冷水滩区',3,0),(1743,208,'零陵区',3,0),(1744,208,'祁阳县',3,0),(1745,208,'东安县',3,0),(1746,208,'双牌县',3,0),(1747,208,'道县',3,0),(1748,208,'江永县',3,0),(1749,208,'宁远县',3,0),(1750,208,'蓝山县',3,0),(1751,208,'新田县',3,0),(1752,209,'岳阳楼区',3,0),(1753,209,'君山区',3,0),(1754,209,'云溪区',3,0),(1755,209,'汨罗市',3,0),(1756,209,'临湘市',3,0),(1757,209,'岳阳县',3,0),(1758,209,'华容县',3,0),(1759,209,'湘阴县',3,0),(1760,209,'平江县',3,0),(1761,210,'天元区',3,0),(1762,210,'荷塘区',3,0),(1763,210,'芦淞区',3,0),(1764,210,'石峰区',3,0),(1765,210,'醴陵市',3,0),(1766,210,'株洲县',3,0),(1767,210,'攸县',3,0),(1768,210,'茶陵县',3,0),(1769,210,'炎陵县',3,0),(1770,211,'朝阳区',3,0),(1771,211,'宽城区',3,0),(1772,211,'二道区',3,0),(1773,211,'南关区',3,0),(1774,211,'绿园区',3,0),(1775,211,'双阳区',3,0),(1776,211,'净月潭开发区',3,0),(1777,211,'高新技术开发区',3,0),(1778,211,'经济技术开发区',3,0),(1779,211,'汽车产业开发区',3,0),(1780,211,'德惠市',3,0),(1781,211,'九台市',3,0),(1782,211,'榆树市',3,0),(1783,211,'农安县',3,0),(1784,212,'船营区',3,0),(1785,212,'昌邑区',3,0),(1786,212,'龙潭区',3,0),(1787,212,'丰满区',3,0),(1788,212,'蛟河市',3,0),(1789,212,'桦甸市',3,0),(1790,212,'舒兰市',3,0),(1791,212,'磐石市',3,0),(1792,212,'永吉县',3,0),(1793,213,'洮北区',3,0),(1794,213,'洮南市',3,0),(1795,213,'大安市',3,0),(1796,213,'镇赉县',3,0),(1797,213,'通榆县',3,0),(1798,214,'江源区',3,0),(1799,214,'八道江区',3,0),(1800,214,'长白',3,0),(1801,214,'临江市',3,0),(1802,214,'抚松县',3,0),(1803,214,'靖宇县',3,0),(1804,215,'龙山区',3,0),(1805,215,'西安区',3,0),(1806,215,'东丰县',3,0),(1807,215,'东辽县',3,0),(1808,216,'铁西区',3,0),(1809,216,'铁东区',3,0),(1810,216,'伊通',3,0),(1811,216,'公主岭市',3,0),(1812,216,'双辽市',3,0),(1813,216,'梨树县',3,0),(1814,217,'前郭尔罗斯',3,0),(1815,217,'宁江区',3,0),(1816,217,'长岭县',3,0),(1817,217,'乾安县',3,0),(1818,217,'扶余县',3,0),(1819,218,'东昌区',3,0),(1820,218,'二道江区',3,0),(1821,218,'梅河口市',3,0),(1822,218,'集安市',3,0),(1823,218,'通化县',3,0),(1824,218,'辉南县',3,0),(1825,218,'柳河县',3,0),(1826,219,'延吉市',3,0),(1827,219,'图们市',3,0),(1828,219,'敦化市',3,0),(1829,219,'珲春市',3,0),(1830,219,'龙井市',3,0),(1831,219,'和龙市',3,0),(1832,219,'安图县',3,0),(1833,219,'汪清县',3,0),(1834,220,'玄武区',3,0),(1835,220,'鼓楼区',3,0),(1836,220,'白下区',3,0),(1837,220,'建邺区',3,0),(1838,220,'秦淮区',3,0),(1839,220,'雨花台区',3,0),(1840,220,'下关区',3,0),(1841,220,'栖霞区',3,0),(1842,220,'浦口区',3,0),(1843,220,'江宁区',3,0),(1844,220,'六合区',3,0),(1845,220,'溧水县',3,0),(1846,220,'高淳县',3,0),(1847,221,'沧浪区',3,0),(1848,221,'金阊区',3,0),(1849,221,'平江区',3,0),(1850,221,'虎丘区',3,0),(1851,221,'吴中区',3,0),(1852,221,'相城区',3,0),(1853,221,'园区',3,0),(1854,221,'新区',3,0),(1855,221,'常熟市',3,0),(1856,221,'张家港市',3,0),(1857,221,'玉山镇',3,0),(1858,221,'巴城镇',3,0),(1859,221,'周市镇',3,0),(1860,221,'陆家镇',3,0),(1861,221,'花桥镇',3,0),(1862,221,'淀山湖镇',3,0),(1863,221,'张浦镇',3,0),(1864,221,'周庄镇',3,0),(1865,221,'千灯镇',3,0),(1866,221,'锦溪镇',3,0),(1867,221,'开发区',3,0),(1868,221,'吴江市',3,0),(1869,221,'太仓市',3,0),(1870,222,'崇安区',3,0),(1871,222,'北塘区',3,0),(1872,222,'南长区',3,0),(1873,222,'锡山区',3,0),(1874,222,'惠山区',3,0),(1875,222,'滨湖区',3,0),(1876,222,'新区',3,0),(1877,222,'江阴市',3,0),(1878,222,'宜兴市',3,0),(1879,223,'天宁区',3,0),(1880,223,'钟楼区',3,0),(1881,223,'戚墅堰区',3,0),(1882,223,'郊区',3,0),(1883,223,'新北区',3,0),(1884,223,'武进区',3,0),(1885,223,'溧阳市',3,0),(1886,223,'金坛市',3,0),(1887,224,'清河区',3,0),(1888,224,'清浦区',3,0),(1889,224,'楚州区',3,0),(1890,224,'淮阴区',3,0),(1891,224,'涟水县',3,0),(1892,224,'洪泽县',3,0),(1893,224,'盱眙县',3,0),(1894,224,'金湖县',3,0),(1895,225,'新浦区',3,0),(1896,225,'连云区',3,0),(1897,225,'海州区',3,0),(1898,225,'赣榆县',3,0),(1899,225,'东海县',3,0),(1900,225,'灌云县',3,0),(1901,225,'灌南县',3,0),(1902,226,'崇川区',3,0),(1903,226,'港闸区',3,0),(1904,226,'经济开发区',3,0),(1905,226,'启东市',3,0),(1906,226,'如皋市',3,0),(1907,226,'通州市',3,0),(1908,226,'海门市',3,0),(1909,226,'海安县',3,0),(1910,226,'如东县',3,0),(1911,227,'宿城区',3,0),(1912,227,'宿豫区',3,0),(1913,227,'宿豫县',3,0),(1914,227,'沭阳县',3,0),(1915,227,'泗阳县',3,0),(1916,227,'泗洪县',3,0),(1917,228,'海陵区',3,0),(1918,228,'高港区',3,0),(1919,228,'兴化市',3,0),(1920,228,'靖江市',3,0),(1921,228,'泰兴市',3,0),(1922,228,'姜堰市',3,0),(1923,229,'云龙区',3,0),(1924,229,'鼓楼区',3,0),(1925,229,'九里区',3,0),(1926,229,'贾汪区',3,0),(1927,229,'泉山区',3,0),(1928,229,'新沂市',3,0),(1929,229,'邳州市',3,0),(1930,229,'丰县',3,0),(1931,229,'沛县',3,0),(1932,229,'铜山县',3,0),(1933,229,'睢宁县',3,0),(1934,230,'城区',3,0),(1935,230,'亭湖区',3,0),(1936,230,'盐都区',3,0),(1937,230,'盐都县',3,0),(1938,230,'东台市',3,0),(1939,230,'大丰市',3,0),(1940,230,'响水县',3,0),(1941,230,'滨海县',3,0),(1942,230,'阜宁县',3,0),(1943,230,'射阳县',3,0),(1944,230,'建湖县',3,0),(1945,231,'广陵区',3,0),(1946,231,'维扬区',3,0),(1947,231,'邗江区',3,0),(1948,231,'仪征市',3,0),(1949,231,'高邮市',3,0),(1950,231,'江都市',3,0),(1951,231,'宝应县',3,0),(1952,232,'京口区',3,0),(1953,232,'润州区',3,0),(1954,232,'丹徒区',3,0),(1955,232,'丹阳市',3,0),(1956,232,'扬中市',3,0),(1957,232,'句容市',3,0),(1958,233,'东湖区',3,0),(1959,233,'西湖区',3,0),(1960,233,'青云谱区',3,0),(1961,233,'湾里区',3,0),(1962,233,'青山湖区',3,0),(1963,233,'红谷滩新区',3,0),(1964,233,'昌北区',3,0),(1965,233,'高新区',3,0),(1966,233,'南昌县',3,0),(1967,233,'新建县',3,0),(1968,233,'安义县',3,0),(1969,233,'进贤县',3,0),(1970,234,'临川区',3,0),(1971,234,'南城县',3,0),(1972,234,'黎川县',3,0),(1973,234,'南丰县',3,0),(1974,234,'崇仁县',3,0),(1975,234,'乐安县',3,0),(1976,234,'宜黄县',3,0),(1977,234,'金溪县',3,0),(1978,234,'资溪县',3,0),(1979,234,'东乡县',3,0),(1980,234,'广昌县',3,0),(1981,235,'章贡区',3,0),(1982,235,'于都县',3,0),(1983,235,'瑞金市',3,0),(1984,235,'南康市',3,0),(1985,235,'赣县',3,0),(1986,235,'信丰县',3,0),(1987,235,'大余县',3,0),(1988,235,'上犹县',3,0),(1989,235,'崇义县',3,0),(1990,235,'安远县',3,0),(1991,235,'龙南县',3,0),(1992,235,'定南县',3,0),(1993,235,'全南县',3,0),(1994,235,'宁都县',3,0),(1995,235,'兴国县',3,0),(1996,235,'会昌县',3,0),(1997,235,'寻乌县',3,0),(1998,235,'石城县',3,0),(1999,236,'安福县',3,0),(2000,236,'吉州区',3,0),(2001,236,'青原区',3,0),(2002,236,'井冈山市',3,0),(2003,236,'吉安县',3,0),(2004,236,'吉水县',3,0),(2005,236,'峡江县',3,0),(2006,236,'新干县',3,0),(2007,236,'永丰县',3,0),(2008,236,'泰和县',3,0),(2009,236,'遂川县',3,0),(2010,236,'万安县',3,0),(2011,236,'永新县',3,0),(2012,237,'珠山区',3,0),(2013,237,'昌江区',3,0),(2014,237,'乐平市',3,0),(2015,237,'浮梁县',3,0),(2016,238,'浔阳区',3,0),(2017,238,'庐山区',3,0),(2018,238,'瑞昌市',3,0),(2019,238,'九江县',3,0),(2020,238,'武宁县',3,0),(2021,238,'修水县',3,0),(2022,238,'永修县',3,0),(2023,238,'德安县',3,0),(2024,238,'星子县',3,0),(2025,238,'都昌县',3,0),(2026,238,'湖口县',3,0),(2027,238,'彭泽县',3,0),(2028,239,'安源区',3,0),(2029,239,'湘东区',3,0),(2030,239,'莲花县',3,0),(2031,239,'芦溪县',3,0),(2032,239,'上栗县',3,0),(2033,240,'信州区',3,0),(2034,240,'德兴市',3,0),(2035,240,'上饶县',3,0),(2036,240,'广丰县',3,0),(2037,240,'玉山县',3,0),(2038,240,'铅山县',3,0),(2039,240,'横峰县',3,0),(2040,240,'弋阳县',3,0),(2041,240,'余干县',3,0),(2042,240,'波阳县',3,0),(2043,240,'万年县',3,0),(2044,240,'婺源县',3,0),(2045,241,'渝水区',3,0),(2046,241,'分宜县',3,0),(2047,242,'袁州区',3,0),(2048,242,'丰城市',3,0),(2049,242,'樟树市',3,0),(2050,242,'高安市',3,0),(2051,242,'奉新县',3,0),(2052,242,'万载县',3,0),(2053,242,'上高县',3,0),(2054,242,'宜丰县',3,0),(2055,242,'靖安县',3,0),(2056,242,'铜鼓县',3,0),(2057,243,'月湖区',3,0),(2058,243,'贵溪市',3,0),(2059,243,'余江县',3,0),(2060,244,'沈河区',3,0),(2061,244,'皇姑区',3,0),(2062,244,'和平区',3,0),(2063,244,'大东区',3,0),(2064,244,'铁西区',3,0),(2065,244,'苏家屯区',3,0),(2066,244,'东陵区',3,0),(2067,244,'沈北新区',3,0),(2068,244,'于洪区',3,0),(2069,244,'浑南新区',3,0),(2070,244,'新民市',3,0),(2071,244,'辽中县',3,0),(2072,244,'康平县',3,0),(2073,244,'法库县',3,0),(2074,245,'西岗区',3,0),(2075,245,'中山区',3,0),(2076,245,'沙河口区',3,0),(2077,245,'甘井子区',3,0),(2078,245,'旅顺口区',3,0),(2079,245,'金州区',3,0),(2080,245,'开发区',3,0),(2081,245,'瓦房店市',3,0),(2082,245,'普兰店市',3,0),(2083,245,'庄河市',3,0),(2084,245,'长海县',3,0),(2085,246,'铁东区',3,0),(2086,246,'铁西区',3,0),(2087,246,'立山区',3,0),(2088,246,'千山区',3,0),(2089,246,'岫岩',3,0),(2090,246,'海城市',3,0),(2091,246,'台安县',3,0),(2092,247,'本溪',3,0),(2093,247,'平山区',3,0),(2094,247,'明山区',3,0),(2095,247,'溪湖区',3,0),(2096,247,'南芬区',3,0),(2097,247,'桓仁',3,0),(2098,248,'双塔区',3,0),(2099,248,'龙城区',3,0),(2100,248,'喀喇沁左翼蒙古族自治县',3,0),(2101,248,'北票市',3,0),(2102,248,'凌源市',3,0),(2103,248,'朝阳县',3,0),(2104,248,'建平县',3,0),(2105,249,'振兴区',3,0),(2106,249,'元宝区',3,0),(2107,249,'振安区',3,0),(2108,249,'宽甸',3,0),(2109,249,'东港市',3,0),(2110,249,'凤城市',3,0),(2111,250,'顺城区',3,0),(2112,250,'新抚区',3,0),(2113,250,'东洲区',3,0),(2114,250,'望花区',3,0),(2115,250,'清原',3,0),(2116,250,'新宾',3,0),(2117,250,'抚顺县',3,0),(2118,251,'阜新',3,0),(2119,251,'海州区',3,0),(2120,251,'新邱区',3,0),(2121,251,'太平区',3,0),(2122,251,'清河门区',3,0),(2123,251,'细河区',3,0),(2124,251,'彰武县',3,0),(2125,252,'龙港区',3,0),(2126,252,'南票区',3,0),(2127,252,'连山区',3,0),(2128,252,'兴城市',3,0),(2129,252,'绥中县',3,0),(2130,252,'建昌县',3,0),(2131,253,'太和区',3,0),(2132,253,'古塔区',3,0),(2133,253,'凌河区',3,0),(2134,253,'凌海市',3,0),(2135,253,'北镇市',3,0),(2136,253,'黑山县',3,0),(2137,253,'义县',3,0),(2138,254,'白塔区',3,0),(2139,254,'文圣区',3,0),(2140,254,'宏伟区',3,0),(2141,254,'太子河区',3,0),(2142,254,'弓长岭区',3,0),(2143,254,'灯塔市',3,0),(2144,254,'辽阳县',3,0),(2145,255,'双台子区',3,0),(2146,255,'兴隆台区',3,0),(2147,255,'大洼县',3,0),(2148,255,'盘山县',3,0),(2149,256,'银州区',3,0),(2150,256,'清河区',3,0),(2151,256,'调兵山市',3,0),(2152,256,'开原市',3,0),(2153,256,'铁岭县',3,0),(2154,256,'西丰县',3,0),(2155,256,'昌图县',3,0),(2156,257,'站前区',3,0),(2157,257,'西市区',3,0),(2158,257,'鲅鱼圈区',3,0),(2159,257,'老边区',3,0),(2160,257,'盖州市',3,0),(2161,257,'大石桥市',3,0),(2162,258,'回民区',3,0),(2163,258,'玉泉区',3,0),(2164,258,'新城区',3,0),(2165,258,'赛罕区',3,0),(2166,258,'清水河县',3,0),(2167,258,'土默特左旗',3,0),(2168,258,'托克托县',3,0),(2169,258,'和林格尔县',3,0),(2170,258,'武川县',3,0),(2171,259,'阿拉善左旗',3,0),(2172,259,'阿拉善右旗',3,0),(2173,259,'额济纳旗',3,0),(2174,260,'临河区',3,0),(2175,260,'五原县',3,0),(2176,260,'磴口县',3,0),(2177,260,'乌拉特前旗',3,0),(2178,260,'乌拉特中旗',3,0),(2179,260,'乌拉特后旗',3,0),(2180,260,'杭锦后旗',3,0),(2181,261,'昆都仑区',3,0),(2182,261,'青山区',3,0),(2183,261,'东河区',3,0),(2184,261,'九原区',3,0),(2185,261,'石拐区',3,0),(2186,261,'白云矿区',3,0),(2187,261,'土默特右旗',3,0),(2188,261,'固阳县',3,0),(2189,261,'达尔罕茂明安联合旗',3,0),(2190,262,'红山区',3,0),(2191,262,'元宝山区',3,0),(2192,262,'松山区',3,0),(2193,262,'阿鲁科尔沁旗',3,0),(2194,262,'巴林左旗',3,0),(2195,262,'巴林右旗',3,0),(2196,262,'林西县',3,0),(2197,262,'克什克腾旗',3,0),(2198,262,'翁牛特旗',3,0),(2199,262,'喀喇沁旗',3,0),(2200,262,'宁城县',3,0),(2201,262,'敖汉旗',3,0),(2202,263,'东胜区',3,0),(2203,263,'达拉特旗',3,0),(2204,263,'准格尔旗',3,0),(2205,263,'鄂托克前旗',3,0),(2206,263,'鄂托克旗',3,0),(2207,263,'杭锦旗',3,0),(2208,263,'乌审旗',3,0),(2209,263,'伊金霍洛旗',3,0),(2210,264,'海拉尔区',3,0),(2211,264,'莫力达瓦',3,0),(2212,264,'满洲里市',3,0),(2213,264,'牙克石市',3,0),(2214,264,'扎兰屯市',3,0),(2215,264,'额尔古纳市',3,0),(2216,264,'根河市',3,0),(2217,264,'阿荣旗',3,0),(2218,264,'鄂伦春自治旗',3,0),(2219,264,'鄂温克族自治旗',3,0),(2220,264,'陈巴尔虎旗',3,0),(2221,264,'新巴尔虎左旗',3,0),(2222,264,'新巴尔虎右旗',3,0),(2223,265,'科尔沁区',3,0),(2224,265,'霍林郭勒市',3,0),(2225,265,'科尔沁左翼中旗',3,0),(2226,265,'科尔沁左翼后旗',3,0),(2227,265,'开鲁县',3,0),(2228,265,'库伦旗',3,0),(2229,265,'奈曼旗',3,0),(2230,265,'扎鲁特旗',3,0),(2231,266,'海勃湾区',3,0),(2232,266,'乌达区',3,0),(2233,266,'海南区',3,0),(2234,267,'化德县',3,0),(2235,267,'集宁区',3,0),(2236,267,'丰镇市',3,0),(2237,267,'卓资县',3,0),(2238,267,'商都县',3,0),(2239,267,'兴和县',3,0),(2240,267,'凉城县',3,0),(2241,267,'察哈尔右翼前旗',3,0),(2242,267,'察哈尔右翼中旗',3,0),(2243,267,'察哈尔右翼后旗',3,0),(2244,267,'四子王旗',3,0),(2245,268,'二连浩特市',3,0),(2246,268,'锡林浩特市',3,0),(2247,268,'阿巴嘎旗',3,0),(2248,268,'苏尼特左旗',3,0),(2249,268,'苏尼特右旗',3,0),(2250,268,'东乌珠穆沁旗',3,0),(2251,268,'西乌珠穆沁旗',3,0),(2252,268,'太仆寺旗',3,0),(2253,268,'镶黄旗',3,0),(2254,268,'正镶白旗',3,0),(2255,268,'正蓝旗',3,0),(2256,268,'多伦县',3,0),(2257,269,'乌兰浩特市',3,0),(2258,269,'阿尔山市',3,0),(2259,269,'科尔沁右翼前旗',3,0),(2260,269,'科尔沁右翼中旗',3,0),(2261,269,'扎赉特旗',3,0),(2262,269,'突泉县',3,0),(2263,270,'西夏区',3,0),(2264,270,'金凤区',3,0),(2265,270,'兴庆区',3,0),(2266,270,'灵武市',3,0),(2267,270,'永宁县',3,0),(2268,270,'贺兰县',3,0),(2269,271,'原州区',3,0),(2270,271,'海原县',3,0),(2271,271,'西吉县',3,0),(2272,271,'隆德县',3,0),(2273,271,'泾源县',3,0),(2274,271,'彭阳县',3,0),(2275,272,'惠农县',3,0),(2276,272,'大武口区',3,0),(2277,272,'惠农区',3,0),(2278,272,'陶乐县',3,0),(2279,272,'平罗县',3,0),(2280,273,'利通区',3,0),(2281,273,'中卫县',3,0),(2282,273,'青铜峡市',3,0),(2283,273,'中宁县',3,0),(2284,273,'盐池县',3,0),(2285,273,'同心县',3,0),(2286,274,'沙坡头区',3,0),(2287,274,'海原县',3,0),(2288,274,'中宁县',3,0),(2289,275,'城中区',3,0),(2290,275,'城东区',3,0),(2291,275,'城西区',3,0),(2292,275,'城北区',3,0),(2293,275,'湟中县',3,0),(2294,275,'湟源县',3,0),(2295,275,'大通',3,0),(2296,276,'玛沁县',3,0),(2297,276,'班玛县',3,0),(2298,276,'甘德县',3,0),(2299,276,'达日县',3,0),(2300,276,'久治县',3,0),(2301,276,'玛多县',3,0),(2302,277,'海晏县',3,0),(2303,277,'祁连县',3,0),(2304,277,'刚察县',3,0),(2305,277,'门源',3,0),(2306,278,'平安县',3,0),(2307,278,'乐都县',3,0),(2308,278,'民和',3,0),(2309,278,'互助',3,0),(2310,278,'化隆',3,0),(2311,278,'循化',3,0),(2312,279,'共和县',3,0),(2313,279,'同德县',3,0),(2314,279,'贵德县',3,0),(2315,279,'兴海县',3,0),(2316,279,'贵南县',3,0),(2317,280,'德令哈市',3,0),(2318,280,'格尔木市',3,0),(2319,280,'乌兰县',3,0),(2320,280,'都兰县',3,0),(2321,280,'天峻县',3,0),(2322,281,'同仁县',3,0),(2323,281,'尖扎县',3,0),(2324,281,'泽库县',3,0),(2325,281,'河南蒙古族自治县',3,0),(2326,282,'玉树县',3,0),(2327,282,'杂多县',3,0),(2328,282,'称多县',3,0),(2329,282,'治多县',3,0),(2330,282,'囊谦县',3,0),(2331,282,'曲麻莱县',3,0),(2332,283,'市中区',3,0),(2333,283,'历下区',3,0),(2334,283,'天桥区',3,0),(2335,283,'槐荫区',3,0),(2336,283,'历城区',3,0),(2337,283,'长清区',3,0),(2338,283,'章丘市',3,0),(2339,283,'平阴县',3,0),(2340,283,'济阳县',3,0),(2341,283,'商河县',3,0),(2342,284,'市南区',3,0),(2343,284,'市北区',3,0),(2344,284,'城阳区',3,0),(2345,284,'四方区',3,0),(2346,284,'李沧区',3,0),(2347,284,'黄岛区',3,0),(2348,284,'崂山区',3,0),(2349,284,'胶州市',3,0),(2350,284,'即墨市',3,0),(2351,284,'平度市',3,0),(2352,284,'胶南市',3,0),(2353,284,'莱西市',3,0),(2354,285,'滨城区',3,0),(2355,285,'惠民县',3,0),(2356,285,'阳信县',3,0),(2357,285,'无棣县',3,0),(2358,285,'沾化县',3,0),(2359,285,'博兴县',3,0),(2360,285,'邹平县',3,0),(2361,286,'德城区',3,0),(2362,286,'陵县',3,0),(2363,286,'乐陵市',3,0),(2364,286,'禹城市',3,0),(2365,286,'宁津县',3,0),(2366,286,'庆云县',3,0),(2367,286,'临邑县',3,0),(2368,286,'齐河县',3,0),(2369,286,'平原县',3,0),(2370,286,'夏津县',3,0),(2371,286,'武城县',3,0),(2372,287,'东营区',3,0),(2373,287,'河口区',3,0),(2374,287,'垦利县',3,0),(2375,287,'利津县',3,0),(2376,287,'广饶县',3,0),(2377,288,'牡丹区',3,0),(2378,288,'曹县',3,0),(2379,288,'单县',3,0),(2380,288,'成武县',3,0),(2381,288,'巨野县',3,0),(2382,288,'郓城县',3,0),(2383,288,'鄄城县',3,0),(2384,288,'定陶县',3,0),(2385,288,'东明县',3,0),(2386,289,'市中区',3,0),(2387,289,'任城区',3,0),(2388,289,'曲阜市',3,0),(2389,289,'兖州市',3,0),(2390,289,'邹城市',3,0),(2391,289,'微山县',3,0),(2392,289,'鱼台县',3,0),(2393,289,'金乡县',3,0),(2394,289,'嘉祥县',3,0),(2395,289,'汶上县',3,0),(2396,289,'泗水县',3,0),(2397,289,'梁山县',3,0),(2398,290,'莱城区',3,0),(2399,290,'钢城区',3,0),(2400,291,'东昌府区',3,0),(2401,291,'临清市',3,0),(2402,291,'阳谷县',3,0),(2403,291,'莘县',3,0),(2404,291,'茌平县',3,0),(2405,291,'东阿县',3,0),(2406,291,'冠县',3,0),(2407,291,'高唐县',3,0),(2408,292,'兰山区',3,0),(2409,292,'罗庄区',3,0),(2410,292,'河东区',3,0),(2411,292,'沂南县',3,0),(2412,292,'郯城县',3,0),(2413,292,'沂水县',3,0),(2414,292,'苍山县',3,0),(2415,292,'费县',3,0),(2416,292,'平邑县',3,0),(2417,292,'莒南县',3,0),(2418,292,'蒙阴县',3,0),(2419,292,'临沭县',3,0),(2420,293,'东港区',3,0),(2421,293,'岚山区',3,0),(2422,293,'五莲县',3,0),(2423,293,'莒县',3,0),(2424,294,'泰山区',3,0),(2425,294,'岱岳区',3,0),(2426,294,'新泰市',3,0),(2427,294,'肥城市',3,0),(2428,294,'宁阳县',3,0),(2429,294,'东平县',3,0),(2430,295,'荣成市',3,0),(2431,295,'乳山市',3,0),(2432,295,'环翠区',3,0),(2433,295,'文登市',3,0),(2434,296,'潍城区',3,0),(2435,296,'寒亭区',3,0),(2436,296,'坊子区',3,0),(2437,296,'奎文区',3,0),(2438,296,'青州市',3,0),(2439,296,'诸城市',3,0),(2440,296,'寿光市',3,0),(2441,296,'安丘市',3,0),(2442,296,'高密市',3,0),(2443,296,'昌邑市',3,0),(2444,296,'临朐县',3,0),(2445,296,'昌乐县',3,0),(2446,297,'芝罘区',3,0),(2447,297,'福山区',3,0),(2448,297,'牟平区',3,0),(2449,297,'莱山区',3,0),(2450,297,'开发区',3,0),(2451,297,'龙口市',3,0),(2452,297,'莱阳市',3,0),(2453,297,'莱州市',3,0),(2454,297,'蓬莱市',3,0),(2455,297,'招远市',3,0),(2456,297,'栖霞市',3,0),(2457,297,'海阳市',3,0),(2458,297,'长岛县',3,0),(2459,298,'市中区',3,0),(2460,298,'山亭区',3,0),(2461,298,'峄城区',3,0),(2462,298,'台儿庄区',3,0),(2463,298,'薛城区',3,0),(2464,298,'滕州市',3,0),(2465,299,'张店区',3,0),(2466,299,'临淄区',3,0),(2467,299,'淄川区',3,0),(2468,299,'博山区',3,0),(2469,299,'周村区',3,0),(2470,299,'桓台县',3,0),(2471,299,'高青县',3,0),(2472,299,'沂源县',3,0),(2473,300,'杏花岭区',3,0),(2474,300,'小店区',3,0),(2475,300,'迎泽区',3,0),(2476,300,'尖草坪区',3,0),(2477,300,'万柏林区',3,0),(2478,300,'晋源区',3,0),(2479,300,'高新开发区',3,0),(2480,300,'民营经济开发区',3,0),(2481,300,'经济技术开发区',3,0),(2482,300,'清徐县',3,0),(2483,300,'阳曲县',3,0),(2484,300,'娄烦县',3,0),(2485,300,'古交市',3,0),(2486,301,'城区',3,0),(2487,301,'郊区',3,0),(2488,301,'沁县',3,0),(2489,301,'潞城市',3,0),(2490,301,'长治县',3,0),(2491,301,'襄垣县',3,0),(2492,301,'屯留县',3,0),(2493,301,'平顺县',3,0),(2494,301,'黎城县',3,0),(2495,301,'壶关县',3,0),(2496,301,'长子县',3,0),(2497,301,'武乡县',3,0),(2498,301,'沁源县',3,0),(2499,302,'城区',3,0),(2500,302,'矿区',3,0),(2501,302,'南郊区',3,0),(2502,302,'新荣区',3,0),(2503,302,'阳高县',3,0),(2504,302,'天镇县',3,0),(2505,302,'广灵县',3,0),(2506,302,'灵丘县',3,0),(2507,302,'浑源县',3,0),(2508,302,'左云县',3,0),(2509,302,'大同县',3,0),(2510,303,'城区',3,0),(2511,303,'高平市',3,0),(2512,303,'沁水县',3,0),(2513,303,'阳城县',3,0),(2514,303,'陵川县',3,0),(2515,303,'泽州县',3,0),(2516,304,'榆次区',3,0),(2517,304,'介休市',3,0),(2518,304,'榆社县',3,0),(2519,304,'左权县',3,0),(2520,304,'和顺县',3,0),(2521,304,'昔阳县',3,0),(2522,304,'寿阳县',3,0),(2523,304,'太谷县',3,0),(2524,304,'祁县',3,0),(2525,304,'平遥县',3,0),(2526,304,'灵石县',3,0),(2527,305,'尧都区',3,0),(2528,305,'侯马市',3,0),(2529,305,'霍州市',3,0),(2530,305,'曲沃县',3,0),(2531,305,'翼城县',3,0),(2532,305,'襄汾县',3,0),(2533,305,'洪洞县',3,0),(2534,305,'吉县',3,0),(2535,305,'安泽县',3,0),(2536,305,'浮山县',3,0),(2537,305,'古县',3,0),(2538,305,'乡宁县',3,0),(2539,305,'大宁县',3,0),(2540,305,'隰县',3,0),(2541,305,'永和县',3,0),(2542,305,'蒲县',3,0),(2543,305,'汾西县',3,0),(2544,306,'离石市',3,0),(2545,306,'离石区',3,0),(2546,306,'孝义市',3,0),(2547,306,'汾阳市',3,0),(2548,306,'文水县',3,0),(2549,306,'交城县',3,0),(2550,306,'兴县',3,0),(2551,306,'临县',3,0),(2552,306,'柳林县',3,0),(2553,306,'石楼县',3,0),(2554,306,'岚县',3,0),(2555,306,'方山县',3,0),(2556,306,'中阳县',3,0),(2557,306,'交口县',3,0),(2558,307,'朔城区',3,0),(2559,307,'平鲁区',3,0),(2560,307,'山阴县',3,0),(2561,307,'应县',3,0),(2562,307,'右玉县',3,0),(2563,307,'怀仁县',3,0),(2564,308,'忻府区',3,0),(2565,308,'原平市',3,0),(2566,308,'定襄县',3,0),(2567,308,'五台县',3,0),(2568,308,'代县',3,0),(2569,308,'繁峙县',3,0),(2570,308,'宁武县',3,0),(2571,308,'静乐县',3,0),(2572,308,'神池县',3,0),(2573,308,'五寨县',3,0),(2574,308,'岢岚县',3,0),(2575,308,'河曲县',3,0),(2576,308,'保德县',3,0),(2577,308,'偏关县',3,0),(2578,309,'城区',3,0),(2579,309,'矿区',3,0),(2580,309,'郊区',3,0),(2581,309,'平定县',3,0),(2582,309,'盂县',3,0),(2583,310,'盐湖区',3,0),(2584,310,'永济市',3,0),(2585,310,'河津市',3,0),(2586,310,'临猗县',3,0),(2587,310,'万荣县',3,0),(2588,310,'闻喜县',3,0),(2589,310,'稷山县',3,0),(2590,310,'新绛县',3,0),(2591,310,'绛县',3,0),(2592,310,'垣曲县',3,0),(2593,310,'夏县',3,0),(2594,310,'平陆县',3,0),(2595,310,'芮城县',3,0),(2596,311,'莲湖区',3,0),(2597,311,'新城区',3,0),(2598,311,'碑林区',3,0),(2599,311,'雁塔区',3,0),(2600,311,'灞桥区',3,0),(2601,311,'未央区',3,0),(2602,311,'阎良区',3,0),(2603,311,'临潼区',3,0),(2604,311,'长安区',3,0),(2605,311,'蓝田县',3,0),(2606,311,'周至县',3,0),(2607,311,'户县',3,0),(2608,311,'高陵县',3,0),(2609,312,'汉滨区',3,0),(2610,312,'汉阴县',3,0),(2611,312,'石泉县',3,0),(2612,312,'宁陕县',3,0),(2613,312,'紫阳县',3,0),(2614,312,'岚皋县',3,0),(2615,312,'平利县',3,0),(2616,312,'镇坪县',3,0),(2617,312,'旬阳县',3,0),(2618,312,'白河县',3,0),(2619,313,'陈仓区',3,0),(2620,313,'渭滨区',3,0),(2621,313,'金台区',3,0),(2622,313,'凤翔县',3,0),(2623,313,'岐山县',3,0),(2624,313,'扶风县',3,0),(2625,313,'眉县',3,0),(2626,313,'陇县',3,0),(2627,313,'千阳县',3,0),(2628,313,'麟游县',3,0),(2629,313,'凤县',3,0),(2630,313,'太白县',3,0),(2631,314,'汉台区',3,0),(2632,314,'南郑县',3,0),(2633,314,'城固县',3,0),(2634,314,'洋县',3,0),(2635,314,'西乡县',3,0),(2636,314,'勉县',3,0),(2637,314,'宁强县',3,0),(2638,314,'略阳县',3,0),(2639,314,'镇巴县',3,0),(2640,314,'留坝县',3,0),(2641,314,'佛坪县',3,0),(2642,315,'商州区',3,0),(2643,315,'洛南县',3,0),(2644,315,'丹凤县',3,0),(2645,315,'商南县',3,0),(2646,315,'山阳县',3,0),(2647,315,'镇安县',3,0),(2648,315,'柞水县',3,0),(2649,316,'耀州区',3,0),(2650,316,'王益区',3,0),(2651,316,'印台区',3,0),(2652,316,'宜君县',3,0),(2653,317,'临渭区',3,0),(2654,317,'韩城市',3,0),(2655,317,'华阴市',3,0),(2656,317,'华县',3,0),(2657,317,'潼关县',3,0),(2658,317,'大荔县',3,0),(2659,317,'合阳县',3,0),(2660,317,'澄城县',3,0),(2661,317,'蒲城县',3,0),(2662,317,'白水县',3,0),(2663,317,'富平县',3,0),(2664,318,'秦都区',3,0),(2665,318,'渭城区',3,0),(2666,318,'杨陵区',3,0),(2667,318,'兴平市',3,0),(2668,318,'三原县',3,0),(2669,318,'泾阳县',3,0),(2670,318,'乾县',3,0),(2671,318,'礼泉县',3,0),(2672,318,'永寿县',3,0),(2673,318,'彬县',3,0),(2674,318,'长武县',3,0),(2675,318,'旬邑县',3,0),(2676,318,'淳化县',3,0),(2677,318,'武功县',3,0),(2678,319,'吴起县',3,0),(2679,319,'宝塔区',3,0),(2680,319,'延长县',3,0),(2681,319,'延川县',3,0),(2682,319,'子长县',3,0),(2683,319,'安塞县',3,0),(2684,319,'志丹县',3,0),(2685,319,'甘泉县',3,0),(2686,319,'富县',3,0),(2687,319,'洛川县',3,0),(2688,319,'宜川县',3,0),(2689,319,'黄龙县',3,0),(2690,319,'黄陵县',3,0),(2691,320,'榆阳区',3,0),(2692,320,'神木县',3,0),(2693,320,'府谷县',3,0),(2694,320,'横山县',3,0),(2695,320,'靖边县',3,0),(2696,320,'定边县',3,0),(2697,320,'绥德县',3,0),(2698,320,'米脂县',3,0),(2699,320,'佳县',3,0),(2700,320,'吴堡县',3,0),(2701,320,'清涧县',3,0),(2702,320,'子洲县',3,0),(2703,321,'长宁区',3,0),(2704,321,'闸北区',3,0),(2705,321,'闵行区',3,0),(2706,321,'徐汇区',3,0),(2707,321,'浦东新区',3,0),(2708,321,'杨浦区',3,0),(2709,321,'普陀区',3,0),(2710,321,'静安区',3,0),(2711,321,'卢湾区',3,0),(2712,321,'虹口区',3,0),(2713,321,'黄浦区',3,0),(2714,321,'南汇区',3,0),(2715,321,'松江区',3,0),(2716,321,'嘉定区',3,0),(2717,321,'宝山区',3,0),(2718,321,'青浦区',3,0),(2719,321,'金山区',3,0),(2720,321,'奉贤区',3,0),(2721,321,'崇明县',3,0),(2722,322,'青羊区',3,0),(2723,322,'锦江区',3,0),(2724,322,'金牛区',3,0),(2725,322,'武侯区',3,0),(2726,322,'成华区',3,0),(2727,322,'龙泉驿区',3,0),(2728,322,'青白江区',3,0),(2729,322,'新都区',3,0),(2730,322,'温江区',3,0),(2731,322,'高新区',3,0),(2732,322,'高新西区',3,0),(2733,322,'都江堰市',3,0),(2734,322,'彭州市',3,0),(2735,322,'邛崃市',3,0),(2736,322,'崇州市',3,0),(2737,322,'金堂县',3,0),(2738,322,'双流县',3,0),(2739,322,'郫县',3,0),(2740,322,'大邑县',3,0),(2741,322,'蒲江县',3,0),(2742,322,'新津县',3,0),(2743,322,'都江堰市',3,0),(2744,322,'彭州市',3,0),(2745,322,'邛崃市',3,0),(2746,322,'崇州市',3,0),(2747,322,'金堂县',3,0),(2748,322,'双流县',3,0),(2749,322,'郫县',3,0),(2750,322,'大邑县',3,0),(2751,322,'蒲江县',3,0),(2752,322,'新津县',3,0),(2753,323,'涪城区',3,0),(2754,323,'游仙区',3,0),(2755,323,'江油市',3,0),(2756,323,'盐亭县',3,0),(2757,323,'三台县',3,0),(2758,323,'平武县',3,0),(2759,323,'安县',3,0),(2760,323,'梓潼县',3,0),(2761,323,'北川县',3,0),(2762,324,'马尔康县',3,0),(2763,324,'汶川县',3,0),(2764,324,'理县',3,0),(2765,324,'茂县',3,0),(2766,324,'松潘县',3,0),(2767,324,'九寨沟县',3,0),(2768,324,'金川县',3,0),(2769,324,'小金县',3,0),(2770,324,'黑水县',3,0),(2771,324,'壤塘县',3,0),(2772,324,'阿坝县',3,0),(2773,324,'若尔盖县',3,0),(2774,324,'红原县',3,0),(2775,325,'巴州区',3,0),(2776,325,'通江县',3,0),(2777,325,'南江县',3,0),(2778,325,'平昌县',3,0),(2779,326,'通川区',3,0),(2780,326,'万源市',3,0),(2781,326,'达县',3,0),(2782,326,'宣汉县',3,0),(2783,326,'开江县',3,0),(2784,326,'大竹县',3,0),(2785,326,'渠县',3,0),(2786,327,'旌阳区',3,0),(2787,327,'广汉市',3,0),(2788,327,'什邡市',3,0),(2789,327,'绵竹市',3,0),(2790,327,'罗江县',3,0),(2791,327,'中江县',3,0),(2792,328,'康定县',3,0),(2793,328,'丹巴县',3,0),(2794,328,'泸定县',3,0),(2795,328,'炉霍县',3,0),(2796,328,'九龙县',3,0),(2797,328,'甘孜县',3,0),(2798,328,'雅江县',3,0),(2799,328,'新龙县',3,0),(2800,328,'道孚县',3,0),(2801,328,'白玉县',3,0),(2802,328,'理塘县',3,0),(2803,328,'德格县',3,0),(2804,328,'乡城县',3,0),(2805,328,'石渠县',3,0),(2806,328,'稻城县',3,0),(2807,328,'色达县',3,0),(2808,328,'巴塘县',3,0),(2809,328,'得荣县',3,0),(2810,329,'广安区',3,0),(2811,329,'华蓥市',3,0),(2812,329,'岳池县',3,0),(2813,329,'武胜县',3,0),(2814,329,'邻水县',3,0),(2815,330,'利州区',3,0),(2816,330,'元坝区',3,0),(2817,330,'朝天区',3,0),(2818,330,'旺苍县',3,0),(2819,330,'青川县',3,0),(2820,330,'剑阁县',3,0),(2821,330,'苍溪县',3,0),(2822,331,'峨眉山市',3,0),(2823,331,'乐山市',3,0),(2824,331,'犍为县',3,0),(2825,331,'井研县',3,0),(2826,331,'夹江县',3,0),(2827,331,'沐川县',3,0),(2828,331,'峨边',3,0),(2829,331,'马边',3,0),(2830,332,'西昌市',3,0),(2831,332,'盐源县',3,0),(2832,332,'德昌县',3,0),(2833,332,'会理县',3,0),(2834,332,'会东县',3,0),(2835,332,'宁南县',3,0),(2836,332,'普格县',3,0),(2837,332,'布拖县',3,0),(2838,332,'金阳县',3,0),(2839,332,'昭觉县',3,0),(2840,332,'喜德县',3,0),(2841,332,'冕宁县',3,0),(2842,332,'越西县',3,0),(2843,332,'甘洛县',3,0),(2844,332,'美姑县',3,0),(2845,332,'雷波县',3,0),(2846,332,'木里',3,0),(2847,333,'东坡区',3,0),(2848,333,'仁寿县',3,0),(2849,333,'彭山县',3,0),(2850,333,'洪雅县',3,0),(2851,333,'丹棱县',3,0),(2852,333,'青神县',3,0),(2853,334,'阆中市',3,0),(2854,334,'南部县',3,0),(2855,334,'营山县',3,0),(2856,334,'蓬安县',3,0),(2857,334,'仪陇县',3,0),(2858,334,'顺庆区',3,0),(2859,334,'高坪区',3,0),(2860,334,'嘉陵区',3,0),(2861,334,'西充县',3,0),(2862,335,'市中区',3,0),(2863,335,'东兴区',3,0),(2864,335,'威远县',3,0),(2865,335,'资中县',3,0),(2866,335,'隆昌县',3,0),(2867,336,'东  区',3,0),(2868,336,'西  区',3,0),(2869,336,'仁和区',3,0),(2870,336,'米易县',3,0),(2871,336,'盐边县',3,0),(2872,337,'船山区',3,0),(2873,337,'安居区',3,0),(2874,337,'蓬溪县',3,0),(2875,337,'射洪县',3,0),(2876,337,'大英县',3,0),(2877,338,'雨城区',3,0),(2878,338,'名山县',3,0),(2879,338,'荥经县',3,0),(2880,338,'汉源县',3,0),(2881,338,'石棉县',3,0),(2882,338,'天全县',3,0),(2883,338,'芦山县',3,0),(2884,338,'宝兴县',3,0),(2885,339,'翠屏区',3,0),(2886,339,'宜宾县',3,0),(2887,339,'南溪县',3,0),(2888,339,'江安县',3,0),(2889,339,'长宁县',3,0),(2890,339,'高县',3,0),(2891,339,'珙县',3,0),(2892,339,'筠连县',3,0),(2893,339,'兴文县',3,0),(2894,339,'屏山县',3,0),(2895,340,'雁江区',3,0),(2896,340,'简阳市',3,0),(2897,340,'安岳县',3,0),(2898,340,'乐至县',3,0),(2899,341,'大安区',3,0),(2900,341,'自流井区',3,0),(2901,341,'贡井区',3,0),(2902,341,'沿滩区',3,0),(2903,341,'荣县',3,0),(2904,341,'富顺县',3,0),(2905,342,'江阳区',3,0),(2906,342,'纳溪区',3,0),(2907,342,'龙马潭区',3,0),(2908,342,'泸县',3,0),(2909,342,'合江县',3,0),(2910,342,'叙永县',3,0),(2911,342,'古蔺县',3,0),(2912,343,'和平区',3,0),(2913,343,'河西区',3,0),(2914,343,'南开区',3,0),(2915,343,'河北区',3,0),(2916,343,'河东区',3,0),(2917,343,'红桥区',3,0),(2918,343,'东丽区',3,0),(2919,343,'津南区',3,0),(2920,343,'西青区',3,0),(2921,343,'北辰区',3,0),(2922,343,'塘沽区',3,0),(2923,343,'汉沽区',3,0),(2924,343,'大港区',3,0),(2925,343,'武清区',3,0),(2926,343,'宝坻区',3,0),(2927,343,'经济开发区',3,0),(2928,343,'宁河县',3,0),(2929,343,'静海县',3,0),(2930,343,'蓟县',3,0),(2931,344,'城关区',3,0),(2932,344,'林周县',3,0),(2933,344,'当雄县',3,0),(2934,344,'尼木县',3,0),(2935,344,'曲水县',3,0),(2936,344,'堆龙德庆县',3,0),(2937,344,'达孜县',3,0),(2938,344,'墨竹工卡县',3,0),(2939,345,'噶尔县',3,0),(2940,345,'普兰县',3,0),(2941,345,'札达县',3,0),(2942,345,'日土县',3,0),(2943,345,'革吉县',3,0),(2944,345,'改则县',3,0),(2945,345,'措勤县',3,0),(2946,346,'昌都县',3,0),(2947,346,'江达县',3,0),(2948,346,'贡觉县',3,0),(2949,346,'类乌齐县',3,0),(2950,346,'丁青县',3,0),(2951,346,'察雅县',3,0),(2952,346,'八宿县',3,0),(2953,346,'左贡县',3,0),(2954,346,'芒康县',3,0),(2955,346,'洛隆县',3,0),(2956,346,'边坝县',3,0),(2957,347,'林芝县',3,0),(2958,347,'工布江达县',3,0),(2959,347,'米林县',3,0),(2960,347,'墨脱县',3,0),(2961,347,'波密县',3,0),(2962,347,'察隅县',3,0),(2963,347,'朗县',3,0),(2964,348,'那曲县',3,0),(2965,348,'嘉黎县',3,0),(2966,348,'比如县',3,0),(2967,348,'聂荣县',3,0),(2968,348,'安多县',3,0),(2969,348,'申扎县',3,0),(2970,348,'索县',3,0),(2971,348,'班戈县',3,0),(2972,348,'巴青县',3,0),(2973,348,'尼玛县',3,0),(2974,349,'日喀则市',3,0),(2975,349,'南木林县',3,0),(2976,349,'江孜县',3,0),(2977,349,'定日县',3,0),(2978,349,'萨迦县',3,0),(2979,349,'拉孜县',3,0),(2980,349,'昂仁县',3,0),(2981,349,'谢通门县',3,0),(2982,349,'白朗县',3,0),(2983,349,'仁布县',3,0),(2984,349,'康马县',3,0),(2985,349,'定结县',3,0),(2986,349,'仲巴县',3,0),(2987,349,'亚东县',3,0),(2988,349,'吉隆县',3,0),(2989,349,'聂拉木县',3,0),(2990,349,'萨嘎县',3,0),(2991,349,'岗巴县',3,0),(2992,350,'乃东县',3,0),(2993,350,'扎囊县',3,0),(2994,350,'贡嘎县',3,0),(2995,350,'桑日县',3,0),(2996,350,'琼结县',3,0),(2997,350,'曲松县',3,0),(2998,350,'措美县',3,0),(2999,350,'洛扎县',3,0),(3000,350,'加查县',3,0),(3001,350,'隆子县',3,0),(3002,350,'错那县',3,0),(3003,350,'浪卡子县',3,0),(3004,351,'天山区',3,0),(3005,351,'沙依巴克区',3,0),(3006,351,'新市区',3,0),(3007,351,'水磨沟区',3,0),(3008,351,'头屯河区',3,0),(3009,351,'达坂城区',3,0),(3010,351,'米东区',3,0),(3011,351,'乌鲁木齐县',3,0),(3012,352,'阿克苏市',3,0),(3013,352,'温宿县',3,0),(3014,352,'库车县',3,0),(3015,352,'沙雅县',3,0),(3016,352,'新和县',3,0),(3017,352,'拜城县',3,0),(3018,352,'乌什县',3,0),(3019,352,'阿瓦提县',3,0),(3020,352,'柯坪县',3,0),(3021,353,'阿拉尔市',3,0),(3022,354,'库尔勒市',3,0),(3023,354,'轮台县',3,0),(3024,354,'尉犁县',3,0),(3025,354,'若羌县',3,0),(3026,354,'且末县',3,0),(3027,354,'焉耆',3,0),(3028,354,'和静县',3,0),(3029,354,'和硕县',3,0),(3030,354,'博湖县',3,0),(3031,355,'博乐市',3,0),(3032,355,'精河县',3,0),(3033,355,'温泉县',3,0),(3034,356,'呼图壁县',3,0),(3035,356,'米泉市',3,0),(3036,356,'昌吉市',3,0),(3037,356,'阜康市',3,0),(3038,356,'玛纳斯县',3,0),(3039,356,'奇台县',3,0),(3040,356,'吉木萨尔县',3,0),(3041,356,'木垒',3,0),(3042,357,'哈密市',3,0),(3043,357,'伊吾县',3,0),(3044,357,'巴里坤',3,0),(3045,358,'和田市',3,0),(3046,358,'和田县',3,0),(3047,358,'墨玉县',3,0),(3048,358,'皮山县',3,0),(3049,358,'洛浦县',3,0),(3050,358,'策勒县',3,0),(3051,358,'于田县',3,0),(3052,358,'民丰县',3,0),(3053,359,'喀什市',3,0),(3054,359,'疏附县',3,0),(3055,359,'疏勒县',3,0),(3056,359,'英吉沙县',3,0),(3057,359,'泽普县',3,0),(3058,359,'莎车县',3,0),(3059,359,'叶城县',3,0),(3060,359,'麦盖提县',3,0),(3061,359,'岳普湖县',3,0),(3062,359,'伽师县',3,0),(3063,359,'巴楚县',3,0),(3064,359,'塔什库尔干',3,0),(3065,360,'克拉玛依市',3,0),(3066,361,'阿图什市',3,0),(3067,361,'阿克陶县',3,0),(3068,361,'阿合奇县',3,0),(3069,361,'乌恰县',3,0),(3070,362,'石河子市',3,0),(3071,363,'图木舒克市',3,0),(3072,364,'吐鲁番市',3,0),(3073,364,'鄯善县',3,0),(3074,364,'托克逊县',3,0),(3075,365,'五家渠市',3,0),(3076,366,'阿勒泰市',3,0),(3077,366,'布克赛尔',3,0),(3078,366,'伊宁市',3,0),(3079,366,'布尔津县',3,0),(3080,366,'奎屯市',3,0),(3081,366,'乌苏市',3,0),(3082,366,'额敏县',3,0),(3083,366,'富蕴县',3,0),(3084,366,'伊宁县',3,0),(3085,366,'福海县',3,0),(3086,366,'霍城县',3,0),(3087,366,'沙湾县',3,0),(3088,366,'巩留县',3,0),(3089,366,'哈巴河县',3,0),(3090,366,'托里县',3,0),(3091,366,'青河县',3,0),(3092,366,'新源县',3,0),(3093,366,'裕民县',3,0),(3094,366,'和布克赛尔',3,0),(3095,366,'吉木乃县',3,0),(3096,366,'昭苏县',3,0),(3097,366,'特克斯县',3,0),(3098,366,'尼勒克县',3,0),(3099,366,'察布查尔',3,0),(3100,367,'盘龙区',3,0),(3101,367,'五华区',3,0),(3102,367,'官渡区',3,0),(3103,367,'西山区',3,0),(3104,367,'东川区',3,0),(3105,367,'安宁市',3,0),(3106,367,'呈贡县',3,0),(3107,367,'晋宁县',3,0),(3108,367,'富民县',3,0),(3109,367,'宜良县',3,0),(3110,367,'嵩明县',3,0),(3111,367,'石林县',3,0),(3112,367,'禄劝',3,0),(3113,367,'寻甸',3,0),(3114,368,'兰坪',3,0),(3115,368,'泸水县',3,0),(3116,368,'福贡县',3,0),(3117,368,'贡山',3,0),(3118,369,'宁洱',3,0),(3119,369,'思茅区',3,0),(3120,369,'墨江',3,0),(3121,369,'景东',3,0),(3122,369,'景谷',3,0),(3123,369,'镇沅',3,0),(3124,369,'江城',3,0),(3125,369,'孟连',3,0),(3126,369,'澜沧',3,0),(3127,369,'西盟',3,0),(3128,370,'古城区',3,0),(3129,370,'宁蒗',3,0),(3130,370,'玉龙',3,0),(3131,370,'永胜县',3,0),(3132,370,'华坪县',3,0),(3133,371,'隆阳区',3,0),(3134,371,'施甸县',3,0),(3135,371,'腾冲县',3,0),(3136,371,'龙陵县',3,0),(3137,371,'昌宁县',3,0),(3138,372,'楚雄市',3,0),(3139,372,'双柏县',3,0),(3140,372,'牟定县',3,0),(3141,372,'南华县',3,0),(3142,372,'姚安县',3,0),(3143,372,'大姚县',3,0),(3144,372,'永仁县',3,0),(3145,372,'元谋县',3,0),(3146,372,'武定县',3,0),(3147,372,'禄丰县',3,0),(3148,373,'大理市',3,0),(3149,373,'祥云县',3,0),(3150,373,'宾川县',3,0),(3151,373,'弥渡县',3,0),(3152,373,'永平县',3,0),(3153,373,'云龙县',3,0),(3154,373,'洱源县',3,0),(3155,373,'剑川县',3,0),(3156,373,'鹤庆县',3,0),(3157,373,'漾濞',3,0),(3158,373,'南涧',3,0),(3159,373,'巍山',3,0),(3160,374,'潞西市',3,0),(3161,374,'瑞丽市',3,0),(3162,374,'梁河县',3,0),(3163,374,'盈江县',3,0),(3164,374,'陇川县',3,0),(3165,375,'香格里拉县',3,0),(3166,375,'德钦县',3,0),(3167,375,'维西',3,0),(3168,376,'泸西县',3,0),(3169,376,'蒙自县',3,0),(3170,376,'个旧市',3,0),(3171,376,'开远市',3,0),(3172,376,'绿春县',3,0),(3173,376,'建水县',3,0),(3174,376,'石屏县',3,0),(3175,376,'弥勒县',3,0),(3176,376,'元阳县',3,0),(3177,376,'红河县',3,0),(3178,376,'金平',3,0),(3179,376,'河口',3,0),(3180,376,'屏边',3,0),(3181,377,'临翔区',3,0),(3182,377,'凤庆县',3,0),(3183,377,'云县',3,0),(3184,377,'永德县',3,0),(3185,377,'镇康县',3,0),(3186,377,'双江',3,0),(3187,377,'耿马',3,0),(3188,377,'沧源',3,0),(3189,378,'麒麟区',3,0),(3190,378,'宣威市',3,0),(3191,378,'马龙县',3,0),(3192,378,'陆良县',3,0),(3193,378,'师宗县',3,0),(3194,378,'罗平县',3,0),(3195,378,'富源县',3,0),(3196,378,'会泽县',3,0),(3197,378,'沾益县',3,0),(3198,379,'文山县',3,0),(3199,379,'砚山县',3,0),(3200,379,'西畴县',3,0),(3201,379,'麻栗坡县',3,0),(3202,379,'马关县',3,0),(3203,379,'丘北县',3,0),(3204,379,'广南县',3,0),(3205,379,'富宁县',3,0),(3206,380,'景洪市',3,0),(3207,380,'勐海县',3,0),(3208,380,'勐腊县',3,0),(3209,381,'红塔区',3,0),(3210,381,'江川县',3,0),(3211,381,'澄江县',3,0),(3212,381,'通海县',3,0),(3213,381,'华宁县',3,0),(3214,381,'易门县',3,0),(3215,381,'峨山',3,0),(3216,381,'新平',3,0),(3217,381,'元江',3,0),(3218,382,'昭阳区',3,0),(3219,382,'鲁甸县',3,0),(3220,382,'巧家县',3,0),(3221,382,'盐津县',3,0),(3222,382,'大关县',3,0),(3223,382,'永善县',3,0),(3224,382,'绥江县',3,0),(3225,382,'镇雄县',3,0),(3226,382,'彝良县',3,0),(3227,382,'威信县',3,0),(3228,382,'水富县',3,0),(3229,383,'西湖区',3,0),(3230,383,'上城区',3,0),(3231,383,'下城区',3,0),(3232,383,'拱墅区',3,0),(3233,383,'滨江区',3,0),(3234,383,'江干区',3,0),(3235,383,'萧山区',3,0),(3236,383,'余杭区',3,0),(3237,383,'市郊',3,0),(3238,383,'建德市',3,0),(3239,383,'富阳市',3,0),(3240,383,'临安市',3,0),(3241,383,'桐庐县',3,0),(3242,383,'淳安县',3,0),(3243,384,'吴兴区',3,0),(3244,384,'南浔区',3,0),(3245,384,'德清县',3,0),(3246,384,'长兴县',3,0),(3247,384,'安吉县',3,0),(3248,385,'南湖区',3,0),(3249,385,'秀洲区',3,0),(3250,385,'海宁市',3,0),(3251,385,'嘉善县',3,0),(3252,385,'平湖市',3,0),(3253,385,'桐乡市',3,0),(3254,385,'海盐县',3,0),(3255,386,'婺城区',3,0),(3256,386,'金东区',3,0),(3257,386,'兰溪市',3,0),(3258,386,'市区',3,0),(3259,386,'佛堂镇',3,0),(3260,386,'上溪镇',3,0),(3261,386,'义亭镇',3,0),(3262,386,'大陈镇',3,0),(3263,386,'苏溪镇',3,0),(3264,386,'赤岸镇',3,0),(3265,386,'东阳市',3,0),(3266,386,'永康市',3,0),(3267,386,'武义县',3,0),(3268,386,'浦江县',3,0),(3269,386,'磐安县',3,0),(3270,387,'莲都区',3,0),(3271,387,'龙泉市',3,0),(3272,387,'青田县',3,0),(3273,387,'缙云县',3,0),(3274,387,'遂昌县',3,0),(3275,387,'松阳县',3,0),(3276,387,'云和县',3,0),(3277,387,'庆元县',3,0),(3278,387,'景宁',3,0),(3279,388,'海曙区',3,0),(3280,388,'江东区',3,0),(3281,388,'江北区',3,0),(3282,388,'镇海区',3,0),(3283,388,'北仑区',3,0),(3284,388,'鄞州区',3,0),(3285,388,'余姚市',3,0),(3286,388,'慈溪市',3,0),(3287,388,'奉化市',3,0),(3288,388,'象山县',3,0),(3289,388,'宁海县',3,0),(3290,389,'越城区',3,0),(3291,389,'上虞市',3,0),(3292,389,'嵊州市',3,0),(3293,389,'绍兴县',3,0),(3294,389,'新昌县',3,0),(3295,389,'诸暨市',3,0),(3296,390,'椒江区',3,0),(3297,390,'黄岩区',3,0),(3298,390,'路桥区',3,0),(3299,390,'温岭市',3,0),(3300,390,'临海市',3,0),(3301,390,'玉环县',3,0),(3302,390,'三门县',3,0),(3303,390,'天台县',3,0),(3304,390,'仙居县',3,0),(3305,391,'鹿城区',3,0),(3306,391,'龙湾区',3,0),(3307,391,'瓯海区',3,0),(3308,391,'瑞安市',3,0),(3309,391,'乐清市',3,0),(3310,391,'洞头县',3,0),(3311,391,'永嘉县',3,0),(3312,391,'平阳县',3,0),(3313,391,'苍南县',3,0),(3314,391,'文成县',3,0),(3315,391,'泰顺县',3,0),(3316,392,'定海区',3,0),(3317,392,'普陀区',3,0),(3318,392,'岱山县',3,0),(3319,392,'嵊泗县',3,0),(3320,393,'衢州市',3,0),(3321,393,'江山市',3,0),(3322,393,'常山县',3,0),(3323,393,'开化县',3,0),(3324,393,'龙游县',3,0),(3325,394,'合川区',3,0),(3326,394,'江津区',3,0),(3327,394,'南川区',3,0),(3328,394,'永川区',3,0),(3329,394,'南岸区',3,0),(3330,394,'渝北区',3,0),(3331,394,'万盛区',3,0),(3332,394,'大渡口区',3,0),(3333,394,'万州区',3,0),(3334,394,'北碚区',3,0),(3335,394,'沙坪坝区',3,0),(3336,394,'巴南区',3,0),(3337,394,'涪陵区',3,0),(3338,394,'江北区',3,0),(3339,394,'九龙坡区',3,0),(3340,394,'渝中区',3,0),(3341,394,'黔江开发区',3,0),(3342,394,'长寿区',3,0),(3343,394,'双桥区',3,0),(3344,394,'綦江县',3,0),(3345,394,'潼南县',3,0),(3346,394,'铜梁县',3,0),(3347,394,'大足县',3,0),(3348,394,'荣昌县',3,0),(3349,394,'璧山县',3,0),(3350,394,'垫江县',3,0),(3351,394,'武隆县',3,0),(3352,394,'丰都县',3,0),(3353,394,'城口县',3,0),(3354,394,'梁平县',3,0),(3355,394,'开县',3,0),(3356,394,'巫溪县',3,0),(3357,394,'巫山县',3,0),(3358,394,'奉节县',3,0),(3359,394,'云阳县',3,0),(3360,394,'忠县',3,0),(3361,394,'石柱',3,0),(3362,394,'彭水',3,0),(3363,394,'酉阳',3,0),(3364,394,'秀山',3,0),(3365,395,'沙田区',3,0),(3366,395,'东区',3,0),(3367,395,'观塘区',3,0),(3368,395,'黄大仙区',3,0),(3369,395,'九龙城区',3,0),(3370,395,'屯门区',3,0),(3371,395,'葵青区',3,0),(3372,395,'元朗区',3,0),(3373,395,'深水埗区',3,0),(3374,395,'西贡区',3,0),(3375,395,'大埔区',3,0),(3376,395,'湾仔区',3,0),(3377,395,'油尖旺区',3,0),(3378,395,'北区',3,0),(3379,395,'南区',3,0),(3380,395,'荃湾区',3,0),(3381,395,'中西区',3,0),(3382,395,'离岛区',3,0),(3383,396,'澳门',3,0),(3384,397,'台北',3,0),(3385,397,'高雄',3,0),(3386,397,'基隆',3,0),(3387,397,'台中',3,0),(3388,397,'台南',3,0),(3389,397,'新竹',3,0),(3390,397,'嘉义',3,0),(3391,397,'宜兰县',3,0),(3392,397,'桃园县',3,0),(3393,397,'苗栗县',3,0),(3394,397,'彰化县',3,0),(3395,397,'南投县',3,0),(3396,397,'云林县',3,0),(3397,397,'屏东县',3,0),(3398,397,'台东县',3,0),(3399,397,'花莲县',3,0),(3400,397,'澎湖县',3,0),(3401,3,'合肥',2,0),(3402,3401,'庐阳区',3,0),(3403,3401,'瑶海区',3,0),(3404,3401,'蜀山区',3,0),(3405,3401,'包河区',3,0),(3406,3401,'长丰县',3,0),(3407,3401,'肥东县',3,0),(3408,3401,'肥西县',3,0);
/*!40000 ALTER TABLE `yourphp_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_role`
--

DROP TABLE IF EXISTS `yourphp_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxmessagenum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_role`
--

LOCK TABLES `yourphp_role` WRITE;
/*!40000 ALTER TABLE `yourphp_role` DISABLE KEYS */;
INSERT INTO `yourphp_role` VALUES (1,'超级管理员',1,'超级管理员',0,0,1,1,1,1,1,1,0,0,'0.00','0.00','0.00'),(2,'普通管理员',1,'普通管理员',0,0,1,1,1,1,1,1,0,0,'0.00','0.00','0.00'),(3,'注册用户',1,'注册用户',0,0,1,0,1,1,1,0,0,0,'0.00','0.00','0.00'),(4,'游客',1,'游客',0,0,1,0,0,1,0,0,0,0,'0.00','0.00','0.00'),(5,'邮件认证',1,'邮件认证',0,0,0,0,0,0,0,0,0,0,'0.00','0.00','0.00');
/*!40000 ALTER TABLE `yourphp_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_role_user`
--

DROP TABLE IF EXISTS `yourphp_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_role_user`
--

LOCK TABLES `yourphp_role_user` WRITE;
/*!40000 ALTER TABLE `yourphp_role_user` DISABLE KEYS */;
INSERT INTO `yourphp_role_user` VALUES (3,2);
/*!40000 ALTER TABLE `yourphp_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_services`
--

DROP TABLE IF EXISTS `yourphp_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_services` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start_name` varchar(50) NOT NULL,
  `end_name` varchar(50) NOT NULL,
  `s_province` int(11) NOT NULL,
  `s_city` int(11) NOT NULL,
  `s_town` int(11) NOT NULL,
  `e_province` int(11) NOT NULL,
  `e_city` int(11) NOT NULL,
  `e_town` int(11) NOT NULL,
  `company_id` smallint(8) unsigned NOT NULL DEFAULT '8',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_services`
--

LOCK TABLES `yourphp_services` WRITE;
/*!40000 ALTER TABLE `yourphp_services` DISABLE KEYS */;
INSERT INTO `yourphp_services` VALUES (1,1,1,'admin','',0,0,0,1,'广东 深圳','北京 北京',6,77,0,2,52,0,88),(2,1,1,'admin','',0,0,0,1,'广东 深圳','天津 天津',6,77,0,27,343,0,88),(3,1,1,'admin','',0,0,0,1,'广东 深圳','河北 石家庄',6,77,0,10,138,0,88),(4,1,1,'admin','',0,0,0,1,'广东 深圳','河北 秦皇岛',6,77,0,10,145,0,88),(5,1,1,'admin','',0,0,0,1,'广东 深圳','河北 张家口',6,77,0,10,148,0,88),(6,1,1,'admin','',0,0,0,1,'广东 深圳','河北 承德',6,77,0,10,141,0,88),(7,1,1,'admin','',0,0,0,1,'广东 深圳','河北 衡水',6,77,0,10,143,0,88),(8,1,1,'admin','',0,0,0,1,'广东 深圳','河北 廊坊',6,77,0,10,144,0,88),(9,1,1,'admin','',0,0,0,1,'广东 深圳','河北 沧州',6,77,0,10,140,0,88),(10,1,1,'admin','',0,0,0,1,'广东 深圳','山西 太原',6,77,0,23,300,0,88),(11,1,1,'admin','',0,0,0,1,'广东 深圳','山西 大同',6,77,0,23,302,0,88),(12,1,1,'admin','',0,0,0,1,'广东 深圳','山西 阳泉',6,77,0,23,309,0,88),(13,1,1,'admin','',0,0,0,1,'广东 深圳','山西 长治',6,77,0,23,301,0,88),(14,1,1,'admin','',0,0,0,1,'广东 深圳','山西 晋城',6,77,0,23,303,0,88),(15,1,1,'admin','',0,0,0,1,'广东 深圳','山西 朔州',6,77,0,23,307,0,88),(16,1,1,'admin','',0,0,0,1,'广东 深圳','山西 晋中',6,77,0,23,304,0,88),(17,1,1,'admin','',0,0,0,1,'广东 深圳','山西 运城',6,77,0,23,310,0,88),(18,1,1,'admin','',0,0,0,1,'广东 深圳','山西 忻州',6,77,0,23,308,0,88),(19,1,1,'admin','',0,0,0,1,'广东 深圳','山西 临汾',6,77,0,23,305,0,88),(20,1,1,'admin','',0,0,0,1,'广东 深圳','山西 吕梁',6,77,0,23,306,0,88),(21,1,1,'admin','',0,0,0,1,'广东 深圳','内蒙古 呼和浩特',6,77,0,19,258,0,88),(22,1,1,'admin','',0,0,0,1,'广东 深圳','内蒙古 包头',6,77,0,19,261,0,88),(23,1,1,'admin','',0,0,0,1,'广东 深圳','内蒙古 乌海',6,77,0,19,266,0,88),(24,1,1,'admin','',0,0,0,1,'广东 深圳','内蒙古 赤峰',6,77,0,19,262,0,88),(25,1,1,'admin','',0,0,0,1,'广东 深圳','内蒙古 通辽',6,77,0,19,265,0,88),(26,1,1,'admin','',0,0,0,1,'广东 深圳','内蒙古 鄂尔多斯',6,77,0,19,263,0,88),(27,1,1,'admin','',0,0,0,1,'广东 深圳','内蒙古 呼伦贝尔',6,77,0,19,264,0,88),(28,1,1,'admin','',0,0,0,1,'广东 深圳','内蒙古 巴彦淖尔盟',6,77,0,19,260,0,88),(29,1,1,'admin','',0,0,0,1,'广东 深圳','内蒙古 乌兰察布市',6,77,0,19,267,0,88),(30,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 沈阳',6,77,0,18,244,0,88),(31,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 大连',6,77,0,18,245,0,88),(32,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 马鞍山',6,77,0,3,46,0,88),(33,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 抚顺',6,77,0,18,250,0,88),(34,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 本溪',6,77,0,18,247,0,88),(35,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 丹东',6,77,0,18,249,0,88),(36,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 锦州',6,77,0,18,253,0,88),(37,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 营口',6,77,0,18,257,0,88),(38,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 阜新',6,77,0,18,251,0,88),(39,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 辽阳',6,77,0,18,254,0,88),(40,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 盘锦',6,77,0,18,255,0,88),(41,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 铁岭',6,77,0,18,256,0,88),(42,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 朝阳',6,77,0,18,248,0,88),(43,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 葫芦岛',6,77,0,18,252,0,88),(44,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 长春',6,77,0,15,211,0,88),(45,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 吉林',6,77,0,15,212,0,88),(46,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 四平',6,77,0,15,216,0,88),(47,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 辽源',6,77,0,15,215,0,88),(48,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 通化',6,77,0,15,218,0,88),(49,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 白山',6,77,0,15,214,0,88),(50,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 松原',6,77,0,15,217,0,88),(51,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 白城',6,77,0,15,213,0,88),(52,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 延边',6,77,0,15,219,0,88),(53,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 哈尔滨',6,77,0,12,167,0,88),(54,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 齐齐哈尔',6,77,0,12,176,0,88),(55,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 鸡西',6,77,0,12,172,0,88),(56,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 鹤岗',6,77,0,12,170,0,88),(57,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 双鸭山',6,77,0,12,177,0,88),(58,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 大庆',6,77,0,12,168,0,88),(59,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 伊春',6,77,0,12,179,0,88),(60,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 佳木斯',6,77,0,12,173,0,88),(61,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 七台河',6,77,0,12,175,0,88),(62,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 牡丹江',6,77,0,12,174,0,88),(63,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 黑河',6,77,0,12,171,0,88),(64,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 绥化',6,77,0,12,178,0,88),(65,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 大兴安岭',6,77,0,12,169,0,88),(66,1,1,'admin','',0,0,0,1,'广东 深圳','上海 上海',6,77,0,25,321,0,88),(67,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 南京',6,77,0,16,220,0,88),(68,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 无锡',6,77,0,16,222,0,88),(69,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 徐州',6,77,0,16,229,0,88),(70,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 常州',6,77,0,16,223,0,88),(71,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 苏州',6,77,0,16,221,0,88),(72,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 南通',6,77,0,16,226,0,88),(73,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 连云港',6,77,0,16,225,0,88),(74,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 淮安',6,77,0,16,224,0,88),(75,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 盐城',6,77,0,16,230,0,88),(76,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 扬州',6,77,0,16,231,0,88),(77,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 镇江',6,77,0,16,232,0,88),(78,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 泰州',6,77,0,16,228,0,88),(79,1,1,'admin','',0,0,0,1,'广东 深圳','江苏 宿迁',6,77,0,16,227,0,88),(80,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 杭州',6,77,0,31,383,0,88),(81,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 宁波',6,77,0,31,388,0,88),(82,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 温州',6,77,0,31,391,0,88),(83,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 嘉兴',6,77,0,31,385,0,88),(84,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 湖州',6,77,0,31,384,0,88),(85,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 绍兴',6,77,0,31,389,0,88),(86,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 舟山',6,77,0,31,392,0,88),(87,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 金华',6,77,0,31,386,0,88),(88,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 台州',6,77,0,31,390,0,88),(89,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 丽水',6,77,0,31,387,0,88),(90,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 合肥',6,77,0,3,3401,0,88),(91,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 芜湖',6,77,0,3,49,0,88),(92,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 蚌埠',6,77,0,3,37,0,88),(93,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 淮北',6,77,0,3,42,0,88),(94,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 铜陵',6,77,0,3,48,0,88),(95,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 安庆',6,77,0,3,36,0,88),(96,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 黄山',6,77,0,3,44,0,88),(97,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 滁州',6,77,0,3,40,0,88),(98,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 阜阳',6,77,0,3,41,0,88),(99,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 宿州',6,77,0,3,47,0,88),(100,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 巢湖',6,77,0,3,38,0,88),(101,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 六安',6,77,0,3,45,0,88),(102,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 池州',6,77,0,3,39,0,88),(103,1,1,'admin','',0,0,0,1,'广东 深圳','安徽 宣城',6,77,0,3,50,0,88),(104,1,1,'admin','',0,0,0,1,'广东 深圳','福建 福州',6,77,0,4,53,0,88),(105,1,1,'admin','',0,0,0,1,'广东 深圳','福建 厦门',6,77,0,4,60,0,88),(106,1,1,'admin','',0,0,0,1,'广东 深圳','福建 莆田',6,77,0,4,57,0,88),(107,1,1,'admin','',0,0,0,1,'广东 深圳','福建 三明',6,77,0,4,59,0,88),(108,1,1,'admin','',0,0,0,1,'广东 深圳','福建 泉州',6,77,0,4,58,0,88),(109,1,1,'admin','',0,0,0,1,'广东 深圳','福建 南平',6,77,0,4,55,0,88),(110,1,1,'admin','',0,0,0,1,'广东 深圳','福建 龙岩',6,77,0,4,54,0,88),(111,1,1,'admin','',0,0,0,1,'广东 深圳','福建 宁德',6,77,0,4,56,0,88),(112,1,1,'admin','',0,0,0,1,'广东 深圳','江西 南昌',6,77,0,17,233,0,88),(113,1,1,'admin','',0,0,0,1,'广东 深圳','江西 景德镇',6,77,0,17,237,0,88),(114,1,1,'admin','',0,0,0,1,'广东 深圳','江西 萍乡',6,77,0,17,239,0,88),(115,1,1,'admin','',0,0,0,1,'广东 深圳','江西 九江',6,77,0,17,238,0,88),(116,1,1,'admin','',0,0,0,1,'广东 深圳','江西 新余',6,77,0,17,241,0,88),(117,1,1,'admin','',0,0,0,1,'广东 深圳','江西 鹰潭',6,77,0,17,243,0,88),(118,1,1,'admin','',0,0,0,1,'广东 深圳','江西 赣州',6,77,0,17,235,0,88),(119,1,1,'admin','',0,0,0,1,'广东 深圳','江西 吉安',6,77,0,17,236,0,88),(120,1,1,'admin','',0,0,0,1,'广东 深圳','江西 宜春',6,77,0,17,242,0,88),(121,1,1,'admin','',0,0,0,1,'广东 深圳','江西 抚州',6,77,0,17,234,0,88),(122,1,1,'admin','',0,0,0,1,'广东 深圳','江西 上饶',6,77,0,17,240,0,88),(123,1,1,'admin','',0,0,0,1,'广东 深圳','山东 济南',6,77,0,22,283,0,88),(124,1,1,'admin','',0,0,0,1,'广东 深圳','山东 青岛',6,77,0,22,284,0,88),(125,1,1,'admin','',0,0,0,1,'广东 深圳','山东 淄博',6,77,0,22,299,0,88),(126,1,1,'admin','',0,0,0,1,'广东 深圳','山东 枣庄',6,77,0,22,298,0,88),(127,1,1,'admin','',0,0,0,1,'广东 深圳','山东 东营',6,77,0,22,287,0,88),(128,1,1,'admin','',0,0,0,1,'广东 深圳','山东 烟台',6,77,0,22,297,0,88),(129,1,1,'admin','',0,0,0,1,'广东 深圳','山东 济宁',6,77,0,22,289,0,88),(130,1,1,'admin','',0,0,0,1,'广东 深圳','山东 泰安',6,77,0,22,294,0,88),(131,1,1,'admin','',0,0,0,1,'广东 深圳','山东 威海',6,77,0,22,295,0,88),(132,1,1,'admin','',0,0,0,1,'广东 深圳','山东 日照',6,77,0,22,293,0,88),(133,1,1,'admin','',0,0,0,1,'广东 深圳','山东 莱芜',6,77,0,22,290,0,88),(134,1,1,'admin','',0,0,0,1,'广东 深圳','山东 临沂',6,77,0,22,292,0,88),(135,1,1,'admin','',0,0,0,1,'广东 深圳','山东 德州',6,77,0,22,286,0,88),(136,1,1,'admin','',0,0,0,1,'广东 深圳','山东 聊城',6,77,0,22,291,0,88),(137,1,1,'admin','',0,0,0,1,'广东 深圳','山东 滨州',6,77,0,22,285,0,88),(138,1,1,'admin','',0,0,0,1,'广东 深圳','山东 菏泽',6,77,0,22,288,0,88),(139,1,1,'admin','',0,0,0,1,'广东 深圳','河南 郑州',6,77,0,11,149,0,88),(140,1,1,'admin','',0,0,0,1,'广东 深圳','河南 开封',6,77,0,11,151,0,88),(141,1,1,'admin','',0,0,0,1,'广东 深圳','河南 洛阳',6,77,0,11,150,0,88),(142,1,1,'admin','',0,0,0,1,'广东 深圳','河南 平顶山',6,77,0,11,157,0,88),(143,1,1,'admin','',0,0,0,1,'广东 深圳','河南 安阳',6,77,0,11,152,0,88),(144,1,1,'admin','',0,0,0,1,'广东 深圳','河南 鹤壁',6,77,0,11,153,0,88),(145,1,1,'admin','',0,0,0,1,'广东 深圳','河南 新乡',6,77,0,11,160,0,88),(146,1,1,'admin','',0,0,0,1,'广东 深圳','河南 焦作',6,77,0,11,155,0,88),(147,1,1,'admin','',0,0,0,1,'广东 深圳','河南 濮阳',6,77,0,11,166,0,88),(148,1,1,'admin','',0,0,0,1,'广东 深圳','河南 许昌',6,77,0,11,162,0,88),(149,1,1,'admin','',0,0,0,1,'广东 深圳','河南 漯河',6,77,0,11,165,0,88),(150,1,1,'admin','',0,0,0,1,'广东 深圳','河南 三门峡',6,77,0,11,158,0,88),(151,1,1,'admin','',0,0,0,1,'广东 深圳','河南 南阳',6,77,0,11,156,0,88),(152,1,1,'admin','',0,0,0,1,'广东 深圳','河南 商丘',6,77,0,11,159,0,88),(153,1,1,'admin','',0,0,0,1,'广东 深圳','河南 信阳',6,77,0,11,161,0,88),(154,1,1,'admin','',0,0,0,1,'广东 深圳','河南 周口',6,77,0,11,163,0,88),(155,1,1,'admin','',0,0,0,1,'广东 深圳','河南 驻马店',6,77,0,11,164,0,88),(156,1,1,'admin','',0,0,0,1,'广东 深圳','河南 济源',6,77,0,11,154,0,88),(157,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 武汉',6,77,0,13,180,0,88),(158,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 黄石',6,77,0,13,184,0,88),(159,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 十堰',6,77,0,13,189,0,88),(160,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 宜昌',6,77,0,13,195,0,88),(161,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 襄樊',6,77,0,13,193,0,88),(162,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 鄂州',6,77,0,13,182,0,88),(163,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 荆门',6,77,0,13,185,0,88),(164,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 孝感',6,77,0,13,194,0,88),(165,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 黄冈',6,77,0,13,183,0,88),(166,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 咸宁',6,77,0,13,192,0,88),(167,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 随州',6,77,0,13,190,0,88),(168,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 恩施',6,77,0,13,196,0,88),(169,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 仙桃',6,77,0,13,181,0,88),(170,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 潜江',6,77,0,13,187,0,88),(171,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 天门',6,77,0,13,191,0,88),(172,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 神农架林区',6,77,0,13,188,0,88),(173,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 长沙',6,77,0,14,197,0,88),(174,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 株洲',6,77,0,14,210,0,88),(175,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 湘潭',6,77,0,14,205,0,88),(176,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 衡阳',6,77,0,14,201,0,88),(177,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 邵阳',6,77,0,14,204,0,88),(178,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 岳阳',6,77,0,14,209,0,88),(179,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 常德',6,77,0,14,199,0,88),(180,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 张家界',6,77,0,14,198,0,88),(181,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 益阳',6,77,0,14,207,0,88),(182,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 郴州',6,77,0,14,200,0,88),(183,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 永州',6,77,0,14,208,0,88),(184,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 怀化',6,77,0,14,202,0,88),(185,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 娄底',6,77,0,14,203,0,88),(186,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 湘西',6,77,0,14,206,0,88),(187,1,1,'admin','',0,0,0,1,'广东 深圳','广西 南宁',6,77,0,7,97,0,88),(188,1,1,'admin','',0,0,0,1,'广东 深圳','广西 柳州',6,77,0,7,107,0,88),(189,1,1,'admin','',0,0,0,1,'广东 深圳','广西 桂林',6,77,0,7,98,0,88),(190,1,1,'admin','',0,0,0,1,'广东 深圳','广西 梧州',6,77,0,7,109,0,88),(191,1,1,'admin','',0,0,0,1,'广东 深圳','广西 北海',6,77,0,7,100,0,88),(192,1,1,'admin','',0,0,0,1,'广东 深圳','广西 防城港',6,77,0,7,102,0,88),(193,1,1,'admin','',0,0,0,1,'广东 深圳','广西 钦州',6,77,0,7,108,0,88),(194,1,1,'admin','',0,0,0,1,'广东 深圳','广西 贵港',6,77,0,7,103,0,88),(195,1,1,'admin','',0,0,0,1,'广东 深圳','广西 玉林',6,77,0,7,110,0,88),(196,1,1,'admin','',0,0,0,1,'广东 深圳','广西 百色',6,77,0,7,99,0,88),(197,1,1,'admin','',0,0,0,1,'广东 深圳','广西 贺州',6,77,0,7,105,0,88),(198,1,1,'admin','',0,0,0,1,'广东 深圳','广西 河池',6,77,0,7,104,0,88),(199,1,1,'admin','',0,0,0,1,'广东 深圳','广西 来宾',6,77,0,7,106,0,88),(200,1,1,'admin','',0,0,0,1,'广东 深圳','广西 崇左',6,77,0,7,101,0,88),(201,1,1,'admin','',0,0,0,1,'广东 深圳','重庆 重庆',6,77,0,32,394,0,88),(202,1,1,'admin','',0,0,0,1,'广东 深圳','四川 成都',6,77,0,26,322,0,88),(203,1,1,'admin','',0,0,0,1,'广东 深圳','四川 自贡',6,77,0,26,341,0,88),(204,1,1,'admin','',0,0,0,1,'广东 深圳','四川 泸州',6,77,0,26,342,0,88),(205,1,1,'admin','',0,0,0,1,'广东 深圳','四川 德阳',6,77,0,26,327,0,88),(206,1,1,'admin','',0,0,0,1,'广东 深圳','四川 绵阳',6,77,0,26,323,0,88),(207,1,1,'admin','',0,0,0,1,'广东 深圳','四川 广元',6,77,0,26,330,0,88),(208,1,1,'admin','',0,0,0,1,'广东 深圳','四川 遂宁',6,77,0,26,337,0,88),(209,1,1,'admin','',0,0,0,1,'广东 深圳','四川 内江',6,77,0,26,335,0,88),(210,1,1,'admin','',0,0,0,1,'广东 深圳','四川 乐山',6,77,0,26,331,0,88),(211,1,1,'admin','',0,0,0,1,'广东 深圳','四川 南充',6,77,0,26,334,0,88),(212,1,1,'admin','',0,0,0,1,'广东 深圳','四川 眉山',6,77,0,26,333,0,88),(213,1,1,'admin','',0,0,0,1,'广东 深圳','四川 宜宾',6,77,0,26,339,0,88),(214,1,1,'admin','',0,0,0,1,'广东 深圳','四川 广安',6,77,0,26,329,0,88),(215,1,1,'admin','',0,0,0,1,'广东 深圳','四川 达州',6,77,0,26,326,0,88),(216,1,1,'admin','',0,0,0,1,'广东 深圳','四川 雅安',6,77,0,26,338,0,88),(217,1,1,'admin','',0,0,0,1,'广东 深圳','四川 巴中',6,77,0,26,325,0,88),(218,1,1,'admin','',0,0,0,1,'广东 深圳','四川 资阳',6,77,0,26,340,0,88),(219,1,1,'admin','',0,0,0,1,'广东 深圳','四川 甘孜',6,77,0,26,328,0,88),(220,1,1,'admin','',0,0,0,1,'广东 深圳','四川 凉山',6,77,0,26,332,0,88),(221,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 贵阳',6,77,0,8,111,0,88),(222,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 六盘水',6,77,0,8,114,0,88),(223,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 遵义',6,77,0,8,119,0,88),(224,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 安顺',6,77,0,8,112,0,88),(225,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 黔西南',6,77,0,8,117,0,88),(226,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 毕节',6,77,0,8,113,0,88),(227,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 黔东南',6,77,0,8,115,0,88),(228,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 黔南',6,77,0,8,116,0,88),(229,1,1,'admin','',0,0,0,1,'广东 深圳','云南 昆明',6,77,0,30,367,0,88),(230,1,1,'admin','',0,0,0,1,'广东 深圳','云南 曲靖',6,77,0,30,378,0,88),(231,1,1,'admin','',0,0,0,1,'广东 深圳','云南 玉溪',6,77,0,30,381,0,88),(232,1,1,'admin','',0,0,0,1,'广东 深圳','云南 保山',6,77,0,30,371,0,88),(233,1,1,'admin','',0,0,0,1,'广东 深圳','云南 昭通',6,77,0,30,382,0,88),(234,1,1,'admin','',0,0,0,1,'广东 深圳','云南 丽江',6,77,0,30,370,0,88),(235,1,1,'admin','',0,0,0,1,'广东 深圳','云南 临沧',6,77,0,30,377,0,88),(236,1,1,'admin','',0,0,0,1,'广东 深圳','云南 楚雄',6,77,0,30,372,0,88),(237,1,1,'admin','',0,0,0,1,'广东 深圳','云南 红河',6,77,0,30,376,0,88),(238,1,1,'admin','',0,0,0,1,'广东 深圳','云南 文山',6,77,0,30,379,0,88),(239,1,1,'admin','',0,0,0,1,'广东 深圳','云南 西双版纳',6,77,0,30,380,0,88),(240,1,1,'admin','',0,0,0,1,'广东 深圳','云南 大理',6,77,0,30,373,0,88),(241,1,1,'admin','',0,0,0,1,'广东 深圳','云南 德宏',6,77,0,30,374,0,88),(242,1,1,'admin','',0,0,0,1,'广东 深圳','云南 怒江',6,77,0,30,368,0,88),(243,1,1,'admin','',0,0,0,1,'广东 深圳','云南 迪庆',6,77,0,30,375,0,88),(244,1,1,'admin','',0,0,0,1,'广东 深圳','西藏 拉萨',6,77,0,28,344,0,88),(245,1,1,'admin','',0,0,0,1,'广东 深圳','西藏 昌都',6,77,0,28,346,0,88),(246,1,1,'admin','',0,0,0,1,'广东 深圳','西藏 山南',6,77,0,28,350,0,88),(247,1,1,'admin','',0,0,0,1,'广东 深圳','西藏 日喀则',6,77,0,28,349,0,88),(248,1,1,'admin','',0,0,0,1,'广东 深圳','西藏 那曲',6,77,0,28,348,0,88),(249,1,1,'admin','',0,0,0,1,'广东 深圳','西藏 阿里',6,77,0,28,345,0,88),(250,1,1,'admin','',0,0,0,1,'广东 深圳','西藏 林芝',6,77,0,28,347,0,88),(251,1,1,'admin','',0,0,0,1,'广东 深圳','陕西 西安',6,77,0,24,311,0,88),(252,1,1,'admin','',0,0,0,1,'广东 深圳','陕西 铜川',6,77,0,24,316,0,88),(253,1,1,'admin','',0,0,0,1,'广东 深圳','陕西 宝鸡',6,77,0,24,313,0,88),(254,1,1,'admin','',0,0,0,1,'广东 深圳','陕西 咸阳',6,77,0,24,318,0,88),(255,1,1,'admin','',0,0,0,1,'广东 深圳','陕西 渭南',6,77,0,24,317,0,88),(256,1,1,'admin','',0,0,0,1,'广东 深圳','陕西 延安',6,77,0,24,319,0,88),(257,1,1,'admin','',0,0,0,1,'广东 深圳','陕西 汉中',6,77,0,24,314,0,88),(258,1,1,'admin','',0,0,0,1,'广东 深圳','陕西 榆林',6,77,0,24,320,0,88),(259,1,1,'admin','',0,0,0,1,'广东 深圳','陕西 安康',6,77,0,24,312,0,88),(260,1,1,'admin','',0,0,0,1,'广东 深圳','陕西 商洛',6,77,0,24,315,0,88),(261,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 兰州',6,77,0,5,62,0,88),(262,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 嘉峪关',6,77,0,5,66,0,88),(263,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 金昌',6,77,0,5,67,0,88),(264,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 白银',6,77,0,5,63,0,88),(265,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 天水',6,77,0,5,73,0,88),(266,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 武威',6,77,0,5,74,0,88),(267,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 张掖',6,77,0,5,75,0,88),(268,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 平凉',6,77,0,5,71,0,88),(269,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 酒泉',6,77,0,5,68,0,88),(270,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 庆阳',6,77,0,5,72,0,88),(271,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 定西',6,77,0,5,64,0,88),(272,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 陇南',6,77,0,5,70,0,88),(273,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 临夏',6,77,0,5,69,0,88),(274,1,1,'admin','',0,0,0,1,'广东 深圳','甘肃 甘南',6,77,0,5,65,0,88),(275,1,1,'admin','',0,0,0,1,'广东 深圳','青海 西宁',6,77,0,21,275,0,88),(276,1,1,'admin','',0,0,0,1,'广东 深圳','青海 海东',6,77,0,21,278,0,88),(277,1,1,'admin','',0,0,0,1,'广东 深圳','青海 海北',6,77,0,21,277,0,88),(278,1,1,'admin','',0,0,0,1,'广东 深圳','青海 黄南',6,77,0,21,281,0,88),(279,1,1,'admin','',0,0,0,1,'广东 深圳','青海 海南',6,77,0,21,279,0,88),(280,1,1,'admin','',0,0,0,1,'广东 深圳','青海 果洛',6,77,0,21,276,0,88),(281,1,1,'admin','',0,0,0,1,'广东 深圳','青海 玉树',6,77,0,21,282,0,88),(282,1,1,'admin','',0,0,0,1,'广东 深圳','青海 海西',6,77,0,21,280,0,88),(283,1,1,'admin','',0,0,0,1,'广东 深圳','宁夏 银川',6,77,0,20,270,0,88),(284,1,1,'admin','',0,0,0,1,'广东 深圳','宁夏 石嘴山',6,77,0,20,272,0,88),(285,1,1,'admin','',0,0,0,1,'广东 深圳','宁夏 吴忠',6,77,0,20,273,0,88),(286,1,1,'admin','',0,0,0,1,'广东 深圳','宁夏 固原',6,77,0,20,271,0,88),(287,1,1,'admin','',0,0,0,1,'广东 深圳','宁夏 中卫',6,77,0,20,274,0,88),(288,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 宜昌',6,77,0,13,195,0,89),(289,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 荆州',6,77,0,13,186,0,89),(290,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 恩施',6,77,0,13,196,0,89),(291,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 荆门',6,77,0,13,185,0,89),(292,1,1,'admin','',0,0,0,1,'广东 深圳','湖北 潜江',6,77,0,13,187,0,89),(293,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 长沙',6,77,0,14,197,0,90),(294,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 湘潭',6,77,0,14,205,0,90),(295,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 株洲',6,77,0,14,210,0,90),(296,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 岳阳',6,77,0,14,209,0,90),(297,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 常德',6,77,0,14,199,0,90),(298,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 益阳',6,77,0,14,207,0,90),(299,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 娄底',6,77,0,14,203,0,90),(300,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 郴州',6,77,0,14,200,0,90),(301,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 衡阳',6,77,0,14,201,0,90),(302,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 永州',6,77,0,14,208,0,90),(303,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 怀化',6,77,0,14,202,0,90),(304,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 邵阳',6,77,0,14,204,0,90),(305,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 宁波',6,77,0,31,388,0,91),(306,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 金华',6,77,0,31,386,0,91),(307,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 绍兴',6,77,0,31,389,0,91),(308,1,1,'admin','',0,0,0,1,'广东 深圳','广西 南宁',6,77,0,7,97,0,92),(309,1,1,'admin','',0,0,0,1,'广东 深圳','广西 北海',6,77,0,7,100,0,92),(310,1,1,'admin','',0,0,0,1,'广东 深圳','广西 柳州',6,77,0,7,107,0,92),(311,1,1,'admin','',0,0,0,1,'广东 深圳','广西 桂林',6,77,0,7,98,0,92),(312,1,1,'admin','',0,0,0,1,'广东 深圳','山东 潍坊',6,77,0,22,296,0,93),(313,1,1,'admin','',0,0,0,1,'广东 深圳','山东 威海',6,77,0,22,295,0,93),(314,1,1,'admin','',0,0,0,1,'广东 深圳','山东 烟台',6,77,0,22,297,0,93),(315,1,1,'admin','',0,0,0,1,'广东 深圳','山东 青岛',6,77,0,22,284,0,93),(316,1,1,'admin','',0,0,0,1,'广东 深圳','山东 淄博',6,77,0,22,299,0,93),(317,1,1,'admin','',0,0,0,1,'广东 深圳','山东 日照',6,77,0,22,293,0,93),(318,1,1,'admin','',0,0,0,1,'广东 深圳','山东 聊城',6,77,0,22,291,0,93),(319,1,1,'admin','',0,0,0,1,'广东 深圳','山东 莱芜',6,77,0,22,290,0,93),(320,1,1,'admin','',0,0,0,1,'广东 深圳','山东 泰安',6,77,0,22,294,0,93),(321,1,1,'admin','',0,0,0,1,'广东 深圳','山东 东营',6,77,0,22,287,0,93),(322,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 大连',6,77,0,18,245,0,93),(323,1,1,'admin','',0,0,0,1,'广东 深圳','香港 香港',6,77,0,33,395,0,94),(324,1,1,'admin','',0,0,0,1,'广东 深圳','广东 汕头',6,77,0,6,88,0,95),(325,1,1,'admin','',0,0,0,1,'广东 深圳','广东 揭阳',6,77,0,6,84,0,95),(326,1,1,'admin','',0,0,0,1,'广东 深圳','广东 中山',6,77,0,6,95,0,96),(327,1,1,'admin','',0,0,0,1,'广东 深圳','广东 珠海',6,77,0,6,96,0,96),(328,1,1,'admin','',0,0,0,1,'广东 深圳','广东 江门',6,77,0,6,83,0,96),(329,1,1,'admin','',0,0,0,1,'广东 深圳','广东 惠州',6,77,0,6,82,0,96),(330,1,1,'admin','',0,0,0,1,'广东 深圳','香港 香港',6,77,0,33,395,0,96),(331,1,1,'admin','',0,0,0,1,'广东 深圳','澳门 澳门',6,77,0,34,396,0,96),(332,1,1,'admin','',0,0,0,1,'广东 深圳','福建 宁德',6,77,0,4,56,0,97),(333,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 温州',6,77,0,31,391,0,97),(334,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 台州',6,77,0,31,390,0,97),(335,1,1,'admin','',0,0,0,1,'广东 深圳','河南 郑州',6,77,0,11,149,0,98),(336,1,1,'admin','',0,0,0,1,'广东 深圳','河南 洛阳',6,77,0,11,150,0,98),(337,1,1,'admin','',0,0,0,1,'广东 深圳','河南 新乡',6,77,0,11,160,0,98),(338,1,1,'admin','',0,0,0,1,'广东 深圳','河南 许昌',6,77,0,11,162,0,98),(339,1,1,'admin','',0,0,0,1,'广东 深圳','河南 漯河',6,77,0,11,165,0,98),(340,1,1,'admin','',0,0,0,1,'广东 深圳','河南 周口',6,77,0,11,163,0,98),(341,1,1,'admin','',0,0,0,1,'广东 深圳','河南 平顶山',6,77,0,11,157,0,98),(342,1,1,'admin','',0,0,0,1,'广东 深圳','河南 驻马店',6,77,0,11,164,0,98),(343,1,1,'admin','',0,0,0,1,'广东 深圳','河南 开封',6,77,0,11,151,0,98),(344,1,1,'admin','',0,0,0,1,'广东 深圳','河南 南阳',6,77,0,11,156,0,98),(345,1,1,'admin','',0,0,0,1,'广东 深圳','河南 信阳',6,77,0,11,161,0,98),(346,1,1,'admin','',0,0,0,1,'广东 深圳','河南 焦作',6,77,0,11,155,0,98),(347,1,1,'admin','',0,0,0,1,'广东 深圳','河南 商丘',6,77,0,11,159,0,98),(348,1,1,'admin','',0,0,0,1,'广东 深圳','河南 郑州',6,77,0,11,149,0,99),(349,1,1,'admin','',0,0,0,1,'广东 深圳','天津 天津',6,77,0,27,343,0,100),(350,1,1,'admin','',0,0,0,1,'广东 深圳','广东 潮州',6,77,0,6,78,0,101),(351,1,1,'admin','',0,0,0,1,'广东 深圳','广东 汕头',6,77,0,6,88,0,101),(352,1,1,'admin','',0,0,0,1,'广东 深圳','广东 汕尾',6,77,0,6,89,0,101),(353,1,1,'admin','',0,0,0,1,'广东 深圳','山东 济南',6,77,0,22,283,0,102),(354,1,1,'admin','',0,0,0,1,'广东 深圳','山东 青岛',6,77,0,22,284,0,102),(355,1,1,'admin','',0,0,0,1,'广东 深圳','山东 烟台',6,77,0,22,297,0,102),(356,1,1,'admin','',0,0,0,1,'广东 深圳','山东 临沂',6,77,0,22,292,0,102),(357,1,1,'admin','',0,0,0,1,'广东 深圳','山东 济宁',6,77,0,22,289,0,102),(358,1,1,'admin','',0,0,0,1,'广东 深圳','山东 泰安',6,77,0,22,294,0,102),(359,1,1,'admin','',0,0,0,1,'广东 深圳','山东 聊城',6,77,0,22,291,0,102),(360,1,1,'admin','',0,0,0,1,'广东 深圳','山东 淄博',6,77,0,22,299,0,102),(361,1,1,'admin','',0,0,0,1,'广东 深圳','山东 潍坊',6,77,0,22,296,0,102),(362,1,1,'admin','',0,0,0,1,'广东 深圳','山东 菏泽',6,77,0,22,288,0,102),(363,1,1,'admin','',0,0,0,1,'广东 深圳','广东 揭阳',6,77,0,6,84,0,103),(364,1,1,'admin','',0,0,0,1,'广东 深圳','河南 郑州',6,77,0,11,149,0,104),(365,1,1,'admin','',0,0,0,1,'广东 深圳','河南 洛阳',6,77,0,11,150,0,104),(366,1,1,'admin','',0,0,0,1,'广东 深圳','河南 开封',6,77,0,11,151,0,104),(367,1,1,'admin','',0,0,0,1,'广东 深圳','河南 商丘',6,77,0,11,159,0,104),(368,1,1,'admin','',0,0,0,1,'广东 深圳','河南 周口',6,77,0,11,163,0,104),(369,1,1,'admin','',0,0,0,1,'广东 深圳','河南 许昌',6,77,0,11,162,0,104),(370,1,1,'admin','',0,0,0,1,'广东 深圳','河南 南阳',6,77,0,11,156,0,104),(371,1,1,'admin','',0,0,0,1,'广东 深圳','河南 信阳',6,77,0,11,161,0,104),(372,1,1,'admin','',0,0,0,1,'广东 深圳','河南 漯河',6,77,0,11,165,0,104),(373,1,1,'admin','',0,0,0,1,'广东 深圳','河南 安阳',6,77,0,11,152,0,104),(374,1,1,'admin','',0,0,0,1,'广东 深圳','河南 新乡',6,77,0,11,160,0,104),(375,1,1,'admin','',0,0,0,1,'广东 深圳','河南 焦作',6,77,0,11,155,0,104),(376,1,1,'admin','',0,0,0,1,'广东 深圳','河南 濮阳',6,77,0,11,166,0,104),(377,1,1,'admin','',0,0,0,1,'广东 深圳','河南 鹤壁',6,77,0,11,153,0,104),(378,1,1,'admin','',0,0,0,1,'广东 深圳','河南 济源',6,77,0,11,154,0,104),(379,1,1,'admin','',0,0,0,1,'广东 深圳','河南 平顶山',6,77,0,11,157,0,104),(380,1,1,'admin','',0,0,0,1,'广东 深圳','河南 驻马店',6,77,0,11,164,0,104),(381,1,1,'admin','',0,0,0,1,'广东 深圳','河南 三门峡',6,77,0,11,158,0,104),(382,1,1,'admin','',0,0,0,1,'广东 深圳','山西 太原',6,77,0,23,300,0,104),(383,1,1,'admin','',0,0,0,1,'广东 深圳','山西 大同',6,77,0,23,302,0,104),(384,1,1,'admin','',0,0,0,1,'广东 深圳','山西 朔州',6,77,0,23,307,0,104),(385,1,1,'admin','',0,0,0,1,'广东 深圳','山西 忻州',6,77,0,23,308,0,104),(386,1,1,'admin','',0,0,0,1,'广东 深圳','山西 晋中',6,77,0,23,304,0,104),(387,1,1,'admin','',0,0,0,1,'广东 深圳','山西 吕梁',6,77,0,23,306,0,104),(388,1,1,'admin','',0,0,0,1,'广东 深圳','山西 临汾',6,77,0,23,305,0,104),(389,1,1,'admin','',0,0,0,1,'广东 深圳','山西 长治',6,77,0,23,301,0,104),(390,1,1,'admin','',0,0,0,1,'广东 深圳','山西 晋城',6,77,0,23,303,0,104),(391,1,1,'admin','',0,0,0,1,'广东 深圳','山西 运城',6,77,0,23,310,0,104),(392,1,1,'admin','',0,0,0,1,'广东 深圳','河北 邯郸',6,77,0,10,142,0,104),(393,1,1,'admin','',0,0,0,1,'广东 深圳','山东 菏泽',6,77,0,22,288,0,104),(394,1,1,'admin','',0,0,0,1,'广东 深圳','四川 成都',6,77,0,26,322,0,105),(395,1,1,'admin','',0,0,0,1,'广东 深圳','重庆 重庆',6,77,0,32,394,0,105),(396,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 温州',6,77,0,31,391,0,106),(397,1,1,'admin','',0,0,0,1,'广东 深圳','浙江 丽水',6,77,0,31,387,0,106),(398,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 贵阳',6,77,0,8,111,0,107),(399,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 遵义',6,77,0,8,119,0,107),(400,1,1,'admin','',0,0,0,1,'广东 深圳','湖南 邵阳',6,77,0,14,204,0,108),(401,1,1,'admin','',0,0,0,1,'广东 深圳','广东 珠海',6,77,0,6,96,0,109),(402,1,1,'admin','',0,0,0,1,'广东 深圳','广东 中山',6,77,0,6,95,0,109),(403,1,1,'admin','',0,0,0,1,'广东 深圳','澳门 澳门',6,77,0,34,396,0,109),(404,1,1,'admin','',0,0,0,1,'广东 深圳','河北 邯郸',6,77,0,10,142,0,110),(405,1,1,'admin','',0,0,0,1,'广东 深圳','河北 邢台',6,77,0,10,147,0,110),(406,1,1,'admin','',0,0,0,1,'广东 深圳','河北 衡水',6,77,0,10,143,0,110),(407,1,1,'admin','',0,0,0,1,'广东 深圳','河北 石家庄',6,77,0,10,138,0,110),(408,1,1,'admin','',0,0,0,1,'广东 深圳','河北 保定',6,77,0,10,139,0,110),(409,1,1,'admin','',0,0,0,1,'广东 深圳','河北 沧州',6,77,0,10,140,0,110),(410,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 沈阳',6,77,0,18,244,0,111),(411,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 长春',6,77,0,15,211,0,111),(412,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 哈尔滨',6,77,0,12,167,0,111),(413,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 大连',6,77,0,18,245,0,111),(414,1,1,'admin','',0,0,0,1,'广东 深圳','广东 汕头',6,77,0,6,88,0,112),(415,1,1,'admin','',0,0,0,1,'广东 深圳','广东 揭阳',6,77,0,6,84,0,112),(416,1,1,'admin','',0,0,0,1,'广东 深圳','福建 厦门',6,77,0,4,60,0,112),(417,1,1,'admin','',0,0,0,1,'广东 深圳','福建 泉州',6,77,0,4,58,0,112),(418,1,1,'admin','',0,0,0,1,'广东 深圳','福建 福州',6,77,0,4,53,0,112),(419,1,1,'admin','',0,0,0,1,'广东 深圳','福建 三明',6,77,0,4,59,0,112),(420,1,1,'admin','',0,0,0,1,'广东 深圳','福建 南平',6,77,0,4,55,0,112),(421,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 贵阳',6,77,0,8,111,0,113),(422,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 遵义',6,77,0,8,119,0,113),(423,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 安顺',6,77,0,8,112,0,113),(424,1,1,'admin','',0,0,0,1,'广东 深圳','贵州 六盘水',6,77,0,8,114,0,113),(425,1,1,'admin','',0,0,0,1,'广东 深圳','北京 北京',6,77,0,2,52,0,114),(426,1,1,'admin','',0,0,0,1,'广东 深圳','天津 天津',6,77,0,27,343,0,114),(427,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 长春',6,77,0,15,211,0,114),(428,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 沈阳',6,77,0,18,244,0,114),(429,1,1,'admin','',0,0,0,1,'广东 深圳','辽宁 大连',6,77,0,18,245,0,114),(430,1,1,'admin','',0,0,0,1,'广东 深圳','吉林 吉林',6,77,0,15,212,0,114),(431,1,1,'admin','',0,0,0,1,'广东 深圳','黑龙江 哈尔滨',6,77,0,12,167,0,114),(432,1,1,'admin','',0,1421210017,1421210017,1,'广东 深圳','湖北 襄樊',6,77,0,13,193,0,89),(433,1,1,'admin','',0,1421210408,1421210408,1,'广东 深圳','北京 北京',6,77,0,2,52,0,88);
/*!40000 ALTER TABLE `yourphp_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_servicesfavo`
--

DROP TABLE IF EXISTS `yourphp_servicesfavo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_servicesfavo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `service_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_servicesfavo`
--

LOCK TABLES `yourphp_servicesfavo` WRITE;
/*!40000 ALTER TABLE `yourphp_servicesfavo` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_servicesfavo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_shipping`
--

DROP TABLE IF EXISTS `yourphp_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_shipping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `first_weight` int(11) unsigned NOT NULL DEFAULT '0',
  `second_weight` int(11) unsigned NOT NULL DEFAULT '0',
  `first_price` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `second_price` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '99',
  `is_insure` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `insure_fee` int(11) unsigned NOT NULL DEFAULT '0',
  `insure_low_price` float(10,2) unsigned NOT NULL DEFAULT '0.00',
  `price_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_shipping`
--

LOCK TABLES `yourphp_shipping` WRITE;
/*!40000 ALTER TABLE `yourphp_shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_slide`
--

DROP TABLE IF EXISTS `yourphp_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `flashfile` varchar(150) NOT NULL DEFAULT '',
  `xmlfile` varchar(150) NOT NULL DEFAULT '',
  `tpl` varchar(30) NOT NULL DEFAULT '',
  `width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `num` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_slide`
--

LOCK TABLES `yourphp_slide` WRITE;
/*!40000 ALTER TABLE `yourphp_slide` DISABLE KEYS */;
INSERT INTO `yourphp_slide` VALUES (1,'首页幻灯片','','','2',920,300,0,1,1);
/*!40000 ALTER TABLE `yourphp_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_slide_data`
--

DROP TABLE IF EXISTS `yourphp_slide_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_slide_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` tinyint(3) unsigned DEFAULT '0',
  `title` varchar(30) NOT NULL DEFAULT '',
  `small` varchar(150) NOT NULL DEFAULT '',
  `pic` varchar(150) NOT NULL DEFAULT '',
  `link` varchar(150) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `data` text,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_slide_data`
--

LOCK TABLES `yourphp_slide_data` WRITE;
/*!40000 ALTER TABLE `yourphp_slide_data` DISABLE KEYS */;
INSERT INTO `yourphp_slide_data` VALUES (1,1,'图片1','','http://www.yourphp.cn/Public/Images/flash1.jpg','http://www.yourphp.cn','','',3,1,1),(2,1,'图片2','','http://www.yourphp.cn/Public/Images/flash2.jpg','http://www.yourphp.cn','','',1,1,1),(3,1,'图片3','','http://www.yourphp.cn/Public/Images/flash3.jpg','http://www.yourphp.cn','','',2,1,1),(4,1,'flash1','','http://www.yourphp.cn/Public/Images/flash_en1.jpg','http://www.yourphp.cn','','',0,1,2),(5,1,'flash2','','http://www.yourphp.cn/Public/Images/flash_en2.jpg','http://www.yourphp.cn','','',0,1,2);
/*!40000 ALTER TABLE `yourphp_slide_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_tags`
--

DROP TABLE IF EXISTS `yourphp_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL DEFAULT '',
  `slug` char(70) NOT NULL DEFAULT '',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_tags`
--

LOCK TABLES `yourphp_tags` WRITE;
/*!40000 ALTER TABLE `yourphp_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_tags_data`
--

DROP TABLE IF EXISTS `yourphp_tags_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_tags_data` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `moduleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`),
  KEY `moduleid` (`moduleid`,`tagid`),
  KEY `tagid` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_tags_data`
--

LOCK TABLES `yourphp_tags_data` WRITE;
/*!40000 ALTER TABLE `yourphp_tags_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_tags_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_type`
--

DROP TABLE IF EXISTS `yourphp_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`typeid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_type`
--

LOCK TABLES `yourphp_type` WRITE;
/*!40000 ALTER TABLE `yourphp_type` DISABLE KEYS */;
INSERT INTO `yourphp_type` VALUES (1,'友情链接',0,'友情链接分类',1,0,1),(3,'合作伙伴',1,'合作伙伴',1,1,1),(2,'默认分类',1,'默认分类',1,0,1),(4,'反馈类别',0,'信息反馈类别',1,0,4),(5,'产品购买',4,'产品购买',1,0,4),(6,'商务合作',4,'商务合作',1,0,4),(7,'其他反馈',4,'其他反馈',1,0,4),(8,'公司列表',0,'',1,0,8),(9,'车辆类型',0,'',1,0,9),(10,'货车',9,'',1,0,9),(11,'自卸车',9,'',1,0,9),(12,'冷藏车',9,'',1,0,9),(13,'保温车',9,'',1,0,9),(14,'油罐车',9,'',1,0,9),(15,'起重车',9,'',1,0,9),(16,'中型罐车',9,'',1,0,9),(17,'铁笼车',9,'',1,0,9),(18,'进口气囊避震车',9,'',1,0,9),(19,'不锈钢大槽罐车',9,'',1,0,9),(20,'车体情况',0,'',1,0,20),(21,'厢式',20,'',1,0,20),(22,'敞篷',20,'',1,0,20),(23,'单桥',20,'',1,0,20),(24,'三桥',20,'',1,0,20),(25,'四桥',20,'',1,0,20),(26,'高栏',20,'',1,0,20),(27,'中栏',20,'',1,0,20),(28,'低栏',20,'',1,0,20),(29,'平板车',20,'',1,0,20),(30,'半挂',20,'',1,0,20),(31,'全挂',20,'',1,0,20),(32,'加长挂',20,'',1,0,20),(33,'后八轮',20,'',1,0,20),(34,'前四后八',20,'',1,0,20),(81,'深圳市万物达物流有限公司',8,'',1,0,8),(80,'深圳市昇宏业物流有限公司',8,'',1,0,8),(79,'深圳市鑫伟达物流',8,'',1,0,8),(78,'深圳市博弈通物流有限公司',8,'',1,0,8),(77,'深圳市长顺通货物运输有限公司',8,'',1,0,8),(76,'深圳市粤发物流有限公司',8,'',1,0,8),(75,'深圳市速能快运',8,'',1,0,8),(74,'深圳市金华航物流',8,'',1,0,8),(73,'深圳市昌胜达物流',8,'',1,0,8),(72,'深圳市诚信货运有限公司',8,'',1,0,8),(71,'深圳市吉运发物流有限公司',8,'',1,0,8),(70,'深圳立凯物流广西专线',8,'',1,0,8),(69,'深圳永强阳光物流',8,'',1,0,8),(68,'深圳深湘物流有限公司',8,'',1,0,8),(82,'深圳市纳百川物流',8,'',1,0,8),(83,'深圳市中易达物流有限公司',8,'',1,0,8),(84,'深圳市鑫金叶物流有限公司',8,'',1,0,8),(85,'zeek国际',8,'',1,0,8),(86,'公司名',8,'',1,0,8),(87,'',8,'',1,0,8),(88,'深圳市好友汇物流有限公司',8,'',1,0,8),(89,'深圳市华安通物流有限公司',8,'',1,0,8),(90,'深圳深湘物流有限公司',8,'',1,0,8),(91,'深圳永强阳光物流',8,'',1,0,8),(92,'深圳立凯物流广西专线',8,'',1,0,8),(93,'深圳市吉运发物流有限公司',8,'',1,0,8),(94,'深圳市诚信货运有限公司',8,'',1,0,8),(95,'深圳市昌胜达物流',8,'',1,0,8),(96,'深圳市金华航物流',8,'',1,0,8),(97,'深圳市速能快运',8,'',1,0,8),(98,'深圳市粤发物流有限公司',8,'',1,0,8),(99,'深圳市长顺通货物运输有限公司',8,'',1,0,8),(100,'深圳市博弈通物流有限公司',8,'',1,0,8),(101,'深圳市鑫伟达物流',8,'',1,0,8),(102,'深圳市昇宏业物流有限公司',8,'',1,0,8),(103,'深圳市万物达物流有限公司',8,'',1,0,8),(104,'深圳市纳百川物流',8,'',1,0,8),(105,'深圳市中易达物流有限公司',8,'',1,0,8),(106,'深圳市鑫金叶物流有限公司',8,'',1,0,8),(107,'深圳市鸿运通人物流有限公司',8,'',1,0,8),(108,'深圳市福鑫湘物流有限公司',8,'',1,0,8),(109,'深圳市君通达物流',8,'',1,0,8),(110,'深圳市捷安峰物流有限公司',8,'',1,0,8),(111,'深圳市天顺通达物流公司',8,'',1,0,8),(112,'深圳市鹏发物流',8,'',1,0,8),(113,'深圳市宏华物流',8,'',1,0,8),(114,'深圳市龙达国际货运代理有限公司',8,'',1,0,8);
/*!40000 ALTER TABLE `yourphp_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_urlrule`
--

DROP TABLE IF EXISTS `yourphp_urlrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showurlrule` varchar(255) NOT NULL DEFAULT '',
  `showexample` varchar(255) NOT NULL DEFAULT '',
  `listurlrule` varchar(255) NOT NULL DEFAULT '',
  `listexample` varchar(255) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_urlrule`
--

LOCK TABLES `yourphp_urlrule` WRITE;
/*!40000 ALTER TABLE `yourphp_urlrule` DISABLE KEYS */;
INSERT INTO `yourphp_urlrule` VALUES (1,0,'{$catdir}/show/{$id}.html|{$catdir}/show/{$id}_{$p}.html','news/show/1.html|news/show/1_1.html','{$catdir}/|{$catdir}/{$p}.html','news/|news/1.html',0),(2,0,'show-{$catid}-{$id}.html|show-{$catid}-{$id}-{$p}.html','show-1-1.html|show-1-1-1.html','list-{$catid}.html|list-{$catid}-{$p}.html','list-1.html|list-1-1.html',0),(3,0,'{$module}/show/{$id}.html|{$module}/show/{$id}-{$p}.html','Article/show/1.html|Article/show/1-1.html','{$module}/list/{$catid}.html|{$module}/list/{$catid}-{$p}.html','Article/list/1.html|Article/list/1-1.html',0),(4,1,'{$parentdir}{$catdir}/show_{$id}.html|{$parentdir}{$catdir}/show_{$id}_{$p}.html','news/show_1.html|news/show_1_1.html','{$parentdir}{$catdir}/|{$parentdir}{$catdir}/{$p}.html','news/|news/1.html',0);
/*!40000 ALTER TABLE `yourphp_urlrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_user`
--

DROP TABLE IF EXISTS `yourphp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `question` varchar(50) NOT NULL DEFAULT '',
  `answer` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(50) NOT NULL DEFAULT '',
  `fax` varchar(50) NOT NULL DEFAULT '',
  `web_url` varchar(100) NOT NULL DEFAULT '',
  `address` varchar(100) NOT NULL DEFAULT '',
  `login_count` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `last_logintime` int(11) unsigned NOT NULL DEFAULT '0',
  `reg_ip` char(15) NOT NULL DEFAULT '',
  `last_ip` char(15) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `avatar` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_user`
--

LOCK TABLES `yourphp_user` WRITE;
/*!40000 ALTER TABLE `yourphp_user` DISABLE KEYS */;
INSERT INTO `yourphp_user` VALUES (1,1,'admin','a630a1536823000865e2ce8d51eefbf2d52b81f0','zeekcen@gmail.com','admin','','',0,'','','','','',69,1405165748,1405165748,1421209467,'127.0.0.1','14.127.205.249',1,'0.00',0,''),(2,3,'chenjianbin','6eb7539669aed1ae616aec5b42ad664ede2726cb','chenjianb2006@126.com','陈剑彬','','',1,'','13570436749','','','',0,1405222055,0,0,'127.0.0.1','',1,'0.00',0,''),(4,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','13570436748','','','',0,1406960033,0,0,'','',0,'0.00',0,''),(5,3,'unknow','54b030c811a61971455364367ac833e287eb7a24','','','','',0,'','13800138000','','','',0,1406978219,0,0,'','',0,'0.00',0,''),(6,3,'unknow','8135aae9bdbf6f5607e30f5a609fbcbb60886210','','','','',0,'','aaaa','','','',0,1406978912,0,0,'','',0,'0.00',0,''),(7,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','13760767404','','','',0,1406980143,0,0,'','',0,'0.00',0,''),(8,3,'unknow','d121c5ee0bc1feee130a201e4ef3c57c46813368','','','','',0,'','13800013800','','','',0,1407035193,0,0,'','',0,'0.00',0,''),(9,3,'unknow','b8e16ea1174032dfc4963eddace3adb1ed932ad3','','','','',0,'','13980899099','','','',0,1407038171,0,0,'','',0,'0.00',0,''),(10,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','13570436747','','','',0,1407122956,0,0,'','',0,'0.00',0,''),(11,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','13888888888','','','',0,1408888460,0,0,'','',0,'0.00',0,''),(12,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','13800000000','','','',0,1408978446,0,0,'','',0,'0.00',0,''),(13,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','15807527455','','','',0,1409581973,0,0,'','',0,'0.00',0,''),(14,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','15807520000','','','',0,1409639405,0,0,'','',0,'0.00',0,''),(15,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','15872312555','','','',0,1409714783,0,0,'','',0,'0.00',0,''),(16,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','15586543545','','','',0,1409715037,0,0,'','',0,'0.00',0,''),(17,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','15811111111','','','',0,1409715423,0,0,'','',0,'0.00',0,''),(18,3,'unknow','54b030c811a61971455364367ac833e287eb7a24','','','','',0,'','13760767403','','','',0,1410695026,0,0,'','',0,'0.00',0,''),(19,3,'unknow','6eb7539669aed1ae616aec5b42ad664ede2726cb','','','','',0,'','13570436711','','','',0,1410881233,0,0,'','',0,'0.00',0,''),(20,3,'unknow','77e29d654ba6863045147e75f9303bbbc31b56cb','','','','',0,'','13622799967','','','',0,1411315813,0,0,'','',0,'0.00',0,''),(21,3,'unknow','70eead4a383cd85302f219447a74bcec7ccf6341','','','','',0,'','18033075168','','','',0,1415116466,0,0,'','',0,'0.00',0,''),(22,3,'unknow','bb159c05f788fad0d592287e5aea6cfbfc6c2524','','','','',0,'','18927461832','','','',0,1415173330,0,0,'','',0,'0.00',0,''),(23,3,'unknow','52d3a8e57c2724acbde8beef7ecd079a99dc72d5','','','','',0,'','13510088227','','','',0,1417770412,0,0,'','',0,'0.00',0,''),(24,3,'unknow','d121c5ee0bc1feee130a201e4ef3c57c46813368','','','','',0,'','15986790835','','','',0,1418280929,0,0,'','',0,'0.00',0,''),(25,3,'unknow','e8cd56debacbf51f4321f867ac829aa81f22fa33','','','','',0,'','18943792966','','','',0,1420118677,0,0,'','',0,'0.00',0,''),(26,3,'unknow','d121c5ee0bc1feee130a201e4ef3c57c46813368','','','','',0,'','15280029979','','','',0,1420349060,0,0,'','',0,'0.00',0,''),(27,3,'unknow','bbad19dc34f25fb55eb3a8a03d305a2fc491c9bd','','','','',0,'','13577040465','','','',0,1420608012,0,0,'','',0,'0.00',0,''),(28,3,'unknow','90f5f07d7232d11cc637981da5c7af1c655e8b43','','','','',0,'','15067080585','','','',0,1422528988,0,0,'','',0,'0.00',0,''),(29,3,'unknow','620c47ae08ad9cac42811f2e6652ef3e2116de27','','','','',0,'','13401583859','','','',0,1426124575,0,0,'','',0,'0.00',0,''),(30,3,'unknow','2e35946e5a4fa253623cf4e6fd3db15889e1893e','','','','',0,'','15810778150','','','',0,1426811597,0,0,'','',0,'0.00',0,''),(31,3,'unknow','3db98b63b9ae73a149074c5bb2b67d0c6eb7f909','','','','',0,'','15855574576','','','',0,1426934654,0,0,'','',0,'0.00',0,''),(32,3,'unknow','9b94179fe13f9135f7f4da504d3b72b79bbeefc5','','','','',0,'','15705151666','','','',0,1427962332,0,0,'','',0,'0.00',0,''),(33,3,'unknow','3fa2570cd9810de77aeee23252e4391fc44ce2e8','','','','',0,'','18818681886','','','',0,1428506704,0,0,'','',0,'0.00',0,''),(34,3,'unknow','ede4957bd0276fa4b384c51dfa673ffd1eb4e8f7','','','','',0,'','18773178979','','','',0,1429949265,0,0,'','',0,'0.00',0,''),(35,3,'unknow','eaf2db71bd0c8d1d3f0dd41e0d50a0eff86f116f','','','','',0,'','15978225858','','','',0,1430330096,0,0,'','',0,'0.00',0,''),(36,3,'unknow','d121c5ee0bc1feee130a201e4ef3c57c46813368','','','','',0,'','18603720546','','','',0,1431156185,0,0,'','',0,'0.00',0,''),(37,3,'unknow','2b522a9fc2e04116f2f52affb93d586ee5fb8df8','','','','',0,'','15629009038','','','',0,1436880024,0,0,'','',0,'0.00',0,''),(38,3,'unknow','234ff8ecfe544963799d61b8c4fc29f546efb7ef','','','','',0,'','18689708299','','','',0,1438370614,0,0,'','',0,'0.00',0,'');
/*!40000 ALTER TABLE `yourphp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_user_address`
--

DROP TABLE IF EXISTS `yourphp_user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_user_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) unsigned NOT NULL DEFAULT '0',
  `province` smallint(5) unsigned NOT NULL DEFAULT '0',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address` varchar(120) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_user_address`
--

LOCK TABLES `yourphp_user_address` WRITE;
/*!40000 ALTER TABLE `yourphp_user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourphp_user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_vercode`
--

DROP TABLE IF EXISTS `yourphp_vercode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_vercode` (
  `phone` varchar(50) NOT NULL,
  `vercode` varchar(50) NOT NULL,
  `ctime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_vercode`
--

LOCK TABLES `yourphp_vercode` WRITE;
/*!40000 ALTER TABLE `yourphp_vercode` DISABLE KEYS */;
INSERT INTO `yourphp_vercode` VALUES ('13570436749','8468','1421059788'),('18690304737','9402','1429260829'),('18773178779','2073','1429949202');
/*!40000 ALTER TABLE `yourphp_vercode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourphp_versions`
--

DROP TABLE IF EXISTS `yourphp_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourphp_versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(255) NOT NULL DEFAULT '',
  `os` varchar(255) NOT NULL DEFAULT '',
  `remark` mediumtext NOT NULL,
  `dl_url` varchar(255) NOT NULL DEFAULT '',
  `app` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourphp_versions`
--

LOCK TABLES `yourphp_versions` WRITE;
/*!40000 ALTER TABLE `yourphp_versions` DISABLE KEYS */;
INSERT INTO `yourphp_versions` VALUES (2,1,1,'admin','/index.php?m=&a=show&id=2',0,1414202993,1416206200,1,'1006','android','','','/Uploads/201411/54699770e1b82.apk');
/*!40000 ALTER TABLE `yourphp_versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-01 20:16:12
