-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: scdproject
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `ITEM_ID` int DEFAULT NULL,
  `Qty` int DEFAULT NULL,
  KEY `ITEM_ID_CART_FK` (`ITEM_ID`),
  CONSTRAINT `ITEM_ID_CART_FK` FOREIGN KEY (`ITEM_ID`) REFERENCES `food_items` (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!50001 DROP VIEW IF EXISTS `customer_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_details` AS SELECT 
 1 AS `CUSTOMER_ID`,
 1 AS `FIRST_NAME`,
 1 AS `LAST_NAME`,
 1 AS `PHONE_NO`,
 1 AS `EMAIL`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CUSTOMER_ID` int NOT NULL AUTO_INCREMENT,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(20) DEFAULT NULL,
  `PHONE_NO` decimal(20,0) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `POINTS` int DEFAULT NULL,
  `REGISTERED` int DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (-99,'',NULL,NULL,NULL,NULL,NULL,NULL),(2,'12345678','Huzaifa','Khan',3333333333,'huzzikk2295@gmail.com',0,1),(3,'1234','Saeed','Kamran',444444444,'saeed@gmail.com',0,1),(4,'konain123','Konain','Ahmed',3323427787,'konaina2@gmail.com',0,1),(5,'saeed','Saeed','Ahmed',16164646,'saeed12@gmail.com',0,1),(6,'saad123','Saad','Ahmed',3215153153,'saadahmed123@gmail.com',0,1),(7,'saeed123','Saeed','Imran',3323427787,'saeedimran@gmail.com',0,1),(15,'saeed123','saeed','kamran',3323427787,'saeedimran@gmail.com',0,1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `DELIVERY_ID` int NOT NULL AUTO_INCREMENT,
  `DELIVERY_DATE` date DEFAULT NULL,
  `ORDER_ID` int DEFAULT NULL,
  `RIDER_NO` int DEFAULT NULL,
  PRIMARY KEY (`DELIVERY_ID`),
  KEY `ORDER_DELIVERY_FK` (`ORDER_ID`),
  CONSTRAINT `ORDER_DELIVERY_FK` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_items`
--

DROP TABLE IF EXISTS `food_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_items` (
  `ITEM_ID` int NOT NULL AUTO_INCREMENT,
  `ITEM_NAME` varchar(20) DEFAULT NULL,
  `ITEM_PRICE` int DEFAULT NULL,
  `ITEM_DESCRIPTION` varchar(90) DEFAULT NULL,
  `OLD_PRICE` int DEFAULT '0',
  PRIMARY KEY (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_items`
--

LOCK TABLES `food_items` WRITE;
/*!40000 ALTER TABLE `food_items` DISABLE KEYS */;
INSERT INTO `food_items` VALUES (2,'burger',200,'cheese',600),(3,'Pizza',1000,'With Cheese',0),(4,'Chowmein',500,'Spicy',0),(5,'Biryani',220,'Spicy',0);
/*!40000 ALTER TABLE `food_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_items`
--

DROP TABLE IF EXISTS `ordered_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_items` (
  `ITEM_ID` int NOT NULL,
  `ORDER_ID` int NOT NULL,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`,`ORDER_ID`),
  KEY `ORDER_ID_FK` (`ORDER_ID`),
  CONSTRAINT `ITEM_ID_FK` FOREIGN KEY (`ITEM_ID`) REFERENCES `food_items` (`ITEM_ID`),
  CONSTRAINT `ORDER_ID_FK` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_items`
--

LOCK TABLES `ordered_items` WRITE;
/*!40000 ALTER TABLE `ordered_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ORDER_ID` int NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int DEFAULT NULL,
  `ORDER_DATE` date DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `CUSTOMER_ID_FK` (`CUSTOMER_ID`),
  CONSTRAINT `CUSTOMER_ID_FK` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customers` (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (32,7,'2022-12-07','confirmed'),(33,7,'2022-12-07','confirmed'),(34,-99,'2022-12-07','confirmed'),(35,15,'2022-12-08','confirmed'),(36,15,'2022-12-08','confirmed'),(37,-99,'2022-12-08','confirmed'),(38,-99,'2022-12-08','confirmed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `PAYMENT_ID` int NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` int DEFAULT NULL,
  `ORDER_ID` int DEFAULT NULL,
  `DELIVERY_ID` int DEFAULT NULL,
  `PAYMENT_METHOD` varchar(10) DEFAULT NULL,
  `BILL` int DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  KEY `PAYMENT_ORDER_FK` (`ORDER_ID`),
  KEY `PAYMENT_CUSTOMER_FK` (`CUSTOMER_ID`),
  KEY `PAYMENT_DELIVERY_FK` (`DELIVERY_ID`),
  CONSTRAINT `PAYMENT_CUSTOMER_FK` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customers` (`CUSTOMER_ID`),
  CONSTRAINT `PAYMENT_DELIVERY_FK` FOREIGN KEY (`DELIVERY_ID`) REFERENCES `delivery` (`DELIVERY_ID`),
  CONSTRAINT `PAYMENT_ORDER_FK` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (8,7,32,NULL,'Cash',700),(9,7,33,NULL,'Card',1300),(10,-99,34,NULL,'Cash',1200),(11,15,35,NULL,'Cash',200),(12,15,36,NULL,'Card',1000),(13,-99,37,NULL,'Card',2400),(14,-99,38,NULL,'Cash',42500);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `RESERVATION_ID` int NOT NULL AUTO_INCREMENT,
  `RESERVATION_NAME` varchar(20) DEFAULT NULL,
  `RESERVATION_EMAIL` varchar(20) DEFAULT NULL,
  `CONTACT_NO` varchar(20) DEFAULT NULL,
  `RESERVATION_DATE` date DEFAULT NULL,
  `RESERVATION_TIME` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`RESERVATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_tables`
--

DROP TABLE IF EXISTS `restaurant_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_tables` (
  `TABLE_NO` int NOT NULL AUTO_INCREMENT,
  `FLOOR_NO` int DEFAULT NULL,
  `TABLE_AVAILABILITY` int DEFAULT NULL,
  `TABLE_CAPACITY` int DEFAULT NULL,
  PRIMARY KEY (`TABLE_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_tables`
--

LOCK TABLES `restaurant_tables` WRITE;
/*!40000 ALTER TABLE `restaurant_tables` DISABLE KEYS */;
INSERT INTO `restaurant_tables` VALUES (1,1,1,4),(2,1,1,4),(3,1,1,3),(4,1,1,2),(5,2,1,5),(6,2,1,6);
/*!40000 ALTER TABLE `restaurant_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_details`
--

/*!50001 DROP VIEW IF EXISTS `customer_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_details` AS select `customers`.`CUSTOMER_ID` AS `CUSTOMER_ID`,`customers`.`FIRST_NAME` AS `FIRST_NAME`,`customers`.`LAST_NAME` AS `LAST_NAME`,`customers`.`PHONE_NO` AS `PHONE_NO`,`customers`.`EMAIL` AS `EMAIL` from `customers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09 17:16:24
