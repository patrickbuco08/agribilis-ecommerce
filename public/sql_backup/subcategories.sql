-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2022 at 03:50 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agribilis_version2`
--

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `string_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `string_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'palay', 'Palay', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(2, 1, 'corn', 'Corn', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(3, 1, 'banana', 'Banana', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(4, 1, 'coconut', 'Coconut', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(5, 1, 'mango', 'Mango', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(6, 1, 'sugarcane', 'Sugarcane', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(7, 1, 'pineapple', 'Pineapple', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(8, 1, 'cassava', 'Cassava', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(9, 1, 'rubber', 'Rubber', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(10, 1, 'sweet-potato', 'Sweet Potato', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(11, 1, 'onion', 'Onion', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(12, 1, 'eggplant', 'Eggplant', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(13, 1, 'coffee', 'Coffee', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(14, 1, 'tobaccoo', 'Tobaccoo', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(15, 1, 'abaca', 'Abaca', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(16, 1, 'tomato', 'Tomato', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(17, 1, 'potato', 'Potato', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(18, 1, 'ampalaya', 'Ampalaya', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(19, 1, 'cabbage', 'Cabbage', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(20, 1, 'calamansi', 'Calamansi', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(21, 1, 'mongo', 'Mongo', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(22, 1, 'cacao', 'Cacao', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(23, 1, 'lanzonez', 'Lanzonez', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(24, 1, 'watermelon', 'Watermelon', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(25, 1, 'peanut', 'Peanut', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(26, 1, 'ginger', 'Ginger', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(27, 1, 'lettuce', 'Lettuce', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(28, 1, 'other-crops', 'Other Crops', '2022-03-16 19:05:53', '2022-03-16 19:05:53'),
(29, 2, 'hog', 'Hog', '2022-03-16 19:05:58', '2022-03-16 19:05:58'),
(30, 2, 'cattle', 'Cattle', '2022-03-16 19:05:58', '2022-03-16 19:05:58'),
(31, 2, 'carabo', 'Carabo', '2022-03-16 19:05:58', '2022-03-16 19:05:58'),
(32, 2, 'goat', 'Goat', '2022-03-16 19:05:58', '2022-03-16 19:05:58'),
(33, 2, 'dairy', 'Dairy', '2022-03-16 19:05:58', '2022-03-16 19:05:58'),
(34, 3, 'chicken', 'Chicken', '2022-03-16 19:06:01', '2022-03-16 19:06:01'),
(35, 3, 'chicken-eggs', 'Chicken Eggs', '2022-03-16 19:06:01', '2022-03-16 19:06:01'),
(36, 3, 'duck', 'Duck', '2022-03-16 19:06:01', '2022-03-16 19:06:01'),
(37, 3, 'duck-eggs', 'Duck Eggs', '2022-03-16 19:06:01', '2022-03-16 19:06:01'),
(38, 4, 'milkfish', 'milkFish', '2022-03-16 19:06:06', '2022-03-16 19:06:06'),
(39, 4, 'tilapia', 'Tilapia', '2022-03-16 19:06:06', '2022-03-16 19:06:06'),
(40, 4, 'tiger-prawn', 'Tiger Prawn', '2022-03-16 19:06:06', '2022-03-16 19:06:06'),
(41, 4, 'skipjack', 'Skipjack', '2022-03-16 19:06:06', '2022-03-16 19:06:06'),
(42, 4, 'roundscad', 'Roundscad', '2022-03-16 19:06:06', '2022-03-16 19:06:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
