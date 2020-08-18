-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 18, 2020 at 02:22 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopwe`
--
CREATE DATABASE IF NOT EXISTS `shopwe`;
USE `shopwe`;
-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pull & Bear', '2020-08-10 14:10:46', '2020-08-10 14:10:46'),
(2, 'armani', '2020-08-10 14:11:56', '2020-08-10 14:11:56'),
(3, 'fendi', '2020-08-10 14:12:01', '2020-08-10 14:12:24'),
(4, 'house of versace', '2020-08-10 14:12:47', '2020-08-10 14:12:47'),
(5, 'burberry', '2020-08-10 14:12:55', '2020-08-10 14:12:55'),
(6, 'ralph lauren', '2020-08-10 14:13:01', '2020-08-10 14:13:01'),
(7, 'chanel', '2020-08-10 14:13:06', '2020-08-10 14:13:06'),
(8, 'prada', '2020-08-10 14:13:11', '2020-08-10 14:13:11'),
(9, 'hermes', '2020-08-10 14:13:16', '2020-08-10 14:13:16'),
(10, 'gucci', '2020-08-10 14:13:22', '2020-08-10 14:13:22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'men', '2020-08-10 14:33:13', '2020-08-10 14:33:13'),
(2, 'women', '2020-08-10 14:33:16', '2020-08-10 14:33:16'),
(3, 'boys', '2020-08-10 14:33:20', '2020-08-10 14:33:20'),
(4, 'girls', '2020-08-10 14:33:24', '2020-08-10 14:33:24');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '#000000', '2020-08-10 14:14:34', '2020-08-12 22:42:04'),
(2, '#B82222', '2020-08-10 14:14:44', '2020-08-12 22:41:59'),
(3, '#E2BB8D', '2020-08-10 14:14:51', '2020-08-12 22:42:11'),
(4, '#BEA9A9', '2020-08-10 14:15:01', '2020-08-12 22:41:47'),
(5, '#E2BB8D', '2020-08-10 14:15:04', '2020-08-12 22:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `detail_order`
--

CREATE TABLE `detail_order` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(5) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `price` int(11) DEFAULT 1,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `sub_total` int(11) NOT NULL DEFAULT 111,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_order`
--

