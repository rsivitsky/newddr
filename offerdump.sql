-- MySQL dump 10.13  Distrib 5.7.10, for Win32 (AMD64)
--
-- Host: localhost    Database: offersdb
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_adr` varchar(45) DEFAULT NULL,
  `contact_site` varchar(45) DEFAULT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `contact_id_UNIQUE` (`contact_id`),
  KEY `fk_contact_vendor1_idx` (`vendor_id`),
  CONSTRAINT `fk_contact_vendor1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description`
--

DROP TABLE IF EXISTS `description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `description` (
  `descript_id` int(11) NOT NULL AUTO_INCREMENT,
  `descript_name` varchar(45) DEFAULT NULL,
  `descript_value` varchar(45) DEFAULT NULL,
  `spec_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  PRIMARY KEY (`descript_id`),
  KEY `fk_description_specification1_idx` (`spec_id`),
  KEY `fk_description_part1_idx` (`part_id`),
  CONSTRAINT `fk_description_part1` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_description_specification1` FOREIGN KEY (`spec_id`) REFERENCES `specification` (`spec_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description`
--

LOCK TABLES `description` WRITE;
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
INSERT INTO `description` VALUES (1,'ÐÐ±ÑÐµÐ¼','4',1,1),(3,'Ð§Ð°ÑÑÐ¾ÑÐ°','1600',2,1),(4,'Ð§Ð¸ÑÐ»Ð¾ Ð¼Ð¸ÐºÑÐ¾ÑÑÐµÐ¼','8',3,1),(5,'ÐÑÐ»Ð°Ð¶Ð´ÐµÐ½Ð¸Ðµ','ÐÐµÑ',4,1);
/*!40000 ALTER TABLE `description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactur`
--

DROP TABLE IF EXISTS `manufactur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactur` (
  `manufactur_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufactur_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`manufactur_id`),
  UNIQUE KEY `idmanufactur_id_UNIQUE` (`manufactur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactur`
--

LOCK TABLES `manufactur` WRITE;
/*!40000 ALTER TABLE `manufactur` DISABLE KEYS */;
INSERT INTO `manufactur` VALUES (1,'sony'),(2,'tdk'),(3,'funai');
/*!40000 ALTER TABLE `manufactur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure` (
  `measure_id` int(11) NOT NULL AUTO_INCREMENT,
  `measure_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`measure_id`),
  UNIQUE KEY `id_measure_UNIQUE` (`measure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'Gb'),(2,'Mb'),(3,'MHrz'),(4,'Mbt'),(5,'V'),(6,'pcs');
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `offer_id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_date` datetime DEFAULT NULL,
  `offer_price` float NOT NULL,
  `valuta_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `offer_num` decimal(10,0) NOT NULL,
  `offer_sum` float NOT NULL,
  PRIMARY KEY (`offer_id`,`part_id`,`vendor_id`),
  UNIQUE KEY `id_offer_UNIQUE` (`offer_id`),
  KEY `fk_offer_valuta1_idx` (`valuta_id`),
  KEY `fk_offer_part1_idx` (`part_id`),
  KEY `fk_offer_vendor1_idx` (`vendor_id`),
  CONSTRAINT `fk_offer_part1` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_valuta1` FOREIGN KEY (`valuta_id`) REFERENCES `valuta` (`valuta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_vendor1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (2,'2016-01-21 02:00:00',0,1,1,1,1,4),(3,'2016-01-13 02:00:00',33,1,2,2,2,222),(5,'2016-01-12 00:00:00',0,1,1,1,5,102.5),(6,'2016-01-12 00:00:00',20.3,1,2,1,3,60.9),(7,'2016-01-08 02:00:00',2000,2,2,1,5,10000),(8,'2016-01-29 02:00:00',0,2,1,1,2,4000),(9,'2016-01-12 00:00:00',20.5,1,1,1,5,102.5),(10,'2016-01-12 00:00:00',20.3,1,2,1,3,60.9),(11,'2016-01-12 00:00:00',20.5,1,1,1,5,102.5),(12,'2016-01-12 00:00:00',20.3,1,2,1,3,60.9),(13,'2016-01-12 00:00:00',20.5,1,1,1,5,102.5),(14,'2016-01-12 00:00:00',20.3,1,2,1,3,60.9),(15,'2016-01-12 00:00:00',20.5,1,3,1,10,205),(16,'2016-01-12 00:00:00',20.5,1,1,1,5,102.5),(17,'2016-01-12 00:00:00',20.3,1,2,1,3,60.9),(18,'2016-01-12 00:00:00',20.5,1,3,1,10,205),(19,'2016-01-12 00:00:00',20.5,1,1,1,5,102.5),(20,'2016-01-12 00:00:00',20.3,1,2,1,3,60.9),(21,'2016-01-12 00:00:00',20.5,1,3,1,10,205);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_num` decimal(10,0) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `offer_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`,`offer_id`),
  UNIQUE KEY `booking_id_UNIQUE` (`booking_id`),
  KEY `fk_booking_booking1_idx` (`offer_id`,`part_id`),
  KEY `fk_booking_user1_idx` (`user_id`),
  CONSTRAINT `fk_booking_offer1` FOREIGN KEY (`offer_id`, `part_id`) REFERENCES `offer` (`offer_id`, `part_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (3,1,'2016-02-09 12:46:05',2,1,2);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part` (
  `part_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_name` varchar(45) DEFAULT NULL,
  `manufactur_id` int(11) DEFAULT NULL,
  `photo` blob,
  PRIMARY KEY (`part_id`),
  UNIQUE KEY `id_part_UNIQUE` (`part_id`),
  KEY `fk_part_manufactur1_idx` (`manufactur_id`),
  CONSTRAINT `fk_part_manufactur1` FOREIGN KEY (`manufactur_id`) REFERENCES `manufactur` (`manufactur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='type of computer part (computer accessory)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,'ddr2',1,'ÿ\Øÿ\à\0JFIF\0\0d\0d\0\0ÿ\á\0\äExif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0À\0\0\0\0\0\0\0\È(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ð\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0d\0\0\0\0\0\0d\0\0\0Onliner.by\0\0ÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0&\0ª\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0?\0\r\0\0\0\0\0!1\"AQa2q#B¡ð3±\á	$5CRSb£Á\Ñ\Óÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\05\0\0\0\0\0\0\0!1AQaðq¡±\Ñ\"#2RÁ\á3ñBÿ\Ú\0\0\0?\0\Ë\ë\ZlÊ¡A­\ã¸cfg%ÏNû\á`6\êqI9Xò¹\×\ËDºyAX¹¸>µBBa;ÿ\0º a\êJ\ç¯;´(\0mÁ¹Ãy?v°v\Z\n\0°\ëôýñ\Ê\n\Ð!\Ó%ÏRµs=^4Ì\ÓS:È¸1Ù÷±¿\Ôa +.°Ü³,\ËR@/´_V¢°\ìF\ä_\\(¬`\0L2H\0«µùõº\Î\íHª³S5\ä;jMö\êAþ·\Â¬»\çÓ¨÷<¿¬=\Ó£\Å\îWqô7\Ã@Vb\Þ(M\n6\épO¦\Èw©Q.	o\Ð\ë\Â@{õ\×\Z$OHLö.\ÛùÛ£\ìu¡Vÿ\0b( \ß÷Âsk\ï\n®\Ð\Í\n;lÅ­\Ã\ÞOS\É\Z!nËª\Þ\ß\á\×§I¿SOª¢\0mö:\Ý¦«i\á2¤Ñª}\â ¯\ë\ïÅ¿¹+J/û\ç!¥\Ô\É\ß\0J%\ÅýGõ\ë,\æþpóO:J¢]$fñ!s7\á\ä\"\ÄÙ\Û~øy*\Çt5\æ®v`\0f³¿(C8\'»ýMú\ÛûðÓ\Ø<d\Ï	.Ö¶\Ý\Ú\ÃF\Ì\Ë]\Ä-ÿ\0Jaü\áÌ \ÉxIÊ0¥®[~øLURVhÁ±[ÿ\0Ï¶9E`&dUT\Ù	\áÇ¹ö¿.@T®\ãX¿ùÃRSs\ïQ.NR×»±{ñG\É<²£i\ës¿\Ô\ßJ\ÖUH	\']3º¢&f,,ukç§9!@fù$Î¤qw,\Ü`f´m¹5\Öev\Ô6ú\áFb\à\ÔJXP\í\0 ¶¯g\ã§\Ìz\\Êª ©h\ì\Í\Æ÷¹\èz\ÓK\Ü#Q_*R%« H\ÓM|¢Õñnfù5|N±¯O¹\Íü#\Îø­Qûb·¹\\\Ã\á\ë\Ù\Ýn[PÏ\æñ¢Ê°µµ\çf\Z$uóöÁJ¬b\á\âL\Õ&`e\á\ì\Þ\ï\îÆ¼\á^x\çuUÅYgTô±\Ò\ÓE\ÉI I\Þ\ê$§R;µ\0\'\á	M:~#\Ñp\ê)¤¤- Xl:Û»r\Í\ZE\ÃYµ$3^#¯>©cb A=\0[\Ð\àL¤:Z&\Ô\àô¿©LH\ÝgÙ¾ñd\Í;ò{8©3Vey´Ò±¹o\Õ\rýv|2e¤¾_\æ!Ê ¦ùQ®ûû\Â(ûrfµÃ\æÅ·9\ÝYó÷|8\ËA\Ø!WCL´\ä(\r\Ê\æ]¹M¢¥^UÈ ³3¥¹f,I³¬IúH´\r8m*#ùô0ÿ\0û\Ôò¤\äyº©ø\ÝY±õ0\\ý¢\rø:rI(xD\ßùr©¨/\Âs\ç@KÞ¤ ³}wØ³\Ü\àº\"÷]#N\'\Ç~ø\çÓyqÀ¼\æd9&a\æù52\Ô\ÑWò¦u÷¨7GrÄq\Ö\Ö\ÂeüÒ,emmsº\"D©\É\0%\Ø\Ú\àûq+\àÎº^«¢ªY-1F\ÔÚ¯£e?µ\ØzïºNÊk{F\ZJ%\×öRÀ\Ö=\"jc\Ë*¥\ÔMÕ_!°\Äe)ÔsVD\Ô$\Åsy\ÍeE/SM­Õ¢x\é7#^\â\ÚI lK¦H3RDk0\É(U-H)\Êx¹:¿¥2¹+3:x)¤\\Ú«¾K\èiXh½úú1s\Ù\Êý\Ü#rh©\É.\Ê7#\Ô\ÅÁJ\íU+(\ÕH^ª,ß»øº\ílgQp4}ñ\æI*(qú\ÈòÕ¶Yöðfyµ¾gVºM2·\Ú\ã{ý~\Ø\Ñv2\Ü¢=(QÓ³b\Ü9ókÙ­t;,²V\É$L\ÄbnW\å`Nûjo¹\Å-Ii\ÙP,\Ï\×\Äbq1.MZ\Ñ,ö¸\Zua\Îi\Ö\×ñj®aSO\n1*Y\ØYE¼¯¶\ßÝ9\Ðd¤© \ÓPRH4¨*@.7>e\åNaZs\n´¾Y\"1\rBAVfV]\ïóû\â-bP¡+1R%*O\Ú\0$±ß«\æ&{f\\X\ák*&²,v¾\Ý|°JD%E`Á0iW%JRA/ýu¾ðEmd<OüBy#³Ý´j¿_#ý\Ø}RRD¡ p\Z\é%Ð \0x\ØL5y\ÑÒªK-Tÿ\0l»\êbzS·ô\ÅV\"Te+Va»®Q´\åy­UEX,¬¦Hö!E\ÇÍÊ§THG\\\ã ¼>´¨!]y\Æ{\Ì~<\Ïù\ÅU\ÆTsÈ ¥X?l¢\Ê\0}ï.b³a«Q[0\Ì|Å®l,\"ó\Øo\r\É\\ß¡ãòø³9)ÞU¡¡X¡0:6q\å½\Î5\å\n§BIAPR\ËÊ \r±\Ùùl\ÎF\×\éZ>\'ü\Â+ªM\ê²òa©hF¤D¹Ò .|\âJ³¶¯$\èÜ¬üyK}&§ûXD\ÌBÝtª¹\"Å­»\Þ\ZSv\ä\äl\Ë<p!6\n2ú¯^·î°ªZR2ªD­`6k\Û_ù*«\ã1\Óþ®ªcqôL\ék,\r5\Ô\ë_fv(=¿9\\*ñ¤3l\å5ü°{o\'µû8¶·()iüK?u£]\×+ª;y³ö;z¢¦I,;Î(V{\Î\ÇXÀûVv\Ù\å2{>ñ¯p\æsY]\æ´b\á51jnñ	»:\0\0\0\Î$ýÃM\íe\ésÂ\rKp\Öi,£¿gE\îÏ1$#cö\ÅPH}&Q¬R­¼Z,T\ÙöEO\Õeó\æn¹ä¡»ªHY\n\Ø\Ý\í\ì¦Á¼¼½ð.\Ã2\×\Ò\"&T\ÊUU)ó\0Ý²+üÈY¸.#rI¡\ÒB/°asô÷\Ã\éG\ç\Ü\ï\à¨\\ª\ä©vIv{=µwjÙtpnTAÀ{\âý-µQ\é]ª	lÃ\Ö\ZZÁÁ1¶ªa#°\Óas\äKmlfT>\â\Ûúÿ\0\åj§*Z§Spg\ß\ã²0Z÷ðÂJ)\ÃGµô0³w\"\Þø\Ó\ènc\Õ{Il\ÅCkPU|¡\Ñ\n\Æ&y4l.M½¿±\ÅH\n\Ü6F*+þk\ßgýó;i)3zõ¡\Öv\ï6B.yzú\â\ÚCvI¿ZÆ·\r,Q\ËCM\â,|«g\Ì\ê\n+Erª\Í$M`5\Ûù7¶\"WJH\ÚúyEN8\Ô*T°­I;-\ÎqóT\Óñ3\Ï%,Ïª1\Â]Hþv\éQ\0¤¿?&Ò¤­*;v\ëü\Þ%¥d¦Qµ+!6;û¬þA¼O\ÅR«*®\ão\Úrª¹\è+ãª¥r%¦I\ß\È\Ê\×_n£ø\Å|\í	\à\"°\Ó\ÌSh#¦){aónJhY³-ð\è·Û¯Ë~2vñ\éCõkÿ\0¼rO\Äc\ì\ç«ó\êx®\ß#H\î9u¥Â¨¹+°ô\ëLJ¼\â\Îº\Ö.òN­¨üBÀ\àn¹n\Ø\ç]L7e/\ÏÕ÷\Î\Ø)@Xòó°¹\Æ\Çcu§uCÄQ4Eðÿ\0\æ\æ\ã\Ê\Çqüu¾;±Yµ\áæ¢Y\nAb\Þfû£\Òg\ÓM8y\"w\Ö \Ö\Ä\êf_§õc2f+W¼\áó\Ô7»i´!\áQgò%Dr$e:W_\Í`wöý\'ú\ß\r\é\ÆÝ	A\å\Êû¿¿(,üQS=\Þ9%¼ÊP\Û\Üê±¿O¦K]ó]\áÆªhe:/#¥\Ìå«#JR¥Õ¬\Ú\Ã·[i$³)ûò\Ý\ß>B³¾cfkð¿LÉ\×OM!ÂÝ20½®EÁX\ïo\\/-#®Q^fÌ;\0:n>\ÕcabP6\'lD`©jX?À\Û\å\0¬Jlº¶`ñô\Í\â\ÔµÀµúõ;ýº\àùzE\ÉsRRV6\Ü3üyD\\?\r\ÉK6cRõ+\Ä(w°\Ã\ÂN¦;µ\ì6\ÛBÿ\0(¤Eì¹ü\n\åf¹>\ÍÕ °qmj\Æg\Ç\0V*¢öý\Øzb7f´©&¦a*.Rx=\êLÒ¡\êâþ¶±ß§¾·p\"2e®J³_£¦\ØUgIðå\Ô\æ¢,tz¥]7-\âµ\ì.oõß®\Ì\Ûa\Æ%Ò¢¦b.X9E\Ø{\Ä;\ç\ØFY\ÜH7\ÛÜ|RJÿ\0\ÔKV8¬)·¬\ÐJ^/«£\Ò\ÝuZa\"Mº\ØX_®ÿ\0Ïø\ã-d½ùn\n´+2\Î8\é\Ë\Ö\îH\Õ\ËS\ê r\ïmÀzøN\Ã\n©*6\"3´\ß`\á~O\Õ\å\ÓOj6ù;¶³\Ø\r[[¯\ío¾8IP\Ñ\àÃªe()%n8?¼\"£8«ª©¦§2\Í%\Ëksb¯LqB[\ÇL\Ã\ç,³\Ñò\Ö3\n¸¥-\r¯\Ë-\È;\Ðô\ß\Ó\Û\n%c×p N\Ûu¥¹ÅsÉ³üº½)R¥\éj£\Äö++×£Uº-ûa³VV ³\ÓCfJbD¹a#f¯k\ì\Ý¾)\'.\âA³\'\ã\é>b\â+HürN\ëhf\×\ÔI©K¦\0¤~á¨¶\è\çÌ&\åÿ\01³®á§\êøfJL²¯\ãTµza:Qü@¸rI\0ø­kz\ê\ÅI¥3¥j\0\×} 8\"\éñ\nT\é$©.T½x*IXµ^r«\Ýf]¶³Q¤}±F=\\ \î=~cÐ	L\îV®c\ãf\Èñ\ì¹ÁÀ¨üfs»^\â¢0un5|p\îû®{\ëóV	L\Õ~#^Q\ê®\Ë\Ü#\ë3_STFN£ú¿³\ë\åp»_ARÙ¿Q®ý5I\Ùg\Ò!!­\ÎÀÿ\0®osn\ï\Üýð©\Æk\ÜzÂógW1ñ¯²ÿ\0!1­Vj¡R\ÊD±\\_sú<÷û4c\ï¨õù\î*RÎ»q\Zñvl\á:2³C[\Å(M*VH¼;Hð{aU\Ö/V xü\Ãô\í\Ðkût¸·m`MÈY$¾ax÷\'\\WÌ\Þu 0õùKúG¢¥x°p!²:ë¨»Úá\ë3(¿\Ët©\ÆF^\à\ß¸Z\×\\À§F^5Q\ÐÔrÿ\0R\Õ}\à!¢¡G\Ùÿ\0!\Î2Üº²¶·3¦Zh\ÞO\Ï] ²+£FÀm\æ/µ\â)Zg;8ø\ÆÆ\éú9Ô²g-k%II¹Q\á³f\èOÙ\ê5~º»\ä\ë·ü\Õð\Åbµ¼JMa\É\Ó7§\Ä\n^\Í*´\"\Ö\ç_]C¸ZÀ½\Ób7È8\ãU\ÎÀP\ïñ\Ê,¹s-·fþ¡­of^©I\ç¨Í§\ï%B±¿@nS\Óo \Çw½mÝ­\Â_M\Ð¸;o({4ð²H\rVo\n\È]a1>d\ë°ûa£«\Ín\Üý?D¯\Ä|A«;4ðZTf )\n¿\Ã\Ó\äó°û`\Z®G¬;¸\ér\ímG\Ävg\ásyó;X ü\ä\Ù}üp£­aq\ÜTÿ\0JÑµ\Zn\ÒIÙ»»óC~·=À7·\ÉÓ¯O\\7¾«oq\ë	ÜÁR¯\Är\ÓHù\'g.v:\ës:®I=\ín¾/}V=a\Ç¥Qº\Õ\Ì|CJÎ¼+*óRÅµdsµ\É\ì>\ØUcu»X^\ä¦$º\Õ~#\âK\ÙÇ»¥»9R¾E¾\Ö\ßÁ¾\ãuoX\nð\n5£³ZA\â>\"6~\àUñ§VqQqg\Ë$Â§,¨¨[3wDFÀ\0·±c± X\â\ã¯\\\å+¶¸\ÆO£¡ÀS)h\n)Q¸q³M\Û\ày/\"\Ìh)ª\è)`¢¡%§g1FÀB\Ú7° _\ÛR\æ\r£\Ègvf)h,	$_aòÿ\Ù'),(2,'ddr3',2,'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\á\0\äExif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0À\0\0\0\0\0\0\0\È(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ð\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0H\0\0\0\0\0\0H\0\0\0Onliner.by\0\0ÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0*\0ª\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0K\0\n\0\0\0\0\0!1AQ\"23q#Ra¡\Ñ\Ò	$4BCSTb±\Â&\'6DcFr¢Á\âÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0?\0\0\0\0\0\0\0!1AQa\"Rq\ÑST¡±Áð#2Br\á$CD3bñÿ\Ú\0\0\0?\0\×k?S0\Zü\ÕR²\ÔHJ\Üif-\\`StnRl|¤`:X\\u\Ç?5\ã$R¹\n\í7\",W\Û\r®I\\ñSJSIl\×Ug?-B\Î\éuóøL®\àG¦<­\Üv\'qµfIl´I¥\Ôð\ÉzW=°®\í~^å£P³*<\Ú\í@\ïQþgK\Üt\Åt°\ÙZ(Ø\éIþøÙ\àû½?ú\Ç¶(ô+!\ÓhòWµ5R_P¥f\n´\nº_l,¦z\Ó ¨¹·&\çfÒ\ë\â\Ô61\Ã;z\Üp\ÏN5¹i\Ôw­Æ¥á¿\åTd9«aC+ø^\ãJz\rÊ°¹=I\0`/\ÎJ\ä l­`N³\ê \rMI=sWö\ç~\Ì7\í9>¨v-ý\ß\Âxð\Ò\Ô{s\Ìy`ú©\Îý?i\Éô\êc¿r_ð\Ë\Îul[¥MªErdÄ¶³haQeù{w$¦\àR®\ã}¢\\\Ò\×e\à¡\ê<p\Ï¶v\í\Z6\ãH\"±1¨õöUù-v¨\Ð\íp\Ìp­^¿+¨c(\Ê÷\Zx¯F\ë±À\Ì&\å£\ÉU\æ\r\\\Ô\Í\Çb[ª?.Böqß²\Ädö­|\î~Dd÷bX\Ü	%\î4ó>\n\ágkc±Ù^\ãJ-\Z\Ü\ï\ÖT\'5£R&s¢«VrFö4\Ðtø\Ä\ç~2F\ë6\ÝûM\É\ç\Ø9¿²@ó;\Í\0ùI\Ñ=²\Èþqb\ÛZ?+w\ëð)Õ½PW\Ær½%2»\Ó&%\Å#¢þ÷q}6½\ÃûN\Äh4\n\æw\î	³Z@À÷f÷aX\Þ\è\ï;UtkA^³jZ)\n+XjÈ³_\Ó>»\Ù)\í\Ú6ùM°¨Ê\ãñ? m£³¶\Æ4áEOü\Þ+wi¦òÞ«\ê2\çÆ¼\Ç0Far\ç)D	?«e\äj\Öp\ÒYº¦§@®\åL\Ë,\æx\à17E^ü\0\ëÄz²sTó]üb¨ý9\Ä;WA\Ð\ìÞ¼½U\Íwÿ\0T~\áT\íG¡\Ùýx\ÍS\ÍJÿ\0\ê_4\Z©tXGö\Ç\0£¯QóÁ\ß_©.ÿ\0\ZJþx^Ôº<]ÁÀ.·%xI\ç,\ØE\"­P­Û=eòÊV%ibü.+&\Ùr]öó÷ð´û(x²@ü\":\â \ÇrIZ <G®G_\Ñ¾hqw\í	\è\\\'!n¦¼LrxWZ¥#ð?S¤Â¬\ËJ\Â(¥I\×\áóëðà¸\æT\ê\Ñd?\Zk\éUÍ®Ë±¿wf9ktEc\Ô\åôo\"/­wp²Gx$~^\Å#iJP\æ:Íªô|;JzR`¬¨¸\Î)d¡Ò÷v\à\Õ6(÷\í\ÎP §x£ÿ\0¼¯\n¨a)¦ÿ\0¼¯\n¨\á)9¼¯\n©a;PÜ ij\ïQ± Ãµ\" KW!9Iù°¶«6\ã wWÊ¥pP\Âqa¯0£P\ÃW?R£­m\è\Ðpj¶H5@°(î¡vi²pj\0¡¸\×û$\ì\rAW~­¯93jf\æMþ	£\êH\ÂÚf\0\æ\ÊEûR,F\nf\03rk1\èL\Å%N¤õZDò\é\å|X#3\ÃÀ¿/]v\'\Úe\Ì\èi:<\Î\å¬\ä¶\â«\'Pã¤¬À`¨Û©\á§Jùq.¿D\Ó:v³¾Ö\ÊLª+\Ô\Ð\äÕ¥\ç];\Çs.\ç><,d\Þmû¶·\ä½Ký<\rºhÎ¶|<\×«®\×7°·>\ìs«\ß£zyM\Îó\ë2«³O Ñ ªd¹	p4\n[AYJ¶(õ\ÚM!vx[.\'<\Ðÿ\0¿\ïi\î\æE¸¥\ØZ)\\©RiQZ\rU+¹¥\"³·2^\Å&ô×½Ë«ª.rC\rc §r\Õ~W¸I\é\×<E®su\rF¹\êÔ¹\Ç_w¬Côi\á£x2\Ò\ãþ\ã«A\áÖ§Z	GªdVkÙ¡\Ù\Ô÷%JS|T\ÆJc5µ´¤\í\Þò\Üy\0,:+#{\É\ZwnJm\íÊT6÷Y,®\è.\í:¤Ò<-\ZuSk/òýfCªNª\Ó+Uw¸\rG)¹\Ée+OÀ¾¥%¤ ¬\íO;ß¬°µ\Â7|\r6qPY¹E|Z¡\×ø£$´°\Ó@.4 gS¥g¼¡@È½FUM\ê\Îja\âÜ¥Cbl[º\çW\ÞFÔñFX\Ùfµv½\Ív7e\ál¼È´\ÄpV\â\Íî®¼\Z6V¤\î\\6+®©\ÂNª{M\íë£sAÃ$£À\Ü\É\Ñ\ØuôFi\×Úp\Ù-¤¨¢{7ù°\à*@U\å\Ç\ÑR4\Z\é«Ú¶\ÅU\ÒLÍ©þ\'\"4\èÆf5\Z|#À,6§´ðÊ\ÈQRºj?¢¾l9¢¢ñ^sdo(¬g<\Ò\×<\â\×:J{#:e¤\Î\Úwót¡Wi°(YqrÝ¨\Òk\Ä\"<¸IJ\ÊF\Û,8\Ü$ª$÷\â³\Ê÷\Æ\àt7y¦tK\æ\í³YmvgºIp½«\ÄI©\Ï\"\Òs;±.MÕ¼O¡W%\Z\Z\Â\"\Ñ\àÉó\ä-\çÆ\êuHJnlIÂH\0q\Â\0\Z+$\ë>	\Õ{\É4L\ç÷HIyi,cCFMü5\'Nd©J\×L¸Yqtô&¢òõ\ê\Ý&`4ª\È`,¨\'o<\îX\Í\Ç6\0©\Ö@\0*b^\ÖZ\Û÷v£#\Þ\ç(3u\0µ\Ðt+,ç¨Gó<Å\"e¤¨A\áC2T ¥CPH&\ÖJ·\Í\Ý\Ò\ÈX_\ØÃþ¾K>\Çd´(e¦9\Ì\Ûk&m*w\rÉ´e\Ò\ÖÚ¤Ò\ê\Ú2¤\Ô=ÃSC®<¢²W\Â% £h\ånC	²@\0s­\ÓðJ[²ú&I\\ð\ryÇ°Üª= tÔK®\Z[µs3eh4gò\ß\ÆbµEq\Ë\ä\ÊzIm\r7m¬	\'\Úat¥¢&\nm\ÏÆûø²]PNmó¸K¤±øª)ù[^5\Ï^KÖt8&]Ë&]+/\Å<} ¸­÷¹uj!?Âµ±s¦´\ëòö.\Ú\å}¦h]kµ.\â\rî¶hñ¦gy\\E&}.e\Ê\Ë\ÍI\âe[j\ÙG|P¢]I\Ü|\îx±`mdq\Ýó\\/¥¥ö¿\à\Ó\æ¿D\èù£ÁT\Ò }\"a.`=£oS~\ëú5xM\\¾@ð\Ð\á\àÿ\0­¡&·\î÷À5ø\ás\àö\îUí³­ùß¦3/ýÇ\Ðù.á£¼\×u~KJü³Ø9ªý¸\æW\Ñ`©l\Õ_C\Ëz<Y\0qY\â¥\í¦\ãrA±·^}0ª\à0\n7G\Ü\Ù^\ÐKt3\ÓC«z?ª¦f\Ò3\n *I\à·\"\Ò\ÙxüP¤»ÕZ&Ú³¦\ì¶D\Ó;ö8\ÐW	\Ûth\î¢\Õ\ëTX{1Ì¨-À&¶\äÕºTw%£\Ðó\0ö\à9\ÓWC\ïF\Ïf»D,\ìf(ÎÕ¤øh${QÑ+E1)«\Í	¥«|\ÇQñUw·\Ï\Èù°\ÞvL»G-\æ\ï²!17\ï?Cµú¶ûU\\©\î\Ì}\Ç\ßqO<\ê\Ê\Üqjº¢nI=¤\'2¯\Æ\Æ\Æ\Ð\Æ\nIv\ç	<§\0Á¢¥\âóù0Td¯)\í¸)ºPW&Ý¸TMQo{\á\ÔIDzU\Ç\"oDc\ïO;a\ÔF¡-2**R\Ã+\'1e\r\á$ýXsZI¢­<ü\Óqa.\ÜO\Éupt\ê&Ê¨yZ;l\ìT>d³ÿ\0¼Yùö¬	oy,»\Ø\Ññr\è`P4k+\Ùú\Ön¬f÷\ÏÄ¨ó¥\â\ë¦öõ[ano¾\æVD¶\ëú\ÓÙ³Y\Ú÷kU\Âü.¥\åD¦\ä\\­K\Ëew»Oqu\ÎYAõñÔ)é¬EÙ´IY¢\Ø]5\ç;¤\È7ô\Ü7.Uh\ÔlÁ\ÍùA>^«-M»MYº\éÀº\ãôw ö¦\ãôq^V4r=V\Ãõ¡tMª\Ò\Ò\ë\r¸\ÖVhv§·@w§\rG\Åg\Ôü½;g¦\Ì4\èj³1^·eZV7X\\Ï.X{8\Ýà¸^¿Fõ_£\Ï\\I¦ÄÞ¦\É[qC)R[	\çòcgñük\ã<\ã¡:#\åü\Ð\å\0Ô\ÍJx\Ó[iÿ\0}I±t ¤ÁP\ë\È\Øò\Æ}¤Fø¾õ\ØF®\ä½%º-f\Ñg=\ÄC]{)à©uMiHkNj#\Î.0»P:\ç8^\î\\\Ú\Ë@eW]\\i\ì\É/\â¬:§U\äb¹cõ\áRÁ\éÂ®÷Ë¢7^kMõTpt\ÚX\áy-\Ú\Z\Ïùyù?6l\'ü\\-­\r\ÂÀ£N^=\Íé¾­´Nf6¢£¶*rz\åuùpA\×:s9ix0\ËtÐüv¥÷»\Õ\ãkiô\á~ö÷°\Ê\Ýþë®×§ª·ó^÷·\Õ\Õ\0&ÿ\0¢¯¿â»½?\×z\ízú£x4N5tAo\Þ\Ñÿ\0\Ï\î:\'ú\à\å½\ë\ê­\â|\ÓÓ¦Ú¾¢mer=­q\í\á\ß\Ðzo®	×ª·óON\ëºd{PGõ\áÔ°ú_®	v¼½Y¼OEi°ª\ß\Ø):ûÂ¥\ÒýpK®·«7ó@Vk\"H\ÈOüIúðiaô¿\\\ë­\ç\ê\Ì\â|Õ#©þ÷\rf\Ïr (»]^^BPUr<Ý·>u\î;±g£Y\Ã9\Ü}ª½\Û\Ëù¾\Êø5FtX×¶\Ù\ëX\\õb\è½/\×!\å¥\ç\ê\í\â|\Ð¢\Ú\Æ\ã\ÈJA R	\î\å¿\n¶!ý\ßwð\\\ï#þ;x4\èfµÿ\0wz\Û\ÏO\ßÀ\Çaô¾\ï\á\Ë\Èÿ\0\Þ\'\Í3\Þ3ZÓ©=m\éQ÷ðy\Ë¥÷	n¼}]¼Og¼V´_Ndó6ô¨ûø\\\å\Òû¿:\Ûxú»x4\ßx½g\å}8/Ë\È×d°ú_wð[/Wo\æ¦C\Ñ\íhø«\ÓÚ#jiM¥*Z/°¨\Ër­\Û\Ì\àó\Ö:PM\îþo*m\Ãä²´ZQ\Ä];rS²&§j¶v¤\äYNl\æ\äN*¯ \ì\Ø\ÊR\æ\Çô\Ñ\È&\æ÷\è4\ìn\Ô\Â\ìK¿oU\ê\ÛDm`mH¦g:\r5Q\ß\Ë5, ó)\ì\Ç3©j0->Ú\Äl\ìUù¤\Ø\â\évkmû¥õSõ,S\åIzL\nr\êH\×\n\ÚO$rò@\Æeá\à\îøbË\â~K\ë8q\Ú\âz4{#N\ì]%N\Õ`#µdü\Z=»\Äv¦\Í\è\ì6ÝµQ\Ú#Ñ£\Ù±¶¦\Ì\Û\Ñ#\Ùaü#8Ýµ0\Åd\Û\à[öF\Zbº8\"$~Ò¡½\n9<\Øhù_ac\î	\Ü\ãû\Å50£\ß\Ð5\ìN\"º8&´©%ö\r{l\î	{¶§1¿\'k\Ø<\Û;¡7¶¯ùv½Í³º\Æí«§M\ïf\Ú=Í°U l¹»<þg\Êë\Ðl4¦µSÒª¨Maù+F>\Ìf\Ù\Ý\nù{¶£3L\Ê#\ì\ÇÙbpC~Ò§&ÿ\0c\è\ÇÙ!º8!\Î?iN¸WüÑ¢OÙ\Ì\Å\Ý\ç´¢¢§ó8ÿ\0D³6»£iý\â\î<kÁ\è§\ìÄ\Ä]ÁÀ&ó¯\ï(¨¢SE\àEúýB»C¼x¬]²½È¡M÷\"F$x²8_`;Uk¦\ã»(\ØÀ\ì \r\n¡\ÎqQ\è:G\\¡Ó¬¥FliLN\ÑüÒ :j¿ÿ\Ù'),(3,'new memory',NULL,'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\á\0\äExif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0À\0\0\0\0\0\0\0\È(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ð\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0H\0\0\0\0\0\0H\0\0\0Onliner.by\0\0ÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0*\0ª\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0K\0\n\0\0\0\0\0!1AQ\"23q#Ra¡\Ñ\Ò	$4BCSTb±\Â&\'6DcFr¢Á\âÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0?\0\0\0\0\0\0\0!1AQa\"Rq\ÑST¡±Áð#2Br\á$CD3bñÿ\Ú\0\0\0?\0\×k?S0\Zü\ÕR²\ÔHJ\Üif-\\`StnRl|¤`:X\\u\Ç?5\ã$R¹\n\í7\",W\Û\r®I\\ñSJSIl\×Ug?-B\Î\éuóøL®\àG¦<­\Üv\'qµfIl´I¥\Ôð\ÉzW=°®\í~^å£P³*<\Ú\í@\ïQþgK\Üt\Åt°\ÙZ(Ø\éIþøÙ\àû½?ú\Ç¶(ô+!\ÓhòWµ5R_P¥f\n´\nº_l,¦z\Ó ¨¹·&\çfÒ\ë\â\Ô61\Ã;z\Üp\ÏN5¹i\Ôw­Æ¥á¿\åTd9«aC+ø^\ãJz\rÊ°¹=I\0`/\ÎJ\ä l­`N³\ê \rMI=sWö\ç~\Ì7\í9>¨v-ý\ß\Âxð\Ò\Ô{s\Ìy`ú©\Îý?i\Éô\êc¿r_ð\Ë\Îul[¥MªErdÄ¶³haQeù{w$¦\àR®\ã}¢\\\Ò\×e\à¡\ê<p\Ï¶v\í\Z6\ãH\"±1¨õöUù-v¨\Ð\íp\Ìp­^¿+¨c(\Ê÷\Zx¯F\ë±À\Ì&\å£\ÉU\æ\r\\\Ô\Í\Çb[ª?.Böqß²\Ädö­|\î~Dd÷bX\Ü	%\î4ó>\n\ágkc±Ù^\ãJ-\Z\Ü\ï\ÖT\'5£R&s¢«VrFö4\Ðtø\Ä\ç~2F\ë6\ÝûM\É\ç\Ø9¿²@ó;\Í\0ùI\Ñ=²\Èþqb\ÛZ?+w\ëð)Õ½PW\Ær½%2»\Ó&%\Å#¢þ÷q}6½\ÃûN\Äh4\n\æw\î	³Z@À÷f÷aX\Þ\è\ï;UtkA^³jZ)\n+XjÈ³_\Ó>»\Ù)\í\Ú6ùM°¨Ê\ãñ? m£³¶\Æ4áEOü\Þ+wi¦òÞ«\ê2\çÆ¼\Ç0Far\ç)D	?«e\äj\Öp\ÒYº¦§@®\åL\Ë,\æx\à17E^ü\0\ëÄz²sTó]üb¨ý9\Ä;WA\Ð\ìÞ¼½U\Íwÿ\0T~\áT\íG¡\Ùýx\ÍS\ÍJÿ\0\ê_4\Z©tXGö\Ç\0£¯QóÁ\ß_©.ÿ\0\ZJþx^Ôº<]ÁÀ.·%xI\ç,\ØE\"­P­Û=eòÊV%ibü.+&\Ùr]öó÷ð´û(x²@ü\":\â \ÇrIZ <G®G_\Ñ¾hqw\í	\è\\\'!n¦¼LrxWZ¥#ð?S¤Â¬\ËJ\Â(¥I\×\áóëðà¸\æT\ê\Ñd?\Zk\éUÍ®Ë±¿wf9ktEc\Ô\åôo\"/­wp²Gx$~^\Å#iJP\æ:Íªô|;JzR`¬¨¸\Î)d¡Ò÷v\à\Õ6(÷\í\ÎP §x£ÿ\0¼¯\n¨a)¦ÿ\0¼¯\n¨\á)9¼¯\n©a;PÜ ij\ïQ± Ãµ\" KW!9Iù°¶«6\ã wWÊ¥pP\Âqa¯0£P\ÃW?R£­m\è\Ðpj¶H5@°(î¡vi²pj\0¡¸\×û$\ì\rAW~­¯93jf\æMþ	£\êH\ÂÚf\0\æ\ÊEûR,F\nf\03rk1\èL\Å%N¤õZDò\é\å|X#3\ÃÀ¿/]v\'\Úe\Ì\èi:<\Î\å¬\ä¶\â«\'Pã¤¬À`¨Û©\á§Jùq.¿D\Ó:v³¾Ö\ÊLª+\Ô\Ð\äÕ¥\ç];\Çs.\ç><,d\Þmû¶·\ä½Ký<\rºhÎ¶|<\×«®\×7°·>\ìs«\ß£zyM\Îó\ë2«³O Ñ ªd¹	p4\n[AYJ¶(õ\ÚM!vx[.\'<\Ðÿ\0¿\ïi\î\æE¸¥\ØZ)\\©RiQZ\rU+¹¥\"³·2^\Å&ô×½Ë«ª.rC\rc §r\Õ~W¸I\é\×<E®su\rF¹\êÔ¹\Ç_w¬Côi\á£x2\Ò\ãþ\ã«A\áÖ§Z	GªdVkÙ¡\Ù\Ô÷%JS|T\ÆJc5µ´¤\í\Þò\Üy\0,:+#{\É\ZwnJm\íÊT6÷Y,®\è.\í:¤Ò<-\ZuSk/òýfCªNª\Ó+Uw¸\rG)¹\Ée+OÀ¾¥%¤ ¬\íO;ß¬°µ\Â7|\r6qPY¹E|Z¡\×ø£$´°\Ó@.4 gS¥g¼¡@È½FUM\ê\Îja\âÜ¥Cbl[º\çW\ÞFÔñFX\Ùfµv½\Ív7e\ál¼È´\ÄpV\â\Íî®¼\Z6V¤\î\\6+®©\ÂNª{M\íë£sAÃ$£À\Ü\É\Ñ\ØuôFi\×Úp\Ù-¤¨¢{7ù°\à*@U\å\Ç\ÑR4\Z\é«Ú¶\ÅU\ÒLÍ©þ\'\"4\èÆf5\Z|#À,6§´ðÊ\ÈQRºj?¢¾l9¢¢ñ^sdo(¬g<\Ò\×<\â\×:J{#:e¤\Î\Úwót¡Wi°(YqrÝ¨\Òk\Ä\"<¸IJ\ÊF\Û,8\Ü$ª$÷\â³\Ê÷\Æ\àt7y¦tK\æ\í³YmvgºIp½«\ÄI©\Ï\"\Òs;±.MÕ¼O¡W%\Z\Z\Â\"\Ñ\àÉó\ä-\çÆ\êuHJnlIÂH\0q\Â\0\Z+$\ë>	\Õ{\É4L\ç÷HIyi,cCFMü5\'Nd©J\×L¸Yqtô&¢òõ\ê\Ý&`4ª\È`,¨\'o<\îX\Í\Ç6\0©\Ö@\0*b^\ÖZ\Û÷v£#\Þ\ç(3u\0µ\Ðt+,ç¨Gó<Å\"e¤¨A\áC2T ¥CPH&\ÖJ·\Í\Ý\Ò\ÈX_\ØÃþ¾K>\Çd´(e¦9\Ì\Ûk&m*w\rÉ´e\Ò\ÖÚ¤Ò\ê\Ú2¤\Ô=ÃSC®<¢²W\Â% £h\ånC	²@\0s­\ÓðJ[²ú&I\\ð\ryÇ°Üª= tÔK®\Z[µs3eh4gò\ß\ÆbµEq\Ë\ä\ÊzIm\r7m¬	\'\Úat¥¢&\nm\ÏÆûø²]PNmó¸K¤±øª)ù[^5\Ï^KÖt8&]Ë&]+/\Å<} ¸­÷¹uj!?Âµ±s¦´\ëòö.\Ú\å}¦h]kµ.\â\rî¶hñ¦gy\\E&}.e\Ê\Ë\ÍI\âe[j\ÙG|P¢]I\Ü|\îx±`mdq\Ýó\\/¥¥ö¿\à\Ó\æ¿D\èù£ÁT\Ò }\"a.`=£oS~\ëú5xM\\¾@ð\Ð\á\àÿ\0­¡&·\î÷À5ø\ás\àö\îUí³­ùß¦3/ýÇ\Ðù.á£¼\×u~KJü³Ø9ªý¸\æW\Ñ`©l\Õ_C\Ëz<Y\0qY\â¥\í¦\ãrA±·^}0ª\à0\n7G\Ü\Ù^\ÐKt3\ÓC«z?ª¦f\Ò3\n *I\à·\"\Ò\ÙxüP¤»ÕZ&Ú³¦\ì¶D\Ó;ö8\ÐW	\Ûth\î¢\Õ\ëTX{1Ì¨-À&¶\äÕºTw%£\Ðó\0ö\à9\ÓWC\ïF\Ïf»D,\ìf(ÎÕ¤øh${QÑ+E1)«\Í	¥«|\ÇQñUw·\Ï\Èù°\ÞvL»G-\æ\ï²!17\ï?Cµú¶ûU\\©\î\Ì}\Ç\ßqO<\ê\Ê\Üqjº¢nI=¤\'2¯\Æ\Æ\Æ\Ð\Æ\nIv\ç	<§\0Á¢¥\âóù0Td¯)\í¸)ºPW&Ý¸TMQo{\á\ÔIDzU\Ç\"oDc\ïO;a\ÔF¡-2**R\Ã+\'1e\r\á$ýXsZI¢­<ü\Óqa.\ÜO\Éupt\ê&Ê¨yZ;l\ìT>d³ÿ\0¼Yùö¬	oy,»\Ø\Ññr\è`P4k+\Ùú\Ön¬f÷\ÏÄ¨ó¥\â\ë¦öõ[ano¾\æVD¶\ëú\ÓÙ³Y\Ú÷kU\Âü.¥\åD¦\ä\\­K\Ëew»Oqu\ÎYAõñÔ)é¬EÙ´IY¢\Ø]5\ç;¤\È7ô\Ü7.Uh\ÔlÁ\ÍùA>^«-M»MYº\éÀº\ãôw ö¦\ãôq^V4r=V\Ãõ¡tMª\Ò\Ò\ë\r¸\ÖVhv§·@w§\rG\Åg\Ôü½;g¦\Ì4\èj³1^·eZV7X\\Ï.X{8\Ýà¸^¿Fõ_£\Ï\\I¦ÄÞ¦\É[qC)R[	\çòcgñük\ã<\ã¡:#\åü\Ð\å\0Ô\ÍJx\Ó[iÿ\0}I±t ¤ÁP\ë\È\Øò\Æ}¤Fø¾õ\ØF®\ä½%º-f\Ñg=\ÄC]{)à©uMiHkNj#\Î.0»P:\ç8^\î\\\Ú\Ë@eW]\\i\ì\É/\â¬:§U\äb¹cõ\áRÁ\éÂ®÷Ë¢7^kMõTpt\ÚX\áy-\Ú\Z\Ïùyù?6l\'ü\\-­\r\ÂÀ£N^=\Íé¾­´Nf6¢£¶*rz\åuùpA\×:s9ix0\ËtÐüv¥÷»\Õ\ãkiô\á~ö÷°\Ê\Ýþë®×§ª·ó^÷·\Õ\Õ\0&ÿ\0¢¯¿â»½?\×z\ízú£x4N5tAo\Þ\Ñÿ\0\Ï\î:\'ú\à\å½\ë\ê­\â|\ÓÓ¦Ú¾¢mer=­q\í\á\ß\Ðzo®	×ª·óON\ëºd{PGõ\áÔ°ú_®	v¼½Y¼OEi°ª\ß\Ø):ûÂ¥\ÒýpK®·«7ó@Vk\"H\ÈOüIúðiaô¿\\\ë­\ç\ê\Ì\â|Õ#©þ÷\rf\Ïr (»]^^BPUr<Ý·>u\î;±g£Y\Ã9\Ü}ª½\Û\Ëù¾\Êø5FtX×¶\Ù\ëX\\õb\è½/\×!\å¥\ç\ê\í\â|\Ð¢\Ú\Æ\ã\ÈJA R	\î\å¿\n¶!ý\ßwð\\\ï#þ;x4\èfµÿ\0wz\Û\ÏO\ßÀ\Çaô¾\ï\á\Ë\Èÿ\0\Þ\'\Í3\Þ3ZÓ©=m\éQ÷ðy\Ë¥÷	n¼}]¼Og¼V´_Ndó6ô¨ûø\\\å\Òû¿:\Ûxú»x4\ßx½g\å}8/Ë\È×d°ú_wð[/Wo\æ¦C\Ñ\íhø«\ÓÚ#jiM¥*Z/°¨\Ër­\Û\Ì\àó\Ö:PM\îþo*m\Ãä²´ZQ\Ä];rS²&§j¶v¤\äYNl\æ\äN*¯ \ì\Ø\ÊR\æ\Çô\Ñ\È&\æ÷\è4\ìn\Ô\Â\ìK¿oU\ê\ÛDm`mH¦g:\r5Q\ß\Ë5, ó)\ì\Ç3©j0->Ú\Äl\ìUù¤\Ø\â\évkmû¥õSõ,S\åIzL\nr\êH\×\n\ÚO$rò@\Æeá\à\îøbË\â~K\ë8q\Ú\âz4{#N\ì]%N\Õ`#µdü\Z=»\Äv¦\Í\è\ì6ÝµQ\Ú#Ñ£\Ù±¶¦\Ì\Û\Ñ#\Ùaü#8Ýµ0\Åd\Û\à[öF\Zbº8\"$~Ò¡½\n9<\Øhù_ac\î	\Ü\ãû\Å50£\ß\Ð5\ìN\"º8&´©%ö\r{l\î	{¶§1¿\'k\Ø<\Û;¡7¶¯ùv½Í³º\Æí«§M\ïf\Ú=Í°U l¹»<þg\Êë\Ðl4¦µSÒª¨Maù+F>\Ìf\Ù\Ý\nù{¶£3L\Ê#\ì\ÇÙbpC~Ò§&ÿ\0c\è\ÇÙ!º8!\Î?iN¸WüÑ¢OÙ\Ì\Å\Ý\ç´¢¢§ó8ÿ\0D³6»£iý\â\î<kÁ\è§\ìÄ\Ä]ÁÀ&ó¯\ï(¨¢SE\àEúýB»C¼x¬]²½È¡M÷\"F$x²8_`;Uk¦\ã»(\ØÀ\ì \r\n¡\ÎqQ\è:G\\¡Ó¬¥FliLN\ÑüÒ :j¿ÿ\Ù');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone` (
  `phone_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`phone_id`),
  UNIQUE KEY `phone_id_UNIQUE` (`phone_id`),
  KEY `fk_phone_contact1_idx` (`contact_id`),
  CONSTRAINT `fk_phone_contact1` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id_UNIQUE` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER'),(3,'ROLE_VENDOR');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specification`
--

DROP TABLE IF EXISTS `specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specification` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(45) DEFAULT NULL,
  `tspec_id` int(11) NOT NULL,
  `measure_id` int(11) NOT NULL,
  PRIMARY KEY (`spec_id`),
  KEY `fk_specification_typeofspec1_idx` (`tspec_id`),
  KEY `fk_specification_measure1_idx` (`measure_id`),
  CONSTRAINT `fk_specification_measure1` FOREIGN KEY (`measure_id`) REFERENCES `measure` (`measure_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_specification_typeofspec1` FOREIGN KEY (`tspec_id`) REFERENCES `typeofspec` (`tspec_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specification`
--

LOCK TABLES `specification` WRITE;
/*!40000 ALTER TABLE `specification` DISABLE KEYS */;
INSERT INTO `specification` VALUES (1,'ÐÐ±ÑÐµÐ¼',1,2),(2,'Ð§Ð°ÑÑÐ¾ÑÐ°',1,3),(3,'Ð§Ð¸ÑÐ»Ð¾ Ð¼Ð¸ÐºÑÐ¾ÑÑÐµÐ¼',2,6),(4,'ÐÑÐ»Ð°Ð¶Ð´ÐµÐ½Ð¸Ðµ',3,6);
/*!40000 ALTER TABLE `specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeofspec`
--

DROP TABLE IF EXISTS `typeofspec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeofspec` (
  `tspec_id` int(11) NOT NULL AUTO_INCREMENT,
  `tspec_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tspec_id`),
  UNIQUE KEY `id_typeofspec_UNIQUE` (`tspec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='type of specification';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeofspec`
--

LOCK TABLES `typeofspec` WRITE;
/*!40000 ALTER TABLE `typeofspec` DISABLE KEYS */;
INSERT INTO `typeofspec` VALUES (1,'basic'),(2,'characteristics'),(3,'construction\n');
/*!40000 ALTER TABLE `typeofspec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `fk_user_role1_idx` (`role_id`),
  KEY `fk_user_vendor1_idx` (`vendor_id`),
  CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_vendor1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'renek','1','ruslan','sivitsky',1,1),(3,'r','r',NULL,'f',3,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valuta`
--

DROP TABLE IF EXISTS `valuta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuta` (
  `valuta_id` int(11) NOT NULL AUTO_INCREMENT,
  `valuta_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`valuta_id`),
  UNIQUE KEY `id_valuta_UNIQUE` (`valuta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valuta`
--

LOCK TABLES `valuta` WRITE;
/*!40000 ALTER TABLE `valuta` DISABLE KEYS */;
INSERT INTO `valuta` VALUES (1,'usd'),(2,'rur'),(3,'byr');
/*!40000 ALTER TABLE `valuta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`),
  UNIQUE KEY `idvendor_UNIQUE` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='vendor of goods';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'Sanyo'),(2,'Belmarket'),(3,'Roscosmos'),(4,'eee');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-09 19:09:30
