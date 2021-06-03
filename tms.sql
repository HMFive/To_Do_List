-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 12 May 2021, 20:19:25
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `tms`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `list`
--

DROP TABLE IF EXISTS `list`;
CREATE TABLE IF NOT EXISTS `list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_turkish_ci NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `list`
--

INSERT INTO `list` (`id`, `name`, `userID`) VALUES
(75, 'Shopping List', 98),
(76, 'Blacksmith', 98),
(78, 'My Films', 99),
(79, 'Series', 99);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_turkish_ci NOT NULL,
  `listID` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `important` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `listID` (`listID`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `note`
--

INSERT INTO `note` (`id`, `userID`, `title`, `listID`, `status`, `important`) VALUES
(111, 98, 'Apple', 75, 0, 1),
(112, 98, 'Grape', 75, 0, 1),
(113, 98, 'Pear', 75, 0, 0),
(114, 98, 'Sword', 76, 1, 1),
(115, 98, 'Hammer', 76, 1, 0),
(116, 98, 'Knife', 76, 0, 1),
(117, 99, 'Kill Bill', 78, 0, 1),
(118, 99, 'Django Unchained', 78, 1, 1),
(119, 99, 'The Hateful Eight', 78, 0, 0),
(120, 99, 'Breaking Bad', 79, 0, 0),
(121, 99, 'Game of Thrones', 79, 0, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_turkish_ci NOT NULL,
  `email` varchar(256) COLLATE utf8mb4_turkish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL,
  `profile` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `profile`) VALUES
(95, 'yusuf', 'dfsf', '$2y$10$T6zX63B3E1cXVb1LFk56ee2TFWY/aGeJCfMNbUUuMJ0d9vgUID8nu', NULL),
(96, 'yusuf çiftci', 'yusufciftci@outlook.com.tr', '$2y$10$PKz3MyzI.pi8DfMlWdUojeuzJq.JDfnWG62bG1agAbeeHsmwSvEkG', NULL),
(98, 'Stanley Kubrick', 'kubrick@gmail.com', '$2y$10$w8iRek4l8BHw.4riDYmfpu9BMpsl1CJasEGN9GId0zUmpDG3dgXM6', '1340b9477ca6bf42cd8288b70287e72e4d35f688.jpg'),
(99, 'Quentin Tarantino', 'tarantino@gmail.com', '$2y$10$ZfiZSF0dUYKXOxRNliNyuumMYZfUCe8tQ8PU/sdeVCvzobpZcY3xa', 'd43c132f4c4206e5ae1ce1618d9ac3f3441b2b72.jpg');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `list`
--
ALTER TABLE `list`
  ADD CONSTRAINT `list_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`listID`) REFERENCES `list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
