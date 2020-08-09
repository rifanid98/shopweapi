-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 09, 2020 at 06:09 AM
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
(1, 'armani', '2020-08-08 14:08:05', '2020-08-08 14:08:05'),
(2, 'fendi', '2020-08-08 14:08:05', '2020-08-08 14:08:05'),
(3, 'house of versace', '2020-08-08 14:08:05', '2020-08-08 14:08:05'),
(4, 'burberry', '2020-08-08 14:08:05', '2020-08-08 14:08:05'),
(5, 'ralph lauren', '2020-08-08 14:08:05', '2020-08-08 14:08:05'),
(6, 'chanel', '2020-08-08 14:08:05', '2020-08-08 14:08:05'),
(7, 'prada', '2020-08-08 14:08:05', '2020-08-08 14:08:05'),
(8, 'hermes', '2020-08-08 14:08:05', '2020-08-08 14:08:05'),
(9, 'gucci', '2020-08-08 14:08:05', '2020-08-08 14:08:05'),
(10, 'louis vuitton', '2020-08-08 14:08:05', '2020-08-08 14:08:05');

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
(1, 'jackets', '2020-08-08 14:14:00', '2020-08-08 14:14:00'),
(5, 'trousers', '2020-08-08 14:14:00', '2020-08-08 14:14:00'),
(9, 'suits', '2020-08-08 14:16:15', '2020-08-08 14:16:15'),
(13, 'skirts', '2020-08-08 14:16:15', '2020-08-08 14:16:15'),
(17, 'dresses', '2020-08-08 14:17:08', '2020-08-08 14:17:08'),
(21, 'shoes', '2020-08-08 14:17:08', '2020-08-08 14:17:08'),
(25, 'sweaters', '2020-08-08 14:18:19', '2020-08-08 14:18:19'),
(29, 'waistcoats', '2020-08-08 14:18:19', '2020-08-08 14:18:19');

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

-- --------------------------------------------------------

--
-- Table structure for table `detail_category`
--

CREATE TABLE `detail_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `gender` int(1) NOT NULL COMMENT '0 = male, 1 = female',
  `age` int(1) NOT NULL COMMENT '0 = young, 1 = old',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_category`
--

