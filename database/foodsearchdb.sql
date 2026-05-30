-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2026 at 08:13 PM
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

--
-- Dumping data for table `favoritemenu`
--

INSERT INTO `favoritemenu` (`MenuID`, `UserID`) VALUES
(15, 1),
(141, 1);

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `FoodName` varchar(50) NOT NULL,
  `FoodID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `Description` text DEFAULT NULL,
  `ImagePath` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`FoodName`, `FoodID`, `CategoryID`, `Description`, `ImagePath`) VALUES
('Adana Kebap', 1, 1, 'Acılı kıyma kebabı, lavaş ekmeği ile servis edilir', 'images/adana_kebap.jpg'),
('Urfa Kebap', 2, 1, 'Acısız kıyma kebabı, közlenmiş biber ile servis edilir', 'images/urfa_kebap.jpg'),
('İskender Kebap', 3, 1, 'Döner kebap, yoğurt ve domates sosu ile servis edilir', 'images/iskender_kebab.jpg'),
('Cheeseburger', 4, 2, 'Çift köfte, cheddar peyniri ve özel sos ile', 'images/cheeseburger.jpg'),
('Dürüm', 5, 2, 'Tavuk veya et dolgulu ince lavaş dürümü', 'images/dürüm.jpg'),
('Waffle', 6, 3, 'Belçika usulü waffle, çikolata ve meyve ile', 'images/waffle.jpg'),
('Künefe', 7, 3, 'Kadayıf ve peynirden yapılan sıcak tatlı', 'images/künefe.jpg'),
('Baklava', 8, 3, 'Fıstıklı geleneksel Türk tatlısı', 'images/baklava.jpg'),
('Simit', 9, 4, 'Susamlı geleneksel Türk çöreği', 'images/simit.jpg'),
('Poğaça', 10, 4, 'Peynirli veya patatesli yumuşak hamur böreği', 'images/poğaça.jpg'),
('Pide', 11, 4, 'Kıymalı veya peynirli geleneksel Türk pidesi', 'images/pide.jpg'),
('Serpme Kahvaltı', 12, 5, 'Peynir, zeytin, yumurta ve çeşitli mezelerden oluşan kahvaltı', 'images/serpme_kahvaltı.jpg'),
('Menemen', 13, 5, 'Domates, biber ve yumurtadan yapılan geleneksel kahvaltılık', 'images/menemen.jpg'),
('Mercimek Çorbası', 14, 6, 'Kırmızı mercimekten yapılan geleneksel Türk çorbası', 'images/mercimek_çorbası.jpg'),
('İşkembe Çorbası', 15, 6, 'Geleneksel işkembe çorbası, sarımsaklı sirke ile', 'images/işkembe_çorbası.jpg'),
('Balık Tava', 16, 7, 'Günlük taze balık, salata ve pilav ile servis edilir', 'images/balık_tava.jpg'),
('Karides Güveç', 17, 7, 'Tereyağlı domates sosunda karides güveç', 'images/karides_güveç.jpg'),
('Vegan Köfte', 18, 8, 'Nohut ve sebzelerden yapılan vegan köfte', 'images/vegan_köfte.jpg'),
('Kuru Fasulye', 19, 9, 'Geleneksel Türk usulü kuru fasulye, pilav ile', 'images/kuru_fasulye.jpg'),
('Türk Kahvesi', 20, 10, 'Geleneksel Türk kahvesi, lokum ile servis edilir', 'images/türk_kahvesi.jpg'),
('Patlıcan Kebap', 21, 1, 'Közlenmiş patlıcan ve kuzu etiyle hazırlanan kebap', 'images/patlıcan_kebap.jpg'),
('Tavuk Şiş', 22, 1, 'Marine edilmiş tavuk parçalarından yapılan şiş kebap', 'images/tavuk_şiş.jpg'),
('Lahmacun', 23, 1, 'İnce hamur üzerine kıymalı harç ile pişirilen Türk pizzası', 'images/lahmacun.jpg'),
('Hamburger', 24, 2, 'Özel soslu, turşu ve marul ile servis edilen hamburger', 'images/hamburger.jpg'),
('Patates Kızartması', 25, 2, 'Çıtır çıtır kızarmış patates, ketçap ile servis edilir', 'images/patates_kızartması.jpg'),
('Hotdog', 26, 2, 'Sosisli sandviç, hardal ve ketçap ile', 'images/hotdog.jpg'),
('Profiterol', 27, 3, 'Çikolata soslu krema dolgulu choux hamuru tatlısı', 'images/profiterol.jpg'),
('Cheesecake', 28, 3, 'Frambuaz soslu Amerikan usulü cheesecake', 'images/cheesecake.jpg'),
('Sütlaç', 29, 3, 'Fırında pişirilmiş geleneksel Türk sütlü tatlısı', 'images/sütlaç.jpg'),
('Açma', 30, 4, 'Yumuşak ve hafif tuzlu geleneksel Türk açması', 'images/açma.jpg'),
('Börek', 31, 4, 'Peynirli veya ıspanaklı çıtır yufka böreği', 'images/börek.jpg'),
('Bazlama', 32, 4, 'Sacda pişirilmiş geleneksel Türk ekmeği', 'images/bazlama.jpg'),
('Omlet', 33, 5, 'Peynir ve sebzeli kahvaltılık omlet', 'images/omlet.jpg'),
('Sahanda Yumurta', 34, 5, 'Tereyağında pişirilmiş sahanda yumurta', 'images/sahanda_yumurta.jpg'),
('Ezogelin Çorbası', 35, 6, 'Kırmızı mercimek ve bulgurdan yapılan çorba', 'images/ezogelin_çorbası.jpg'),
('Domates Çorbası', 36, 6, 'Taze domateslerden yapılan kremalı çorba', 'images/domates_çorbası.jpg'),
('Midye Tava', 37, 7, 'Çıtır kızarmış midye, tarator sos ile servis edilir', 'images/midye_tava.jpg'),
('Ahtapot Izgara', 38, 7, 'Zeytinyağlı marine edilmiş ızgara ahtapot', 'images/ahtapot_izgara.jpg'),
('Mercimek Köftesi', 39, 8, 'Kırmızı mercimek ve bulgurdan yapılan vegan köfte', 'images/mercimek_köftesi.jpg'),
('İmam Bayıldı', 40, 9, 'Zeytinyağlı soğan ve domates dolgulu patlıcan yemeği', 'images/imam_bayıldı.jpg'),
('Piyaz', 41, 1, 'Köfte yanında servis edilen geleneksel fasulye salatası', 'images/piyaz.jpg'),
('Kanat Izgara', 42, 1, 'Marine edilmiş ızgara tavuk kanadı', 'images/kanat_izgara.jpg'),
('Köfte', 43, 1, 'Geleneksel Türk köftesi, piyaz ve ekmek ile servis edilir', 'images/köfte.jpg'),
('Sandviç', 44, 2, 'Tavuk veya et dolgulu taze sandviç', 'images/sandviç.jpg'),
('Wrap', 45, 2, 'Sebze ve et dolgulu tortilla dürümü', 'images/wrap.jpg'),
('Nugget', 46, 2, 'Çıtır tavuk nugget, sos seçeneği ile', 'images/nugget.jpg'),
('Tiramisu', 47, 3, 'İtalyan usulü kahveli ve maskarpone peynirli tatlı', 'images/tiramisu.jpg'),
('Muhallebi', 48, 3, 'Geleneksel Türk sütlü muhallebi tatlısı', 'images/muhallebi.jpg'),
('Revani', 49, 3, 'İrmikten yapılan şerbetli geleneksel Türk tatlısı', 'images/revani.jpg'),
('Çörek', 50, 4, 'Üzümlü veya sadeli geleneksel Türk çöreği', 'images/çörek.jpg'),
('Katmer', 51, 4, 'Fıstıklı ve kaymaplı çıtır hamur tatlısı', 'images/katmer.jpg'),
('Ekmek', 52, 4, 'Günlük taze pişirilmiş somun ekmek', 'images/ekmek.jpg'),
('Sucuklu Yumurta', 53, 5, 'Tavada kızartılmış sucuk ve yumurta', 'images/sucuklu_yumurta.jpg'),
('Peynir Tabağı', 54, 5, 'Çeşitli Türk peynirleri ile hazırlanan tabak', 'images/peynir_tabağı.jpg'),
('Bal & Kaymak', 55, 5, 'Doğal çiçek balı ve taze kaymak', 'images/bal_kaymak.jpg'),
('Yayla Çorbası', 56, 6, 'Yoğurt ve pirinçten yapılan geleneksel çorba', 'images/yayla_çorbası.jpg'),
('Tarhana Çorbası', 57, 6, 'Geleneksel tarhana ile hazırlanan çorba', 'images/tarhana_çorbası.jpg'),
('Paça Çorbası', 58, 6, 'Geleneksel kuzu paçasından yapılan çorba', 'images/paça_çorbası.jpg'),
('Hamsi Tava', 59, 7, 'Mısır ununa bulanmış çıtır kızarmış hamsi', 'images/hamsi_tava.jpg'),
('Levrek Izgara', 60, 7, 'Zeytinyağlı ve limonlu ızgara levrek', 'images/levrek_izgara.jpg'),
('Çipura Buğulama', 61, 7, 'Sebzeli ve beyaz şaraplı buğulama çipura', 'images/çipura_buğulama.jpg'),
('Falafel', 62, 8, 'Nohuttan yapılan kızarmış Ortadoğu köftesi', 'images/falafel.jpg'),
('Sebze Sote', 63, 8, 'Mevsim sebzelerinden hazırlanan zeytinyağlı sote', 'images/sebze_sote.jpg'),
('Avokado Toast', 64, 8, 'Tam tahıllı ekmek üzerine avokado ezmesi', 'images/avakado_toast.jpg'),
('Etli Güveç', 65, 9, 'Sebzeli kuzu etinden yapılan fırın güveç', 'images/etli_güveç.jpg'),
('Sarma', 66, 9, 'Zeytinyağlı veya etli geleneksel yaprak sarması', 'images/sarma.jpg'),
('Türlü', 67, 9, 'Mevsim sebzelerinden yapılan geleneksel türlü', 'images/türlü.jpg'),
('Filtre Kahve', 68, 10, 'Günlük taze çekilmiş filtre kahve', 'images/filtre_kahve.jpg'),
('Salep', 69, 10, 'Tarçınlı geleneksel Türk salepi', 'images/salep.jpg'),
('Çay', 70, 10, 'Geleneksel Türk çayı, ince belli bardakta servis edilir', 'images/çay.jpg');

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
(4, 45.00, 1, 3.0, 2, 14),
(5, 50.00, 1, 4.7, 2, 15),
(6, 45.00, 1, 4.8, 2, 35),
(7, 40.00, 1, 4.8, 2, 36),
(8, 15.00, 1, 4.3, 3, 9),
(9, 25.00, 1, 4.2, 3, 10),
(10, 20.00, 1, 4.1, 3, 30),
(11, 35.00, 1, 4.2, 3, 31),
(12, 18.00, 1, 4.3, 3, 32),
(13, 55.00, 1, 4.0, 4, 20),
(14, 70.00, 1, 4.0, 4, 6),
(15, 85.00, 1, 4.0, 4, 27),
(16, 90.00, 1, 4.0, 4, 28),
(17, 70.00, 1, 4.1, 5, 19),
(18, 65.00, 1, 4.0, 5, 40),
(19, 55.00, 1, 3.9, 5, 13),
(20, 180.00, 1, 4.1, 6, 16),
(21, 220.00, 1, 3.9, 6, 17),
(22, 150.00, 1, 4.0, 6, 37),
(23, 250.00, 1, 5.0, 6, 38),
(24, 75.00, 1, 4.8, 7, 6),
(25, 90.00, 1, 3.0, 7, 7),
(26, 80.00, 1, 4.0, 7, 8),
(27, 85.00, 1, 3.5, 7, 29),
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
(118, 85.00, 1, 4.7, 34, 1),
(119, 80.00, 1, 4.0, 34, 2),
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
(141, 160.00, 1, 4.0, 40, 12),
(142, 70.00, 1, 4.8, 40, 55),
(143, 80.00, 1, 4.5, 40, 53),
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
(154, 25.00, 1, 2.0, 1, 41),
(155, 78.00, 1, 1.3, 1, 43),
(156, 55.00, 1, 4.8, 4, 68),
(157, 50.00, 1, 4.7, 4, 69),
(158, 25.00, 1, 5.0, 4, 70),
(159, 20.00, 1, 4.2, 3, 50),
(160, 12.00, 1, 4.3, 3, 52),
(161, 35.00, 1, 4.1, 3, 51),
(162, 95.00, 1, 4.3, 17, 62),
(163, 85.00, 1, 4.2, 17, 63),
(164, 90.00, 1, 4.1, 17, 64),
(165, 85.00, 1, 4.6, 19, 53),
(166, 70.00, 1, 4.5, 19, 55),
(167, 65.00, 1, 4.4, 19, 54),
(168, 85.00, 1, 4.8, 43, 7),
(169, 90.00, 1, 4.7, 43, 8),
(170, 95.00, 1, 4.6, 43, 27),
(171, 100.00, 1, 4.8, 43, 28),
(172, 75.00, 1, 4.7, 43, 29),
(173, 90.00, 1, 4.6, 43, 47),
(174, 70.00, 1, 4.5, 43, 48),
(175, 80.00, 1, 4.7, 43, 49);

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `PlaceName` varchar(50) NOT NULL,
  `PlaceID` int(11) NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Rating` decimal(2,1) DEFAULT 0.0,
  `ImagePath` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`PlaceName`, `PlaceID`, `Location`, `Rating`, `ImagePath`) VALUES