INSERT INTO `detail_order` (`id`, `order_id`, `product_id`, `size`, `color`, `price`, `quantity`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 's', '#B82222', 123, 1, 123, '2020-08-10 14:54:40', '2020-08-12 22:43:10'),
(2, 1, 2, 'l', '#BEA9A9', 44, 1, 44, '2020-08-10 14:54:40', '2020-08-12 22:43:23'),
(3, 2, 2, 's', '#B82222', 22, 2, 44, '2020-08-10 14:55:32', '2020-08-12 22:43:10'),
(4, 2, 3, 'l', '#BEA9A9', 99, 1, 99, '2020-08-10 14:55:32', '2020-08-12 22:43:35'),
(5, 3, 3, 's', '#B82222', 32, 2, 64, '2020-08-10 14:56:04', '2020-08-12 22:43:10'),
(6, 3, 4, 'l', '#BEA9A9', 111, 1, 111, '2020-08-10 14:56:04', '2020-08-12 22:43:35'),
(7, 4, 5, 's', '#B82222', 32, 2, 64, '2020-08-10 14:56:23', '2020-08-12 22:43:10'),
(8, 5, 5, 's', '#B82222', 32, 2, 64, '2020-08-10 14:56:47', '2020-08-12 22:43:10'),
(9, 5, 4, 'l', '#BEA9A9', 111, 1, 111, '2020-08-10 14:56:47', '2020-08-12 22:43:35'),
(10, 5, 6, 'l', '#BEA9A9', 33, 1, 33, '2020-08-10 14:56:47', '2020-08-12 22:43:35'),
(11, 6, 5, 's', '#B82222', 32, 2, 64, '2020-08-10 14:57:36', '2020-08-12 22:43:10'),
(12, 6, 4, 'l', '#BEA9A9', 111, 1, 111, '2020-08-10 14:57:36', '2020-08-12 22:43:35'),
(13, 6, 6, 'l', '#BEA9A9', 33, 1, 33, '2020-08-10 14:57:36', '2020-08-12 22:43:35'),
(14, 7, 5, 's', '#B82222', 32, 2, 64, '2020-08-10 14:57:41', '2020-08-12 22:43:10'),
(15, 7, 4, 'l', '#BEA9A9', 111, 1, 111, '2020-08-10 14:57:41', '2020-08-12 22:43:35'),
(17, 8, 5, 's', '#B82222', 32, 2, 64, '2020-08-10 15:28:22', '2020-08-12 22:43:10'),
(18, 9, 5, 's', '#B82222', 32, 2, 64, '2020-08-10 15:29:40', '2020-08-12 22:43:10'),
(19, 10, 5, 's', '#B82222', 32, 2, 64, '2020-08-10 15:30:29', '2020-08-12 22:43:10'),
(20, 11, 5, 's', '#FFFFFF', 32, 2, 64, '2020-08-10 15:31:21', '2020-08-11 06:38:12'),
(21, 13, 1, 's', '#B82222', 123, 1, 123, '2020-08-12 20:22:47', '2020-08-12 22:43:10'),
(22, 13, 2, 'l', '#BEA9A9', 44, 1, 44, '2020-08-12 20:22:47', '2020-08-12 22:43:35'),
(23, 14, 1, 's', '#B82222', 123, 1, 123, '2020-08-12 20:26:12', '2020-08-12 22:42:55'),
(24, 14, 2, 'l', '#BEA9A9', 44, 1, 44, '2020-08-12 20:26:12', '2020-08-12 22:43:35'),
(25, 16, 11, 'xs', '#BEA9A9', 69, 2, 138, '2020-08-13 02:00:57', '2020-08-13 02:00:57'),
(26, 16, 10, 's', '#B82222', 36, 1, 36, '2020-08-13 02:00:57', '2020-08-13 02:00:57'),
(27, 17, 2, 's', '#BEA9A9', 67, 1, 67, '2020-08-13 02:03:03', '2020-08-13 02:03:03'),
(28, 18, 5, 's', '#BEA9A9', 51, 1, 51, '2020-08-13 02:04:02', '2020-08-13 02:04:02'),
(29, 19, 11, 'xs', '#BEA9A9', 69, 1, 69, '2020-08-13 04:29:30', '2020-08-13 04:29:30'),
(30, 20, 9, 's', '#E2BB8D', 45, 1, 45, '2020-08-13 04:44:33', '2020-08-13 04:44:33'),
(31, 20, 9, 's', '#BEA9A9', 45, 1, 45, '2020-08-13 04:44:33', '2020-08-13 04:44:33'),
(32, 21, 3, 'xs', '#B82222', 44, 1, 44, '2020-08-15 06:57:18', '2020-08-15 06:57:18'),
(33, 23, 3, 'xs', '#B82222', 44, 1, 44, '2020-08-15 14:58:22', '2020-08-15 14:58:22'),
(34, 24, 3, 'xs', '#B82222', 44, 1, 44, '2020-08-15 14:59:15', '2020-08-15 14:59:15'),
(35, 24, 5, 's', '#B82222', 51, 1, 51, '2020-08-15 14:59:15', '2020-08-15 14:59:15'),
(36, 25, 3, 'xs', '#B82222', 44, 1, 44, '2020-08-15 14:59:36', '2020-08-15 14:59:36'),
(37, 25, 5, 's', '#B82222', 51, 2, 102, '2020-08-15 14:59:36', '2020-08-15 14:59:36'),
(38, 26, 11, 'xs', '#000000', 69, 1, 69, '2020-08-16 13:37:21', '2020-08-16 13:37:21'),
(39, 26, 6, 's', '#B82222', 70, 1, 70, '2020-08-16 13:37:21', '2020-08-16 13:37:21'),
(40, 27, 11, 'xs', '#BEA9A9', 69, 1, 69, '2020-08-16 14:26:37', '2020-08-16 14:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `payment_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `tracking_number`, `address`, `payment_id`, `created_at`, `updated_at`) VALUES
(1, 1, '15028910082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 1, '2020-08-10 14:54:40', '2020-08-12 22:39:51'),
(2, 1, '15895410082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 1, '2020-08-10 14:55:31', '2020-08-12 22:39:51'),
(3, 2, '26011410082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 3, '2020-08-10 14:56:04', '2020-08-12 22:39:51'),
(4, 3, '37795910082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 2, '2020-08-10 14:56:23', '2020-08-12 22:39:51'),
(5, 3, '36193510082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 2, '2020-08-10 14:56:47', '2020-08-12 22:39:51'),
(6, 3, '31154810082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 2, '2020-08-10 14:57:36', '2020-08-12 22:39:51'),
(8, 3, '38438110082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 2, '2020-08-10 15:28:22', '2020-08-12 22:39:51'),
(9, 3, '39396410082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 2, '2020-08-10 15:29:40', '2020-08-12 22:39:51'),
(10, 3, '31307810082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 2, '2020-08-10 15:30:29', '2020-08-12 22:39:51'),
(11, 3, '34395710082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 2, '2020-08-10 15:31:21', '2020-08-12 22:39:51'),
(13, 1, '18704613082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 1, '2020-08-12 20:22:47', '2020-08-12 22:39:51'),
(14, 1, '11548013082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620', 1, '2020-08-12 20:26:12', '2020-08-12 22:39:41'),
(16, 1, '14362013082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620|office-sinta-kp.cibeureum petir, ds. cibeureum, kec. dramaga-bogor-jawa barat-indonesia-16620', 1, '2020-08-13 02:00:57', '2020-08-13 02:00:57'),
(17, 1, '13683013082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620|office-sinta-kp.cibeureum petir, ds. cibeureum, kec. dramaga-bogor-jawa barat-indonesia-16620', 1, '2020-08-13 02:03:03', '2020-08-13 02:03:03'),
(18, 1, '19609713082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620|office-sinta-kp.cibeureum petir, ds. cibeureum, kec. dramaga-bogor-jawa barat-indonesia-16620', 1, '2020-08-13 02:04:02', '2020-08-13 02:04:02'),
(19, 1, '12056213082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620|office-sinta-kp.cibeureum petir, ds. cibeureum, kec. dramaga-bogor-jawa barat-indonesia-16620|office-Tuti-Kp. Tenjolaya RT.3/07-Leuwiliang-16620-ID-16620|{}-{}-{}-{}-{}-{}-{}', 1, '2020-08-13 04:29:29', '2020-08-13 04:29:29'),
(20, 1, '19538513082020', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea-bogor-jawa barat-indonesia-16620|office-sinta-kp.cibeureum petir, ds. cibeureum, kec. dramaga-bogor-jawa barat-indonesia-16620|office-Tuti-Kp. Tenjolaya RT.3/07-Leuwiliang-16620-ID-16620|{}-{}-{}-{}-{}-{}-{}', 2, '2020-08-13 04:44:32', '2020-08-13 04:44:32'),
(21, 13, '136333815082020', 'Home-Adnin rifnadi-Kp. Sinagar -Bogor-West Java-ID-16620', 1, '2020-08-15 06:57:18', '2020-08-15 06:57:18'),
(22, 13, '131160815082020', 'as-as-as-as-as-as-as|asaw-asaw-aw-aw-aw-aw-aw|ad-ad-ad-ad-ad-ad-ad', 1, '2020-08-15 14:39:15', '2020-08-15 14:39:15'),
(23, 13, '134607615082020', 'as-as-as-as-as-as-as|asaw-asaw-aw-aw-aw-aw-aw|ad-ad-ad-ad-ad-ad-ad', 1, '2020-08-15 14:58:22', '2020-08-15 14:58:22'),
(24, 13, '136732115082020', 'as-as-as-as-as-as-as|asaw-asaw-aw-aw-aw-aw-aw|ad-ad-ad-ad-ad-ad-ad', 1, '2020-08-15 14:59:15', '2020-08-15 14:59:15'),
(25, 13, '135401715082020', 'as-as-as-as-as-as-as|asaw-asaw-aw-aw-aw-aw-aw|ad-ad-ad-ad-ad-ad-ad', 1, '2020-08-15 14:59:36', '2020-08-15 14:59:36'),
(26, 13, '137263916082020', 'as-as-as-as-as-as-as|asaw-asaw-aw-aw-aw-aw-aw|ad-ad-ad-ad-ad-ad-ad', 2, '2020-08-16 13:37:21', '2020-08-16 13:37:21'),
(27, 13, '132035416082020', 'as-as-as-as-as-as-as|asaw-asaw-aw-aw-aw-aw-aw|ad-ad-ad-ad-ad-ad-ad', 2, '2020-08-16 14:26:37', '2020-08-16 14:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'alfamart', 'http://192.168.42.15:3000/shopwe/images/payment.jpg', '2020-08-10 14:27:20', '2020-08-10 14:27:20'),
(2, 'indomart', 'http://192.168.42.15:3000/shopwe/images/payment.jpg', '2020-08-10 14:27:29', '2020-08-10 14:27:29'),
(3, 'pos indonesia', 'http://192.168.42.15:3000/shopwe/images/payment.jpg', '2020-08-10 14:27:43', '2020-08-10 14:27:43'),
(4, 'ovo', 'http://192.168.42.15:3000/shopwe/images/payment.jpg', '2020-08-10 14:27:50', '2020-08-10 14:27:50'),
(5, 'gopay', 'http://192.168.42.15:3000/shopwe/images/payment.jpg', '2020-08-10 14:27:57', '2020-08-10 14:27:57'),
(6, 'dana', 'http://192.168.42.15:3000/shopwe/images/payment.jpg', '2020-08-10 14:28:36', '2020-08-10 14:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `categories` varchar(255) DEFAULT NULL,
  `colors` varchar(150) NOT NULL,
  `sizes` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(255) DEFAULT 'default.png',
  `quantity` int(4) NOT NULL DEFAULT 5,
  `description` text DEFAULT NULL,
  `rating` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `name`, `category_id`, `categories`, `colors`, `sizes`, `price`, `image`, `quantity`, `description`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 'erka by Rumah Komunitas', 1, 'men|women', '#000000|#F7F7F7|#B82222|#BEA9A9|#E2BB8D', 's|m|l|xl', 53, '2020-08-12T21:22:51.939Zerka.jpg', 10, 'ERKA jackets are jackets designed with the best functional features so that they can be used in daily activities and adventures such as traveling, riding, hiking, trekking and summit attacks. By using quality outer and inner materials that have been researched.\r\n\r\n18 Detailed Features of ERKA Jacket:\r\nThe outside part :\r\n01. Waterproof (water repellent / taro leaves effect if exposed to water)\r\n02.Windproof (anti wind)\r\n03. A hoodie that can be put in and can look casual\r\n04. Adjustable hoodie\r\n05. The head of the hoodie like a hat protects it from the sun\r\n06. Wallet Pocket\r\n07. Left and Right Pocket\r\n08. Beverage Bottle Pocket\r\n09. Card Pocket\r\n10. 2 Zipper Heads (Makes it easy to open the zipper from below)\r\nThe inside part :\r\n11. HP pocket\r\n12. Powerbank pocket\r\n13. Little Book Pocket\r\n14. Pen pocket\r\n15. Pocket Glasses\r\n16. Book / Tablet Pocket\r\n17. Earphone Holder\r\n18. Additional jacket bag', 3, '2020-08-10 14:45:09', '2020-08-18 00:21:53'),
(2, 2, 'ultralight jacket by Rumah Komunitas', 1, 'women|boys', '#F7F7F7|#B82222|#BEA9A9|#E2BB8D', 's|m|l', 67, '2020-08-12T21:25:31.815Z2ultralight.jpg', 9, 'FIRST IN INDONESIA & THE WORLD !!!\r\n\r\nThis multifunctional Ultralight jacket which is very light for a hand grip has a weight of about 160-200 grams (depending on size), very light and easy to carry everywhere.\r\n\r\n \r\n\r\nThis product is made using quality materials that can withstand water (Waterproof) with light rain intensity and wind resistance (Windproof), it is very suitable for daily (daily) and outdoor activities (running), cycling, climbing mountains (hiking), long trips (traveling), driving (touring) and activities that have high mobility but want to appear Fashionable, Simple and Practical.\r\n\r\n\r\nBe a part of history in the world of fashion by owning this product, proud to use local products made by the nation\'s own children and get the best features.', 5, '2020-08-10 14:46:45', '2020-08-18 00:21:51'),
(3, 3, 'pote by Rumah Komunitas', 1, 'men|girls', '#000000|#F7F7F7|#B82222|#BEA9A9', 'xs|s|m|l', 44, '2020-08-12T21:25:43.083Zpote.jpg', 4, 'POTE series is a t-shirt that is equipped with a front pocket (t-shirt pocket) which functions to store small things, interestingly this shirt is equipped with unique, simple and cool designs.', 3, '2020-08-10 14:47:08', '2020-08-18 00:21:49'),
(4, 3, 'XABA x RK by Rumah Komunitas', 1, 'girls|women', '#000000|#F7F7F7|#BEA9A9|#E2BB8D', 's|m|l', 65, '2020-08-12T21:29:24.784ZxabaXrk.jpg', 10, 'The KEI jacket is a bomber version jacket that we specially designed in collaboration between XABA and Rumah Komunitas to appear more exclusive and dynamic. This jacket is suitable for daily activities, both in driving, casual and casual for both men and women.\r\n\r\n9 Detailed Features:\r\n01. Wallet Pocket\r\n02. Pencil Pocket\r\n03. Card Pocket\r\n04. Reflective Screen Printing\r\n05. HP / Gadget Poacket\r\n06. Side Pocket Zipper\r\n07. Waterproof\r\n08. Windproof\r\n09. Can Turn into a Sling Bag', 4, '2020-08-10 14:47:43', '2020-08-18 00:21:46'),
(5, 4, 'leon jacket by Rumah Komunitas', 1, 'girls|women', '#000000|#F7F7F7|#B82222|#BEA9A9|#E2BB8D', 's|m|l', 51, '2020-08-12T21:25:59.712ZLeon.jpg', 6, 'Leon jacket is a multifunctional zipper hoodie jacket that uses quality materials equipped with the latest innovative features to facilitate daily activities.\r\n\r\n8 Detailed Features:\r\n01. Eyemask (Eye Patch)\r\n02. Earphone Holder (Earphone / Headset)\r\n03. Mobile Pocket (Mobile Pocket)\r\n04. Powerbank Pocket (Powerbank Pocket)\r\n05. Gloves\r\n06.Hand Warming Pocket (Hand Warming Pocket)\r\n07. Wallet Pocket (Wallet Pocket)\r\n08. Pencil & Sunglass Pocket (Pencil & Glasses Pocket)\r\n\r\n+ Additional Features Could Be A Sling Bag\r\n\r\nMaterial & Accessories Specifications:\r\n01. Baby Tery Fabric (cool and comfortable to use)\r\n02. Premium Mesh Furing\r\n03. YKK Zipper', 3, '2020-08-10 14:47:59', '2020-08-18 00:21:44'),
(6, 5, 'cameo jacket by Rumah Komunitas', 1, 'boys|men', '#000000|#B82222|#BEA9A9|#E2BB8D', 's|m|l', 70, '2020-08-12T21:26:09.004Zcameo.jpg', 5, 'The Cameo jacket is a multifunctional coach jacket whose model has been reformed so that it can be used in several themes, namely being able to be sporty, traveling and casual.\r\n\r\n6 Detailed Features of Cameo Jackets:\r\n01. Wrist Sleeve Button (Wrist using the button)\r\n02. Wallet Pocket (Wallet Pocket)\r\n03. Mobile Pocket (Mobile Pocket)\r\n04. Earphone Holder (Earphone Holder)\r\n05. Waterproof\r\n06. Windproof\r\n\r\n\r\n* Using the best materials for Waterproof, Windproof and Breathable / Comfortable\r\n\r\n#rumahkomunitas #rkproject', 2, '2020-08-10 14:48:10', '2020-08-18 00:21:42'),
(7, 6, 'polo by Rumah Komunitas', 1, 'boys|men', '#000000|#F7F7F7|#B82222|#E2BB8D', 'xs|s|m|l', 50, '2020-08-12T21:26:19.246Zpolo.jpg', 5, 'This outfit is indeed a must-have for everyone, because besides being able to be used for casual wear, this outfit is also suitable for use in semi-formal situations. Rene Lacoste is the person behind this polo shirt. He is one of the founders of the Lacoste company, a well-known clothing company in France.', 3, '2020-08-10 14:48:20', '2020-08-18 00:21:40'),
(8, 7, 'dom jacket by Rumah Komunitas', 1, 'boys|girls', '#000000|#F7F7F7|#BEA9A9|#E2BB8D', 's|m|l', 30, '2020-08-12T21:29:47.711Zkolar.jpg', 10, 'Since 2015 Rumah Komunitas has always presented innovative merchandise in each of its products, using quality materials with an exclusive product design model is more value than Rumah Komunitas merchandise compared to other merchandise brands.\r\n\r\nDOM, the latest multifunctional jacket innovation from Rumah Komunitas that provides convenience and happiness in every activity, is equipped with 16 selected detailed features.\r\n\r\nWe dedicate this jacket to all families / couples who love each other where playing with them is the most precious and irreplaceable time.\r\n\r\nThere are already many choices of colors and sizes that you can customize according to your wishes for both adult men and women as well as children.\r\n\r\nHappy Playing & Happy ...', 3, '2020-08-10 14:48:34', '2020-08-18 00:21:37'),
(9, 8, 'kolar jacket by Rumah Komunitas', 1, 'boys|girls', '#F7F7F7|#B82222|#BEA9A9|#E2BB8D', 'xs|s|m|l', 45, '2020-08-12T21:26:31.296Zkolar.jpg', 9, 'The KOLAR jacket is a bomber version of the jacket with a collared style and features the details that everyone needs. This jacket is suitable for daily activities, whether driving, casual and casual.\r\n\r\nDetailed Features:\r\nThe outside part :\r\n01. Waterproof (water repellent / taro leaves effect if exposed to water)\r\n02.Windproof (anti wind)\r\n03. 2 Pocket left & right side use zippers\r\nThe inside part :\r\n04. Gadget Pocket (Can be used for HP / Tablet / Wallet)\r\n05. Book Pocket', 5, '2020-08-10 14:48:47', '2020-08-18 00:21:34'),
(10, 9, 'viral jacket by Rumah Komunitas', 1, 'men|women', '#000000|#F7F7F7|#B82222|#BEA9A9', 's|m|l', 36, '2020-08-12T21:27:08.733Zviral.jpg', 7, 'The VIRAL jacket is a multifunctional jacket with the best detail features and can be turned into a sling bag.\r\n\r\n8 Detailed Features of VIRAL Jacket:\r\n01. Wallet Pocket (Wallet Pocket)\r\n02. Gadgets Pocket (Pocket HP / Smartphone)\r\n03. Waterproof Zipper (zippers waterproof / wind)\r\n04.Detachable Hoodies (Hoodie can be removed)\r\n05. Flexible Rib Jacket (Wrist using rib)\r\n06. Up to 7 inch Tablet Pocket (Can fit tablets up to 7 inches)\r\n07. Book Pocket (Book Pocket / can fit into a 10 inch tablet)\r\n08. Can Turn into a sling bag (Can turn into a sling bag)\r\n\r\n\r\n* Using the best materials for Waterproof, Windproof and Breathable / Comfortable\r\n\r\n#rumahkomunitas #rkproject', 3, '2020-08-10 14:48:58', '2020-08-18 00:21:30'),
(11, 10, 'bomber jacket by Rumah Komunitas', 1, 'men|women', '#000000|#B82222|#BEA9A9|#E2BB8D', 'xs|s|m|l', 69, '2020-08-12T21:27:28.402ZxabaXrk.jpg', 8, 'The bomber jacket is the jacket that is most often used by everyday people, a jacket that was originally intended for pilots, but the fashion world has modified this bomber jacket more simply and has become the most popular casual wear today.\r\n\r\nBOMBER Jacket Detail Features:\r\n01. Pocket Tablet / HP\r\n02. Left and right pockets use zippers\r\n03. Wallet Pocket\r\n04. Premium mesh lining\r\n05. Waterproof\r\n06. Windproof\r\n\r\nMaterial Specifications:\r\n- Outer material: Taslan-Despo Waterproof\r\n- Inner Material: Premium Mesh Furing\r\n\r\nTips on how to wash a waterproof jacket\r\n\r\n#rumahkomunitas # rkproject4 #jaketbomber #jaketmultifungsi', 4, '2020-08-10 14:49:44', '2020-08-18 00:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'xs', '2020-08-10 14:24:07', '2020-08-10 14:24:20'),
(2, 's', '2020-08-10 14:24:26', '2020-08-10 14:24:26'),
(3, 'm', '2020-08-10 14:24:29', '2020-08-10 14:24:29'),
(4, 'l', '2020-08-10 14:24:32', '2020-08-10 14:24:32'),
(5, 'xl', '2020-08-10 14:24:37', '2020-08-10 14:24:37'),
(6, 'xxl', '2020-08-10 14:24:42', '2020-08-10 14:24:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `full_name` varchar(150) NOT NULL,
  `birth` date NOT NULL DEFAULT '2020-08-16',
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `address_active` int(2) DEFAULT NULL,
  `role` int(1) NOT NULL DEFAULT 3,
  `access_key` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `full_name`, `birth`, `email`, `password`, `phone`, `image`, `address`, `address_active`, `role`, `access_key`, `created_at`, `updated_at`) VALUES
(1, 'shopwe', 'shopwe e-commerce', '2020-08-01', 'shopweapi@gmail.com', '$2b$10$IFF/lBpZoUsqDwjeAtgKK.wMLbDhHOerU1.s5afwA7vBkcH/M8FnS', '', 'avatar.png', 'Label-Receiver-Address-City-State/Province/Region-Country-Zip (Postal Code)', 0, 1, 'AM80356', '2020-08-10 10:13:35', '2020-08-16 14:55:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_order`
--
ALTER TABLE `detail_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `detail_order`
--
ALTER TABLE `detail_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_order`
--
ALTER TABLE `detail_order`
  ADD CONSTRAINT `detail_order_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
