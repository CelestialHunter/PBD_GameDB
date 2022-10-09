CREATE DATABASE  IF NOT EXISTS `pbd_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pbd_db`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: pbd_db
-- ------------------------------------------------------
-- Server version	8.0.28

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
  KEY `FK_Jucator_idx` (`Invingator`,`Jucator_1`,`Jucator_2`),
  KEY `Jucator_1_idx` (`Jucator_1`),
  KEY `Jucator_2_idx` (`Jucator_2`),
  CONSTRAINT `Invingator` FOREIGN KEY (`Invingator`) REFERENCES `jucatori` (`ID_Jucator`),
  CONSTRAINT `Jucator_1` FOREIGN KEY (`Jucator_1`) REFERENCES `jucatori` (`ID_Jucator`),
  CONSTRAINT `Jucator_2` FOREIGN KEY (`Jucator_2`) REFERENCES `jucatori` (`ID_Jucator`),
  CONSTRAINT `jocuri_chk_1` CHECK ((`Numar_partide` < 100)),
  CONSTRAINT `jocuri_chk_2` CHECK ((`Numar_partide_jucate` < 100)),
  CONSTRAINT `Numar_partide` CHECK (((`Numar_partide` % 2) <> 0))
) ENGINE=InnoDB AUTO_INCREMENT=1000000001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jocuri`
--

LOCK TABLES `jocuri` WRITE;
/*!40000 ALTER TABLE `jocuri` DISABLE KEYS */;
INSERT INTO `jocuri` VALUES (1,'Sah',1,2,3,2,'2022-10-06 00:00:00','2022-10-06 00:00:00',1,2,2),(2,'Table',3,4,5,5,'2022-10-08 00:00:00','2022-10-09 00:00:00',3,2,3),(3,'Sah',3,4,7,7,'2022-10-08 00:00:00','2022-10-09 00:00:00',3,4,4),(4,'Sah',2,3,3,3,'2022-10-07 00:00:00','2022-10-08 00:00:00',1,2,3),(5,'Sah',4,1,5,5,'2022-10-07 00:00:00','2022-10-08 00:00:00',5,0,4),(6,'Sah',2,4,3,3,'2022-10-07 00:00:00','2022-10-08 00:00:00',2,1,2),(7,'Sah',1,2,5,4,'2022-10-07 00:00:00','2022-10-08 00:00:00',2,2,NULL);
/*!40000 ALTER TABLE `jocuri` ENABLE KEYS */;
UNLOCK TABLES;

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
  `Data_curenta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Jucator`),
  CONSTRAINT `Data_inscriere` CHECK ((`Data_inscriere` < `Data_curenta`)),
  CONSTRAINT `Data_nastere` CHECK ((`Data_nastere` < `Data_curenta`))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jucatori`
--

LOCK TABLES `jucatori` WRITE;
/*!40000 ALTER TABLE `jucatori` DISABLE KEYS */;
INSERT INTO `jucatori` VALUES (1,'Eduard Miclos','2001-07-13 00:00:00','2022-10-05 00:00:00','2022-10-06 21:45:16'),(2,'Andrei Balea','2001-05-30 00:00:00','2022-09-05 00:00:00','2022-10-06 21:47:23'),(3,'Matei Horia','2000-04-04 00:00:00','2022-09-06 00:00:00','2022-10-09 13:52:17'),(4,'Ionut Iftimie','2003-08-25 00:00:00','2022-10-04 00:00:00','2022-10-09 13:52:49');
/*!40000 ALTER TABLE `jucatori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pbd_db'
--

--
-- Dumping routines for database 'pbd_db'
--
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
        VALUES (tipJoc, idJucator1, idJucator2, nrPartide, CURRENT_DATE());
        
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
			SELECT jucatori.Nume, COUNT(*) AS Victorii FROM Jocuri 
			INNER JOIN jucatori ON jocuri.Invingator = jucatori.ID_Jucator
			WHERE jocuri.Tip_Joc = "Sah"
			GROUP BY jocuri.Invingator
			ORDER BY Victorii 
			)
		SELECT Nume FROM Tabela_victorii
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-09 15:08:44
