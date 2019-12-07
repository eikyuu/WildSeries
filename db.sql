-- MySQL dump 10.13  Distrib 8.0.18, for osx10.12 (x86_64)
--
-- Host: localhost    Database: wildseries
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Aventure'),(2,'Horror');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `synopsis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DDAA1CDA4EC001D1` (`season_id`),
  CONSTRAINT `FK_DDAA1CDA4EC001D1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,1,'Winter Is Coming',1,'Eddard Stark is torn between his family and an old friend when asked to serve at the side of King Robert Baratheon; Viserys plans to wed his sister to a nomadic warlord in exchange for an army. '),(2,1,'The Kingsroad',2,'While Bran recovers from his fall, Ned takes only his daughters to King\'s Landing. Jon Snow goes with his uncle Benjen to the Wall. Tyrion joins them. '),(3,1,'Lord Snow',3,'Jon begins his training with the Night\'s Watch; Ned confronts his past and future at King\'s Landing; Daenerys finds herself at odds with Viserys. '),(4,2,'The North Remembers',1,'Tyrion arrives at King\'s Landing to take his father\'s place as Hand of the King. Stannis Baratheon plans to take the Iron Throne for his own. Robb tries to decide his next move in the war. The Night\'s Watch arrive at the house of Craster. '),(5,2,'The Night Lands',2,'Arya makes friends with Gendry. Tyrion tries to take control of the Small Council. Theon arrives at his home, Pyke, in order to persuade his father into helping Robb with the war. Jon tries to investigate Craster\'s secret. '),(6,2,'What Is Dead May Never Die',3,'Tyrion tries to see who he can trust in the Small Council. Catelyn visits Renly to try and persuade him to join Robb in the war. Theon must decide if his loyalties lie with his own family or with Robb. '),(7,3,'Days Gone Bye',1,'Deputy Sheriff Rick Grimes awakens from a coma, and searches for his family in a world ravaged by the undead. '),(8,3,'Guts',2,'In Atlanta, Rick is rescued by a group of survivors, but they soon find themselves trapped inside a department store surrounded by walkers. '),(9,3,'Tell It to the Frogs',3,'Rick is reunited with Lori and Carl but soon decides - along with some of the other survivors - to return to the rooftop and rescue Merle. Meanwhile, tensions run high between the other survivors at the camp.'),(10,4,'What Lies Ahead',1,'The group\'s plan to head for Fort Benning is put on hold when Sophia goes missing.'),(11,4,'Bloodletting',2,'After Carl is accidentally shot, the group are brought to a family living on a nearby farm. Shane makes a dangerous trip in search of medical supplies. '),(12,4,'Save the Last One',3,'As Carl\'s condition continues to deteriorate, Shane and Otis try to dodge the walkers as they head back to the farm. ');
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration_versions` (
  `version` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('20191129143924','2019-11-29 14:40:47'),('20191129150633','2019-11-29 15:07:21'),('20191203092200','2019-12-03 09:23:57'),('20191203092443','2019-12-03 09:24:49'),('20191203092857','2019-12-03 09:29:04'),('20191203094044','2019-12-03 09:41:09'),('20191203094200','2019-12-03 09:42:16'),('20191203094439','2019-12-03 09:45:00'),('20191203135408','2019-12-03 13:54:22');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `synopsis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_92ED778412469DE2` (`category_id`),
  CONSTRAINT `FK_92ED778412469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,1,'Game of Thrones','https://m.media-amazon.com/images/M/MV5BMjA5NzA5NjMwNl5BMl5BanBnXkFtZTgwNjg2OTk2NzM@._V1_SY1000_CR0,0,674,1000_AL_.jpg','United States',2011,'Nine noble families fight for control over the mythical lands of Westeros, while an ancient enemy returns after being dormant for thousands of years. '),(2,2,'The Walking Dead','https://m.media-amazon.com/images/M/MV5BYWY4ODJiZjMtNWMxYi00ZmM5LWIwZmQtZWY0MjJmZGU5MjcxXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SY1000_CR0,0,675,1000_AL_.jpg','United States',2010,'Sheriff Deputy Rick Grimes wakes up from a coma to learn the world is in ruins, and must lead a group of survivors to stay alive. ');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F0E45BA93EB8070A` (`program_id`),
  CONSTRAINT `FK_F0E45BA93EB8070A` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,1,1,2011,'The first season of the fantasy drama television series Game of Thrones premiered on HBO on April 17, 2011 in the U.S. and concluded on June 19, 2011. It consists of ten episodes, each of approximately 55 minutes. The series is based on A Game of Thrones, the first novel in the A Song of Ice and Fire series by George R. R. Martin, adapted for television by David Benioff and D. B. Weiss. HBO had ordered a television pilot in November 2008; filming began the following year. However, it was deemed unsatisfactory and later reshot with some roles recast. In March 2010, HBO ordered the first season, which began filming in July 2010, primarily in Belfast, Northern Ireland, with additional filming in Malta. '),(2,1,2,2012,'The second season of the fantasy drama television series Game of Thrones premiered in the United States on HBO on April 1, 2012, and concluded on June 3, 2012. It was broadcast on Sunday at 9:00 pm in the United States, consisting of 10 episodes, each running approximately 50–60 minutes. The season mostly covers the events of A Clash of Kings, the second novel of the A Song of Ice and Fire series by George R. R. Martin, adapted for television by David Benioff and D. B. Weiss. HBO ordered the second season on April 19, 2011, which began filming in July 2011, primarily in Ireland, Northern Ireland, Croatia and Iceland. '),(3,2,1,2010,'Sheriff\'s deputy Rick Grimes wakes from a coma discovering a world overrun by zombies. After befriending Morgan Jones, Rick travels alone to Atlanta to find his wife Lori, his son, Carl, and his police partner and best friend, Shane Walsh, encountering other survivors. The group travels to the Centers for Disease Control (CDC), but find from the sole remaining CDC member that no cure exists for the epidemic.'),(4,2,2,2011,'Traveling from Atlanta, Rick\'s group takes shelter at Hershel Greene\'s farm while they search for Carol\'s missing daughter, Sophia. Tension between the survivors worsen after it is discovered that Hershel has kept friends and family turned into zombies, including Sophia, in his barn. Rick learns that Shane and Lori were romantically involved at the outset of the apocalypse, and Shane and Rick\'s friendship becomes increasingly unhinged when Lori reveals that she is pregnant. Rick is eventually forced to kill Shane in self-defense. The noise draws zombies, forcing Rick\'s group and Hershel\'s surviving family to evacuate the farm.');
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-03 15:07:12
