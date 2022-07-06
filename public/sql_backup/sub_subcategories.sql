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
-- Table structure for table `sub_subcategories`
--

CREATE TABLE `sub_subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `string_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_subcategories`
--

INSERT INTO `sub_subcategories` (`id`, `subcategory_id`, `string_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'milled-rice', 'Milled Rice', '2022-03-16 19:06:15', '2022-03-16 19:06:15'),
(2, 1, 'rice-husk', 'Rice Husk', '2022-03-16 19:06:15', '2022-03-16 19:06:15'),
(3, 1, 'rice-bran', 'Rice Bran', '2022-03-16 19:06:15', '2022-03-16 19:06:15'),
(4, 1, 'glutinous-rice-flour', 'Glutinous Rice Flour', '2022-03-16 19:06:15', '2022-03-16 19:06:15'),
(5, 2, 'white-corn', 'White Corn', '2022-03-16 19:06:18', '2022-03-16 19:06:18'),
(6, 2, 'yellow-corn', 'Yellow Corn', '2022-03-16 19:06:18', '2022-03-16 19:06:18'),
(7, 3, 'cavendish', 'Cavendish', '2022-03-16 19:06:22', '2022-03-16 19:06:22'),
(8, 3, 'lakatan', 'Lakatan', '2022-03-16 19:06:22', '2022-03-16 19:06:22'),
(9, 3, 'saba', 'Saba', '2022-03-16 19:06:22', '2022-03-16 19:06:22'),
(10, 3, 'señorita', 'Señorita', '2022-03-16 19:06:22', '2022-03-16 19:06:22'),
(11, 4, 'coconut-peat', 'Coconut Peat', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
(12, 4, 'coconut-milk', 'Coconut Milk', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
(13, 4, 'desiccated-coconut', 'Desiccated Coconut', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
(14, 4, 'coconut-juice', 'Coconut Juice', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
(15, 4, 'copra', 'Copra', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
(16, 4, 'coconut-shells', 'Coconut Shells', '2022-03-16 19:06:26', '2022-03-16 19:06:26'),
(17, 5, 'indian', 'indian', '2022-03-16 19:06:29', '2022-03-16 19:06:29'),
(18, 5, 'pico', 'pico', '2022-03-16 19:06:29', '2022-03-16 19:06:29'),
(19, 5, 'carabao', 'carabao', '2022-03-16 19:06:29', '2022-03-16 19:06:29'),
(20, 6, 'crane-tops', 'Crane Tops', '2022-03-16 19:06:33', '2022-03-16 19:06:33'),
(21, 6, 'bagasse', 'Bagasse', '2022-03-16 19:06:33', '2022-03-16 19:06:33'),
(22, 6, 'molasses', 'Molasses', '2022-03-16 19:06:33', '2022-03-16 19:06:33'),
(23, 7, 'fresh-pineapple', 'Fresh Pineapple', '2022-03-16 19:06:36', '2022-03-16 19:06:36'),
(24, 7, 'pineapple-candy', 'Pineapple Candy', '2022-03-16 19:06:36', '2022-03-16 19:06:36'),
(25, 7, 'pineapple-chunks', 'Pineapple Chunks', '2022-03-16 19:06:36', '2022-03-16 19:06:36'),
(26, 7, 'pineapple-slices', 'Pineapple Slices', '2022-03-16 19:06:36', '2022-03-16 19:06:36'),
(27, 7, 'pineapple-juice', 'Pineapple Juice', '2022-03-16 19:06:36', '2022-03-16 19:06:36'),
(28, 8, 'raw-cassava', 'Raw Cassava', '2022-03-16 19:06:40', '2022-03-16 19:06:40'),
(29, 8, 'cassava-chips', 'Cassava Chips', '2022-03-16 19:06:40', '2022-03-16 19:06:40'),
(30, 8, 'cassava-starch', 'Cassava Starch', '2022-03-16 19:06:40', '2022-03-16 19:06:40'),
(31, 8, 'cassava-flour', 'Cassava Flour', '2022-03-16 19:06:40', '2022-03-16 19:06:40'),
(32, 10, 'raw-sweet-potato', 'Raw Sweet Potato', '2022-03-16 19:06:43', '2022-03-16 19:06:43'),
(33, 10, 'sweet-potato-chips', 'Swwet Potato Chips', '2022-03-16 19:06:43', '2022-03-16 19:06:43'),
(34, 13, 'arabica', 'arabica', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
(35, 13, 'excelsa', 'excelsa', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
(36, 13, 'liberica', 'liberica', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
(37, 13, 'robusta', 'robusta', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
(38, 13, 'drip-coffee', 'Drip Coffee', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
(39, 13, 'ground-coffee', 'Ground Coffee', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
(40, 13, 'roasted-beans', 'Roasted Beans', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
(41, 13, 'instant-coffee', 'Instant Coffee', '2022-03-16 19:06:51', '2022-03-16 19:06:51'),
(42, 16, 'fresh-tomato', 'Fresh Tomato', '2022-03-16 19:06:54', '2022-03-16 19:06:54'),
(43, 16, 'tomato-paste', 'Tomato Paste', '2022-03-16 19:06:54', '2022-03-16 19:06:54'),
(44, 16, 'tomato-catsup', 'Tomato Catsup', '2022-03-16 19:06:54', '2022-03-16 19:06:54'),
(45, 16, 'dried-tomatoes', 'Dried Tomatoes', '2022-03-16 19:06:54', '2022-03-16 19:06:54'),
(46, 17, 'raw-potato', 'Raw Potato', '2022-03-16 19:06:58', '2022-03-16 19:06:58'),
(47, 17, 'potato-chips', 'Potato Chips', '2022-03-16 19:06:58', '2022-03-16 19:06:58'),
(48, 19, 'cabbage-rolls', 'Cabbage Rolls', '2022-03-16 19:07:01', '2022-03-16 19:07:01'),
(49, 20, 'calamansi-fruit', 'Calamansi Fruit', '2022-03-16 19:07:05', '2022-03-16 19:07:05'),
(50, 20, 'calamansi-juice', 'Calamansi Juice', '2022-03-16 19:07:05', '2022-03-16 19:07:05'),
(51, 20, 'calamansi-puree', 'Calamansi Puree', '2022-03-16 19:07:05', '2022-03-16 19:07:05'),
(52, 21, 'mungbean-cake', 'Mungbean Cake', '2022-03-16 19:07:11', '2022-03-16 19:07:11'),
(53, 21, 'mungbean-noodles', 'Mungbean Noodles', '2022-03-16 19:07:11', '2022-03-16 19:07:11'),
(54, 21, 'mungbean-wine', 'Mungbean Wine', '2022-03-16 19:07:11', '2022-03-16 19:07:11'),
(55, 21, 'mungbean-paste', 'Mungbean Paste', '2022-03-16 19:07:11', '2022-03-16 19:07:11'),
(56, 22, 'tablea', 'tablea', '2022-03-16 19:07:14', '2022-03-16 19:07:14'),
(57, 22, 'coconut-butter', 'Coconut Butter', '2022-03-16 19:07:14', '2022-03-16 19:07:14'),
(58, 22, 'coconut-nibs', 'Coconut Nibs', '2022-03-16 19:07:14', '2022-03-16 19:07:14'),
(59, 22, 'coconut-powder', 'Coconut Powder', '2022-03-16 19:07:14', '2022-03-16 19:07:14'),
(60, 22, 'chocolate', 'Chocolate', '2022-03-16 19:07:14', '2022-03-16 19:07:14'),
(61, 25, 'raw-peanuts', 'Raw Peanuts', '2022-03-16 19:07:19', '2022-03-16 19:07:19'),
(62, 25, 'salted-peanuts', 'Salted Peanuts', '2022-03-16 19:07:19', '2022-03-16 19:07:19'),
(63, 29, 'ears', 'Ears', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(64, 29, 'head', 'head', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(65, 29, 'neck', 'neck', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(66, 29, 'shoulder', 'shoulder', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(67, 29, 'loin', 'loin', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(68, 29, 'tenderloin', 'tenderloin', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(69, 29, 'ribs', 'ribs', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(70, 29, 'belly', 'belly', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(71, 29, 'leg', 'leg', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(72, 29, 'hock', 'hock', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(73, 29, 'knuckle', 'knuckle', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(74, 29, 'pork-ham', 'pork ham', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(75, 29, 'offal-and-edible-viscera', 'Offal and Edible Viscera', '2022-03-16 19:07:23', '2022-03-16 19:07:23'),
(76, 30, 'beef', 'beef', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(77, 30, 'chuck', 'chuck', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(78, 30, 'beef-brisket', 'beef brisket', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(79, 30, 'beef-shank', 'beef shank', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(80, 30, 'beef-rib', 'beef rib', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(81, 30, 'short rib', 'short-rib', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(82, 30, 'beef-plate', 'beef plate', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(83, 30, 'short-loin', 'short loin', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(84, 30, 'sirloin', 'sirloin', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(85, 30, 'tenderloin', 'tenderloin', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(86, 30, 'rump', 'rump', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(87, 30, 'round', 'round', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(88, 30, 'beef-ham', 'beef ham', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(89, 30, 'offal-and-edible-viscera', 'Offal and Edible Viscera', '2022-03-16 19:07:28', '2022-03-16 19:07:28'),
(90, 31, 'chuck', 'chuck', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
(91, 31, 'brisket', 'brisket', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
(92, 31, 'shank', 'shank', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
(93, 31, 'beef-plate', 'beef plate', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
(94, 31, 'short-loin', 'short loin', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
(95, 31, 'tenderloin', 'tenderloin', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
(96, 31, 'rump', 'rump', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
(97, 31, 'round', 'round', '2022-03-16 19:07:32', '2022-03-16 19:07:32'),
(98, 32, 'neck', 'neck', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
(99, 32, 'leg', 'leg', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
(100, 32, 'loin', 'loin', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
(101, 32, 'rib', 'rib', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
(102, 32, 'shoulder', 'shoulder', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
(103, 32, 'shank', 'shank', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
(104, 32, 'breast', 'breast', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
(105, 32, 'fresh-milk', 'fresh milk', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
(106, 32, 'cheese', 'cheese', '2022-03-16 19:07:36', '2022-03-16 19:07:36'),
(107, 33, 'fresh-milk', 'Fresh Milk', '2022-03-16 19:07:39', '2022-03-16 19:07:39'),
(108, 33, 'cheese', 'Cheese', '2022-03-16 19:07:39', '2022-03-16 19:07:39'),
(109, 34, 'chicken-breast', 'chicken breast', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
(110, 34, 'chicken-feet', 'chicken feet', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
(111, 34, 'chicken-neck', 'chicken neck', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
(112, 34, 'gizzard', 'gizzard', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
(113, 34, 'intestine', 'intestine', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
(114, 34, 'chicken-thigh', 'chicken thigh', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
(115, 34, 'chicken-drumstick', 'chicken drumstick', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
(116, 34, 'chicken-wings', 'chicken wings', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
(117, 34, 'liver', 'liver', '2022-03-16 19:07:43', '2022-03-16 19:07:43'),
(118, 37, 'salted-egg', 'salted egg', '2022-03-16 19:07:47', '2022-03-16 19:07:47'),
(119, 37, 'balut', 'balut', '2022-03-16 19:07:47', '2022-03-16 19:07:47'),
(120, 37, 'penoy', 'penoy', '2022-03-16 19:07:47', '2022-03-16 19:07:47'),
(121, 38, 'dried', 'dried', '2022-03-16 19:07:51', '2022-03-16 19:07:51'),
(122, 38, 'smoked', 'smoked', '2022-03-16 19:07:51', '2022-03-16 19:07:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sub_subcategories`
--
ALTER TABLE `sub_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_subcategories_subcategory_id_foreign` (`subcategory_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sub_subcategories`
--
ALTER TABLE `sub_subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sub_subcategories`
--
ALTER TABLE `sub_subcategories`
  ADD CONSTRAINT `sub_subcategories_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
