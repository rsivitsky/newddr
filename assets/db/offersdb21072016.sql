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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `booking_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `booking_status` varchar(255) DEFAULT NULL,
  `booking_sum` decimal(10,2) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `booking_num` int(11) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `offer_id` bigint(20) DEFAULT NULL,
  `part_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `FK_niy28isf0070egkey3b4nnp2u` (`offer_id`),
  KEY `FK_736p3g52onbt6as6ig4r6mlw2` (`part_id`),
  KEY `FK_jx9a9qmksuasu3taidjqyp0co` (`user_id`),
  KEY `FK_pxqckdfdk01fboi0l6d8eew3u` (`cart_id`),
  CONSTRAINT `FK_736p3g52onbt6as6ig4r6mlw2` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`),
  CONSTRAINT `FK_jx9a9qmksuasu3taidjqyp0co` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_niy28isf0070egkey3b4nnp2u` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`offer_id`),
  CONSTRAINT `FK_pxqckdfdk01fboi0l6d8eew3u` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'ORDERED',20.00,'2016-06-14 21:28:54',1,421857138,1,1,5),(2,'NEW',9.00,'2016-06-14 21:29:16',1,421857138,6,2,5);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` bigint(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  PRIMARY KEY (`cart_id`,`user_id`),
  UNIQUE KEY `unique_cart_id` (`cart_id`),
  KEY `FK_9emlp6m95v5er2bcqkjsw48he` (`user_id`),
  CONSTRAINT `FK_9emlp6m95v5er2bcqkjsw48he` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (271205709,160),(421857138,5),(777184282,150),(835327333,155);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description`
--

