-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.40-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for esx2
CREATE DATABASE IF NOT EXISTS `esx2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `esx2`;

-- Dumping structure for table esx2.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.addon_account: ~4 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1),
	('society_cardealer', 'Concessionnaire', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table esx2.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.addon_account_data: ~4 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_ambulance', 0, NULL),
	(2, 'society_cardealer', 0, NULL),
	(3, 'society_police', 0, NULL),
	(4, 'society_taxi', 0, NULL);
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table esx2.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.addon_inventory: ~4 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1),
	('society_cardealer', 'Concesionnaire', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table esx2.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.addon_inventory_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for table esx2.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.billing: ~0 rows (approximately)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for table esx2.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.cardealer_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for table esx2.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.datastore: ~3 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table esx2.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(48) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.datastore_data: ~3 rows (approximately)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_ambulance', NULL, '{}'),
	(2, 'society_police', NULL, '{}'),
	(3, 'society_taxi', NULL, '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table esx2.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.fine_types: ~52 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Misuse of a horn', 30, 0),
	(2, 'Illegally Crossing a continuous Line', 40, 0),
	(3, 'Driving on the wrong side of the road', 250, 0),
	(4, 'Illegal U-Turn', 250, 0),
	(5, 'Illegally Driving Off-road', 170, 0),
	(6, 'Refusing a Lawful Command', 30, 0),
	(7, 'Illegally Stopping a Vehicle', 150, 0),
	(8, 'Illegal Parking', 70, 0),
	(9, 'Failing to Yield to the right', 70, 0),
	(10, 'Failure to comply with Vehicle Information', 90, 0),
	(11, 'Failing to stop at a Stop Sign ', 105, 0),
	(12, 'Failing to stop at a Red Light', 130, 0),
	(13, 'Illegal Passing', 100, 0),
	(14, 'Driving an illegal Vehicle', 100, 0),
	(15, 'Driving without a License', 1500, 0),
	(16, 'Hit and Run', 800, 0),
	(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
	(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
	(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
	(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
	(21, 'Impeding traffic flow', 110, 1),
	(22, 'Public Intoxication', 90, 1),
	(23, 'Disorderly conduct', 90, 1),
	(24, 'Obstruction of Justice', 130, 1),
	(25, 'Insults towards Civilans', 75, 1),
	(26, 'Disrespecting of an LEO', 110, 1),
	(27, 'Verbal Threat towards a Civilan', 90, 1),
	(28, 'Verbal Threat towards an LEO', 150, 1),
	(29, 'Providing False Information', 250, 1),
	(30, 'Attempt of Corruption', 1500, 1),
	(31, 'Brandishing a weapon in city Limits', 120, 2),
	(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
	(33, 'No Firearms License', 600, 2),
	(34, 'Possession of an Illegal Weapon', 700, 2),
	(35, 'Possession of Burglary Tools', 300, 2),
	(36, 'Grand Theft Auto', 1800, 2),
	(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	(38, 'Frabrication of an Illegal Substance', 1500, 2),
	(39, 'Possession of an Illegal Substance ', 650, 2),
	(40, 'Kidnapping of a Civilan', 1500, 2),
	(41, 'Kidnapping of an LEO', 2000, 2),
	(42, 'Robbery', 650, 2),
	(43, 'Armed Robbery of a Store', 650, 2),
	(44, 'Armed Robbery of a Bank', 1500, 2),
	(45, 'Assault on a Civilian', 2000, 3),
	(46, 'Assault of an LEO', 2500, 3),
	(47, 'Attempt of Murder of a Civilian', 3000, 3),
	(48, 'Attempt of Murder of an LEO', 5000, 3),
	(49, 'Murder of a Civilian', 10000, 3),
	(50, 'Murder of an LEO', 30000, 3),
	(51, 'Involuntary manslaughter', 1800, 3),
	(52, 'Fraud', 2000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table esx2.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '1',
  `rare` tinyint(1) NOT NULL DEFAULT '0',
  `can_remove` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.items: ~2 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('bandage', 'Bandage', 2, 0, 1),
	('medikit', 'First Aid Kit', 2, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table esx2.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.jobs: ~5 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'Ambulance', 0),
	('cardealer', 'Concessionnaire', 0),
	('police', 'Police', 0),
	('taxi', 'Taxi', 0),
	('unemployed', 'Unemployed', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table esx2.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.job_grades: ~19 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
	(2, 'ambulance', 0, 'ambulance', 'Trainee', 300, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(3, 'ambulance', 1, 'doctor', 'EMS', 450, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(4, 'ambulance', 2, 'chief_doctor', 'Paramedic', 600, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(5, 'ambulance', 3, 'boss', 'Chief', 800, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(6, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
	(7, 'police', 1, 'officer', 'Officer', 40, '{}', '{}'),
	(8, 'police', 2, 'sergeant', 'Sergeant', 60, '{}', '{}'),
	(9, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
	(10, 'police', 4, 'boss', 'Chief', 100, '{}', '{}'),
	(11, 'taxi', 0, 'recrue', 'Recruit', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(12, 'taxi', 1, 'novice', 'Cabby', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(13, 'taxi', 2, 'experimente', 'Experienced', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(14, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(15, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(16, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
	(17, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(18, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
	(19, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table esx2.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table esx2.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(48) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.owned_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table esx2.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(48) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.rented_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for table esx2.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.society_moneywash: ~0 rows (approximately)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table esx2.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(48) NOT NULL,
  `accounts` longtext,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext,
  `position` varchar(53) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `is_dead` tinyint(1) DEFAULT '0',
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `dateofbirth` varchar(25) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `height` varchar(5) DEFAULT '',
  `skin` longtext,
  `status` longtext,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `position`, `is_dead`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`) VALUES
	('Char1:3f89a687b37152b8fa4727e20bb6c106e49729d7', '{"black_money":0,"bank":50000,"money":0}', 'user', '[]', 'unemployed', 0, '[]', '{"z":31.2,"y":-975.0,"x":-259.8,"heading":206.1}', 0, 'Danny', 'LeVito', '1996-12-03', 'm', '178', '{"decals_1":0,"shoes_2":0,"lipstick_2":0,"sun_1":0,"pants_2":4,"watches_2":0,"bags_2":0,"face":0,"torso_1":22,"glasses_1":0,"mask_1":0,"blush_1":0,"hair_1":21,"skin":5,"chest_3":0,"mask_2":0,"chain_1":0,"lipstick_1":0,"beard_3":0,"ears_1":-1,"watches_1":-1,"chest_2":0,"blush_3":0,"age_2":0,"sun_2":0,"bodyb_1":0,"complexion_2":0,"shoes_1":7,"hair_color_1":0,"lipstick_4":0,"blemishes_1":0,"blemishes_2":0,"moles_2":0,"hair_2":0,"hair_color_2":0,"ears_2":0,"pants_1":26,"arms":0,"torso_2":0,"sex":0,"bracelets_2":0,"bproof_1":0,"helmet_1":-1,"decals_2":0,"bags_1":0,"eyebrows_3":0,"makeup_3":0,"chest_1":0,"moles_1":0,"bproof_2":0,"complexion_1":0,"helmet_2":0,"makeup_2":0,"age_1":0,"beard_4":0,"eyebrows_1":0,"eye_color":0,"beard_1":7,"makeup_4":0,"glasses_2":0,"tshirt_2":0,"bracelets_1":-1,"eyebrows_2":0,"blush_2":0,"tshirt_1":0,"makeup_1":0,"eyebrows_4":0,"arms_2":0,"chain_2":0,"bodyb_2":0,"lipstick_3":0,"beard_2":10}', '[{"val":989300,"name":"hunger","percent":98.93},{"val":991975,"name":"thirst","percent":99.1975},{"val":0,"name":"drunk","percent":0.0}]');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table esx2.user_lastcharacter
CREATE TABLE IF NOT EXISTS `user_lastcharacter` (
  `license` varchar(255) NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.user_lastcharacter: ~1 rows (approximately)
/*!40000 ALTER TABLE `user_lastcharacter` DISABLE KEYS */;
INSERT INTO `user_lastcharacter` (`license`, `charid`) VALUES
	('license:3f89a687b37152b8fa4727e20bb6c106e49729d7', 1);
/*!40000 ALTER TABLE `user_lastcharacter` ENABLE KEYS */;

-- Dumping structure for table esx2.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(48) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.user_licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table esx2.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.vehicles: ~240 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table esx2.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.vehicle_categories: ~11 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table esx2.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table esx2.vehicle_sold: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
