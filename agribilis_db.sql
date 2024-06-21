-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2022 at 04:27 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

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
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` smallint(6) NOT NULL,
  `set_as_default` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `full_name`, `location`, `phone`, `postal_code`, `set_as_default`, `created_at`, `updated_at`) VALUES
(1, 17, 'Patrick Demillo Buco', 'Luksuhin-Sulsugin Road, Marcos Highway St., Alfonso Cavite', '0977390832', 4123, 1, '2022-09-25 01:43:21', '2022-09-25 01:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `string_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `string_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'crops', 'Crops', '2022-03-16 11:05:44', '2022-03-16 11:05:44'),
(2, 'livestock', 'Livestock', '2022-03-16 11:05:44', '2022-03-16 11:05:44'),
(3, 'poultry', 'Poultry', '2022-03-16 11:05:44', '2022-03-16 11:05:44'),
(4, 'fisheries', 'Fisheries', '2022-03-16 11:05:44', '2022-03-16 11:05:44');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `featured_products`
--

CREATE TABLE `featured_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_orders`
--

CREATE TABLE `group_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tracking_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `mode_of_payment` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approval_status` enum('pending','approved','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_min` date NOT NULL,
  `delivery_max` date NOT NULL,
  `note_by_owner` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note_by_vendor` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_orders`
--

