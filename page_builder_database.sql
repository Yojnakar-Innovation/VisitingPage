-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               9.3.0 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for page_builder_database
USE `db27056`;

-- Dumping structure for table page_builder_database.inquiries
CREATE TABLE IF NOT EXISTS `inquiries` (
  `InquiryID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `PageID` int NOT NULL,
  `VisitorID` int DEFAULT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreatedAt` datetime DEFAULT (now()),
  `IsRead` bit(1) NOT NULL DEFAULT (0),
  PRIMARY KEY (`InquiryID`),
  KEY `FK_Page_Inquiry` (`PageID`) USING BTREE,
  KEY `FK_user_inquiry` (`UserID`),
  KEY `FK_visit_inquiry` (`VisitorID`),
  CONSTRAINT `FK_Page_Inquiry` FOREIGN KEY (`PageID`) REFERENCES `pages` (`PageID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_inquiry` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_visit_inquiry` FOREIGN KEY (`VisitorID`) REFERENCES `visits` (`VisitorID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table page_builder_database.links
CREATE TABLE IF NOT EXISTS `links` (
  `LinksID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `PageID` int NOT NULL,
  `Title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`LinksID`) USING BTREE,
  KEY `links.profiles` (`PageID`) USING BTREE,
  KEY `FK_links_Users` (`UserID`),
  CONSTRAINT `FK_links_pages` FOREIGN KEY (`PageID`) REFERENCES `pages` (`PageID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_links_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table page_builder_database.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `PageID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `PageTitle` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Slug` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Layoutstyle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Backgroundcolor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProfileImageUrl` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BackgroundImageUrl` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IsPublished` tinyint(1) NOT NULL DEFAULT '0',
  `FacebookUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InstagramUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TwitterUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LinkedInUrl` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreatedAt` datetime DEFAULT (now()),
  PRIMARY KEY (`PageID`) USING BTREE,
  KEY `UserId` (`UserID`) USING BTREE,
  CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table page_builder_database.users
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UserName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ProfileImageUrl` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Bio` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UserType` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CreatedAt` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table page_builder_database.visits
CREATE TABLE IF NOT EXISTS `visits` (
  `VisitorID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `PageID` int NOT NULL,
  `IpAddress` varchar(200) NOT NULL,
  `TimeStamp` varchar(200) NOT NULL,
  `Source` varchar(200) NOT NULL,
  `CallCount` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EmailCount` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`VisitorID`) USING BTREE,
  KEY `visits.profiles` (`UserID`) USING BTREE,
  KEY `FK_visitor_page` (`PageID`),
  CONSTRAINT `FK_visitor_page` FOREIGN KEY (`PageID`) REFERENCES `pages` (`PageID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_visitor_user` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