INSERT INTO `detail_category` (`id`, `category_id`, `gender`, `age`, `created_at`, `updated_at`) VALUES
(1, 17, 0, 0, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(2, 17, 0, 1, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(3, 17, 1, 0, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(4, 17, 1, 1, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(5, 1, 0, 0, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(6, 1, 0, 1, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(7, 1, 1, 0, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(8, 1, 1, 1, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(9, 21, 0, 0, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(10, 21, 0, 1, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(11, 21, 1, 0, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(12, 21, 1, 1, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(13, 13, 0, 0, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(14, 13, 0, 1, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(15, 13, 1, 0, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(16, 13, 1, 1, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(17, 9, 0, 0, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(18, 9, 0, 1, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(19, 9, 1, 0, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(20, 9, 1, 1, '2020-08-08 14:45:48', '2020-08-08 14:45:48'),
(21, 25, 0, 0, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(22, 25, 0, 1, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(23, 25, 1, 0, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(24, 25, 1, 1, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(25, 5, 0, 0, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(26, 5, 0, 1, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(27, 5, 1, 0, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(28, 5, 1, 1, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(29, 29, 0, 0, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(30, 29, 0, 1, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(31, 29, 1, 0, '2020-08-08 14:47:29', '2020-08-08 14:47:29'),
(32, 29, 1, 1, '2020-08-08 14:47:29', '2020-08-08 14:47:29');

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
(21, 1, 1, NULL, NULL, 111, 2, 222, '2020-08-08 15:15:00', '2020-08-08 16:52:41'),
(22, 1, 2, NULL, NULL, 111, 1, 111, '2020-08-08 15:15:00', '2020-08-08 16:53:02'),
(23, 1, 3, NULL, NULL, 111, 1, 111, '2020-08-08 15:15:00', '2020-08-08 16:53:05'),
(24, 9, 8, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(25, 9, 7, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(26, 8, 5, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(27, 8, 2, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(28, 7, 6, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(29, 7, 7, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(30, 7, 1, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(31, 6, 3, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(32, 5, 8, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(33, 4, 2, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(34, 3, 2, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(35, 2, 6, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(36, 2, 8, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(37, 10, 1, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(38, 10, 6, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00'),
(39, 10, 1, NULL, NULL, 1, 1, 111, '2020-08-08 15:15:00', '2020-08-08 15:15:00');

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
(1, 1, NULL, NULL, 5, '2020-08-08 14:35:22', '2020-08-08 14:35:22'),
(2, 1, NULL, NULL, 5, '2020-08-08 14:35:22', '2020-08-08 14:35:22'),
(3, 8, NULL, NULL, 2, '2020-08-08 14:35:22', '2020-08-08 14:35:22'),
(4, 10, NULL, NULL, 3, '2020-08-08 14:35:22', '2020-08-08 14:35:22'),
(5, 7, NULL, NULL, 4, '2020-08-08 14:35:22', '2020-08-08 14:35:22'),
(6, 9, NULL, NULL, 1, '2020-08-08 14:35:22', '2020-08-08 14:35:22'),
(7, 7, NULL, NULL, 4, '2020-08-08 14:35:22', '2020-08-08 14:35:22'),
(8, 9, NULL, NULL, 1, '2020-08-08 14:35:22', '2020-08-08 14:35:22'),
(9, 10, NULL, NULL, 1, '2020-08-08 14:35:22', '2020-08-08 14:35:22'),
(10, 1, NULL, NULL, 1, '2020-08-08 14:35:22', '2020-08-08 14:35:22');

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
(1, 'OVO', '', '2020-08-08 14:24:54', '2020-08-08 14:24:54'),
(2, 'GoPay', '', '2020-08-08 14:24:54', '2020-08-08 14:24:54'),
(3, 'Post Indonesia', '', '2020-08-08 14:24:54', '2020-08-08 14:24:54'),
(4, 'Indomart', '', '2020-08-08 14:24:54', '2020-08-08 14:24:54'),
(5, 'Alfamart', '', '2020-08-08 14:24:54', '2020-08-08 14:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
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

INSERT INTO `products` (`id`, `brand_id`, `name`, `category_id`, `colors`, `sizes`, `price`, `image`, `quantity`, `description`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 'armani dress', 17, 'red|yellow|green', 's|m|l', 124, 'default.png', 5, 'description', 3, '2020-08-08 14:54:41', '2020-08-08 16:08:01'),
(2, 1, 'armani jackets', 1, 'red|green|blue', 's|m|l', 111, 'default.png', 5, 'description', 4, '2020-08-08 14:54:41', '2020-08-08 16:08:01'),
(3, 4, 'burberry jacket', 1, 'red|blue|pink', 's|m|l', 33, 'default.png', 5, 'description', 5, '2020-08-08 14:56:37', '2020-08-08 16:08:01'),
(4, 4, 'burberry shoes', 21, 'white|black|grey', 'm|l|xl', 22, 'default.png', 5, 'description', 5, '2020-08-08 14:56:37', '2020-08-08 16:08:01'),
(5, 6, 'chanel skirts', 13, 'black|orange|blue', 'm|l|xl', 123, 'default.png', 5, 'description', 4, '2020-08-08 14:58:29', '2020-08-08 16:08:01'),
(6, 6, 'chanel suits', 9, 'purple|white|blue', 's|m|l|xl|xxl', 231, 'default.png', 5, 'description', 5, '2020-08-08 14:58:29', '2020-08-08 16:08:01'),
(7, 2, 'fendi sweaters', 25, 'red|blue|black', 'm|l|xl', 123, 'default.png', 5, 'description', 3, '2020-08-08 14:59:56', '2020-08-08 16:08:01'),
(8, 2, 'fendi trousers', 5, 'yellow|black|red', 'm|l|xl', 123, 'default.png', 5, 'description', 5, '2020-08-08 14:59:56', '2020-08-08 16:08:01');

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
(1, 'xs', '2020-08-08 04:51:41', '2020-08-08 14:03:14'),
(2, 's', '2020-08-08 14:04:19', '2020-08-08 14:04:19'),
(3, 'm', '2020-08-08 14:04:19', '2020-08-08 14:04:19'),
(4, 'l', '2020-08-08 14:04:19', '2020-08-08 14:04:19'),
(5, 'xl', '2020-08-08 14:04:19', '2020-08-08 14:04:19'),
(6, 'xxl', '2020-08-08 14:04:19', '2020-08-08 14:04:19');

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
(1, 'admin', 'admin admin', '2020-08-08', 'admin@admin.com', '$2b$10$GkG9XeGne3Te9JETETsZJ.n7.W1NMM9qK9vd31S3S.YA/PrU/uNXO', '089606415122', 'http://192.168.42.15:3000/shopwe/images/avatar.png', 'address_name-penerima-alamat-kota-kode_pos-telepon|name-penerima-alamat-kota-kode_pos-telepon-negara|address_name-penerima-alamat-kota-kode_pos-telepon|name-penerima-alamat-kota-kode_pos-telepon-negara|', 0, 1, 'admin', '2020-08-08 04:19:48', '2020-08-08 07:16:36'),
(7, 'rifandi', 'rifandi ganteng', '2020-08-08', 'adninsijawa.medsos@gmail.com', '$2b$10$Vh5RKaFYjKKwg4veu3qsse/zIZBCfA7HGeF7j4x4ofMsABD0ujAnG', NULL, 'http://192.168.42.15:3000/shopwe/images/avatar.png', NULL, NULL, 3, 'RG61470', '2020-08-08 11:12:56', '2020-08-08 13:39:50'),
(8, 'adnin', 'adnin ganteng', '2020-08-08', 'adnin@shopwe.com', '$2b$10$TeB6466esHEIj8dJBg71tuW6ZjqhAbWn1dgbR6Ae3MQxFobiF6I/K', NULL, 'http://192.168.42.15:3000/shopwe/images/avatar.png', NULL, NULL, 3, 'AG40093', '2020-08-08 14:30:34', '2020-08-08 14:30:34'),
(9, 'sutanto', 'sutanto ganteng', '2020-08-08', 'sutanto@shopwe.com', '$2b$10$4elgYLajPAeKeJ6k00ylSOvm2pibszDX7tqJVHM/ZgVtdm5eulFy.', NULL, 'http://192.168.42.15:3000/shopwe/images/avatar.png', NULL, NULL, 3, 'SG36569', '2020-08-08 14:30:53', '2020-08-08 14:30:53'),
(10, 'putra', 'putra ganteng', '2020-08-08', 'putra@shopwe.com', '$2b$10$qz2JWCDkdd2E9vqV.k87Iuku4cChMpsd7204d5m2iEShltYzI.bdC', NULL, 'http://192.168.42.15:3000/shopwe/images/avatar.png', NULL, NULL, 3, 'PG16568', '2020-08-08 14:31:04', '2020-08-08 14:31:04');

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
-- Indexes for table `detail_category`
--
ALTER TABLE `detail_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_category`
--
ALTER TABLE `detail_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `detail_order`
--
ALTER TABLE `detail_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_category`
--
ALTER TABLE `detail_category`
  ADD CONSTRAINT `detail_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `detail_order`
--
ALTER TABLE `detail_order`
  ADD CONSTRAINT `detail_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `detail_order_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
