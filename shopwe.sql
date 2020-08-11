-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 11, 2020 at 12:11 PM
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
(1, 'red', '2020-08-10 14:14:34', '2020-08-10 14:14:34'),
(2, 'yellow', '2020-08-10 14:14:44', '2020-08-10 14:14:44'),
(3, 'blue', '2020-08-10 14:14:51', '2020-08-10 14:14:51'),
(4, 'purple', '2020-08-10 14:15:01', '2020-08-10 14:15:01'),
(5, 'orange', '2020-08-10 14:15:04', '2020-08-10 14:15:04'),
(6, 'pink', '2020-08-10 14:15:08', '2020-08-10 14:15:08');

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
(1, 1, 1, 's', 'yellow', 123, 1, 123, '2020-08-10 14:54:40', '2020-08-10 14:54:40'),
(2, 1, 2, 'l', 'blue', 44, 1, 44, '2020-08-10 14:54:40', '2020-08-10 15:11:21'),
(3, 2, 2, 's', 'yellow', 22, 2, 44, '2020-08-10 14:55:32', '2020-08-10 14:55:32'),
(4, 2, 3, 'l', 'blue', 99, 1, 99, '2020-08-10 14:55:32', '2020-08-10 14:55:32'),
(5, 3, 3, 's', 'yellow', 32, 2, 64, '2020-08-10 14:56:04', '2020-08-10 14:56:04'),
(6, 3, 4, 'l', 'blue', 111, 1, 111, '2020-08-10 14:56:04', '2020-08-10 14:56:04'),
(7, 4, 5, 's', 'yellow', 32, 2, 64, '2020-08-10 14:56:23', '2020-08-10 14:56:23'),
(8, 5, 5, 's', 'yellow', 32, 2, 64, '2020-08-10 14:56:47', '2020-08-10 14:56:47'),
(9, 5, 4, 'l', 'blue', 111, 1, 111, '2020-08-10 14:56:47', '2020-08-10 14:56:47'),
(10, 5, 6, 'l', 'blue', 33, 1, 33, '2020-08-10 14:56:47', '2020-08-10 14:56:47'),
(11, 6, 5, 's', 'yellow', 32, 2, 64, '2020-08-10 14:57:36', '2020-08-10 14:57:36'),
(12, 6, 4, 'l', 'blue', 111, 1, 111, '2020-08-10 14:57:36', '2020-08-10 14:57:36'),
(13, 6, 6, 'l', 'blue', 33, 1, 33, '2020-08-10 14:57:36', '2020-08-10 14:57:36'),
(14, 7, 5, 's', 'yellow', 32, 2, 64, '2020-08-10 14:57:41', '2020-08-10 14:57:41'),
(15, 7, 4, 'l', 'blue', 111, 1, 111, '2020-08-10 14:57:41', '2020-08-10 14:57:41'),
(17, 8, 5, 's', 'yellow', 32, 2, 64, '2020-08-10 15:28:22', '2020-08-10 15:28:22'),
(18, 9, 5, 's', 'yellow', 32, 2, 64, '2020-08-10 15:29:40', '2020-08-10 15:29:40'),
(19, 10, 5, 's', 'yellow', 32, 2, 64, '2020-08-10 15:30:29', '2020-08-10 15:30:29'),
(20, 11, 5, 's', '#FFFFFF', 32, 2, 64, '2020-08-10 15:31:21', '2020-08-11 06:38:12');

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
(1, 1, '15028910082020', 'home-user-dramaga-bogor-16620-089606415122', 1, '2020-08-10 14:54:40', '2020-08-10 14:54:40'),
(2, 1, '15895410082020', 'home-user-dramaga-bogor-16620-089606415122', 1, '2020-08-10 14:55:31', '2020-08-10 14:55:31'),
(3, 2, '26011410082020', 'home-user-dramaga-bogor-16620-089606415122', 3, '2020-08-10 14:56:04', '2020-08-10 14:56:04'),
(4, 3, '37795910082020', 'home-user-dramaga-bogor-16620-089606415122', 2, '2020-08-10 14:56:23', '2020-08-10 14:56:23'),
(5, 3, '36193510082020', 'home-user-dramaga-bogor-16620-089606415122', 2, '2020-08-10 14:56:47', '2020-08-10 14:56:47'),
(6, 3, '31154810082020', 'home-user-dramaga-bogor-16620-089606415122', 2, '2020-08-10 14:57:36', '2020-08-10 14:57:36'),
(8, 3, '38438110082020', 'home-user-dramaga-bogor-16620-089606415122', 2, '2020-08-10 15:28:22', '2020-08-10 15:28:22'),
(9, 3, '39396410082020', 'home-user-dramaga-bogor-16620-089606415122', 2, '2020-08-10 15:29:40', '2020-08-10 15:29:40'),
(10, 3, '31307810082020', 'home-user-dramaga-bogor-16620-089606415122', 2, '2020-08-10 15:30:29', '2020-08-10 15:30:29'),
(11, 3, '34395710082020', 'home-user-dramaga-bogor-16620-089606415122', 2, '2020-08-10 15:31:21', '2020-08-10 15:31:21');

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
  `description` text NOT NULL DEFAULT 'description',
  `rating` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `name`, `category_id`, `categories`, `colors`, `sizes`, `price`, `image`, `quantity`, `description`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 'erka', 1, 'men|women|boys', 'red|blue|#000000|#FFFFFF', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', 4, 'description', 3, '2020-08-10 14:45:09', '2020-08-11 06:47:54'),
