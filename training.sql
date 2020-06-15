-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 15, 2020 at 07:07 PM
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
(1, 'Moskva', 'Erevan', 'Abovyan street', '098521479', 'ehryhtrde'),
(2, 'Nairi', 'Erevan', 'Mesrop Mashtoc', '077412579', 'nairi.jpg'),
(3, 'Hoktember', 'Gyumri', 'Abovyan street', '077411485', 'kyfhytjut'),
(4, 'Kinopark', 'Erevan', 'Arshakunyan street', '098322569', 'guyiujurt'),
(5, 'Sevastopolya', 'Moskva', 'Sevastapol, str. Ostryakov  70', '00774519816196', 'ytujtiuiy'),
(6, 'Hayastan', 'Erevan', 'Zoravar Andranik 74', '098254791', 'rtuytiuyi'),
(7, 'Formula', 'Moskva', 'Moskva, str.Entuziastov 12', '007715618965', 'frety6ru'),
(8, 'Sinema Star', 'Erevan', 'Tsitsernakaberd highway', '060755555', 'gfrujujut');

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
(1, 1, 'Matrica 4', '2020', 'ytryrut', '2020-06-15'),
(2, 4, 'Djentelmeni', '2019', 'gjufujujy', '2020-06-16'),
(3, 6, 'Oxota', '2019', 'trhyfkjhgk', '2020-06-17'),
(4, 3, 'Storoj', '2019', 'gfjugtk', '2020-06-16'),
(5, 1, 'Nachalo', '2010', 'gtrytiu', '2020-06-15'),
(6, 7, 'Gladiator', '2000', 'hgkiuigtu', '2020-06-16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cinema_id` (`cinema_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
