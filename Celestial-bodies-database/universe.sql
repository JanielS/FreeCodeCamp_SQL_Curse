-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: universe
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `galaxy`
--

DROP TABLE IF EXISTS `galaxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galaxy` (
  `galaxy_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `visivelNoite` tinyint(1) DEFAULT NULL,
  `numeroEstrela` int NOT NULL,
  `descricao` text,
  PRIMARY KEY (`galaxy_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galaxy`
--

LOCK TABLES `galaxy` WRITE;
/*!40000 ALTER TABLE `galaxy` DISABLE KEYS */;
INSERT INTO `galaxy` VALUES (1,'Via Láctea','Espiral',1,100,'A Via Láctea é a galáxia onde o Sistema Solar está localizado.'),(2,'Andrômeda','Espiral',1,1290,'A galáxia de Andrômeda é uma galáxia espiral localizada perto da Via Láctea.'),(3,'Centaurus A','Elíptica',0,200,'Centaurus A é uma galáxia elíptica localizada na constelação de Centauro.'),(4,'Messier 87','Elíptica gigante',0,2000,'Messier 87 é uma galáxia elíptica gigante no aglomerado de Virgem.'),(5,'Sombrero','Espiral',0,500,'A galáxia Sombrero é conhecida por seu núcleo brilhante e forma distinta.'),(6,'Olho Negro','Anular',0,100,'A galáxia Olho Negro tem um anel de estrelas e poeira ao seu redor.'),(7,'Grande Nuvem de Magalhães','Irregular',1,10,'A Grande Nuvem de Magalhães é uma galáxia satélite da Via Láctea.'),(8,'NGC 1300','Espiral barrada',0,400,'NGC 1300 é uma galáxia espiral barrada conhecida por seus braços espirais proeminentes.'),(9,'Messier 82','Irregular',NULL,100,NULL),(10,'Whirlpool','Espiral',NULL,300,NULL);
/*!40000 ALTER TABLE `galaxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moon`
--

DROP TABLE IF EXISTS `moon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moon` (
  `moon_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `raio` decimal(10,5) DEFAULT NULL,
  `massa` decimal(50,20) DEFAULT NULL,
  `habitavel` tinyint(1) NOT NULL,
  `planet_id` int NOT NULL,
  PRIMARY KEY (`moon_id`),
  UNIQUE KEY `name` (`name`),
  KEY `planet_id` (`planet_id`),
  CONSTRAINT `moon_ibfk_1` FOREIGN KEY (`planet_id`) REFERENCES `planet` (`planet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moon`
--

LOCK TABLES `moon` WRITE;
/*!40000 ALTER TABLE `moon` DISABLE KEYS */;
INSERT INTO `moon` VALUES (26,'Luna',1737.10000,73500000000000000000000.00000000000000000000,0,46),(27,'Europa',1560.00000,48000000000000000000000.00000000000000000000,1,47),(28,'Ganymede',2634.10000,148000000000000000000000.00000000000000000000,0,48),(29,'Titan',2575.00000,135000000000000000000000.00000000000000000000,0,49),(30,'Callisto',2410.30000,108000000000000000000000.00000000000000000000,0,50),(31,'Io',1821.60000,89300000000000000000000.00000000000000000000,0,60),(32,'Moonlet',NULL,NULL,0,59),(33,'Phobos',11.10000,10800000000000000.00000000000000000000,0,58),(34,'Deimos',6.20000,2000000000000000.00000000000000000000,0,57),(35,'Mimas',198.20000,NULL,0,56),(36,'Enceladus',252.10000,108000000000000000000.00000000000000000000,0,55),(37,'Tethys',NULL,618000000000000000000.00000000000000000000,0,54),(38,'Dione',561.40000,NULL,0,53),(39,'Rhea',NULL,2310000000000000000000.00000000000000000000,0,52),(40,'Iapetus',1468.00000,1810000000000000000000.00000000000000000000,0,51),(41,'Hyperion',NULL,1080000000000000000.00000000000000000000,0,50),(42,'Charon',606.00000,1520000000000000000000.00000000000000000000,0,48),(43,'Nereid',NULL,31000000000000000000.00000000000000000000,0,56),(44,'Proteus',210.00000,44000000000000000000.00000000000000000000,0,47),(45,'Triton',1353.40000,21400000000000000000000.00000000000000000000,0,54),(46,'Miranda',235.80000,65900000000000000000.00000000000000000000,0,55),(47,'Ariel',578.90000,1270000000000000000000.00000000000000000000,0,50),(48,'Umbriel',584.70000,1170000000000000000000.00000000000000000000,0,50),(49,'Titania',788.90000,3400000000000000000000.00000000000000000000,0,48),(50,'Oberon',761.40000,3010000000000000000000.00000000000000000000,0,52);
/*!40000 ALTER TABLE `moon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planet`
--

DROP TABLE IF EXISTS `planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planet` (
  `planet_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `massa` decimal(10,5) DEFAULT NULL,
  `distanciaEstrela` decimal(10,5) NOT NULL,
  `star_id` int DEFAULT NULL,
  PRIMARY KEY (`planet_id`),
  UNIQUE KEY `name` (`name`),
  KEY `star_id` (`star_id`),
  CONSTRAINT `planet_ibfk_1` FOREIGN KEY (`star_id`) REFERENCES `star` (`star_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planet`
--

LOCK TABLES `planet` WRITE;
/*!40000 ALTER TABLE `planet` DISABLE KEYS */;
INSERT INTO `planet` VALUES (46,'Mercúrio','Rochoso',0.33000,57.90000,11),(47,'Vênus','Rochoso',4.87000,108.20000,13),(48,'Terra','Rochoso',5.97000,149.60000,15),(49,'Marte','Rochoso',0.64200,227.90000,19),(50,'Júpiter','Gasoso',NULL,778.50000,12),(51,'Saturno','Gasoso',568.00000,1433.50000,15),(52,'Urano',NULL,86.80000,2872.50000,19),(53,'Netuno','Gasoso',102.00000,4495.10000,12),(54,'Kepler-22b','Exoplaneta',36.00000,600.00000,13),(55,'Proxima Centauri b','Exoplaneta',1.27000,4.24000,11),(56,'Gliese 581g','Exoplaneta',3.10000,20.30000,19),(57,'HD 209458 b','Exoplaneta',220.00000,150.00000,18),(58,'WASP-12b','Exoplaneta',450.00000,870.00000,16),(59,'TrES-4b','Exoplaneta',690.00000,1400.00000,14),(60,'GJ 1214b','Super-Terra',NULL,40.00000,17);
/*!40000 ALTER TABLE `planet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satellite`
--

DROP TABLE IF EXISTS `satellite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `satellite` (
  `satellite_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dataLancamento` date NOT NULL,
  `operacional` tinyint(1) DEFAULT NULL,
  `tipoOrbita` varchar(50) NOT NULL,
  `descricaoFabricante` text,
  PRIMARY KEY (`satellite_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satellite`
--

LOCK TABLES `satellite` WRITE;
/*!40000 ALTER TABLE `satellite` DISABLE KEYS */;
INSERT INTO `satellite` VALUES (1,'Hubble','1990-04-24',1,'Baixa Terra','Telescope Science Institute'),(2,'ISS','1998-11-20',1,'Estação Espacial','NASA'),(3,'Voyager 1','1977-09-05',0,'Interplanetária','NASA'),(4,'Mars Reconnaissance Orbiter','2005-08-12',1,'Marciana','NASA'),(5,'Tiangong','2011-09-29',1,'Estação Espacial',NULL),(6,'Galileo','1989-10-18',0,'Joviana','ESA'),(7,'New Horizons','2006-01-19',1,'Interplanetária','NASA'),(8,'Rosetta','2004-03-02',0,'Cometária','ESA'),(9,'Chang\'e 4','2018-12-07',1,'Lunar','CNSA'),(10,'Kepler','2009-03-07',0,'Heliocêntrica','NASA');
/*!40000 ALTER TABLE `satellite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `satellite_planet`
--

DROP TABLE IF EXISTS `satellite_planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `satellite_planet` (
  `satellite_id` int NOT NULL,
  `planet_id` int NOT NULL,
  PRIMARY KEY (`satellite_id`,`planet_id`),
  KEY `planet_id` (`planet_id`),
  CONSTRAINT `satellite_planet_ibfk_1` FOREIGN KEY (`satellite_id`) REFERENCES `satellite` (`satellite_id`),
  CONSTRAINT `satellite_planet_ibfk_2` FOREIGN KEY (`planet_id`) REFERENCES `planet` (`planet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satellite_planet`
--

LOCK TABLES `satellite_planet` WRITE;
/*!40000 ALTER TABLE `satellite_planet` DISABLE KEYS */;
INSERT INTO `satellite_planet` VALUES (1,47),(4,47),(2,49),(6,49),(2,50),(8,55),(2,56),(9,60);
/*!40000 ALTER TABLE `satellite_planet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `star` (
  `star_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tipoEstrela` varchar(50) NOT NULL,
  `massa` decimal(50,20) DEFAULT NULL,
  `idade` decimal(50,20) DEFAULT NULL,
  `galaxy_id` int NOT NULL,
  PRIMARY KEY (`star_id`),
  UNIQUE KEY `name` (`name`),
  KEY `galaxy_id` (`galaxy_id`),
  CONSTRAINT `star_ibfk_1` FOREIGN KEY (`galaxy_id`) REFERENCES `galaxy` (`galaxy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
INSERT INTO `star` VALUES (11,'Sol','Anã Amarela',198900000000000000000.00000000000000000000,4600000000.00000000000000000000,1),(12,'Alpha Centauri A','Anã Amarela',220000000000000000000.00000000000000000000,6000000000.00000000000000000000,1),(13,'Sirius','Anã Branca',210000000000000000000.00000000000000000000,NULL,3),(14,'Betelgeuse','Supergigante Vermelha',NULL,8000000.00000000000000000000,5),(15,'Proxima Centauri','Anã Vermelha',12000000000000000000.00000000000000000000,5000000000.00000000000000000000,8),(16,'Polaris','Gigante Amarela',540000000000000000000.00000000000000000000,NULL,9),(17,'Vega','Estrela de Sequência Principal',210000000000000000000.00000000000000000000,450000000.00000000000000000000,2),(18,'Antares','Supergigante Vermelha',1240000000000000000000.00000000000000000000,NULL,7),(19,'Rigel','Supergigante Azul',NULL,10000000.00000000000000000000,9),(20,'Canopus','Gigante Azul',850000000000000000000.00000000000000000000,60000000.00000000000000000000,3);
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-23 19:00:58