(2, 2, 'ultralight jacket', 1, 'men|women|boys', 'red|blue|yellow', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', 2, 'description', 3, '2020-08-10 14:46:45', '2020-08-10 14:55:31'),
(3, 3, 'pote', 1, 'men|women|boys|girls', 'red|blue|yellow', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', 2, 'description', 3, '2020-08-10 14:47:08', '2020-08-10 14:56:04'),
(4, 3, 'XABA x RK', 1, 'men|women|boys|girls', 'red|blue|yellow', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', -1, 'description', 3, '2020-08-10 14:47:43', '2020-08-10 14:57:40'),
(5, 4, 'leon jacket', 1, 'men|women|boys|girls', 'red|blue|yellow', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', -9, 'description', 3, '2020-08-10 14:47:59', '2020-08-10 15:31:21'),
(6, 5, 'cameo jacket', 1, 'men|women|boys|girls', 'red|blue|yellow', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', 2, 'description', 3, '2020-08-10 14:48:10', '2020-08-10 14:57:41'),
(7, 6, 'polo', 1, 'men|women|boys|girls', 'red|blue|yellow', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', 5, 'description', 3, '2020-08-10 14:48:20', '2020-08-10 14:48:20'),
(8, 7, 'dom jacket', 1, 'men|women|boys|girls', 'red|blue|yellow', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', 5, 'description', 3, '2020-08-10 14:48:34', '2020-08-10 14:48:34'),
(9, 8, 'kolar jacket', 1, 'men|women|boys|girls', 'red|blue|yellow', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', 5, 'description', 3, '2020-08-10 14:48:47', '2020-08-10 14:48:47'),
(10, 9, 'viral jacket', 1, 'men|women|boys|girls', 'red|blue|yellow', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', 5, 'description', 3, '2020-08-10 14:48:58', '2020-08-10 14:48:58'),
(11, 10, 'bomber jacket', 1, 'men|women|boys|girls', 'red|blue|yellow', 's|m|l', 123, 'http://192.168.42.15:3000/shopwe/images/default.png', 5, 'description', 3, '2020-08-10 14:49:44', '2020-08-10 14:49:44');

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
  `birth` date NOT NULL DEFAULT current_timestamp(),
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
(1, 'admin', 'admin manager', '1998-11-21', 'adninsijawa.medsos@gmail.com', '$2b$10$FXWXM2Gq3LHPy85Z9DTjRuVCFaU0ihLqJzXmJqPwjwUt1BjEDIOiG', '089606415122', 'http://192.168.42.15:3000/shopwe/images/default.png', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea kab. bogor-bogor-16620-089606415122-id|office-sinta-cibeureum, kec. dramaga, kab. bogor-bogor-16610-089606445236-id|villa-dicky-puncak, kab. bogor-kota-166523-081245687953-id', 0, 1, 'AM80356', '2020-08-10 10:13:35', '2020-08-10 10:13:35'),
(2, 'staff', 'staff manager', '1998-11-21', 'adninsijawa.staff@gmail.com', '$2b$10$ftjzv79NgMdvB/uN3Mhh0O9WmHYb/klbO6Q4eu.GWts9Z3..9qBPm', '089606415122', 'http://192.168.42.15:3000/shopwe/images/default.png', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea kab. bogor-bogor-16620-089606415122-id|office-sinta-cibeureum, kec. dramaga, kab. bogor-bogor-16610-089606445236-id|villa-dicky-puncak, kab. bogor-kota-166523-081245687953-id', 0, 1, 'SM18015', '2020-08-10 10:14:16', '2020-08-10 10:15:03'),
(3, 'user', 'user manager', '1998-11-21', 'adninsijawa.user@gmail.com', '$2b$10$nCD9jtVTZKgxSMlYdbUGjO/pQ2rxq5fxOmWTYR8848dDqbsctKCKG', '089606415122', 'http://192.168.42.15:3000/shopwe/images/default.png', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea kab. bogor-bogor-16620-089606415122-id|office-sinta-cibeureum, kec. dramaga, kab. bogor-bogor-16610-089606445236-id|villa-dicky-puncak, kab. bogor-kota-166523-081245687953-id', 0, 1, 'UM42836', '2020-08-10 10:14:45', '2020-08-10 10:14:45'),
(4, 'client', 'client manager', '1998-11-21', 'adninsijawa.client@gmail.com', '$2b$10$c50GPRHoq8lUJDfNgXpJI.u5w.yFOS9kfijz72FA9vtVgnoqpQvzS', '089606415122', 'http://192.168.42.15:3000/shopwe/images/default.png', 'home-adnin rifandi-kp.pasar rebo, ds. cihideung udik, kec. ciampea kab. bogor-bogor-16620-089606415122-id|office-sinta-cibeureum, kec. dramaga, kab. bogor-bogor-16610-089606445236-id|villa-dicky-puncak, kab. bogor-kota-166523-081245687953-id', 0, 1, 'CM48629', '2020-08-10 10:15:21', '2020-08-10 10:15:21'),
(6, 'user_test', 'user_test', '2020-08-10', 'adninsijawa@usertest.com', '$2b$10$FMR0utwuWLBe7kjG1Oc7CuTC3XPHDAVxxETkn.asOWLfxg/7PRhmG', NULL, 'http://192.168.42.15:3000/shopwe/images/avatar.png', NULL, NULL, 3, 'UU82807', '2020-08-10 10:22:53', '2020-08-10 10:25:24'),
(7, 'testing', 'testing', '2020-08-11', 'adninsijawa@testing.com', '$2b$10$YcOdzPmm.R/EHtnDGrEitebDADiS.ulU9RyuT67i0BJOeA494Gqme', NULL, 'http://192.168.42.15:3000/shopwe/images/avatar.png', NULL, NULL, 3, 'TT85573', '2020-08-11 06:28:43', '2020-08-11 08:23:22');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
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
