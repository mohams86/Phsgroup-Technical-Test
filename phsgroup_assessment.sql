-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 29, 2023 at 08:47 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phsgroup_assessment`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2023_02_01_000001_create_products_table', 1),
(2, '2023_02_01_000001_create_order_products_table', 2),
(3, '2023_02_01_000001_create_orders_table', 3),
(4, '2014_10_12_000000_create_users_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` bigint UNSIGNED NOT NULL,
  `price` double(5,2) NOT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `price`, `delivery_address`, `created_at`, `updated_at`) VALUES
(1, 11, 10.50, 'dd', '2023-06-28 00:57:15', '2023-06-28 00:57:15'),
(2, 11, 10.50, 'dd', '2023-06-28 01:03:18', '2023-06-28 01:03:18'),
(3, 11, 10.50, 'dd', '2023-06-28 01:04:00', '2023-06-28 01:04:00'),
(4, 11, 10.50, 'dd', '2023-06-28 01:04:17', '2023-06-28 01:04:17'),
(5, 11, 10.50, 'dd', '2023-06-28 01:11:47', '2023-06-28 01:11:47'),
(6, 11, 10.50, 'ghhghfgf', '2023-06-28 01:18:11', '2023-06-28 01:18:11'),
(7, 11, 0.90, 'huhhhhhhhihi', '2023-06-28 21:04:30', '2023-06-28 21:04:30'),
(8, 11, 0.90, 'huhhhhhhhihi', '2023-06-28 21:05:58', '2023-06-28 21:05:58'),
(9, 11, 0.40, 'hihi', '2023-06-28 21:07:46', '2023-06-28 21:07:46'),
(10, 11, 0.40, 'rrrt', '2023-06-28 21:09:28', '2023-06-28 21:09:28'),
(11, 11, 0.40, 'huhu', '2023-06-28 21:10:20', '2023-06-28 21:10:20'),
(12, 11, 0.40, 'rrere', '2023-06-28 21:12:32', '2023-06-28 21:12:32'),
(13, 11, 2.70, 'uu', '2023-06-29 16:45:21', '2023-06-29 16:45:21'),
(14, 11, 0.40, 'wew', '2023-06-29 17:56:51', '2023-06-29 17:56:51'),
(15, 11, 0.90, 'sdsd', '2023-06-29 18:04:26', '2023-06-29 18:04:26'),
(16, 11, 0.40, 'Test address', '2023-06-29 19:42:01', '2023-06-29 19:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
CREATE TABLE IF NOT EXISTS `order_products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2023-06-28 00:57:15', '2023-06-28 00:57:15'),
(2, 1, 3, '2023-06-28 00:57:15', '2023-06-28 00:57:15'),
(3, 3, 2, '2023-06-28 01:04:00', '2023-06-28 01:04:00'),
(4, 3, 3, '2023-06-28 01:04:00', '2023-06-28 01:04:00'),
(5, 4, 2, '2023-06-28 01:04:17', '2023-06-28 01:04:17'),
(6, 4, 3, '2023-06-28 01:04:17', '2023-06-28 01:04:17'),
(7, 5, 2, '2023-06-28 01:11:47', '2023-06-28 01:11:47'),
(8, 5, 3, '2023-06-28 01:11:47', '2023-06-28 01:11:47'),
(9, 6, 2, '2023-06-28 01:18:11', '2023-06-28 01:18:11'),
(10, 6, 3, '2023-06-28 01:18:11', '2023-06-28 01:18:11'),
(11, 7, 2, '2023-06-28 21:04:30', '2023-06-28 21:04:30'),
(12, 8, 2, '2023-06-28 21:05:58', '2023-06-28 21:05:58'),
(13, 9, 1, '2023-06-28 21:07:46', '2023-06-28 21:07:46'),
(14, 10, 1, '2023-06-28 21:09:28', '2023-06-28 21:09:28'),
(15, 11, 1, '2023-06-28 21:10:20', '2023-06-28 21:10:20'),
(16, 12, 1, '2023-06-28 21:12:32', '2023-06-28 21:12:32'),
(17, 13, 2, '2023-06-29 16:45:21', '2023-06-29 16:45:21'),
(18, 14, 1, '2023-06-29 17:56:51', '2023-06-29 17:56:51'),
(19, 15, 2, '2023-06-29 18:04:26', '2023-06-29 18:04:26'),
(20, 16, 1, '2023-06-29 19:42:01', '2023-06-29 19:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(5,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'apple', 'an apple', 0.40, 'an apple that is delightful to behold', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(2, 'banana', 'a banana', 0.90, 'a yellow banana', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(3, 'bowl', 'a fruit bowl', 2.60, 'a bowl that is ideal for holding fruit', '2023-06-27 18:17:48', '2023-06-27 18:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Bennett McKenzie', 'kerluke.zackery@example.com', '2023-06-27 18:17:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tQv4dBdrCf', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(2, 'Scot Rowe', 'jerde.raven@example.net', '2023-06-27 18:17:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '56gJzUJgMt', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(3, 'Mr. Sylvester Schiller', 'kathleen.jacobi@example.net', '2023-06-27 18:17:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LTfQclvBHp', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(4, 'Josefa Murazik', 'leatha.gottlieb@example.org', '2023-06-27 18:17:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QIaD7TSmfQ', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(5, 'Bernie Murray', 'stamm.rosa@example.com', '2023-06-27 18:17:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JAmuF7E5ks', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(6, 'Walker Ruecker', 'wdeckow@example.org', '2023-06-27 18:17:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rFRwE4npF2', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(7, 'Prof. Arnoldo O\'Keefe I', 'kuhn.keanu@example.com', '2023-06-27 18:17:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'g4FHH4jRmg', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(8, 'Leatha Hudson III', 'jthompson@example.net', '2023-06-27 18:17:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eZZ9VHWmKI', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(9, 'Johnathan Prosacco', 'ankunding.faustino@example.com', '2023-06-27 18:17:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OKFYv2O02p', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(10, 'Korey Dickinson', 'kristin91@example.org', '2023-06-27 18:17:48', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Txu0h83nJ2', '2023-06-27 18:17:48', '2023-06-27 18:17:48'),
(11, 'Mohammed Mansawala', 'mohammed.mansawala@gmail.com', NULL, '$2y$10$fwM4inje1Vu1qxxw0BLnie/yiEZ9RBtjHIWw0QXkT1mHGUAapkxEi', NULL, '2023-06-27 19:57:32', '2023-06-27 19:57:32'),
(12, 'hhhud', 'aysgay@sasa.com', NULL, '$2y$10$aWnwnohTqBV07MIFojeANuVqcDNboR/GOv7JRZmJmZKr7nY1HftCi', NULL, '2023-06-29 18:56:06', '2023-06-29 18:56:06');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
