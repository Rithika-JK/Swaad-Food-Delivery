-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: instant_food
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuId` int NOT NULL AUTO_INCREMENT,
  `restaurantId` int NOT NULL,
  `itemName` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `isAvailable` tinyint DEFAULT '1',
  `rating` float DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menuId`),
  KEY `restaurantId` (`restaurantId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (10,9,'Chicken Ghee Roast','Authentic Mangalorean Chicken Ghee Roast',349,1,4.8,'images/chickengheeroast.jpeg'),(11,9,'Neer Dosa','Soft Neer Dosa with Coconut Chutney',149,1,4.6,'images/neerdosa.jpeg'),(12,9,'Fish Fry','Traditional Coastal Fish Fry',299,1,4.9,'images/fishfry.jpeg'),(13,4,'Chicken Biryani','Authentic Andhra Style Chicken Biryani',329,1,4.9,'images/chickenbiryani.jpeg'),(14,4,'Mutton Biryani','Rich and Spicy Mutton Dum Biryani',399,1,4.8,'images/muttonbiryani.jpeg'),(15,4,'Paneer Biryani','Flavourful Paneer Dum Biryani',279,1,4.6,'images/paneerbiryani.jpeg'),(16,4,'Chicken 65','Crispy Boneless Chicken 65',249,1,4.7,'images/chicken65.jpeg'),(17,4,'Butter Naan','Soft Butter Naan',49,1,4.5,'images/butternaan.jpeg'),(18,4,'Gulab Jamun','Two Soft Gulab Jamuns',79,1,4.7,'images/gulabjamun.jpeg'),(19,5,'Mango Shake','Fresh Alphonso Mango Milkshake',149,1,4.8,'images/mangoshake.jpeg'),(20,5,'Watermelon Juice','Fresh Watermelon Juice',99,1,4.6,'images/watermelonjuice.jpeg'),(21,5,'Orange Juice','Fresh Orange Juice',119,1,4.7,'images/orangejuice.jpeg'),(22,5,'Pineapple Juice','Fresh Pineapple Juice',109,1,4.5,'images/pineapplejuice.jpeg'),(23,5,'Strawberry Milkshake','Creamy Strawberry Milkshake',169,1,4.8,'images/strawberrymilkshake.jpeg'),(24,5,'Chocolate Milkshake','Rich Chocolate Milkshake',179,1,4.9,'images/chocolatemilkshake.jpeg'),(25,3,'Farmhouse Pizza','Loaded with fresh vegetables and cheese',329,1,4.8,'images/farmhousepizza.jpeg'),(26,3,'Chicken Supreme Pizza','Chicken toppings with mozzarella cheese',399,1,4.9,'images/chickensupremepizza.jpeg'),(27,3,'Veggie Lover Pizza','Fresh veggies with extra cheese',299,1,4.6,'images/veggieloverpizza.jpeg'),(28,3,'Cheese Garlic Bread','Garlic bread loaded with cheese',149,1,4.7,'images/cheesegarlicbread.jpeg'),(29,3,'Chicken Wings','Spicy crispy chicken wings',269,1,4.8,'images/chickenwings.jpeg'),(30,3,'Choco Lava Cake','Warm chocolate lava dessert',129,1,4.9,'images/chocolavacake.jpeg'),(31,1,'Margherita Pizza','Classic Cheese Pizza',199,1,4.5,'images/margheritapizza.jpeg'),(32,1,'Veg Supreme','Loaded with Fresh Vegetables',299,1,4.7,'images/vegsupreme.jpeg'),(33,1,'Garlic Bread','Fresh Garlic Bread',129,1,4.4,'images/garlicbread.jpeg'),(34,1,'Pepperoni Pizza','Loaded with Pepperoni & Cheese',349,1,4.8,'images/pepperonipizza.jpeg'),(35,1,'Cheese Burst Pizza','Extra Cheese Filled Crust',399,1,4.9,'images/cheeseburstpizza.jpeg'),(36,1,'Choco Lava Cake','Warm Chocolate Lava Cake',109,1,4.8,'images/chocolavacake1.jpeg'),(37,2,'Chicken Bucket','Crispy Chicken Bucket',499,1,4.8,'images/chickenbucket.jpeg'),(38,2,'Zinger Burger','Spicy Chicken Burger',249,1,4.6,'images/zingerburger.jpeg'),(39,2,'French Fries','Golden Crispy French Fries',119,1,4.3,'images/frenchfries.jpeg'),(40,2,'Hot Wings','Spicy Crunchy Chicken Wings',299,1,4.8,'images/hotwings.jpeg'),(41,2,'Popcorn Chicken','Bite-sized Crispy Chicken',229,1,4.7,'images/popcornchicken.jpeg'),(42,2,'Chicken Strips','Tender Crispy Chicken Strips',279,1,4.8,'images/chickenstrips.jpeg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `orderItemId` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `menuId` int NOT NULL,
  `quantity` int NOT NULL,
  `price` float NOT NULL,
  `itemTotal` float NOT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `orderId` (`orderId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `restaurantId` int NOT NULL,
  `orderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `totalAmount` float NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `paymentMode` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  KEY `restaurantId` (`restaurantId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`restaurantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantId` int NOT NULL AUTO_INCREMENT,
  `restaurantName` varchar(45) NOT NULL,
  `cuisineType` varchar(50) DEFAULT NULL,
  `deliveryTime` int DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `isActive` tinyint DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`restaurantId`),
  UNIQUE KEY `restaurantId_UNIQUE` (`restaurantId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Dominos','Pizza',30,'btn',4.5,1,'dominos.jpeg'),(2,'KFC','Fried Chicken',30,'mico layout',4.6,1,'kfc.jpeg'),(3,'Pizza Hut','Pizza',35,'Bangalore',4.4,1,'pizzahut.jpeg'),(4,'Meghana Food','Biryani',30,'Bangalore',4.8,1,'meghanafood.jpeg'),(5,'Juice Paradise','Juices & Beverages',20,'Bangalore',4.5,1,'juiceparadise.jpeg'),(9,'Karavali Grand','South Indian & Seafood',25,'Bangalore',4.7,1,'karavaligrand.jpeg');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `role` enum('customer','deliveryAgent','restaurant','superAdmin') DEFAULT NULL,
  `createdDate` timestamp NULL DEFAULT NULL,
  `lastLoginDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'preethi','pree@gmail.com','2345','sullia','customer',NULL,'2026-06-23 17:57:18'),(4,'alex','ale@gmail.com','2356','banshankri','deliveryAgent',NULL,'2026-06-25 09:05:34'),(5,'krish','kri@gmail.com','8790','btm','customer',NULL,'2026-06-25 09:12:26'),(6,'rith','rithikajk12@gmail.com','12345','btm','customer',NULL,'2026-07-07 11:23:32'),(7,'Admin','admin@swaad.com','admin123','Bangalore','superAdmin',NULL,'2026-07-07 06:06:22');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-07 17:00:29
