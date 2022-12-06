CREATE DATABASE  IF NOT EXISTS `pbd_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pbd_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: pbd_db
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `jocuri`
--

DROP TABLE IF EXISTS `jocuri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jocuri` (
  `ID_Joc` int NOT NULL AUTO_INCREMENT,
  `Tip_joc` varchar(20) NOT NULL,
  `Jucator_1` int NOT NULL,
  `Jucator_2` int NOT NULL,
  `Numar_partide` int NOT NULL,
  `Numar_partide_jucate` int DEFAULT '0',
  `Data_inceput_joc` datetime NOT NULL,
  `Data_sfarsit_joc` datetime DEFAULT NULL,
  `Scor_jucator_1` int DEFAULT '0',
  `Scor_jucator_2` int DEFAULT '0',
  `Invingator` int DEFAULT NULL,
  PRIMARY KEY (`ID_Joc`),
  KEY `Jucator_1_idx` (`Jucator_1`),
  KEY `Jucator_2_idx` (`Jucator_2`),
  CONSTRAINT `Jucator_1` FOREIGN KEY (`Jucator_1`) REFERENCES `jucatori` (`ID_Jucator`),
  CONSTRAINT `Jucator_2` FOREIGN KEY (`Jucator_2`) REFERENCES `jucatori` (`ID_Jucator`),
  CONSTRAINT `jocuri_chk_1` CHECK ((`Numar_partide` < 100)),
  CONSTRAINT `jocuri_chk_2` CHECK ((`Numar_partide_jucate` < 100)),
  CONSTRAINT `jocuri_chk_3` CHECK ((`Data_inceput_joc` < `Data_sfarsit_joc`)),
  CONSTRAINT `Numar_partide` CHECK (((`Numar_partide` % 2) <> 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jocuri`
--

