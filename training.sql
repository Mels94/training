-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 16 2020 г., 00:46
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `training`
--

-- --------------------------------------------------------

--
-- Структура таблицы `checked`
--

CREATE TABLE `checked` (
  `id` int NOT NULL,
  `date_time_id` int NOT NULL,
  `row_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cinemas`
--

CREATE TABLE `cinemas` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cinemas`
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
-- Структура таблицы `column`
--

CREATE TABLE `column` (
  `id` int NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `column`
--

INSERT INTO `column` (`id`, `number`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `data_time`
--

CREATE TABLE `data_time` (
  `id` int NOT NULL,
  `film_id` int NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `data_time`
--

INSERT INTO `data_time` (`id`, `film_id`, `start`, `end`) VALUES
(1, 3, '13:00:00', '14:30:00'),
(2, 4, '15:30:00', '17:00:00'),
(3, 2, '15:00:00', '16:00:00'),
(4, 3, '17:00:00', '19:00:00'),
(5, 10, '11:00:00', '13:37:20'),
(6, 4, '15:00:00', '17:00:00'),
(7, 8, '18:00:00', '20:00:00'),
(8, 3, '15:30:00', '17:00:00'),
(9, 1, '14:30:00', '16:00:00'),
(10, 6, '15:00:00', '17:00:00'),
(11, 9, '17:00:00', '19:00:00'),
(12, 8, '15:30:00', '17:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `films`
--

CREATE TABLE `films` (
  `id` int NOT NULL,
  `cinema_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_kino` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `films`
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
-- Структура таблицы `row`
--

CREATE TABLE `row` (
  `id` int NOT NULL,
  `column_id` int NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `row`
--

INSERT INTO `row` (`id`, `column_id`, `number`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2),
(5, 3, 1),
(6, 3, 2),
(7, 4, 1),
(8, 4, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `checked`
--
ALTER TABLE `checked`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_time_id` (`date_time_id`),
  ADD KEY `row_id` (`row_id`);

--
-- Индексы таблицы `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `column`
--
ALTER TABLE `column`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `data_time`
--
ALTER TABLE `data_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_id` (`film_id`);

--
-- Индексы таблицы `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cinema_id` (`cinema_id`);

--
-- Индексы таблицы `row`
--
ALTER TABLE `row`
  ADD PRIMARY KEY (`id`),
  ADD KEY `column_id` (`column_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `checked`
--
ALTER TABLE `checked`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `column`
--
ALTER TABLE `column`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `data_time`
--
ALTER TABLE `data_time`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `films`
--
ALTER TABLE `films`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `row`
--
ALTER TABLE `row`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `checked`
--
ALTER TABLE `checked`
  ADD CONSTRAINT `checked_ibfk_1` FOREIGN KEY (`date_time_id`) REFERENCES `data_time` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `checked_ibfk_2` FOREIGN KEY (`row_id`) REFERENCES `row` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_time`
--
ALTER TABLE `data_time`
  ADD CONSTRAINT `data_time_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `row`
--
ALTER TABLE `row`
  ADD CONSTRAINT `row_ibfk_1` FOREIGN KEY (`column_id`) REFERENCES `column` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
