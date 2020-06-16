-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2020 at 07:45 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.3.10-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `training`
--

-- --------------------------------------------------------

--
-- Table structure for table `checked`
--

CREATE TABLE `checked` (
  `id` int(11) NOT NULL,
  `date_time_id` int(11) NOT NULL,
  `row_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `checked`
--

INSERT INTO `checked` (`id`, `date_time_id`, `row_id`) VALUES
(1, 4, 15),
(2, 7, 26),
(3, 6, 30),
(4, 9, 26);

-- --------------------------------------------------------

--
-- Table structure for table `cinemas`
--

CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cinemas`
--

INSERT INTO `cinemas` (`id`, `name`, `city`, `address`, `phone`, `image_path`) VALUES
(1, 'Moskva', 'Erevan', 'Abovyan street', '098521479', 'moskva.jpg'),
(2, 'Nairi', 'Erevan', 'Mesrop Mashtoc', '077412579', 'nairi.jpg'),
(3, 'Hoktember', 'Gyumri', 'Abovyan street', '077411485', 'hoktember.jpg'),
(4, 'Kinopark', 'Erevan', 'Arshakunyan street', '098322569', 'kinopark.jpg'),
(5, 'Sevastopolya', 'Moskva', 'Sevastapol, str. Ostryakov  70', '00774519816196', 'sevastopolya.jpeg'),
(6, 'Hayastan', 'Erevan', 'Zoravar Andranik 74', '098254791', 'hayastan.jpg'),
(7, 'Formula', 'Moskva', 'Moskva, str.Entuziastov 12', '007715618965', 'formula.jpg'),
(8, 'Sinema Star', 'Erevan', 'Tsitsernakaberd highway', '060755555', 'sinemastar.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `column`
--

CREATE TABLE `column` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `column`
--

INSERT INTO `column` (`id`, `number`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `data_time`
--

CREATE TABLE `data_time` (
  `id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data_time`
--

INSERT INTO `data_time` (`id`, `film_id`, `start`, `end`) VALUES
(1, 3, '13:00:00', '14:30:00'),
(2, 4, '15:30:00', '17:00:00'),
(3, 2, '15:00:00', '16:00:00'),
(4, 3, '15:30:00', '17:00:00'),
(5, 10, '11:00:00', '13:00:00'),
(6, 4, '15:00:00', '17:00:00'),
(7, 8, '15:30:00', '17:00:00'),
(8, 3, '17:00:00', '19:00:00'),
(9, 1, '14:30:00', '16:00:00'),
(10, 6, '15:00:00', '17:00:00'),
(11, 9, '17:00:00', '19:00:00'),
(12, 8, '18:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

CREATE TABLE `films` (
  `id` int(11) NOT NULL,
  `cinema_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_kino` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`id`, `cinema_id`, `name`, `date_kino`, `image_path`, `date`) VALUES
(1, 1, 'Matrica 4', '2020', 'matrica4.jpg', '2020-06-15'),
(2, 4, 'Djentelmeni', '2019', 'djentelmeni.jpg', '2020-06-16'),
(3, 6, 'Oxota', '2014', 'oxota.jpg', '2020-06-17'),
(4, 3, 'Storoj', '2019', 'storoj.jpg', '2020-06-16'),
(5, 1, 'Nachalo', '2010', 'nachalo.jpg', '2020-06-15'),
(6, 7, 'Gladiator', '2000', 'gladiator.jpg', '2020-06-16'),
(7, 2, 'Djoker', '2019', 'djoker.jpg', '2020-06-17'),
(8, 8, 'Karol', '2019', 'karol.jpg', '2020-06-18'),
(9, 5, 'Venom', '2018', 'venom.jpg', '2020-06-16'),
(10, 7, 'Platforma', '2018', 'platforma.jpg', '2020-06-17');

-- --------------------------------------------------------

--
-- Table structure for table `row`
--

CREATE TABLE `row` (
  `id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `row`
--

INSERT INTO `row` (`id`, `column_id`, `number`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 2, 1),
(12, 2, 2),
(13, 2, 3),
(14, 2, 4),
(15, 2, 5),
(16, 2, 6),
(17, 2, 7),
(18, 2, 8),
(19, 2, 9),
(20, 2, 10),
(21, 3, 1),
(22, 3, 2),
(23, 3, 3),
(24, 3, 4),
(25, 3, 5),
(26, 3, 6),
(27, 3, 7),
(28, 3, 8),
(29, 3, 9),
(30, 3, 10),
(31, 4, 1),
(32, 4, 2),
(33, 4, 3),
(34, 4, 4),
(35, 4, 5),
(36, 4, 6),
(37, 4, 7),
(38, 4, 8),
(39, 4, 9),
(40, 4, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checked`
--
ALTER TABLE `checked`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_time_id` (`date_time_id`),
  ADD KEY `row_id` (`row_id`);

--
-- Indexes for table `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `column`
--
ALTER TABLE `column`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_time`
--
ALTER TABLE `data_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_id` (`film_id`);

--
-- Indexes for table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cinema_id` (`cinema_id`);

--
-- Indexes for table `row`
--
ALTER TABLE `row`
  ADD PRIMARY KEY (`id`),
  ADD KEY `column_id` (`column_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checked`
--
ALTER TABLE `checked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `column`
--
ALTER TABLE `column`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `data_time`
--
ALTER TABLE `data_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `row`
--
ALTER TABLE `row`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `checked`
--
ALTER TABLE `checked`
  ADD CONSTRAINT `checked_ibfk_1` FOREIGN KEY (`date_time_id`) REFERENCES `data_time` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `checked_ibfk_2` FOREIGN KEY (`row_id`) REFERENCES `row` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_time`
--
ALTER TABLE `data_time`
  ADD CONSTRAINT `data_time_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `row`
--
ALTER TABLE `row`
  ADD CONSTRAINT `row_ibfk_1` FOREIGN KEY (`column_id`) REFERENCES `column` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