('Köfteci Aykut', 1, '17 Eylül Mahallesi, Atatürk Caddesi, No:10, Bandırma, Balıkesir', 2.5, NULL),
('Çorbacı Aslı', 2, 'Paşabayır Mahallesi, Mehmetçik Caddesi, No:45, Bandırma, Balıkesir', 4.3, NULL),
('Enes Fırın', 3, 'İhsaniye Mahallesi, Kurtuluş Sokak, No:12, Bandırma, Balıkesir', 4.2, NULL),
('Berkay Coffee', 4, 'Hürriyet Caddesi, No:88/A, Gönen, Balıkesir', 4.4, NULL),
('Hatun Ev Yemekleri', 5, 'Günaydın Mahallesi, Terziler Sitesi, No:5, Bandırma, Balıkesir', 4.0, NULL),
('Balıkçı Buğra Ustanın Yeri', 6, 'Plevne Mahallesi, Şehit Birol Koç Caddesi, No:22, Altıeylül, Balıkesir', 4.3, NULL),
('Çikolata İstasyonu', 7, 'Dörtyol Mevkii, No:3, Bandırma, Balıkesir', 3.8, NULL),
('Kampüs Burger', 8, 'Edremit Yolu Üzeri, 4. Kilometre, Burhaniye, Balıkesir', 4.4, NULL),
('Dönerci Mahmut Usta', 9, 'Bahçelievler Mahallesi, 100. Yıl Caddesi, No:14, Karesi, Balıkesir', 3.3, NULL),
('Pizza Kulesi', 10, 'Akçay Mahallesi, Leman Akpınar Caddesi, No:50, Edremit, Balıkesir', 4.5, NULL),
('Mükemmel Pizza', 11, 'Sakarya Mahallesi, Cumhuriyet Meydanı, No:12, Ayvalık, Balıkesir', 4.7, NULL),
('Abdül Ustanın Çorbacısı', 12, '600 Evler Mahallesi, Atatürk Caddesi, No:102, Bandırma, Balıkesir', 4.1, NULL),
('Has Pide Salonu', 13, 'Dere Mahallesi, Ordu Caddesi, No:19, Bandırma, Balıkesir', 4.3, NULL),
('Waffle Center Bandırma', 14, 'Sunullah Mahallesi, Ordu Caddesi, No:67, Bandırma, Balıkesir', 4.0, NULL),
('Merkez Balık Restoranı', 15, 'Cunda Adası, Mithatpaşa Mahallesi, No:8, Ayvalık, Balıkesir', 3.8, NULL),
('Tatlı Dünyası', 16, 'Eski Kuyumcular Mahallesi, Hükümet Caddesi, No:9, Karesi, Balıkesir', 4.1, NULL),
('Vegan House', 17, 'Malkoç Mahallesi, Banyolar Caddesi, No:2, Gönen, Balıkesir', 4.2, NULL),
('Tost Sarayı', 18, 'İstasyon Mahallesi, İzmir Yolu Üzeri, Susurluk, Balıkesir', 2.9, NULL),
('Manyas Çerkes Peynircisi & Kahvaltı', 19, 'Atatürk Mahallesi, Bandırma Caddesi, No:34, Manyas, Balıkesir', 4.5, NULL),
('Körfez Coffee', 20, 'Camivasat Mahallesi, Gazi Caddesi, No:7, Edremit, Balıkesir', 4.3, NULL),
('Deniz Kahvaltı Evi', 21, 'Zeytinli Mahallesi, Dere Sokak, No:33, Edremit, Balıkesir', 4.7, NULL),
('Doğa Dostu Lezzetler', 22, 'Bahçelievler Mahallesi, Teknik Lise Caddesi, No:19, Karesi, Balıkesir', 3.1, NULL),
('Bandırma Döner Evi', 23, 'Cumhuriyet Mahallesi, Atatürk Caddesi, No:15, Bandırma, Balıkesir', 4.2, NULL),
('Lezzet Durağı', 24, 'Yeni Mahalle, Çarşı Caddesi, No:8, Bandırma, Balıkesir', 3.9, NULL),
('Ustanın Kebabı', 25, 'Şehitler Mahallesi, İnönü Caddesi, No:22, Bandırma, Balıkesir', 2.6, NULL),
('Kahvaltı Evi Bandırma', 26, 'Cumhuriyet Mahallesi, Fevzi Çakmak Caddesi, No:5, Bandırma, Balıkesir', 4.4, NULL),
('Deniz Pide Salonu', 27, 'Sahil Mahallesi, Körfez Caddesi, No:11, Erdek, Balıkesir', 4.3, NULL),
('Gönen Çorbacısı', 28, 'Hisar Mahallesi, Cumhuriyet Caddesi, No:3, Gönen, Balıkesir', 4.7, NULL),
('Ayvalık Tost & Kahve', 29, 'Çamlık Mahallesi, Atatürk Bulvarı, No:44, Ayvalık, Balıkesir', 4.1, NULL),
('Edremit Zeytinyağlıları', 30, 'Mehmetçik Mahallesi, Zeytin Sokak, No:6, Edremit, Balıkesir', 4.5, NULL),
('Burhaniye Balık Evi', 31, 'Mahkeme Mahallesi, Liman Caddesi, No:18, Burhaniye, Balıkesir', 4.3, NULL),
('Sındırgı Et Mangal', 32, 'Çarşı Mahallesi, Belediye Caddesi, No:9, Sındırgı, Balıkesir', 4.0, NULL),
('Erdek Waffle & Tatlı', 33, 'Yalı Mahallesi, Sahil Yolu, No:27, Erdek, Balıkesir', 4.6, NULL),
('Susurluk Ayranı & Kebap', 34, 'Hamidiye Mahallesi, Atatürk Caddesi, No:33, Susurluk, Balıkesir', 4.6, NULL),
('Gömeç Balıkçısı', 35, 'Sahil Mahallesi, Deniz Caddesi, No:2, Gömeç, Balıkesir', 4.2, NULL),
('Karesi Pide & Lahmacun', 36, 'Dumlupınar Mahallesi, Millet Caddesi, No:41, Karesi, Balıkesir', 3.8, NULL),
('Altıeylül Tantuni', 37, 'Yıldız Mahallesi, Kuvayı Milliye Caddesi, No:17, Altıeylül, Balıkesir', 4.1, NULL),
('Dursunbey Ev Yemekleri', 38, 'Camii Mahallesi, Hükümet Caddesi, No:12, Dursunbey, Balıkesir', 4.4, NULL),
('Çay Bahçesi & Kafe', 39, 'Merkez Mahalle, Cumhuriyet Meydanı, No:1, İvrindi, Balıkesir', 3.7, NULL),
('Havran Köy Kahvaltısı', 40, 'Bağlar Mahallesi, Zeytinlik Sokak, No:8, Havran, Balıkesir', 4.6, NULL),
('Bigadiç Izgara Evi', 41, 'Yeni Mahalle, Atatürk Caddesi, No:55, Bigadiç, Balıkesir', 3.3, NULL),
('Marmara Adası Balık Restoranı', 42, 'Marmara Mahallesi, Liman Karşısı, No:4, Marmara Adası, Balıkesir', 1.6, NULL),
('Furkan Tatlıcı', 43, 'Cumhuriyet Mahallesi, Çarşı Caddesi, No:12, Bandırma, Balıkesir', 4.7, NULL);

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

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`ReviewID`, `MenuID`, `UserID`, `Text`, `Rating`, `Date`) VALUES
(1, 118, 1, 'Çok iyi', 5.0, '2026-05-30 18:34:48'),
(2, 25, 1, 'Fena değildi!', 3.0, '2026-05-30 18:35:24'),
(3, 4, 1, 'Çok kötüydü hiç sevmedim!', 1.0, '2026-05-30 20:13:15'),
(4, 4, 2, 'Hayatımda yediğim en leziz çorbaydı, buraya inanıyorum!', 5.0, '2026-05-30 20:15:19'),
(5, 26, 1, 'Fiyatını hak ediyordu, gayet iyidi.', 4.0, '2026-05-30 20:47:30'),
(6, 15, 1, 'En sevdiğim profiterol burada, gerçekten çok taze yapıyorlar.', 5.0, '2026-05-30 20:47:58'),
(7, 15, 3, 'Normalde çok güzeldi ama son zamanlarda bozdular', 3.0, '2026-05-30 20:49:34'),
(8, 143, 3, 'Ailem ile hep kahvaltıda yeriz çok güzel!', 5.0, '2026-05-30 20:49:52'),
(9, 155, 3, 'NE ETİ KULLANDINIZ BU KÖFTELERDE SİZ?', 1.0, '2026-05-30 20:50:24'),
(10, 119, 3, 'Çok iyidi etin kalitesi çok güzel.', 4.0, '2026-05-30 20:50:52'),
(11, 155, 4, 'Hayatımda yediğim EN KÖTÜ KÖFTE!', 1.0, '2026-05-30 20:57:54'),
(12, 118, 4, 'Her ay gidip yeriz gayet iyi Adana yapıyor burası.', 5.0, '2026-05-30 21:02:19'),
(13, 13, 4, 'Türk kahvesi burada içebileceğiniz en iyi şey.', 4.0, '2026-05-30 21:02:56'),
(14, 23, 4, 'Buğra Usta ahtapotu bir başka yapıyor bee.', 5.0, '2026-05-30 21:03:31'),
(15, 23, 5, 'Ahtapotların ustası Buğra Reis!', 5.0, '2026-05-30 21:04:42'),
(16, 155, 5, 'Hayır bir işletme köfteci olup da nasıl böyle rezalet köfte yapar, paramı geri istiyorum!', 1.0, '2026-05-30 21:05:13'),
(17, 143, 5, 'Çok iyi', 4.0, '2026-05-30 21:05:28'),
(18, 27, 5, 'Annem hep yapardı, çocukluğuma döndüm.', 5.0, '2026-05-30 21:05:46'),
(19, 27, 6, 'Tarçın koymamışlar hiç sevmedim.', 2.0, '2026-05-30 21:07:38'),
(20, 23, 6, '40 yıl düşünsem böyle ahtapot yiyeceğimi düşünmezdim!', 5.0, '2026-05-30 21:07:56'),
(21, 118, 6, 'Fena değildi gayet doyurucu.', 4.0, '2026-05-30 21:08:09'),
(22, 158, 6, 'Kendi tarlalarından geliyormuş çaylar!', 5.0, '2026-05-30 21:08:30'),
(23, 155, 6, 'Cidden çok kötüydü.', 2.0, '2026-05-30 21:09:10'),
(24, 154, 6, 'Çok kötü', 2.0, '2026-05-30 21:11:32'),
(25, 141, 6, 'Bitiremiyoruz çok var.', 4.0, '2026-05-30 21:12:05'),
(26, 16, 6, 'Civardaki en lezzetli cheesecake', 4.0, '2026-05-30 21:12:20'),
(27, 14, 6, 'Mis gibi YUMUŞAK waffle', 4.0, '2026-05-30 21:12:33');

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FirstName`, `LastName`, `EmailAddress`, `Password`, `ReviewCount`, `IsAdmin`) VALUES
(1, 'Aykut', 'Gök', 'aykutgok123@gmail.com', '$2y$10$zfhUB6JdsDW/3HBJjpBOd.9.65at7Xup4BMqcCeMZ4wuz/S/WiIgC', 5, 1),
(2, 'Tuğçe Aslı', 'Okur', 'tugceaslıokur123@gmail.com', '$2y$10$QwrYY6OBBoMfKSv3YH8.Mem07rS5qQ58.wXZJ/IH9kWi85uiRab7y', 1, 0),
(3, 'Mustafa', 'Taş', 'mustafatas123@gmail.com', '$2y$10$RK1KnRTH3dWZwcI2p/UV0O6ro8751VKbmosoK5f36f2Sc2KDQWfme', 4, 0),
(4, 'Selin', 'Su', 'selinsu123@gmail.com', '$2y$10$BGYYn58s0iZ97YUSaukR4.EPys3ipUn01R5qqEnwfa7hTDxZmwiz2', 4, 0),
(5, 'Faruk', 'Eczacı', 'farukeczacı123@gmail.com', '$2y$10$720RHZI6Q6cFRsdCAnDpY.B4XAhXN3rlje3jC66ulDH3e/TLW00lu', 4, 0),
(6, 'Alp', 'Soluk', 'alpsoluk123@gmail.com', '$2y$10$Azhlvpr7Tk4Ebs9Aw1FMbOBvP0g99tTZqzpRGLDvPT8fel6KjQkLC', 9, 0);

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
  MODIFY `MenuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `PlaceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
