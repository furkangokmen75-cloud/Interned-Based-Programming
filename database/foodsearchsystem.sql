-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2026 at 03:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodsearchdb`
--
CREATE DATABASE IF NOT EXISTS `foodsearchdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `foodsearchdb`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`) VALUES
(1, 'Izgara & Kebap'),
(2, 'Fastfood'),
(3, 'Tatlı & Pastane'),
(4, 'Fırın & Unlu Mamüller'),
(5, 'Kahvaltı'),
(6, 'Çorba'),
(7, 'Deniz Ürünleri'),
(8, 'Vegan & Vejetaryen'),
(9, 'Ev Yemekleri'),
(10, 'Kafeterya & Kafe');

-- --------------------------------------------------------

--
-- Table structure for table `favoritemenu`
--

CREATE TABLE `favoritemenu` (
  `MenuID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `FoodName` varchar(50) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`FoodName`, `FoodID`, `CategoryID`, `Description`) VALUES
('Adana Kebap', 1, 1, 'Acılı kıyma kebabı, lavaş ekmeği ile servis edilir'),
('Urfa Kebap', 2, 1, 'Acısız kıyma kebabı, közlenmiş biber ile servis edilir'),
('İskender Kebap', 3, 1, 'Döner kebap, yoğurt ve domates sosu ile servis edilir'),
('Cheeseburger', 4, 2, 'Çift köfte, cheddar peyniri ve özel sos ile'),
('Dürüm', 5, 2, 'Tavuk veya et dolgulu ince lavaş dürümü'),
('Waffle', 6, 3, 'Belçika usulü waffle, çikolata ve meyve ile'),
('Künefe', 7, 3, 'Kadayıf ve peynirden yapılan sıcak tatlı'),
('Baklava', 8, 3, 'Fıstıklı geleneksel Türk tatlısı'),
('Simit', 9, 4, 'Susamlı geleneksel Türk çöreği'),
('Poğaça', 10, 4, 'Peynirli veya patatesli yumuşak hamur böreği'),
('Pide', 11, 4, 'Kıymalı veya peynirli geleneksel Türk pidesi'),
('Serpme Kahvaltı', 12, 5, 'Peynir, zeytin, yumurta ve çeşitli mezelerden oluşan kahvaltı'),
('Menemen', 13, 5, 'Domates, biber ve yumurtadan yapılan geleneksel kahvaltılık'),
('Mercimek Çorbası', 14, 6, 'Kırmızı mercimekten yapılan geleneksel Türk çorbası'),
('İşkembe Çorbası', 15, 6, 'Geleneksel işkembe çorbası, sarımsaklı sirke ile'),
('Balık Tava', 16, 7, 'Günlük taze balık, salata ve pilav ile servis edilir'),
('Karides Güveç', 17, 7, 'Tereyağlı domates sosunda karides güveç'),
('Vegan Köfte', 18, 8, 'Nohut ve sebzelerden yapılan vegan köfte'),
('Kuru Fasulye', 19, 9, 'Geleneksel Türk usulü kuru fasulye, pilav ile'),
('Türk Kahvesi', 20, 10, 'Geleneksel Türk kahvesi, lokum ile servis edilir'),
('Patlıcan Kebap', 21, 1, 'Közlenmiş patlıcan ve kuzu etiyle hazırlanan kebap'),
('Tavuk Şiş', 22, 1, 'Marine edilmiş tavuk parçalarından yapılan şiş kebap'),
('Lahmacun', 23, 1, 'İnce hamur üzerine kıymalı harç ile pişirilen Türk pizzası'),
('Hamburger', 24, 2, 'Özel soslu, turşu ve marul ile servis edilen hamburger'),
('Patates Kızartması', 25, 2, 'Çıtır çıtır kızarmış patates, ketçap ile servis edilir'),
('Hotdog', 26, 2, 'Sosisli sandviç, hardal ve ketçap ile'),
('Profiterol', 27, 3, 'Çikolata soslu krema dolgulu choux hamuru tatlısı'),
('Cheesecake', 28, 3, 'Frambuaz soslu Amerikan usulü cheesecake'),
('Sütlaç', 29, 3, 'Fırında pişirilmiş geleneksel Türk sütlü tatlısı'),
('Açma', 30, 4, 'Yumuşak ve hafif tuzlu geleneksel Türk açması'),
('Börek', 31, 4, 'Peynirli veya ıspanaklı çıtır yufka böreği'),
('Bazlama', 32, 4, 'Sacda pişirilmiş geleneksel Türk ekmeği'),
('Omlet', 33, 5, 'Peynir ve sebzeli kahvaltılık omlet'),
('Sahanda Yumurta', 34, 5, 'Tereyağında pişirilmiş sahanda yumurta'),
('Ezogelin Çorbası', 35, 6, 'Kırmızı mercimek ve bulgurdan yapılan çorba'),
('Domates Çorbası', 36, 6, 'Taze domateslerden yapılan kremalı çorba'),
('Midye Tava', 37, 7, 'Çıtır kızarmış midye, tarator sos ile servis edilir'),
('Ahtapot Izgara', 38, 7, 'Zeytinyağlı marine edilmiş ızgara ahtapot'),
('Mercimek Köftesi', 39, 8, 'Kırmızı mercimek ve bulgurdan yapılan vegan köfte'),
('İmam Bayıldı', 40, 9, 'Zeytinyağlı soğan ve domates dolgulu patlıcan yemeği'),
('Piyaz', 41, 1, 'Köfte yanında servis edilen geleneksel fasulye salatası'),
('Kanat Izgara', 42, 1, 'Marine edilmiş ızgara tavuk kanadı'),
('Köfte', 43, 1, 'Geleneksel Türk köftesi, piyaz ve ekmek ile servis edilir'),
('Sandviç', 44, 2, 'Tavuk veya et dolgulu taze sandviç'),
('Wrap', 45, 2, 'Sebze ve et dolgulu tortilla dürümü'),
('Nugget', 46, 2, 'Çıtır tavuk nugget, sos seçeneği ile'),
('Tiramisu', 47, 3, 'İtalyan usulü kahveli ve maskarpone peynirli tatlı'),
('Muhallebi', 48, 3, 'Geleneksel Türk sütlü muhallebi tatlısı'),
('Revani', 49, 3, 'İrmikten yapılan şerbetli geleneksel Türk tatlısı'),
('Çörek', 50, 4, 'Üzümlü veya sadeli geleneksel Türk çöreği'),
('Katmer', 51, 4, 'Fıstıklı ve kaymaplı çıtır hamur tatlısı'),
('Ekmek', 52, 4, 'Günlük taze pişirilmiş somun ekmek'),
('Sucuklu Yumurta', 53, 5, 'Tavada kızartılmış sucuk ve yumurta'),
('Peynir Tabağı', 54, 5, 'Çeşitli Türk peynirleri ile hazırlanan tabak'),
('Bal & Kaymak', 55, 5, 'Doğal çiçek balı ve taze kaymak'),
('Yayla Çorbası', 56, 6, 'Yoğurt ve pirinçten yapılan geleneksel çorba'),
('Tarhana Çorbası', 57, 6, 'Geleneksel tarhana ile hazırlanan çorba'),
('Paça Çorbası', 58, 6, 'Geleneksel kuzu paçasından yapılan çorba'),
('Hamsi Tava', 59, 7, 'Mısır ununa bulanmış çıtır kızarmış hamsi'),
('Levrek Izgara', 60, 7, 'Zeytinyağlı ve limonlu ızgara levrek'),
('Çipura Buğulama', 61, 7, 'Sebzeli ve beyaz şaraplı buğulama çipura'),
('Falafel', 62, 8, 'Nohuttan yapılan kızarmış Ortadoğu köftesi'),
('Sebze Sote', 63, 8, 'Mevsim sebzelerinden hazırlanan zeytinyağlı sote'),
('Avokado Toast', 64, 8, 'Tam tahıllı ekmek üzerine avokado ezmesi'),
('Etli Güveç', 65, 9, 'Sebzeli kuzu etinden yapılan fırın güveç'),
('Sarma', 66, 9, 'Zeytinyağlı veya etli geleneksel yaprak sarması'),
('Türlü', 67, 9, 'Mevsim sebzelerinden yapılan geleneksel türlü'),
('Filtre Kahve', 68, 10, 'Günlük taze çekilmiş filtre kahve'),
('Salep', 69, 10, 'Tarçınlı geleneksel Türk salepi'),
('Çay', 70, 10, 'Geleneksel Türk çayı, ince belli bardakta servis edilir');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `MenuID` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `StockStatus` tinyint(1) DEFAULT NULL,
  `Rating` decimal(2,1) DEFAULT 0.0,
  `PlaceID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`MenuID`, `Price`, `StockStatus`, `Rating`, `PlaceID`, `FoodID`) VALUES
(1, 85.00, 1, 3.2, 1, 1),
(2, 80.00, 1, 3.0, 1, 2),
(3, 75.00, 1, 3.1, 1, 22),
(4, 45.00, 1, 4.9, 2, 14),
(5, 50.00, 1, 4.7, 2, 15),
(6, 45.00, 1, 4.8, 2, 35),
(7, 40.00, 1, 4.8, 2, 36),
(8, 15.00, 1, 4.3, 3, 9),
(9, 25.00, 1, 4.2, 3, 10),
(10, 20.00, 1, 4.1, 3, 30),
(11, 35.00, 1, 4.2, 3, 31),
(12, 18.00, 1, 4.3, 3, 32),
(13, 55.00, 1, 4.9, 4, 20),
(14, 70.00, 1, 4.8, 4, 6),
(15, 85.00, 1, 4.9, 4, 27),
(16, 90.00, 1, 4.9, 4, 28),
(17, 70.00, 1, 4.1, 5, 19),
(18, 65.00, 1, 4.0, 5, 40),
(19, 55.00, 1, 3.9, 5, 13),
(20, 180.00, 1, 4.1, 6, 16),
(21, 220.00, 1, 3.9, 6, 17),
(22, 150.00, 1, 4.0, 6, 37),
(23, 250.00, 1, 4.0, 6, 38),
(24, 75.00, 1, 4.8, 7, 6),
(25, 90.00, 1, 5.0, 7, 7),
(26, 80.00, 1, 4.9, 7, 8),
(27, 85.00, 1, 4.9, 7, 29),
(28, 120.00, 1, 4.5, 8, 4),
(29, 110.00, 1, 4.3, 8, 24),
(30, 50.00, 1, 4.4, 8, 25),
(31, 100.00, 1, 4.4, 8, 5),
(32, 70.00, 1, 3.4, 9, 5),
(33, 65.00, 1, 3.2, 9, 23),
(34, 90.00, 1, 3.3, 9, 22),
(35, 130.00, 1, 4.6, 10, 4),
(36, 120.00, 1, 4.4, 10, 24),
(37, 45.00, 1, 4.5, 10, 25),
(38, 125.00, 1, 4.8, 11, 24),
(39, 50.00, 1, 4.6, 11, 25),
(40, 60.00, 1, 4.7, 11, 26),
(41, 40.00, 1, 4.2, 12, 14),
(42, 45.00, 1, 4.0, 12, 15),
(43, 40.00, 1, 4.1, 12, 35),
(44, 80.00, 1, 4.4, 13, 11),
(45, 55.00, 1, 4.2, 13, 23),
(46, 40.00, 1, 4.3, 13, 31),
(47, 70.00, 1, 4.1, 14, 6),
(48, 80.00, 1, 3.9, 14, 27),
(49, 85.00, 1, 4.0, 14, 28),
(50, 200.00, 1, 3.9, 15, 16),
(51, 270.00, 1, 3.7, 15, 38),
(52, 230.00, 1, 3.8, 15, 17),
(53, 85.00, 1, 4.2, 16, 7),
(54, 75.00, 1, 4.0, 16, 8),
(55, 70.00, 1, 4.1, 16, 29),
(56, 90.00, 1, 4.3, 17, 18),
(57, 85.00, 1, 4.1, 17, 39),
(58, 80.00, 1, 4.2, 17, 40),
(59, 55.00, 1, 3.0, 18, 5),
(60, 45.00, 1, 2.8, 18, 26),
(61, 35.00, 1, 2.9, 18, 25),
(62, 150.00, 1, 4.6, 19, 12),
(63, 80.00, 1, 4.4, 19, 13),
(64, 70.00, 1, 4.5, 19, 33),
(65, 50.00, 1, 4.4, 20, 20),
(66, 90.00, 1, 4.2, 20, 28),
(67, 75.00, 1, 4.3, 20, 6),
(68, 160.00, 1, 4.8, 21, 12),
(69, 65.00, 1, 4.6, 21, 34),
(70, 75.00, 1, 4.7, 21, 33),
(71, 85.00, 1, 3.2, 22, 18),
(72, 80.00, 1, 3.0, 22, 39),
(73, 75.00, 1, 3.1, 22, 40),
(74, 65.00, 1, 4.1, 23, 5),
(75, 75.00, 1, 4.3, 23, 43),
(76, 60.00, 1, 4.2, 23, 23),
(77, 70.00, 1, 4.0, 24, 43),
(78, 45.00, 1, 3.8, 24, 44),
(79, 50.00, 1, 3.9, 24, 45),
(80, 95.00, 1, 4.7, 25, 1),
(81, 90.00, 1, 4.5, 25, 2),
(82, 85.00, 1, 4.6, 25, 42),
(83, 80.00, 1, 4.6, 25, 43),
(84, 35.00, 1, 4.5, 25, 41),
(85, 140.00, 1, 4.5, 26, 12),
(86, 75.00, 1, 4.3, 26, 53),
(87, 60.00, 1, 4.4, 26, 54),
(88, 65.00, 1, 4.4, 26, 55),
(89, 70.00, 1, 4.3, 26, 33),
(90, 75.00, 1, 4.4, 27, 11),
(91, 50.00, 1, 4.2, 27, 23),
(92, 40.00, 1, 4.3, 27, 31),
(93, 15.00, 1, 4.3, 27, 52),
(94, 45.00, 1, 4.8, 28, 14),
(95, 45.00, 1, 4.7, 28, 56),
(96, 45.00, 1, 4.6, 28, 57),
(97, 50.00, 1, 4.7, 28, 58),
(98, 50.00, 1, 4.2, 29, 68),
(99, 45.00, 1, 4.0, 29, 20),
(100, 55.00, 1, 4.1, 29, 44),
(101, 25.00, 1, 4.1, 29, 70),
(102, 85.00, 1, 4.6, 30, 40),
(103, 90.00, 1, 4.5, 30, 66),
(104, 80.00, 1, 4.4, 30, 67),
(105, 75.00, 1, 4.5, 30, 63),
(106, 120.00, 1, 4.4, 31, 59),
(107, 180.00, 1, 4.3, 31, 60),
(108, 170.00, 1, 4.2, 31, 61),
(109, 160.00, 1, 4.3, 31, 16),
(110, 90.00, 1, 4.1, 32, 1),
(111, 85.00, 1, 3.9, 32, 42),
(112, 80.00, 1, 4.0, 32, 43),
(113, 88.00, 1, 4.0, 32, 22),
(114, 75.00, 1, 4.7, 33, 6),
(115, 85.00, 1, 4.6, 33, 47),
(116, 70.00, 1, 4.5, 33, 48),
(117, 75.00, 1, 4.6, 33, 49),
(118, 85.00, 1, 4.9, 34, 1),
(119, 80.00, 1, 4.8, 34, 2),
(120, 75.00, 1, 4.8, 34, 43),
(121, 70.00, 1, 4.7, 34, 5),
(122, 130.00, 1, 4.3, 35, 59),
(123, 190.00, 1, 4.2, 35, 60),
(124, 140.00, 1, 4.1, 35, 37),
(125, 180.00, 1, 4.2, 35, 61),
(126, 70.00, 1, 3.9, 36, 11),
(127, 45.00, 1, 3.7, 36, 23),
(128, 35.00, 1, 3.8, 36, 31),
(129, 20.00, 1, 3.8, 36, 10),
(130, 65.00, 1, 4.2, 37, 5),
(131, 55.00, 1, 4.0, 37, 45),
(132, 50.00, 1, 4.1, 37, 44),
(133, 70.00, 1, 4.5, 38, 19),
(134, 80.00, 1, 4.4, 38, 65),
(135, 75.00, 1, 4.3, 38, 66),
(136, 70.00, 1, 4.4, 38, 67),
(137, 20.00, 1, 3.8, 39, 70),
(138, 45.00, 1, 3.7, 39, 20),
(139, 55.00, 1, 3.7, 39, 69),
(140, 30.00, 1, 3.6, 39, 50),
(141, 160.00, 1, 4.9, 40, 12),
(142, 70.00, 1, 4.8, 40, 55),
(143, 80.00, 1, 4.9, 40, 53),
(144, 65.00, 1, 4.9, 40, 54),
(145, 75.00, 1, 4.8, 40, 34),
(146, 88.00, 1, 4.4, 41, 1),
(147, 85.00, 1, 4.2, 41, 21),
(148, 80.00, 1, 4.3, 41, 42),
(149, 75.00, 1, 4.3, 41, 43),
(150, 220.00, 1, 4.7, 42, 16),
(151, 250.00, 1, 4.6, 42, 60),
(152, 240.00, 1, 4.5, 42, 61),
(153, 280.00, 1, 4.6, 42, 38),
(154, 25.00, 1, 3.0, 1, 41),
(155, 78.00, 1, 3.2, 1, 43),
(156, 55.00, 1, 4.8, 4, 68),
(157, 50.00, 1, 4.7, 4, 69),
(158, 25.00, 1, 4.9, 4, 70),
(159, 20.00, 1, 4.2, 3, 50),
(160, 12.00, 1, 4.3, 3, 52),
(161, 35.00, 1, 4.1, 3, 51),
(162, 95.00, 1, 4.3, 17, 62),
(163, 85.00, 1, 4.2, 17, 63),
(164, 90.00, 1, 4.1, 17, 64),
(165, 85.00, 1, 4.6, 19, 53),
(166, 70.00, 1, 4.5, 19, 55),
(167, 65.00, 1, 4.4, 19, 54);

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `PlaceName` varchar(50) NOT NULL,
  `PlaceID` int(11) NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Rating` decimal(2,1) DEFAULT 0.0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`PlaceName`, `PlaceID`, `Location`, `Rating`) VALUES