LOCK TABLES `jocuri` WRITE;
/*!40000 ALTER TABLE `jocuri` DISABLE KEYS */;
INSERT INTO `jocuri` VALUES (1,'sah',1,2,3,3,'2022-11-23 22:53:17','2022-12-04 00:00:00',3,0,1),(2,'Jocul Mintii',1,2,5,5,'2022-12-02 15:33:45','2022-12-04 00:00:00',2,3,2),(3,'sah',4,3,3,3,'2022-12-04 04:06:28','2022-12-04 04:11:44',1,2,3),(4,'table',2,3,3,3,'2022-12-04 04:14:39','2022-12-04 04:14:45',2,1,2),(5,'Sah',1,2,3,2,'2022-10-06 00:00:00','2022-10-07 00:00:00',1,2,2),(6,'Table',3,4,5,5,'2022-10-08 00:00:00','2022-10-09 00:00:00',3,2,3),(7,'Sah',3,4,7,7,'2022-10-08 00:00:00','2022-10-09 00:00:00',3,4,4),(8,'Sah',2,3,3,3,'2022-10-07 00:00:00','2022-10-08 00:00:00',1,2,3),(9,'Sah',4,1,5,5,'2022-10-07 00:00:00','2022-10-08 00:00:00',5,0,4),(10,'Sah',2,4,3,3,'2022-10-07 00:00:00','2022-10-08 00:00:00',2,1,2),(11,'Sah',1,2,5,4,'2022-10-07 00:00:00','2022-10-08 00:00:00',2,2,NULL),(12,'Table',2,3,3,3,'2009-12-05 00:00:00','2009-12-07 00:00:00',2,1,2),(13,'Table',4,3,7,7,'2009-12-28 00:00:00','2010-01-02 00:00:00',2,5,3),(14,'Table',2,3,3,3,'2010-01-01 00:00:00','2010-01-02 00:00:00',2,1,2),(15,'Sah',4,1,5,5,'2010-02-02 00:00:00','2010-04-01 00:00:00',4,1,4),(16,'Table',4,1,3,3,'2011-03-03 00:00:00','2011-03-04 00:00:00',1,2,1),(17,'Alba - Neagra',16,3,5,1,'2022-12-06 21:51:49',NULL,1,0,NULL),(18,'table',16,2,3,3,'2022-12-06 21:59:46','2022-12-06 21:59:55',1,2,2);
/*!40000 ALTER TABLE `jocuri` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jocuri_AFTER_UPDATE` BEFORE UPDATE ON `jocuri` FOR EACH ROW BEGIN
	IF NEW.Numar_partide = NEW.Numar_partide_jucate THEN    
		SET NEW.Invingator = CASE
			WHEN NEW.Scor_jucator_1 > NEW.Scor_jucator_2 THEN NEW.Jucator_1
			ELSE NEW.Jucator_2 END;
			
		SET NEW.Data_sfarsit_joc = now();
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jucatori`
--

DROP TABLE IF EXISTS `jucatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jucatori` (
  `ID_Jucator` int NOT NULL AUTO_INCREMENT,
  `Nume` varchar(30) NOT NULL,
  `Data_nastere` datetime NOT NULL,
  `Data_inscriere` datetime NOT NULL,
  PRIMARY KEY (`ID_Jucator`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jucatori`
--

LOCK TABLES `jucatori` WRITE;
/*!40000 ALTER TABLE `jucatori` DISABLE KEYS */;
INSERT INTO `jucatori` VALUES (1,'Eduard Miclos','2001-07-13 00:00:00','2022-10-05 00:00:00'),(2,'Andrei Balea','2001-05-30 00:00:00','2022-09-05 00:00:00'),(3,'Matei Horia','2000-04-04 00:00:00','2022-09-06 00:00:00'),(4,'Ionut Iftimie','2003-08-25 00:00:00','2022-10-04 00:00:00'),(10,'Dummy','2010-07-08 00:00:00','2022-11-18 02:54:24'),(12,'Dummy2','2005-11-17 00:00:00','2022-11-18 02:57:43'),(16,'Marian Godină','1987-07-22 00:00:00','2022-12-06 21:51:25');
/*!40000 ALTER TABLE `jucatori` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jucatori_AFTER_INSERT` AFTER INSERT ON `jucatori` FOR EACH ROW BEGIN
	IF NEW.Data_nastere > NOW() 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data nasterii nu poate fi mai mare decat data curenta.';
	END IF;
    
    IF NEW.Data_inscriere > NOW()
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data inscriere nu poate fi mai mare decat data curenta.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `jucatori_AFTER_UPDATE` AFTER UPDATE ON `jucatori` FOR EACH ROW BEGIN
IF NEW.Data_nastere > NOW() 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data nasterii nu poate fi mai mare decat data curenta.';
	END IF;
    
    IF NEW.Data_inscriere > NOW()
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data inscriere nu poate fi mai mare decat data curenta.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'pbd_db'
--
/*!50003 DROP FUNCTION IF EXISTS `getVarsta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getVarsta`(ID_Jucator INT) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE Varsta INT;
	SELECT TIMESTAMPDIFF(YEAR, (SELECT Data_nastere from jucatori WHERE jucatori.ID_Jucator=ID_Jucator), CURDATE()) LIMIT 1 INTO Varsta;
	return Varsta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `creeazaJoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `creeazaJoc`(
	IN tipJoc VARCHAR(20), 
	IN numeJucator1 VARCHAR(30), 
	IN numeJucator2 VARCHAR(30), 
    IN nrPartide INT, 
    OUT errCode INT,
    OUT statusMsg VARCHAR(70)
)
BEGIN
	DECLARE idJucator1 INT;
    DECLARE idJucator2 INT;
    DECLARE nrJocuri INT;
    
    # Cream subprocedura MAIN pentru a ne permite
	# oprirea imediata a executiei in caz de eroare.
    MAIN: BEGIN
		SET nrJocuri = (SELECT MAX(ID_Joc) FROM jocuri);
        
        IF nrJocuri >= 1000000000 THEN
			SET errCode = 1;
			SET statusMSG = "Eroare: Numar maxim de jocuri atins!";
			LEAVE MAIN;
		END IF;
    
		# Preluam id-ul jucatorului 1 cu numele primit ca si parametru
		# (daca acesta exista).
		SET idJucator1 = (SELECT ID_Jucator from jucatori WHERE Nume = numeJucator1);
    
		IF idJucator1 IS NULL THEN
			SET errCode = 2;
			SET statusMSG = "Eroare: Primul jucator nu a putut fi gasit in baza de date!";
            LEAVE MAIN;
		END IF;
    
		# Preluam id-ul jucatorului 2 cu numele primit ca si parametru
		# (daca acesta exista).
		SET idJucator2 = (SELECT ID_Jucator from jucatori WHERE Nume = numeJucator2);
    
		IF idJucator2 IS NULL THEN
			SET errCode = 3;
			SET statusMSG = "Eroare: Al doilea jucator nu a putut fi gasit in baza de date!";
            LEAVE MAIN;
		END IF;
        
        # Numarul de partide trebuie sa fie impar.
        IF nrPartide % 2 = 0 THEN
			SET errCode = 4;
			SET statusMsg = "Eroare: Numarul de partide trebuie sa fie impar!";
            LEAVE MAIN;
		END IF;
        
        # Query-ul propriu-zis de insertie a jocului.
        INSERT INTO jocuri (Tip_Joc, Jucator_1, Jucator_2, Numar_partide, Data_inceput_joc)
        VALUES (tipJoc, idJucator1, idJucator2, nrPartide, NOW());
        
        SET errCode = 0;
		SET statusMsg = "Succes!";
            
	END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getJocuri2010` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getJocuri2010`(
	OUT errCode INT,
    OUT statusMsg VARCHAR(70)
)
BEGIN
	DECLARE nrJucatori INT;
    DECLARE nrJocuri INT;
    
	# Cream subprocedura MAIN pentru a ne permite
	# oprirea imediata a executiei in caz de eroare.
	MAIN: BEGIN
		SET nrJucatori = (SELECT COUNT(*) FROM Jucatori);
        
        IF nrJucatori = 0 THEN
			SET errCode = 1;
			SET statusMsg = "Eroare: Nu exista jucatori inscrisi!";
			LEAVE MAIN;
		END IF;
    
		SET nrJocuri = (SELECT COUNT(*) FROM Jocuri 
						WHERE Data_inceput_joc >= '2010-01-01' AND Data_sfarsit_joc <= '2010-04-01');
    
		IF nrJocuri = 0 THEN
			SET errCode = 2;
			SET statusMsg = "Eroare: Nu exista jocuri desfasurate in perioada 01.ian.2010 - 01.apr.2010!";
			LEAVE MAIN;
		END IF;
    
		SELECT ID_Joc, 
			   Tip_Joc, 
               Numar_partide, 
               Data_inceput_joc, 
               Data_sfarsit_joc, 
               TIMESTAMPDIFF(hour, Data_inceput_joc, Data_sfarsit_joc) AS Durata_joc, 
               Invingator
		FROM Jocuri
		INNER JOIN Jucatori ON Jocuri.Invingator = Jucatori.ID_Jucator 
		WHERE Data_inceput_joc >= '2010-01-01' AND Data_sfarsit_joc <= '2010-04-01'
		ORDER BY Tip_Joc ASC, Data_inceput_joc ASC;
        
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getJucatorMaxJocuri` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getJucatorMaxJocuri`(
	OUT errCode INT,
    OUT statusMsg VARCHAR(70)
)
BEGIN
	DECLARE nrJucatori INT;
    DECLARE nrJocuri INT;

	# Cream subprocedura MAIN pentru a ne permite
	# oprirea imediata a executiei in caz de eroare.
	MAIN: BEGIN
		SET nrJucatori = (SELECT COUNT(*) FROM Jucatori);
        
        IF nrJucatori = 0 THEN
			SET errCode = 1;
			SET statusMsg = "Eroare: Nu exista jucatori inscrisi!";
			LEAVE MAIN;
		END IF;
    
		SET nrJocuri = (SELECT COUNT(*) FROM Jocuri);
    
		IF nrJocuri = 0 THEN
			SET errCode = 2;
			SET statusMsg = "Eroare: Nu exista jocuri in tabela!";
			LEAVE MAIN;
		END IF;
	
		WITH Tabela_aparitii AS 
			(
            # Pentru inceput, unim coloanele Jucator_1 si Jucator_2, pentru a numara
            # mai usor numarul total de aparitii pentru fiecare participant in parte.
			WITH Tabela_jucatori AS 
				(
                SELECT Jucator_1 FROM Jocuri
				UNION ALL
				SELECT Jucator_2 FROM Jocuri
                )
			# Numaram aparitiile.
			SELECT Jucator_1 as ID_Jucator, COUNT(*) AS Aparitii FROM Tabela_jucatori
			GROUP BY Jucator_1
            )
		# Selectam numele jucatorului/jucatorilor cu cele mai multe aparitii.
		SELECT Nume FROM Tabela_aparitii
		INNER JOIN Jucatori ON Tabela_aparitii.ID_Jucator = Jucatori.ID_Jucator
		WHERE Aparitii = (SELECT MAX(Aparitii) FROM Tabela_aparitii);
        
        SET errCode = 0;
		SET statusMsg = "Succes!";
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMaiestruCategVarsta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMaiestruCategVarsta`(
	IN minVarst INT,
    IN maxVarst INT,
    OUT errCode INT,
    OUT statusMsg VARCHAR(70)
)
BEGIN

	# Cream subprocedura MAIN pentru a ne permite
	# oprirea imediata a executiei in caz de eroare.
	MAIN: BEGIN    
		IF (minVarst > maxVarst) THEN
			SET errCode = 1;
			SET statusMsg = "Intervalul introdus este gresit.";
			LEAVE MAIN;
		END IF;
		
		WITH t1 AS 
			(
				SELECT
						*,
						(SELECT COUNT(*) FROM `pbd_db`.`jocuri` WHERE jocuri.Invingator = ID_Jucator) as Victorii
				FROM `pbd_db`.`jucatori`
				WHERE getVarsta(ID_Jucator) >= minVarst AND getVarsta(ID_Jucator) <= maxVarst
			)    
		SELECT * from t1 WHERE Victorii = (SELECT MAX(Victorii) from  t1);
        
        SET errCode = 0;
		SET statusMsg = "Succes!";
    END;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSahMaster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSahMaster`(
	OUT errCode INT,
    OUT statusMsg VARCHAR(70)
)
BEGIN
	DECLARE nrJucatori INT;
    DECLARE nrJocuriSah INT;
    DECLARE nrInvingatoriSah INT;
	
    # Cream subprocedura MAIN pentru a ne permite
	# oprirea imediata a executiei in caz de eroare.
	MAIN: BEGIN
		SET nrJucatori = (SELECT COUNT(*) FROM Jucatori);
        
        IF nrJucatori = 0 THEN
			SET errCode = 1;
			SET statusMsg = "Eroare: Nu exista jucatori inscrisi!";
			LEAVE MAIN;
		END IF;
        
        SET nrJocuriSah = (SELECT COUNT(*) FROM Jocuri WHERE Tip_Joc = "Sah");
        
        IF nrJocuriSah = 0 THEN
			SET errCode = 2;
			SET statusMsg = "Eroare: Nu exista jocuri de sah in tabela!";
			LEAVE MAIN;
		END IF;
        
        SET nrInvingatoriSah = (SELECT COUNT(*) FROM Jocuri WHERE Tip_Joc = "Sah" AND Invingator IS NOT NULL);
        
		IF nrInvingatoriSah = 0 THEN
			SET errCode = 3;
			SET statusMsg = "Eroare: Jocurile de sah sunt inca in desfasurare!";
			LEAVE MAIN;
		END IF;
        
		# Cream tabela de victorii, o componenta intermediara ce va fi preluata si prelucrata
        # in programul ce efectueaza apelul procedurii. Este necesara, deoarece pot exista
        # mai multi jucatori cu acelasi numar de victorii => mai mult maestri sah.
		WITH Tabela_victorii AS 
			(
			SELECT *, COUNT(*) AS Victorii FROM Jocuri 
			INNER JOIN jucatori ON jocuri.Invingator = jucatori.ID_Jucator
			WHERE jocuri.Tip_Joc = "Sah"
			GROUP BY jocuri.Invingator
			ORDER BY Victorii 
			)
		SELECT ID_Jucator, Nume, Data_nastere, Data_inscriere, Victorii FROM Tabela_victorii
		WHERE Victorii = (SELECT MAX(Victorii) from Tabela_victorii);
        
        SET errCode = 0;
		SET statusMsg = "Succes!";
            
    END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `raportJucatori` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `raportJucatori`()
BEGIN
	SELECT
		Nume,
        ID_Joc,
        Tip_joc,
        Data_inceput_joc,
        Data_sfarsit_joc,
        if (ID_Jucator = Invingator, "DA", "NU") as Castigator
	FROM jocuri 
    INNER JOIN jucatori
    ON jocuri.Jucator_1 = jucatori.ID_Jucator OR jocuri.Jucator_2 = jucatori.ID_Jucator;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-06 22:35:08
