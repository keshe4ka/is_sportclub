-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 09, 2020 at 09:20 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

﻿--
-- Database: `sportclub_v2`
--
﻿
-- --------------------------------------------------------

--
-- Table structure for table `competition`
--

CREATE TABLE `competition` (
  `id` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Kind_of_sport_id` int(11) NOT NULL,
  `Result` varchar(45) DEFAULT NULL,
  `Place` int(11) DEFAULT NULL,
  `Sportsman_id` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Referee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
﻿
--
-- Dumping data for table `competition`
--

﻿INSERT INTO `competition` (`id`, `Name`, `Kind_of_sport_id`, `Result`, `Place`, `Sportsman_id`, `Date`, `Referee_id`) VALUES
(1, 'Турнир', 1, '100 очков', 1, 1, '2020-06-09', 1)﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `kind_of_sport`
--

CREATE TABLE `kind_of_sport` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `world_record` varchar(45) DEFAULT NULL,
  `date_of_record` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
﻿
--
-- Dumping data for table `kind_of_sport`
--

﻿INSERT INTO `kind_of_sport` (`id`, `name`, `world_record`, `date_of_record`) VALUES
(1, 'Теннис', '300 очков', '2018-01-08')﻿,
(2, 'Шашки', '10 побед подряд', '2020-06-09')﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `nutrition_program`
--

CREATE TABLE `nutrition_program` (
  `id` int(11) NOT NULL,
  `wish_weight` varchar(45) DEFAULT NULL,
  `Trainer_id` int(11) NOT NULL,
  `Sportsman_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `referee`
--

CREATE TABLE `referee` (
  `id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
﻿
--
-- Dumping data for table `referee`
--

﻿INSERT INTO `referee` (`id`, `User_id`) VALUES
(1, 3)﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `sportsman`
--

CREATE TABLE `sportsman` (
  `id` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `sports_category` varchar(45) DEFAULT NULL,
  `User_id` int(11) NOT NULL,
  `Trainer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
﻿
--
-- Dumping data for table `sportsman`
--

﻿INSERT INTO `sportsman` (`id`, `birthday`, `sports_category`, `User_id`, `Trainer_id`) VALUES
(1, '2020-06-03', NULL, 4, 1)﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
﻿
--
-- Dumping data for table `trainer`
--

﻿INSERT INTO `trainer` (`id`, `User_id`) VALUES
(1, 2)﻿;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `id` int(11) NOT NULL,
  `Trainer_id` int(11) NOT NULL,
  `Sportsman_id` int(11) NOT NULL,
  `Training_programm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `training_programm`
--

CREATE TABLE `training_programm` (
  `id` int(11) NOT NULL,
  `number of times` varchar(45) DEFAULT NULL,
  `lead_time` varchar(45) DEFAULT NULL,
  `Exercise_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
﻿
-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `second_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `patronymic` varchar(100) DEFAULT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
﻿
--
-- Dumping data for table `user`
--

﻿INSERT INTO `user` (`id`, `second_name`, `name`, `patronymic`, `login`, `password`, `Role`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 'password', 'Admin')﻿,
(2, 'trainer', 'trainer', 'trainer', 'trainer', 'password', 'Trainer')﻿,
(3, 'referee', 'referee', 'referee', 'referee', 'password', 'Referee')﻿,
(4, 'sportsman', 'sportsman', 'sportsman', 'sportsman', 'password', 'Sportsman')﻿,
(5, 'Анащенко', 'Артем', 'Альбертович', 'user', 'password', 'Sportsman')﻿;
﻿
--
-- Indexes for dumped tables
--

--
-- Indexes for table `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Competition_results_Sportsman1_idx` (`Sportsman_id`),
  ADD KEY `fk_Competition_Kind_of_sport1_idx` (`Kind_of_sport_id`),
  ADD KEY `fk_Competition_Referee1_idx` (`Referee_id`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `kind_of_sport`
--
ALTER TABLE `kind_of_sport`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `nutrition_program`
--
ALTER TABLE `nutrition_program`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Nutrition_program_Trainer1_idx` (`Trainer_id`),
  ADD KEY `fk_Nutrition_program_Sportsman1_idx` (`Sportsman_id`);

--
-- Indexes for table `referee`
--
ALTER TABLE `referee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Referee_User1_idx` (`User_id`);

--
-- Indexes for table `sportsman`
--
ALTER TABLE `sportsman`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id sportsman_UNIQUE` (`id`),
  ADD KEY `fk_Sportsman_User1_idx` (`User_id`),
  ADD KEY `fk_Sportsman_Trainer1_idx` (`Trainer_id`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_id_UNIQUE` (`id`),
  ADD KEY `fk_Trainer_User1_idx` (`User_id`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Training_Trainer1_idx` (`Trainer_id`),
  ADD KEY `fk_Training_Sportsman1_idx` (`Sportsman_id`),
  ADD KEY `fk_Training_Training_programm1_idx` (`Training_programm_id`);

--
-- Indexes for table `training_programm`
--
ALTER TABLE `training_programm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Training_programm_Exercise1_idx` (`Exercise_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user_UNIQUE` (`id`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);
﻿
--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `competition`
--
ALTER TABLE `competition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exercise`
--
ALTER TABLE `exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kind_of_sport`
--
ALTER TABLE `kind_of_sport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nutrition_program`
--
ALTER TABLE `nutrition_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referee`
--
ALTER TABLE `referee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sportsman`
--
ALTER TABLE `sportsman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trainer`
--
ALTER TABLE `trainer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_programm`
--
ALTER TABLE `training_programm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
﻿
--
-- Constraints for dumped tables
--

--
-- Constraints for table `competition`
--
ALTER TABLE `competition`
  ADD CONSTRAINT `fk_Competition_Kind_of_sport1` FOREIGN KEY (`Kind_of_sport_id`) REFERENCES `kind_of_sport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Competition_Referee1` FOREIGN KEY (`Referee_id`) REFERENCES `referee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Competition_results_Sportsman1` FOREIGN KEY (`Sportsman_id`) REFERENCES `sportsman` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `nutrition_program`
--
ALTER TABLE `nutrition_program`
  ADD CONSTRAINT `fk_Nutrition_program_Sportsman1` FOREIGN KEY (`Sportsman_id`) REFERENCES `sportsman` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Nutrition_program_Trainer1` FOREIGN KEY (`Trainer_id`) REFERENCES `trainer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `referee`
--
ALTER TABLE `referee`
  ADD CONSTRAINT `fk_Referee_User1` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sportsman`
--
ALTER TABLE `sportsman`
  ADD CONSTRAINT `fk_Sportsman_Trainer1` FOREIGN KEY (`Trainer_id`) REFERENCES `trainer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Sportsman_User1` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `trainer`
--
ALTER TABLE `trainer`
  ADD CONSTRAINT `fk_Trainer_User1` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `fk_Training_Sportsman1` FOREIGN KEY (`Sportsman_id`) REFERENCES `sportsman` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Training_Trainer1` FOREIGN KEY (`Trainer_id`) REFERENCES `trainer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Training_Training_programm1` FOREIGN KEY (`Training_programm_id`) REFERENCES `training_programm` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `training_programm`
--
ALTER TABLE `training_programm`
  ADD CONSTRAINT `fk_Training_programm_Exercise1` FOREIGN KEY (`Exercise_id`) REFERENCES `exercise` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
﻿COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