DROP TABLE IF EXISTS `description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `description` (
  `descript_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `descript_name` varchar(45) DEFAULT NULL,
  `descript_value` varchar(45) DEFAULT NULL,
  `spec_id` bigint(11) NOT NULL,
  `part_id` bigint(11) NOT NULL,
  PRIMARY KEY (`descript_id`),
  KEY `fk_description_specification1_idx` (`spec_id`),
  KEY `fk_description_part1_idx` (`part_id`),
  CONSTRAINT `fk_description_part1` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_description_specification1` FOREIGN KEY (`spec_id`) REFERENCES `specification` (`spec_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description`
--

LOCK TABLES `description` WRITE;
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
INSERT INTO `description` VALUES (1,'frequency','833',1,3),(2,'with','12',2,3),(3,'size','16',3,3);
/*!40000 ALTER TABLE `description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactur`
--

DROP TABLE IF EXISTS `manufactur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactur` (
  `manufactur_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `manufactur_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`manufactur_id`),
  UNIQUE KEY `idmanufactur_id_UNIQUE` (`manufactur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactur`
--

LOCK TABLES `manufactur` WRITE;
/*!40000 ALTER TABLE `manufactur` DISABLE KEYS */;
INSERT INTO `manufactur` VALUES (1,'Horizont_manuf'),(2,'Vityaz_manuf');
/*!40000 ALTER TABLE `manufactur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measure` (
  `measure_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `measure_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`measure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure`
--

LOCK TABLES `measure` WRITE;
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
INSERT INTO `measure` VALUES (1,'inch'),(2,'Gb'),(3,'Mhz');
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `offer_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `offer_date` datetime DEFAULT NULL,
  `offer_price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `part_id` bigint(11) NOT NULL,
  `vendor_id` bigint(11) NOT NULL,
  `offer_num` int(10) NOT NULL,
  `offer_sum` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`offer_id`,`part_id`,`vendor_id`),
  UNIQUE KEY `id_offer_UNIQUE` (`offer_id`),
  KEY `fk_offer_part1_idx` (`part_id`),
  KEY `fk_offer_vendor1_idx` (`vendor_id`),
  CONSTRAINT `fk_offer_part1` FOREIGN KEY (`part_id`) REFERENCES `part` (`part_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_vendor1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (1,'2016-01-11 02:00:00',20.00,'EUR',1,5,5,100.00),(2,'2016-01-11 02:00:00',20.00,'USD',2,5,3,60.00),(3,'2016-01-11 02:00:00',21.00,'EUR',3,5,10,210.00),(4,'2016-04-26 02:00:00',10.00,'USD',1,6,100,1000.00),(5,'2016-04-26 02:00:00',1.35,'EUR',4,6,2,2.70),(6,'2016-05-30 22:09:29',9.00,'EUR',2,5,1,9.00);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part` (
  `part_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `part_name` varchar(45) DEFAULT NULL,
  `manufactur_id` bigint(11) DEFAULT NULL,
  `photo` longblob,
  PRIMARY KEY (`part_id`),
  UNIQUE KEY `id_part_UNIQUE` (`part_id`),
  KEY `fk_part_manufactur1_idx` (`manufactur_id`),
  CONSTRAINT `fk_part_manufactur1` FOREIGN KEY (`manufactur_id`) REFERENCES `manufactur` (`manufactur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='type of computer part (computer accessory)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,'ddr2',2,'ÿ\Øÿ\à\0JFIF\0\0d\0d\0\0ÿ\á\0\äExif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0À\0\0\0\0\0\0\0\È(\0\0\0\0\0\0\0\0\0\0\0\0\0\0‚˜\0\0\0\0\0\0\0\Ð\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0d\0\0\0\0\0\0d\0\0\0Onliner.by\0\0ÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0&\0ª\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0?\0\r\0\0\0\0\0!1\"AQa2q‘#B¡ð3±\á	$5CRSbƒ£Á\Ñ\Óÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\05\0\0\0\0\0\0\0!1AQa‘ðq¡±\Ñ\"#2RÁ\á3ñBÿ\Ú\0\0\0?\0\Ë\ë\ZlÊ¡‚A­\ã¸cfg%Ïˆ‚Nû\á`6\êq”I9Xò¹€\×\ËDºyAX¹Š¸ž>µBBa;ÿ\0º a\êJš\ç¯ƒ;´(\0mÁ¹ÃŠy?v°v\Z€\n\0°\ëôýñ\Ê\n\Ð!\Ó%ÏžR„€µƒs=^4Ì\ÓS:È–¸1Ù…÷±¿\Ôa +.°Ü³“,\ËR@/´_ŸV¢°ˆ\ìF\äŸ_\\(¬`\0L2H\0«µùõº\Î\íHª³S5\ä;jMö\êAþ·\Â¬»\çÓ¨‰‰÷<¿˜¬=\Ó£\Å\îWqô7\Ã@Vb\Þ(M\n6\épO¦\Èw©…Qž.	Œo\Ð\ë\Â@{õ\×\Z$OHLö.\ÛùÛ£\ìu¡Vÿ\0„b“( \ß÷Âsk\ï\n®\Ð\Í\n;lÅ­\Ã\ÞOS\É\Z!ˆnËª\Þ\ß\á\×§I¿ŒSOª˜¢\0mö€:\Ý¦«i\á2¤Ñª}\â ¯\ë\ï†Å¿˜Ž¹+J’/û\ç!¥‘\Ô\É\ß\0J%\ÅýGõ\ë‡,’\æþpóO:J¢]$fñŒ!s€7\á\ä\"\ÄÙ†\Û~øy*\Çt5\æ®v`\0f³¿(ŠC8\'»ýMú\ÛûðÓ˜\Ø<dŠ™€\Ï	.Ö¶\Ý\Ú\ÃF\Ì\Ë]\Ä-ÿ\0Jƒaü\áÌ \ÉxIÊ›0¥“®€‚[~øLURV–hÁŒ†±[•ÿ\0Ï¶9E`†&dUT\Ù	\áÇ¹ö†¿.@T”®\ãX¿‹ùÃˆRSs\ïQ›.NR×»±{ñ…G™\É<ŠŠ²£i\ës¿\Ô\ßJ€\Ö‰UH’	\']3’º¢&f,,ukç§ž9!@fù†$Î•¤qw,\Ü`f´m¹5\Öev\Ô6ú\áFb\à\ÔJXP\í\0 ¶¯g\ã§\Ìz\\Êª• ©h\ì\Í\Æ÷¹\èzƒ‰\ÓK\Ü#Q_*R%« H\ÓM|¢Õ’ñnfù5|N±¯O¹\Íü#\Îø­QûŒbƒ˜·¹†\\\Ã\á\ë–\Ù\Ýn[PÏ—\æñ¢Ê°µµ€\çf\Z$uóöÁ…J¬b\á\âL\Õ&`e€\á\ì\Þ\ï\îÆ¼\á^x\çuUÅ”YŽgTô±\Ò\ÓE˜\ÉI I\Þ\ê$§R;µ\0€\'\á	M:”~#\Ñp\ê)¤¤- Xl:Û†»rœ\Í\ZE\ÃYµ$3^#¯>©cb A=\0[\Ð\àL™¤:Z&\Ô\àô¿©LH\ÝgÙ¾ñd\Í;ò{8©3Vey´Ò±¹o\Õ\rýv|2e¤¾_\æ!Ê ¦”ùQ®ûû\Â(ûrfµÃ’\æÅ·9\ÝYó÷|8\ËA\Ø!WCL´\ä(\r\Ê\æ]‡¹M›¢¥^U™È ³3š¥¹f,I³Ž¬IúœH–´\r8m*˜#ùô†0ÿ\0“û’\Ôò¤‘\äyšº©ø\ÝY±õ0\\ˆý¢\rø:rI(xD\ßù–r©¨/\Âs\ç@KÞ¤ ³}wØ³\Ü\à†•º\"÷]#“N\'\Ç~ø\çžÓ’yqÀ¼Š\æd9&a•\æù52\Ô\ÑWò¦u÷¨7GrÄƒq\Ö\Ö\ÂeüÒ“,emmsº\"D©“…\É\0%\Ø\Ú\àûqŽ+\àœÎº^«‚¢ªY-1F\ÔÚ¯£e?µ\ØzïŠº›NÊ‘k{F\ZJ%\×öRÀ\Ö=\"j‚c\Ë*¥\ÔMÕ€_!°\Äe)Ô‘sVD\Ô$\Ås™y\ÍeE/SM­Õ¢xœ\é7#^\â\ÚI lœK¦H3RDk0\É(™U-H)\Êx¹:¿¥š2¹+3:x)¤\\Ú«¾‘K\èiXh½úú‚1s\Ù\Êý‚\Ü#rh©\É.\Ê7#ž\Ô\ÅÁJ\íU+™(\ÕH^ª,ß»øº\ílgQp4}ñ\æ…I*(qú\ÈòÕ¶YöðŒfyŒ”µ¾gVºM€2·ˆ\Ú\ã{ý~\Ø\Ñv2\Ü¢=(QÓ³‰b\Ü9ók•Ù­t;,²V\É$‘L\ÄbnW\å`Nûjo¹\Å-Ii\ÙP,\Ï\×\Äbq1.MZ\Ñ,ö¸\Zua\Îi˜\Ö\×ñj®aSO\n1*Y\ØYE¼¯¶\ßÝ‹9\Ðd¤© ˜\ÓPRH4¨*@.7>‘e\åNaZs\n´’¾Y\"1\ržBAVfV]\ïó‹û\â-bP‚Œ¡ž+1‰R%*O\Ú\0$ƒ±ß«˜Ž\æ&{˜f\\X\ák*•œ&²€,v¾\Ý|°JD%E`Á0iW%JRA/ýu¾ðEmd<OüBy#³‚„Ý´j¿_#ý\Ø}RR™D¡ p‹\Z\é‘%Ð– \0x\ØL5yŒ\ÑÒªK-Tÿ\0“l»\êbz“ˆS‹‘·ô\ÅV\"Te+Va»®Q´\å•y­UEœX’,¬¦Hö!E\ÇÍˆÊ§˜THG\\\ã ¼>´¨‘!]y\Æ{\Ì~<\Ïù—\ÅU\ÆTsÈ …¥X–?l¢\Ê\0}ï€•.b³a«™Q[0\Ì|Å®l,\"ó\ØoŸ\r\É\\ß¡ãŠ‰òø³9)Þ’U¡–¡X¡”0:•6q\å½\Î5\å\n§BI•AP”R\ËÊ \r±\Ùùl\ÎF\×\éZ>\'”ü\Â+ªM\ê²òa†©hF¤D¹•Ò ™“.|\âJ³¶¯$\èÜ¬üyK}&’§ûXD\ÌBÝŒtª¹Ÿ\"Å­»\Þ\ZSv\ä\ä…l\Ë<p!6\n2ú¯^·î°ªZR‘2ªD”­`6k\Û_’ù*«\ã1–\Óþ®ªcqô‹L\ék,\r5\Ô\ë_fv(‰=¿9\\*ñ¤’3l\å5Ÿü°{o\'µ—û‡8˜›¶·()iüK?u£]\×+ª;y³ö;zƒˆ¢¦I,;Î“(V{\Î\ÇXÀûVv\Ù\å2{>ñ¯p\æsY]\æ´bžžŸ\á51jnñ	»:\0\0\0\Î$–ýÃœM\íe\é˜sÂœ\rKp\Öi,£ƒ¿gE\îÏˆ1$Ÿ#cö\ÅPH™}Œ&Q¬R”­¼Z,T\ÙöEO•\Õeó\æn¹ä¡»ªHY\n\Ø\Ý\í\ì¦Á¼¼½ð.\Ã2\×\Ò\"&ŠT\ÊUU)ó\0Ý²+üÈŠY¸.#rI¡\ÒB/°asô÷\Ã\éG\ç\Ü\ï‡\à¨\\ª\ä©vIv{=µŒŽwjÙ‘––tpnTAÀ{\âý-µQ\é]ª	lÃ˜\Ö\ZZÁÁ1¶ªa†#°\Óas\äKmlfT>\â\Ûúÿ\0‘\åj§*Z§‚Spg\ß\ã²0ZŽ÷ðÂšJ)\ÃGµô0³w\"\Þø\Ó\ènc\Õ{Il\ÅC˜k–PU|¡\Ñ\n\Æ&y4l.M½‰¿±\ÅH\nœ\Ü6F–*+”þ”ƒk\ßgýŒó;i)3zõ–’¡\Öv\ï6B.yzú\â\ÚCvI¿ZÆ·\r™,Q\ËCM\â,|«‚g\Ì\ê\n+Erª\Í$M`5’\Ûù7¶\"WJH\ÚúyEN8”\Ô*T°­I;-\ÎqóT\Óñ3\Ï%,Ïª1\Â]Hþv\é‚Q\0¤¿?&Ò¤­*;v\ëü\Þ%¥d¦‘Qµ+!6;ûœ¬þA¼O\Å…R«*®\ão\Úrª¹\è+ãª¥r%¦”I\ß\È\Ê\×_n£ø\Å|\í	\à\"š°„\Ó\ÌSh#¦){aónJhY³™-ð\è·Û¯Ë~2vñ\éCõkÿ\0¼rO\Äc\ì\ç«ó‡Ž\êx®‡‡\ß#‚H\î9u¥™Â¨¹+°ô\ë‡LJ”¼\â\Îº\Ö.òN­¨üBÀ€\àn¹nŒ\Ø\ç]L7e/\ÏÕŽ›÷\Î\Ø)@Xòˆó°¹\Æ\Çcu§uCÄ’Q4EŒƒðÿ\0–\æ\æ\ã\Ê\Çqüu¾;±Yµ\áæ‚¢Y\nAb’\Þfû£\Òg\ÓM8y\"’w\Ö \Ö\Ä\êf_§õc„2f+W¼\áó\Ô7»i´Ž!\áQgò%Dr$e:W_\Í`wöý\'ú\ß\r–\é\ÆÝ•	A—\å\Êû¿¿(,üQS˜=\Þ9%¼ŒÊ†P\Û\Üê±¿™O¦K]ó]\áÆŠªhe—:/#¥\Ìå«•#JR¥Õ¬\Ú\Ã·[i$œ³)û˜òˆ\Ý\ß>B³”¾cfkð¿”LÉ™\×OM!ŠÂ‰Ý”20½®EÁX\ïo\\/-‰#®Q^fÌ;\0:n>\Õc™abP6›†\'l”•D`©jX?À\Û\å\0¬žJlº¶ž`ñ‰ô\Í\â\ÔµÀµúõ;ýº\àùŠˆzE„\ÉsRRV’6\Ü3üyD\\?\r\ÉK6cRõ+\Ä(€wˆ°”\Ã\ÂN¦;µ\ì6\ÛBÿ\0(¤Eì¹‰ü\n\åf¹>\ÍÕ °qm™j\Æg˜\Ç\0ˆV*¢öý\Øzb7f´©€Š&¦a*.Rx=\êLÒ‚¡\êâ‚þ¶±ß§Ÿ¾·p\"2e®J³”_£¦\ØUgIðå†€\Ô\æ¢‘,tz¥]7-\âµ\ì.oõß®„\Ì\Ûa\Æ%Ò¢¦b.X9E\Ø{\Ä;\ç’\ØFY\ÜH7\ÛÜŸ|RJ‹ÿ\0\ÔKV8¬)·ž¬\ÐJ^/«£\Ò\ÝuZa\"Mº\ØX_®ÿ\0Ï–ø\ã-d½ùnƒŠ\n´+2\Î8\é\Ë\Öœ\îH\Õ\ËS\ê r\ïmÀzøN\Ã\n©*6\"3œ´\ß`\á~OŸ\Õ\å\ÓOj6ù;¶³\Ø\r[[¯\ío¾8IP\Ñ\àŠÃªe()%Šn8?—¼\"£8«ª©‘¦‰§”2‚\Í%\Ëksb¯LqB”–[\ÇL\Ã\ç,³\Ñò\Ö3\n¸¥-\r¯\Ë-\È;\Ðô\ß\Ó\Û\n%–c×”p Nœ\Ûu¥¹Å“‡s”É³üº½)R¥\éj£˜\Äö++×£Uº-ûa³VV ³\ÓCfšŒJbD¹a#f¯k\ìŽ\Ý¾)\'.\âŠA³\'\ã”\é>b\â+HürNˆ\ë”hf\×\ÔI˜©K¦\0¤~á¨¶\è\çÌŸ&\åÿ\01³®áœ§†\êøfJL²¯\ã•TµzŽa:€Qü@ƒ¸rI\0ø­kŠz\ê\ÅI¥3¥j\0\×} 8\"\éñ\n™T\é$˜ƒ©.T½•x*IXµ^r«\Ýfˆ]¶³Q¤}±—F=\\ \î=~cÐŽ	L\îV®c\ãf\Èñ\ì¹ÁÀ¨üfs»^\â¢0un5|p\îû®{\ëóV	L\Õ~#^Q\ê®\Ë\Ü#‘ˆ\ë3‹‚_STFN£ú¿³\ëŽ\åp»_˜A‚R€Ù•¿Q®ý5ƒI\Ùgƒ\Ò!!­\ÎÀÿ\0®osn\ï\Üýð©\Æk\ÜzÂŒ™ógW1ñ¯›²ÿ\0!1­Vj¡R\ÊD±\\_sú<÷ûœ4c•\ï¨õù„\î*R–Î»q\Zñ‡vl\á:2³C[›\Å(M*VH¼;‚Hð{aU‹\Ö/V xü\Ãô\í\Ðkût¸·m`MÈŒ†Y$¾ašx÷\'\\WÌž\Þu 0õùˆKúG˜¢¥•’xˆ°p!²:œëˆ¨»Ú‰á‡…\ë3(¿\Ët©‚\ÆF•^\à\ß¸Z\×\\™Š˜À§FŒ^5‚Q\ÐÔ‰rÿ\0R\Õ}\à†!¢¡G\Ùÿ\0!\Î2Üº²¶·3–¦Zh\ÞO\Ï] ²+£FÀm\æ/Šµ\â•)Z’†g;8ø\ÆÆƒ\éú9Ô²g-k%II¹Q\á³f\èOÙ›„‚\ê5™~º»\ä\ë·üŸ\Õð\Åbµš¼ŒJMa\É\Ó7§\Ä\n^\Í*´\"ˆ\Ö\ç_„]C¸ZÀƒ½ˆ\Ób7ÈŒ8\ãU\ÎÀŽP\ïñ\Ê,¹s-·fþ¡­of^©’I\ç¨Í§•†\ï%B±¿@nS\Óo \Çw½mÝ­\Â_M\Ð¸•;o({4ðŒ²H\rVo\n\È]a1>d\ë°ûa£«\Ín\Üý?DŠ¯\Ä|A«;4ð„ZTf )\n¿\Ã\Ó\äó°û`ƒ\Z®G¬;¸\ér\ímG\Ävg\ásyó;X ü\ä\Ù}ƒüp£­aq\ÜTƒÿ\0JÑµ\Zn\ÒIÙ‹ƒ»»‰óC~·š=À7·\ÉÓ¯O\\7¾«oq\ë	Ü”…ÁR¯\Är\ÓHù\'g.v:\ës‡:®Iž=\ín¾/}V›’=a\Ç¥Qº\Õ\Ì|CJŽÎ¼+*óRÅµ’d‹sµ\É\ì>\ØUcu‰»X^\ä¦$º\Õ~#\âK\ÙÇ„»¥»9R¾’E¾\Ö\ßÁ¾\ãuŠoX\nð\n5£³Z”A\â>\"6~\àUñ§VqQ˜qg\Ë$Â§,¨¨[3wDFÀ\0·±c± X\â\ã¯\\\å+¶¸\ÆO£¡ÀS)h\n)Q¸q³M\Û\ày/\"\Ìh)ª\è)`¢¡ž%–ž™§g1FÀB\Ú7° _\ÛR\æ•\r£\Ègv“f)h,	$_aòÿ\Ù'),(2,'ddr3',2,'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\á\0\äExif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0À\0\0\0\0\0\0\0\È(\0\0\0\0\0\0\0\0\0\0\0\0\0\0‚˜\0\0\0\0\0\0\0\Ð\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0H\0\0\0\0\0\0H\0\0\0Onliner.by\0\0ÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0*\0ª\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0K\0\n\0\0\0\0\0!1AQ\"23q’#Ra“¡\Ñ\Ò	$4BCSTb±\Â&\'6Dc‘Frƒ…¢Á\âÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0?\0\0\0\0\0\0\0!1AQa‘\"Rq\ÑST¡±Áð#2Br’\á$CD3b‚ñÿ\Ú\0\0\0?\0\×k?„S0\Zü\ÕR²\ÔHJ\Üi–f-\\`StnR’l|¤“`:X\\u\Ç?5\ã$R¹€\n\í7\",W•\Û\r®I\\ñSJSIl\×U“g?-B\Î\éuóøL®\àG¦<˜­\Üv\'qµfIl´I¥\Ôð\Éz‹’W=Š…°‡®\í~^å£P³*<\Ú\í@\ïQþgK\Üt“\Åt°\ÙZ(Øš\éIþøÙž\àû½?—ú\Ç¶ž(ô+!\ÓhòWµ‹5R_P¥f\n´\nº_l,¦z\Ó ¨¹·˜&\çfÒ•\ë\â\Ô6‡1\Ã;z\Üp\Ï…šN5¹i\Ôw­Æ¥á¿Ÿ\åTd9«—aC+ø^†\ã‹Jz\rÊ°¹=I\0“`/\ÎJ\ä l­`N³Šž\ê \rMI=sWö\ç~\Ì7\í9>‚—¨v-Žý\ß\Âxð\Ò\Ô{s\Ìy`ú©\Îý˜?i\Éô\ê‹c¿r_ð\Ë\Îul™[¥MªErdÄ¶˜³haQeù{Šw$¦\à€R®\ã‡}¢\\\Ò\×e\à¡\ê<p\Ï¶v‚\í\Z‚6\ãH\"±1¨õöUù-v¨\Ð\íp\Ìp­^¿+—¨c(\Ê÷\Z’x¯F†\ë±À\Ì&\å£\ÉU\æ\r\\\Ô\Í\Çb‘[ª?.Böqß”²\Ädö­|\î~DŽd÷bX\Ü	%\î4ó>\n\ágkc±Ùš^\ãJ–Œ-\Z\Ü\ï\ÖT\'5£R&s¢«VrFö4\Ðtø\Ä\ç~2F\ë6\ÝûM\É\ç\Ø9¿²@ó;\Í\0ù•I\Ñ=²\ÈþŠqŠ€b‘\ÛZ?+w\ëð)Õ½PWˆ\Ær½%2»\Ó&%\Å#¢þ‰÷q}—6½\Ã˜ûN\Äh4\n\æw\î	³ZˆŠ@À÷f÷aX\Þ\è\ï;UtkA^³jZ˜™)\n€+XjÈ³€_\Ó>»\Ù)\í\Ú6ùM°¨Ê†\ãñ? ‰m£³¶\Æ4á˜EOü\Þ+wi¦òžÞ«\ê2\çÆŠ¼\Ç0Far\ç)D	?«e\äj\Öp\ÒY„º¦§@®\åL\Ë,\æx\à17E^ü\0\ëÄz²sTó]‰üb¨ý9\Ä;WA\Ð\ìÞ‰¼Œ½U\Íwÿ\0T~œ\áT\íG¡\Ùýx\ÍS\ÍJÿ\0ˆ\ê_4…\Z©tXGö\Ç\0£¯QóÁ\ß_©.ÿ\0\ZJˆþx^Ôº<]ÁÀ.·%xI\ç,‚\ØE\"­PŽ­Û”=e…òÊ‚‘V%Žibü.+&\Ùr]öó÷ð´û(xŠ²@ü\":€\â \ÇrŸIZ’ —<G®G_\Ñ¾hqw\í	\è\\\'!n¦—¼L…rxW‰Z¥#ðƒ?S¤Â˜¬œ\ËJ\Â(¥I\×\áóëŽðà¸•\æT\ê\Ñd?\Zk\éUÍ®Ë±¿wf9ktE’c\Ô\åôo\"/­wp²ŒŸGx$~^\Å#iJˆP\æ:…˜Íªô|;JzR`¬¨†¸\Î)d¡Ò”÷v\à\Õ6…(ˆ÷\í\ÎP §x£ÿ\0¼¯\n¨a)¦ÿ\0¼¯\n¨\á)9¼Ÿ¯\n©a;PÜ‡ ƒij\ïƒQ± Ãµ\" KW!9Iù°¶«6\ã wWÊ¥pP\Âqa¯ˆ0£P–\ÃW?“RŽ£­†m\è\Ðpj–€¶˜›H5@°(î¡Žvi²pj†\0¡¸†‚\×û$\ì\rAW~­¯œ93›jf\æMþ	£\êH\ÂÚŸf\0\æ\ÊEûR,F\nf\03rk1\èL\Å%N”¤õZDò\é\å|X‚#3\ÃÀ¿/]v\'\Úe\Ì\èi:<\Î\å¬\ä¶\â«\'PŠã¤¬À`¨Û©\á§Jùq.¿D\Ó:v³¾Ö–\ÊLª+\Ô\Ð\äÕ¥\ç];\Çsˆ.\ç>…<‡,d\Þmû¶‘·\ä½Ký<—\rºhÎ¶|<\×«®\×7°·>\ìs«\ß–‡£zyM\Îó\ë2«³O Ñ ªd¹	p4\nŠ‚[AYJ¶(õ\ÚM‡!‹vx[.\'<\Ðÿ\0‹–¿\ïi\î\æE‘¸¥•\ØZ)\\©RiQZ\rU+¹‹¥™\"³·2š^–\Å&˜ô×½Ë«™ª.rC\rc §r\Õ~W¸I\é\×›<E®su\rF¹\êÔ¹\Ç_w¬Côi‘\á£x2\Ò\ãþ\ã«A\á™Ö‹§Z	GªdVkÙ¡\Ù\Ô÷%JS|T\ÆJc5µ´¤\í\Þò€\Üy\0,:+#{\É\ZwnJm\íÊ‹T6÷Y,®†\è.\í:¤Ò‡<-\ZuSkš/òýf‰CªNª\Ó+Uw¸\rG)¹\Ée+OÀ¾¥%¤… ¬„\íO;ß–¬°µ\Â7|\r6qPY¹E|Z¡š\×ø£$´°š\Ó@.4 gS–¥šg¼¡@È½FUM\ê\Îja\âÜ¥Cbl[º†\çW\ÞFÔŽœñFX\Ùfµv½ƒ\Ív7e\ál¼È´ˆ\ÄpV\â\Íî®¼\Z6V¤\î\\6+®–©Š\ÂNª{M\íë„£s‘AÃ”$£ÀŒ\Ü\É\Ñ\ØuôFi\×Úžp\Ù-¤¨¢{€7ù°\à*@U\å\Çž\ÑR4\Z\é«Ú¶Œ\ÅU\ÒLÍ©þ\'\"4\è”ÆŸf5\Z|–#À,6”§Œ´ðÊ\ÈQRº›Œj?¢¾l9¢¢”ñ^sdo(¬—g<\Ò\×<‚\â\×:J’{#:e•¤‰\Î\Úwžót¡Wi°(YqrÝ¨\Òk\Ä\"<†¸IJ\ÊF\Û,8”\Ü$Žª$÷‡\â³\Ê÷\Æ\àt‚7y¦tK\æ\í³YmvgºIp†½Ž«\ÄI©\Ï\"\Òs;±.MÕ¼ƒO¡W%\Z\Z‰˜\Â\"\Ñ\àÉŽ‰ó\ä-\çÆ\êœuHJnlI‘ÂŠH\0q\Â\0\Z+™$\ë>	—…\Õ{\É4L\çž÷HIyi,cCFMü5\'Nd©J\×L…˜¸Yq˜tô&¢òõ\ê\Ý&`4•ª\È`,¨\'oœ<\îX\Í\Ç6\0©\Ö@\0*Ÿb^\ÖZ\Û÷v£#\Þ\ç(3u\0µ\Ðt+,ç¨”Gó„‰”<Å\"e„¤¨A\áC2T ˜¥CPH&\ÖJ·\Í\Ý\Ò\ÈX_\ØÃ‡þ¾K>\Çd´‹(e¦9\Ì\Ûk&m*wŠ\rÉ´e\Ò\ÖÚ¤Òœ„\ê\Ú2¤\Ô=ÃƒSC®<¢²—W\Â% ’’„£h\ånC	²@\0s­\ÓðJ[²ú&Iƒ\\ð\ryÇ°€Üª= tÔš•K®\Z[™µs3e“”h4gò\ß\ÆbµEq‚\Ë\ä\ÊzIm\r›7m…¬	\'\Úat¥¢&\nm\ÏÆšû†ø²]PNmó¸K¤±øª)ù[ˆœ^5\Ï^KÖ‰t8Ž&]Ë&]+/\Å<} ‘¸­÷¹uj!?ÂŠ“µ±‘s¦“´\ëòö.\Ú\å}¦h]kµ.”\â\rî¶”hñ¦gy\\E&}.e\Ê\Ë\ÍI\âe[ˆj\ÙG|P¢]I\Ü|ž\îx±`mdq\Ýó\\Ÿ/¥¥†ö¿\à\Ó\æ¿D\èù£ÁT\Ò š}\"a.`=£oS~–\ëú5xM\\¾@ðƒ\Ð\á\àÿ\0­ˆ¡&·\î÷À5øŽ\á—s\àö\îUí³­ùß¦3/ýÇ\Ðù.á£¼\×u~K‘Jü³Ø€9ªý¸\æW\Ñ`©l\Õ_‹C\Ëz<Y\0qY\â¥\í¦\ãrA±·^}0ª\à0\n7G\Ü\Ù^\ÐKt3\ÓC«z?ª„¦f\Ò3\n *I\à·\"\Ò\ÙxüP¤‘»Õ‰Z&ŒÚ‚³¦–\ì¶D\Ó;˜ö8\ÐW	\ÛtŸh\î¢\Õ\ëŽTX{1Ì¨-À–&¶\äÕºTw%£\Ðó\0ö\à9\ÓW“C\ïF\Ïf»D˜,\ìf(Î††Õ¤øh${QÑ+ˆE1)«\Í	¥«|\ÇQñUw·\Ï\Èù°\ÞvL»G-”\æ\ï²!17\ï?Cµú¶ûU\\©\î\Ì}\Ç\ßqO<\ê\Ê\Üqjº”¢nI=¤“ˆ‰\'2¯\Æ\Æ\Æ\Ð\Æ\nIv\ç	<§‡\0Á¢Œš¥\âóù0Td¯)\í¸)ºPW&Ý¸TMQ’o{\á\ÔIDzU\Ç\"oƒD•c\ï’O;a\ÔF¡-2**R\Ã+ž\'1e\r’\á$ýXsZI¢­<ü\Óqa.\ÜO\Éupt\ê•&Ê—¨yZ;l\ì‡T>d³ÿ\0¼Y“ù€ö¬	oy“,’»\Ø\Ññr\è`P4k+\Ùú\Ön¬f÷‘\ÏÄ¨”ó¥\â\ë¦öõ[ano’¾\æVD¶\ëú\ÓÙ³Y›\Ú÷kU\Âü.¥\å…D¦\ä\\­K\Ëe‡w»Oqu\ÎYAõžñÔŽ)é‰…¬EÙ´IY‡’¢\Ø]5\ç;¤”Œˆ\È7ô\Ü7.Uh\ÔlÁ\ÍùA>^«-M»MYº\é’Àº\ãžôw ö¦\ãôq^V4Žr=V\Ãõ¡tMª\Ò\Ò\ë\r¸\ÖVhv§·@wŽ§\rG\Åg\Ôü½;gŸ–¦\Ì4\è•j³1^”·eZV7X\\Ï–.X{8\Ýà¸ž^¿Fõ€_£\Ï\\I¦Ä‚Þ¦\É[q™C)RŒ[”€	\çòcgñük\ã<\ã¡:›”#\åü\Ð\å\0Ô™\ÍJx\Ó[iÿ\0}I±t ¤–ÁP\ë\È\Øò\Æ}¤Fø¾õ\ØFš®’\ä½%º-f\ÑgŒ=\ÄC]{)à©•“uMiHkNj‰#\Î.0»P–:\ç8^Ž\î\\\Ú\Ë@eŒW]\\i\ì\É/\â¬:’“§U“\äb¹cõ\áRÁ\éÂ®÷‰Ë¢7‰^kMõTp‚t\ÚX\áy-\Ú\Z†\Ïùyù?6l\'ü…\\-­\r\ÂÀ£N^=ˆ\Íé¾­´Nf6¢£¶*“rz“\åuùpA\×:s9ix0’\ËtÐœüv¥÷»\Õ\ãkiô\á~ö÷°\Ê\ÝþŸë‚—®×§ª·‰ó^÷·\Õ\Õ\0&‹ÿ\0¢¯¿†â»½?\×z\ízú£xŸ4ƒN5tA–o\Þ\Ñÿ\0\Ï\î:\'ú\à\å½\ë\ê­\â|\ÓÓ¦Ú¾¢mer=­‘q\í\á\ß\Ðzo®	‡–×Ÿª·‰óON™\ëºd{PGõ\áÔ°ú_®	v¼½Y¼OšEi†°ª\ß\Ø):ûÂ¥‡\ÒýpK®·Ÿ«7‰ó@V–k\"’H\ÈOƒüIúðiaô¿\\\ë­\ç\ê\Ì\â|Õ‹š#©þ÷\rf\Ïr (»]^^„™‚BPUr<Ý·>u\î;±g£Y\Ã9\Ü}ª½\Û\Ëù¾Ž\ÊøŸ5FtX×¶\Ù\ëXž\\‡Ÿõb\è½/\×!\å¥\ç\ê\í\â|\Ð¢\Ú\Æ\ãŠ\ÈJA R	\î\å¿\n¶!ý\ßwð—\\\ï#þ;xŸ4\èfµÿ\0w’z\Û\ÏO\ßÀ\Çaô¾\ï\á\Ë\Èÿ\0Ž\Þ\'\Í3\Þ3ZÓ©=m\éQ÷ðy\Ë¥÷	n¼}]¼Ošg¼V´›_Ndó6ô¨ûø\\\å‹\Òû¿„:\Ûxú»xŸ4\ßx½g\å}8”/Ë›\È×€d°ú_wð—[/Wo\æ¦C\Ñ\íhø«\ÓÚ‰#jœi™M¥*Z/°¨\Ër­\Û\Ì\àó\Ö:PM\îþo*m˜\Ãä²´‘ZQ\Ä];rS²ƒ&§j¶v¤\äY™Nl\æ\äN*¯ \ì\Ø\ÊR\æ\Çô\Ñ\È&\æ÷\è4\ìn€\Ô\Â\ìK”¿o›U\ê\ÛDm`mH¦g:\r5Q\ß\Ë5, ó”)\ì\Ç3©j0Ÿ->Ú‘\Äl\ìUù‹¤\Ø\â\évk”mû¥õSõ—,S\åIzL\nr\êH…\×\nšŠ\ÚO$rò@\Æeá‘\à\îø…bË”\â›~K\ë8q\Ú\âz4{#N\ì]%N\Õ`#µdü\Z=‘ƒ»\Äv¦ˆ\Í\è‘\ìŒ6ÝµQ\Ú#Ñ£\Ù±›¶¦˜\Ì\Û\Ñ#\Ùa‰•ü#‚8Ýµ0\Åd\Û\à[öF\Zbº8\"$~Ò¡½\n9<\Øhù_ac\îŽ	\Ü\ãû\Å50£\ß\Ð5\ìN\"º8&´©%ö\r{„l\î…	{¶§1¿\'k\Ø<\Û;¡7¶¯ùv½ƒÍ³º\Æí«§M™\ïf\Ú=Í‰°UŒ žl¹»<þg\Êë’\Ðl4¦µ›SÒª¨M‡aù+F>\Ìf\Ù\Ý\nù{¶£3L†\Ê#Ÿ\ì\ÇÙ„bŽŸ„pCœ~Ò§&›ÿ\0•c\è\ÇÙ„!º8!\Î?iN¸WüÑ¢OÙƒ\Ì\Å\Ý\ç´¢¢“§ó8ÿ\0DŸ³6»£‚i‘ý\â‰\î<kÁŒ\è§\ìÄœ\Ä]ÁÀ&ó¯\ï(¨¢SŠE\àEúý˜B»ƒ€C“¼x¬›]²½È¡M÷\"ŽF$x²8_`;Uk¦\ã»(\ØÀ\ì \r\n…¡\ÎqQ\è:G‘\\¡Ó”¬——”¥Fl’iLN\ÑüÒ :•j¿ÿ\Ù'),(3,'new memory',1,'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\á\0\äExif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0À\0\0\0\0\0\0\0\È(\0\0\0\0\0\0\0\0\0\0\0\0\0\0‚˜\0\0\0\0\0\0\0\Ð\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0H\0\0\0\0\0\0H\0\0\0Onliner.by\0\0ÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0*\0ª\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0K\0\n\0\0\0\0\0!1AQ\"23q’#Ra“¡\Ñ\Ò	$4BCSTb±\Â&\'6Dc‘Frƒ…¢Á\âÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0?\0\0\0\0\0\0\0!1AQa‘\"Rq\ÑST¡±Áð#2Br’\á$CD3b‚ñÿ\Ú\0\0\0?\0\×k?„S0\Zü\ÕR²\ÔHJ\Üi–f-\\`StnR’l|¤“`:X\\u\Ç?5\ã$R¹€\n\í7\",W•\Û\r®I\\ñSJSIl\×U“g?-B\Î\éuóøL®\àG¦<˜­\Üv\'qµfIl´I¥\Ôð\Éz‹’W=Š…°‡®\í~^å£P³*<\Ú\í@\ïQþgK\Üt“\Åt°\ÙZ(Øš\éIþøÙž\àû½?—ú\Ç¶ž(ô+!\ÓhòWµ‹5R_P¥f\n´\nº_l,¦z\Ó ¨¹·˜&\çfÒ•\ë\â\Ô6‡1\Ã;z\Üp\Ï…šN5¹i\Ôw­Æ¥á¿Ÿ\åTd9«—aC+ø^†\ã‹Jz\rÊ°¹=I\0“`/\ÎJ\ä l­`N³Šž\ê \rMI=sWö\ç~\Ì7\í9>‚—¨v-Žý\ß\Âxð\Ò\Ô{s\Ìy`ú©\Îý˜?i\Éô\ê‹c¿r_ð\Ë\Îul™[¥MªErdÄ¶˜³haQeù{Šw$¦\à€R®\ã‡}¢\\\Ò\×e\à¡\ê<p\Ï¶v‚\í\Z‚6\ãH\"±1¨õöUù-v¨\Ð\íp\Ìp­^¿+—¨c(\Ê÷\Z’x¯F†\ë±À\Ì&\å£\ÉU\æ\r\\\Ô\Í\Çb‘[ª?.Böqß”²\Ädö­|\î~DŽd÷bX\Ü	%\î4ó>\n\ágkc±Ùš^\ãJ–Œ-\Z\Ü\ï\ÖT\'5£R&s¢«VrFö4\Ðtø\Ä\ç~2F\ë6\ÝûM\É\ç\Ø9¿²@ó;\Í\0ù•I\Ñ=²\ÈþŠqŠ€b‘\ÛZ?+w\ëð)Õ½PWˆ\Ær½%2»\Ó&%\Å#¢þ‰÷q}—6½\Ã˜ûN\Äh4\n\æw\î	³ZˆŠ@À÷f÷aX\Þ\è\ï;UtkA^³jZ˜™)\n€+XjÈ³€_\Ó>»\Ù)\í\Ú6ùM°¨Ê†\ãñ? ‰m£³¶\Æ4á˜EOü\Þ+wi¦òžÞ«\ê2\çÆŠ¼\Ç0Far\ç)D	?«e\äj\Öp\ÒY„º¦§@®\åL\Ë,\æx\à17E^ü\0\ëÄz²sTó]‰üb¨ý9\Ä;WA\Ð\ìÞ‰¼Œ½U\Íwÿ\0T~œ\áT\íG¡\Ùýx\ÍS\ÍJÿ\0ˆ\ê_4…\Z©tXGö\Ç\0£¯QóÁ\ß_©.ÿ\0\ZJˆþx^Ôº<]ÁÀ.·%xI\ç,‚\ØE\"­PŽ­Û”=e…òÊ‚‘V%Žibü.+&\Ùr]öó÷ð´û(xŠ²@ü\":€\â \ÇrŸIZ’ —<G®G_\Ñ¾hqw\í	\è\\\'!n¦—¼L…rxW‰Z¥#ðƒ?S¤Â˜¬œ\ËJ\Â(¥I\×\áóëŽðà¸•\æT\ê\Ñd?\Zk\éUÍ®Ë±¿wf9ktE’c\Ô\åôo\"/­wp²ŒŸGx$~^\Å#iJˆP\æ:…˜Íªô|;JzR`¬¨†¸\Î)d¡Ò”÷v\à\Õ6…(ˆ÷\í\ÎP §x£ÿ\0¼¯\n¨a)¦ÿ\0¼¯\n¨\á)9¼Ÿ¯\n©a;PÜ‡ ƒij\ïƒQ± Ãµ\" KW!9Iù°¶«6\ã wWÊ¥pP\Âqa¯ˆ0£P–\ÃW?“RŽ£­†m\è\Ðpj–€¶˜›H5@°(î¡Žvi²pj†\0¡¸†‚\×û$\ì\rAW~­¯œ93›jf\æMþ	£\êH\ÂÚŸf\0\æ\ÊEûR,F\nf\03rk1\èL\Å%N”¤õZDò\é\å|X‚#3\ÃÀ¿/]v\'\Úe\Ì\èi:<\Î\å¬\ä¶\â«\'PŠã¤¬À`¨Û©\á§Jùq.¿D\Ó:v³¾Ö–\ÊLª+\Ô\Ð\äÕ¥\ç];\Çsˆ.\ç>…<‡,d\Þmû¶‘·\ä½Ký<—\rºhÎ¶|<\×«®\×7°·>\ìs«\ß–‡£zyM\Îó\ë2«³O Ñ ªd¹	p4\nŠ‚[AYJ¶(õ\ÚM‡!‹vx[.\'<\Ðÿ\0‹–¿\ïi\î\æE‘¸¥•\ØZ)\\©RiQZ\rU+¹‹¥™\"³·2š^–\Å&˜ô×½Ë«™ª.rC\rc §r\Õ~W¸I\é\×›<E®su\rF¹\êÔ¹\Ç_w¬Côi‘\á£x2\Ò\ãþ\ã«A\á™Ö‹§Z	GªdVkÙ¡\Ù\Ô÷%JS|T\ÆJc5µ´¤\í\Þò€\Üy\0,:+#{\É\ZwnJm\íÊ‹T6÷Y,®†\è.\í:¤Ò‡<-\ZuSkš/òýf‰CªNª\Ó+Uw¸\rG)¹\Ée+OÀ¾¥%¤… ¬„\íO;ß–¬°µ\Â7|\r6qPY¹E|Z¡š\×ø£$´°š\Ó@.4 gS–¥šg¼¡@È½FUM\ê\Îja\âÜ¥Cbl[º†\çW\ÞFÔŽœñFX\Ùfµv½ƒ\Ív7e\ál¼È´ˆ\ÄpV\â\Íî®¼\Z6V¤\î\\6+®–©Š\ÂNª{M\íë„£s‘AÃ”$£ÀŒ\Ü\É\Ñ\ØuôFi\×Úžp\Ù-¤¨¢{€7ù°\à*@U\å\Çž\ÑR4\Z\é«Ú¶Œ\ÅU\ÒLÍ©þ\'\"4\è”ÆŸf5\Z|–#À,6”§Œ´ðÊ\ÈQRº›Œj?¢¾l9¢¢”ñ^sdo(¬—g<\Ò\×<‚\â\×:J’{#:e•¤‰\Î\Úwžót¡Wi°(YqrÝ¨\Òk\Ä\"<†¸IJ\ÊF\Û,8”\Ü$Žª$÷‡\â³\Ê÷\Æ\àt‚7y¦tK\æ\í³YmvgºIp†½Ž«\ÄI©\Ï\"\Òs;±.MÕ¼ƒO¡W%\Z\Z‰˜\Â\"\Ñ\àÉŽ‰ó\ä-\çÆ\êœuHJnlI‘ÂŠH\0q\Â\0\Z+™$\ë>	—…\Õ{\É4L\çž÷HIyi,cCFMü5\'Nd©J\×L…˜¸Yq˜tô&¢òõ\ê\Ý&`4•ª\È`,¨\'oœ<\îX\Í\Ç6\0©\Ö@\0*Ÿb^\ÖZ\Û÷v£#\Þ\ç(3u\0µ\Ðt+,ç¨”Gó„‰”<Å\"e„¤¨A\áC2T ˜¥CPH&\ÖJ·\Í\Ý\Ò\ÈX_\ØÃ‡þ¾K>\Çd´‹(e¦9\Ì\Ûk&m*wŠ\rÉ´e\Ò\ÖÚ¤Òœ„\ê\Ú2¤\Ô=ÃƒSC®<¢²—W\Â% ’’„£h\ånC	²@\0s­\ÓðJ[²ú&Iƒ\\ð\ryÇ°€Üª= tÔš•K®\Z[™µs3e“”h4gò\ß\ÆbµEq‚\Ë\ä\ÊzIm\r›7m…¬	\'\Úat¥¢&\nm\ÏÆšû†ø²]PNmó¸K¤±øª)ù[ˆœ^5\Ï^KÖ‰t8Ž&]Ë&]+/\Å<} ‘¸­÷¹uj!?ÂŠ“µ±‘s¦“´\ëòö.\Ú\å}¦h]kµ.”\â\rî¶”hñ¦gy\\E&}.e\Ê\Ë\ÍI\âe[ˆj\ÙG|P¢]I\Ü|ž\îx±`mdq\Ýó\\Ÿ/¥¥†ö¿\à\Ó\æ¿D\èù£ÁT\Ò š}\"a.`=£oS~–\ëú5xM\\¾@ðƒ\Ð\á\àÿ\0­ˆ¡&·\î÷À5øŽ\á—s\àö\îUí³­ùß¦3/ýÇ\Ðù.á£¼\×u~K‘Jü³Ø€9ªý¸\æW\Ñ`©l\Õ_‹C\Ëz<Y\0qY\â¥\í¦\ãrA±·^}0ª\à0\n7G\Ü\Ù^\ÐKt3\ÓC«z?ª„¦f\Ò3\n *I\à·\"\Ò\ÙxüP¤‘»Õ‰Z&ŒÚ‚³¦–\ì¶D\Ó;˜ö8\ÐW	\ÛtŸh\î¢\Õ\ëŽTX{1Ì¨-À–&¶\äÕºTw%£\Ðó\0ö\à9\ÓW“C\ïF\Ïf»D˜,\ìf(Î††Õ¤øh${QÑ+ˆE1)«\Í	¥«|\ÇQñUw·\Ï\Èù°\ÞvL»G-”\æ\ï²!17\ï?Cµú¶ûU\\©\î\Ì}\Ç\ßqO<\ê\Ê\Üqjº”¢nI=¤“ˆ‰\'2¯\Æ\Æ\Æ\Ð\Æ\nIv\ç	<§‡\0Á¢Œš¥\âóù0Td¯)\í¸)ºPW&Ý¸TMQ’o{\á\ÔIDzU\Ç\"oƒD•c\ï’O;a\ÔF¡-2**R\Ã+ž\'1e\r’\á$ýXsZI¢­<ü\Óqa.\ÜO\Éupt\ê•&Ê—¨yZ;l\ì‡T>d³ÿ\0¼Y“ù€ö¬	oy“,’»\Ø\Ññr\è`P4k+\Ùú\Ön¬f÷‘\ÏÄ¨”ó¥\â\ë¦öõ[ano’¾\æVD¶\ëú\ÓÙ³Y›\Ú÷kU\Âü.¥\å…D¦\ä\\­K\Ëe‡w»Oqu\ÎYAõžñÔŽ)é‰…¬EÙ´IY‡’¢\Ø]5\ç;¤”Œˆ\È7ô\Ü7.Uh\ÔlÁ\ÍùA>^«-M»MYº\é’Àº\ãžôw ö¦\ãôq^V4Žr=V\Ãõ¡tMª\Ò\Ò\ë\r¸\ÖVhv§·@wŽ§\rG\Åg\Ôü½;gŸ–¦\Ì4\è•j³1^”·eZV7X\\Ï–.X{8\Ýà¸ž^¿Fõ€_£\Ï\\I¦Ä‚Þ¦\É[q™C)RŒ[”€	\çòcgñük\ã<\ã¡:›”#\åü\Ð\å\0Ô™\ÍJx\Ó[iÿ\0}I±t ¤–ÁP\ë\È\Øò\Æ}¤Fø¾õ\ØFš®’\ä½%º-f\ÑgŒ=\ÄC]{)à©•“uMiHkNj‰#\Î.0»P–:\ç8^Ž\î\\\Ú\Ë@eŒW]\\i\ì\É/\â¬:’“§U“\äb¹cõ\áRÁ\éÂ®÷‰Ë¢7‰^kMõTp‚t\ÚX\áy-\Ú\Z†\Ïùyù?6l\'ü…\\-­\r\ÂÀ£N^=ˆ\Íé¾­´Nf6¢£¶*“rz“\åuùpA\×:s9ix0’\ËtÐœüv¥÷»\Õ\ãkiô\á~ö÷°\Ê\ÝþŸë‚—®×§ª·‰ó^÷·\Õ\Õ\0&‹ÿ\0¢¯¿†â»½?\×z\ízú£xŸ4ƒN5tA–o\Þ\Ñÿ\0\Ï\î:\'ú\à\å½\ë\ê­\â|\ÓÓ¦Ú¾¢mer=­‘q\í\á\ß\Ðzo®	‡–×Ÿª·‰óON™\ëºd{PGõ\áÔ°ú_®	v¼½Y¼OšEi†°ª\ß\Ø):ûÂ¥‡\ÒýpK®·Ÿ«7‰ó@V–k\"’H\ÈOƒüIúðiaô¿\\\ë­\ç\ê\Ì\â|Õ‹š#©þ÷\rf\Ïr (»]^^„™‚BPUr<Ý·>u\î;±g£Y\Ã9\Ü}ª½\Û\Ëù¾Ž\ÊøŸ5FtX×¶\Ù\ëXž\\‡Ÿõb\è½/\×!\å¥\ç\ê\í\â|\Ð¢\Ú\Æ\ãŠ\ÈJA R	\î\å¿\n¶!ý\ßwð—\\\ï#þ;xŸ4\èfµÿ\0w’z\Û\ÏO\ßÀ\Çaô¾\ï\á\Ë\Èÿ\0Ž\Þ\'\Í3\Þ3ZÓ©=m\éQ÷ðy\Ë¥÷	n¼}]¼Ošg¼V´›_Ndó6ô¨ûø\\\å‹\Òû¿„:\Ûxú»xŸ4\ßx½g\å}8”/Ë›\È×€d°ú_wð—[/Wo\æ¦C\Ñ\íhø«\ÓÚ‰#jœi™M¥*Z/°¨\Ër­\Û\Ì\àó\Ö:PM\îþo*m˜\Ãä²´‘ZQ\Ä];rS²ƒ&§j¶v¤\äY™Nl\æ\äN*¯ \ì\Ø\ÊR\æ\Çô\Ñ\È&\æ÷\è4\ìn€\Ô\Â\ìK”¿o›U\ê\ÛDm`mH¦g:\r5Q\ß\Ë5, ó”)\ì\Ç3©j0Ÿ->Ú‘\Äl\ìUù‹¤\Ø\â\évk”mû¥õSõ—,S\åIzL\nr\êH…\×\nšŠ\ÚO$rò@\Æeá‘\à\îø…bË”\â›~K\ë8q\Ú\âz4{#N\ì]%N\Õ`#µdü\Z=‘ƒ»\Äv¦ˆ\Í\è‘\ìŒ6ÝµQ\Ú#Ñ£\Ù±›¶¦˜\Ì\Û\Ñ#\Ùa‰•ü#‚8Ýµ0\Åd\Û\à[öF\Zbº8\"$~Ò¡½\n9<\Øhù_ac\îŽ	\Ü\ãû\Å50£\ß\Ð5\ìN\"º8&´©%ö\r{„l\î…	{¶§1¿\'k\Ø<\Û;¡7¶¯ùv½ƒÍ³º\Æí«§M™\ïf\Ú=Í‰°UŒ žl¹»<þg\Êë’\Ðl4¦µ›SÒª¨M‡aù+F>\Ìf\Ù\Ý\nù{¶£3L†\Ê#Ÿ\ì\ÇÙ„bŽŸ„pCœ~Ò§&›ÿ\0•c\è\ÇÙ„!º8!\Î?iN¸WüÑ¢OÙƒ\Ì\Å\Ý\ç´¢¢“§ó8ÿ\0DŸ³6»£‚i‘ý\â‰\î<kÁŒ\è§\ìÄœ\Ä]ÁÀ&ó¯\ï(¨¢SŠE\àEúý˜B»ƒ€C“¼x¬›]²½È¡M÷\"ŽF$x²8_`;Uk¦\ã»(\ØÀ\ì \r\n…¡\ÎqQ\è:G‘\\¡Ó”¬——”¥Fl’iLN\ÑüÒ :•j¿ÿ\Ù'),(4,'ddr4',1,'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\á\0\äExif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0À\0\0\0\0\0\0\0\È(\0\0\0\0\0\0\0\0\0\0\0\0\0\0‚˜\0\0\0\0\0\0\0\Ð\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0H\0\0\0\0\0\0H\0\0\0Onliner.by\0\0ÿ\Û\0C\0\n\n\n\r\rÿ\Û\0C		\r\rÿÀ\0\0*\0ª\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿ\Ä\0K\0\n\0\0\0\0\0!1AQ\"23q’#Ra“¡\Ñ\Ò	$4BCSTb±\Â&\'6Dc‘Frƒ…¢Á\âÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0?\0\0\0\0\0\0\0!1AQa‘\"Rq\ÑST¡±Áð#2Br’\á$CD3b‚ñÿ\Ú\0\0\0?\0\×k?„S0\Zü\ÕR²\ÔHJ\Üi–f-\\`StnR’l|¤“`:X\\u\Ç?5\ã$R¹€\n\í7\",W•\Û\r®I\\ñSJSIl\×U“g?-B\Î\éuóøL®\àG¦<˜­\Üv\'qµfIl´I¥\Ôð\Éz‹’W=Š…°‡®\í~^å£P³*<\Ú\í@\ïQþgK\Üt“\Åt°\ÙZ(Øš\éIþøÙž\àû½?—ú\Ç¶ž(ô+!\ÓhòWµ‹5R_P¥f\n´\nº_l,¦z\Ó ¨¹·˜&\çfÒ•\ë\â\Ô6‡1\Ã;z\Üp\Ï…šN5¹i\Ôw­Æ¥á¿Ÿ\åTd9«—aC+ø^†\ã‹Jz\rÊ°¹=I\0“`/\ÎJ\ä l­`N³Šž\ê \rMI=sWö\ç~\Ì7\í9>‚—¨v-Žý\ß\Âxð\Ò\Ô{s\Ìy`ú©\Îý˜?i\Éô\ê‹c¿r_ð\Ë\Îul™[¥MªErdÄ¶˜³haQeù{Šw$¦\à€R®\ã‡}¢\\\Ò\×e\à¡\ê<p\Ï¶v‚\í\Z‚6\ãH\"±1¨õöUù-v¨\Ð\íp\Ìp­^¿+—¨c(\Ê÷\Z’x¯F†\ë±À\Ì&\å£\ÉU\æ\r\\\Ô\Í\Çb‘[ª?.Böqß”²\Ädö­|\î~DŽd÷bX\Ü	%\î4ó>\n\ágkc±Ùš^\ãJ–Œ-\Z\Ü\ï\ÖT\'5£R&s¢«VrFö4\Ðtø\Ä\ç~2F\ë6\ÝûM\É\ç\Ø9¿²@ó;\Í\0ù•I\Ñ=²\ÈþŠqŠ€b‘\ÛZ?+w\ëð)Õ½PWˆ\Ær½%2»\Ó&%\Å#¢þ‰÷q}—6½\Ã˜ûN\Äh4\n\æw\î	³ZˆŠ@À÷f÷aX\Þ\è\ï;UtkA^³jZ˜™)\n€+XjÈ³€_\Ó>»\Ù)\í\Ú6ùM°¨Ê†\ãñ? ‰m£³¶\Æ4á˜EOü\Þ+wi¦òžÞ«\ê2\çÆŠ¼\Ç0Far\ç)D	?«e\äj\Öp\ÒY„º¦§@®\åL\Ë,\æx\à17E^ü\0\ëÄz²sTó]‰üb¨ý9\Ä;WA\Ð\ìÞ‰¼Œ½U\Íwÿ\0T~œ\áT\íG¡\Ùýx\ÍS\ÍJÿ\0ˆ\ê_4…\Z©tXGö\Ç\0£¯QóÁ\ß_©.ÿ\0\ZJˆþx^Ôº<]ÁÀ.·%xI\ç,‚\ØE\"­PŽ­Û”=e…òÊ‚‘V%Žibü.+&\Ùr]öó÷ð´û(xŠ²@ü\":€\â \ÇrŸIZ’ —<G®G_\Ñ¾hqw\í	\è\\\'!n¦—¼L…rxW‰Z¥#ðƒ?S¤Â˜¬œ\ËJ\Â(¥I\×\áóëŽðà¸•\æT\ê\Ñd?\Zk\éUÍ®Ë±¿wf9ktE’c\Ô\åôo\"/­wp²ŒŸGx$~^\Å#iJˆP\æ:…˜Íªô|;JzR`¬¨†¸\Î)d¡Ò”÷v\à\Õ6…(ˆ÷\í\ÎP §x£ÿ\0¼¯\n¨a)¦ÿ\0¼¯\n¨\á)9¼Ÿ¯\n©a;PÜ‡ ƒij\ïƒQ± Ãµ\" KW!9Iù°¶«6\ã wWÊ¥pP\Âqa¯ˆ0£P–\ÃW?“RŽ£­†m\è\Ðpj–€¶˜›H5@°(î¡Žvi²pj†\0¡¸†‚\×û$\ì\rAW~­¯œ93›jf\æMþ	£\êH\ÂÚŸf\0\æ\ÊEûR,F\nf\03rk1\èL\Å%N”¤õZDò\é\å|X‚#3\ÃÀ¿/]v\'\Úe\Ì\èi:<\Î\å¬\ä¶\â«\'PŠã¤¬À`¨Û©\á§Jùq.¿D\Ó:v³¾Ö–\ÊLª+\Ô\Ð\äÕ¥\ç];\Çsˆ.\ç>…<‡,d\Þmû¶‘·\ä½Ký<—\rºhÎ¶|<\×«®\×7°·>\ìs«\ß–‡£zyM\Îó\ë2«³O Ñ ªd¹	p4\nŠ‚[AYJ¶(õ\ÚM‡!‹vx[.\'<\Ðÿ\0‹–¿\ïi\î\æE‘¸¥•\ØZ)\\©RiQZ\rU+¹‹¥™\"³·2š^–\Å&˜ô×½Ë«™ª.rC\rc §r\Õ~W¸I\é\×›<E®su\rF¹\êÔ¹\Ç_w¬Côi‘\á£x2\Ò\ãþ\ã«A\á™Ö‹§Z	GªdVkÙ¡\Ù\Ô÷%JS|T\ÆJc5µ´¤\í\Þò€\Üy\0,:+#{\É\ZwnJm\íÊ‹T6÷Y,®†\è.\í:¤Ò‡<-\ZuSkš/òýf‰CªNª\Ó+Uw¸\rG)¹\Ée+OÀ¾¥%¤… ¬„\íO;ß–¬°µ\Â7|\r6qPY¹E|Z¡š\×ø£$´°š\Ó@.4 gS–¥šg¼¡@È½FUM\ê\Îja\âÜ¥Cbl[º†\çW\ÞFÔŽœñFX\Ùfµv½ƒ\Ív7e\ál¼È´ˆ\ÄpV\â\Íî®¼\Z6V¤\î\\6+®–©Š\ÂNª{M\íë„£s‘AÃ”$£ÀŒ\Ü\É\Ñ\ØuôFi\×Úžp\Ù-¤¨¢{€7ù°\à*@U\å\Çž\ÑR4\Z\é«Ú¶Œ\ÅU\ÒLÍ©þ\'\"4\è”ÆŸf5\Z|–#À,6”§Œ´ðÊ\ÈQRº›Œj?¢¾l9¢¢”ñ^sdo(¬—g<\Ò\×<‚\â\×:J’{#:e•¤‰\Î\Úwžót¡Wi°(YqrÝ¨\Òk\Ä\"<†¸IJ\ÊF\Û,8”\Ü$Žª$÷‡\â³\Ê÷\Æ\àt‚7y¦tK\æ\í³YmvgºIp†½Ž«\ÄI©\Ï\"\Òs;±.MÕ¼ƒO¡W%\Z\Z‰˜\Â\"\Ñ\àÉŽ‰ó\ä-\çÆ\êœuHJnlI‘ÂŠH\0q\Â\0\Z+™$\ë>	—…\Õ{\É4L\çž÷HIyi,cCFMü5\'Nd©J\×L…˜¸Yq˜tô&¢òõ\ê\Ý&`4•ª\È`,¨\'oœ<\îX\Í\Ç6\0©\Ö@\0*Ÿb^\ÖZ\Û÷v£#\Þ\ç(3u\0µ\Ðt+,ç¨”Gó„‰”<Å\"e„¤¨A\áC2T ˜¥CPH&\ÖJ·\Í\Ý\Ò\ÈX_\ØÃ‡þ¾K>\Çd´‹(e¦9\Ì\Ûk&m*wŠ\rÉ´e\Ò\ÖÚ¤Òœ„\ê\Ú2¤\Ô=ÃƒSC®<¢²—W\Â% ’’„£h\ånC	²@\0s­\ÓðJ[²ú&Iƒ\\ð\ryÇ°€Üª= tÔš•K®\Z[™µs3e“”h4gò\ß\ÆbµEq‚\Ë\ä\ÊzIm\r›7m…¬	\'\Úat¥¢&\nm\ÏÆšû†ø²]PNmó¸K¤±øª)ù[ˆœ^5\Ï^KÖ‰t8Ž&]Ë&]+/\Å<} ‘¸­÷¹uj!?ÂŠ“µ±‘s¦“´\ëòö.\Ú\å}¦h]kµ.”\â\rî¶”hñ¦gy\\E&}.e\Ê\Ë\ÍI\âe[ˆj\ÙG|P¢]I\Ü|ž\îx±`mdq\Ýó\\Ÿ/¥¥†ö¿\à\Ó\æ¿D\èù£ÁT\Ò š}\"a.`=£oS~–\ëú5xM\\¾@ðƒ\Ð\á\àÿ\0­ˆ¡&·\î÷À5øŽ\á—s\àö\îUí³­ùß¦3/ýÇ\Ðù.á£¼\×u~K‘Jü³Ø€9ªý¸\æW\Ñ`©l\Õ_‹C\Ëz<Y\0qY\â¥\í¦\ãrA±·^}0ª\à0\n7G\Ü\Ù^\ÐKt3\ÓC«z?ª„¦f\Ò3\n *I\à·\"\Ò\ÙxüP¤‘»Õ‰Z&ŒÚ‚³¦–\ì¶D\Ó;˜ö8\ÐW	\ÛtŸh\î¢\Õ\ëŽTX{1Ì¨-À–&¶\äÕºTw%£\Ðó\0ö\à9\ÓW“C\ïF\Ïf»D˜,\ìf(Î††Õ¤øh${QÑ+ˆE1)«\Í	¥«|\ÇQñUw·\Ï\Èù°\ÞvL»G-”\æ\ï²!17\ï?Cµú¶ûU\\©\î\Ì}\Ç\ßqO<\ê\Ê\Üqjº”¢nI=¤“ˆ‰\'2¯\Æ\Æ\Æ\Ð\Æ\nIv\ç	<§‡\0Á¢Œš¥\âóù0Td¯)\í¸)ºPW&Ý¸TMQ’o{\á\ÔIDzU\Ç\"oƒD•c\ï’O;a\ÔF¡-2**R\Ã+ž\'1e\r’\á$ýXsZI¢­<ü\Óqa.\ÜO\Éupt\ê•&Ê—¨yZ;l\ì‡T>d³ÿ\0¼Y“ù€ö¬	oy“,’»\Ø\Ññr\è`P4k+\Ùú\Ön¬f÷‘\ÏÄ¨”ó¥\â\ë¦öõ[ano’¾\æVD¶\ëú\ÓÙ³Y›\Ú÷kU\Âü.¥\å…D¦\ä\\­K\Ëe‡w»Oqu\ÎYAõžñÔŽ)é‰…¬EÙ´IY‡’¢\Ø]5\ç;¤”Œˆ\È7ô\Ü7.Uh\ÔlÁ\ÍùA>^«-M»MYº\é’Àº\ãžôw ö¦\ãôq^V4Žr=V\Ãõ¡tMª\Ò\Ò\ë\r¸\ÖVhv§·@wŽ§\rG\Åg\Ôü½;gŸ–¦\Ì4\è•j³1^”·eZV7X\\Ï–.X{8\Ýà¸ž^¿Fõ€_£\Ï\\I¦Ä‚Þ¦\É[q™C)RŒ[”€	\çòcgñük\ã<\ã¡:›”#\åü\Ð\å\0Ô™\ÍJx\Ó[iÿ\0}I±t ¤–ÁP\ë\È\Øò\Æ}¤Fø¾õ\ØFš®’\ä½%º-f\ÑgŒ=\ÄC]{)à©•“uMiHkNj‰#\Î.0»P–:\ç8^Ž\î\\\Ú\Ë@eŒW]\\i\ì\É/\â¬:’“§U“\äb¹cõ\áRÁ\éÂ®÷‰Ë¢7‰^kMõTp‚t\ÚX\áy-\Ú\Z†\Ïùyù?6l\'ü…\\-­\r\ÂÀ£N^=ˆ\Íé¾­´Nf6¢£¶*“rz“\åuùpA\×:s9ix0’\ËtÐœüv¥÷»\Õ\ãkiô\á~ö÷°\Ê\ÝþŸë‚—®×§ª·‰ó^÷·\Õ\Õ\0&‹ÿ\0¢¯¿†â»½?\×z\ízú£xŸ4ƒN5tA–o\Þ\Ñÿ\0\Ï\î:\'ú\à\å½\ë\ê­\â|\ÓÓ¦Ú¾¢mer=­‘q\í\á\ß\Ðzo®	‡–×Ÿª·‰óON™\ëºd{PGõ\áÔ°ú_®	v¼½Y¼OšEi†°ª\ß\Ø):ûÂ¥‡\ÒýpK®·Ÿ«7‰ó@V–k\"’H\ÈOƒüIúðiaô¿\\\ë­\ç\ê\Ì\â|Õ‹š#©þ÷\rf\Ïr (»]^^„™‚BPUr<Ý·>u\î;±g£Y\Ã9\Ü}ª½\Û\Ëù¾Ž\ÊøŸ5FtX×¶\Ù\ëXž\\‡Ÿõb\è½/\×!\å¥\ç\ê\í\â|\Ð¢\Ú\Æ\ãŠ\ÈJA R	\î\å¿\n¶!ý\ßwð—\\\ï#þ;xŸ4\èfµÿ\0w’z\Û\ÏO\ßÀ\Çaô¾\ï\á\Ë\Èÿ\0Ž\Þ\'\Í3\Þ3ZÓ©=m\éQ÷ðy\Ë¥÷	n¼}]¼Ošg¼V´›_Ndó6ô¨ûø\\\å‹\Òû¿„:\Ûxú»xŸ4\ßx½g\å}8”/Ë›\È×€d°ú_wð—[/Wo\æ¦C\Ñ\íhø«\ÓÚ‰#jœi™M¥*Z/°¨\Ër­\Û\Ì\àó\Ö:PM\îþo*m˜\Ãä²´‘ZQ\Ä];rS²ƒ&§j¶v¤\äY™Nl\æ\äN*¯ \ì\Ø\ÊR\æ\Çô\Ñ\È&\æ÷\è4\ìn€\Ô\Â\ìK”¿o›U\ê\ÛDm`mH¦g:\r5Q\ß\Ë5, ó”)\ì\Ç3©j0Ÿ->Ú‘\Äl\ìUù‹¤\Ø\â\évk”mû¥õSõ—,S\åIzL\nr\êH…\×\nšŠ\ÚO$rò@\Æeá‘\à\îø…bË”\â›~K\ë8q\Ú\âz4{#N\ì]%N\Õ`#µdü\Z=‘ƒ»\Äv¦ˆ\Í\è‘\ìŒ6ÝµQ\Ú#Ñ£\Ù±›¶¦˜\Ì\Û\Ñ#\Ùa‰•ü#‚8Ýµ0\Åd\Û\à[öF\Zbº8\"$~Ò¡½\n9<\Øhù_ac\îŽ	\Ü\ãû\Å50£\ß\Ð5\ìN\"º8&´©%ö\r{„l\î…	{¶§1¿\'k\Ø<\Û;¡7¶¯ùv½ƒÍ³º\Æí«§M™\ïf\Ú=Í‰°UŒ žl¹»<þg\Êë’\Ðl4¦µ›SÒª¨M‡aù+F>\Ìf\Ù\Ý\nù{¶£3L†\Ê#Ÿ\ì\ÇÙ„bŽŸ„pCœ~Ò§&›ÿ\0•c\è\ÇÙ„!º8!\Î?iN¸WüÑ¢OÙƒ\Ì\Å\Ý\ç´¢¢“§ó8ÿ\0DŸ³6»£‚i‘ý\â‰\î<kÁŒ\è§\ìÄœ\Ä]ÁÀ&ó¯\ï(¨¢SŠE\àEúý˜B»ƒ€C“¼x¬›]²½È¡M÷\"ŽF$x²8_`;Uk¦\ã»(\ØÀ\ì \r\n…¡\ÎqQ\è:G‘\\¡Ó”¬——”¥Fl’iLN\ÑüÒ :•j¿ÿ\Ù');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specification`
--

DROP TABLE IF EXISTS `specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specification` (
  `spec_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(45) DEFAULT NULL,
  `measure_id` bigint(11) NOT NULL,
  PRIMARY KEY (`spec_id`),
  KEY `fk_specification_measure1_idx` (`measure_id`),
  CONSTRAINT `fk_specification_measure1` FOREIGN KEY (`measure_id`) REFERENCES `measure` (`measure_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specification`
--

LOCK TABLES `specification` WRITE;
/*!40000 ALTER TABLE `specification` DISABLE KEYS */;
INSERT INTO `specification` VALUES (1,'frequency',3),(2,'with',1),(3,'size',2);
/*!40000 ALTER TABLE `specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `vendor_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `fk_user_vendor1_idx` (`vendor_id`),
  CONSTRAINT `fk_user_vendor1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,NULL,'111111',NULL,NULL,'rsivitsky@gmail.com',NULL,'ROLE_ADMIN',NULL),(150,NULL,'123456',NULL,NULL,'renek77@mail.ru',NULL,'ROLE_ADMIN',NULL),(155,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `vendor_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(45) DEFAULT NULL,
  `vendor_phone` varchar(45) DEFAULT NULL,
  `vendor_email` varchar(45) DEFAULT NULL,
  `vendor_addr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`),
  UNIQUE KEY `idvendor_UNIQUE` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='vendor of goods';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (5,'Sony',NULL,NULL,NULL),(6,'TDK',NULL,NULL,NULL);
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

-- Dump completed on 2016-07-21 22:22:03