INSERT INTO `group_orders` (`id`, `tracking_number`, `user_id`, `mode_of_payment`, `approval_status`, `status_id`, `delivery_min`, `delivery_max`, `note_by_owner`, `note_by_vendor`, `created_at`, `updated_at`) VALUES
(1, '#00000002', 17, 'cash_on_delivery', 'pending', 1, '2022-09-27', '2022-09-29', 'pakideliver po agad baka mapanis', '', '2022-09-25 01:48:24', '2022-09-25 01:48:24'),
(2, '#00000003', 17, 'cash_on_delivery', 'approved', 4, '2022-09-26', '2022-10-01', 'pakideliver po agad baka mapanis', '', '2022-09-25 01:48:30', '2022-09-25 02:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `group_order_billing_details`
--

CREATE TABLE `group_order_billing_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_order_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_order_billing_details`
--

INSERT INTO `group_order_billing_details` (`id`, `group_order_id`, `full_name`, `location`, `phone`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Patrick Demillo Buco', 'Luksuhin-Sulsugin Road, Marcos Highway St., Alfonso Cavite', '0977390832', 4123, '2022-09-25 01:48:24', '2022-09-25 01:48:24'),
(2, 2, 'Patrick Demillo Buco', 'Luksuhin-Sulsugin Road, Marcos Highway St., Alfonso Cavite', '0977390832', 4123, '2022-09-25 01:48:30', '2022-09-25 01:48:30');

-- --------------------------------------------------------

--
-- Table structure for table `group_order_items`
--

CREATE TABLE `group_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_order_items`
--

INSERT INTO `group_order_items` (`id`, `group_order_id`, `product_id`, `amount`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2552, 2, '2022-09-25 01:48:24', '2022-09-25 01:48:24'),
(2, 2, 22, 1263, 12, '2022-09-25 01:48:30', '2022-09-25 01:48:30');

-- --------------------------------------------------------

--
-- Table structure for table `group_order_item_status`
--

CREATE TABLE `group_order_item_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_order_item_id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_order_item_status`
--

INSERT INTO `group_order_item_status` (`id`, `group_order_item_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-09-25 01:48:24', '2022-09-25 01:48:24'),
(2, 2, 4, '2022-09-25 01:48:30', '2022-09-25 02:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_06_013655_create_user_information_table', 1),
(6, '2022_04_06_013723_create_addresses_table', 1),
(7, '2022_04_06_013823_create_products_table', 1),
(8, '2022_04_06_013857_create_cart_items_table', 1),
(9, '2022_04_06_014020_create_featured_products_table', 1),
(10, '2022_04_06_014038_create_product_photos_table', 1),
(11, '2022_04_06_014104_create_product_reviews_table', 1),
(12, '2022_04_06_014140_create_categories_table', 1),
(13, '2022_04_06_014200_create_subcategories_table', 1),
(14, '2022_04_06_014223_create_sub_subcategories_table', 1),
(15, '2022_04_06_014303_create_product_categories_table', 1),
(16, '2022_04_06_014324_create_roles_table', 1),
(17, '2022_04_06_014346_create_user_roles_table', 1),
(18, '2022_04_06_014404_create_status_table', 1),
(19, '2022_04_06_053405_create_group_orders_table', 1),
(20, '2022_04_06_053504_create_group_order_items_table', 1),
(21, '2022_04_14_004758_create_units_table', 1),
(22, '2022_04_20_025423_create_group_order_item_status_table', 1),
(23, '2022_04_20_030244_create_group_order_billing_details', 1),
(24, '2022_06_26_172547_create_vendor_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `string_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` smallint(6) NOT NULL,
  `orders` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `delivery_min` tinyint(4) NOT NULL,
  `delivery_max` tinyint(4) NOT NULL,
  `thumbnail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `string_id`, `name`, `description`, `tags`, `unit`, `rating`, `orders`, `stock`, `price`, `delivery_min`, `delivery_max`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 1, 'dolorem-vel-vero', 'dolorem vel vero', 'magni quasi dolores non minima aut doloremque sint consequuntur et voluptates eos aliquam est voluptate maxime officia fugiat ut mollitia consequatur aut placeat nisi eaque cumque fugiat aperiam reiciendis eum est enim hic similique ut dignissimos voluptas similique aut eius cumque perspiciatis possimus sapiente et quasi quo optio atque voluptatem voluptas est tempore hic sed accusamus sequi est non facere qui voluptas dicta optio quaerat incidunt est distinctio ea in recusandae accusamus quo culpa veritatis voluptatem magni eius eum sint', 'dolores, earum, modi, maxime, id, accusantium, porro, nulla, sed, quis, inventore, necessitatibus, cumque, autem, expedita, cupiditate, quo, non, nulla, atque', 'kg', 41, 1075, 55, 2552, 2, 4, 'tobacco.png', '2019-08-09 20:49:49', '2022-07-05 12:51:22'),
(2, 1, 'omnis-quo-eum-aut', 'omnis quo eum aut', 'consectetur assumenda ut inventore quae quisquam labore et praesentium aut harum aut esse voluptas sit minus sapiente tempore cumque dolor ad non nihil voluptatem omnis sunt qui officiis error est quia nulla reprehenderit nihil nemo et natus quaerat corporis commodi deleniti est ut possimus eius velit enim quia accusantium ducimus non occaecati ad laudantium voluptates suscipit dolore labore consequatur iusto rerum eligendi necessitatibus non magni consequuntur rerum repudiandae voluptas quas pariatur aut dicta quia libero dolore natus sit dolorem perspiciatis', 'quasi, reiciendis, quos, delectus, consequatur, ab, eveniet, beatae, dolor, nemo, qui, culpa, sapiente, qui, occaecati, voluptas, numquam, repellat, mollitia, minima', 'kg', 53, 2864, 259, 4586, 2, 9, 'senorita.png', '2018-11-05 19:36:53', '2022-07-05 12:51:22'),
(3, 1, 'voluptas-veritatis-accusamus', 'voluptas veritatis accusamus', 'ullam in necessitatibus voluptas et occaecati qui ut atque eligendi necessitatibus neque sunt quasi a itaque corporis minus quo distinctio quidem autem culpa mollitia voluptates inventore eaque sed neque velit quasi consequatur ex voluptatem molestias voluptates delectus quia qui modi nihil voluptates quae et modi reprehenderit nisi ut tempore voluptatem odit libero natus et reprehenderit culpa ipsam placeat aspernatur veritatis voluptas quibusdam inventore aliquam officiis itaque nisi mollitia totam qui consequatur minima velit dolores voluptatem quas qui mollitia atque in', 'et, voluptas, perferendis, enim, alias, reprehenderit, quidem, laborum, eum, error, dolore, culpa, dolor, veniam, quia, adipisci, eum, commodi, molestias, possimus', 'kg', 4, 1573, 264, 5457, 1, 7, 'product-5.jpg', '2020-01-21 09:35:20', '2022-07-05 12:51:22'),
(4, 1, 'assumenda-aut', 'assumenda aut', 'aliquid et est magni voluptatem recusandae est illum debitis eos ut reiciendis molestias omnis blanditiis reiciendis consequatur et commodi non et deserunt quo temporibus voluptates vero officia adipisci molestiae alias fugit dicta repellat et voluptatum architecto laborum laudantium praesentium laborum qui culpa mollitia nemo ullam occaecati itaque aperiam sed voluptatem architecto ipsum et quia reprehenderit perspiciatis blanditiis veniam libero quibusdam non nulla est labore et nisi beatae totam molestiae molestiae dignissimos vitae adipisci qui beatae et sint molestias ex sequi', 'autem, distinctio, nihil, facilis, perferendis, modi, placeat, beatae, molestias, eum, sit, iste, voluptatem, eum, voluptas, numquam, ut, molestias, fugit, nisi', 'kg', 6, 2816, 97, 4106, 1, 4, 'product-8.jpg', '2021-04-20 08:13:01', '2022-07-05 12:51:22'),
(5, 1, 'quasi-ut', 'quasi ut', 'tempore magni dolor eaque id asperiores ipsa sed pariatur pariatur laborum reprehenderit pariatur explicabo itaque cupiditate quaerat mollitia sed dolor non qui voluptatibus sunt iusto tempore vel molestiae illo saepe saepe ut reprehenderit consequatur consequatur quasi adipisci et nemo eos iste ut repudiandae amet error esse molestiae et ut quis quod ipsam quia ex veritatis tenetur accusamus ab nostrum cupiditate odio adipisci aut doloribus quia esse quo aut minus itaque omnis provident ut dicta architecto omnis repudiandae eveniet dolore qui', 'eveniet, ullam, deleniti, aperiam, labore, voluptatem, dolores, vel, veritatis, vel, autem, veniam, saepe, reiciendis, earum, numquam, et, nihil, rerum, repudiandae', 'kg', 88, 2533, 279, 568, 2, 7, '4.jpg', '2019-11-12 07:42:19', '2022-07-05 12:51:22'),
(6, 1, 'vel-ut-hic', 'vel ut hic', 'aliquam molestias omnis est omnis consequatur ipsam quod quam dolor voluptas quia ut fugiat modi dolorum atque laudantium officia numquam dolorem saepe eos autem quo deserunt facilis et qui facere necessitatibus illum minus qui iusto omnis nemo tempore veritatis quis repellendus error reprehenderit ullam id veritatis quo nesciunt quasi quaerat rerum ut est libero qui recusandae ut et ut consequatur rem ut labore facere qui asperiores provident sit doloribus quia ut accusantium nam quas cupiditate alias et ullam maiores non', 'perferendis, omnis, expedita, qui, iste, est, animi, et, aut, aspernatur, quae, officiis, laudantium, fuga, maxime, ipsum, deserunt, laudantium, quaerat, adipisci', 'kg', 93, 2933, 281, 1436, 2, 3, 'rice-husk.png', '2020-11-03 10:30:23', '2022-07-05 12:51:22'),
(7, 1, 'est-sint-velit-nihil', 'est sint velit nihil', 'recusandae quia sit ut illo officiis est cum et eos id distinctio consequatur rerum sit libero dignissimos ut dolorem vero iusto iste laborum et non sapiente nobis ad quasi nihil enim libero aut vel et aliquam explicabo commodi beatae modi labore dolorum consequatur enim voluptatem animi commodi et ipsam quas a nam ducimus sed qui vero vel in eveniet quae voluptas porro voluptatem asperiores alias qui aliquam est qui saepe minima reprehenderit nihil iusto et sunt corrupti nemo consequatur dolorem', 'placeat, molestiae, ea, et, totam, recusandae, quia, nostrum, est, accusantium, reprehenderit, ducimus, animi, et, alias, laudantium, qui, enim, distinctio, quae', 'kg', 0, 512, 52, 4004, 1, 3, '7.jpg', '2020-05-26 01:21:07', '2022-07-05 12:51:22'),
(8, 1, 'expedita', 'expedita', 'maxime ut nulla quibusdam recusandae non sint hic ullam reiciendis quibusdam quia hic laboriosam dolore ea nostrum placeat nihil laborum qui occaecati tempore rerum consequatur est asperiores totam voluptatibus et nisi sunt ratione alias maxime eius perspiciatis dolor saepe similique adipisci ullam illum officia quod fuga omnis officiis voluptate a sequi et doloremque est velit molestiae voluptas eos repellendus iure odit doloremque id est maiores rem officia consequatur voluptas accusamus assumenda et ullam ducimus aut aut labore omnis accusantium sit', 'necessitatibus, impedit, ut, maxime, nostrum, ad, eveniet, quia, iste, velit, ut, sapiente, quibusdam, sit, placeat, fugiat, et, aut, quo, fugiat', 'kg', 53, 2935, 66, 6606, 2, 5, 'product-6.jpg', '2020-11-11 18:35:44', '2022-07-05 12:51:22'),
(9, 1, 'error-itaque-illum-molestiae', 'error itaque illum molestiae', 'unde rem quis est neque necessitatibus nulla quaerat sit beatae aliquam cupiditate est dolore est et iste delectus ad aut perspiciatis libero dolorum ipsam nemo rerum voluptas molestiae placeat ea saepe iste possimus debitis quis nihil et alias veniam ipsa aspernatur blanditiis illum molestias deleniti ut consequuntur optio qui voluptatum a molestias est sint quia ut sunt quia aperiam quidem asperiores eligendi et neque architecto quo nihil officia aspernatur voluptatem ea pariatur saepe modi ex deleniti quae aut voluptatem voluptatem', 'et, laboriosam, tempora, dolores, ea, suscipit, est, et, expedita, voluptatem, impedit, ratione, quis, doloribus, molestias, veritatis, totam, ratione, in, aut', 'kg', 97, 283, 314, 2774, 2, 10, '12.jpg', '2020-08-13 14:33:41', '2022-07-05 12:51:22'),
(10, 1, 'ratione-neque-nam-sequi', 'ratione neque nam sequi', 'velit nihil ut aut et repellendus debitis atque porro veritatis exercitationem quia qui et qui laboriosam tenetur nostrum animi odio suscipit saepe nisi est reiciendis eum non repudiandae corrupti repellendus dolorum consequuntur ipsam provident exercitationem quas veniam cumque temporibus rerum deleniti deserunt quidem neque assumenda doloribus necessitatibus architecto alias similique dolore voluptatum vel voluptatem dolor ut qui nesciunt quis error aspernatur molestiae aspernatur eaque quae quisquam at quisquam sunt maiores illum sit fugit dolores in est repudiandae hic maxime necessitatibus', 'et, incidunt, expedita, et, et, reprehenderit, consectetur, autem, cumque, corporis, culpa, cupiditate, non, sunt, illum, sit, deserunt, cumque, quo, voluptatum', 'kg', 4, 1756, 143, 2419, 2, 10, '5.jpg', '2018-06-14 08:58:38', '2022-07-05 12:51:22'),
(11, 2, 'hic', 'hic', 'voluptates ut nisi voluptatem eius fuga inventore repellendus sit id in mollitia incidunt delectus ullam quia eum odit animi quibusdam quos cum vitae et voluptates et minus magnam facere fuga et soluta vero dolores qui quis iusto ut nemo aliquid reiciendis harum sunt rerum non ut aut laboriosam aut soluta dolores consequuntur facilis quo quo ad consequatur debitis voluptatibus tenetur eum quibusdam corporis ut molestiae sunt suscipit libero ut impedit inventore et et sit maiores sequi ad nihil mollitia minima', 'inventore, ea, repellat, est, consequatur, minus, aperiam, blanditiis, commodi, molestias, dolorum, sed, cupiditate, tenetur, sapiente, sint, facilis, vero, voluptas, rem', 'kg', 92, 1213, 65, 7540, 2, 5, '12.jpg', '2017-12-23 17:48:56', '2022-07-05 12:51:24'),
(12, 2, 'et-sapiente-repellendus-perspiciatis', 'et sapiente repellendus perspiciatis', 'omnis sint reprehenderit soluta at voluptas sed et possimus quisquam et at at expedita excepturi sit id nemo dolorem necessitatibus et quia explicabo enim qui quia illo nisi magnam ut animi mollitia excepturi quis consequuntur aut voluptate totam voluptatem saepe qui omnis sed commodi et sapiente et aut sed ipsam nemo cumque voluptas hic recusandae in qui debitis neque qui voluptas est non nisi quia omnis sit aut voluptas assumenda vel atque molestiae culpa ipsam et totam sit dolore atque', 'excepturi, laboriosam, pariatur, quos, quas, ipsam, qui, dignissimos, veritatis, magnam, est, molestias, exercitationem, adipisci, voluptatem, et, voluptatem, aut, eum, sint', 'kg', 39, 1021, 49, 6505, 1, 7, '1.jpg', '2020-10-20 13:56:11', '2022-07-05 12:51:24'),
(13, 2, 'cupiditate-molestias', 'cupiditate molestias', 'corporis veniam corrupti id dolor modi natus inventore velit nam voluptates eos mollitia alias est minus omnis deleniti earum soluta officiis sit voluptas molestiae illum repudiandae neque quos ut ratione facere id voluptatem eos sint rem aut fuga id quaerat nostrum omnis quidem praesentium velit culpa aliquid exercitationem quia deleniti corporis asperiores perferendis architecto a aut numquam quae et enim rerum expedita consequatur qui porro rerum praesentium alias totam voluptas est aut assumenda suscipit mollitia fuga nihil praesentium eveniet culpa', 'et, porro, accusantium, voluptatem, eos, neque, non, eveniet, consequuntur, velit, ut, amet, debitis, voluptatibus, consectetur, dignissimos, fuga, qui, voluptatem, qui', 'kg', 61, 1762, 318, 7323, 1, 9, '3.jpg', '2021-08-13 03:35:31', '2022-07-05 12:51:24'),
(14, 2, 'minus-quas-qui-tempore', 'minus quas qui tempore', 'labore culpa dolorem dolorem dolorem laudantium consequatur quibusdam ut exercitationem id corporis labore reprehenderit dicta cumque veritatis qui nihil quia omnis ipsa sunt repellat nihil nisi explicabo quo animi quis sunt non consequuntur ut exercitationem nobis quia tempora dolor quidem quod quia dolorum dolor maiores non excepturi cupiditate impedit quo natus ad porro quia dolorem repudiandae culpa quia fugit omnis ad veniam delectus et soluta voluptatem voluptates sit et aut cum ut eligendi cumque vel ipsum aut aut magnam aut', 'consequuntur, veritatis, voluptatibus, sit, minima, reprehenderit, corrupti, ut, sit, rerum, quidem, odio, harum, rerum, autem, hic, corporis, quod, aut, beatae', 'kg', 98, 2461, 24, 5801, 1, 9, 'product-2.jpg', '2019-12-03 10:41:33', '2022-07-05 12:51:24'),
(15, 2, 'quas-eveniet', 'quas eveniet', 'soluta rerum omnis explicabo fuga et corrupti asperiores aut soluta et et officiis error rerum voluptas illo nesciunt aliquam voluptatem nihil perspiciatis doloremque ea eum nemo quis aut non eos voluptatem id et deserunt praesentium repellendus animi earum laboriosam id cum dicta sed sed a aliquid quia quia earum ut dicta voluptas est quo fuga aut sint asperiores at quia blanditiis eius consectetur illum sunt eos ut quo et velit at id sed molestiae totam dolores voluptas facere explicabo natus', 'quae, tempora, qui, suscipit, explicabo, quia, placeat, ducimus, velit, dignissimos, aut, quia, ratione, qui, dolor, labore, saepe, magni, corrupti, ea', 'kg', 97, 2, 11, 2739, 2, 8, '3.jpg', '2017-12-02 04:17:39', '2022-07-05 12:51:24'),
(16, 2, 'voluptas-voluptatem-enim', 'voluptas voluptatem enim', 'rem corrupti omnis autem minima nihil rerum velit sint sit libero quae quae vel distinctio repellat quibusdam natus dolorum unde et doloribus aut facere unde ducimus sunt atque eaque saepe et est officia nihil id aut ut quidem et quod maxime rerum quas quos voluptas delectus sit necessitatibus tenetur voluptatem explicabo quos ut repellendus dolorum cupiditate qui nihil molestiae ipsum est eligendi modi quia sint at repellat totam et repudiandae omnis accusamus in eveniet et ratione rerum eos est quis', 'ut, laudantium, deleniti, ducimus, sunt, quia, ipsam, a, sunt, porro, quia, molestias, incidunt, sint, praesentium, aut, quae, aspernatur, est, iste', 'kg', 52, 2216, 85, 7928, 2, 6, '11.jpg', '2019-06-24 20:59:21', '2022-07-05 12:51:24'),
(17, 2, 'assumenda-voluptates-quaerat-nemo', 'assumenda voluptates quaerat nemo', 'labore ut eum architecto quae maiores eum excepturi necessitatibus facere aut explicabo minima vel placeat id voluptas ratione vero soluta repellendus maiores voluptatem id et dignissimos temporibus esse optio adipisci sed deserunt consequatur tempora libero ipsum in iusto amet fugiat enim repellendus repudiandae dolor et aliquid sed facere asperiores repudiandae sint natus aut in maxime qui omnis sed fugit voluptates fugit est consequatur vel provident enim quis provident qui et blanditiis deserunt est et et mollitia voluptatibus possimus perspiciatis occaecati', 'magnam, consequatur, qui, soluta, in, ducimus, consectetur, quia, sapiente, quas, quae, tenetur, sed, sed, dolore, in, voluptatem, placeat, facilis, et', 'kg', 86, 710, 10, 7250, 1, 3, '10.jpg', '2018-08-14 12:26:30', '2022-07-05 12:51:24'),
(18, 2, 'aperiam-ut', 'aperiam ut', 'illo quibusdam nesciunt corporis consectetur eos laborum recusandae non ut esse qui possimus sapiente distinctio quas sunt sed dolore quaerat sit dicta deleniti ea optio dolore quo libero dolores praesentium occaecati maxime rerum numquam beatae natus beatae facilis temporibus quis necessitatibus sint est eum rerum quos fugiat debitis neque quis blanditiis debitis dolorem dolor perferendis odio fugit animi assumenda consectetur facilis ea voluptate ducimus voluptas quidem dignissimos dolores non quis nihil iste eligendi voluptatum et inventore facere ut sint repudiandae', 'dolorem, a, distinctio, autem, possimus, illo, est, iste, et, nesciunt, libero, quia, explicabo, aliquid, sed, esse, laboriosam, laborum, vel, necessitatibus', 'kg', 2, 2562, 220, 4123, 1, 10, '5.jpg', '2018-06-28 19:20:33', '2022-07-05 12:51:24'),
(19, 2, 'eveniet-officia', 'eveniet officia', 'repudiandae et repellendus ipsa ipsum non labore modi numquam vitae minima commodi dolores voluptate molestiae eos in quidem porro earum vitae non quo cumque molestiae blanditiis ratione minima cumque deleniti ipsum esse reprehenderit ullam unde in sunt dolorem voluptates rem iste in ut nobis ullam expedita doloribus voluptatem libero sed aliquid voluptatum cupiditate libero vero consequatur deleniti quibusdam reprehenderit aut provident accusantium facilis odio est sint aut dignissimos voluptates dolor culpa quia est sit ut consequatur consequatur maxime repellendus suscipit', 'et, dicta, molestiae, sint, esse, ipsum, reprehenderit, et, fugit, odio, enim, assumenda, adipisci, porro, iure, occaecati, delectus, voluptatem, architecto, voluptatem', 'kg', 83, 1193, 281, 4606, 1, 5, 'copa.png', '2021-03-22 10:41:56', '2022-07-05 12:51:24'),
(20, 2, 'a-sit', 'a sit', 'harum perferendis dolores similique voluptatem nemo quasi pariatur eveniet unde quos quas repellat delectus alias et dolore veritatis culpa assumenda sit dolorem neque iusto error accusantium rerum dolorem maxime quisquam animi iusto ut perspiciatis nemo voluptatem beatae at totam nesciunt dolorem eaque iure placeat numquam quaerat veritatis et reprehenderit voluptates quia autem et recusandae impedit culpa cupiditate accusantium ut in amet quod rem omnis ipsum voluptas ut quidem omnis qui eaque officiis aut suscipit mollitia commodi expedita et occaecati qui', 'deleniti, exercitationem, facere, recusandae, nisi, facere, sint, et, rem, illum, accusamus, et, in, tempora, ut, dolorem, aut, est, beatae, repellat', 'kg', 86, 1799, 236, 2129, 2, 8, 'coconut-milk.png', '2019-10-21 03:50:36', '2022-07-05 12:51:24'),
(21, 3, 'qui-dolorem-nostrum', 'qui dolorem nostrum', 'molestias rerum id consequatur quo earum velit consequatur suscipit illum cumque ab ducimus eligendi iste dolorem dolorem odit molestiae deleniti omnis assumenda et quo illum commodi id ex quo architecto fuga in ut itaque voluptatem iste voluptatibus odit perferendis accusantium vel ut consequatur quibusdam impedit temporibus inventore voluptas maxime pariatur eum accusamus rem voluptas necessitatibus sed aut sunt officia soluta nostrum voluptatem nulla quis accusantium nihil voluptas minima ex mollitia temporibus et omnis error fugit dolorem similique commodi reprehenderit voluptatum', 'aspernatur, consequatur, dolor, qui, voluptate, laborum, perferendis, omnis, numquam, voluptatem, nisi, itaque, ducimus, quam, asperiores, sed, quia, delectus, recusandae, molestiae', 'kg', 20, 1298, 210, 2065, 2, 6, 'product-3.jpg', '2021-10-15 15:47:11', '2022-07-05 12:51:26'),
(22, 3, 'minima-aliquid-deserunt', 'minima aliquid deserunt', 'eos ipsum voluptatem quos asperiores voluptatibus id aut at provident inventore est aperiam dignissimos est magnam ut accusantium dolores odio a provident quia est optio est pariatur enim labore ratione aut et velit mollitia ipsa earum error doloremque harum tempora nisi in beatae repellat consectetur ut explicabo architecto quae quae ut id est illum nam culpa quia explicabo labore fugiat tempore iste blanditiis quod aliquam id sunt consequatur et quas cupiditate omnis asperiores occaecati ad et iste porro sit voluptas', 'labore, ut, eos, nostrum, numquam, iure, tempora, non, est, asperiores, voluptate, amet, ut, eius, quaerat, ex, porro, nisi, saepe, dolores', 'kg', 28, 332, 183, 1263, 1, 6, 'coffee-liberica.png', '2020-05-04 07:37:06', '2022-07-05 12:51:26'),
(23, 3, 'voluptas', 'voluptas', 'est dolore quos adipisci sit reprehenderit id labore modi sit est sit quod aperiam ut consequatur qui necessitatibus error expedita ad et quos consequuntur rerum architecto voluptatum totam tempore beatae corrupti sapiente occaecati delectus quisquam ipsum laudantium iure officiis rerum quis ullam delectus quia esse qui quia unde alias sed non minima doloribus provident repellendus aspernatur ut perspiciatis sed tempora et aut eum quisquam eaque nemo et placeat eligendi reprehenderit natus aspernatur doloremque cupiditate id praesentium labore eaque tempora tenetur', 'et, qui, accusamus, eum, est, ullam, sint, nesciunt, omnis, occaecati, voluptates, suscipit, rerum, quam, quae, ab, rerum, ipsam, temporibus, enim', 'kg', 100, 1982, 165, 1508, 2, 6, '7.jpg', '2019-05-08 00:24:20', '2022-07-05 12:51:26'),
(24, 3, 'iste-in-est', 'iste in est', 'qui nobis sunt suscipit quo repellat quia numquam facilis dolor molestias distinctio earum vitae quidem repudiandae quidem rerum soluta id nam architecto maiores est sapiente et eum qui eum rerum laborum cumque autem aliquid asperiores tempore et esse modi ullam est inventore id eum ipsum ullam est consequatur atque sint error vel voluptas quos earum reprehenderit vitae vitae consequuntur voluptatem saepe dolorem laborum sint voluptatem soluta impedit optio nostrum quae sit animi corrupti vero perferendis suscipit porro optio et sed', 'quibusdam, officiis, consequatur, porro, eligendi, enim, tempore, excepturi, debitis, nihil, omnis, eos, voluptas, odit, aut, aut, consequuntur, accusamus, pariatur, et', 'kg', 99, 278, 233, 47, 2, 6, 'sweet-potato.png', '2021-11-16 06:52:26', '2022-07-05 12:51:26'),
(25, 3, 'unde', 'unde', 'et ex optio beatae officia veritatis eligendi mollitia delectus harum occaecati quos necessitatibus harum minima molestiae accusantium inventore voluptatem architecto nisi voluptas rerum illo quis fuga placeat autem quaerat iure amet dicta incidunt nesciunt cum consectetur quod voluptas occaecati qui recusandae odit reiciendis molestias quidem doloribus dolorum aliquid exercitationem quos possimus quia sit ipsam ratione aliquid nihil sequi tenetur velit in consequuntur corporis aut necessitatibus dolores qui repellat autem et ad qui et numquam voluptates veritatis facere corrupti hic harum', 'tenetur, consequatur, amet, amet, nam, consequatur, molestias, sequi, necessitatibus, qui, eligendi, mollitia, sint, laudantium, quis, vel, laborum, adipisci, voluptatibus, quis', 'kg', 100, 410, 102, 7724, 2, 9, 'ground-coffee.png', '2020-06-18 10:39:35', '2022-07-05 12:51:26'),
(26, 3, 'ipsum', 'ipsum', 'et nam dolores dignissimos soluta et culpa ipsum iusto explicabo blanditiis laboriosam est doloremque maxime pariatur aliquam ullam dicta provident ipsum vitae eius repellendus non fugit velit temporibus atque non consequatur saepe repellendus voluptatibus aliquam eaque maxime excepturi corrupti autem distinctio reprehenderit voluptas aperiam omnis tempore facilis non et reprehenderit quis perferendis nulla accusantium tempora eaque saepe a dolor illum voluptatibus molestiae et est consequatur et quidem non aut aspernatur aperiam qui aut et quibusdam libero fuga incidunt ducimus et', 'maxime, eaque, dolores, est, reiciendis, dolor, aut, repellat, a, soluta, quia, atque, qui, ipsum, iure, eius, architecto, temporibus, rerum, ducimus', 'kg', 27, 1716, 296, 5561, 1, 8, 'product-5.jpg', '2017-11-24 18:41:12', '2022-07-05 12:51:26'),
(27, 3, 'dolor-laboriosam-iste', 'dolor laboriosam iste', 'aut in ut possimus molestias aut expedita assumenda velit aut consequatur deleniti illo sapiente rem voluptatem dignissimos autem delectus sed est cum est commodi omnis ut est eveniet itaque id ut et explicabo ullam ut sed sed velit ex rerum fuga saepe inventore cum impedit temporibus iste reprehenderit fugiat ea ad deserunt quaerat atque voluptate ad quisquam enim sint quia rerum vero dolorem quia sed quam aliquam qui quibusdam nihil ipsa voluptas dolores quasi praesentium enim molestiae officiis repellendus tempora', 'animi, iusto, voluptas, qui, sit, nobis, enim, quaerat, assumenda, repudiandae, sint, perferendis, est, nisi, corrupti, dolorem, id, in, et, sunt', 'kg', 35, 2983, 12, 2981, 2, 9, '5.jpg', '2017-09-27 02:22:37', '2022-07-05 12:51:26'),
(28, 3, 'aut-alias-corporis-et', 'aut alias corporis et', 'numquam porro necessitatibus qui officiis reprehenderit placeat at facilis quasi nobis assumenda omnis atque enim quos et ut voluptas est pariatur optio odit officia amet tempora ipsa eos numquam occaecati excepturi labore et nostrum asperiores quia eveniet occaecati voluptas est aut quia molestiae officia maiores nobis voluptate est quasi tenetur qui hic est est et ratione neque molestiae qui est voluptatem sunt enim laboriosam et commodi eum molestias accusantium suscipit rem magnam temporibus quas et id et dignissimos rerum ducimus', 'et, incidunt, eos, aut, ducimus, quia, quo, ut, voluptatem, autem, beatae, iste, natus, ut, dolorum, nostrum, et, doloremque, et, et', 'kg', 96, 1431, 162, 7141, 2, 4, 'bagasse.png', '2019-04-07 18:32:31', '2022-07-05 12:51:26'),
(29, 3, 'ipsa', 'ipsa', 'mollitia voluptatibus quis sit ad deleniti ut iste repellat nobis et quidem et commodi id commodi quam esse enim quia provident ipsum eos accusantium eos modi aut molestiae autem atque voluptatum omnis ducimus a iste molestias maxime aut quam omnis reprehenderit sed ut nam laudantium dolores mollitia distinctio enim odit illo et vero nesciunt dolor soluta assumenda sed reprehenderit corrupti laudantium est optio deserunt animi tempore veritatis sint ex dolor accusamus nisi sunt quo vel nam animi voluptatum eos odit', 'aut, aut, sit, qui, quia, veniam, sed, qui, sunt, deleniti, eum, quaerat, in, numquam, et, ducimus, rerum, culpa, ut, ducimus', 'kg', 67, 436, 35, 2908, 1, 6, 'ground-coffee.png', '2020-08-29 09:31:49', '2022-07-05 12:51:26'),
(30, 3, 'omnis', 'omnis', 'incidunt qui quis quam repellendus commodi est tenetur tempore necessitatibus dolorem quis beatae sint iure et accusantium sit recusandae maxime dolores quisquam eum voluptates qui delectus quisquam necessitatibus minus perferendis officia nam iure magnam in ducimus accusantium libero quo quia et sapiente eos exercitationem et sint reprehenderit fugit distinctio quia temporibus quisquam reiciendis quos nulla accusantium numquam placeat dolorem laudantium repellat magni et illum qui harum earum sit ea maxime error debitis possimus ut magnam veritatis ut vel veniam omnis', 'rem, ea, cumque, natus, ab, officia, est, rerum, error, porro, quia, non, voluptatem, blanditiis, porro, quas, rerum, ipsa, et, beatae', 'kg', 36, 2713, 31, 600, 1, 10, 'banana.jpg', '2020-02-26 16:13:09', '2022-07-05 12:51:26'),
(31, 4, 'reprehenderit-illo-aut-provident', 'reprehenderit illo aut provident', 'ut similique eligendi voluptas dolorem enim aperiam similique mollitia minima explicabo aut sunt repudiandae non vero est et aut error aut sit recusandae qui aliquam omnis velit modi minus rerum ad nobis quas velit voluptate quas et veniam eum ut libero ducimus voluptatum et vitae sint dolores quas praesentium harum non eos sunt qui laborum aspernatur veritatis necessitatibus voluptas nihil quasi quo voluptatem ut eos et quo fugit libero ipsum voluptas molestiae sed temporibus aliquam voluptas optio qui expedita fugiat', 'sapiente, qui, nobis, provident, voluptas, aut, nobis, et, in, voluptas, libero, facere, delectus, eos, unde, beatae, modi, exercitationem, aut, beatae', 'kg', 75, 117, 36, 655, 1, 9, 'pineapple-juice.png', '2017-10-17 19:52:02', '2022-07-05 12:51:26'),
(32, 4, 'voluptatem-consequatur', 'voluptatem consequatur', 'omnis aut sed omnis id voluptas sunt voluptatem est et minus provident qui ea nulla enim rem aut repellendus nesciunt autem provident odit consequatur fuga sit molestias impedit et dicta vel ea dicta minima nobis quia laborum ex esse architecto sed sit laboriosam distinctio nihil a magnam eveniet quia nostrum tempora omnis in quia sunt aut nisi ullam et aut dolores occaecati aut error ea ex sunt optio iure voluptatem ea culpa totam placeat quae enim voluptates quo eum adipisci', 'omnis, unde, laudantium, repellendus, consequatur, quidem, ut, nobis, eos, eum, aspernatur, perferendis, vero, eos, non, ab, voluptates, quaerat, tenetur, beatae', 'kg', 46, 2985, 99, 5041, 1, 9, 'product-6.jpg', '2020-02-25 22:54:16', '2022-07-05 12:51:27'),
(33, 4, 'est', 'est', 'ut nulla quis est porro voluptas cumque in necessitatibus qui necessitatibus laudantium ad et soluta vel officiis reprehenderit amet voluptates maxime vel iusto assumenda velit dolorem repellendus ut explicabo blanditiis est nulla est et reprehenderit libero porro laborum labore occaecati excepturi repellendus voluptas illum explicabo maiores ex quia laudantium optio est omnis voluptates libero velit laborum necessitatibus rerum dolores laboriosam ullam quis eius unde ut dolor distinctio fugiat ipsa suscipit qui ut fuga pariatur animi quo in cum odit sint', 'fugiat, qui, praesentium, ut, pariatur, cupiditate, ad, nulla, velit, iusto, provident, temporibus, commodi, autem, velit, consequuntur, tenetur, quo, minima, totam', 'kg', 35, 113, 113, 811, 1, 4, 'onion.png', '2020-01-21 13:34:29', '2022-07-05 12:51:27'),
(34, 4, 'tenetur-laudantium-assumenda-et', 'tenetur laudantium assumenda et', 'nesciunt placeat dolorem iure facilis quaerat fugiat illo consequatur voluptatibus numquam nisi aut in sunt voluptatem occaecati saepe sint et qui quia fugiat officiis excepturi vel eos possimus velit quod sapiente consequatur error sequi dicta voluptas nobis ut et quibusdam aut molestiae deserunt ad placeat est unde pariatur iste numquam saepe fuga sapiente magni voluptas maiores labore id repudiandae deserunt optio quia pariatur voluptatem et quia enim aut deserunt autem dolorum earum iusto suscipit beatae consequuntur consectetur necessitatibus atque aut', 'architecto, hic, esse, ab, sit, quia, earum, explicabo, dignissimos, esse, quos, sed, veritatis, reprehenderit, assumenda, recusandae, deleniti, officia, exercitationem, placeat', 'kg', 70, 1159, 64, 3420, 2, 6, '5.jpg', '2018-12-20 07:44:29', '2022-07-05 12:51:27'),
(35, 4, 'quod-aut-quidem', 'quod aut quidem', 'numquam harum illum at voluptatem quod sed maxime iste tenetur a et ipsum qui nostrum quo corporis natus ut architecto praesentium modi dolorem alias sit eum aut alias praesentium sed qui sequi saepe quia culpa autem eveniet dolore animi eaque accusamus eum dolor eveniet soluta sunt in maiores deserunt cum doloribus unde maxime saepe tempora ut sint iure eius ullam qui quis expedita qui aut temporibus voluptatem voluptatem aperiam rerum ipsam sequi iste doloribus vel et quisquam sed aut consequatur', 'a, ea, non, sit, asperiores, voluptatem, beatae, placeat, et, reprehenderit, eos, quibusdam, non, voluptatem, non, aperiam, aperiam, architecto, dolorem, blanditiis', 'kg', 39, 977, 301, 5754, 2, 3, 'potato-2.png', '2021-05-10 08:09:37', '2022-07-05 12:51:27'),
(36, 4, 'totam-nihil', 'totam nihil', 'quis sint id autem pariatur et quisquam ex ea fugiat placeat vitae nihil et deleniti qui rerum officiis est explicabo dicta magni dolor harum nostrum fuga corporis rerum provident perferendis dolor asperiores hic eveniet quam magnam eaque ut totam consequatur ipsa aliquam aut praesentium amet aspernatur iste modi laudantium facilis officia reiciendis voluptatibus excepturi molestiae error velit quia rerum animi officia eveniet repellat ullam enim deserunt autem modi sed et est voluptatem culpa et voluptas eum consequuntur ut accusamus non', 'qui, qui, rerum, quo, corporis, voluptas, dolore, necessitatibus, ducimus, delectus, aliquid, alias, exercitationem, velit, esse, eius, vero, magni, mollitia, consequatur', 'kg', 1, 524, 245, 1959, 1, 10, 'pineapple.png', '2019-11-02 01:22:11', '2022-07-05 12:51:27'),
(37, 4, 'nihil-et-vel-sit', 'nihil et vel sit', 'earum tempore necessitatibus rem quaerat quasi aperiam enim voluptatibus consequatur ut alias modi sapiente in cum dignissimos assumenda sit et non pariatur quis culpa ea repudiandae qui soluta nostrum qui esse rem dolorum eum voluptatem minima omnis exercitationem dolor maiores itaque magnam nemo assumenda labore quidem ipsum et sit earum beatae eaque tempore totam voluptatibus eveniet autem repudiandae itaque voluptatum ut corrupti dolorem laboriosam est distinctio ab eos sapiente qui qui a non officia et quasi corrupti nostrum praesentium soluta', 'autem, eos, minus, sit, magni, et, delectus, architecto, recusandae, aut, magnam, et, et, et, itaque, ut, numquam, quo, et, corrupti', 'kg', 46, 2939, 206, 155, 2, 4, 'ground-coffee.png', '2020-11-15 09:26:08', '2022-07-05 12:51:27'),
(38, 4, 'fugit-ut-illo-nihil', 'fugit ut illo nihil', 'ut minima aut vero fugiat nobis omnis laudantium molestiae officiis voluptatibus veniam eos soluta in doloribus est culpa aut et rerum repellat reiciendis rem natus rerum nemo distinctio eveniet commodi quo atque voluptatem iure itaque nihil sit nam accusantium quas praesentium in saepe minus harum sit suscipit culpa repudiandae quos alias et cumque error molestiae ex placeat nostrum eum perferendis non facilis aut doloribus quia illo nihil inventore quia accusantium et aut qui praesentium dolorem cum odit libero incidunt occaecati', 'debitis, dolores, dolor, dolores, beatae, beatae, maiores, et, quibusdam, illo, dolores, nihil, perspiciatis, commodi, qui, ipsam, et, autem, qui, rem', 'kg', 1, 2534, 116, 1029, 2, 7, '8.jpg', '2020-04-02 17:03:03', '2022-07-05 12:51:27'),
(39, 4, 'eveniet-dolor-voluptates-fugit', 'eveniet dolor voluptates fugit', 'sit inventore ut provident cumque pariatur voluptas consequatur sed tempore repudiandae modi vero labore ut voluptatem fugiat in architecto rem ratione sint facere vel quas sit iusto exercitationem hic est accusantium repudiandae et dolorum quisquam molestiae ullam modi neque modi aut dolor omnis soluta et omnis consequatur molestiae voluptates quis in illo dolores illum quo sed quae nam qui ad quo sapiente cupiditate harum accusantium corrupti animi est pariatur et recusandae deserunt ut voluptatum aut in vel ad autem mollitia', 'voluptas, officiis, voluptas, magnam, ea, et, id, sit, ut, earum, perferendis, in, asperiores, iste, quaerat, nemo, impedit, laudantium, non, voluptatum', 'kg', 0, 1542, 248, 639, 2, 8, '12-1.jpg', '2021-01-06 21:47:34', '2022-07-05 12:51:27'),
(40, 4, 'voluptas-consectetur-et', 'voluptas consectetur et', 'in architecto mollitia vitae nostrum et consequatur id maiores unde et dolor non voluptas facilis dolor consequuntur nesciunt qui qui neque itaque aliquid rerum enim libero aliquam corporis doloremque quia delectus quas quidem ut placeat voluptatem quod facilis cupiditate veniam odio enim laborum est vel provident ad blanditiis voluptas recusandae iure voluptatibus vel sit ea neque earum nihil qui aut eaque sint perferendis laudantium eveniet quas esse sint explicabo ut quibusdam excepturi et et tempora omnis inventore autem rem nostrum', 'reiciendis, ut, et, praesentium, quas, et, ullam, voluptatem, autem, voluptatibus, magni, qui, omnis, in, unde, vero, consequatur, adipisci, harum, voluptatem', 'kg', 90, 2505, 244, 4188, 1, 3, 'cassava-flour.png', '2018-05-24 16:29:51', '2022-07-05 12:51:27'),
(41, 5, 'libero', 'libero', 'sunt iste consequatur aut ipsa quod tenetur harum perferendis consequatur nostrum est nulla beatae quibusdam consequatur assumenda rerum sapiente sed voluptatem eaque fugit est nesciunt non velit aut veniam nesciunt autem nulla fugit quia eius rerum assumenda dolor quisquam consequatur et vel minus maxime blanditiis velit ea perspiciatis dolore qui cupiditate facilis ab dolor ea est sint nostrum sit fugit veniam nulla occaecati id facilis sit minima laudantium facere amet in perspiciatis labore temporibus quis recusandae rem consectetur iste atque', 'at, qui, autem, repellendus, quibusdam, quis, minima, tempora, eius, voluptas, nihil, modi, sequi, saepe, nisi, deserunt, ut, nesciunt, error, occaecati', 'kg', 69, 2592, 97, 2278, 1, 10, 'cassava.png', '2017-11-28 16:34:16', '2022-07-05 12:51:27'),
(42, 5, 'a-reiciendis-omnis-veniam', 'a reiciendis omnis veniam', 'quia maxime molestiae vel optio rerum et eos aliquam dolorum eum ad ut rerum et commodi qui est veritatis maxime reprehenderit quas corrupti voluptas sunt et enim dolores hic in aut sunt doloremque voluptas a eum incidunt doloremque eveniet magnam ut molestiae laboriosam sit fugiat veniam quia est libero excepturi molestias perferendis architecto est placeat et vel saepe et non dolorem harum harum incidunt suscipit quam voluptatem et qui voluptates totam et tenetur ut ut repellendus totam enim et cum', 'repellat, voluptatum, autem, praesentium, aut, quisquam, molestias, est, autem, vero, commodi, ut, officia, rerum, aperiam, natus, nostrum, aspernatur, nostrum, atque', 'kg', 21, 2436, 308, 4556, 2, 10, 'potato-2.png', '2020-10-14 11:09:29', '2022-07-05 12:51:27'),
(43, 5, 'laborum-voluptate', 'laborum voluptate', 'rerum fugit voluptas minima et ducimus qui tenetur labore atque corrupti et omnis ex vel mollitia error omnis nobis debitis qui ut voluptas ducimus officiis odio magni in quam mollitia qui delectus ab repellendus et deleniti fugiat dolorum dolorum facilis dolorem mollitia unde labore nemo fugiat enim facilis veritatis recusandae rerum asperiores non saepe quaerat maiores minus doloribus magni aliquam neque molestiae doloribus perspiciatis ut possimus doloribus autem ad quis incidunt cupiditate et assumenda id praesentium deserunt debitis exercitationem sint', 'eaque, quis, minus, nihil, reprehenderit, nihil, repellendus, sint, explicabo, alias, itaque, aperiam, voluptatibus, molestias, enim, a, adipisci, ut, ut, nisi', 'kg', 6, 2962, 272, 131, 2, 6, 'indian-mango.png', '2018-03-12 03:59:59', '2022-07-05 12:51:27'),
(44, 5, 'eos-dolor-occaecati', 'eos dolor occaecati', 'ex nesciunt odit eos inventore qui et reprehenderit eveniet doloribus tempore laudantium eveniet officiis aut omnis non ex ut id ut mollitia dolores dolorem sint quia dicta veniam esse dolores vitae quam nesciunt porro reiciendis ut reiciendis explicabo sunt omnis mollitia voluptatem porro voluptas facere ut aut rerum sunt laborum ut inventore praesentium aliquid reiciendis nam sit quas esse velit molestias dolorem molestiae tenetur ut sed et et facere rerum nihil qui beatae quidem adipisci sapiente accusamus sed voluptates hic', 'quidem, assumenda, consequatur, debitis, sed, ipsum, facilis, et, quo, nemo, aut, illo, illo, in, at, vel, sed, fuga, et, maxime', 'kg', 83, 1813, 6, 417, 2, 8, 'coffee-liberica.png', '2020-11-13 12:48:18', '2022-07-05 12:51:27'),
(45, 5, 'rerum-dolor', 'rerum dolor', 'voluptas et totam harum sequi nisi earum iste et cum esse beatae facere ratione ut et et fuga quia nulla qui quod rerum excepturi aperiam sed ipsam nesciunt reprehenderit porro cumque facere id ut quis et fugit veniam ea harum rerum est maiores voluptas sit eveniet corporis odit illo iusto iure excepturi iure consequatur rem ad nulla eos iure deleniti corporis ducimus repudiandae et ad aut impedit quia distinctio consequuntur enim molestiae voluptatem repellat magni unde possimus placeat sed nemo', 'ut, consequatur, saepe, nostrum, ducimus, dolore, facilis, adipisci, provident, culpa, sequi, ratione, repudiandae, neque, et, ut, voluptate, assumenda, est, sunt', 'kg', 79, 1668, 280, 3602, 2, 8, 'cavendish.png', '2021-02-16 10:36:23', '2022-07-05 12:51:27'),
(46, 5, 'quis-at-est', 'quis at est', 'perferendis doloremque ipsam sunt neque pariatur praesentium cupiditate laborum cumque ipsam natus expedita ratione aspernatur ad sunt et nostrum beatae nulla veritatis atque vel laudantium debitis soluta labore quas voluptatibus incidunt accusamus et maxime omnis maiores reiciendis quo illum ipsa reiciendis quod tempore deleniti modi quasi et voluptatem repudiandae porro modi sed veritatis et voluptate nemo corrupti explicabo libero quas consequatur asperiores similique sint fuga corrupti minus nam officia debitis mollitia qui deserunt accusamus incidunt nostrum quo corrupti temporibus ut', 'aut, dolorem, recusandae, amet, possimus, et, sit, dolor, alias, dolor, vel, nihil, alias, qui, perferendis, rerum, aut, nihil, accusantium, asperiores', 'kg', 6, 2560, 198, 1358, 2, 5, 'product-4.jpg', '2021-08-20 19:46:29', '2022-07-05 12:51:27'),
(47, 5, 'consequatur-vel-voluptates-delectus', 'consequatur vel voluptates delectus', 'adipisci eos quia modi illum officia quis numquam quasi quia fugit dicta hic similique hic ratione error inventore quam occaecati recusandae magni libero consequatur aut vel enim quia veritatis sint et voluptatem veritatis veritatis sapiente ipsum sapiente nemo et nihil corrupti consequatur perferendis assumenda voluptatem ipsum voluptatem autem sapiente animi fugiat quo id ex commodi asperiores nihil similique mollitia repudiandae iste quis eos suscipit error ut qui repudiandae ad quis et porro nihil illum incidunt ipsum dolor earum consequatur sapiente', 'dolores, exercitationem, facere, rerum, ut, consectetur, aut, aut, exercitationem, est, quisquam, velit, dolores, dolor, repellat, provident, voluptatum, amet, repellat, ex', 'kg', 16, 700, 254, 5539, 2, 8, 'tomato-catsup.png', '2022-03-06 16:58:38', '2022-07-05 12:51:27'),
(48, 5, 'reprehenderit-atque-cupiditate-enim', 'reprehenderit atque cupiditate enim', 'aut veniam porro magnam est provident non vero debitis ipsam dolores et omnis sed modi et aut blanditiis et corporis eaque laborum illo enim expedita delectus dolor nostrum amet sunt hic id aut dolorum in corrupti pariatur quae error voluptatem rem vitae id facere voluptatem labore itaque maiores veniam quidem eum et rerum velit non consequatur ut consequatur tenetur repellat tenetur voluptates deleniti nesciunt ut qui omnis et quaerat tempora nobis eum quae quas earum neque nobis eveniet labore provident', 'cupiditate, nisi, dolore, inventore, sed, harum, tempora, eum, repellat, eveniet, suscipit, iste, porro, explicabo, non, illo, impedit, vero, libero, vel', 'kg', 33, 1530, 300, 3217, 2, 4, '7.jpg', '2018-12-09 09:04:12', '2022-07-05 12:51:27'),
(49, 5, 'qui', 'qui', 'aliquam blanditiis molestiae quo deserunt dicta ratione quasi voluptatibus iste voluptas eos quam cum quia quis voluptas eum nihil ducimus eum sit autem harum omnis repellat ipsam sit minus aut velit repudiandae rerum autem quia maiores quaerat provident libero modi ad consectetur saepe et et aliquam et exercitationem qui rem nihil dolor quas aperiam ratione omnis laboriosam harum laboriosam veritatis maxime vel ea veritatis libero tempore enim suscipit excepturi explicabo perspiciatis qui voluptatem voluptate illo provident repellat quis dolores et', 'consequatur, repudiandae, illo, enim, aliquam, voluptatum, voluptatem, repellat, pariatur, placeat, similique, doloribus, odio, repellendus, nihil, enim, vel, aliquid, similique, laborum', 'kg', 96, 1151, 109, 2519, 2, 6, 'onion.png', '2018-04-06 06:57:50', '2022-07-05 12:51:27'),
(50, 5, 'nisi', 'nisi', 'autem ullam et nostrum enim totam natus fugit consequatur autem eos occaecati neque vel porro soluta vel qui rerum rerum amet eligendi est vel a repellat necessitatibus ut quo dolor ipsam libero earum quia fuga recusandae adipisci necessitatibus voluptatum qui veniam blanditiis consequatur voluptate adipisci at harum consectetur quia consequatur fugiat aut repellat molestiae suscipit eaque labore nihil tenetur natus ab quae facere voluptate aliquid distinctio ut odio et a dolorum nulla non fuga dolorum asperiores quo aut omnis nihil', 'nihil, sit, provident, quod, rerum, totam, amet, quasi, quas, quas, illo, sequi, ut, ducimus, est, molestiae, placeat, fugit, tempora, veniam', 'kg', 87, 1698, 63, 2844, 1, 3, '5.jpg', '2018-07-13 16:40:40', '2022-07-05 12:51:27'),
(51, 6, 'consectetur-ut', 'consectetur ut', 'dolores et aliquam eligendi corporis reprehenderit velit sit rerum architecto aliquam sit omnis sapiente in perspiciatis quibusdam qui illo esse mollitia itaque corrupti voluptatem veritatis itaque velit quas magnam sed aut vero et et magnam vitae numquam omnis illum inventore ea dolores perspiciatis facere nesciunt cum vitae qui doloremque exercitationem voluptatibus officia exercitationem dolorem qui voluptatem atque voluptas beatae vitae hic quia atque ex sed rerum dicta quia reprehenderit ut doloremque qui corporis qui eligendi debitis eum labore deleniti sed', 'id, et, sunt, perferendis, ut, omnis, qui, quia, sequi, facere, at, ut, earum, in, eligendi, magni, quasi, occaecati, a, commodi', 'kg', 32, 1643, 191, 197, 2, 6, 'coffee-arabica.png', '2019-01-17 07:07:06', '2022-07-05 12:51:30'),
(52, 6, 'sed-molestiae-vitae', 'sed molestiae vitae', 'consequatur et corporis eius dolor accusantium dolorem id autem est eum nostrum rerum voluptate autem commodi quia odit velit itaque omnis quam cupiditate sunt beatae necessitatibus sit sunt ad perspiciatis cumque quia quia perferendis ipsam alias exercitationem occaecati quod temporibus vel ad vel ut vero eos est quis eaque ex mollitia ea cum neque et dignissimos excepturi quo voluptatem quasi sapiente sapiente quas voluptates facere a est iure aperiam possimus ad omnis consequatur deleniti perspiciatis nemo eum ut voluptates in', 'dicta, officia, deleniti, qui, beatae, et, voluptatem, debitis, hic, qui, iste, ut, magnam, totam, fugiat, natus, recusandae, quo, deserunt, ad', 'kg', 65, 817, 291, 7114, 1, 6, 'white-corn.png', '2017-10-30 17:44:51', '2022-07-05 12:51:30'),
(53, 6, 'repellat-et-ipsa', 'repellat et ipsa', 'non officia quo vel possimus dolores alias qui quasi deserunt nulla sit laborum commodi odio vel et non consequatur fugit excepturi et tenetur sit tempore possimus deleniti ut tenetur et pariatur at distinctio sed sed nam in quo numquam ullam libero corporis maiores eaque qui et et autem doloribus et animi suscipit est et aut consequatur autem laudantium quo voluptatem ut dolor hic rerum quia ut itaque nostrum mollitia fugit velit facilis expedita ipsa vitae nostrum aspernatur ut aut laborum', 'aut, modi, nostrum, harum, est, et, temporibus, architecto, et, dicta, itaque, ea, debitis, minima, id, vel, tenetur, distinctio, nihil, fuga', 'kg', 96, 728, 6, 3005, 2, 8, 'coffee-arabica.png', '2022-01-15 15:34:16', '2022-07-05 12:51:30'),
(54, 6, 'eum-praesentium-vel-voluptatem', 'eum praesentium vel voluptatem', 'magni et nemo soluta nihil ea voluptas molestiae animi qui aperiam nam perspiciatis consequatur rem sit atque harum est tempore eos esse ut est sit aut optio ipsa in deserunt ut minima numquam soluta facere in ut eaque occaecati tenetur soluta voluptatem voluptates ducimus est sequi dolores provident dignissimos commodi aut quaerat et sed occaecati amet perspiciatis molestiae sapiente vel quaerat debitis est distinctio illo id vero cum commodi qui sit voluptate velit ut rerum odio optio eaque itaque autem', 'occaecati, ut, quisquam, recusandae, alias, dolore, et, asperiores, voluptas, enim, nobis, sequi, officia, architecto, omnis, nihil, asperiores, ad, architecto, numquam', 'kg', 62, 1743, 312, 4553, 2, 10, '3.jpg', '2018-02-20 06:57:01', '2022-07-05 12:51:30'),
(55, 6, 'id-aspernatur', 'id aspernatur', 'ex iste reprehenderit sit porro assumenda porro quod rem suscipit aperiam maiores eligendi nam animi ullam occaecati sunt quo ad est rerum voluptas quibusdam voluptas ratione blanditiis magnam consequatur atque aut quas praesentium doloribus est adipisci qui voluptas labore esse molestiae cupiditate omnis hic ea aliquam est fugiat et veritatis ea ut ut quaerat nisi et quam cumque quibusdam repudiandae sapiente deleniti voluptate qui quis sed quam dolores dolorum similique qui deleniti nihil id amet nam suscipit autem et perspiciatis', 'sint, praesentium, suscipit, voluptatem, corporis, quidem, esse, illo, rerum, repellat, quis, dicta, ut, ut, facilis, dolorem, doloribus, velit, impedit, ea', 'kg', 56, 1134, 295, 4933, 1, 3, 'product-7.jpg', '2021-11-15 09:48:58', '2022-07-05 12:51:30'),
(56, 6, 'nulla-aut-voluptas', 'nulla aut voluptas', 'animi quia error aliquam et est voluptatem suscipit saepe sunt commodi deleniti laboriosam a vel perferendis laudantium sed perferendis quidem quod consectetur tempore et rem deserunt ipsam assumenda consequuntur ut voluptas sunt et nisi et mollitia nostrum facilis sint at rerum ullam distinctio qui et ipsa repellat vitae sint et rerum aperiam id optio et molestias sapiente explicabo consequatur laboriosam accusamus incidunt labore fuga placeat qui qui quidem aliquid velit ipsam fugit quia quia ut officia id enim voluptas quo', 'qui, odio, iusto, omnis, eligendi, pariatur, quod, nam, quo, est, culpa, distinctio, quae, quo, eos, voluptatem, et, cumque, velit, libero', 'kg', 41, 2844, 279, 4879, 2, 5, 'product-6.jpg', '2018-10-21 02:29:55', '2022-07-05 12:51:30'),
(57, 6, 'omnis-necessitatibus-perspiciatis', 'omnis necessitatibus perspiciatis', 'sit eos illum sequi molestias in ea saepe sit voluptatem qui itaque aut ad aut aliquam ullam qui quis perferendis distinctio amet sunt dignissimos repellat nostrum delectus nulla tempore recusandae minima iure architecto quis qui et facere enim quaerat ab aut quod incidunt perspiciatis facilis vel itaque asperiores occaecati voluptatum mollitia odit ut unde officia quam aut minus optio eos nemo odio quia iusto et culpa cumque itaque non illo consequuntur quo dolores id iusto animi fugiat quod molestias sequi', 'illum, exercitationem, est, velit, quia, consequatur, quis, sed, voluptatem, et, necessitatibus, autem, magni, aliquid, dolor, et, doloribus, maxime, est, sint', 'kg', 79, 2691, 301, 3890, 2, 9, '10.jpg', '2017-09-09 07:22:32', '2022-07-05 12:51:30'),
(58, 6, 'eius', 'eius', 'voluptas hic nemo doloribus quae repudiandae vero ipsam est nihil iusto velit eum odio inventore aut suscipit velit eos rerum dolores deleniti numquam magni libero vel aut corporis voluptatem alias ut tenetur similique molestiae non non dolorum doloremque magnam occaecati rem corrupti et et rerum sunt explicabo voluptate voluptatibus sit et id molestiae error sit illo quaerat omnis qui perferendis sint incidunt modi laudantium consequatur omnis nihil corporis nihil praesentium aut est aut inventore voluptatem dolor est rerum rerum suscipit', 'dicta, et, consequuntur, sapiente, autem, ex, perferendis, et, ea, laudantium, recusandae, hic, qui, optio, tempore, quas, officiis, sunt, omnis, cumque', 'kg', 20, 1530, 311, 706, 2, 10, '5.jpg', '2017-10-31 05:42:57', '2022-07-05 12:51:30');
INSERT INTO `products` (`id`, `user_id`, `string_id`, `name`, `description`, `tags`, `unit`, `rating`, `orders`, `stock`, `price`, `delivery_min`, `delivery_max`, `thumbnail`, `created_at`, `updated_at`) VALUES
(59, 6, 'dicta-omnis-et-omnis', 'dicta omnis et omnis', 'et quis reprehenderit rem esse est vel eum est mollitia quo est magnam rerum explicabo blanditiis exercitationem nisi labore aut fuga ut totam nesciunt consectetur sed dolor consequatur id quasi consectetur veritatis nostrum sint et ut reiciendis maiores fugiat facilis et officia iste tempora harum itaque quia ratione ut voluptas est id natus nulla optio enim sit est repudiandae laboriosam est sed repellat ratione sunt vel et aut deserunt et quam quis sed sed sint sunt incidunt ullam in modi', 'rerum, rerum, neque, recusandae, libero, qui, eum, nam, ad, omnis, illo, fugiat, et, veritatis, ullam, aperiam, occaecati, commodi, id, dignissimos', 'kg', 51, 2950, 197, 7510, 2, 6, '2.jpg', '2022-01-24 01:01:03', '2022-07-05 12:51:30'),
(60, 6, 'quos', 'quos', 'aut asperiores cum rerum quia aut vel hic recusandae dolores optio ut voluptatibus libero nostrum quia est id ratione quia est ea praesentium laudantium corporis praesentium a dolorum odio harum sint odio aliquam voluptates accusantium nesciunt natus voluptate molestiae quos iure rerum quod tenetur dolores dolores non commodi molestiae alias et ad reiciendis molestias doloribus et rem temporibus modi ad et neque neque molestiae qui similique atque libero sequi corrupti nulla nulla ipsum aliquid est sint officia eligendi sit laboriosam', 'ut, et, corrupti, maxime, amet, accusamus, deleniti, ut, consequatur, omnis, nostrum, quae, quibusdam, officia, totam, rem, amet, accusantium, corrupti, fuga', 'kg', 89, 2528, 115, 5277, 2, 3, 'ground-coffee.png', '2022-06-17 05:30:58', '2022-07-05 12:51:30'),
(61, 7, 'facere-voluptatem-aliquam', 'facere voluptatem aliquam', 'quidem fuga est sit dolore consequatur non eum at nemo aut tempore corrupti cumque et ullam amet dolores repudiandae eum numquam deserunt quasi et iusto harum sed ut esse voluptatum aut voluptas aut voluptate necessitatibus inventore tempora maiores molestiae repellendus ut dolore atque optio delectus pariatur ut vitae magnam quam sint autem quia non qui ut quam nihil facere id minus nulla est et consequuntur dolores ipsum est perspiciatis maiores aut reprehenderit magni dolorem necessitatibus rem quaerat animi necessitatibus non', 'quos, voluptas, itaque, autem, maxime, adipisci, cumque, animi, odio, et, ea, rerum, est, quia, est, earum, voluptatem, placeat, asperiores, saepe', 'kg', 8, 1033, 147, 3629, 1, 6, 'rice-husk.png', '2019-01-22 10:39:37', '2022-07-05 12:51:31'),
(62, 7, 'consequatur-in-corrupti-facilis', 'consequatur in corrupti facilis', 'officiis omnis et et et quisquam illo temporibus eaque consequatur eligendi nostrum tempora fuga quasi consectetur quo dolorem molestiae est eos suscipit ab qui earum quia et quia ducimus enim qui et laboriosam voluptatem omnis quidem pariatur repellendus cupiditate et consectetur sunt modi dolore corrupti natus quis sit voluptate ut sit ut mollitia id quae impedit repudiandae accusamus est voluptatem tenetur vero voluptatem a necessitatibus quia quos tempora error sint inventore placeat quam error enim est voluptas consequatur libero et', 'fuga, qui, sint, quidem, doloribus, veniam, libero, et, praesentium, recusandae, sed, eum, fugit, quia, ipsa, deleniti, voluptas, quisquam, maxime, alias', 'kg', 60, 1921, 43, 7902, 1, 8, 'product-6.jpg', '2017-10-05 05:27:20', '2022-07-05 12:51:31'),
(63, 7, 'ullam-quia-ut-magni', 'ullam quia ut magni', 'recusandae praesentium minus reprehenderit porro quia impedit dolor aperiam quo amet ut rerum qui nemo consectetur molestiae nam consequatur perferendis voluptas ut quas eaque dolore corrupti autem explicabo explicabo et sed asperiores voluptatem dolore dolorum optio sequi id sit ut nisi ut commodi nam dolores rem maiores quia reprehenderit veritatis quia voluptatem autem porro est repudiandae minima aut similique veniam aut omnis quasi optio distinctio in ut aliquid velit architecto earum et eaque ab rerum aliquid in ut maxime dicta', 'ea, culpa, amet, non, corrupti, autem, sint, repellat, quos, molestiae, non, numquam, sit, perferendis, hic, voluptas, expedita, quasi, delectus, accusamus', 'kg', 73, 1706, 240, 4210, 1, 8, 'coffee-liberica.png', '2020-04-25 00:08:07', '2022-07-05 12:51:31'),
(64, 7, 'dignissimos', 'dignissimos', 'rerum totam autem reiciendis laudantium velit ullam quas perferendis dolorem placeat quia laborum aliquid optio maxime quidem eum qui rerum fugit corporis vitae repudiandae et ullam saepe in saepe cupiditate quia similique nemo reprehenderit id quia iure aperiam ea amet voluptas deserunt et sunt tempora tenetur beatae consequatur dolor quia magni reprehenderit assumenda quidem quasi qui modi excepturi quia ipsam eius molestiae nostrum reprehenderit atque quibusdam adipisci cum quam ullam iste nisi vel repudiandae rem quia quia et repellendus sint', 'qui, ducimus, quia, asperiores, iste, tenetur, nulla, laboriosam, est, cumque, est, ex, soluta, velit, aut, distinctio, dolores, minus, iste, expedita', 'kg', 73, 1421, 20, 1523, 1, 5, 'senorita.png', '2017-08-22 00:36:29', '2022-07-05 12:51:31'),
(65, 7, 'a', 'a', 'quo porro ut corporis voluptates error explicabo in aut quasi aut repudiandae cumque dolorum aut nihil est repudiandae neque voluptas enim vel ex adipisci sequi corporis odit qui quis minus ut dolores similique explicabo et sint deserunt ut perspiciatis neque non enim veritatis dolorem consequatur id autem sed corporis consequatur dolores sunt cupiditate enim et eaque incidunt fugit quos distinctio eum ut dolorem nulla tempora vero necessitatibus nihil sed soluta voluptatem id quisquam consequatur totam est sit et aperiam eos', 'laboriosam, amet, blanditiis, illum, est, quibusdam, et, sit, soluta, repudiandae, molestiae, voluptates, soluta, ratione, dicta, voluptas, odit, velit, dolores, dignissimos', 'kg', 2, 2120, 263, 7576, 1, 4, '12.jpg', '2021-07-08 05:53:31', '2022-07-05 12:51:31'),
(66, 7, 'nihil-aut-consectetur-unde', 'nihil aut consectetur unde', 'ea est fuga et eveniet eveniet praesentium rerum iusto cumque a ab quaerat aut et accusantium quisquam consequatur possimus error minus delectus assumenda itaque quia qui minus optio officia quae ut voluptatem repellat sed corporis totam laboriosam suscipit nemo omnis nostrum nulla magni porro non est et quam sunt hic et quibusdam non eligendi reiciendis rem labore quisquam autem et a ut ipsa saepe ad quibusdam asperiores aliquam quae deserunt quia quia vel omnis incidunt esse nobis illum eos et', 'molestiae, optio, sit, inventore, odit, quia, repudiandae, eos, at, doloribus, quaerat, esse, possimus, sunt, nemo, voluptatem, odio, expedita, quia, quod', 'kg', 56, 579, 73, 6316, 2, 5, '12.jpg', '2020-01-21 19:06:23', '2022-07-05 12:51:31'),
(67, 7, 'maxime-a-ut', 'maxime a ut', 'maiores animi quia consequatur qui consequatur qui et magnam similique et ab sit molestiae aliquam laudantium explicabo est veritatis omnis saepe mollitia in deleniti aspernatur quae praesentium ullam dolorem ut ut sint consequatur error est animi molestias cumque placeat ea atque optio voluptas minima sunt consequuntur adipisci dignissimos eum ab in nihil nesciunt omnis ipsam qui a autem unde perspiciatis at dolorem aperiam non ut corporis soluta in expedita nisi doloremque qui enim eligendi vel et ab aut libero dolorem', 'est, aut, cupiditate, qui, et, quod, et, voluptatem, consequatur, corporis, sint, aut, deserunt, molestias, adipisci, eveniet, dolorum, quia, voluptas, reiciendis', 'kg', 1, 829, 97, 6771, 1, 10, 'indian-mango.png', '2018-03-13 01:16:16', '2022-07-05 12:51:31'),
(68, 7, 'omnis-eveniet', 'omnis eveniet', 'sed cumque maxime et natus omnis iure unde nihil cumque molestias quia earum natus ut et rerum et molestias labore et sint quibusdam laudantium animi qui in nihil vitae qui cum dolorum voluptatem officia illo ipsum tempore consectetur eaque nemo et et sapiente perferendis rem dolor ipsam quo ipsum qui asperiores sunt iusto eum qui doloremque aspernatur unde qui ut eos modi quo eos asperiores et tenetur nesciunt et assumenda blanditiis non illo quae aut qui aut est at tempora', 'optio, eligendi, labore, autem, repellendus, provident, temporibus, maxime, voluptas, rerum, temporibus, incidunt, tempore, nulla, quia, aspernatur, animi, quasi, quia, dolor', 'kg', 43, 2271, 288, 7158, 1, 8, '3.jpg', '2021-09-19 22:10:33', '2022-07-05 12:51:31'),
(69, 7, 'non-ex', 'non ex', 'ullam aut reiciendis quia dolorem quae et nesciunt inventore quis architecto dolor minima rerum earum repellat facilis vel impedit accusantium illo veniam ipsa non praesentium aliquam voluptas mollitia cumque eos aut vitae modi accusantium vel reiciendis minima ut natus delectus voluptatem consequatur in magnam in dolores sit quidem aspernatur accusamus tempora vitae beatae ipsam culpa quas molestias sed rerum quas nesciunt et aperiam dolore rerum quis iusto laudantium dolor quibusdam cupiditate in corrupti impedit eligendi et velit asperiores odio possimus', 'illo, ab, quibusdam, culpa, autem, eum, ea, est, deserunt, voluptate, dolores, accusantium, perferendis, sed, expedita, id, repellat, accusantium, soluta, aut', 'kg', 84, 593, 153, 7835, 1, 10, '9.jpg', '2020-10-26 17:14:36', '2022-07-05 12:51:31'),
(70, 7, 'nam-voluptatem', 'nam voluptatem', 'sunt et sed dicta nam odit eum consequatur reiciendis iusto error quibusdam quo cumque soluta tempora ut dolor et reiciendis reiciendis non qui velit sint molestiae ducimus quae sed asperiores accusantium sit eos maxime ea rerum commodi exercitationem odit doloremque est voluptatem consequatur ducimus rerum aut qui inventore omnis asperiores asperiores ratione autem voluptate qui qui facilis iste non tempore et sint vero ut itaque deleniti sequi soluta cum consequuntur numquam et distinctio et omnis impedit cupiditate architecto dolores voluptas', 'iusto, maiores, aspernatur, quia, hic, ut, quibusdam, odio, est, debitis, odit, accusantium, voluptatem, aliquam, sunt, aspernatur, maxime, dicta, animi, officiis', 'kg', 50, 878, 265, 7003, 2, 9, 'coffee-arabica.png', '2018-02-01 08:10:55', '2022-07-05 12:51:31'),
(71, 8, 'accusamus-nesciunt', 'accusamus nesciunt', 'ab rerum et consectetur quod aperiam voluptate cupiditate impedit provident molestiae repellat voluptas quasi occaecati veniam quia suscipit sed necessitatibus est aliquid sed et dolorum inventore repudiandae voluptatem itaque autem iure illo doloremque aliquid officia tempora aut dolores quae ea voluptas est ipsam quam sed officia sed esse voluptas sunt earum deleniti expedita eum fuga et cupiditate iste distinctio ducimus tempora rerum harum id vel culpa quia possimus minima neque voluptas nam dolores et culpa velit ab magnam quo praesentium', 'nam, aut, placeat, voluptatem, dolore, voluptatibus, est, nam, sit, non, quos, facilis, fugiat, repudiandae, aut, numquam, eum, adipisci, consequuntur, molestiae', 'kg', 58, 1433, 343, 5159, 1, 5, 'cabbage.png', '2021-06-16 21:25:56', '2022-07-05 12:51:31'),
(72, 8, 'sunt-qui', 'sunt qui', 'nemo dignissimos magni dolor velit quia quae nam amet distinctio tenetur veniam et similique ut qui consequatur velit eos quo voluptatum est expedita nostrum repudiandae commodi qui minus nam voluptatum doloribus est voluptatem sequi praesentium voluptatem voluptatem adipisci illum deleniti sed cum suscipit autem architecto non quia dolore et fugit id reiciendis dignissimos laborum sint laboriosam voluptate saepe illo aspernatur quas veritatis explicabo atque inventore nesciunt alias velit quod quaerat et quia aspernatur omnis explicabo ducimus autem autem voluptatem quasi', 'omnis, eos, sit, qui, sint, magni, totam, totam, voluptatibus, sequi, sint, quos, reiciendis, voluptatem, rerum, vitae, hic, consequatur, voluptate, repellendus', 'kg', 0, 2070, 166, 3129, 1, 4, '12.jpg', '2017-07-13 09:42:17', '2022-07-05 12:51:31'),
(73, 8, 'fuga', 'fuga', 'et vitae consectetur et asperiores laudantium vitae excepturi nostrum laudantium dolore rerum ut perspiciatis dignissimos id cupiditate rerum sequi quaerat unde ut maiores id et debitis non quae rerum odio aliquid veritatis cupiditate sint saepe velit voluptas vel architecto sed quo aut molestiae velit suscipit placeat temporibus soluta non cupiditate quos vel ducimus est omnis nihil rerum voluptate debitis occaecati non aut voluptas nulla vel adipisci eum ex expedita ut tempora est quaerat molestias temporibus exercitationem illum et quod recusandae', 'et, cupiditate, id, tenetur, voluptatibus, corrupti, sed, voluptates, quasi, nesciunt, et, unde, laborum, molestias, saepe, corporis, ipsam, enim, temporibus, molestiae', 'kg', 96, 2896, 326, 7634, 1, 4, 'cabbage.png', '2020-12-05 05:53:10', '2022-07-05 12:51:31'),
(74, 8, 'nulla-cupiditate', 'nulla cupiditate', 'voluptatum sunt sunt sit voluptatum nesciunt commodi qui quidem aut omnis officia fugiat quod natus et maxime deserunt ratione suscipit non est eos odio sint ut qui voluptatum quos totam facilis ipsum sint laudantium nulla est veritatis suscipit qui est et quisquam a debitis omnis molestiae ea alias molestiae qui ea ut et consequatur provident dolore minima enim provident voluptatibus voluptas rerum consectetur accusamus odio aperiam ea sed incidunt sit illum ut quisquam quia ipsum distinctio ullam molestiae eos rerum', 'rerum, id, harum, omnis, doloribus, aut, sint, quae, expedita, vero, inventore, omnis, voluptatem, numquam, velit, ullam, aut, facere, ut, vitae', 'kg', 39, 57, 259, 5831, 1, 9, 'coconut-milk.png', '2022-06-16 21:02:56', '2022-07-05 12:51:31'),
(75, 8, 'eaque-sequi', 'eaque sequi', 'architecto vitae assumenda eos ut voluptatibus minus et odit aliquid voluptate id incidunt non dicta veritatis reiciendis voluptate necessitatibus culpa commodi at veniam et aut accusamus et reprehenderit doloribus pariatur eligendi voluptatibus non et laborum architecto consectetur odio laudantium veniam a ea asperiores nemo quis earum architecto iste corporis numquam dolores officia distinctio est aperiam asperiores expedita sint fugiat possimus ut ut perspiciatis et ea sit accusantium quia consectetur aut aut quia minus nemo optio voluptatem ut vitae quidem ipsum', 'repellat, voluptas, et, magnam, nobis, tenetur, veritatis, incidunt, adipisci, perspiciatis, praesentium, id, voluptatem, et, similique, consequatur, eum, ut, iusto, ullam', 'kg', 58, 2563, 219, 2480, 2, 7, 'coconut-milk.png', '2020-10-02 04:33:56', '2022-07-05 12:51:31'),
(76, 8, 'odit-soluta', 'odit soluta', 'cupiditate sapiente quos nihil voluptatem aut eaque debitis ea qui error dolorem consequatur praesentium dolorem cum et harum nobis mollitia consequatur quidem corporis natus aliquid et assumenda libero ducimus rem voluptate doloremque id ex iste laborum illum occaecati quisquam deleniti aliquam est tempore dolorem nisi fuga magnam in maiores consequatur et dolore sapiente voluptates impedit voluptates numquam laudantium et quo molestiae quisquam labore totam quod quidem unde doloribus molestiae dicta autem quo libero et nemo illo vel nihil sint quo', 'eum, et, repudiandae, commodi, at, nostrum, id, in, ipsum, et, qui, mollitia, voluptas, est, sunt, suscipit, explicabo, quasi, omnis, et', 'kg', 34, 425, 210, 4643, 2, 5, '8.jpg', '2021-05-24 11:04:14', '2022-07-05 12:51:31'),
(77, 8, 'numquam-non-voluptatem-qui', 'numquam non voluptatem qui', 'sequi unde quo dolor repellendus sint et et a aut dicta harum est velit animi autem saepe rerum tempora at tenetur adipisci tempore distinctio nihil nam ipsa est et aut aliquid autem minus a sed vel voluptates beatae adipisci delectus atque porro consequatur voluptas itaque porro corporis molestiae accusamus qui nemo ad facilis non architecto totam cupiditate sed nisi illo aut ex vel consequatur consequatur minima non officia suscipit ipsam impedit vel qui voluptas temporibus ipsum est voluptas eligendi aliquid', 'in, eveniet, sapiente, soluta, quis, nemo, quos, consequatur, dolores, labore, tempora, quia, minima, veritatis, rerum, sunt, hic, consequatur, eveniet, officia', 'kg', 12, 2118, 223, 5060, 2, 10, 'cassava.png', '2022-03-09 18:10:23', '2022-07-05 12:51:31'),
(78, 8, 'voluptas-blanditiis', 'voluptas blanditiis', 'voluptatem voluptatem repudiandae voluptatum cumque exercitationem assumenda exercitationem et temporibus ut quae laborum pariatur amet earum nulla voluptatem dolores aut magni est est et quia perferendis eos vitae accusamus quo autem modi sint cupiditate porro delectus praesentium quos quasi tenetur voluptatem reprehenderit qui non eos nobis accusamus sequi velit expedita magni non atque sit rerum et voluptatum fugiat sunt sit quaerat omnis quibusdam voluptatem dolores odio numquam occaecati veritatis sed odio animi dicta sequi consequatur at non deleniti esse voluptatum', 'at, expedita, adipisci, ut, inventore, aut, dolore, sunt, consectetur, qui, est, aspernatur, ex, maxime, ad, eum, accusamus, dolorem, consequatur, laudantium', 'kg', 9, 1755, 149, 2026, 1, 3, 'coconut-peat.png', '2019-10-20 23:06:48', '2022-07-05 12:51:31'),
(79, 8, 'molestiae-maxime-consequuntur', 'molestiae maxime consequuntur', 'est exercitationem tempore culpa dolore et eaque consequatur odit aut omnis impedit praesentium repellendus eligendi sint officiis in ullam libero animi quia in dolor dolorem ratione facilis consequatur qui at autem laborum inventore odit repellendus rerum minus voluptatem quia nostrum aperiam ut quia qui voluptas eum ex hic odio et enim eum voluptatibus molestias sit eius est molestias odit sint mollitia qui incidunt possimus similique quia dolore odio et in nobis placeat corporis cupiditate excepturi quibusdam et dolorem ut impedit', 'sunt, possimus, voluptatem, voluptates, suscipit, corporis, est, dolor, alias, et, accusamus, eos, velit, et, debitis, eos, rerum, quia, in, repudiandae', 'kg', 64, 2348, 106, 3413, 1, 4, '1.jpg', '2018-04-22 02:25:57', '2022-07-05 12:51:31'),
(80, 8, 'vero-quibusdam', 'vero quibusdam', 'aliquam voluptatem qui cum quia sed fugiat ut necessitatibus quasi eveniet quis dolorem officiis aut doloribus natus officia ut est quasi quae ducimus in deleniti pariatur aspernatur blanditiis voluptatibus aut quaerat perspiciatis nisi doloremque ex ea repudiandae quam quis atque ducimus placeat quisquam sint praesentium perspiciatis dolor rerum eveniet nobis culpa est necessitatibus neque voluptates cumque cum sed praesentium non minus et aut molestias quam vel magnam vel vitae tempora explicabo suscipit et incidunt corrupti tempora consequatur quos hic aut', 'neque, autem, est, doloremque, aliquam, ullam, quia, atque, aut, asperiores, id, aliquid, deserunt, sit, consequatur, praesentium, maxime, aut, fugit, consequatur', 'kg', 77, 358, 63, 7047, 1, 3, 'sugarcane.png', '2020-07-18 12:43:06', '2022-07-05 12:51:31'),
(81, 9, 'perferendis-voluptas-eos', 'perferendis voluptas eos', 'in et quas est dignissimos dignissimos consectetur deleniti nobis eos dolor sit est cum exercitationem voluptatem recusandae sint nihil libero hic quia enim voluptas voluptatem debitis in itaque voluptatem dolor eos possimus tempore dolor omnis et libero atque dignissimos ad non consectetur numquam voluptas impedit similique illo aut necessitatibus temporibus est voluptatem aliquam ipsa deserunt qui quia autem recusandae voluptatem quia distinctio non voluptas accusantium similique aut eum tempora illo illo quos illum voluptatum veniam in maxime consequatur nisi ex', 'dolorum, officia, eaque, sint, recusandae, dignissimos, quam, voluptas, error, quia, itaque, qui, in, numquam, quia, pariatur, doloribus, et, beatae, ut', 'kg', 98, 2883, 194, 6672, 1, 8, 'potato-2.png', '2019-11-24 23:02:29', '2022-07-05 12:51:32'),
(82, 9, 'quia-in-aliquam-ea', 'quia in aliquam ea', 'cupiditate omnis qui ut omnis ea voluptatem et est doloremque et iusto qui maiores nobis suscipit qui mollitia soluta beatae vero iste unde repellat laboriosam eos deleniti rem inventore accusamus quo vitae rerum dolorem porro iste dolores nihil et minus quidem dicta voluptatem id repellendus sint ipsa explicabo iusto repudiandae incidunt totam sapiente nulla minima distinctio vel provident consectetur occaecati dolor est mollitia eum ut nemo vero et quis nulla cum corrupti sed est vel eos maxime unde rerum fugiat', 'enim, velit, ipsa, quisquam, accusantium, quas, vel, eius, voluptatem, qui, id, laudantium, quia, ea, ad, cumque, vero, optio, deserunt, et', 'kg', 24, 1399, 146, 1854, 2, 10, '10.jpg', '2018-06-13 19:24:34', '2022-07-05 12:51:32'),
(83, 9, 'iusto-doloremque', 'iusto doloremque', 'sed voluptatem vel dicta impedit unde a qui deserunt error sed corrupti quod optio voluptatem accusantium atque doloremque et id itaque nam cupiditate veritatis autem assumenda error neque illum laudantium aliquid odio delectus in dolor exercitationem sequi consequatur quae optio reiciendis ut assumenda quis itaque ea officia voluptatem provident quia rerum veritatis rerum enim id maxime et consequatur praesentium nobis sit sunt quibusdam ut eius ducimus rerum aut non expedita est sit in fugit perferendis excepturi laborum libero id perspiciatis', 'dolorem, quae, aliquid, iste, alias, facilis, accusamus, nihil, sunt, aliquam, consequatur, enim, in, voluptas, corrupti, ducimus, rerum, rerum, commodi, perferendis', 'kg', 46, 2819, 213, 2790, 2, 3, 'coconut-peat.png', '2020-01-01 03:39:25', '2022-07-05 12:51:32'),
(84, 9, 'aut', 'aut', 'est qui est suscipit ut alias repellendus quia minima earum aut est corporis inventore voluptatibus modi maxime ea repellendus optio dignissimos et alias quia inventore minima qui illum repudiandae dicta laudantium ipsum omnis dolore repudiandae inventore consequatur ab eos placeat et est soluta autem dolorum sunt asperiores iste consectetur laboriosam ullam aperiam praesentium asperiores quae autem aut suscipit id molestiae ab distinctio consectetur commodi perferendis ea odit dicta optio atque fugiat iusto ut consequatur sint fuga ab cupiditate rerum sequi', 'doloremque, velit, amet, consequatur, magnam, et, doloremque, ipsam, est, neque, doloremque, est, et, sed, eaque, quia, dolorem, sed, aut, sed', 'kg', 23, 2326, 338, 1455, 2, 7, 'senorita.png', '2018-03-17 01:55:43', '2022-07-05 12:51:32'),
(85, 9, 'quis', 'quis', 'velit facere consequatur corporis consequatur iste sed magni aliquid sint aut inventore ducimus qui harum rerum voluptas ullam qui nihil numquam et dolorem nemo aut vel dolor deserunt et non et vel vel in adipisci ut quod ducimus dolor odio est error nulla quod consequatur nulla quia sapiente quo dolor maxime totam dolorem corrupti ducimus suscipit dolor ad eius explicabo error minus blanditiis atque facere dicta et odit doloremque maxime fuga dolorem iste in eaque natus eaque consectetur qui rerum', 'sint, dolorem, officia, et, consequuntur, autem, impedit, est, adipisci, expedita, dolorem, in, adipisci, qui, nihil, ut, consequuntur, assumenda, laboriosam, dolor', 'kg', 13, 2231, 187, 3043, 1, 9, '4.jpg', '2017-09-04 03:44:57', '2022-07-05 12:51:32'),
(86, 9, 'est', 'est', 'eum nam ratione dolores reiciendis quae earum illum sed dicta occaecati ipsam quia error vel voluptates minima aut quo quia sed dolores harum fugiat quas necessitatibus ratione amet illo neque quas perspiciatis doloribus minus voluptatem id voluptatum voluptas placeat aut omnis dolorem necessitatibus quia fugit dignissimos ut rem aut dolor expedita ea quo ad sunt aut iste ipsam alias officia esse ut in praesentium sint magnam dolore et omnis molestias voluptatem autem quidem soluta rerum accusantium dolorum perferendis aliquid odio', 'nulla, veritatis, voluptate, perferendis, consectetur, eum, reprehenderit, nihil, quia, molestiae, itaque, consequatur, qui, nisi, ea, sed, deleniti, aut, ullam, temporibus', 'kg', 17, 2317, 113, 1161, 2, 9, 'ground-coffee.png', '2018-12-14 12:17:56', '2022-07-05 12:51:32'),
(87, 9, 'dolor-fuga-velit', 'dolor fuga velit', 'tenetur et asperiores voluptas omnis ut ut facilis nam nihil autem sunt impedit animi saepe vero veritatis et voluptatum eius beatae voluptas labore quasi expedita molestiae ea enim voluptatum est soluta aliquam omnis dolorem aut accusantium tempore assumenda eos aut corporis consequuntur distinctio nihil atque exercitationem voluptatem quia et tempore dolores voluptatem voluptatibus nihil molestias dolor sed totam et corrupti blanditiis provident sunt velit consequatur autem ut ea odio doloremque enim blanditiis atque aut dolore quaerat molestiae non quisquam unde', 'distinctio, necessitatibus, aut, aut, autem, illo, hic, quod, quaerat, harum, nostrum, omnis, odit, voluptate, sit, nulla, quaerat, amet, labore, ut', 'kg', 49, 2492, 333, 4960, 1, 5, 'tobacco.png', '2021-08-16 09:36:22', '2022-07-05 12:51:32'),
(88, 9, 'exercitationem', 'exercitationem', 'excepturi et reiciendis ullam velit dolores est ab rerum eos enim eius eius autem asperiores beatae quia enim nemo dolores minus iste temporibus dignissimos quasi eligendi voluptatem deleniti dolor deleniti illo nihil reiciendis minus exercitationem velit quod nobis impedit nam dolorem dolorem aut maxime dolorem voluptatem quia distinctio quia officia distinctio et sit voluptatem molestiae sint repudiandae non aliquid eum cum rerum accusantium a vitae dolores dolorem voluptate enim nemo doloremque non ab occaecati vero vitae eum qui ea harum', 'iste, praesentium, et, sint, non, fugit, tempora, non, libero, sit, deleniti, qui, hic, exercitationem, et, debitis, autem, perspiciatis, esse, accusamus', 'kg', 6, 389, 40, 3840, 1, 7, '12-1.jpg', '2019-10-23 17:44:13', '2022-07-05 12:51:32'),
(89, 9, 'voluptatibus', 'voluptatibus', 'exercitationem ducimus et quia asperiores dolorem neque dolores non quidem consectetur asperiores voluptatum facere assumenda fuga vel suscipit nulla omnis accusantium sed dicta nihil et sunt a sunt unde aut aliquam assumenda quia voluptas ab dolores maxime expedita inventore odit distinctio labore facilis est quod sequi corrupti temporibus commodi animi dolores rerum nam voluptatem quo sed perspiciatis nostrum sunt laboriosam omnis dolorum magni omnis et vel doloribus dolores quas esse est ut velit quaerat aspernatur qui placeat quia quam quod', 'dolorem, totam, consequuntur, et, et, culpa, saepe, autem, laboriosam, labore, rerum, mollitia, et, perspiciatis, optio, consequatur, blanditiis, dolorum, veritatis, nihil', 'kg', 16, 1435, 306, 2494, 1, 9, 'yellow-corn.png', '2017-07-07 09:54:47', '2022-07-05 12:51:32'),
(90, 9, 'quaerat-totam-nam', 'quaerat totam nam', 'adipisci numquam velit sint placeat voluptatum debitis repellat quo pariatur culpa illo ex facere deleniti odit libero ipsa occaecati assumenda omnis et culpa praesentium aut autem corrupti dolores velit tempora dolor aut velit voluptatem iste consequatur laudantium suscipit quas nulla rem vel et et sint perferendis expedita nulla deleniti laboriosam dicta provident amet sequi consequatur quo sed quis vel error quisquam facilis pariatur impedit ut eligendi dolor tenetur similique ullam quisquam vel cum maiores necessitatibus enim non unde inventore ea', 'sed, omnis, pariatur, molestiae, et, voluptatem, fuga, ut, aut, assumenda, nam, nisi, maxime, inventore, accusantium, voluptate, modi, rerum, ex, veritatis', 'kg', 91, 2184, 125, 6430, 2, 5, '1.jpg', '2020-05-17 20:23:21', '2022-07-05 12:51:32'),
(91, 10, 'dolores-at-voluptatibus', 'dolores at voluptatibus', 'vel iusto maiores nihil aut sequi vero ut voluptas et ea quibusdam rerum quae dolor nesciunt dolores et est sit magnam facere non accusamus porro dolor inventore pariatur dolor earum ea inventore recusandae accusantium quis in inventore asperiores minus dolores neque aspernatur tenetur culpa iste aut quo voluptates distinctio inventore excepturi harum sit harum officia omnis corrupti et qui assumenda recusandae omnis et itaque laboriosam voluptatibus voluptas culpa fuga omnis blanditiis id ullam magni voluptas dolores delectus sapiente est odit', 'ut, aliquid, praesentium, accusamus, nam, consequatur, vero, tenetur, consequatur, explicabo, alias, quo, repellendus, velit, a, eligendi, reiciendis, aliquam, illo, provident', 'kg', 8, 1914, 222, 207, 1, 5, '11.jpg', '2021-10-19 20:04:02', '2022-07-05 12:51:33'),
(92, 10, 'est-aut', 'est aut', 'sint neque impedit dolore id hic modi placeat soluta sed pariatur voluptatem qui ea fugit omnis autem perferendis exercitationem non consequatur vel ut aut sed et aut ipsum aut occaecati voluptas dolorem officia iure sequi velit magnam ipsa pariatur corporis id esse voluptates dolor neque reiciendis qui nam facere ea voluptatum explicabo aliquam eveniet dolorum culpa eaque qui nam assumenda sed et maxime voluptatem dolor ut et vitae aut omnis rerum eveniet omnis quia quo labore facere ipsum ipsam qui', 'autem, enim, odit, ea, dolorum, atque, et, culpa, libero, ipsa, accusamus, veritatis, eos, esse, ipsam, enim, doloribus, harum, a, porro', 'kg', 28, 1764, 50, 3765, 1, 6, '1.jpg', '2020-05-15 17:16:10', '2022-07-05 12:51:33'),
(93, 10, 'vero-accusamus-accusantium-necessitatibus', 'vero accusamus accusantium necessitatibus', 'et expedita animi cupiditate repellendus non quo odio nihil quibusdam et sunt quia et ducimus odit similique quia maiores illum optio laboriosam aspernatur porro qui rerum et qui non ut magni eaque iste facere officia qui facere illo dolores incidunt nobis fuga dolor hic ut ab aut autem in quo facere ut porro doloribus aut provident harum sapiente minima laudantium nihil consectetur architecto facere et assumenda maiores facere atque fugiat esse hic aut praesentium quo temporibus earum est sed alias', 'sit, et, ut, voluptates, illo, neque, commodi, fugit, laboriosam, voluptas, explicabo, repellendus, et, culpa, optio, et, at, sint, et, placeat', 'kg', 48, 2397, 60, 857, 2, 5, '12-1.jpg', '2019-12-11 22:21:43', '2022-07-05 12:51:33'),
(94, 10, 'et-accusantium-eum-soluta', 'et accusantium eum soluta', 'est consequatur autem maxime quos molestiae ipsam doloremque illum error et fuga sint in voluptates fuga ratione velit possimus rerum suscipit tenetur sit vero qui quos in ex et mollitia sed deserunt tenetur occaecati assumenda voluptatem repellendus nihil natus sit voluptatem eum voluptatum repellendus consectetur eum amet ex aut natus iusto dicta iste id accusantium et delectus non in enim reprehenderit expedita quibusdam et perspiciatis nostrum aut non velit culpa fuga voluptatem dolorem maiores velit mollitia aspernatur aliquid alias enim', 'officiis, veniam, voluptas, omnis, excepturi, dolores, dolor, accusantium, labore, enim, aut, vitae, labore, hic, nostrum, soluta, unde, harum, omnis, assumenda', 'kg', 41, 1477, 242, 1906, 2, 7, 'tobacco.png', '2018-05-18 05:47:58', '2022-07-05 12:51:33'),
(95, 10, 'commodi-eaque-iusto', 'commodi eaque iusto', 'vero cum dolor sunt laborum ducimus possimus earum rerum aut sint voluptatibus quibusdam enim optio corporis dolor ut id ut voluptate magnam omnis et consequatur ut sequi recusandae perferendis possimus dolorem maxime quia aspernatur earum nam ut id sit molestiae libero ut quod provident distinctio dignissimos autem omnis illo molestiae quos omnis debitis dolorum repellendus repellendus consequuntur et itaque et modi natus et nihil distinctio minima quidem est quia nisi at neque animi et veritatis ut esse alias dolorem deleniti', 'suscipit, delectus, aut, dolorum, eveniet, commodi, alias, sit, quibusdam, harum, porro, repudiandae, sapiente, eum, temporibus, aspernatur, est, molestiae, at, sit', 'kg', 73, 1726, 199, 295, 1, 9, '1.jpg', '2020-02-21 11:42:26', '2022-07-05 12:51:33'),
(96, 10, 'id', 'id', 'assumenda et voluptas est dicta et eaque atque voluptates rem veniam rerum itaque eius reprehenderit adipisci sit qui eos corrupti voluptates architecto maiores quos deserunt tenetur est quo ipsam qui sed quia et corporis minus fugit maxime consequatur quia asperiores quia autem sunt laborum alias numquam commodi tenetur incidunt autem quae quisquam iste perferendis facere quod dolor iure et hic aut voluptas neque sed voluptatem blanditiis placeat iusto sit id architecto quis sunt ratione quis et sint accusamus nulla labore', 'aut, nihil, sunt, neque, qui, repellat, omnis, suscipit, ut, molestiae, fugit, voluptate, ex, itaque, libero, commodi, commodi, sunt, velit, minima', 'kg', 14, 2476, 192, 768, 1, 10, '6.jpg', '2019-05-16 16:21:50', '2022-07-05 12:51:33'),
(97, 10, 'quia-quo', 'quia quo', 'molestiae quam distinctio quas eum aut cupiditate consequatur aut ex autem dicta error culpa recusandae et illum expedita in fugiat natus facere quibusdam a ea et illum ratione suscipit qui qui totam eaque aliquid quia pariatur delectus aliquam laudantium ipsum quae amet iusto temporibus ea quo officia molestias quaerat saepe dolore eos eos laborum corrupti omnis soluta ipsa eius voluptatem tenetur tenetur voluptatem enim dolorem eaque dolorum aut est omnis et aut veniam qui magni rerum omnis molestias odio eum', 'quibusdam, facere, enim, voluptate, fugiat, iusto, est, voluptatem, atque, nisi, neque, laborum, alias, repellendus, ea, sunt, officiis, et, voluptatem, quibusdam', 'kg', 79, 54, 113, 3010, 2, 10, 'tomato-catsup.png', '2018-12-21 13:43:49', '2022-07-05 12:51:33'),
(98, 10, 'quos', 'quos', 'modi voluptas et praesentium optio quo dolorem voluptatem harum ut cupiditate ex voluptatem nam sequi iusto aut ut fugit eligendi ut amet suscipit voluptatibus ipsa asperiores saepe rerum sit corrupti velit et et porro ipsa animi ipsam mollitia laudantium dolor eligendi saepe sit reprehenderit omnis quidem dolores nostrum eos assumenda dignissimos consequatur qui enim quis officiis minus dolores nulla ex consequatur cupiditate qui non qui ipsa eaque suscipit non est velit voluptatem quod ex porro ut aliquid aut ut nesciunt', 'cum, illo, est, ea, fugiat, qui, error, magnam, voluptatibus, voluptatem, dolor, voluptatem, quisquam, repellendus, aspernatur, dolores, inventore, labore, officiis, qui', 'kg', 45, 2562, 167, 5570, 2, 8, '1.jpg', '2020-05-08 00:38:32', '2022-07-05 12:51:33'),
(99, 10, 'eaque-porro-ipsa', 'eaque porro ipsa', 'facilis dicta placeat ex ad excepturi consequatur iste quia eveniet blanditiis qui itaque illum tempora omnis ex et earum porro sint autem eos praesentium neque commodi harum iure cupiditate ratione minus adipisci perspiciatis sit incidunt quos porro aliquid placeat quod quia sunt beatae dignissimos aut omnis quo et tenetur impedit voluptate laborum earum dolores quas odit architecto quia animi dolores suscipit laboriosam architecto itaque dolorem provident est repellendus beatae magni nesciunt qui ad architecto quasi dolorem qui unde non ad', 'et, voluptates, architecto, corporis, qui, nam, labore, aliquid, qui, sit, corrupti, adipisci, quia, cupiditate, doloremque, culpa, quia, dolorum, pariatur, alias', 'kg', 25, 2156, 40, 75, 2, 9, 'banana.jpg', '2019-06-23 21:30:52', '2022-07-05 12:51:33'),
(100, 10, 'sit-occaecati-aut', 'sit occaecati aut', 'similique consequatur cum dolores voluptatibus quia atque numquam consequuntur est recusandae aperiam sit porro aut magnam incidunt aspernatur vero illum suscipit quos molestiae consequatur quidem consequuntur error quos blanditiis aut iure et non id maxime pariatur voluptatum ut aliquam consectetur nihil sunt officiis esse praesentium delectus nobis est dolore et hic cumque alias quasi magnam sit harum inventore illum beatae corrupti commodi earum omnis aut eius atque blanditiis animi est magni amet et hic et id enim qui maxime iste', 'saepe, ex, quia, ratione, distinctio, illum, iure, amet, sapiente, officiis, cum, sed, possimus, omnis, neque, voluptatem, minima, sapiente, et, et', 'kg', 22, 2945, 204, 5301, 2, 9, '11.jpg', '2018-07-09 13:36:09', '2022-07-05 12:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`, `subcategory_id`, `sub_subcategory_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 41, NULL, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(2, 2, 2, 30, 88, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(3, 3, 3, 37, 119, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(4, 4, 2, 33, 107, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(5, 5, 2, 29, 72, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(6, 6, 4, 42, NULL, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(7, 7, 1, 23, NULL, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(8, 8, 3, 35, NULL, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(9, 9, 1, 26, NULL, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(10, 10, 1, 4, 11, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(11, 11, 1, 1, 2, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(12, 12, 3, 37, 119, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(13, 13, 3, 36, NULL, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(14, 14, 4, 41, NULL, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(15, 15, 2, 31, 94, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(16, 16, 1, 10, 32, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(17, 17, 4, 38, 122, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(18, 18, 1, 25, 62, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(19, 19, 3, 35, NULL, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(20, 20, 4, 40, NULL, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(21, 21, 1, 15, NULL, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(22, 22, 1, 4, 16, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(23, 23, 2, 31, 91, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(24, 24, 2, 33, 108, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(25, 25, 4, 40, NULL, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(26, 26, 1, 23, NULL, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(27, 27, 1, 8, 30, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(28, 28, 3, 37, 118, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(29, 29, 1, 6, 21, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(30, 30, 3, 34, 117, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(31, 31, 4, 39, NULL, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(32, 32, 2, 31, 94, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(33, 33, 3, 36, NULL, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(34, 34, 4, 41, NULL, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(35, 35, 1, 10, 33, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(36, 36, 1, 4, 12, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(37, 37, 3, 35, NULL, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(38, 38, 1, 19, 48, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(39, 39, 3, 37, 119, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(40, 40, 3, 37, 119, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(41, 41, 4, 42, NULL, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(42, 42, 2, 33, 108, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(43, 43, 2, 31, 91, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(44, 44, 1, 14, NULL, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(45, 45, 1, 10, 33, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(46, 46, 2, 29, 68, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(47, 47, 2, 30, 89, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(48, 48, 3, 36, NULL, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(49, 49, 1, 5, 18, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(50, 50, 3, 37, 120, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(51, 51, 2, 31, 93, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(52, 52, 4, 41, NULL, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(53, 53, 1, 13, 40, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(54, 54, 2, 29, 74, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(55, 55, 4, 40, NULL, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(56, 56, 2, 31, 91, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(57, 57, 2, 31, 95, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(58, 58, 4, 39, NULL, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(59, 59, 2, 30, 88, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(60, 60, 2, 33, 107, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(61, 61, 2, 29, 73, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(62, 62, 2, 33, 108, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(63, 63, 1, 22, 56, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(64, 64, 4, 42, NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(65, 65, 4, 41, NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(66, 66, 4, 39, NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(67, 67, 2, 31, 95, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(68, 68, 2, 29, 63, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(69, 69, 4, 41, NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(70, 70, 1, 15, NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(71, 71, 4, 42, NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(72, 72, 3, 37, 118, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(73, 73, 4, 40, NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(74, 74, 2, 32, 98, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(75, 75, 1, 24, NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(76, 76, 4, 38, 122, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(77, 77, 3, 36, NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(78, 78, 2, 31, 92, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(79, 79, 4, 38, 122, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(80, 80, 2, 32, 102, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(81, 81, 4, 42, NULL, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(82, 82, 1, 21, 55, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(83, 83, 3, 37, 118, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(84, 84, 4, 40, NULL, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(85, 85, 3, 35, NULL, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(86, 86, 4, 40, NULL, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(87, 87, 1, 10, 33, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(88, 88, 2, 30, 84, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(89, 89, 4, 38, 122, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(90, 90, 4, 41, NULL, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(91, 91, 4, 40, NULL, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(92, 92, 2, 31, 92, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(93, 93, 1, 15, NULL, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(94, 94, 2, 33, 107, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(95, 95, 2, 31, 96, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(96, 96, 1, 24, NULL, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(97, 97, 1, 11, NULL, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(98, 98, 1, 5, 19, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(99, 99, 3, 34, 110, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(100, 100, 2, 29, 65, '2022-07-05 12:51:33', '2022-07-05 12:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_photos`
--

CREATE TABLE `product_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_photos`
--

INSERT INTO `product_photos` (`id`, `product_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'cassava.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(2, 1, '4.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(3, 1, '10.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(4, 1, 'potato-2.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(5, 2, 'product-5.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(6, 2, 'yellow-corn.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(7, 2, 'product-6.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(8, 2, '12-2.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(9, 3, '1.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(10, 3, 'tobacco.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(11, 3, 'cabbage.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(12, 3, 'ground-coffee.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(13, 4, 'cassava-flour.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(14, 4, 'product-7.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(15, 4, 'product-7.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(16, 4, 'indian-mango.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(17, 5, 'product-8.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(18, 5, 'cabbage.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(19, 5, 'ampalaya.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(20, 5, 'cabbage.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(21, 6, '9.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(22, 6, 'coconut-milk.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(23, 6, 'product-9.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(24, 6, 'cassava-flour.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(25, 7, '3.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(26, 7, 'white-corn.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(27, 7, 'copa.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(28, 7, 'product-8.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(29, 8, 'white-corn.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(30, 8, 'coconut-milk.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(31, 8, 'coconut-milk.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(32, 8, '10.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(33, 9, 'cassava-flour.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(34, 9, 'product-4.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(35, 9, 'product-3.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(36, 9, '2.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(37, 10, '6.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(38, 10, 'product-3.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(39, 10, '2.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(40, 10, 'cavendish.png', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(41, 11, 'lakatan.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(42, 11, 'banana.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(43, 11, 'cassava.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(44, 11, 'rice-husk.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(45, 12, 'product-7.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(46, 12, '12-2.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(47, 12, 'potato-2.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(48, 12, 'ampalaya.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(49, 13, 'product-4.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(50, 13, 'product-1.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(51, 13, '11.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(52, 13, 'coffee-liberica.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(53, 14, 'lakatan.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(54, 14, '6.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(55, 14, 'white-corn.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(56, 14, 'product-9.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(57, 15, 'product-7.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(58, 15, 'rice-husk.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(59, 15, '9.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(60, 15, 'ampalaya.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(61, 16, '12-2.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(62, 16, '5.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(63, 16, 'tomato-catsup.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(64, 16, '7.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(65, 17, 'pineapple.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(66, 17, 'cassava-flour.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(67, 17, 'indian-mango.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(68, 17, 'cavendish.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(69, 18, '12-1.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(70, 18, 'product-8.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(71, 18, 'copa.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(72, 18, 'product-7.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(73, 19, 'indian-mango.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(74, 19, '6.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(75, 19, 'ampalaya.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(76, 19, 'cabbage.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(77, 20, 'lakatan.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(78, 20, 'product-2.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(79, 20, 'tobacco.png', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(80, 20, '1.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(81, 21, '11.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(82, 21, 'product-7.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(83, 21, 'coconut-peat.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(84, 21, 'cassava.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(85, 22, 'tobacco.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(86, 22, '12.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(87, 22, 'cassava.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(88, 22, '11.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(89, 23, '9.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(90, 23, '12-2.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(91, 23, '6.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(92, 23, 'product-1.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(93, 24, 'tobacco.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(94, 24, 'onion.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(95, 24, '6.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(96, 24, 'sweet-potato.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(97, 25, 'tomato-catsup.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(98, 25, '9.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(99, 25, 'pineapple-juice.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(100, 25, 'banana.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(101, 26, 'bagasse.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(102, 26, 'coffee-liberica.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(103, 26, 'product-1.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(104, 26, 'pineapple-juice.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(105, 27, '12-1.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(106, 27, 'product-2.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(107, 27, '8.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(108, 27, 'sugarcane.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(109, 28, '12-1.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(110, 28, 'tobacco.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(111, 28, 'product-8.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(112, 28, 'pineapple-juice.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(113, 29, 'coffee-liberica.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(114, 29, 'product-7.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(115, 29, 'ampalaya.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(116, 29, 'yellow-corn.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(117, 30, 'coffee-liberica.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(118, 30, 'tobacco.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(119, 30, 'tobacco.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(120, 30, 'tobacco.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(121, 31, '12-1.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(122, 31, 'copa.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(123, 31, 'bagasse.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(124, 31, 'cassava-flour.png', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(125, 32, 'indian-mango.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(126, 32, 'sugarcane.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(127, 32, 'product-7.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(128, 32, '4.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(129, 33, 'product-8.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(130, 33, '2.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(131, 33, '3.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(132, 33, 'coconut-peat.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(133, 34, 'coffee-arabica.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(134, 34, 'rice-husk.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(135, 34, 'ampalaya.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(136, 34, 'product-5.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(137, 35, 'coffee-liberica.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(138, 35, 'yellow-corn.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(139, 35, 'senorita.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(140, 35, '7.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(141, 36, 'cassava-flour.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(142, 36, 'coffee-arabica.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(143, 36, 'white-corn.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(144, 36, 'coffee-arabica.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(145, 37, '12-1.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(146, 37, 'bagasse.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(147, 37, '4.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(148, 37, '6.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(149, 38, '8.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(150, 38, 'senorita.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(151, 38, 'coffee-arabica.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(152, 38, 'product-1.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(153, 39, 'coffee-arabica.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(154, 39, '12-2.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(155, 39, 'senorita.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(156, 39, '7.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(157, 40, 'product-6.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(158, 40, '12.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(159, 40, 'product-2.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(160, 40, 'product-1.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(161, 41, '3.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(162, 41, 'sweet-potato.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(163, 41, '12-2.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(164, 41, '3.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(165, 42, 'onion.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(166, 42, 'white-corn.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(167, 42, 'yellow-corn.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(168, 42, 'ground-coffee.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(169, 43, 'pineapple.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(170, 43, 'onion.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(171, 43, 'banana.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(172, 43, 'product-5.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(173, 44, 'product-3.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(174, 44, 'bagasse.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(175, 44, 'tobacco.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(176, 44, '12-1.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(177, 45, '4.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(178, 45, 'sweet-potato.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(179, 45, 'product-2.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(180, 45, '4.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(181, 46, 'product-9.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(182, 46, 'sugarcane.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(183, 46, '12.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(184, 46, 'sweet-potato.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(185, 47, 'cassava.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(186, 47, '10.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(187, 47, 'white-corn.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(188, 47, 'tomato-catsup.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(189, 48, 'coconut-milk.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(190, 48, 'indian-mango.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(191, 48, 'product-3.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(192, 48, 'pineapple-juice.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(193, 49, 'ground-coffee.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(194, 49, 'sweet-potato.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(195, 49, 'product-9.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(196, 49, 'tobacco.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(197, 50, 'cassava.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(198, 50, 'rice-husk.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(199, 50, 'product-8.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(200, 50, 'lakatan.png', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(201, 51, 'cassava.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(202, 51, 'product-8.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(203, 51, 'product-1.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(204, 51, 'pineapple-juice.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(205, 52, 'cassava-flour.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(206, 52, 'tobacco.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(207, 52, 'ampalaya.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(208, 52, 'product-6.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(209, 53, 'ampalaya.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(210, 53, 'banana.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(211, 53, 'product-5.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(212, 53, 'cassava.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(213, 54, 'cassava.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(214, 54, '2.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(215, 54, 'product-8.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(216, 54, 'cassava.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(217, 55, 'product-3.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(218, 55, 'sweet-potato.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(219, 55, 'tomato-catsup.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(220, 55, 'ground-coffee.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(221, 56, '10.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(222, 56, '7.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(223, 56, 'product-6.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(224, 56, 'rice-husk.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(225, 57, 'coconut-peat.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(226, 57, 'product-5.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(227, 57, 'tomato-catsup.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(228, 57, 'onion.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(229, 58, 'copa.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(230, 58, 'white-corn.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(231, 58, 'tomato-catsup.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(232, 58, 'product-3.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(233, 59, '12-2.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(234, 59, 'senorita.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(235, 59, 'copa.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(236, 59, 'coconut-milk.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(237, 60, '8.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(238, 60, '12.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(239, 60, '9.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(240, 60, 'coconut-milk.png', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(241, 61, 'product-9.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(242, 61, 'banana.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(243, 61, 'coffee-liberica.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(244, 61, 'sweet-potato.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(245, 62, '10.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(246, 62, 'copa.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(247, 62, 'product-4.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(248, 62, 'ampalaya.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(249, 63, 'product-5.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(250, 63, '6.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(251, 63, 'tobacco.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(252, 63, '11.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(253, 64, '1.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(254, 64, 'product-5.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(255, 64, '7.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(256, 64, 'tobacco.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(257, 65, 'white-corn.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(258, 65, 'white-corn.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(259, 65, 'product-6.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(260, 65, 'ground-coffee.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(261, 66, 'senorita.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(262, 66, '12.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(263, 66, 'coconut-milk.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(264, 66, 'bagasse.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(265, 67, 'tobacco.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(266, 67, 'ground-coffee.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(267, 67, 'yellow-corn.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(268, 67, 'cassava-flour.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(269, 68, 'potato-2.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(270, 68, '12-1.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(271, 68, '6.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(272, 68, 'cassava.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(273, 69, 'cassava-flour.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(274, 69, 'onion.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(275, 69, '2.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(276, 69, 'sweet-potato.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(277, 70, 'cabbage.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(278, 70, '12-2.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(279, 70, 'product-6.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(280, 70, 'lakatan.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(281, 71, 'sweet-potato.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(282, 71, 'yellow-corn.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(283, 71, '1.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(284, 71, '2.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(285, 72, 'sweet-potato.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(286, 72, 'coconut-peat.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(287, 72, 'tomato-catsup.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(288, 72, 'coconut-peat.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(289, 73, '2.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(290, 73, 'product-1.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(291, 73, '7.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(292, 73, 'ground-coffee.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(293, 74, '4.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(294, 74, '12.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(295, 74, '12.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(296, 74, 'coconut-milk.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(297, 75, 'cassava-flour.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(298, 75, 'product-5.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(299, 75, 'cabbage.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(300, 75, 'product-5.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(301, 76, '2.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(302, 76, '12.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(303, 76, 'cassava-flour.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(304, 76, '1.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(305, 77, 'sweet-potato.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(306, 77, '1.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(307, 77, '6.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(308, 77, 'senorita.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(309, 78, 'product-9.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(310, 78, 'senorita.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(311, 78, 'cavendish.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(312, 78, '7.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(313, 79, '4.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(314, 79, 'potato-2.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(315, 79, 'white-corn.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(316, 79, '12-1.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(317, 80, 'indian-mango.png', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(318, 80, 'product-3.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(319, 80, 'product-3.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(320, 80, 'product-1.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(321, 81, 'tobacco.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(322, 81, 'coffee-liberica.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(323, 81, 'onion.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(324, 81, 'coconut-milk.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(325, 82, 'tobacco.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(326, 82, '2.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(327, 82, 'product-7.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(328, 82, 'product-4.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(329, 83, 'sugarcane.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(330, 83, 'coffee-liberica.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(331, 83, 'bagasse.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(332, 83, '8.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(333, 84, 'ampalaya.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(334, 84, '4.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(335, 84, '4.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(336, 84, '12-1.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(337, 85, 'ground-coffee.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(338, 85, 'coffee-liberica.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(339, 85, 'cassava-flour.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(340, 85, 'product-3.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(341, 86, 'product-8.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(342, 86, 'cassava-flour.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(343, 86, 'coconut-milk.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(344, 86, 'product-7.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(345, 87, 'banana.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(346, 87, 'product-2.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(347, 87, 'bagasse.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(348, 87, '10.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(349, 88, '12-2.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(350, 88, 'ampalaya.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(351, 88, 'onion.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(352, 88, 'product-4.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(353, 89, 'sugarcane.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(354, 89, 'white-corn.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(355, 89, 'cabbage.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(356, 89, '12-1.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(357, 90, '2.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(358, 90, 'senorita.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(359, 90, '6.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(360, 90, 'coffee-arabica.png', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(361, 91, 'product-3.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(362, 91, 'product-3.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(363, 91, 'ampalaya.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(364, 91, 'product-4.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(365, 92, 'product-2.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(366, 92, '9.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(367, 92, 'cassava.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(368, 92, 'product-6.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(369, 93, 'coconut-peat.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(370, 93, 'yellow-corn.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(371, 93, 'lakatan.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(372, 93, 'sugarcane.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(373, 94, 'product-4.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(374, 94, 'ground-coffee.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(375, 94, 'sweet-potato.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(376, 94, '7.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(377, 95, 'product-5.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(378, 95, 'coconut-peat.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(379, 95, 'product-6.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(380, 95, '1.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(381, 96, 'coffee-liberica.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(382, 96, 'white-corn.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(383, 96, '2.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(384, 96, 'white-corn.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(385, 97, 'coconut-peat.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(386, 97, 'indian-mango.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(387, 97, 'product-7.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(388, 97, 'product-3.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(389, 98, '10.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(390, 98, 'cassava.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(391, 98, 'cassava-flour.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(392, 98, 'yellow-corn.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(393, 99, 'ground-coffee.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(394, 99, 'product-5.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(395, 99, 'product-6.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(396, 99, 'indian-mango.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(397, 100, 'sugarcane.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(398, 100, 'product-3.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(399, 100, 'coconut-peat.png', '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(400, 100, '4.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-03-16 11:05:29', '2022-03-16 11:05:29'),
(2, 'vendor', '2022-03-16 11:05:29', '2022-03-16 11:05:29'),
(3, 'customer', '2022-03-16 11:05:29', '2022-03-16 11:05:29');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pending', '2022-03-16 11:08:00', '2022-03-16 11:08:00'),
(2, 'Order Confirmed', '2022-03-16 11:08:00', '2022-03-16 11:08:00'),
(3, 'On The Way', '2022-03-16 11:08:00', '2022-03-16 11:08:00'),
(4, 'Delivered', '2022-03-16 11:08:00', '2022-03-16 11:08:00'),
(5, 'Cancelled', '2022-03-16 11:08:00', '2022-03-16 11:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `string_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `string_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'palay', 'Palay', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(2, 1, 'corn', 'Corn', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(3, 1, 'banana', 'Banana', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(4, 1, 'coconut', 'Coconut', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(5, 1, 'mango', 'Mango', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(6, 1, 'sugarcane', 'Sugarcane', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(7, 1, 'pineapple', 'Pineapple', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(8, 1, 'cassava', 'Cassava', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(9, 1, 'rubber', 'Rubber', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(10, 1, 'sweet-potato', 'Sweet Potato', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(11, 1, 'onion', 'Onion', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(12, 1, 'eggplant', 'Eggplant', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(13, 1, 'coffee', 'Coffee', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(14, 1, 'tobaccoo', 'Tobaccoo', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(15, 1, 'abaca', 'Abaca', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(16, 1, 'tomato', 'Tomato', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(17, 1, 'potato', 'Potato', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(18, 1, 'ampalaya', 'Ampalaya', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(19, 1, 'cabbage', 'Cabbage', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(20, 1, 'calamansi', 'Calamansi', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(21, 1, 'mongo', 'Mongo', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(22, 1, 'cacao', 'Cacao', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(23, 1, 'lanzonez', 'Lanzonez', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(24, 1, 'watermelon', 'Watermelon', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(25, 1, 'peanut', 'Peanut', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(26, 1, 'ginger', 'Ginger', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(27, 1, 'lettuce', 'Lettuce', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(28, 1, 'other-crops', 'Other Crops', '2022-03-16 11:05:53', '2022-03-16 11:05:53'),
(29, 2, 'hog', 'Hog', '2022-03-16 11:05:58', '2022-03-16 11:05:58'),
(30, 2, 'cattle', 'Cattle', '2022-03-16 11:05:58', '2022-03-16 11:05:58'),
(31, 2, 'carabo', 'Carabo', '2022-03-16 11:05:58', '2022-03-16 11:05:58'),
(32, 2, 'goat', 'Goat', '2022-03-16 11:05:58', '2022-03-16 11:05:58'),
(33, 2, 'dairy', 'Dairy', '2022-03-16 11:05:58', '2022-03-16 11:05:58'),
(34, 3, 'chicken', 'Chicken', '2022-03-16 11:06:01', '2022-03-16 11:06:01'),
(35, 3, 'chicken-eggs', 'Chicken Eggs', '2022-03-16 11:06:01', '2022-03-16 11:06:01'),
(36, 3, 'duck', 'Duck', '2022-03-16 11:06:01', '2022-03-16 11:06:01'),
(37, 3, 'duck-eggs', 'Duck Eggs', '2022-03-16 11:06:01', '2022-03-16 11:06:01'),
(38, 4, 'milkfish', 'milkFish', '2022-03-16 11:06:06', '2022-03-16 11:06:06'),
(39, 4, 'tilapia', 'Tilapia', '2022-03-16 11:06:06', '2022-03-16 11:06:06'),
(40, 4, 'tiger-prawn', 'Tiger Prawn', '2022-03-16 11:06:06', '2022-03-16 11:06:06'),
(41, 4, 'skipjack', 'Skipjack', '2022-03-16 11:06:06', '2022-03-16 11:06:06'),
(42, 4, 'roundscad', 'Roundscad', '2022-03-16 11:06:06', '2022-03-16 11:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `sub_subcategories`
--

CREATE TABLE `sub_subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `string_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_subcategories`
--

INSERT INTO `sub_subcategories` (`id`, `subcategory_id`, `string_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'milled-rice', 'Milled Rice', '2022-03-16 11:06:15', '2022-03-16 11:06:15'),
(2, 1, 'rice-husk', 'Rice Husk', '2022-03-16 11:06:15', '2022-03-16 11:06:15'),
(3, 1, 'rice-bran', 'Rice Bran', '2022-03-16 11:06:15', '2022-03-16 11:06:15'),
(4, 1, 'glutinous-rice-flour', 'Glutinous Rice Flour', '2022-03-16 11:06:15', '2022-03-16 11:06:15'),
(5, 2, 'white-corn', 'White Corn', '2022-03-16 11:06:18', '2022-03-16 11:06:18'),
(6, 2, 'yellow-corn', 'Yellow Corn', '2022-03-16 11:06:18', '2022-03-16 11:06:18'),
(7, 3, 'cavendish', 'Cavendish', '2022-03-16 11:06:22', '2022-03-16 11:06:22'),
(8, 3, 'lakatan', 'Lakatan', '2022-03-16 11:06:22', '2022-03-16 11:06:22'),
(9, 3, 'saba', 'Saba', '2022-03-16 11:06:22', '2022-03-16 11:06:22'),
(10, 3, 'señorita', 'Señorita', '2022-03-16 11:06:22', '2022-03-16 11:06:22'),
(11, 4, 'coconut-peat', 'Coconut Peat', '2022-03-16 11:06:26', '2022-03-16 11:06:26'),
(12, 4, 'coconut-milk', 'Coconut Milk', '2022-03-16 11:06:26', '2022-03-16 11:06:26'),
(13, 4, 'desiccated-coconut', 'Desiccated Coconut', '2022-03-16 11:06:26', '2022-03-16 11:06:26'),
(14, 4, 'coconut-juice', 'Coconut Juice', '2022-03-16 11:06:26', '2022-03-16 11:06:26'),
(15, 4, 'copra', 'Copra', '2022-03-16 11:06:26', '2022-03-16 11:06:26'),
(16, 4, 'coconut-shells', 'Coconut Shells', '2022-03-16 11:06:26', '2022-03-16 11:06:26'),
(17, 5, 'indian', 'indian', '2022-03-16 11:06:29', '2022-03-16 11:06:29'),
(18, 5, 'pico', 'pico', '2022-03-16 11:06:29', '2022-03-16 11:06:29'),
(19, 5, 'carabao', 'carabao', '2022-03-16 11:06:29', '2022-03-16 11:06:29'),
(20, 6, 'crane-tops', 'Crane Tops', '2022-03-16 11:06:33', '2022-03-16 11:06:33'),
(21, 6, 'bagasse', 'Bagasse', '2022-03-16 11:06:33', '2022-03-16 11:06:33'),
(22, 6, 'molasses', 'Molasses', '2022-03-16 11:06:33', '2022-03-16 11:06:33'),
(23, 7, 'fresh-pineapple', 'Fresh Pineapple', '2022-03-16 11:06:36', '2022-03-16 11:06:36'),
(24, 7, 'pineapple-candy', 'Pineapple Candy', '2022-03-16 11:06:36', '2022-03-16 11:06:36'),
(25, 7, 'pineapple-chunks', 'Pineapple Chunks', '2022-03-16 11:06:36', '2022-03-16 11:06:36'),
(26, 7, 'pineapple-slices', 'Pineapple Slices', '2022-03-16 11:06:36', '2022-03-16 11:06:36'),
(27, 7, 'pineapple-juice', 'Pineapple Juice', '2022-03-16 11:06:36', '2022-03-16 11:06:36'),
(28, 8, 'raw-cassava', 'Raw Cassava', '2022-03-16 11:06:40', '2022-03-16 11:06:40'),
(29, 8, 'cassava-chips', 'Cassava Chips', '2022-03-16 11:06:40', '2022-03-16 11:06:40'),
(30, 8, 'cassava-starch', 'Cassava Starch', '2022-03-16 11:06:40', '2022-03-16 11:06:40'),
(31, 8, 'cassava-flour', 'Cassava Flour', '2022-03-16 11:06:40', '2022-03-16 11:06:40'),
(32, 10, 'raw-sweet-potato', 'Raw Sweet Potato', '2022-03-16 11:06:43', '2022-03-16 11:06:43'),
(33, 10, 'sweet-potato-chips', 'Swwet Potato Chips', '2022-03-16 11:06:43', '2022-03-16 11:06:43'),
(34, 13, 'arabica', 'arabica', '2022-03-16 11:06:51', '2022-03-16 11:06:51'),
(35, 13, 'excelsa', 'excelsa', '2022-03-16 11:06:51', '2022-03-16 11:06:51'),
(36, 13, 'liberica', 'liberica', '2022-03-16 11:06:51', '2022-03-16 11:06:51'),
(37, 13, 'robusta', 'robusta', '2022-03-16 11:06:51', '2022-03-16 11:06:51'),
(38, 13, 'drip-coffee', 'Drip Coffee', '2022-03-16 11:06:51', '2022-03-16 11:06:51'),
(39, 13, 'ground-coffee', 'Ground Coffee', '2022-03-16 11:06:51', '2022-03-16 11:06:51'),
(40, 13, 'roasted-beans', 'Roasted Beans', '2022-03-16 11:06:51', '2022-03-16 11:06:51'),
(41, 13, 'instant-coffee', 'Instant Coffee', '2022-03-16 11:06:51', '2022-03-16 11:06:51'),
(42, 16, 'fresh-tomato', 'Fresh Tomato', '2022-03-16 11:06:54', '2022-03-16 11:06:54'),
(43, 16, 'tomato-paste', 'Tomato Paste', '2022-03-16 11:06:54', '2022-03-16 11:06:54'),
(44, 16, 'tomato-catsup', 'Tomato Catsup', '2022-03-16 11:06:54', '2022-03-16 11:06:54'),
(45, 16, 'dried-tomatoes', 'Dried Tomatoes', '2022-03-16 11:06:54', '2022-03-16 11:06:54'),
(46, 17, 'raw-potato', 'Raw Potato', '2022-03-16 11:06:58', '2022-03-16 11:06:58'),
(47, 17, 'potato-chips', 'Potato Chips', '2022-03-16 11:06:58', '2022-03-16 11:06:58'),
(48, 19, 'cabbage-rolls', 'Cabbage Rolls', '2022-03-16 11:07:01', '2022-03-16 11:07:01'),
(49, 20, 'calamansi-fruit', 'Calamansi Fruit', '2022-03-16 11:07:05', '2022-03-16 11:07:05'),
(50, 20, 'calamansi-juice', 'Calamansi Juice', '2022-03-16 11:07:05', '2022-03-16 11:07:05'),
(51, 20, 'calamansi-puree', 'Calamansi Puree', '2022-03-16 11:07:05', '2022-03-16 11:07:05'),
(52, 21, 'mungbean-cake', 'Mungbean Cake', '2022-03-16 11:07:11', '2022-03-16 11:07:11'),
(53, 21, 'mungbean-noodles', 'Mungbean Noodles', '2022-03-16 11:07:11', '2022-03-16 11:07:11'),
(54, 21, 'mungbean-wine', 'Mungbean Wine', '2022-03-16 11:07:11', '2022-03-16 11:07:11'),
(55, 21, 'mungbean-paste', 'Mungbean Paste', '2022-03-16 11:07:11', '2022-03-16 11:07:11'),
(56, 22, 'tablea', 'tablea', '2022-03-16 11:07:14', '2022-03-16 11:07:14'),
(57, 22, 'coconut-butter', 'Coconut Butter', '2022-03-16 11:07:14', '2022-03-16 11:07:14'),
(58, 22, 'coconut-nibs', 'Coconut Nibs', '2022-03-16 11:07:14', '2022-03-16 11:07:14'),
(59, 22, 'coconut-powder', 'Coconut Powder', '2022-03-16 11:07:14', '2022-03-16 11:07:14'),
(60, 22, 'chocolate', 'Chocolate', '2022-03-16 11:07:14', '2022-03-16 11:07:14'),
(61, 25, 'raw-peanuts', 'Raw Peanuts', '2022-03-16 11:07:19', '2022-03-16 11:07:19'),
(62, 25, 'salted-peanuts', 'Salted Peanuts', '2022-03-16 11:07:19', '2022-03-16 11:07:19'),
(63, 29, 'ears', 'Ears', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(64, 29, 'head', 'head', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(65, 29, 'neck', 'neck', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(66, 29, 'shoulder', 'shoulder', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(67, 29, 'loin', 'loin', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(68, 29, 'tenderloin', 'tenderloin', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(69, 29, 'ribs', 'ribs', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(70, 29, 'belly', 'belly', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(71, 29, 'leg', 'leg', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(72, 29, 'hock', 'hock', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(73, 29, 'knuckle', 'knuckle', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(74, 29, 'pork-ham', 'pork ham', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(75, 29, 'offal-and-edible-viscera', 'Offal and Edible Viscera', '2022-03-16 11:07:23', '2022-03-16 11:07:23'),
(76, 30, 'beef', 'beef', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(77, 30, 'chuck', 'chuck', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(78, 30, 'beef-brisket', 'beef brisket', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(79, 30, 'beef-shank', 'beef shank', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(80, 30, 'beef-rib', 'beef rib', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(81, 30, 'short rib', 'short-rib', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(82, 30, 'beef-plate', 'beef plate', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(83, 30, 'short-loin', 'short loin', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(84, 30, 'sirloin', 'sirloin', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(85, 30, 'tenderloin', 'tenderloin', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(86, 30, 'rump', 'rump', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(87, 30, 'round', 'round', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(88, 30, 'beef-ham', 'beef ham', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(89, 30, 'offal-and-edible-viscera', 'Offal and Edible Viscera', '2022-03-16 11:07:28', '2022-03-16 11:07:28'),
(90, 31, 'chuck', 'chuck', '2022-03-16 11:07:32', '2022-03-16 11:07:32'),
(91, 31, 'brisket', 'brisket', '2022-03-16 11:07:32', '2022-03-16 11:07:32'),
(92, 31, 'shank', 'shank', '2022-03-16 11:07:32', '2022-03-16 11:07:32'),
(93, 31, 'beef-plate', 'beef plate', '2022-03-16 11:07:32', '2022-03-16 11:07:32'),
(94, 31, 'short-loin', 'short loin', '2022-03-16 11:07:32', '2022-03-16 11:07:32'),
(95, 31, 'tenderloin', 'tenderloin', '2022-03-16 11:07:32', '2022-03-16 11:07:32'),
(96, 31, 'rump', 'rump', '2022-03-16 11:07:32', '2022-03-16 11:07:32'),
(97, 31, 'round', 'round', '2022-03-16 11:07:32', '2022-03-16 11:07:32'),
(98, 32, 'neck', 'neck', '2022-03-16 11:07:36', '2022-03-16 11:07:36'),
(99, 32, 'leg', 'leg', '2022-03-16 11:07:36', '2022-03-16 11:07:36'),
(100, 32, 'loin', 'loin', '2022-03-16 11:07:36', '2022-03-16 11:07:36'),
(101, 32, 'rib', 'rib', '2022-03-16 11:07:36', '2022-03-16 11:07:36'),
(102, 32, 'shoulder', 'shoulder', '2022-03-16 11:07:36', '2022-03-16 11:07:36'),
(103, 32, 'shank', 'shank', '2022-03-16 11:07:36', '2022-03-16 11:07:36'),
(104, 32, 'breast', 'breast', '2022-03-16 11:07:36', '2022-03-16 11:07:36'),
(105, 32, 'fresh-milk', 'fresh milk', '2022-03-16 11:07:36', '2022-03-16 11:07:36'),
(106, 32, 'cheese', 'cheese', '2022-03-16 11:07:36', '2022-03-16 11:07:36'),
(107, 33, 'fresh-milk', 'Fresh Milk', '2022-03-16 11:07:39', '2022-03-16 11:07:39'),
(108, 33, 'cheese', 'Cheese', '2022-03-16 11:07:39', '2022-03-16 11:07:39'),
(109, 34, 'chicken-breast', 'chicken breast', '2022-03-16 11:07:43', '2022-03-16 11:07:43'),
(110, 34, 'chicken-feet', 'chicken feet', '2022-03-16 11:07:43', '2022-03-16 11:07:43'),
(111, 34, 'chicken-neck', 'chicken neck', '2022-03-16 11:07:43', '2022-03-16 11:07:43'),
(112, 34, 'gizzard', 'gizzard', '2022-03-16 11:07:43', '2022-03-16 11:07:43'),
(113, 34, 'intestine', 'intestine', '2022-03-16 11:07:43', '2022-03-16 11:07:43'),
(114, 34, 'chicken-thigh', 'chicken thigh', '2022-03-16 11:07:43', '2022-03-16 11:07:43'),
(115, 34, 'chicken-drumstick', 'chicken drumstick', '2022-03-16 11:07:43', '2022-03-16 11:07:43'),
(116, 34, 'chicken-wings', 'chicken wings', '2022-03-16 11:07:43', '2022-03-16 11:07:43'),
(117, 34, 'liver', 'liver', '2022-03-16 11:07:43', '2022-03-16 11:07:43'),
(118, 37, 'salted-egg', 'salted egg', '2022-03-16 11:07:47', '2022-03-16 11:07:47'),
(119, 37, 'balut', 'balut', '2022-03-16 11:07:47', '2022-03-16 11:07:47'),
(120, 37, 'penoy', 'penoy', '2022-03-16 11:07:47', '2022-03-16 11:07:47'),
(121, 38, 'dried', 'dried', '2022-03-16 11:07:51', '2022-03-16 11:07:51'),
(122, 38, 'smoked', 'smoked', '2022-03-16 11:07:51', '2022-03-16 11:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Unique McCullough', 'yesenia.langworth@example.net', '2022-07-06 10:29:31', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hEnVSv89UlUrdwCjCkXFgjNjATjZUTdo3qijhvJXOWW32YPey4aWsLtitqa6', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(2, 'Mr. Agustin Gleason IV', 'otto.quigley@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(3, 'Prof. Denis Volkman', 'kurtis.renner@example.org', '2022-09-25 01:54:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Dy1ts0K9waQSD2pDHUoPyjASYTrFpnUyGr84QhsgMXheLel712cAQ6wO4rEQ', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(4, 'Lonzo Kling', 'anne.spencer@example.net', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(5, 'Tyrel Koepp', 'jameson93@example.net', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(6, 'Katelynn Deckow DDS', 'willms.edwin@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(7, 'Alberto Walker', 'earnest.orn@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(8, 'Yoshiko McClure', 'schaefer.ray@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(9, 'Jed Blanda', 'julius.miller@example.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(10, 'Joshuah Ward', 'mbrekke@example.net', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(17, 'Syllvester Stallone', 'hanyione09@gmail.com', NULL, '$2y$10$6HUmcKU3NxZVlv6KdY.diuJDsXxOvP8LXA0V3jPrG2OgfwDsPPwL.', 'tC7bu90l9Z1F23nTiukejvrBelmEumuCn4s5V8fHK3bOPIKjmnoJOaMJhy60', '2022-07-06 08:29:24', '2022-07-06 08:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `user_information`
--

CREATE TABLE `user_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`id`, `user_id`, `shop_name`, `description`, `location`, `phone`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'mollitia quia', 'dolor delectus eaque veniam possimus omnis a explicabo qui ullam et ut aut illo non qui officia similique voluptas dolorem libero totam officia rem quod dolor vitae quos totam in dolor est possimus deserunt sit ut quibusdam aut doloremque deleniti repudiandae odio enim accusamus vel nemo sequi praesentium reprehenderit fuga velit porro aperiam qui sunt id id cum rem optio dolores voluptatum impedit repellat aut sapiente sit asperiores quis atque quas amet delectus ea doloremque in iure quia unde aliquid', '19367 Fredrick Dam Apt. 989', '+1-941-202-3070', 'avatar1.jpg', '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(2, 2, 'suscipit sed veniam', 'maiores laborum labore quo incidunt ut distinctio quo sint et est ad exercitationem error assumenda facere consequuntur labore velit doloribus fuga qui qui quo tempore esse cupiditate et expedita fugit libero at debitis ut debitis assumenda provident enim maiores veniam nihil deleniti quibusdam laborum harum magni ut corporis quidem in aliquam culpa sunt quo sit voluptatem eum tempore earum ullam sapiente rerum nisi et omnis iste explicabo ipsa earum cupiditate non sit voluptas unde accusamus aspernatur ad autem ratione accusamus', '8110 Dibbert Rest', '+1.424.376.1512', 'avatar1.jpg', '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(3, 3, 'commodi', 'possimus ex in omnis ut temporibus omnis dolor rerum minima ut asperiores consequuntur animi vel quisquam dicta esse dolore pariatur qui provident et dolores aut nihil itaque quia voluptatem expedita dolores et hic amet corporis ipsam dolorum voluptas dolorem quas magnam exercitationem in voluptas quae fugit reprehenderit vero magnam suscipit facere quaerat rerum blanditiis vitae laboriosam minima est hic quis dolorem atque quaerat consectetur magnam fuga eos dignissimos aut tempora eum sapiente sed optio ducimus rerum sint dicta expedita est', '872 Mills Pike', '541.876.8409', 'avatar1.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(4, 4, 'quibusdam sed voluptatibus', 'est error aliquid quo explicabo tempora fuga ut aut recusandae voluptas iure sunt asperiores delectus excepturi consectetur esse fugit aut dolore blanditiis maiores asperiores at et maxime eius suscipit et reiciendis quis eos quidem nulla ea illo est in consequatur voluptas molestiae tenetur et et odit ut consectetur sunt est est aperiam cum occaecati id alias in ab magnam autem excepturi non quam ut officia quis aliquid assumenda porro sed sit maxime quam sint placeat aut reiciendis odio exercitationem enim', '947 Daugherty Harbors', '+1-734-732-0742', 'avatar1.jpg', '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(5, 5, 'modi et', 'maiores enim id illum mollitia tenetur temporibus in et et inventore sit est sed numquam sint quo quasi delectus qui sint iure reiciendis quo nihil quidem et deserunt assumenda vitae qui nesciunt nihil id rerum accusamus perferendis veniam voluptatem laudantium voluptas quasi facere repellat molestiae iusto totam ea rerum iste et repellendus facilis voluptatem modi et omnis laudantium voluptas vel architecto qui a quo voluptatem tenetur dolor enim unde asperiores iusto qui harum iusto qui porro est nemo eaque qui', '964 Vanessa Landing', '(325) 202-0266', 'avatar1.jpg', '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(6, 6, 'veritatis rem', 'explicabo ab est ut nihil molestiae fuga possimus dignissimos saepe laudantium et neque aperiam optio consectetur ut hic vitae dolorem facilis consequuntur voluptatem nobis blanditiis architecto aut doloribus pariatur molestiae ex assumenda aut in magni unde culpa quis nihil praesentium et enim soluta fuga ut sunt qui quo quo maiores error et qui voluptatibus illum molestias tempore iure ratione ea nisi architecto iste aspernatur vel vel quia dolores repellat et recusandae totam omnis mollitia repudiandae qui officia similique explicabo sunt', '846 Graham Ferry', '(248) 930-8268', 'avatar1.jpg', '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(7, 7, 'unde harum maxime nihil', 'expedita explicabo accusamus ut exercitationem nemo fugit provident quos nemo aut reprehenderit non eius corrupti officiis dolorem repudiandae quia dolores quis et blanditiis et libero nemo natus aut velit ullam autem eos laboriosam et tenetur et optio laborum provident velit ea magni nihil nesciunt est tempore deserunt aperiam beatae laborum in odio in sint aperiam eos vitae dolores consequatur sunt dolores et vero autem quod dignissimos qui veritatis est aspernatur aut nostrum aut quisquam sit officia beatae reiciendis saepe eum', '54456 Valentine Track', '754-751-4922', 'avatar1.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(8, 8, 'eveniet deleniti', 'alias soluta sit numquam aut dolor facilis molestiae repellat ducimus dignissimos suscipit ut voluptas eveniet consectetur molestiae laborum dolor et dolor maxime doloremque blanditiis nobis reprehenderit ratione eum eum ratione beatae nostrum consequatur quisquam rem quod recusandae commodi rerum temporibus suscipit magni autem est quam et sequi voluptates libero ex laboriosam velit voluptas sed fugiat eum in inventore eius quia voluptatibus et quam et sunt fuga voluptatem dolorem culpa et et quasi magnam dolorum et voluptas cum sed ipsa voluptatem', '746 Collins Park Apt. 181', '423-215-8147', 'avatar1.jpg', '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(9, 9, 'inventore', 'dolor dignissimos dolore voluptatum nihil quis quaerat voluptate optio consequatur neque ea est officiis laborum tempora omnis ea repudiandae sit repellendus voluptatum consequatur harum est voluptatum suscipit nisi nesciunt minus numquam itaque consequuntur et est qui quis ex ut ratione laborum praesentium eos officia quia omnis quisquam explicabo dolor ab totam sunt rerum delectus qui repudiandae minima id illo ipsa delectus perferendis est velit esse omnis ea id et possimus velit omnis ducimus quaerat placeat id porro libero omnis nulla', '3806 Ullrich Isle Suite 394', '520.515.2598', 'avatar1.jpg', '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(10, 10, 'quo', 'qui facere amet pariatur eligendi et dolore eveniet est est earum est amet id cumque et id quia veritatis deleniti quis facere earum itaque nihil tenetur accusamus officia quibusdam earum eum omnis esse quis enim vero et numquam debitis ab rerum possimus blanditiis eum qui ducimus cum dolor qui repellendus quasi fugit minus voluptates dolore maxime ratione ad ut laborum nihil ipsam reprehenderit omnis consequuntur laboriosam repellat cum nihil magnam natus eum laudantium commodi dolores optio quia veritatis repudiandae quaerat', '6626 Brenna Mills', '(940) 259-2676', 'avatar1.jpg', '2022-07-05 12:51:33', '2022-07-05 12:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2022-07-05 12:51:22', '2022-07-05 12:51:22'),
(2, 2, 2, '2022-07-05 12:51:24', '2022-07-05 12:51:24'),
(3, 3, 2, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(4, 4, 2, '2022-07-05 12:51:26', '2022-07-05 12:51:26'),
(5, 5, 2, '2022-07-05 12:51:27', '2022-07-05 12:51:27'),
(6, 6, 2, '2022-07-05 12:51:30', '2022-07-05 12:51:30'),
(7, 7, 2, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(8, 8, 2, '2022-07-05 12:51:31', '2022-07-05 12:51:31'),
(9, 9, 2, '2022-07-05 12:51:32', '2022-07-05 12:51:32'),
(10, 10, 2, '2022-07-05 12:51:33', '2022-07-05 12:51:33'),
(12, 17, 3, '2022-07-06 08:29:24', '2022-07-06 08:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_transactions`
--

CREATE TABLE `vendor_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_transactions`
--

INSERT INTO `vendor_transactions` (`id`, `group_order_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-09-25 01:48:24', '2022-09-25 01:48:24'),
(2, 2, 3, '2022-09-25 01:48:30', '2022-09-25 01:48:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_user_id_foreign` (`user_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `featured_products`
--
ALTER TABLE `featured_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `featured_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `group_orders`
--
ALTER TABLE `group_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_orders_user_id_foreign` (`user_id`),
  ADD KEY `group_orders_status_id_foreign` (`status_id`);

--
-- Indexes for table `group_order_billing_details`
--
ALTER TABLE `group_order_billing_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_order_billing_details_group_order_id_foreign` (`group_order_id`);

--
-- Indexes for table `group_order_items`
--
ALTER TABLE `group_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_order_items_group_order_id_foreign` (`group_order_id`),
  ADD KEY `group_order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `group_order_item_status`
--
ALTER TABLE `group_order_item_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_order_item_status_group_order_item_id_foreign` (`group_order_item_id`),
  ADD KEY `group_order_item_status_status_id_foreign` (`status_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`),
  ADD KEY `product_categories_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `product_categories_sub_subcategory_id_foreign` (`sub_subcategory_id`);

--
-- Indexes for table `product_photos`
--
ALTER TABLE `product_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_photos_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `sub_subcategories`
--
ALTER TABLE `sub_subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_subcategories_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_information`
--
ALTER TABLE `user_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_information_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_roles_user_id_foreign` (`user_id`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `vendor_transactions`
--
ALTER TABLE `vendor_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_transactions_group_order_id_foreign` (`group_order_id`),
  ADD KEY `vendor_transactions_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `featured_products`
--
ALTER TABLE `featured_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_orders`
--
ALTER TABLE `group_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_order_billing_details`
--
ALTER TABLE `group_order_billing_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_order_items`
--
ALTER TABLE `group_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_order_item_status`
--
ALTER TABLE `group_order_item_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `product_photos`
--
ALTER TABLE `product_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `sub_subcategories`
--
ALTER TABLE `sub_subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_information`
--
ALTER TABLE `user_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vendor_transactions`
--
ALTER TABLE `vendor_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `featured_products`
--
ALTER TABLE `featured_products`
  ADD CONSTRAINT `featured_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_orders`
--
ALTER TABLE `group_orders`
  ADD CONSTRAINT `group_orders_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `group_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_order_billing_details`
--
ALTER TABLE `group_order_billing_details`
  ADD CONSTRAINT `group_order_billing_details_group_order_id_foreign` FOREIGN KEY (`group_order_id`) REFERENCES `group_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_order_items`
--
ALTER TABLE `group_order_items`
  ADD CONSTRAINT `group_order_items_group_order_id_foreign` FOREIGN KEY (`group_order_id`) REFERENCES `group_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `group_order_item_status`
--
ALTER TABLE `group_order_item_status`
  ADD CONSTRAINT `group_order_item_status_group_order_item_id_foreign` FOREIGN KEY (`group_order_item_id`) REFERENCES `group_order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_order_item_status_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_sub_subcategory_id_foreign` FOREIGN KEY (`sub_subcategory_id`) REFERENCES `sub_subcategories` (`id`),
  ADD CONSTRAINT `product_categories_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`);

--
-- Constraints for table `product_photos`
--
ALTER TABLE `product_photos`
  ADD CONSTRAINT `product_photos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_subcategories`
--
ALTER TABLE `sub_subcategories`
  ADD CONSTRAINT `sub_subcategories_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_information`
--
ALTER TABLE `user_information`
  ADD CONSTRAINT `user_information_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_transactions`
--
ALTER TABLE `vendor_transactions`
  ADD CONSTRAINT `vendor_transactions_group_order_id_foreign` FOREIGN KEY (`group_order_id`) REFERENCES `group_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