('Köfteci Aykut', 1, '17 Eylül Mahallesi, Atatürk Caddesi, No:10, Bandırma, Balıkesir', 3.1),
('Çorbacı Aslı', 2, 'Paşabayır Mahallesi, Mehmetçik Caddesi, No:45, Bandırma, Balıkesir', 4.8),
('Enes Fırın', 3, 'İhsaniye Mahallesi, Kurtuluş Sokak, No:12, Bandırma, Balıkesir', 4.2),
('Berkay Coffee', 4, 'Hürriyet Caddesi, No:88/A, Gönen, Balıkesir', 4.9),
('Hatun Ev Yemekleri', 5, 'Günaydın Mahallesi, Terziler Sitesi, No:5, Bandırma, Balıkesir', 4.0),
('Balıkçı Buğra Ustanın Yeri', 6, 'Plevne Mahallesi, Şehit Birol Koç Caddesi, No:22, Altıeylül, Balıkesir', 4.0),
('Çikolata İstasyonu', 7, 'Dörtyol Mevkii, No:3, Bandırma, Balıkesir', 4.9),
('Kampüs Burger', 8, 'Edremit Yolu Üzeri, 4. Kilometre, Burhaniye, Balıkesir', 4.4),
('Dönerci Mahmut Usta', 9, 'Bahçelievler Mahallesi, 100. Yıl Caddesi, No:14, Karesi, Balıkesir', 3.3),
('Pizza Kulesi', 10, 'Akçay Mahallesi, Leman Akpınar Caddesi, No:50, Edremit, Balıkesir', 4.5),
('Mükemmel Pizza', 11, 'Sakarya Mahallesi, Cumhuriyet Meydanı, No:12, Ayvalık, Balıkesir', 4.7),
('Abdül Ustanın Çorbacısı', 12, '600 Evler Mahallesi, Atatürk Caddesi, No:102, Bandırma, Balıkesir', 4.1),
('Has Pide Salonu', 13, 'Dere Mahallesi, Ordu Caddesi, No:19, Bandırma, Balıkesir', 4.3),
('Waffle Center Bandırma', 14, 'Sunullah Mahallesi, Ordu Caddesi, No:67, Bandırma, Balıkesir', 4.0),
('Merkez Balık Restoranı', 15, 'Cunda Adası, Mithatpaşa Mahallesi, No:8, Ayvalık, Balıkesir', 3.8),
('Tatlı Dünyası', 16, 'Eski Kuyumcular Mahallesi, Hükümet Caddesi, No:9, Karesi, Balıkesir', 4.1),
('Vegan House', 17, 'Malkoç Mahallesi, Banyolar Caddesi, No:2, Gönen, Balıkesir', 4.2),
('Tost Sarayı', 18, 'İstasyon Mahallesi, İzmir Yolu Üzeri, Susurluk, Balıkesir', 2.9),
('Manyas Çerkes Peynircisi & Kahvaltı', 19, 'Atatürk Mahallesi, Bandırma Caddesi, No:34, Manyas, Balıkesir', 4.5),
('Körfez Coffee', 20, 'Camivasat Mahallesi, Gazi Caddesi, No:7, Edremit, Balıkesir', 4.3),
('Deniz Kahvaltı Evi', 21, 'Zeytinli Mahallesi, Dere Sokak, No:33, Edremit, Balıkesir', 4.7),
('Doğa Dostu Lezzetler', 22, 'Bahçelievler Mahallesi, Teknik Lise Caddesi, No:19, Karesi, Balıkesir', 3.1),
('Bandırma Döner Evi', 23, 'Cumhuriyet Mahallesi, Atatürk Caddesi, No:15, Bandırma, Balıkesir', 4.2),
('Lezzet Durağı', 24, 'Yeni Mahalle, Çarşı Caddesi, No:8, Bandırma, Balıkesir', 3.9),
('Ustanın Kebabı', 25, 'Şehitler Mahallesi, İnönü Caddesi, No:22, Bandırma, Balıkesir', 2.6),
('Kahvaltı Evi Bandırma', 26, 'Cumhuriyet Mahallesi, Fevzi Çakmak Caddesi, No:5, Bandırma, Balıkesir', 4.4),
('Deniz Pide Salonu', 27, 'Sahil Mahallesi, Körfez Caddesi, No:11, Erdek, Balıkesir', 4.3),
('Gönen Çorbacısı', 28, 'Hisar Mahallesi, Cumhuriyet Caddesi, No:3, Gönen, Balıkesir', 4.7),
('Ayvalık Tost & Kahve', 29, 'Çamlık Mahallesi, Atatürk Bulvarı, No:44, Ayvalık, Balıkesir', 4.1),
('Edremit Zeytinyağlıları', 30, 'Mehmetçik Mahallesi, Zeytin Sokak, No:6, Edremit, Balıkesir', 4.5),
('Burhaniye Balık Evi', 31, 'Mahkeme Mahallesi, Liman Caddesi, No:18, Burhaniye, Balıkesir', 4.3),
('Sındırgı Et Mangal', 32, 'Çarşı Mahallesi, Belediye Caddesi, No:9, Sındırgı, Balıkesir', 4.0),
('Erdek Waffle & Tatlı', 33, 'Yalı Mahallesi, Sahil Yolu, No:27, Erdek, Balıkesir', 4.6),
('Susurluk Ayranı & Kebap', 34, 'Hamidiye Mahallesi, Atatürk Caddesi, No:33, Susurluk, Balıkesir', 4.8),
('Gömeç Balıkçısı', 35, 'Sahil Mahallesi, Deniz Caddesi, No:2, Gömeç, Balıkesir', 4.2),
('Karesi Pide & Lahmacun', 36, 'Dumlupınar Mahallesi, Millet Caddesi, No:41, Karesi, Balıkesir', 3.8),
('Altıeylül Tantuni', 37, 'Yıldız Mahallesi, Kuvayı Milliye Caddesi, No:17, Altıeylül, Balıkesir', 4.1),
('Dursunbey Ev Yemekleri', 38, 'Camii Mahallesi, Hükümet Caddesi, No:12, Dursunbey, Balıkesir', 4.4),
('Çay Bahçesi & Kafe', 39, 'Merkez Mahalle, Cumhuriyet Meydanı, No:1, İvrindi, Balıkesir', 3.7),
('Havran Köy Kahvaltısı', 40, 'Bağlar Mahallesi, Zeytinlik Sokak, No:8, Havran, Balıkesir', 4.9),
('Bigadiç Izgara Evi', 41, 'Yeni Mahalle, Atatürk Caddesi, No:55, Bigadiç, Balıkesir', 3.3),
('Marmara Adası Balık Restoranı', 42, 'Marmara Mahallesi, Liman Karşısı, No:4, Marmara Adası, Balıkesir', 1.6);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `ReviewID` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Text` text DEFAULT NULL,
  `Rating` decimal(2,1) DEFAULT NULL,
  `Date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `EmailAddress` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ReviewCount` int(11) DEFAULT 0,
  `IsAdmin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `favoritemenu`
--
ALTER TABLE `favoritemenu`
  ADD PRIMARY KEY (`MenuID`,`UserID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`FoodID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`MenuID`),
  ADD KEY `PlaceID` (`PlaceID`),
  ADD KEY `FoodID` (`FoodID`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`PlaceID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `MenuID` (`MenuID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `EmailAddress` (`EmailAddress`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `FoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `MenuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `PlaceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favoritemenu`
--
ALTER TABLE `favoritemenu`
  ADD CONSTRAINT `favoritemenu_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favoritemenu_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`PlaceID`) REFERENCES `places` (`PlaceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `foods` (`FoodID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"foodsearchdb\",\"table\":\"Places\"},{\"db\":\"foodsearchdb\",\"table\":\"Foods\"},{\"db\":\"foodsearchdb\",\"table\":\"foods\"},{\"db\":\"foodsearchdb\",\"table\":\"categories\"},{\"db\":\"foodsearchdb\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-05-24 12:20:39', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
