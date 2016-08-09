USE offersdb;
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
INSERT INTO `part` VALUES (1,'ddr2',2,'�\��\�\0JFIF\0\0d\0d\0\0�\�\0\�Exif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\�(\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\�\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0d\0\0\0\0\0\0d\0\0\0Onliner.by\0\0�\�\0C\0\n\n\n\r\r�\�\0C		\r\r��\0\0&\0�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0?\0\r\0\0\0\0\0!1\"AQa2q�#B���3�\�	$5CRSb���\�\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\05\0\0\0\0\0\0\0!1AQa��q���\�\"#2R�\�3�B�\�\0\0\0?\0\�\�\Zlʡ�A�\�cfg%ψ�N��\�`6\�q�I9X�\�\�D�yAX����>�BBa;�\0��a\�J�\��;�(\0m��Êy?v�v\Z�\n\0�\����\�\n\�!\�%ϞR����s=^4�̝\�S:Ȗ�1م���\�a�+.�ܳ�,\�R@/�_�V����\�F\�_\\(�`\0L2H\0�����\�\�H��S5\�;jM�\�A��\���\�Ө���<���=\��\�\�Wq�7\�@Vb\�(M\n6\�pO�\�w��Q��.	��o\�\�\�@{�\�\Z$OHL�.\���ۣ\�u�V�\0�b�( \��sk\�\n�\�\�\n;lŭ\�\�OS\�\Z!�n˪\�\�\�\��I��SO����\0m��:\���i\�2�Ѫ�}\� ��\�\�ſ���+J�/�\��!��\�\�\�\0J%\��G�\�,�\��p�O:J��]$f��!s�7\�\�\"\�ن\�~�y*\�t5\�v`\0f��(��C8\'��M�\���Ә\�<d���\�	.ֶ\�\�\�F\�\�]\�-�\0J�a�\�̠\�xIʛ0�����[~�LURV�h����[��\0϶9E`�&dUT\�	\�ǹ���.@T��\�X���ÈRSs\�Q�.NR׻�{�G�\�<����i\�s�\�\�J�\��UH��	\']3���&f,,uk�秞9!@f��$ΐ��qw,\�`f�m�5\�ev\�6�\�Fb\�\�JXP\�\0 ��g\�\�z\\ʪ���h\�\�\���\�z��\�K\�#Q_*R%� H\�M|�Ւ�nf�5|N��O��\��#\���Q��b�����\\\�\�\�\�\�n[�Pϗ\��ʰ���\�f\Z$u����J�b\�\�L\�&`e�\�\�\�\�\�Ƽ�\�^x\�uUŔY�gT��\�\�E�\�I�I\�\�$�R;�\0�\'\�	M:�~#\�p\�)��- Xl:ۆ�r�\�\ZE\�Y�$3^#�>�cb�A=\0[\�\�L��:Z&\�\����LH\�gپ�d\�;�{8�3Vey�ұ�o�\�\r�v|2e��_\�!ʠ���Q���\�(�rf��Ò\�ŷ9\�Y��|8\�A\�!WCL�\�(\r\�\�]��M���^U�Ƞ�3���f,I���I��H��\r8m*�#��0�\0���\��\�y����\�Y��0\\���\r�:rI(xD\���r���/\�s\�@Kޤ �}wس\�\����\"�]#�N\'\�~�\�ӝ�yq���\�d9&a�\��52\�\�W�u���7Grăq\�\�\�e�ғ,emms�\"D���\�\0%\�\�\��q�+\��κ^����Y-1F\�گ�e?�\�z�Nʑk{F\ZJ%\��R�\�=\"j��c\�*�\�MՀ_!�\�e)ԑsVD\�$\�s�y\�eE/SM�բx�\�7#^\�\�I l�K�H3R�Dk0\�(�U-H)\�x�:���2�+3:x)�\\ګ��K\�iXh����1s\�\���\�#rh�\�.�\�7#�\�\��J\�U+�(\�H^�,߻��\�lg�Qp4}�\�I*(q�\��նY���fy����gV�M�2��\�\�{�~\�\�v2\��=(Qӳ�b\�9�k�٭t;,�V\�$�L\�bnW\�`N�jo�\�-Ii\�P,\�\�\�bq1.MZ\�,��\Zua\�i�\�\��j�aSO\n1*Y\�YE���\�݋9\�d�� �\�PRH4�*@.7>�e\�NaZs\n���Y\"1\r�BAVfV]\����\�-bP����+1�R%*O\�\0$��߫��\�&{�f\\X\�k*��&��,v�\�|�JD%E`�0iW%JRA/�u��Emd<O�By#���ݴj�_#�\�}RR�D� p�\Z\��%Ж �\0x\�L5y�\�ҪK-T�\0�l�\�bz��S����\�V\"Te+Va��Q�\��y�UE�X�,��H�!E\�͈ʧ�THG\\\� �>���!]y\�{\�~<\���\�U\�TsȠ��X�?l�\�\0}.b�a��Q[0\�|Ůl,\"�\�o�\r\�\\ߏ�㊉���9)ޒU���X��0:�6q\�\�5\�\n�BI�AP�R\�ʠ\r�\��l\�F\�\�Z>\'��\�+�M\���a��hF�D��Ґ���.|\�J���$\�ܬ�yK}&���XD\�B݌t���\"ŭ�\�\ZSv\�\�l\�<p�!6\n2��^�ZR�2�D��`6k\�_��*�\�1�\����cq�L\�k,\r5\�\�_fv(�=�9\\*�3l\�5���{o\'����8����()i�K?u�]\�+�;y��;z����I,;Γ(V{\�\�X��Vv\�\�2{>�p\�sY]�\�b���\�51jn�	�:\0\0\0�\�$��ÜM\�e\�s\rKp\�i,����gE\�ψ1$�#c�\�PH�}�&Q�R����Z,T\��EO�\�e�\�n�䡻�HY\n\�\�\�\������.\�2\�\�\"&�T\�UU)�\0ݲ+�ȊY�.#rI�\�B/�as��\�\�G\�\�\�\�\\�\�vIv{=���wjّ��tpnT�A�{\��-�Q\�]�	lØ�\�\ZZ��1��a�#�\�as\�KmlfT>\�\���\0�\�j�*Z��Spg\�\�0Z���J)\�G��0�w\"\��\�\�nc\�{Il\�C��k�PU|�\�\n\�&y4l.M�����\�H\n�\�6F�*+����k\�g���;i)3z����\�v\�6B.yz��\�\�CvI�ZƷ\r�,Q\�CM\�,|��g\�\�\n+Er�\�$M`5�\���7�\"W�JH\��yEN8�\�*T��I;-\�q�T\��3\�%,Ϫ1\�]H�v\�Q\0��?&Ҥ�*;v\��\�%�d��Q��+!6;����A�O\��R�*�\�o\�r��\�+㪥r%��I�\�\�\�\�_n��\�|\�	\�\"���\�\�Sh#�){a�nJhY��-�\�ۯˁ~2v�\�C�k�\0�rO\�c\�\��\�x���\�#�H\�9u��¨�+��\�LJ��\�\��\�.�N���B��\�n�n�\�\�]L7e�/\�Վ��\�\�)@X��\�\�cu�uCĒQ4�E����\0�\�\�\�\�\�q�u�;�Y�\�悢Y\nAb�\�f��\�g\�M8y\"�w\� \�\�\�f_��c�2f+W�\��\�7�i��!\�Qg�%Dr$e:W_\�`w��\'�\�\r�\�\�ݕ	A�\�\����(,�QS�=\�9%��ʆP\�\�걿�O�K]�]\�Ɗ�he�:/#�\�嫕#JR�լ\�\��[i$��)���\�\�>B���cfk���Lə\�OM!�ݔ20��E�X\�o\\/-�#�Q^f̐;\0:n>\�c�abP6��\'l��D`�jX?�\�\�\0��Jl���`��\�\�\������;��\����zE�\�sRRV�6\�3��yD\\?\r\�K6cR�+\�(�w���\�\�N�;�\�6\�B�\0(�E칉�\n\�f�>\�ՠ�qm�j\�g�\�\0�V*����\�zb7f�����&�a*.Rx=�\�L҂�\�⁂���ߧ���p\"2e�J���_��\�UgI�冀\�\���,tz�]7-\�\�.o�߮�\�\�a\�%Ң�b.X9E\�{\�;\�\�FY\�H7\�ܟ|RJ��\0\�KV8�)���\�J^/���\�\�uZa\"M�\�X_��\0ϖ�\�-d��n��\n�+2\�8\�\�\��\�H\�\�S\��r\�m�z�N\�\n�*6\"3��\�`\�~O�\�\�\�Oj6�;��\�\r[[�\�o�8IP\�\��êe()%�n8?��\"�8��������2�\�%\�ksb�LqB��[\�L\�\�,�\��\�3\n��-\r�\�-\�;\��\�\�\�\n%��cהp��N�\�u��œ�s�ɳ���)R�\�j��\��++ףU�-�a�VV��\�Cf��JbD�a�#f�k\�\��)\'.\�A�\'\�\�>b\�+H�rN�\�hf\�\�I��K�\0��~ᨶ\�\�̟&\��\01��ᜧ�\��fJL��\�T�z�a:�Q�@��rI\0��k�z\�\�I�3�j\0\�}�8\"\��\n�T\�$���.T��x*IX�^r�\�f�]��Q�}��F=\\�\�=~cЎ	L\�V�c\�f\��\�����fs�^\�0un5|�p\���{\��V	L\�~#^Q\�\�\�#��\�3��_STFN����\�\�p��_�A�R�ٕ�Q��5�I\�g�\�!!�\���\0��osn\�\���\�k�\�z��gW1�����\0!1�Vj�R\�D�\\_s�<���4c�\����\�*R�λq\Z�vl\�:2�C[�\�(M*VH�;�H�{aU�\�/V x�\��\�\�k�t��m`MȌ�Y$�a�x�\'\\W̏�\�u 0���K�G�����x���p!�:�눨�ډᇅ\�3(�\�t���\�F�^\�\��Z\�\\�����F�^5�Q\�ԉr�\0R\�}\��!��G\��\0!\�2ܺ���3��Zh\�O\�] �+�F�m\�/��\�)Z��g;8�\�ƃ\��9Բg-k%II�Q\�f\�Oٛ��\�5�~��\�\���\��\�b����JMa\�\�7�\�\n^\�*�\"�\�\�_�]C�Z����\�b7Ȍ8\�U\���P\��\�,�s-�f���of^��I\�ͧ��\�%B��@nS\�o�\�w�mݭ\�_M\���;o({4���H\rVo\n\�]a�1>d\��a��\�n\��?D��\�|A�;4��ZTf�)\n��\�\�\���`�\Z�G�;�\�r\�mG\�vg\�sy�;X �\�\�}��p��aq\�T��\0Jѵ\Zn\�Iً�����C~��=�7�\�ӯO\\7��oq\�	ܔ��R�\�r\�H�\'g.v:\�s�:�I�=\�n�/}V��=a\��Q�\�\�|CJ�μ+*�Rŵ�d�s��\�\�>\�Ucu���X^\�$�\�~#\�K\�Ǆ���9R��E�\�\���\�u�oX\n�\n5��Z�A\�>\"6~\�U�VqQ�qg\�$§,��[3wDF�\0��c� X\�\��\\\�+��\�O���S)h\n)Q�q�M\�\�y/\"\�h)�\�)`���%����g1F�B\�7� _\�R\�\r�\�gv�f)h,	$_a��\�'),(2,'ddr3',2,'�\��\�\0JFIF\0\0H\0H\0\0�\�\0\�Exif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\�(\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\�\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0H\0\0\0\0\0\0H\0\0\0Onliner.by\0\0�\�\0C\0\n\n\n\r\r�\�\0C		\r\r��\0\0*\0�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0K\0\n\0\0\0\0\0!1AQ\"23q�#Ra���\�\�	$4BCSTb�\�&\'6Dc�Fr����\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0?\0\0\0\0\0\0\0!1AQa�\"Rq\�ST�����#2Br�\�$CD3b���\�\0\0\0?\0\�k?�S0\Z�\�R�\�HJ\�i�f-\\`StnR�l|��`:X\\u\�?5\�$R��\n\�7\",W�\�\r�I\\�SJSIl\�U�g?-B\�\�u��L�\�G�<��\�v\'q�fIl�I�\��\�z��W=�����\�~^坣P�*<\�\�@\�Q�gK\�t�\�t��\�Z(ؚ\�I��ٞ\���?��\���(�+!\�h�W��5R_�P�f\n�\n�_l,�z\������&\�fҕ\�\�\�6�1\��;z\�p\���N5�i\�w�ƥ῟\�Td9��aC+�^�\�Jz\rʰ�=I\0�`/\�J\� l�`N���\� \rMI=sW�\�~\�7\�9>���v-��\�\�x�\�\�{s\�y`��\���?i\��\��c�r�_�\�\�ul�[�M�ErdĶ��haQ�e�{��w$�\��R�\�}�\\\�\�e\�\�<p\��v�\�\Z�6�\�H\"�1���U�-v�\�\�p\�p�^�+��c(\��\Z�x�F�\��\�&�\�\�U\�\r\\\�\�\�b�[�?.B�qߔ�\�d��|\�~D�d�bX\�	%\�4�>\n�\�gkc�ٚ^\�J��-\Z\�\�\�T\'5�R&s��VrF�4\�t�\�\�~2F\�6\��M\�\�\�9��@�;\�\0��I\�=�\���q��b�\�Z?+w\��)սPW�\�r�%2�\�&%\�#����q}�6�\���N\�h4\n\�w\�	��Z��@��f�aX\�\�\�;UtkA^�jZ��)\n�+Xjȳ�_\�>�\�)\�\�6�M��ʆ\��? �m���\�4ፘEO�\�+wi��ޫ\�2\�Ɗ�\�0Far\�)D	?�e\�j�\�p\�Y����@��\�L\�,\�x\�17E^�\0\�ĝz�sT�]��b��9\�;WA\�\�މ���U\�w�\0T~�\�T\�G�\��x\�S\�J�\0�\�_4�\Z��tXG�\�\0��Q��\�_�.�\0\ZJ��x^Ժ<]��.�%xI\�,�\�E\"�P��۔=e��ʂ�V%�ib�.+&\�r]�����(x��@�\":�\� \�r�IZ���<G�G_\��hqw\�	\�\\\'!n���L�rxW�Z�#��?S���\�J�\�(�I\�\��뎏�ต\�T\�\�d?\Zk\�Uͮ˱�wf9ktE�c\�\��o\"/�wp���Gx$�~^\�#iJ�P\�:��ͪ�|;JzR`����\�)d�Ҕ�v\�\�6�(��\�\�P �x��\0��\n�a)��\0��\n�\�)9���\n�a;P܇ �ij\�Q� õ\" KW!9I�����6\�wWʥpP\�qa��0��P�\�W?��R����m\�\�pj�����H5@�(vi�pj�\0������\��$\�\rAW~���93�jf\�M�	�\�H\�ڟf\0\�\�E�R,F\nf\03rk1\�L\�%N����Z�D�\�\�|X�#3\���/]v\'\�e\�\�i:<\�\�\�\�\'P�㤬�`�۩\�J�q.�D\�:v��֖\�L�+\�\�\�ե\�];\�s�.\�>�<�,d\�m����\�K�<�\r�hζ|<\���\�7��>\�s�\����zyM\��\�2��O�Ѡ�d�	p4\n��[AYJ�(�\�M�!�vx[.\'<\��\0���\�i\�\�E����\�Z)\\�RiQZ\rU+����\"��2�^�\�&��׽˫��.rC\r�c��r\�~W�I\�\��<E�su\rF�\�Թ\�_w�C�i�\�x2\�\��\�A\�֋�Z	G�dVk١\�\��%JS|T\�Jc5���\�\��\�y\0,:+#{\�\ZwnJm\�ʋT6�Y,��\�.\�:�҇<-\ZuSk�/���f�C�N�\�+Uw�\rG�)�\�e+O���%�� ��\�O;ߖ���\�7|\r6qPY�E|Z��\���$���\�@.4 gS���g��@ȍ�FUM\�\�ja\�ܥCb�l[��\�W\�FԎ��FX\�f�v��\�v7e\�l�ȴ�\�pV\�\��\Z6V�\�\\6+����\�N�{M\�넣s�AÔ$���\�\�\�\�u�Fi\�ڞp\�-���{�7��\�*@U\�\��\�R4\Z\�ڶ�\�U\�Lͩ�\'\"4\�Ɵf5\Z|�#�,6�����ʍ\�QR���j?��l9�����^sdo(��g<\�\�<�\�\�:J�{#:e���\�\�w��t�Wi�(Yqrݨ\�k\�\"<��IJ\�F\�,8�\�$��$��\�\��\�\�t�7y�tK\�\�Ymvg�Ip�����\�I�\�\"\�s;�.Mռ�O�W%\Z\Z��\�\"\�\�Ɏ��\�-\�Ɛ\�uHJnl�I�H\0q\�\0\Z+�$\�>	��\�{\�4L\��HIyi,cCFM�5\'Nd�J\�L���Yq�t�&���\�\�&`4��\�`,�\'o�<\�X�\�\�6\0�\�@\0*�b^\�Z\��v�#\�\�(3u\0�\�t+,稔G󄉔<Ő\"e���A\�C2T���CPH&\�J�\�\�\�\�X_\�Ç��K>\�d��(e�9\�\�k&m*w�\rɴ�e\�\�ڤҜ��\�\�2�\�=ÃSC�<���W\�% ����h\�nC	�@\0s�\��J[��&I�\\�\ryǰ�ܪ=�tԚ�K�\Z[��s3e��h4g�\�\�b�Eq�\�\�\�zIm\r�7m��	\'\�at��&\nm\�ƚ����]PNm�K����)�[��^5\�^K։t8�&]ˏ&]+/\�<} �����uj!?�����s���\���.\�\�}�h]k�.�\�\rh�gy\\E&}.e\�\�\�I\�e�[�j�\�G|P�]I\�|�\�x�`mdq\��\\�/�����\�\�\�D\����T\� �}\"a.`=�oS~�\��5xM\\�@��\�\�\��\0���&�\����5��\�s\��\�U��ߦ3/�ǁ\��.᣼\�u~K�J��؀9���\�W\�`�l\�_�C\�z<Y\0qY\��\�\�rA��^}0�\�0�\n7G\�\�^\�Kt3\�C�z?���f\�3\n�*I\�\"\�\�x�P���ՉZ&��ڂ���\�D\�;��8\�W	\�t�h\�\�\�TX{1̨-��&�\�պTw%�\��\0�\�9\�W�C\�F\�f�D�,\�f(Ά�դ�h${Qѝ+�E1)�\�	��|\�Q�Uw�\�\���\�vL�G-�\�\�!17\�?C����U\\�\�\�}\�\�qO<\�\�\�qj���nI=����\'2�\�\�\�\�\�\n�Iv\�	<��\0�����\���0Td�)\�)�PW&ݸTMQ�o{\�\�IDzU\�\"o�D�c\�O;a\�F�-2**R\�+��\'�1e\r��\�$�XsZI��<�\�qa.\�O\�upt\�&ʗ�yZ;l\�T>d��\0�Y�����	oy�,��\�\��r\�`P4k+\��\�n�f��\�Ĩ���\�\���[ano��\�VD�\��\�ٳY�\��kU\��.�\�D�\�\\�K\�e�w�Oqu\�YA���Ԏ)鉅�Eف�IY���\�]5\�;����\�7�\�7.Uh\�l�\��A>^�-M�MY�\���\��w ��\��q^V4�r=V\���tM�\�\�\�\r�\�Vhv��@w��\rG\�g\���;g���\�4\�j�1^���eZV7X\\ϖ.X{8\�พ^�F���_�\�\\�I�Ăަ\�[q�C)R�[���	\��cg��k\�<\�:��#\��\�\�\0ԙ\�Jx\�[i�\0}I�t ���P\�\�\��\�}�F���\�F���\�%�-f\�g�=\�C]{)੕�uMiHkNj�#\�.0�P��:\�8^�\�\\\�\�@e�W]\\i\�\�/\��:���U�\�b�c�\�R�\����ˢ7�^kM�Tp�t\�X\�y-\�\Z�\��y�?6l\'��\\-�\r\���N^=�\�龭�Nf6���*�rz�\�u�p�A\�:s9ix0�\�tМ�v���\�\�ki�\�~���\�\���낗�ק����^��\�\�\0&��\0����⻽?\�z\�z��x�4�N5tA�o\�\��\0\�\�:\'�\��\�\�\�\�|\�Ӧھ�m�er=��q\�\�\�\�zo�	��ן����ON�\��d{PG�\�԰�_�	�v��Y�O�Ei���\�\�):�¥�\��pK����7��@V�k\"�H\�O��I��ia��\\\�\�\�\�\�|Ջ�#���\rf\�r�(�]^^���BPUr<ݷ>u\�;�g�Y\�9\�}���\�\����\���5FtX׶\�\�X�\\���b\�/\�!\�\�\�\�\�|\��\�\�\�\�JA R	\�\�\n�!�\�w�\\\�#�;x�4\�f��\0w�z\�\�O\��\�a��\�\�\�\��\0�\�\'\�3\�3Z�ө=m\�Q��y\���	�n�}]�O�g�V��_Nd�6����\\\�\����:\�x��x�4\�x�g\�}8�/˛\�׀d��_w�[/Wo\�C\�\�h���\�ڐ�#j�i�M�*Z/��\�r�\�\�\��\�:PM\��o*m�\�䲴�ZQ\�];rS��&�j�v�\�Y�Nl\�\�N�*� \�\�\�R\�\��\�\�&\��\�4\�n�\�\�\�K��o�U\�\�Dm`mH�g:\r5Q\�\�5,��)\�\�3�j0�->ڑ\�l\�U����\�\�\�vk�m���S��,S\�IzL\nr\�H�\�\n��\�O$r�@\�eᝑ\�\���b˔\�~K\�8q\�\�z4{#N\�]%N\�`#�d�\Z=����\�v��\�\�\�6ݵQ\�#ѣ\��������\�\�\�#\�a���#�8ݵ0\�d\�\�[�F\Zb��8\"$~ҡ�\n9<\�h�_ac\�	\�\��\�50�\�\�5\�N\"��8&��%�\r{�l\�	{��1��\'k\�<\�;�7����v���ͳ�\��M�\�f\�=͉�U���l���<�g\�덒\�l4���SҪ�M�a�+F>\�f\�\�\n�{��3L�\�#�\�\�لb���pC�~ҧ&��\0�c\�\�ل!��8!\�?iN�W�я�Oك\�\�\�\�������8�\0D��6���i��\�\�<k��\�\�Ĝ\�]��&�\�(��S�E\�E���B���C���x��]��ȡM�\"�F$x�8�_`;Uk�\�(\��\� \r\n��\�q�Q\�:G�\\�Ӕ�����Fl�iLN\��Ҡ:�j���\�'),(3,'new memory',1,'�\��\�\0JFIF\0\0H\0H\0\0�\�\0\�Exif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\�(\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\�\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0H\0\0\0\0\0\0H\0\0\0Onliner.by\0\0�\�\0C\0\n\n\n\r\r�\�\0C		\r\r��\0\0*\0�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0K\0\n\0\0\0\0\0!1AQ\"23q�#Ra���\�\�	$4BCSTb�\�&\'6Dc�Fr����\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0?\0\0\0\0\0\0\0!1AQa�\"Rq\�ST�����#2Br�\�$CD3b���\�\0\0\0?\0\�k?�S0\Z�\�R�\�HJ\�i�f-\\`StnR�l|��`:X\\u\�?5\�$R��\n\�7\",W�\�\r�I\\�SJSIl\�U�g?-B\�\�u��L�\�G�<��\�v\'q�fIl�I�\��\�z��W=�����\�~^坣P�*<\�\�@\�Q�gK\�t�\�t��\�Z(ؚ\�I��ٞ\���?��\���(�+!\�h�W��5R_�P�f\n�\n�_l,�z\������&\�fҕ\�\�\�6�1\��;z\�p\���N5�i\�w�ƥ῟\�Td9��aC+�^�\�Jz\rʰ�=I\0�`/\�J\� l�`N���\� \rMI=sW�\�~\�7\�9>���v-��\�\�x�\�\�{s\�y`��\���?i\��\��c�r�_�\�\�ul�[�M�ErdĶ��haQ�e�{��w$�\��R�\�}�\\\�\�e\�\�<p\��v�\�\Z�6�\�H\"�1���U�-v�\�\�p\�p�^�+��c(\��\Z�x�F�\��\�&�\�\�U\�\r\\\�\�\�b�[�?.B�qߔ�\�d��|\�~D�d�bX\�	%\�4�>\n�\�gkc�ٚ^\�J��-\Z\�\�\�T\'5�R&s��VrF�4\�t�\�\�~2F\�6\��M\�\�\�9��@�;\�\0��I\�=�\���q��b�\�Z?+w\��)սPW�\�r�%2�\�&%\�#����q}�6�\���N\�h4\n\�w\�	��Z��@��f�aX\�\�\�;UtkA^�jZ��)\n�+Xjȳ�_\�>�\�)\�\�6�M��ʆ\��? �m���\�4ፘEO�\�+wi��ޫ\�2\�Ɗ�\�0Far\�)D	?�e\�j�\�p\�Y����@��\�L\�,\�x\�17E^�\0\�ĝz�sT�]��b��9\�;WA\�\�މ���U\�w�\0T~�\�T\�G�\��x\�S\�J�\0�\�_4�\Z��tXG�\�\0��Q��\�_�.�\0\ZJ��x^Ժ<]��.�%xI\�,�\�E\"�P��۔=e��ʂ�V%�ib�.+&\�r]�����(x��@�\":�\� \�r�IZ���<G�G_\��hqw\�	\�\\\'!n���L�rxW�Z�#��?S���\�J�\�(�I\�\��뎏�ต\�T\�\�d?\Zk\�Uͮ˱�wf9ktE�c\�\��o\"/�wp���Gx$�~^\�#iJ�P\�:��ͪ�|;JzR`����\�)d�Ҕ�v\�\�6�(��\�\�P �x��\0��\n�a)��\0��\n�\�)9���\n�a;P܇ �ij\�Q� õ\" KW!9I�����6\�wWʥpP\�qa��0��P�\�W?��R����m\�\�pj�����H5@�(vi�pj�\0������\��$\�\rAW~���93�jf\�M�	�\�H\�ڟf\0\�\�E�R,F\nf\03rk1\�L\�%N����Z�D�\�\�|X�#3\���/]v\'\�e\�\�i:<\�\�\�\�\'P�㤬�`�۩\�J�q.�D\�:v��֖\�L�+\�\�\�ե\�];\�s�.\�>�<�,d\�m����\�K�<�\r�hζ|<\���\�7��>\�s�\����zyM\��\�2��O�Ѡ�d�	p4\n��[AYJ�(�\�M�!�vx[.\'<\��\0���\�i\�\�E����\�Z)\\�RiQZ\rU+����\"��2�^�\�&��׽˫��.rC\r�c��r\�~W�I\�\��<E�su\rF�\�Թ\�_w�C�i�\�x2\�\��\�A\�֋�Z	G�dVk١\�\��%JS|T\�Jc5���\�\��\�y\0,:+#{\�\ZwnJm\�ʋT6�Y,��\�.\�:�҇<-\ZuSk�/���f�C�N�\�+Uw�\rG�)�\�e+O���%�� ��\�O;ߖ���\�7|\r6qPY�E|Z��\���$���\�@.4 gS���g��@ȍ�FUM\�\�ja\�ܥCb�l[��\�W\�FԎ��FX\�f�v��\�v7e\�l�ȴ�\�pV\�\��\Z6V�\�\\6+����\�N�{M\�넣s�AÔ$���\�\�\�\�u�Fi\�ڞp\�-���{�7��\�*@U\�\��\�R4\Z\�ڶ�\�U\�Lͩ�\'\"4\�Ɵf5\Z|�#�,6�����ʍ\�QR���j?��l9�����^sdo(��g<\�\�<�\�\�:J�{#:e���\�\�w��t�Wi�(Yqrݨ\�k\�\"<��IJ\�F\�,8�\�$��$��\�\��\�\�t�7y�tK\�\�Ymvg�Ip�����\�I�\�\"\�s;�.Mռ�O�W%\Z\Z��\�\"\�\�Ɏ��\�-\�Ɛ\�uHJnl�I�H\0q\�\0\Z+�$\�>	��\�{\�4L\��HIyi,cCFM�5\'Nd�J\�L���Yq�t�&���\�\�&`4��\�`,�\'o�<\�X�\�\�6\0�\�@\0*�b^\�Z\��v�#\�\�(3u\0�\�t+,稔G󄉔<Ő\"e���A\�C2T���CPH&\�J�\�\�\�\�X_\�Ç��K>\�d��(e�9\�\�k&m*w�\rɴ�e\�\�ڤҜ��\�\�2�\�=ÃSC�<���W\�% ����h\�nC	�@\0s�\��J[��&I�\\�\ryǰ�ܪ=�tԚ�K�\Z[��s3e��h4g�\�\�b�Eq�\�\�\�zIm\r�7m��	\'\�at��&\nm\�ƚ����]PNm�K����)�[��^5\�^K։t8�&]ˏ&]+/\�<} �����uj!?�����s���\���.\�\�}�h]k�.�\�\rh�gy\\E&}.e\�\�\�I\�e�[�j�\�G|P�]I\�|�\�x�`mdq\��\\�/�����\�\�\�D\����T\� �}\"a.`=�oS~�\��5xM\\�@��\�\�\��\0���&�\����5��\�s\��\�U��ߦ3/�ǁ\��.᣼\�u~K�J��؀9���\�W\�`�l\�_�C\�z<Y\0qY\��\�\�rA��^}0�\�0�\n7G\�\�^\�Kt3\�C�z?���f\�3\n�*I\�\"\�\�x�P���ՉZ&��ڂ���\�D\�;��8\�W	\�t�h\�\�\�TX{1̨-��&�\�պTw%�\��\0�\�9\�W�C\�F\�f�D�,\�f(Ά�դ�h${Qѝ+�E1)�\�	��|\�Q�Uw�\�\���\�vL�G-�\�\�!17\�?C����U\\�\�\�}\�\�qO<\�\�\�qj���nI=����\'2�\�\�\�\�\�\n�Iv\�	<��\0�����\���0Td�)\�)�PW&ݸTMQ�o{\�\�IDzU\�\"o�D�c\�O;a\�F�-2**R\�+��\'�1e\r��\�$�XsZI��<�\�qa.\�O\�upt\�&ʗ�yZ;l\�T>d��\0�Y�����	oy�,��\�\��r\�`P4k+\��\�n�f��\�Ĩ���\�\���[ano��\�VD�\��\�ٳY�\��kU\��.�\�D�\�\\�K\�e�w�Oqu\�YA���Ԏ)鉅�Eف�IY���\�]5\�;����\�7�\�7.Uh\�l�\��A>^�-M�MY�\���\��w ��\��q^V4�r=V\���tM�\�\�\�\r�\�Vhv��@w��\rG\�g\���;g���\�4\�j�1^���eZV7X\\ϖ.X{8\�พ^�F���_�\�\\�I�Ăަ\�[q�C)R�[���	\��cg��k\�<\�:��#\��\�\�\0ԙ\�Jx\�[i�\0}I�t ���P\�\�\��\�}�F���\�F���\�%�-f\�g�=\�C]{)੕�uMiHkNj�#\�.0�P��:\�8^�\�\\\�\�@e�W]\\i\�\�/\��:���U�\�b�c�\�R�\����ˢ7�^kM�Tp�t\�X\�y-\�\Z�\��y�?6l\'��\\-�\r\���N^=�\�龭�Nf6���*�rz�\�u�p�A\�:s9ix0�\�tМ�v���\�\�ki�\�~���\�\���낗�ק����^��\�\�\0&��\0����⻽?\�z\�z��x�4�N5tA�o\�\��\0\�\�:\'�\��\�\�\�\�|\�Ӧھ�m�er=��q\�\�\�\�zo�	��ן����ON�\��d{PG�\�԰�_�	�v��Y�O�Ei���\�\�):�¥�\��pK����7��@V�k\"�H\�O��I��ia��\\\�\�\�\�\�|Ջ�#���\rf\�r�(�]^^���BPUr<ݷ>u\�;�g�Y\�9\�}���\�\����\���5FtX׶\�\�X�\\���b\�/\�!\�\�\�\�\�|\��\�\�\�\�JA R	\�\�\n�!�\�w�\\\�#�;x�4\�f��\0w�z\�\�O\��\�a��\�\�\�\��\0�\�\'\�3\�3Z�ө=m\�Q��y\���	�n�}]�O�g�V��_Nd�6����\\\�\����:\�x��x�4\�x�g\�}8�/˛\�׀d��_w�[/Wo\�C\�\�h���\�ڐ�#j�i�M�*Z/��\�r�\�\�\��\�:PM\��o*m�\�䲴�ZQ\�];rS��&�j�v�\�Y�Nl\�\�N�*� \�\�\�R\�\��\�\�&\��\�4\�n�\�\�\�K��o�U\�\�Dm`mH�g:\r5Q\�\�5,��)\�\�3�j0�->ڑ\�l\�U����\�\�\�vk�m���S��,S\�IzL\nr\�H�\�\n��\�O$r�@\�eᝑ\�\���b˔\�~K\�8q\�\�z4{#N\�]%N\�`#�d�\Z=����\�v��\�\�\�6ݵQ\�#ѣ\��������\�\�\�#\�a���#�8ݵ0\�d\�\�[�F\Zb��8\"$~ҡ�\n9<\�h�_ac\�	\�\��\�50�\�\�5\�N\"��8&��%�\r{�l\�	{��1��\'k\�<\�;�7����v���ͳ�\��M�\�f\�=͉�U���l���<�g\�덒\�l4���SҪ�M�a�+F>\�f\�\�\n�{��3L�\�#�\�\�لb���pC�~ҧ&��\0�c\�\�ل!��8!\�?iN�W�я�Oك\�\�\�\�������8�\0D��6���i��\�\�<k��\�\�Ĝ\�]��&�\�(��S�E\�E���B���C���x��]��ȡM�\"�F$x�8�_`;Uk�\�(\��\� \r\n��\�q�Q\�:G�\\�Ӕ�����Fl�iLN\��Ҡ:�j���\�'),(4,'ddr4',1,'�\��\�\0JFIF\0\0H\0H\0\0�\�\0\�Exif\0\0MM\0*\0\0\0\0\0\0\0\0j\0\0\0V\Z\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\�(\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\�\0\0\0\0This image was originally published on Onliner.by web site (http://www.onliner.by/). All rights reserved.\0\0\0\0H\0\0\0\0\0\0H\0\0\0Onliner.by\0\0�\�\0C\0\n\n\n\r\r�\�\0C		\r\r��\0\0*\0�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	�\�\0K\0\n\0\0\0\0\0!1AQ\"23q�#Ra���\�\�	$4BCSTb�\�&\'6Dc�Fr����\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0?\0\0\0\0\0\0\0!1AQa�\"Rq\�ST�����#2Br�\�$CD3b���\�\0\0\0?\0\�k?�S0\Z�\�R�\�HJ\�i�f-\\`StnR�l|��`:X\\u\�?5\�$R��\n\�7\",W�\�\r�I\\�SJSIl\�U�g?-B\�\�u��L�\�G�<��\�v\'q�fIl�I�\��\�z��W=�����\�~^坣P�*<\�\�@\�Q�gK\�t�\�t��\�Z(ؚ\�I��ٞ\���?��\���(�+!\�h�W��5R_�P�f\n�\n�_l,�z\������&\�fҕ\�\�\�6�1\��;z\�p\���N5�i\�w�ƥ῟\�Td9��aC+�^�\�Jz\rʰ�=I\0�`/\�J\� l�`N���\� \rMI=sW�\�~\�7\�9>���v-��\�\�x�\�\�{s\�y`��\���?i\��\��c�r�_�\�\�ul�[�M�ErdĶ��haQ�e�{��w$�\��R�\�}�\\\�\�e\�\�<p\��v�\�\Z�6�\�H\"�1���U�-v�\�\�p\�p�^�+��c(\��\Z�x�F�\��\�&�\�\�U\�\r\\\�\�\�b�[�?.B�qߔ�\�d��|\�~D�d�bX\�	%\�4�>\n�\�gkc�ٚ^\�J��-\Z\�\�\�T\'5�R&s��VrF�4\�t�\�\�~2F\�6\��M\�\�\�9��@�;\�\0��I\�=�\���q��b�\�Z?+w\��)սPW�\�r�%2�\�&%\�#����q}�6�\���N\�h4\n\�w\�	��Z��@��f�aX\�\�\�;UtkA^�jZ��)\n�+Xjȳ�_\�>�\�)\�\�6�M��ʆ\��? �m���\�4ፘEO�\�+wi��ޫ\�2\�Ɗ�\�0Far\�)D	?�e\�j�\�p\�Y����@��\�L\�,\�x\�17E^�\0\�ĝz�sT�]��b��9\�;WA\�\�މ���U\�w�\0T~�\�T\�G�\��x\�S\�J�\0�\�_4�\Z��tXG�\�\0��Q��\�_�.�\0\ZJ��x^Ժ<]��.�%xI\�,�\�E\"�P��۔=e��ʂ�V%�ib�.+&\�r]�����(x��@�\":�\� \�r�IZ���<G�G_\��hqw\�	\�\\\'!n���L�rxW�Z�#��?S���\�J�\�(�I\�\��뎏�ต\�T\�\�d?\Zk\�Uͮ˱�wf9ktE�c\�\��o\"/�wp���Gx$�~^\�#iJ�P\�:��ͪ�|;JzR`����\�)d�Ҕ�v\�\�6�(��\�\�P �x��\0��\n�a)��\0��\n�\�)9���\n�a;P܇ �ij\�Q� õ\" KW!9I�����6\�wWʥpP\�qa��0��P�\�W?��R����m\�\�pj�����H5@�(vi�pj�\0������\��$\�\rAW~���93�jf\�M�	�\�H\�ڟf\0\�\�E�R,F\nf\03rk1\�L\�%N����Z�D�\�\�|X�#3\���/]v\'\�e\�\�i:<\�\�\�\�\'P�㤬�`�۩\�J�q.�D\�:v��֖\�L�+\�\�\�ե\�];\�s�.\�>�<�,d\�m����\�K�<�\r�hζ|<\���\�7��>\�s�\����zyM\��\�2��O�Ѡ�d�	p4\n��[AYJ�(�\�M�!�vx[.\'<\��\0���\�i\�\�E����\�Z)\\�RiQZ\rU+����\"��2�^�\�&��׽˫��.rC\r�c��r\�~W�I\�\��<E�su\rF�\�Թ\�_w�C�i�\�x2\�\��\�A\�֋�Z	G�dVk١\�\��%JS|T\�Jc5���\�\��\�y\0,:+#{\�\ZwnJm\�ʋT6�Y,��\�.\�:�҇<-\ZuSk�/���f�C�N�\�+Uw�\rG�)�\�e+O���%�� ��\�O;ߖ���\�7|\r6qPY�E|Z��\���$���\�@.4 gS���g��@ȍ�FUM\�\�ja\�ܥCb�l[��\�W\�FԎ��FX\�f�v��\�v7e\�l�ȴ�\�pV\�\��\Z6V�\�\\6+����\�N�{M\�넣s�AÔ$���\�\�\�\�u�Fi\�ڞp\�-���{�7��\�*@U\�\��\�R4\Z\�ڶ�\�U\�Lͩ�\'\"4\�Ɵf5\Z|�#�,6�����ʍ\�QR���j?��l9�����^sdo(��g<\�\�<�\�\�:J�{#:e���\�\�w��t�Wi�(Yqrݨ\�k\�\"<��IJ\�F\�,8�\�$��$��\�\��\�\�t�7y�tK\�\�Ymvg�Ip�����\�I�\�\"\�s;�.Mռ�O�W%\Z\Z��\�\"\�\�Ɏ��\�-\�Ɛ\�uHJnl�I�H\0q\�\0\Z+�$\�>	��\�{\�4L\��HIyi,cCFM�5\'Nd�J\�L���Yq�t�&���\�\�&`4��\�`,�\'o�<\�X�\�\�6\0�\�@\0*�b^\�Z\��v�#\�\�(3u\0�\�t+,稔G󄉔<Ő\"e���A\�C2T���CPH&\�J�\�\�\�\�X_\�Ç��K>\�d��(e�9\�\�k&m*w�\rɴ�e\�\�ڤҜ��\�\�2�\�=ÃSC�<���W\�% ����h\�nC	�@\0s�\��J[��&I�\\�\ryǰ�ܪ=�tԚ�K�\Z[��s3e��h4g�\�\�b�Eq�\�\�\�zIm\r�7m��	\'\�at��&\nm\�ƚ����]PNm�K����)�[��^5\�^K։t8�&]ˏ&]+/\�<} �����uj!?�����s���\���.\�\�}�h]k�.�\�\rh�gy\\E&}.e\�\�\�I\�e�[�j�\�G|P�]I\�|�\�x�`mdq\��\\�/�����\�\�\�D\����T\� �}\"a.`=�oS~�\��5xM\\�@��\�\�\��\0���&�\����5��\�s\��\�U��ߦ3/�ǁ\��.᣼\�u~K�J��؀9���\�W\�`�l\�_�C\�z<Y\0qY\��\�\�rA��^}0�\�0�\n7G\�\�^\�Kt3\�C�z?���f\�3\n�*I\�\"\�\�x�P���ՉZ&��ڂ���\�D\�;��8\�W	\�t�h\�\�\�TX{1̨-��&�\�պTw%�\��\0�\�9\�W�C\�F\�f�D�,\�f(Ά�դ�h${Qѝ+�E1)�\�	��|\�Q�Uw�\�\���\�vL�G-�\�\�!17\�?C����U\\�\�\�}\�\�qO<\�\�\�qj���nI=����\'2�\�\�\�\�\�\n�Iv\�	<��\0�����\���0Td�)\�)�PW&ݸTMQ�o{\�\�IDzU\�\"o�D�c\�O;a\�F�-2**R\�+��\'�1e\r��\�$�XsZI��<�\�qa.\�O\�upt\�&ʗ�yZ;l\�T>d��\0�Y�����	oy�,��\�\��r\�`P4k+\��\�n�f��\�Ĩ���\�\���[ano��\�VD�\��\�ٳY�\��kU\��.�\�D�\�\\�K\�e�w�Oqu\�YA���Ԏ)鉅�Eف�IY���\�]5\�;����\�7�\�7.Uh\�l�\��A>^�-M�MY�\���\��w ��\��q^V4�r=V\���tM�\�\�\�\r�\�Vhv��@w��\rG\�g\���;g���\�4\�j�1^���eZV7X\\ϖ.X{8\�พ^�F���_�\�\\�I�Ăަ\�[q�C)R�[���	\��cg��k\�<\�:��#\��\�\�\0ԙ\�Jx\�[i�\0}I�t ���P\�\�\��\�}�F���\�F���\�%�-f\�g�=\�C]{)੕�uMiHkNj�#\�.0�P��:\�8^�\�\\\�\�@e�W]\\i\�\�/\��:���U�\�b�c�\�R�\����ˢ7�^kM�Tp�t\�X\�y-\�\Z�\��y�?6l\'��\\-�\r\���N^=�\�龭�Nf6���*�rz�\�u�p�A\�:s9ix0�\�tМ�v���\�\�ki�\�~���\�\���낗�ק����^��\�\�\0&��\0����⻽?\�z\�z��x�4�N5tA�o\�\��\0\�\�:\'�\��\�\�\�\�|\�Ӧھ�m�er=��q\�\�\�\�zo�	��ן����ON�\��d{PG�\�԰�_�	�v��Y�O�Ei���\�\�):�¥�\��pK����7��@V�k\"�H\�O��I��ia��\\\�\�\�\�\�|Ջ�#���\rf\�r�(�]^^���BPUr<ݷ>u\�;�g�Y\�9\�}���\�\����\���5FtX׶\�\�X�\\���b\�/\�!\�\�\�\�\�|\��\�\�\�\�JA R	\�\�\n�!�\�w�\\\�#�;x�4\�f��\0w�z\�\�O\��\�a��\�\�\�\��\0�\�\'\�3\�3Z�ө=m\�Q��y\���	�n�}]�O�g�V��_Nd�6����\\\�\����:\�x��x�4\�x�g\�}8�/˛\�׀d��_w�[/Wo\�C\�\�h���\�ڐ�#j�i�M�*Z/��\�r�\�\�\��\�:PM\��o*m�\�䲴�ZQ\�];rS��&�j�v�\�Y�Nl\�\�N�*� \�\�\�R\�\��\�\�&\��\�4\�n�\�\�\�K��o�U\�\�Dm`mH�g:\r5Q\�\�5,��)\�\�3�j0�->ڑ\�l\�U����\�\�\�vk�m���S��,S\�IzL\nr\�H�\�\n��\�O$r�@\�eᝑ\�\���b˔\�~K\�8q\�\�z4{#N\�]%N\�`#�d�\Z=����\�v��\�\�\�6ݵQ\�#ѣ\��������\�\�\�#\�a���#�8ݵ0\�d\�\�[�F\Zb��8\"$~ҡ�\n9<\�h�_ac\�	\�\��\�50�\�\�5\�N\"��8&��%�\r{�l\�	{��1��\'k\�<\�;�7����v���ͳ�\��M�\�f\�=͉�U���l���<�g\�덒\�l4���SҪ�M�a�+F>\�f\�\�\n�{��3L�\�#�\�\�لb���pC�~ҧ&��\0�c\�\�ل!��8!\�?iN�W�я�Oك\�\�\�\�������8�\0D��6���i��\�\�<k��\�\�Ĝ\�]��&�\�(��S�E\�E���B���C���x��]��ȡM�\"�F$x�8�_`;Uk�\�(\��\� \r\n��\�q�Q\�:G�\\�Ӕ�����Fl�iLN\��Ҡ:�j���\�');
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
