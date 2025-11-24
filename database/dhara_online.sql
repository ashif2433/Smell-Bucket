-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2025 at 12:11 PM
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
-- Database: `dhara_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_settings`
--

CREATE TABLE `all_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `d_charge_inside_dhaka` decimal(8,2) NOT NULL DEFAULT 0.00,
  `d_charge_outside_dhaka` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `all_settings`
--

INSERT INTO `all_settings` (`id`, `d_charge_inside_dhaka`, `d_charge_outside_dhaka`, `created_at`, `updated_at`) VALUES
(1, 70.00, 150.00, '2024-10-19 04:15:00', '2025-05-05 04:16:45');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `serial` int(11) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `name`, `serial`, `link`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Home Banner 01', 1, '/product-category/3', 'uploads/20250505050156_788059.jpg', 'active', '2024-10-13 18:11:20', '2025-05-04 23:01:56', NULL),
(11, 'Three Pice', 2, '/product-category/2', 'uploads/20250505050100_942789.jpg', 'active', '2025-04-20 00:49:22', '2025-05-04 23:01:00', NULL),
(12, 'Family Combo', 3, '/product-category/1', 'uploads/20250505050118_672578.jpg', 'active', '2025-04-20 00:49:36', '2025-05-04 23:01:18', NULL),
(13, 'test', 4, '/product-category/4', 'uploads/20250505050216_165659.jpg', 'active', '2025-05-04 22:51:46', '2025-05-04 23:02:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dresses', 'dresses', 'active', '2024-10-19 01:25:03', '2024-10-19 01:28:28'),
(2, 'All About Clothing', 'all-about-clothing', 'active', '2024-10-19 01:26:28', '2024-10-19 01:26:28'),
(3, 'Make Up & Beauty', 'make-up-beauty', 'active', '2024-10-19 01:28:46', '2024-10-19 01:28:46'),
(4, 'Accessories', 'accessories', 'active', '2024-10-19 01:29:01', '2024-10-19 01:29:10'),
(5, 'Fashion Trends', 'fashion-trends', 'active', '2024-10-19 01:29:22', '2024-10-19 01:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `blog_contents`
--

CREATE TABLE `blog_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `blog_contents`
--

INSERT INTO `blog_contents` (`id`, `blog_category_id`, `title`, `slug`, `description`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Harum corrupti nost', 'harum-corrupti-nost', '<p>To be&nbsp;<strong>plausible</strong>, the descriptive writer has to constrain the concrete, evocative image to suit the reader&rsquo;s knowledge and attention span. &ldquo;Her eyes were brighter than the sapphires in the armrests of the Tipu Sultan&rsquo;s golden throne, yet sharper than the tulwars of his cruelest executioners&rdquo; will have the reader checking their phone halfway through. &ldquo;Her eyes were sapphires, bright and hard&rdquo; creates the same effect in a fraction of the reading time. As always in the craft of writing: when in doubt, write less.</p>', 'uploads/20241018205138_636664.jpg', 'active', '2024-10-19 01:51:38', '2024-10-19 02:10:57', NULL),
(2, 4, 'Consequatur delenit', 'consequatur-delenit', '<p>The idiosyncrasy of this town is smoke. It rolls sullenly in slow folds from the great chimneys of the iron-foundries, and settles down in black, slimy pools on the muddy streets. Smoke on the wharves, smoke on the dingy boats, on the yellow river--clinging in a coating of greasy soot to the house-front, the two faded poplars, the faces of the passers-by.</p>', 'uploads/20241018211133_618228.jpg', 'active', '2024-10-19 02:11:33', '2024-10-19 02:11:33', NULL),
(3, 2, 'Alias molestias quia', 'alias-molestias-quia', '<p>&quot;The idiosyncrasy of this town is smoke. It rolls sullenly in slow folds from the great chimneys of the iron-foundries, and settles down in black, slimy pools on the muddy streets. Smoke on the wharves, smoke on the dingy boats, on the yellow river--clinging in a coating of greasy soot to the house-front, the two faded poplars, the faces of the passers-by.&quot;</p>', 'uploads/20241018211151_123081.jpg', 'active', '2024-10-19 02:11:51', '2024-10-19 02:11:51', NULL),
(4, 3, 'Ex qui eiusmod possi', 'ex-qui-eiusmod-possi', '<p>&quot;The idiosyncrasy of this town is smoke. It rolls sullenly in slow folds from the great chimneys of the iron-foundries, and settles down in black, slimy pools on the muddy streets. Smoke on the wharves, smoke on the dingy boats, on the yellow river--clinging in a coating of greasy soot to the house-front, the two faded poplars, the faces of the passers-by.&quot;</p>', 'uploads/20241018211209_177646.jpg', 'inactive', '2024-10-19 02:12:09', '2024-10-19 02:12:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `create_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `create_by`, `created_at`, `updated_at`) VALUES
(1, 'demo', 'demo', 'active', 7, '2024-01-16 22:51:57', '2025-04-20 01:33:36');

-- --------------------------------------------------------

--
-- Table structure for table `btobs`
--

CREATE TABLE `btobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `btobs`
--

INSERT INTO `btobs` (`id`, `details`, `created_at`, `updated_at`) VALUES
(1, 'B2B refers to commercial transactions between two businesses, rather than between a business and an individual consumer (which is B2C). In B2B transactions, the buyer is a business purchasing goods or services for its operations, rather than an end consumer purchasing for personal use.', '2025-04-20 06:10:12', '2025-04-20 06:19:43'),
(3, 'B2B marketing is distinct because businesses typically make decisions based on logic, ROI (return on investment), and long-term value. Unlike B2C, which often focuses on emotional appeal, B2B marketing involves building trust, proving value, and cultivating relationships.', '2025-04-20 06:20:05', '2025-04-20 06:20:05'),
(4, 'Increased Use of AI and Automation: Many B2B companies are turning to artificial intelligence to enhance their customer service, automate lead generation, and improve the customer experience.\r\n\r\nRemote Sales and Virtual Engagement: Due to the pandemic, remote selling has become the norm, with virtual meetings and online presentations replacing face-to-face interactions.\r\n\r\nPersonalization: B2B marketing is becoming more personalized, focusing on the needs of individual businesses rather than one-size-fits-all solutions.', '2025-04-20 06:20:21', '2025-04-20 06:20:21');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `root` int(11) NOT NULL DEFAULT 0,
  `lavel` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `home_category` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `create_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `root`, `lavel`, `name`, `slug`, `image`, `home_category`, `status`, `create_by`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Family Combo', 'family-combo', 'uploads/20250504112529_524863.jpg', 'active', 'active', 4, '2024-01-16 22:51:57', '2025-05-04 05:25:29'),
(2, 0, NULL, 'Three Pice', 'three-pice', 'uploads/20250504112651_893742.jpg', 'active', 'active', 4, '2024-01-16 22:51:57', '2025-05-04 05:26:51'),
(3, 0, NULL, 'Saree', 'saree', 'uploads/20250504112750_961655.jpg', 'active', 'active', 4, '2024-01-16 22:51:57', '2025-05-04 05:27:50'),
(4, 0, NULL, 'Panjabi', 'panjabi', 'uploads/20250504112832_405373.jpg', 'active', 'active', 4, '2024-01-16 22:51:57', '2025-05-04 05:28:32'),
(5, 0, NULL, 'Baby Product', 'baby-product', 'uploads/20250504113221_923531.jpg', 'active', 'active', 4, '2024-01-16 22:51:57', '2025-05-04 05:32:21');

-- --------------------------------------------------------

--
-- Table structure for table `client_reviews`
--

CREATE TABLE `client_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `review` text NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `client_reviews`
--

INSERT INTO `client_reviews` (`id`, `name`, `designation`, `review`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'home text customer', 'Manager', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.', 'uploads/20250420085433_576554.jpg', 'active', '2024-10-18 21:31:36', '2025-04-20 02:55:21', NULL),
(2, 'Chaim Hogan', 'Ab in nostrud volupt', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 'uploads/20250420094608_825727.jpg', 'active', '2024-10-18 21:40:02', '2025-04-20 03:46:08', NULL),
(3, 'Oren Grant', 'Incidunt voluptatem', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 'uploads/20250420094745_464008.jpg', 'active', '2024-10-18 21:40:13', '2025-04-20 03:47:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Green', '#00db04', 'active', '2018-11-05 14:12:26', '2024-10-12 16:29:58'),
(2, 'blue', '#00b3ff', 'active', '2018-11-05 14:12:26', '2024-10-12 16:30:29'),
(3, 'Black', '#000000', 'active', '2018-11-05 14:12:26', '2024-10-12 16:30:45'),
(4, 'DarkSalmon', '#E9967A', 'active', '2018-11-05 14:12:26', '2018-11-05 14:12:26'),
(5, 'LightSalmon', '#FFA07A', 'active', '2018-11-05 14:12:26', '2018-11-05 14:12:26'),
(6, 'Crimson', '#DC143C', 'active', '2018-11-05 14:12:26', '2018-11-05 14:12:26'),
(7, 'Red', '#FF0000', 'active', '2018-11-05 14:12:26', '2018-11-05 14:12:26'),
(8, 'FireBrick', '#B22222', 'active', '2018-11-05 14:12:26', '2018-11-05 14:12:26'),
(9, 'DarkRed', '#8B0000', 'active', '2018-11-05 14:12:26', '2018-11-05 14:12:26'),
(10, 'Pink', '#FFC0CB', 'active', '2018-11-05 14:12:26', '2018-11-05 14:12:26'),
(145, 'Navy Blue', '#000080', 'active', '2024-11-01 09:06:06', '2024-11-01 09:06:06'),
(146, 'merun', '#6c1313', 'active', '2025-01-08 23:31:04', '2025-01-08 23:31:04');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` varchar(191) DEFAULT NULL,
  `offer_mail` tinyint(1) NOT NULL DEFAULT 0,
  `referral_code` varchar(191) DEFAULT NULL,
  `referral_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `referral_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `address3` text DEFAULT NULL,
  `address4` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `address`, `offer_mail`, `referral_code`, `referral_balance`, `referral_by`, `created_at`, `updated_at`, `address2`, `address3`, `address4`) VALUES
(55, 'Jarif Khan', 'ok@gmail.com', '$2y$12$erNb3YxffqJVu8qdn4VBTuKYQSxyN0R0IHfIzrjaNNji/xjQBNxeq', '01926189960', NULL, 1, 'jarifkhanxuxmr', 0.00, NULL, '2025-03-11 08:46:04', '2025-03-11 08:46:04', NULL, NULL, NULL),
(56, 'demo', 'demouser@gmail.com', '$2y$12$aa02Hq95s.s134KTKrtgeuPSEbhay/8iPpwkRLZ6gTxtPvGe/2896', '01751166123', NULL, 1, 'demo66tfx', 41.00, NULL, '2025-03-16 23:59:47', '2025-04-08 23:53:18', 'uttara bns', 'Uttara 17, beside world university', NULL),
(57, 'Md Monir HOSSAIN', 'Rajibhossain386@gmail.com', '$2y$12$trdTiGs7oyI/VUj6995rHObhPgGuVNZVjQN9X7XLNG8.xdI9d3hjS', '01335776415', NULL, 1, 'mdmonirhossainpl2bf', 0.00, NULL, '2025-03-22 12:12:55', '2025-03-22 12:12:55', NULL, NULL, NULL),
(58, 'jakariya sabbir', 'sabbirjakaria8@gmail.com', '$2y$12$W.DKJJJqeN7KPkloypWNs.IigBil401KNGnKDx0E4xSj05K/IhiSW', '01752247030', NULL, 1, 'jakariyasabbirbqari', 0.00, NULL, '2025-03-25 20:36:23', '2025-03-25 20:36:23', NULL, NULL, NULL),
(60, 'demotwo', 'demouser2@gmail.com', '$2y$12$D0rS10t3EkRqCBCTeNJrhep0evLuA2ma67x1PgrDFGvvKcirLmW4i', '01751166124', NULL, 1, 'demotwotfosg', 82.00, 56, '2025-04-08 23:46:35', '2025-04-08 23:53:18', NULL, NULL, NULL),
(61, 'demouserthree', 'demouser3@gmail.com', '$2y$12$MZ33/q6hECsqHC6sWdSNRuWilsTR/yVyUR4xDr4c9vVBTtfxHlLye', '01751155245', NULL, 1, 'demouserthreed5ylz', 137.00, 60, '2025-04-08 23:49:08', '2025-04-08 23:53:18', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(40) NOT NULL,
  `division` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `thana` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `default_address` tinyint(4) NOT NULL DEFAULT 0,
  `shipping_address` tinyint(4) NOT NULL DEFAULT 0,
  `billing_address` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'Q: How long does delivery take?', 'A: Standard shipping usually takes 2–3 business days. Expedited options are available at checkout.', '2025-04-06 04:08:56', '2025-04-09 12:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `serial` int(11) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `name`, `serial`, `link`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Casey Mays', 3, '/product-category/1', 'uploads/20250504084549_224746.png', 'active', '2024-10-13 19:02:32', '2025-05-04 05:55:20', NULL),
(2, 'Doris Mcgee', 2, '/product-category/2', 'uploads/20250505114952_947443.png', 'active', '2024-10-13 19:02:47', '2025-05-05 05:49:52', NULL),
(3, 'Gail Mccray', 1, '/product-category/3', 'uploads/20250505114906_294307.png', 'active', '2024-10-13 19:02:57', '2025-05-05 05:49:06', NULL),
(4, 'ok', 4, 'ok', 'uploads/20241031174730_110971.jpg', 'active', '2024-11-01 09:47:30', '2024-11-01 09:49:10', '2024-11-01 09:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maplis`
--

CREATE TABLE `maplis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `map` longtext DEFAULT NULL,
  `licence` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maplis`
--

INSERT INTO `maplis` (`id`, `map`, `licence`, `created_at`, `updated_at`) VALUES
(1, 'pb=!1m18!1m12!1m3!1d10319.427562701268!2d90.40157658594991!3d23.872996496008664!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c43b23589ec9%3A0x3f71bf01a9cd40de!2sBNS%20Center!5e0!3m2!1sen!2sbd!4v1745148083350!5m2!1sen!2sbd', '02-9854', '2025-04-20 05:25:00', '2025-04-20 05:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_18_155701_add_customer_id_to_orders_table', 2),
(5, '2025_02_02_115810_create_customers_table', 3),
(6, '2025_02_05_123155_add_referral_balance_to_customers', 4),
(8, '2025_02_06_171531_create_withdrawals_table', 5),
(9, '2025_02_10_115128_create_withdraws_table', 6),
(10, '2025_03_11_091216_add_addresses_to_customers_table', 7),
(11, '2025_04_06_070528_create_faqs_table', 8),
(12, '2025_04_06_111641_create_tandcs_table', 9),
(13, '2025_04_06_115031_create_refunds_table', 10),
(14, '2025_04_07_111147_add_otpcode_to_users_table', 11),
(16, '2025_04_07_112843_add_otp_expires_at_to_users_table', 12),
(17, '2025_04_08_062104_remove_otp_verified_from_users_table', 13),
(18, '2025_04_08_062919_add_otp_fields_to_users_table', 14),
(19, '2025_04_09_061737_add_stuff_type_to_users_table', 15),
(20, '2025_04_20_100117_create_webrands_table', 16),
(21, '2025_04_20_111659_create_maplis_table', 17),
(22, '2025_04_20_115724_create_btobs_table', 18),
(25, '2025_05_06_060413_add_note_to_orders_table', 19),
(26, '2025_04_21_090817_create_topmars_table', 20),
(27, '2025_05_06_094105_create_subscribers_table', 21),
(28, '2025_05_07_060238_create_pixel_gtms_table', 22),
(29, '2025_05_07_091748_add_videoid_to_products_table', 23);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `order_no` bigint(20) UNSIGNED NOT NULL,
  `tracking_code` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `delivery_status` enum('Pending','Approved','Shipping','Delivered','Cancelled') NOT NULL DEFAULT 'Pending',
  `payment_type` varchar(50) NOT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_code` varchar(20) DEFAULT NULL,
  `delivery_charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(8,2) NOT NULL,
  `commission_calculated` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','success','shipped','return') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date`, `order_no`, `tracking_code`, `transaction_id`, `user_id`, `seller_id`, `customer_name`, `customer_phone`, `shipping_address`, `delivery_status`, `payment_type`, `payment_status`, `payment_details`, `grand_total`, `discount`, `discount_code`, `delivery_charge`, `total`, `commission_calculated`, `status`, `customer_id`, `currency`, `created_at`, `updated_at`, `note`) VALUES
(261, '2025-05-05', 250505101544625, '2505052101544', '68188fd08eb88', 7, NULL, 'sabbir', '01751166302', '123 Office Street, Business City', 'Pending', 'cash', 'Cash On Delivery', NULL, 500.00, 0.00, NULL, 60.00, 560.00, 0.00, 'pending', NULL, NULL, '2025-05-05 04:15:44', '2025-05-05 04:15:44', NULL),
(262, '2025-05-05', 250505102002415, '2505053102002', '681890d23e559', 7, NULL, 'sabbir', '01751166302', '123 Office Street, Business City', 'Pending', 'cash', 'Cash On Delivery', NULL, 500.00, 0.00, NULL, 70.00, 570.00, 0.00, 'pending', NULL, NULL, '2025-05-05 04:20:02', '2025-05-05 04:20:02', NULL),
(263, '2025-05-05', 250505111717658, '2505054111717', '68189e3d94bf4', 7, NULL, 'sabbir', '01751166302', '123 Office Street, Business City233', 'Delivered', 'cash', 'Cash On Delivery', NULL, 1000.00, 0.00, NULL, 70.00, 1070.00, 0.00, 'pending', NULL, NULL, '2025-05-05 05:17:17', '2025-05-06 03:36:17', NULL),
(264, '2025-05-06', 250506065204915, '2505065065204', '6819b194a68c4', 7, NULL, 'sabbir ahmed', '01751166302', '123 Office Street, Business City', 'Shipping', 'cash', 'Cash On Delivery', NULL, 880.00, 0.00, NULL, 70.00, 950.00, 0.00, 'pending', NULL, NULL, '2025-05-06 00:52:04', '2025-05-06 01:04:18', NULL),
(265, '2025-05-06', 250506065857431, '2505066065857', '6819b331245d0', 7, NULL, 'sabbir ahmed', '01751166302', '123 Office Street, Business City', 'Pending', 'cash', 'Cash On Delivery', NULL, 500.00, 0.00, NULL, 70.00, 570.00, 0.00, 'pending', NULL, NULL, '2025-05-06 00:58:57', '2025-05-06 00:58:57', 'lal color'),
(266, '2025-05-06', 250506090642637, '2505067090642', '6819d122c51b7', 7, NULL, 'sabbir', '01751166302', '123 Office Street, Business City233', 'Pending', 'cash', 'Cash On Delivery', NULL, 500.00, 0.00, NULL, 70.00, 570.00, 0.00, 'pending', NULL, NULL, '2025-05-06 03:06:42', '2025-05-06 03:06:42', 'amr lal color ta lagbe');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(191) NOT NULL,
  `product_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sell_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `product_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `size` varchar(191) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_status` enum('paid','unpaid') DEFAULT 'unpaid',
  `delivery_status` enum('Pending','Approved','Shipping','Delivered','Cancelled') NOT NULL DEFAULT 'Pending',
  `shipping_type` varchar(50) DEFAULT NULL,
  `pickup_point_id` varchar(50) DEFAULT NULL,
  `earn_point` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_name`, `product_price`, `sell_price`, `product_discount`, `quantity`, `size`, `color`, `subtotal`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `earn_point`, `created_at`, `updated_at`) VALUES
(199, 260, 1291, 'Iris Bed Sheet (ping)', 500.00, 500.00, 0.00, 1, NULL, NULL, 500.00, 'unpaid', 'Pending', NULL, NULL, 0, '2025-04-21 01:15:20', '2025-04-21 01:15:20'),
(200, 261, 1285, 'saree 3', 500.00, 500.00, 0.00, 1, NULL, NULL, 500.00, 'unpaid', 'Pending', NULL, NULL, 0, '2025-05-05 04:15:44', '2025-05-05 04:15:44'),
(201, 262, 1287, 'Three Pice 1', 500.00, 500.00, 0.00, 1, NULL, NULL, 500.00, 'unpaid', 'Pending', NULL, NULL, 0, '2025-05-05 04:20:02', '2025-05-05 04:20:02'),
(202, 263, 1287, 'Three Pice 1', 500.00, 500.00, 0.00, 2, NULL, NULL, 1000.00, 'unpaid', 'Pending', NULL, NULL, 0, '2025-05-05 05:17:17', '2025-05-05 05:17:17'),
(203, 264, 1288, 'Saree 1', 500.00, 440.00, 0.00, 2, NULL, NULL, 880.00, 'unpaid', 'Pending', NULL, NULL, 0, '2025-05-06 00:52:04', '2025-05-06 00:52:04'),
(204, 265, 1286, 'Panjabi 1', 500.00, 500.00, 0.00, 1, NULL, NULL, 500.00, 'unpaid', 'Pending', NULL, NULL, 0, '2025-05-06 00:58:57', '2025-05-06 00:58:57'),
(205, 266, 1298, 'Panjabi 3', 500.00, 500.00, 0.00, 1, NULL, NULL, 500.00, 'unpaid', 'Pending', NULL, NULL, 0, '2025-05-06 03:06:42', '2025-05-06 03:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` varchar(191) NOT NULL,
  `status` enum('pending','success') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'cash', 'pending', '2024-01-16 22:59:07', '2024-01-16 22:59:07');

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `delivery_charge` decimal(10,2) NOT NULL,
  `tracking_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BDT',
  `cart_items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pending_orders`
--

INSERT INTO `pending_orders` (`id`, `order_no`, `customer_name`, `customer_phone`, `total`, `grand_total`, `shipping_address`, `payment_type`, `payment_status`, `delivery_charge`, `tracking_code`, `date`, `customer_id`, `currency`, `cart_items`, `transaction_id`, `created_at`, `updated_at`) VALUES
(6, '250505101536849', 'sabbir', '01751166302', 560.00, 500.00, '123 Office Street, Business City', 'online', 'Pay Online', 60.00, '2505052101536', '2025-05-05', NULL, 'BDT', '{\"d19eee75e55e1b4605d33e9bfafddb54\":{\"rowId\":\"d19eee75e55e1b4605d33e9bfafddb54\",\"id\":1285,\"name\":\"saree 3\",\"qty\":\"1\",\"price\":500,\"weight\":1,\"options\":{\"thumbnail\":\"[962]\",\"slug\":\"saree-3\",\"size\":null,\"color\":null},\"discount\":0,\"tax\":105,\"subtotal\":500}}', '68188fc8af9ff', '2025-05-05 04:15:36', '2025-05-05 04:15:36'),
(7, '250505101955449', 'sabbir', '01751166302', 570.00, 500.00, '123 Office Street, Business City', 'online', 'Pay Online', 70.00, '2505053101955', '2025-05-05', NULL, 'BDT', '{\"91c381bc1e976d7d21205df003bf3e6a\":{\"rowId\":\"91c381bc1e976d7d21205df003bf3e6a\",\"id\":1287,\"name\":\"Three Pice 1\",\"qty\":\"1\",\"price\":500,\"weight\":1,\"options\":{\"thumbnail\":\"[956]\",\"slug\":\"three-pice-1\",\"size\":null,\"color\":null},\"discount\":0,\"tax\":105,\"subtotal\":500}}', '681890cb29a8c', '2025-05-05 04:19:55', '2025-05-05 04:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `pixel_gtms`
--

CREATE TABLE `pixel_gtms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pixel` longtext DEFAULT NULL,
  `gtm` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pixel_gtms`
--

INSERT INTO `pixel_gtms` (`id`, `pixel`, `gtm`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '2025-05-07 00:09:48', '2025-05-07 01:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `model` text DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `weight` varchar(50) DEFAULT NULL,
  `minimum_purchase_qty` int(11) NOT NULL DEFAULT 0,
  `buying_price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `selling_price` decimal(8,2) NOT NULL,
  `discount_from` datetime DEFAULT NULL,
  `discount_to` datetime DEFAULT NULL,
  `discount_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `sell_quantity` int(11) NOT NULL DEFAULT 0,
  `sku_code` varchar(191) DEFAULT NULL,
  `color` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `size` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `thumbnail` longtext NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `warranty` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 for yes 0 for no',
  `warranty_duration` varchar(191) DEFAULT NULL,
  `warranty_condition` longtext DEFAULT NULL,
  `description` longtext NOT NULL,
  `is_free_shipping` varchar(50) DEFAULT NULL,
  `show_stock_qty` varchar(50) DEFAULT NULL,
  `cash_on_delivery` varchar(50) DEFAULT NULL,
  `low_stock_qty` int(11) DEFAULT NULL,
  `estimate_shipping_day` varchar(50) DEFAULT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 for active 0 for Inactive',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `videoid` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `slug`, `category_id`, `brand_id`, `model`, `unit`, `weight`, `minimum_purchase_qty`, `buying_price`, `selling_price`, `discount_from`, `discount_to`, `discount_price`, `discount_type`, `quantity`, `sell_quantity`, `sku_code`, `color`, `size`, `thumbnail`, `images`, `warranty`, `warranty_duration`, `warranty_condition`, `description`, `is_free_shipping`, `show_stock_qty`, `cash_on_delivery`, `low_stock_qty`, `estimate_shipping_day`, `featured`, `status`, `created_at`, `updated_at`, `deleted_at`, `videoid`) VALUES
(3, 7, 'Family Combo 1', 'family-combo-1', 1, 1, 'test', 'Pcs', '1', 1, 0.00, 500.00, '2010-08-03 13:05:00', '1998-01-07 00:07:00', 20.00, 'flat', 50, 0, NULL, '[\"1\"]', '[\"Medium\"]', '[968]', '{\"1\":924,\"2\":969,\"3\":970}', 0, 'Ut eu non reprehende', '<p>Sunt et ducimus, non.</p>', '<p>Family Combo 1</p>', NULL, 'yes', 'yes', 1, '2', 0, 'active', '2024-10-09 21:30:33', '2025-05-05 03:57:47', '2025-05-05 03:57:47', NULL),
(1284, 7, 'Three Pice 2', 'three-pice-2', 2, 1, 'test', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[965]', '[966,967]', 0, NULL, '<p><br></p>', '<p>three piece</p>', 'yes', 'yes', 'yes', 0, '1', 0, 'active', '2025-04-20 01:35:37', '2025-05-04 22:27:40', NULL, NULL),
(1285, 7, 'saree 3', 'saree-3', 3, 1, 'test', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[962]', '[963,964]', 0, NULL, '<p><br></p>', '<p>The saree features intricate zari work along the borders and pallu, reflecting the artistry of traditional Indian craftsmanship. Its vibrant color palette and delicate motifs make it a standout piece, whether you\'re attending a family function or a formal event.</p><p><strong>Product Highlights:</strong></p><ul><li>Material: 100% Pure Silk</li><li>Design: Traditional Zari Work</li><li>Blouse: Unstitched Matching Blouse Piece Included</li><li>Length: 6.3 meters (with blouse)</li><li>Care: Dry Clean Only</li></ul><p>Celebrate heritage with style—this saree is not just attire, it\'s a statement.</p>', 'yes', 'yes', 'yes', 0, '1', 0, 'active', '2025-04-20 01:39:21', '2025-05-07 03:57:48', NULL, '2uyA_WPGlyU?si=h2C0C2rFUG6L8KHb'),
(1286, 7, 'Panjabi 1', 'panjabi-1', 4, 1, 'test', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[959]', '[960,961]', 0, NULL, '<p><br></p>', '<p><strong style=\"color: rgb(27, 27, 40);\">Carnations Navy Blue Bed Sheet Product Details:&nbsp;</strong></p><p><span style=\"color: rgb(27, 27, 40);\">Our Carnations Navy Blue Bed sheet are perfect for creating an elegant and comfortable space. Made from the finest materials.</span></p><p><br></p><ul><li><strong>Product Type:&nbsp;</strong>Bed Sheet with Pillow Covers</li><li><strong>Color:&nbsp;</strong>Multicolor</li><li><strong>Main Material:</strong>&nbsp;Satin Cotton</li><li><strong>Size:&nbsp;</strong>8 X 9 Feet (95″ X 108″)</li><li>King Size Bed Sheet</li><li>Bed Sheet with Matching 2 Pillow Covers</li><li>Supper Soft&nbsp;</li><li>Instruction: Machine wash in cold water with similar colours. Tumble dry low. Do not bleach.&nbsp;</li><li><br></li><li><br></li></ul><p><strong style=\"color: rgb(27, 27, 40);\">N.B:&nbsp;</strong></p><ul><li>Colour may vary in different electronic device. Check twice before place your order</li></ul><p><br></p>', 'yes', 'yes', 'yes', 0, '1', 0, 'active', '2025-04-20 01:40:43', '2025-05-04 22:27:39', NULL, NULL),
(1287, 7, 'Three Pice 1', 'three-pice-1', 2, 1, 'test', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[956]', '[957,958]', 0, NULL, '<p><br></p>', '<p><strong style=\"color: rgb(27, 27, 40);\">Camellia Bed Sheet Product Details:&nbsp;</strong></p><p><span style=\"color: rgb(27, 27, 40);\">Our Camellia Bed Sheet are perfect for creating an elegant and comfortable space. Made from the finest materials.</span></p><p><br></p><ul><li>Product Type: Bed Sheet with Pillow Covers</li><li>Color: Multicolor</li><li>Main Material: Satin Cotton</li><li>Size: 8 X 9 Feet (95″ X 108″)</li><li>King Size Bed Sheet</li><li>Bed Sheet with Matching 2 Pillow Covers</li><li>Supper Soft&nbsp;</li><li>Instruction: Machine wash in cold water with similar colours. Tumble dry low. Do not bleach.&nbsp;</li></ul><p><strong style=\"color: rgb(27, 27, 40);\">N.B:&nbsp;</strong></p><ul><li>Colour may vary in different electronic device. Check twice before place your order</li></ul><p><br></p>', 'yes', 'yes', 'yes', 0, '1', 0, 'active', '2025-04-20 01:41:56', '2025-05-04 22:27:38', NULL, NULL),
(1288, 7, 'Saree 1', 'saree-1', 3, 1, 'test', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 60.00, 'flat', 50, 0, NULL, '[]', '[]', '[953]', '[954,955]', 0, NULL, '<p><br></p>', '<p>This saree features delicate sequin embroidery and a subtle shimmer that adds just the right amount of glamour. Paired with a designer blouse piece, it lets you create a customized look that suits your style.</p><p><strong>Product Highlights:</strong></p><ul><li>Material: Soft Georgette</li><li>Embellishments: Sequin &amp; Thread Embroidery</li><li>Blouse: Unstitched Designer Blouse Piece Included</li><li>Length: 6.3 meters (with blouse)</li><li>Care: Hand Wash or Dry Clean Recommended</li></ul><p>Elevate your evening look with this effortlessly stylish saree that blends tradition with modern flair.</p>', 'yes', 'yes', 'yes', 0, '1', 0, 'active', '2025-04-20 02:15:47', '2025-05-07 03:58:32', NULL, NULL),
(1289, 7, 'Iris Bed Sheet (ping)', 'iris-bed-sheet-ping', 1, 1, 'test', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[935]', '[936]', 0, NULL, '<p><br></p>', '<p>1</p>', 'yes', 'yes', 'yes', 0, '7', 0, 'inactive', '2025-04-21 00:55:52', '2025-04-21 00:56:50', '2025-04-21 00:56:50', NULL),
(1290, 7, 'Iris Bed Sheet (ping)', 'iris-bed-sheet-ping', 1, 1, 'test', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[937]', '[938]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '7', 0, 'inactive', '2025-04-21 00:59:31', '2025-04-21 01:06:31', '2025-04-21 01:06:31', NULL),
(1291, 7, 'Iris Bed Sheet (ping)', 'iris-bed-sheet-ping', 1, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[939]', '[940]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '7', 0, 'inactive', '2025-04-21 01:14:27', '2025-04-21 01:17:02', '2025-04-21 01:17:02', NULL),
(1292, 7, 'Iris Bed Sheet (ping)', 'iris-bed-sheet-ping', 1, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[941]', '[942]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '7', 0, 'inactive', '2025-04-21 01:18:07', '2025-04-21 02:48:53', '2025-04-21 02:48:53', NULL),
(1293, 7, 'Iris Bed Sheet (sabbir test1)', 'iris-bed-sheet-sabbir-test1', 3, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[943]', '[944]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-04-21 01:20:09', '2025-04-21 02:48:51', '2025-04-21 02:48:51', NULL),
(1294, 7, 'test', 'test', 1, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 510.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[947]', '[948]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-04-21 02:20:30', '2025-04-21 02:48:49', '2025-04-21 02:48:49', NULL),
(1295, 7, 'Panjabi 2', 'panjabi-2', 4, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[971]', '[972,973]', 0, NULL, '<p><br></p>', '<p>panjabi</p>', 'yes', 'yes', 'yes', 0, '5', 0, 'active', '2025-05-04 22:26:14', '2025-05-04 22:27:33', NULL, NULL),
(1296, 7, 'Three Pice 3', 'three-pice-3', 2, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[974]', '[975,976]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'active', '2025-05-04 22:41:52', '2025-05-04 22:42:15', NULL, NULL),
(1297, 7, 'Family Combo 2', 'family-combo-2', 1, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[977]', '[978,979]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'active', '2025-05-04 22:42:53', '2025-05-04 22:43:17', NULL, NULL),
(1298, 7, 'Panjabi 3', 'panjabi-3', 4, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[]', '[980]', '[981,982]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'active', '2025-05-04 22:44:27', '2025-05-05 03:57:50', NULL, NULL),
(1299, 7, 'Family Combo 1', 'family-combo-1', 1, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 650.00, NULL, NULL, 50.00, 'flat', 50, 0, NULL, '[]', '[]', '[983]', '[984,986]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'active', '2025-05-05 03:59:15', '2025-05-07 03:48:38', NULL, 'GMniyQIc1eU?si=oo3pLlefT3XFJQKP'),
(1300, 7, 'sabbir test', 'sabbir-test', 5, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 1500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[\"40\"]', '[987]', '[988,989]', 0, NULL, '<p><br></p>', '<p>This saree features delicate sequin embroidery and a subtle shimmer that adds just the right amount of glamour. Paired with a designer blouse piece, it lets you create a customized look that suits your style.</p><p><strong>Product Highlights:</strong></p><ul><li>Material: Soft Georgette</li><li>Embellishments: Sequin &amp; Thread Embroidery</li><li>Blouse: Unstitched Designer Blouse Piece Included</li><li>Length: 6.3 meters (with blouse)</li><li>Care: Hand Wash or Dry Clean Recommended</li></ul><p>Elevate your evening look with this effortlessly stylish saree that blends tradition with modern flair.</p>', 'yes', 'yes', 'yes', 0, '5', 0, 'active', '2025-05-07 04:02:16', '2025-05-07 04:06:39', '2025-05-07 04:06:39', NULL),
(1301, 7, 'sabbir test', 'sabbir-test', 5, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 1500.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[]', '[\"42\"]', '[990]', '[991,992,993]', 0, NULL, '<p><br></p>', '<p>This saree features delicate sequin embroidery and a subtle shimmer that adds just the right amount of glamour. Paired with a designer blouse piece, it lets you create a customized look that suits your style.</p><p><strong>Product Highlights:</strong></p><ul><li>Material: Soft Georgette</li><li>Embellishments: Sequin &amp; Thread Embroidery</li><li>Blouse: Unstitched Designer Blouse Piece Included</li><li>Length: 6.3 meters (with blouse)</li><li>Care: Hand Wash or Dry Clean Recommended</li></ul><p>Elevate your evening look with this effortlessly stylish saree that blends tradition with modern flair.</p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-05-07 04:07:17', '2025-05-07 04:07:17', NULL, 'R1jXg6CDaDI?si=A1vySnCYxwJd7UMc');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `image` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `color_id`, `size`, `price`, `qty`, `image`, `created_at`, `updated_at`) VALUES
(72, 1, 1, 'Medium', 600.00, 5, NULL, '2024-10-15 19:40:27', '2024-10-15 19:40:27'),
(73, 1, 2, 'Small', 600.00, 8, NULL, '2024-10-15 19:40:27', '2024-10-15 19:40:27'),
(78, 42, 1, 'Medium', 600.00, 20, NULL, '2025-01-08 21:42:37', '2025-01-08 21:42:37'),
(85, 46, 1, 'Medium', 650.00, 6, NULL, '2025-01-08 21:58:56', '2025-01-08 21:58:56'),
(92, 52, 1, 'Small', 80.00, 10, NULL, '2025-01-11 18:52:00', '2025-01-11 18:52:00'),
(93, 53, 1, 'Small', 50.00, 10, NULL, '2025-01-11 19:13:03', '2025-01-11 19:13:03'),
(100, 37, 3, 'XXL', 1800.00, 481, NULL, '2025-03-16 13:18:42', '2025-03-16 13:18:42'),
(101, 36, 6, 'Small', 318.00, 5, NULL, '2025-03-16 13:22:26', '2025-03-16 13:22:26'),
(102, 36, 7, 'Medium', 318.00, 6, NULL, '2025-03-16 13:22:26', '2025-03-16 13:22:26'),
(103, 36, 8, 'Large', 318.00, 7, NULL, '2025-03-16 13:22:26', '2025-03-16 13:22:26'),
(104, 36, 9, 'XL', 318.00, 8, NULL, '2025-03-16 13:22:26', '2025-03-16 13:22:26'),
(105, 35, 2, 'Small', 587.00, 8, NULL, '2025-03-16 13:23:44', '2025-03-16 13:23:44'),
(106, 35, 3, 'Medium', 587.00, 9, NULL, '2025-03-16 13:23:44', '2025-03-16 13:23:44'),
(107, 35, 4, 'Large', 587.00, 7, NULL, '2025-03-16 13:23:44', '2025-03-16 13:23:44'),
(108, 35, 5, 'XL', 587.00, 9, NULL, '2025-03-16 13:23:44', '2025-03-16 13:23:44'),
(113, 3, 1, 'Medium', 500.00, 5, NULL, '2025-05-04 22:24:07', '2025-05-04 22:24:07');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rdetails` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`id`, `rdetails`, `created_at`, `updated_at`) VALUES
(1, 'At [Your Store Name], we care deeply about your satisfaction. If you\'re not completely happy with your purchase, we\'re here to help. Our refund policy is designed to be fair, transparent, and easy to follow, so you can shop with confidence.', '2025-04-06 06:20:00', '2025-04-06 06:20:00'),
(2, 'You may request a return or refund within 30 days of receiving your order. To be eligible, the item must be unused, unworn (if applicable), and in its original condition and packaging. Any item returned that is damaged, shows signs of use, or is missing parts for reasons not due to our error may not qualify for a full refund.', '2025-04-06 06:21:27', '2025-04-06 06:29:28'),
(3, 'To initiate a return, please contact our customer support team at [support@example.com] with your order number, the item(s) you wish to return, and the reason for the return. Once your return request is approved, we will provide you with return instructions, including the return shipping address and any necessary labels or forms. Please do not send items back without contacting us first, as unauthorized returns may not be processed.', '2025-04-06 06:21:36', '2025-04-06 06:21:36'),
(4, 'Once we receive your returned item and inspect it, we will notify you of the approval or rejection of your refund. If approved, your refund will be processed and a credit will be applied to your original method of payment within 5–10 business days. Depending on your payment provider, it may take additional time for the refund to reflect in your account.', '2025-04-06 06:21:42', '2025-04-06 06:21:42'),
(5, 'Please note that original shipping charges are non-refundable, unless the return is due to our error (such as receiving a defective or incorrect item). In cases where a product is faulty or damaged in transit, we will gladly cover the return shipping costs. For all other returns, customers are responsible for return shipping fees.', '2025-04-06 06:21:49', '2025-04-06 06:21:49'),
(6, 'Certain types of items are non-refundable, including perishable goods, custom or personalized products, digital downloads, and items marked as final sale. Please read product descriptions carefully and contact us before purchasing if you have any questions.\r\n\r\nIf your order arrives damaged or with missing items, please contact us within 48 hours of delivery. Be sure to include photos of the packaging and product(s), and we will work quickly to resolve the issue—whether that means reshipping the item or issuing a full or partial refund.', '2025-04-06 06:21:57', '2025-04-06 06:21:57'),
(8, 'We reserve the right to deny refunds or returns that do not comply with our policy. Our goal is always to be fair, but we also ask that products are returned responsibly and honestly. If you have any concerns about your order or our process, please don’t hesitate to reach out—we’re always happy to help.', '2025-04-06 06:30:54', '2025-04-06 06:30:54');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `product_review` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `serial` int(11) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `title`, `name`, `serial`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Scroll', 'Deals of the day', 1, 'active', '2024-10-12 17:08:59', '2024-10-12 17:32:41', NULL),
(2, 'Scroll', 'Best Rated Products', 2, 'active', '2024-10-12 17:10:59', '2024-10-12 17:32:43', NULL),
(3, 'Scroll', 'Featured Products', 3, 'active', '2024-10-12 17:11:10', '2024-10-12 17:11:10', NULL),
(4, 'new_arrival', 'New Arrival', NULL, 'active', '2024-10-12 17:11:22', '2024-10-12 20:52:17', NULL),
(7, 'single_banner', 'Single Banner', NULL, 'active', '2024-10-12 17:11:22', '2024-10-13 21:26:56', '2024-10-13 21:26:56'),
(8, 'single_card', 'Sincle Card', NULL, 'active', '2024-10-14 05:13:57', '2024-10-14 05:13:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `section_products`
--

CREATE TABLE `section_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `section_products`
--

INSERT INTO `section_products` (`id`, `section_id`, `product_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'active', '2024-10-12 18:23:55', '2024-10-12 18:24:28'),
(2, 1, 2, 'active', '2024-10-12 18:24:26', '2024-10-12 18:24:26'),
(3, 1, 3, 'active', '2024-10-12 18:24:29', '2024-10-12 18:24:29'),
(4, 4, 4, 'inactive', '2024-10-12 18:24:30', '2024-10-12 18:24:50'),
(5, 2, 5, 'active', '2024-10-12 18:24:33', '2024-10-12 18:24:33'),
(6, 2, 6, 'active', '2024-10-12 18:24:34', '2024-10-12 18:24:34'),
(7, 3, 9, 'active', '2024-10-12 18:24:35', '2024-10-12 18:24:35'),
(8, 3, 10, 'active', '2024-10-12 18:24:36', '2024-10-12 18:24:36'),
(9, 3, 32, 'active', '2024-10-12 18:24:37', '2024-10-12 18:24:37'),
(10, 4, 33, 'inactive', '2024-10-12 18:24:39', '2024-10-12 18:24:52'),
(11, 3, 2, 'active', '2024-10-12 18:24:44', '2024-10-12 18:24:44'),
(12, 3, 1, 'active', '2024-10-12 18:24:45', '2024-10-12 18:24:45'),
(13, 2, 4, 'active', '2024-10-12 18:24:54', '2024-10-12 18:24:54'),
(14, 2, 33, 'active', '2024-10-12 18:24:57', '2024-10-12 18:24:57'),
(15, 1, 32, 'active', '2024-10-12 18:25:01', '2024-10-12 18:25:01'),
(16, 1, 10, 'active', '2024-10-12 18:25:02', '2024-10-12 18:25:02'),
(17, 2, 32, 'active', '2024-10-12 18:59:11', '2024-10-12 18:59:11'),
(18, 1, 4, 'active', '2024-10-12 19:07:23', '2024-10-12 19:07:23'),
(19, 1, 5, 'inactive', '2024-10-12 19:28:31', '2024-10-12 19:28:33'),
(20, 1, 36, 'active', '2024-10-12 19:28:36', '2024-10-12 19:28:36'),
(21, 1, 35, 'active', '2024-10-12 19:28:37', '2024-10-12 19:28:37'),
(22, 4, 1, 'active', '2024-10-12 20:57:13', '2024-10-12 20:57:13'),
(23, 4, 5, 'active', '2024-10-12 20:57:15', '2024-10-12 20:57:15'),
(24, 4, 9, 'active', '2024-10-13 21:24:29', '2024-10-13 21:24:29'),
(25, 4, 32, 'active', '2024-10-13 21:24:29', '2024-10-13 21:24:29'),
(26, 4, 37, 'active', '2024-10-13 21:24:32', '2024-10-13 21:24:32'),
(27, 4, 36, 'active', '2024-10-13 21:24:32', '2024-10-13 21:24:32'),
(28, 7, 2, 'active', '2024-10-13 21:24:56', '2024-10-13 21:24:56'),
(29, 4, 35, 'active', '2024-10-13 21:29:53', '2024-10-13 21:29:53'),
(30, 4, 40, 'inactive', '2024-10-13 21:44:13', '2024-10-13 21:48:01'),
(31, 4, 3, 'active', '2024-10-13 21:48:06', '2025-04-20 02:20:54'),
(32, 8, 10, 'inactive', '2024-10-14 05:14:11', '2024-10-15 17:44:51'),
(33, 8, 3, 'active', '2024-10-15 17:44:54', '2024-10-15 17:44:54'),
(34, 2, 3, 'active', '2025-03-10 11:43:23', '2025-04-20 02:20:48'),
(35, 2, 63, 'active', '2025-03-10 11:43:32', '2025-03-10 11:43:32'),
(36, 3, 3, 'active', '2025-04-20 02:11:52', '2025-04-20 02:11:52'),
(37, 2, 1284, 'active', '2025-04-20 02:11:53', '2025-04-20 02:11:53'),
(38, 3, 1285, 'active', '2025-04-20 02:11:54', '2025-04-20 02:11:54'),
(39, 2, 1286, 'active', '2025-04-20 02:11:56', '2025-04-20 02:11:56'),
(40, 3, 1287, 'active', '2025-04-20 02:11:57', '2025-04-20 02:11:57'),
(41, 4, 1284, 'active', '2025-04-20 02:12:04', '2025-04-20 02:12:04'),
(42, 1, 1285, 'active', '2025-04-20 02:12:04', '2025-04-20 02:12:04'),
(43, 4, 1286, 'active', '2025-04-20 02:12:05', '2025-04-20 02:12:05'),
(44, 1, 1287, 'active', '2025-04-20 02:12:06', '2025-04-20 02:12:06'),
(45, 2, 1288, 'active', '2025-04-20 02:16:25', '2025-04-20 02:16:25'),
(46, 4, 1288, 'active', '2025-04-20 02:16:27', '2025-04-20 02:16:27'),
(47, 3, 1284, 'active', '2025-04-20 02:20:45', '2025-04-20 02:20:45'),
(48, 3, 1286, 'active', '2025-04-20 02:20:46', '2025-04-20 02:20:46'),
(49, 3, 1288, 'active', '2025-04-20 02:20:47', '2025-04-20 02:20:47'),
(50, 2, 1285, 'active', '2025-04-20 02:20:49', '2025-04-20 02:20:49'),
(51, 2, 1287, 'active', '2025-04-20 02:20:50', '2025-04-20 02:20:50'),
(52, 1, 1284, 'active', '2025-04-20 02:20:51', '2025-04-20 02:20:51'),
(53, 1, 1286, 'active', '2025-04-20 02:20:52', '2025-04-20 02:20:52'),
(54, 1, 1288, 'active', '2025-04-20 02:20:53', '2025-04-20 02:20:53'),
(55, 4, 1285, 'active', '2025-04-20 02:20:55', '2025-04-20 02:20:55'),
(56, 4, 1287, 'active', '2025-04-20 02:20:57', '2025-04-20 02:20:57'),
(57, 3, 1295, 'active', '2025-05-04 22:45:05', '2025-05-04 22:45:05'),
(58, 3, 1296, 'active', '2025-05-04 22:45:06', '2025-05-04 22:45:06'),
(59, 3, 1297, 'active', '2025-05-04 22:45:06', '2025-05-04 22:45:06'),
(60, 3, 1298, 'active', '2025-05-04 22:45:08', '2025-05-04 22:45:08'),
(61, 2, 1295, 'active', '2025-05-04 22:45:09', '2025-05-04 22:45:09'),
(62, 2, 1296, 'active', '2025-05-04 22:45:10', '2025-05-04 22:45:10'),
(63, 2, 1297, 'active', '2025-05-04 22:45:10', '2025-05-04 22:45:10'),
(64, 2, 1298, 'active', '2025-05-04 22:45:12', '2025-05-04 22:45:12'),
(65, 1, 1295, 'active', '2025-05-04 22:45:13', '2025-05-04 22:45:13'),
(66, 1, 1296, 'active', '2025-05-04 22:45:13', '2025-05-04 22:45:13'),
(67, 1, 1297, 'active', '2025-05-04 22:45:14', '2025-05-04 22:45:14'),
(68, 1, 1298, 'active', '2025-05-04 22:45:15', '2025-05-04 22:45:15'),
(69, 4, 1295, 'active', '2025-05-04 22:45:16', '2025-05-04 22:45:16'),
(70, 4, 1296, 'active', '2025-05-04 22:45:17', '2025-05-04 22:45:17'),
(71, 4, 1297, 'active', '2025-05-04 22:45:17', '2025-05-04 22:45:17'),
(72, 4, 1298, 'active', '2025-05-04 22:45:18', '2025-05-04 22:45:18'),
(73, 3, 1299, 'active', '2025-05-06 03:38:39', '2025-05-06 03:38:39'),
(74, 2, 1299, 'active', '2025-05-06 03:38:40', '2025-05-06 03:38:40'),
(75, 1, 1299, 'active', '2025-05-06 03:38:42', '2025-05-06 03:38:42'),
(76, 4, 1299, 'active', '2025-05-06 03:38:42', '2025-05-06 03:38:42'),
(77, 8, 1299, 'inactive', '2025-05-06 03:38:44', '2025-05-06 03:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('LYPpn9uKwxLPGokpUUIdYFofsvYj3LeNmWrvg8Do', 7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV2RybnUwSFRBUXhldVBXT1VrMkJkeXc4ZkN5SjdKMXJwWG5TTXpwViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0LzEzMDEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Nzt9', 1746612456);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `division` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `thana` varchar(30) NOT NULL,
  `address` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `name`, `phone`, `division`, `district`, `thana`, `address`, `created_at`, `updated_at`) VALUES
(1, 'dfdsafdsafa', '01721850242', 'Rajshahi', 'Pabna', 'Sujanagar', 'fdsfasd dfsfasdfasd', '2024-01-16 22:58:56', '2024-01-16 22:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `single_banners`
--

CREATE TABLE `single_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `serial` int(11) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `single_banners`
--

INSERT INTO `single_banners` (`id`, `name`, `serial`, `link`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Louis Kidd', NULL, '/product-category/16', 'uploads/20250319084205_220173.jpg', 'inactive', '2024-10-13 20:42:42', '2025-04-20 01:22:08', '2025-04-20 01:22:08'),
(2, 'ok', NULL, '1', 'uploads/20241031180132_721867.jpg', 'inactive', '2024-11-01 10:01:32', '2025-04-19 05:13:21', '2025-04-19 05:13:21'),
(3, 'Inside Our Factory', NULL, '/product-category/2', 'uploads/20250505115936_719243.jpg', 'active', '2025-04-19 05:14:23', '2025-05-05 05:59:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tandcs`
--

CREATE TABLE `tandcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tandcs`
--

INSERT INTO `tandcs` (`id`, `details`, `created_at`, `updated_at`) VALUES
(1, 'At [Your Store Name], we care deeply about your satisfaction. If you\'re not completely happy with your purchase, we\'re here to help. Our refund policy is designed to be fair, transparent, and easy to follow, so you can shop with confidence.1', '2025-04-06 05:39:34', '2025-04-06 06:26:39'),
(3, 'We strive to provide accurate product descriptions, pricing, and availability, but we reserve the right to correct any errors or omissions at any time without prior notice. All orders placed are subject to acceptance and availability. We reserve the right to refuse or cancel any order at our sole discretion. Prices are listed in [your currency] and may or may not include applicable taxes, depending on your location.', '2025-04-06 06:06:39', '2025-04-06 06:06:39'),
(4, 'Shipping times are estimates only and not guaranteed. We are not responsible for delays caused by shipping carriers, customs processes, or unforeseen events. Customers are responsible for providing accurate shipping information, and we cannot be held liable for issues resulting from incorrect addresses.', '2025-04-06 06:06:48', '2025-04-06 06:06:48'),
(5, 'We accept returns on most products within [30 days] of delivery, provided the items are unused and in their original packaging. Refunds are issued to the original payment method after the return is received and inspected. For more information, please refer to our Return Policy.', '2025-04-06 06:06:55', '2025-04-06 06:06:55'),
(6, 'All content on this website, including text, images, graphics, and logos, is the property of our company or our content suppliers and is protected by intellectual property laws. You may not use, reproduce, or distribute any content without our written permission.', '2025-04-06 06:07:02', '2025-04-06 06:07:02'),
(7, 'You are responsible for maintaining the confidentiality of your account and password and for restricting access to your device. We reserve the right to suspend or terminate accounts found to be violating our policies.', '2025-04-06 06:07:08', '2025-04-06 06:07:08'),
(8, 'We are not liable for any indirect, incidental, or consequential damages resulting from your use of our website or products. Your use of this site is at your own risk.\r\n\r\nWe respect your privacy and handle your personal information in accordance with our Privacy Policy. Please review it to understand how we collect, use, and safeguard your data.', '2025-04-06 06:07:16', '2025-04-06 06:07:16'),
(9, 'We reserve the right to update or modify these Terms and Conditions at any time. Continued use of our website following any changes indicates your acceptance of those changes.\r\n\r\nThese Terms shall be governed by and construed in accordance with the laws of [Your Country/State], without regard to its conflict of law principles.', '2025-04-06 06:07:24', '2025-04-06 06:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `topmars`
--

CREATE TABLE `topmars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `external_link` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `external_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'uploads/20241009114759_804415.jpg', 1, 70, 'jpg', 'image', NULL, '2024-10-09 16:47:59', '2024-10-09 16:47:59', NULL),
(2, NULL, 'uploads/more/20241009114800_776036.jpg', 1, 59, 'jpg', 'image', NULL, '2024-10-09 16:48:00', '2024-10-09 16:48:00', NULL),
(3, NULL, 'uploads/more/20241009114800_720769.jpg', 1, 66, 'jpg', 'image', NULL, '2024-10-09 16:48:00', '2024-10-09 16:48:00', NULL),
(4, NULL, 'uploads/more/20241009114800_928047.jpg', 1, 63, 'jpg', 'image', NULL, '2024-10-09 16:48:00', '2024-10-09 16:48:00', NULL),
(5, NULL, 'uploads/more/20241009114801_984193.jpg', 1, 99, 'jpg', 'image', NULL, '2024-10-09 16:48:01', '2024-10-09 16:48:01', NULL),
(6, NULL, 'uploads/more/20241009114801_750804.jpg', 1, 64, 'jpg', 'image', NULL, '2024-10-09 16:48:01', '2024-10-09 16:48:01', NULL),
(7, NULL, 'uploads/20241009114905_380244.jpg', 1, 70, 'jpg', 'image', NULL, '2024-10-09 16:49:05', '2024-10-09 16:49:05', NULL),
(8, NULL, 'uploads/more/20241009114906_831672.jpg', 1, 59, 'jpg', 'image', NULL, '2024-10-09 16:49:06', '2024-10-09 16:49:06', NULL),
(9, NULL, 'uploads/more/20241009114906_697339.jpg', 1, 66, 'jpg', 'image', NULL, '2024-10-09 16:49:06', '2024-10-09 16:49:06', NULL),
(10, NULL, 'uploads/more/20241009114906_346818.jpg', 1, 63, 'jpg', 'image', NULL, '2024-10-09 16:49:06', '2024-10-09 16:49:06', NULL),
(11, NULL, 'uploads/more/20241009114906_375918.jpg', 1, 99, 'jpg', 'image', NULL, '2024-10-09 16:49:07', '2024-10-09 16:49:07', NULL),
(12, NULL, 'uploads/more/20241009114907_364986.jpg', 1, 64, 'jpg', 'image', NULL, '2024-10-09 16:49:07', '2024-10-09 16:49:07', NULL),
(39, NULL, 'uploads/20241009162035_300126.jpg', 1, 70, 'jpg', 'image', NULL, '2024-10-09 21:20:35', '2024-10-09 21:20:35', NULL),
(40, NULL, 'uploads/more/20241009162035_868175.jpg', 1, 59, 'jpg', 'image', NULL, '2024-10-09 21:20:35', '2024-10-09 21:20:35', NULL),
(41, NULL, 'uploads/more/20241009162035_995419.jpg', 1, 66, 'jpg', 'image', NULL, '2024-10-09 21:20:35', '2024-10-09 21:20:35', NULL),
(42, NULL, 'uploads/more/20241009162035_263762.jpg', 1, 63, 'jpg', 'image', NULL, '2024-10-09 21:20:35', '2024-10-09 21:20:35', NULL),
(43, NULL, 'uploads/more/20241009162035_993584.jpg', 1, 99, 'jpg', 'image', NULL, '2024-10-09 21:20:36', '2024-10-09 21:20:36', NULL),
(44, NULL, 'uploads/20241009162842_740346.jpg', 1, 45, 'jpg', 'image', NULL, '2024-10-09 21:28:42', '2024-10-09 21:28:42', NULL),
(45, NULL, 'uploads/20241009163033_230805.jpg', 1, 14, 'jpg', 'image', NULL, '2024-10-09 21:30:33', '2024-10-09 21:30:33', NULL),
(46, NULL, 'uploads/20241009163118_843168.jpg', 1, 59, 'jpg', 'image', NULL, '2024-10-09 21:31:18', '2024-10-09 21:31:18', NULL),
(47, NULL, 'uploads/20241009170457_569726.jpg', 1, 118, 'jpg', 'image', NULL, '2024-10-09 22:04:57', '2024-10-09 22:04:57', NULL),
(48, NULL, 'uploads/20241009170554_539546.jpg', 1, 66, 'jpg', 'image', NULL, '2024-10-09 22:05:54', '2024-10-09 22:05:54', NULL),
(56, NULL, 'uploads/20241009181309_864566.jpg', 1, 57, 'jpg', 'image', NULL, '2024-10-09 23:13:10', '2024-10-09 23:13:10', NULL),
(57, NULL, 'uploads/20241009181653_999872.jpg', 1, 45, 'jpg', 'image', NULL, '2024-10-09 23:16:53', '2024-10-09 23:16:53', NULL),
(58, NULL, 'uploads/more/20241009181653_279205.jpg', 1, 64, 'jpg', 'image', NULL, '2024-10-09 23:16:54', '2024-10-09 23:16:54', NULL),
(59, NULL, 'uploads/more/20241009181654_771559.jpg', 1, 49, 'jpg', 'image', NULL, '2024-10-09 23:16:54', '2024-10-09 23:16:54', NULL),
(60, NULL, 'uploads/more/20241009181654_972995.jpg', 1, 24, 'jpg', 'image', NULL, '2024-10-09 23:16:54', '2024-10-09 23:16:54', NULL),
(86, NULL, 'uploads/20241010051545_506404.jpg', 1, 21, 'jpg', 'image', NULL, '2024-10-10 10:15:46', '2024-10-10 10:15:46', NULL),
(87, NULL, 'uploads/20241010051730_711479.jpg', 1, 64, 'jpg', 'image', NULL, '2024-10-10 10:17:30', '2024-10-10 10:17:30', NULL),
(88, NULL, 'uploads/20241010051935_567405.jpg', 1, 64, 'jpg', 'image', NULL, '2024-10-10 10:19:35', '2024-10-10 10:19:35', NULL),
(89, NULL, 'uploads/20241010052327_515234.jpg', 1, 66, 'jpg', 'image', NULL, '2024-10-10 10:23:27', '2024-10-10 10:23:27', NULL),
(90, NULL, 'uploads/20241010052443_714088.jpg', 1, 45, 'jpg', 'image', NULL, '2024-10-10 10:24:44', '2024-10-10 10:24:44', NULL),
(91, NULL, 'uploads/20241012095856_623203.jpg', 1, 63, 'jpg', 'image', NULL, '2024-10-12 14:58:56', '2024-10-12 14:58:56', NULL),
(92, NULL, 'uploads/more/20241012101254_306099.jpg', 1, 57, 'jpg', 'image', NULL, '2024-10-12 15:12:54', '2024-10-12 15:12:54', NULL),
(93, NULL, 'uploads/more/20241012101254_761969.jpg', 1, 76, 'jpg', 'image', NULL, '2024-10-12 15:12:54', '2024-10-12 15:12:54', NULL),
(94, NULL, 'uploads/more/20241012101255_759908.jpg', 1, 45, 'jpg', 'image', NULL, '2024-10-12 15:12:55', '2024-10-12 15:12:55', NULL),
(95, NULL, 'uploads/20241012110752_770728.jpg', 1, 20, 'jpg', 'image', NULL, '2024-10-12 16:07:52', '2024-10-12 16:07:52', NULL),
(96, NULL, 'uploads/more/20241012110752_699830.jpg', 1, 35, 'jpg', 'image', NULL, '2024-10-12 16:07:52', '2024-10-12 16:07:52', NULL),
(97, NULL, 'uploads/more/20241012110752_759093.jpg', 1, 35, 'jpg', 'image', NULL, '2024-10-12 16:07:52', '2024-10-12 16:07:52', NULL),
(98, NULL, 'uploads/more/20241012110752_576572.jpg', 1, 35, 'jpg', 'image', NULL, '2024-10-12 16:07:52', '2024-10-12 16:07:52', NULL),
(99, NULL, 'uploads/more/20241012110752_867315.jpg', 1, 35, 'jpg', 'image', NULL, '2024-10-12 16:07:53', '2024-10-12 16:07:53', NULL),
(100, NULL, 'uploads/20241012111023_552472.jpg', 1, 7, 'jpg', 'image', NULL, '2024-10-12 16:10:23', '2024-10-12 16:10:23', NULL),
(101, NULL, 'uploads/more/20241012111023_713041.jpg', 1, 35, 'jpg', 'image', NULL, '2024-10-12 16:10:24', '2024-10-12 16:10:24', NULL),
(102, NULL, 'uploads/more/20241012111024_871038.jpg', 1, 35, 'jpg', 'image', NULL, '2024-10-12 16:10:24', '2024-10-12 16:10:24', NULL),
(103, NULL, 'uploads/more/20241012111024_172716.jpg', 1, 35, 'jpg', 'image', NULL, '2024-10-12 16:10:24', '2024-10-12 16:10:24', NULL),
(104, NULL, 'uploads/more/20241012111024_777715.jpg', 1, 35, 'jpg', 'image', NULL, '2024-10-12 16:10:24', '2024-10-12 16:10:24', NULL),
(105, NULL, 'uploads/20241012111412_280604.jpg', 1, 21, 'jpg', 'image', NULL, '2024-10-12 16:14:12', '2024-10-12 16:14:12', NULL),
(106, NULL, 'uploads/more/20241012111412_787450.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:14:12', '2024-10-12 16:14:12', NULL),
(107, NULL, 'uploads/more/20241012111412_827663.jpg', 1, 13, 'jpg', 'image', NULL, '2024-10-12 16:14:12', '2024-10-12 16:14:12', NULL),
(108, NULL, 'uploads/more/20241012111412_204525.jpg', 1, 22, 'jpg', 'image', NULL, '2024-10-12 16:14:13', '2024-10-12 16:14:13', NULL),
(109, NULL, 'uploads/more/20241012111413_170054.jpg', 1, 23, 'jpg', 'image', NULL, '2024-10-12 16:14:13', '2024-10-12 16:14:13', NULL),
(110, NULL, 'uploads/20241012111537_169739.jpg', 1, 9, 'jpg', 'image', NULL, '2024-10-12 16:15:37', '2024-10-12 16:15:37', NULL),
(111, NULL, 'uploads/more/20241012111537_591361.jpg', 1, 4, 'jpg', 'image', NULL, '2024-10-12 16:15:37', '2024-10-12 16:15:37', NULL),
(112, NULL, 'uploads/more/20241012111537_156150.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:15:38', '2024-10-12 16:15:38', NULL),
(113, NULL, 'uploads/more/20241012111538_756590.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:15:38', '2024-10-12 16:15:38', NULL),
(114, NULL, 'uploads/20241012111640_331395.jpg', 1, 13, 'jpg', 'image', NULL, '2024-10-12 16:16:40', '2024-10-12 16:16:40', NULL),
(115, NULL, 'uploads/more/20241012111640_938993.jpg', 1, 11, 'jpg', 'image', NULL, '2024-10-12 16:16:41', '2024-10-12 16:16:41', NULL),
(116, NULL, 'uploads/more/20241012111641_914461.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:16:41', '2024-10-12 16:16:41', NULL),
(117, NULL, 'uploads/more/20241012111641_945221.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:16:41', '2024-10-12 16:16:41', NULL),
(118, NULL, 'uploads/more/20241012111641_519129.jpg', 1, 13, 'jpg', 'image', NULL, '2024-10-12 16:16:41', '2024-10-12 16:16:41', NULL),
(119, NULL, 'uploads/20241012111807_468253.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:18:07', '2024-10-12 16:18:07', NULL),
(120, NULL, 'uploads/more/20241012111807_707046.jpg', 1, 7, 'jpg', 'image', NULL, '2024-10-12 16:18:07', '2024-10-12 16:18:07', NULL),
(121, NULL, 'uploads/more/20241012111807_883364.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:18:07', '2024-10-12 16:18:07', NULL),
(122, NULL, 'uploads/more/20241012111808_404243.jpg', 1, 22, 'jpg', 'image', NULL, '2024-10-12 16:18:08', '2024-10-12 16:18:08', NULL),
(123, NULL, 'uploads/more/20241012111808_908229.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:18:08', '2024-10-12 16:18:08', NULL),
(124, NULL, 'uploads/20241012111913_790003.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:19:13', '2024-10-12 16:19:13', NULL),
(125, NULL, 'uploads/more/20241012111913_302980.jpg', 1, 7, 'jpg', 'image', NULL, '2024-10-12 16:19:13', '2024-10-12 16:19:13', NULL),
(126, NULL, 'uploads/more/20241012111913_446386.jpg', 1, 7, 'jpg', 'image', NULL, '2024-10-12 16:19:13', '2024-10-12 16:19:13', NULL),
(127, NULL, 'uploads/more/20241012111913_360962.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:19:13', '2024-10-12 16:19:13', NULL),
(128, NULL, 'uploads/more/20241012111913_727685.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:19:13', '2024-10-12 16:19:13', NULL),
(129, NULL, 'uploads/20241012112025_788040.jpg', 1, 9, 'jpg', 'image', NULL, '2024-10-12 16:20:25', '2024-10-12 16:20:25', NULL),
(130, NULL, 'uploads/more/20241012112025_295403.jpg', 1, 11, 'jpg', 'image', NULL, '2024-10-12 16:20:25', '2024-10-12 16:20:25', NULL),
(131, NULL, 'uploads/more/20241012112025_120834.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:20:25', '2024-10-12 16:20:25', NULL),
(132, NULL, 'uploads/more/20241012112025_522216.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:20:25', '2024-10-12 16:20:25', NULL),
(133, NULL, 'uploads/more/20241012112025_347905.jpg', 1, 13, 'jpg', 'image', NULL, '2024-10-12 16:20:26', '2024-10-12 16:20:26', NULL),
(134, NULL, 'uploads/20241012112140_241903.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:21:40', '2024-10-12 16:21:40', NULL),
(135, NULL, 'uploads/more/20241012112140_363883.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:21:41', '2024-10-12 16:21:41', NULL),
(136, NULL, 'uploads/more/20241012112141_623444.jpg', 1, 21, 'jpg', 'image', NULL, '2024-10-12 16:21:41', '2024-10-12 16:21:41', NULL),
(137, NULL, 'uploads/more/20241012112141_995311.jpg', 1, 9, 'jpg', 'image', NULL, '2024-10-12 16:21:41', '2024-10-12 16:21:41', NULL),
(138, NULL, 'uploads/more/20241012112141_119587.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:21:41', '2024-10-12 16:21:41', NULL),
(139, NULL, 'uploads/20241012112232_398989.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:22:32', '2024-10-12 16:22:32', NULL),
(140, NULL, 'uploads/more/20241012112232_562875.jpg', 1, 13, 'jpg', 'image', NULL, '2024-10-12 16:22:32', '2024-10-12 16:22:32', NULL),
(141, NULL, 'uploads/more/20241012112232_109861.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:22:32', '2024-10-12 16:22:32', NULL),
(142, NULL, 'uploads/more/20241012112232_198140.jpg', 1, 7, 'jpg', 'image', NULL, '2024-10-12 16:22:32', '2024-10-12 16:22:32', NULL),
(143, NULL, 'uploads/more/20241012112232_932858.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:22:33', '2024-10-12 16:22:33', NULL),
(144, NULL, 'uploads/more/20241012112302_475636.jpg', 1, 9, 'jpg', 'image', NULL, '2024-10-12 16:23:02', '2024-10-12 16:23:02', NULL),
(145, NULL, 'uploads/more/20241012112302_207110.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:23:02', '2024-10-12 16:23:02', NULL),
(146, NULL, 'uploads/more/20241012112303_645615.jpg', 1, 9, 'jpg', 'image', NULL, '2024-10-12 16:23:03', '2024-10-12 16:23:03', NULL),
(147, NULL, 'uploads/20241012112318_700262.jpg', 1, 23, 'jpg', 'image', NULL, '2024-10-12 16:23:19', '2024-10-12 16:23:19', NULL),
(153, NULL, 'uploads/20241012112432_824405.jpg', 1, 6, 'jpg', 'image', NULL, '2024-10-12 16:24:32', '2024-10-12 16:24:32', NULL),
(154, NULL, 'uploads/more/20241012112432_401792.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:24:32', '2024-10-12 16:24:32', NULL),
(155, NULL, 'uploads/more/20241012112432_476433.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:24:32', '2024-10-12 16:24:32', NULL),
(156, NULL, 'uploads/more/20241012112432_981073.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 16:24:32', '2024-10-12 16:24:32', NULL),
(157, NULL, 'uploads/more/20241012112433_306765.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:24:33', '2024-10-12 16:24:33', NULL),
(158, NULL, 'uploads/20241012112520_671009.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:25:20', '2024-10-12 16:25:20', NULL),
(159, NULL, 'uploads/more/20241012112520_136989.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 16:25:20', '2024-10-12 16:25:20', NULL),
(160, NULL, 'uploads/more/20241012112520_432957.jpg', 1, 13, 'jpg', 'image', NULL, '2024-10-12 16:25:20', '2024-10-12 16:25:20', NULL),
(161, NULL, 'uploads/more/20241012112520_947007.jpg', 1, 22, 'jpg', 'image', NULL, '2024-10-12 16:25:20', '2024-10-12 16:25:20', NULL),
(162, NULL, 'uploads/more/20241012112520_732444.jpg', 1, 23, 'jpg', 'image', NULL, '2024-10-12 16:25:20', '2024-10-12 16:25:20', NULL),
(163, NULL, 'uploads/more/20241012112521_702739.jpg', 1, 15, 'jpg', 'image', NULL, '2024-10-12 16:25:21', '2024-10-12 16:25:21', NULL),
(164, NULL, 'uploads/more/20241012112521_623446.jpg', 1, 4, 'jpg', 'image', NULL, '2024-10-12 16:25:21', '2024-10-12 16:25:21', NULL),
(165, NULL, 'uploads/20241012172557_535222.jpg', 1, 7, 'jpg', 'image', NULL, '2024-10-12 22:25:57', '2024-10-12 22:25:57', NULL),
(166, NULL, 'uploads/more/20241012172557_882329.jpg', 1, 10, 'jpg', 'image', NULL, '2024-10-12 22:25:57', '2024-10-12 22:25:57', NULL),
(167, NULL, 'uploads/more/20241012172557_230819.jpg', 1, 13, 'jpg', 'image', NULL, '2024-10-12 22:25:57', '2024-10-12 22:25:57', NULL),
(168, NULL, 'uploads/more/20241012172558_239724.jpg', 1, 22, 'jpg', 'image', NULL, '2024-10-12 22:25:58', '2024-10-12 22:25:58', NULL),
(189, NULL, 'uploads/20241012173452_565405.jpg', 1, 7, 'jpg', 'image', NULL, '2024-10-12 22:34:52', '2024-10-12 22:34:52', NULL),
(190, NULL, 'uploads/more/20241012173452_923748.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 22:34:52', '2024-10-12 22:34:52', NULL),
(191, NULL, 'uploads/more/20241012173452_504651.jpg', 1, 11, 'jpg', 'image', NULL, '2024-10-12 22:34:52', '2024-10-12 22:34:52', NULL),
(192, NULL, 'uploads/more/20241012173452_819158.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 22:34:52', '2024-10-12 22:34:52', NULL),
(193, NULL, 'uploads/20241012174243_442295.jpg', 1, 8, 'jpg', 'image', NULL, '2024-10-12 22:42:43', '2024-10-12 22:42:43', NULL),
(198, NULL, 'uploads/20250108152759_898049.png', 4, 152, 'png', 'image', NULL, '2025-01-08 21:27:59', '2025-01-08 21:27:59', NULL),
(199, NULL, 'uploads/more/20250108152759_573303.jpg', 4, 45, 'jpg', 'image', NULL, '2025-01-08 21:27:59', '2025-01-08 21:27:59', NULL),
(206, NULL, 'uploads/20250108155856_729187.png', 4, 436, 'png', 'image', NULL, '2025-01-08 21:58:56', '2025-01-08 21:58:56', NULL),
(207, NULL, 'uploads/more/20250108155856_618251.jpg', 4, 45, 'jpg', 'image', NULL, '2025-01-08 21:58:56', '2025-01-08 21:58:56', NULL),
(216, NULL, 'uploads/20250111104221_131524.jpg', 4, 37, 'jpg', 'image', NULL, '2025-01-11 16:42:22', '2025-01-11 16:42:22', NULL),
(217, NULL, 'uploads/more/20250111104222_416449.jpg', 4, 759, 'jpg', 'image', NULL, '2025-01-11 16:42:22', '2025-01-11 16:42:22', NULL),
(218, NULL, 'uploads/more/20250111104222_516239.jpg', 4, 32, 'jpg', 'image', NULL, '2025-01-11 16:42:22', '2025-01-11 16:42:22', NULL),
(219, NULL, 'uploads/20250111104956_188700.jpg', 4, 572, 'jpg', 'image', NULL, '2025-01-11 16:49:56', '2025-01-11 16:49:56', NULL),
(220, NULL, 'uploads/more/20250111104956_484278.jpg', 4, 572, 'jpg', 'image', NULL, '2025-01-11 16:49:56', '2025-01-11 16:49:56', NULL),
(221, NULL, 'uploads/more/20250111104956_833925.jpg', 4, 499, 'jpg', 'image', NULL, '2025-01-11 16:49:56', '2025-01-11 16:49:56', NULL),
(222, NULL, 'uploads/more/20250111104956_553735.jpg', 4, 350, 'jpg', 'image', NULL, '2025-01-11 16:49:56', '2025-01-11 16:49:56', NULL),
(223, NULL, 'uploads/more/20250111104956_779790.jpg', 4, 313, 'jpg', 'image', NULL, '2025-01-11 16:49:56', '2025-01-11 16:49:56', NULL),
(224, NULL, 'uploads/20250111105331_487651.jpg', 4, 235, 'jpg', 'image', NULL, '2025-01-11 16:53:31', '2025-01-11 16:53:31', NULL),
(225, NULL, 'uploads/more/20250111105331_866238.jpg', 4, 499, 'jpg', 'image', NULL, '2025-01-11 16:53:31', '2025-01-11 16:53:31', NULL),
(226, NULL, 'uploads/more/20250111105331_279833.jpg', 4, 350, 'jpg', 'image', NULL, '2025-01-11 16:53:31', '2025-01-11 16:53:31', NULL),
(227, NULL, 'uploads/more/20250111105331_293308.jpg', 4, 313, 'jpg', 'image', NULL, '2025-01-11 16:53:31', '2025-01-11 16:53:31', NULL),
(228, NULL, 'uploads/more/20250111121204_597988.jpg', 4, 313, 'jpg', 'image', NULL, '2025-01-11 18:12:04', '2025-01-11 18:12:04', NULL),
(229, NULL, 'uploads/more/20250111121204_992566.jpg', 4, 235, 'jpg', 'image', NULL, '2025-01-11 18:12:04', '2025-01-11 18:12:04', NULL),
(230, NULL, 'uploads/more/20250111121204_320234.jpg', 4, 256, 'jpg', 'image', NULL, '2025-01-11 18:12:04', '2025-01-11 18:12:04', NULL),
(231, NULL, 'uploads/20250111121330_619661.jpg', 4, 499, 'jpg', 'image', NULL, '2025-01-11 18:13:30', '2025-01-11 18:13:30', NULL),
(237, NULL, 'uploads/20250111124739_556025.jpg', 4, 36, 'jpg', 'image', NULL, '2025-01-11 18:47:39', '2025-01-11 18:47:39', NULL),
(238, NULL, 'uploads/more/20250111124739_152224.jpg', 4, 759, 'jpg', 'image', NULL, '2025-01-11 18:47:39', '2025-01-11 18:47:39', NULL),
(239, NULL, 'uploads/more/20250111124739_817029.jpg', 4, 759, 'jpg', 'image', NULL, '2025-01-11 18:47:39', '2025-01-11 18:47:39', NULL),
(240, NULL, 'uploads/more/20250111124739_680340.jpg', 4, 32, 'jpg', 'image', NULL, '2025-01-11 18:47:39', '2025-01-11 18:47:39', NULL),
(241, NULL, 'uploads/20250111125722_195692.jpg', 4, 499, 'jpg', 'image', NULL, '2025-01-11 18:57:22', '2025-01-11 18:57:22', NULL),
(242, NULL, 'uploads/more/20250111125722_233918.jpg', 4, 572, 'jpg', 'image', NULL, '2025-01-11 18:57:22', '2025-01-11 18:57:22', NULL),
(243, NULL, 'uploads/more/20250111125722_542924.jpg', 4, 499, 'jpg', 'image', NULL, '2025-01-11 18:57:22', '2025-01-11 18:57:22', NULL),
(244, NULL, 'uploads/more/20250111125722_370560.jpg', 4, 350, 'jpg', 'image', NULL, '2025-01-11 18:57:22', '2025-01-11 18:57:22', NULL),
(245, NULL, 'uploads/20250111130256_620273.jpg', 4, 572, 'jpg', 'image', NULL, '2025-01-11 19:02:56', '2025-01-11 19:02:56', NULL),
(246, NULL, 'uploads/more/20250111130256_860917.jpg', 4, 572, 'jpg', 'image', NULL, '2025-01-11 19:02:56', '2025-01-11 19:02:56', NULL),
(247, NULL, 'uploads/more/20250111130256_704123.jpg', 4, 499, 'jpg', 'image', NULL, '2025-01-11 19:02:56', '2025-01-11 19:02:56', NULL),
(248, NULL, 'uploads/20250111134441_949123.jpg', 4, 313, 'jpg', 'image', NULL, '2025-01-11 19:44:41', '2025-01-11 19:44:41', NULL),
(249, NULL, 'uploads/more/20250111134441_471482.jpg', 4, 313, 'jpg', 'image', NULL, '2025-01-11 19:44:41', '2025-01-11 19:44:41', NULL),
(250, NULL, 'uploads/20250112144557_869891.jpg', 4, 572, 'jpg', 'image', NULL, '2025-01-12 20:45:58', '2025-01-12 20:45:58', NULL),
(251, NULL, 'uploads/more/20250112144558_230816.jpg', 4, 572, 'jpg', 'image', NULL, '2025-01-12 20:45:58', '2025-01-12 20:45:58', NULL),
(252, NULL, 'uploads/20250112151032_309631.jpg', 4, 499, 'jpg', 'image', NULL, '2025-01-12 21:10:32', '2025-01-12 21:10:32', NULL),
(253, NULL, 'uploads/more/20250112151032_270611.jpg', 4, 499, 'jpg', 'image', NULL, '2025-01-12 21:10:32', '2025-01-12 21:10:32', NULL),
(254, NULL, 'uploads/20250112151305_634098.jpg', 4, 350, 'jpg', 'image', NULL, '2025-01-12 21:13:05', '2025-01-12 21:13:05', NULL),
(255, NULL, 'uploads/more/20250112151306_979860.jpg', 4, 350, 'jpg', 'image', NULL, '2025-01-12 21:13:06', '2025-01-12 21:13:06', NULL),
(256, NULL, 'uploads/20250112151537_123454.jpg', 4, 381, 'jpg', 'image', NULL, '2025-01-12 21:15:37', '2025-01-12 21:15:37', NULL),
(257, NULL, 'uploads/more/20250112151537_985250.jpg', 4, 381, 'jpg', 'image', NULL, '2025-01-12 21:15:37', '2025-01-12 21:15:37', NULL),
(258, NULL, 'uploads/20250112151844_362254.jpg', 4, 759, 'jpg', 'image', NULL, '2025-01-12 21:18:44', '2025-01-12 21:18:44', NULL),
(259, NULL, 'uploads/more/20250112151844_456720.jpg', 4, 759, 'jpg', 'image', NULL, '2025-01-12 21:18:44', '2025-01-12 21:18:44', NULL),
(260, NULL, 'uploads/20250112152112_617139.jpg', 4, 32, 'jpg', 'image', NULL, '2025-01-12 21:21:12', '2025-01-12 21:21:12', NULL),
(261, NULL, 'uploads/more/20250112152112_918372.jpg', 4, 32, 'jpg', 'image', NULL, '2025-01-12 21:21:12', '2025-01-12 21:21:12', NULL),
(262, NULL, 'uploads/20250112152447_245476.jpg', 4, 36, 'jpg', 'image', NULL, '2025-01-12 21:24:47', '2025-01-12 21:24:47', NULL),
(263, NULL, 'uploads/more/20250112152447_366699.jpg', 4, 36, 'jpg', 'image', NULL, '2025-01-12 21:24:47', '2025-01-12 21:24:47', NULL),
(264, NULL, 'uploads/20250112152634_549029.jpg', 4, 37, 'jpg', 'image', NULL, '2025-01-12 21:26:34', '2025-01-12 21:26:34', NULL),
(265, NULL, 'uploads/more/20250112152634_836157.jpg', 4, 37, 'jpg', 'image', NULL, '2025-01-12 21:26:34', '2025-01-12 21:26:34', NULL),
(266, NULL, 'uploads/20250112152819_630705.jpg', 4, 32, 'jpg', 'image', NULL, '2025-01-12 21:28:19', '2025-01-12 21:28:19', NULL),
(267, NULL, 'uploads/more/20250112152819_103963.jpg', 4, 32, 'jpg', 'image', NULL, '2025-01-12 21:28:19', '2025-01-12 21:28:19', NULL),
(271, NULL, 'uploads/20250309165532_826450.jpg', 1, 70, 'jpg', 'image', NULL, '2025-03-09 21:55:32', '2025-03-09 21:55:32', NULL),
(272, NULL, 'uploads/more/20250309165532_426959.jpg', 1, 70, 'jpg', 'image', NULL, '2025-03-09 21:55:32', '2025-03-09 21:55:32', NULL),
(273, NULL, 'uploads/20250310034524_577294.jpg', 1, 65, 'jpg', 'image', NULL, '2025-03-10 08:45:24', '2025-03-10 08:45:24', NULL),
(274, NULL, 'uploads/more/20250310034524_244236.jpg', 1, 65, 'jpg', 'image', NULL, '2025-03-10 08:45:24', '2025-03-10 08:45:24', NULL),
(275, NULL, 'uploads/20250310034652_449684.jpg', 1, 66, 'jpg', 'image', NULL, '2025-03-10 08:46:52', '2025-03-10 08:46:52', NULL),
(276, NULL, 'uploads/more/20250310034652_670647.jpg', 1, 66, 'jpg', 'image', NULL, '2025-03-10 08:46:52', '2025-03-10 08:46:52', NULL),
(277, NULL, 'uploads/20250310034817_481810.jpg', 1, 68, 'jpg', 'image', NULL, '2025-03-10 08:48:17', '2025-03-10 08:48:17', NULL),
(278, NULL, 'uploads/more/20250310034817_530137.jpg', 1, 68, 'jpg', 'image', NULL, '2025-03-10 08:48:17', '2025-03-10 08:48:17', NULL),
(279, NULL, 'uploads/20250310035819_799930.jpg', 1, 84, 'jpg', 'image', NULL, '2025-03-10 08:58:19', '2025-03-10 08:58:19', NULL),
(280, NULL, 'uploads/more/20250310035819_233732.jpg', 1, 84, 'jpg', 'image', NULL, '2025-03-10 08:58:19', '2025-03-10 08:58:19', NULL),
(281, NULL, 'uploads/20250310040006_496555.jpg', 1, 82, 'jpg', 'image', NULL, '2025-03-10 09:00:06', '2025-03-10 09:00:06', NULL),
(282, NULL, 'uploads/more/20250310040006_382825.jpg', 1, 82, 'jpg', 'image', NULL, '2025-03-10 09:00:06', '2025-03-10 09:00:06', NULL),
(283, NULL, 'uploads/20250310040419_267054.webp', 1, 12, 'webp', 'image', NULL, '2025-03-10 09:04:19', '2025-03-10 09:04:19', NULL),
(284, NULL, 'uploads/more/20250310040419_607391.webp', 1, 12, 'webp', 'image', NULL, '2025-03-10 09:04:19', '2025-03-10 09:04:19', NULL),
(285, NULL, 'uploads/20250310040559_975697.jpg', 1, 76, 'jpg', 'image', NULL, '2025-03-10 09:05:59', '2025-03-10 09:05:59', NULL),
(286, NULL, 'uploads/more/20250310040559_324965.jpg', 1, 76, 'jpg', 'image', NULL, '2025-03-10 09:05:59', '2025-03-10 09:05:59', NULL),
(287, NULL, 'uploads/20250310043941_122236.jpg', 1, 19, 'jpg', 'image', NULL, '2025-03-10 09:39:41', '2025-03-10 09:39:41', NULL),
(288, NULL, 'uploads/more/20250310043941_990974.jpg', 1, 19, 'jpg', 'image', NULL, '2025-03-10 09:39:41', '2025-03-10 09:39:41', NULL),
(289, NULL, 'uploads/20250310044402_355548.png', 1, 34, 'png', 'image', NULL, '2025-03-10 09:44:02', '2025-03-10 09:44:02', NULL),
(290, NULL, 'uploads/more/20250310044402_503461.png', 1, 34, 'png', 'image', NULL, '2025-03-10 09:44:02', '2025-03-10 09:44:02', NULL),
(291, NULL, 'uploads/20250310063240_516922.png', 1, 129, 'png', 'image', NULL, '2025-03-10 11:32:40', '2025-03-10 11:32:40', NULL),
(292, NULL, 'uploads/more/20250310063240_718827.png', 1, 1, 'png', 'image', NULL, '2025-03-10 11:32:40', '2025-03-10 11:32:40', NULL),
(293, NULL, 'uploads/more/20250310063240_981341.png', 1, 50, 'png', 'image', NULL, '2025-03-10 11:32:40', '2025-03-10 11:32:40', NULL),
(294, NULL, 'uploads/more/20250310063240_402401.png', 1, 129, 'png', 'image', NULL, '2025-03-10 11:32:40', '2025-03-10 11:32:40', NULL),
(295, NULL, 'uploads/20250310063916_517049.jpg', 1, 69, 'jpg', 'image', NULL, '2025-03-10 11:39:16', '2025-03-10 11:39:16', NULL),
(296, NULL, 'uploads/more/20250310063916_996307.jpg', 1, 69, 'jpg', 'image', NULL, '2025-03-10 11:39:16', '2025-03-10 11:39:16', NULL),
(297, NULL, 'uploads/20250316081842_795287.webp', 1, 16, 'webp', 'image', NULL, '2025-03-16 13:18:42', '2025-03-16 13:18:42', NULL),
(298, NULL, 'uploads/more/20250316081842_241515.webp', 1, 16, 'webp', 'image', NULL, '2025-03-16 13:18:42', '2025-03-16 13:18:42', NULL),
(299, NULL, 'uploads/20250316082226_367985.jpg', 1, 75, 'jpg', 'image', NULL, '2025-03-16 13:22:26', '2025-03-16 13:22:26', NULL),
(300, NULL, 'uploads/more/20250316082226_991955.jpg', 1, 75, 'jpg', 'image', NULL, '2025-03-16 13:22:26', '2025-03-16 13:22:26', NULL),
(301, NULL, 'uploads/20250316082344_784681.jpg', 1, 630, 'jpg', 'image', NULL, '2025-03-16 13:23:44', '2025-03-16 13:23:44', NULL),
(302, NULL, 'uploads/more/20250316082344_666372.jpg', 1, 630, 'jpg', 'image', NULL, '2025-03-16 13:23:44', '2025-03-16 13:23:44', NULL),
(303, NULL, 'uploads/20250316082441_650421.jpg', 1, 532, 'jpg', 'image', NULL, '2025-03-16 13:24:41', '2025-03-16 13:24:41', NULL),
(304, NULL, 'uploads/more/20250316082441_625775.jpg', 1, 532, 'jpg', 'image', NULL, '2025-03-16 13:24:41', '2025-03-16 13:24:41', NULL),
(305, NULL, 'uploads/20250316082544_995798.jpg', 1, 600, 'jpg', 'image', NULL, '2025-03-16 13:25:44', '2025-03-16 13:25:44', NULL),
(306, NULL, 'uploads/more/20250316082544_190795.jpg', 1, 600, 'jpg', 'image', NULL, '2025-03-16 13:25:44', '2025-03-16 13:25:44', NULL),
(307, NULL, 'uploads/20250316082626_834827.jpg', 1, 523, 'jpg', 'image', NULL, '2025-03-16 13:26:26', '2025-03-16 13:26:26', NULL),
(308, NULL, 'uploads/more/20250316082626_617550.jpg', 1, 523, 'jpg', 'image', NULL, '2025-03-16 13:26:26', '2025-03-16 13:26:26', NULL),
(309, NULL, 'uploads/20250316082828_218981.png', 1, 228, 'png', 'image', NULL, '2025-03-16 13:28:28', '2025-03-16 13:28:28', NULL),
(310, NULL, 'uploads/more/20250316082828_376174.png', 1, 228, 'png', 'image', NULL, '2025-03-16 13:28:28', '2025-03-16 13:28:28', NULL),
(311, NULL, 'uploads/20250316083727_491428.png', 1, 253, 'png', 'image', NULL, '2025-03-16 13:37:27', '2025-03-16 13:37:27', NULL),
(312, NULL, 'uploads/more/20250316083727_905512.png', 1, 253, 'png', 'image', NULL, '2025-03-16 13:37:27', '2025-03-16 13:37:27', NULL),
(313, NULL, 'uploads/20250316084044_315954.webp', 1, 32, 'webp', 'image', NULL, '2025-03-16 13:40:44', '2025-03-16 13:40:44', NULL),
(314, NULL, 'uploads/more/20250316084044_775047.webp', 1, 32, 'webp', 'image', NULL, '2025-03-16 13:40:44', '2025-03-16 13:40:44', NULL),
(315, NULL, 'uploads/20250316085444_373134.jpg', 1, 630, 'jpg', 'image', NULL, '2025-03-16 13:54:44', '2025-03-16 13:54:44', NULL),
(316, NULL, 'uploads/more/20250316085444_400986.jpg', 1, 630, 'jpg', 'image', NULL, '2025-03-16 13:54:44', '2025-03-16 13:54:44', NULL),
(317, NULL, 'uploads/20250316085808_564824.jpg', 1, 620, 'jpg', 'image', NULL, '2025-03-16 13:58:08', '2025-03-16 13:58:08', NULL),
(318, NULL, 'uploads/more/20250316085808_764018.jpg', 1, 620, 'jpg', 'image', NULL, '2025-03-16 13:58:08', '2025-03-16 13:58:08', NULL),
(319, NULL, 'uploads/20250316085922_930776.jpg', 1, 32, 'jpg', 'image', NULL, '2025-03-16 13:59:22', '2025-03-16 13:59:22', NULL),
(320, NULL, 'uploads/more/20250316085922_638403.jpg', 1, 32, 'jpg', 'image', NULL, '2025-03-16 13:59:22', '2025-03-16 13:59:22', NULL),
(321, NULL, 'uploads/20250317033353_771314.jpg', 1, 532, 'jpg', 'image', NULL, '2025-03-17 08:33:53', '2025-03-17 08:33:53', NULL),
(322, NULL, 'uploads/more/20250317033353_139505.jpg', 1, 532, 'jpg', 'image', NULL, '2025-03-17 08:33:53', '2025-03-17 08:33:53', NULL),
(323, NULL, 'uploads/20250317033617_966778.webp', 1, 74, 'webp', 'image', NULL, '2025-03-17 08:36:17', '2025-03-17 08:36:17', NULL),
(324, NULL, 'uploads/more/20250317033617_953250.webp', 1, 74, 'webp', 'image', NULL, '2025-03-17 08:36:17', '2025-03-17 08:36:17', NULL),
(325, NULL, 'uploads/20250325064224_323164.webp', 1, 20, 'webp', 'image', NULL, '2025-03-25 11:42:24', '2025-03-25 11:42:24', NULL),
(326, NULL, 'uploads/more/20250325064224_803769.webp', 1, 20, 'webp', 'image', NULL, '2025-03-25 11:42:24', '2025-03-25 11:42:24', NULL),
(327, NULL, 'uploads/20250325064311_852159.webp', 1, 15, 'webp', 'image', NULL, '2025-03-25 11:43:11', '2025-03-25 11:43:11', NULL),
(328, NULL, 'uploads/more/20250325064311_101447.webp', 1, 15, 'webp', 'image', NULL, '2025-03-25 11:43:11', '2025-03-25 11:43:11', NULL),
(329, NULL, 'uploads/20250325064357_831740.webp', 1, 67, 'webp', 'image', NULL, '2025-03-25 11:43:57', '2025-03-25 11:43:57', NULL),
(330, NULL, 'uploads/more/20250325064357_226927.webp', 1, 67, 'webp', 'image', NULL, '2025-03-25 11:43:57', '2025-03-25 11:43:57', NULL),
(331, NULL, 'uploads/20250325064441_373346.webp', 1, 45, 'webp', 'image', NULL, '2025-03-25 11:44:41', '2025-03-25 11:44:41', NULL),
(332, NULL, 'uploads/more/20250325064441_489460.webp', 1, 45, 'webp', 'image', NULL, '2025-03-25 11:44:41', '2025-03-25 11:44:41', NULL),
(333, NULL, 'uploads/20250325064754_473436.jpg', 1, 76, 'jpg', 'image', NULL, '2025-03-25 11:47:54', '2025-03-25 11:47:54', NULL),
(334, NULL, 'uploads/more/20250325064754_507668.jpg', 1, 76, 'jpg', 'image', NULL, '2025-03-25 11:47:54', '2025-03-25 11:47:54', NULL),
(335, NULL, 'uploads/20250325065230_214769.webp', 1, 53, 'webp', 'image', NULL, '2025-03-25 11:52:30', '2025-03-25 11:52:30', NULL),
(336, NULL, 'uploads/more/20250325065230_887968.webp', 1, 53, 'webp', 'image', NULL, '2025-03-25 11:52:30', '2025-03-25 11:52:30', NULL),
(337, NULL, 'uploads/20250325065711_251277.jpg', 1, 47, 'jpg', 'image', NULL, '2025-03-25 11:57:11', '2025-03-25 11:57:11', NULL),
(338, NULL, 'uploads/more/20250325065711_952240.jpg', 1, 47, 'jpg', 'image', NULL, '2025-03-25 11:57:11', '2025-03-25 11:57:11', NULL),
(339, NULL, 'uploads/20250325065748_923593.webp', 1, 6, 'webp', 'image', NULL, '2025-03-25 11:57:48', '2025-03-25 11:57:48', NULL),
(340, NULL, 'uploads/more/20250325065748_626086.webp', 1, 6, 'webp', 'image', NULL, '2025-03-25 11:57:48', '2025-03-25 11:57:48', NULL),
(341, NULL, 'uploads/20250325070401_536863.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:04:01', '2025-03-25 12:04:01', NULL),
(342, NULL, 'uploads/more/20250325070401_277245.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:04:01', '2025-03-25 12:04:01', NULL),
(343, NULL, 'uploads/20250325070440_757084.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:04:40', '2025-03-25 12:04:40', NULL),
(344, NULL, 'uploads/more/20250325070440_302981.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:04:40', '2025-03-25 12:04:40', NULL),
(345, NULL, 'uploads/20250325070628_647487.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:06:28', '2025-03-25 12:06:28', NULL),
(346, NULL, 'uploads/more/20250325070628_351016.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:06:28', '2025-03-25 12:06:28', NULL),
(347, NULL, 'uploads/20250325070811_599551.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:08:11', '2025-03-25 12:08:11', NULL),
(348, NULL, 'uploads/more/20250325070811_426742.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:08:11', '2025-03-25 12:08:11', NULL),
(349, NULL, 'uploads/20250325070919_231904.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:09:19', '2025-03-25 12:09:19', NULL),
(350, NULL, 'uploads/more/20250325070919_243697.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:09:19', '2025-03-25 12:09:19', NULL),
(351, NULL, 'uploads/20250325071007_631394.webp', 1, 81, 'webp', 'image', NULL, '2025-03-25 12:10:07', '2025-03-25 12:10:07', NULL),
(352, NULL, 'uploads/more/20250325071007_665806.jpg', 1, 532, 'jpg', 'image', NULL, '2025-03-25 12:10:07', '2025-03-25 12:10:07', NULL),
(353, NULL, 'uploads/20250325072329_669669.webp', 1, 24, 'webp', 'image', NULL, '2025-03-25 12:23:29', '2025-03-25 12:23:29', NULL),
(354, NULL, 'uploads/more/20250325072329_422813.webp', 1, 24, 'webp', 'image', NULL, '2025-03-25 12:23:29', '2025-03-25 12:23:29', NULL),
(355, NULL, 'uploads/20250325072553_918867.webp', 1, 20, 'webp', 'image', NULL, '2025-03-25 12:25:53', '2025-03-25 12:25:53', NULL),
(356, NULL, 'uploads/more/20250325072553_545280.webp', 1, 20, 'webp', 'image', NULL, '2025-03-25 12:25:53', '2025-03-25 12:25:53', NULL),
(357, NULL, 'uploads/20250325072735_286642.jpeg', 1, 54, 'jpeg', 'image', NULL, '2025-03-25 12:27:35', '2025-03-25 12:27:35', NULL),
(358, NULL, 'uploads/more/20250325072735_218983.jpeg', 1, 54, 'jpeg', 'image', NULL, '2025-03-25 12:27:35', '2025-03-25 12:27:35', NULL),
(359, NULL, 'uploads/20250325075116_937378.webp', 1, 60, 'webp', 'image', NULL, '2025-03-25 12:51:16', '2025-03-25 12:51:16', NULL),
(360, NULL, 'uploads/more/20250325075116_251893.jpg', 1, 632, 'jpg', 'image', NULL, '2025-03-25 12:51:16', '2025-03-25 12:51:16', NULL),
(361, NULL, 'uploads/20250325081358_419438.webp', 1, 27, 'webp', 'image', NULL, '2025-03-25 13:13:58', '2025-03-25 13:13:58', NULL),
(362, NULL, 'uploads/more/20250325081358_224586.webp', 1, 27, 'webp', 'image', NULL, '2025-03-25 13:13:58', '2025-03-25 13:13:58', NULL),
(363, NULL, 'uploads/20250325081524_654860.webp', 1, 37, 'webp', 'image', NULL, '2025-03-25 13:15:24', '2025-03-25 13:15:24', NULL),
(364, NULL, 'uploads/more/20250325081524_582101.webp', 1, 37, 'webp', 'image', NULL, '2025-03-25 13:15:24', '2025-03-25 13:15:24', NULL),
(365, NULL, 'uploads/more/20250325082130_819162.webp', 1, 32, 'webp', 'image', NULL, '2025-03-25 13:21:30', '2025-03-25 13:21:30', NULL),
(366, NULL, 'uploads/20250325082225_455311.webp', 1, 32, 'webp', 'image', NULL, '2025-03-25 13:22:25', '2025-03-25 13:22:25', NULL),
(367, NULL, 'uploads/20250325094150_801938.webp', 1, 36, 'webp', 'image', NULL, '2025-03-25 14:41:50', '2025-03-25 14:41:50', NULL),
(368, NULL, 'uploads/more/20250325094150_373597.webp', 1, 36, 'webp', 'image', NULL, '2025-03-25 14:41:50', '2025-03-25 14:41:50', NULL),
(369, NULL, 'uploads/20250325094321_938530.webp', 1, 33, 'webp', 'image', NULL, '2025-03-25 14:43:21', '2025-03-25 14:43:21', NULL),
(370, NULL, 'uploads/more/20250325094321_883094.webp', 1, 33, 'webp', 'image', NULL, '2025-03-25 14:43:21', '2025-03-25 14:43:21', NULL),
(371, NULL, 'uploads/20250325094423_578689.webp', 1, 33, 'webp', 'image', NULL, '2025-03-25 14:44:23', '2025-03-25 14:44:23', NULL),
(372, NULL, 'uploads/more/20250325094423_605664.webp', 1, 33, 'webp', 'image', NULL, '2025-03-25 14:44:23', '2025-03-25 14:44:23', NULL),
(373, NULL, 'uploads/20250325094620_811142.webp', 1, 27, 'webp', 'image', NULL, '2025-03-25 14:46:20', '2025-03-25 14:46:20', NULL),
(374, NULL, 'uploads/more/20250325094620_670274.webp', 1, 27, 'webp', 'image', NULL, '2025-03-25 14:46:20', '2025-03-25 14:46:20', NULL),
(375, NULL, 'uploads/20250325094756_763014.webp', 1, 43, 'webp', 'image', NULL, '2025-03-25 14:47:56', '2025-03-25 14:47:56', NULL),
(376, NULL, 'uploads/more/20250325094756_595473.webp', 1, 43, 'webp', 'image', NULL, '2025-03-25 14:47:56', '2025-03-25 14:47:56', NULL),
(377, NULL, 'uploads/20250325095717_540922.webp', 1, 20, 'webp', 'image', NULL, '2025-03-25 14:57:17', '2025-03-25 14:57:17', NULL),
(378, NULL, 'uploads/more/20250325095717_613202.webp', 1, 20, 'webp', 'image', NULL, '2025-03-25 14:57:17', '2025-03-25 14:57:17', NULL),
(379, NULL, 'uploads/20250325095809_796012.png', 1, 53, 'png', 'image', NULL, '2025-03-25 14:58:09', '2025-03-25 14:58:09', NULL),
(380, NULL, 'uploads/more/20250325095809_147943.png', 1, 53, 'png', 'image', NULL, '2025-03-25 14:58:09', '2025-03-25 14:58:09', NULL),
(381, NULL, 'uploads/20250325100010_231620.png', 1, 228, 'png', 'image', NULL, '2025-03-25 15:00:10', '2025-03-25 15:00:10', NULL),
(382, NULL, 'uploads/more/20250325100010_246107.png', 1, 228, 'png', 'image', NULL, '2025-03-25 15:00:10', '2025-03-25 15:00:10', NULL),
(383, NULL, 'uploads/20250325102132_268626.jpg', 1, 76, 'jpg', 'image', NULL, '2025-03-25 15:21:32', '2025-03-25 15:21:32', NULL),
(384, NULL, 'uploads/more/20250325102132_253541.jpg', 1, 76, 'jpg', 'image', NULL, '2025-03-25 15:21:32', '2025-03-25 15:21:32', NULL),
(385, NULL, 'uploads/20250325102233_914375.webp', 1, 12, 'webp', 'image', NULL, '2025-03-25 15:22:33', '2025-03-25 15:22:33', NULL),
(386, NULL, 'uploads/more/20250325102233_990052.webp', 1, 12, 'webp', 'image', NULL, '2025-03-25 15:22:33', '2025-03-25 15:22:33', NULL),
(387, NULL, 'uploads/20250326051418_134729.jpg', 1, 258, 'jpg', 'image', NULL, '2025-03-26 10:14:18', '2025-03-26 10:14:18', NULL),
(388, NULL, 'uploads/more/20250326051418_904095.jpg', 1, 258, 'jpg', 'image', NULL, '2025-03-26 10:14:18', '2025-03-26 10:14:18', NULL),
(389, NULL, 'uploads/20250326051554_748782.jpg', 1, 44, 'jpg', 'image', NULL, '2025-03-26 10:15:54', '2025-03-26 10:15:54', NULL),
(390, NULL, 'uploads/more/20250326051554_929378.jpg', 1, 44, 'jpg', 'image', NULL, '2025-03-26 10:15:54', '2025-03-26 10:15:54', NULL),
(391, NULL, 'uploads/20250326052029_104164.jpg', 1, 22, 'jpg', 'image', NULL, '2025-03-26 10:20:29', '2025-03-26 10:20:29', NULL),
(392, NULL, 'uploads/more/20250326052029_787511.jpg', 1, 22, 'jpg', 'image', NULL, '2025-03-26 10:20:29', '2025-03-26 10:20:29', NULL),
(393, NULL, 'uploads/20250326052652_108031.jpg', 1, 484, 'jpg', 'image', NULL, '2025-03-26 10:26:52', '2025-03-26 10:26:52', NULL),
(394, NULL, 'uploads/more/20250326052652_591910.jpg', 1, 484, 'jpg', 'image', NULL, '2025-03-26 10:26:52', '2025-03-26 10:26:52', NULL),
(395, NULL, 'uploads/20250326053357_944729.jpg', 1, 355, 'jpg', 'image', NULL, '2025-03-26 10:33:57', '2025-03-26 10:33:57', NULL),
(396, NULL, 'uploads/more/20250326053357_167529.jpg', 1, 355, 'jpg', 'image', NULL, '2025-03-26 10:33:57', '2025-03-26 10:33:57', NULL),
(397, NULL, 'uploads/20250326053531_322783.webp', 1, 18, 'webp', 'image', NULL, '2025-03-26 10:35:31', '2025-03-26 10:35:31', NULL),
(398, NULL, 'uploads/more/20250326053531_883081.webp', 1, 18, 'webp', 'image', NULL, '2025-03-26 10:35:31', '2025-03-26 10:35:31', NULL),
(399, NULL, 'uploads/20250326053715_874461.webp', 1, 18, 'webp', 'image', NULL, '2025-03-26 10:37:15', '2025-03-26 10:37:15', NULL),
(400, NULL, 'uploads/more/20250326053715_508774.webp', 1, 18, 'webp', 'image', NULL, '2025-03-26 10:37:15', '2025-03-26 10:37:15', NULL),
(401, NULL, 'uploads/20250326053800_204458.webp', 1, 18, 'webp', 'image', NULL, '2025-03-26 10:38:00', '2025-03-26 10:38:00', NULL),
(402, NULL, 'uploads/more/20250326053800_471327.webp', 1, 18, 'webp', 'image', NULL, '2025-03-26 10:38:00', '2025-03-26 10:38:00', NULL),
(403, NULL, 'uploads/20250326053955_914277.webp', 1, 41, 'webp', 'image', NULL, '2025-03-26 10:39:55', '2025-03-26 10:39:55', NULL),
(404, NULL, 'uploads/more/20250326053955_320963.webp', 1, 41, 'webp', 'image', NULL, '2025-03-26 10:39:55', '2025-03-26 10:39:55', NULL),
(405, NULL, 'uploads/20250326054117_165432.webp', 1, 18, 'webp', 'image', NULL, '2025-03-26 10:41:17', '2025-03-26 10:41:17', NULL),
(406, NULL, 'uploads/more/20250326054117_864782.webp', 1, 18, 'webp', 'image', NULL, '2025-03-26 10:41:17', '2025-03-26 10:41:17', NULL),
(407, NULL, 'uploads/20250326054153_865278.webp', 1, 41, 'webp', 'image', NULL, '2025-03-26 10:41:53', '2025-03-26 10:41:53', NULL),
(408, NULL, 'uploads/more/20250326054153_336504.webp', 1, 41, 'webp', 'image', NULL, '2025-03-26 10:41:53', '2025-03-26 10:41:53', NULL),
(409, NULL, 'uploads/20250326054359_628458.webp', 1, 18, 'webp', 'image', NULL, '2025-03-26 10:43:59', '2025-03-26 10:43:59', NULL),
(410, NULL, 'uploads/more/20250326054359_465212.webp', 1, 18, 'webp', 'image', NULL, '2025-03-26 10:43:59', '2025-03-26 10:43:59', NULL),
(411, NULL, 'uploads/20250326054902_608028.webp', 1, 31, 'webp', 'image', NULL, '2025-03-26 10:49:02', '2025-03-26 10:49:02', NULL),
(412, NULL, 'uploads/more/20250326054902_281486.webp', 1, 31, 'webp', 'image', NULL, '2025-03-26 10:49:02', '2025-03-26 10:49:02', NULL),
(413, NULL, 'uploads/20250326060518_146534.jpg', 1, 10, 'jpg', 'image', NULL, '2025-03-26 11:05:18', '2025-03-26 11:05:18', NULL),
(414, NULL, 'uploads/more/20250326060518_320999.jpg', 1, 10, 'jpg', 'image', NULL, '2025-03-26 11:05:18', '2025-03-26 11:05:18', NULL),
(415, NULL, 'uploads/20250326060934_110075.jpg', 1, 402, 'jpg', 'image', NULL, '2025-03-26 11:09:34', '2025-03-26 11:09:34', NULL),
(416, NULL, 'uploads/more/20250326060934_398003.jpg', 1, 402, 'jpg', 'image', NULL, '2025-03-26 11:09:34', '2025-03-26 11:09:34', NULL),
(417, NULL, 'uploads/20250326061007_585446.jpg', 1, 407, 'jpg', 'image', NULL, '2025-03-26 11:10:07', '2025-03-26 11:10:07', NULL),
(418, NULL, 'uploads/more/20250326061007_351605.jpg', 1, 407, 'jpg', 'image', NULL, '2025-03-26 11:10:07', '2025-03-26 11:10:07', NULL),
(419, NULL, 'uploads/20250326061046_330774.jpg', 1, 402, 'jpg', 'image', NULL, '2025-03-26 11:10:46', '2025-03-26 11:10:46', NULL),
(420, NULL, 'uploads/more/20250326061046_167654.jpg', 1, 402, 'jpg', 'image', NULL, '2025-03-26 11:10:46', '2025-03-26 11:10:46', NULL),
(421, NULL, 'uploads/20250326061540_476812.jpg', 1, 336, 'jpg', 'image', NULL, '2025-03-26 11:15:40', '2025-03-26 11:15:40', NULL),
(422, NULL, 'uploads/more/20250326061540_658846.jpg', 1, 336, 'jpg', 'image', NULL, '2025-03-26 11:15:40', '2025-03-26 11:15:40', NULL),
(423, NULL, 'uploads/20250326061940_160074.webp', 1, 11, 'webp', 'image', NULL, '2025-03-26 11:19:40', '2025-03-26 11:19:40', NULL),
(424, NULL, 'uploads/more/20250326061940_488772.webp', 1, 11, 'webp', 'image', NULL, '2025-03-26 11:19:40', '2025-03-26 11:19:40', NULL),
(425, NULL, 'uploads/20250326064157_164852.webp', 1, 67, 'webp', 'image', NULL, '2025-03-26 11:41:58', '2025-03-26 11:41:58', NULL),
(426, NULL, 'uploads/more/20250326064158_933442.webp', 1, 67, 'webp', 'image', NULL, '2025-03-26 11:41:58', '2025-03-26 11:41:58', NULL),
(427, NULL, 'uploads/20250326065022_126298.jpg', 1, 110, 'jpg', 'image', NULL, '2025-03-26 11:50:22', '2025-03-26 11:50:22', NULL),
(428, NULL, 'uploads/more/20250326065022_895837.jpg', 1, 110, 'jpg', 'image', NULL, '2025-03-26 11:50:22', '2025-03-26 11:50:22', NULL),
(429, NULL, 'uploads/20250326065117_379955.jpg', 1, 128, 'jpg', 'image', NULL, '2025-03-26 11:51:17', '2025-03-26 11:51:17', NULL),
(430, NULL, 'uploads/more/20250326065117_580074.jpg', 1, 128, 'jpg', 'image', NULL, '2025-03-26 11:51:17', '2025-03-26 11:51:17', NULL),
(431, NULL, 'uploads/20250326065328_826607.jpeg', 1, 70, 'jpeg', 'image', NULL, '2025-03-26 11:53:28', '2025-03-26 11:53:28', NULL),
(432, NULL, 'uploads/more/20250326065328_799473.jpeg', 1, 70, 'jpeg', 'image', NULL, '2025-03-26 11:53:28', '2025-03-26 11:53:28', NULL),
(433, NULL, 'uploads/20250326065620_105019.webp', 1, 173, 'webp', 'image', NULL, '2025-03-26 11:56:20', '2025-03-26 11:56:20', NULL),
(434, NULL, 'uploads/more/20250326065620_826900.webp', 1, 173, 'webp', 'image', NULL, '2025-03-26 11:56:20', '2025-03-26 11:56:20', NULL),
(435, NULL, 'uploads/20250326065756_812299.webp', 1, 44, 'webp', 'image', NULL, '2025-03-26 11:57:56', '2025-03-26 11:57:56', NULL),
(436, NULL, 'uploads/more/20250326065756_331013.webp', 1, 44, 'webp', 'image', NULL, '2025-03-26 11:57:56', '2025-03-26 11:57:56', NULL),
(437, NULL, 'uploads/20250326065950_273816.jpg', 1, 29, 'jpg', 'image', NULL, '2025-03-26 11:59:50', '2025-03-26 11:59:50', NULL),
(438, NULL, 'uploads/more/20250326065950_315968.jpg', 1, 29, 'jpg', 'image', NULL, '2025-03-26 11:59:50', '2025-03-26 11:59:50', NULL),
(439, NULL, 'uploads/20250326070100_885424.png', 1, 36, 'png', 'image', NULL, '2025-03-26 12:01:00', '2025-03-26 12:01:00', NULL),
(440, NULL, 'uploads/more/20250326070100_477767.png', 1, 36, 'png', 'image', NULL, '2025-03-26 12:01:00', '2025-03-26 12:01:00', NULL),
(441, NULL, 'uploads/20250326070325_219280.jpeg', 1, 48, 'jpeg', 'image', NULL, '2025-03-26 12:03:25', '2025-03-26 12:03:25', NULL),
(442, NULL, 'uploads/more/20250326070325_814997.jpeg', 1, 48, 'jpeg', 'image', NULL, '2025-03-26 12:03:25', '2025-03-26 12:03:25', NULL),
(443, NULL, 'uploads/20250326070549_984607.webp', 1, 12, 'webp', 'image', NULL, '2025-03-26 12:05:49', '2025-03-26 12:05:49', NULL),
(444, NULL, 'uploads/more/20250326070549_668432.webp', 1, 12, 'webp', 'image', NULL, '2025-03-26 12:05:49', '2025-03-26 12:05:49', NULL),
(445, NULL, 'uploads/20250326070650_308108.jpg', 1, 164, 'jpg', 'image', NULL, '2025-03-26 12:06:50', '2025-03-26 12:06:50', NULL),
(446, NULL, 'uploads/more/20250326070650_957611.jpg', 1, 164, 'jpg', 'image', NULL, '2025-03-26 12:06:50', '2025-03-26 12:06:50', NULL),
(447, NULL, 'uploads/20250326070817_986035.png', 1, 20, 'png', 'image', NULL, '2025-03-26 12:08:17', '2025-03-26 12:08:17', NULL),
(448, NULL, 'uploads/more/20250326070817_951654.png', 1, 20, 'png', 'image', NULL, '2025-03-26 12:08:17', '2025-03-26 12:08:17', NULL),
(449, NULL, 'uploads/20250326071023_660686.jpeg', 1, 49, 'jpeg', 'image', NULL, '2025-03-26 12:10:23', '2025-03-26 12:10:23', NULL),
(450, NULL, 'uploads/more/20250326071023_668131.jpeg', 1, 49, 'jpeg', 'image', NULL, '2025-03-26 12:10:23', '2025-03-26 12:10:23', NULL),
(451, NULL, 'uploads/20250326071355_923723.jpg', 1, 146, 'jpg', 'image', NULL, '2025-03-26 12:13:55', '2025-03-26 12:13:55', NULL),
(452, NULL, 'uploads/more/20250326071355_442038.jpg', 1, 146, 'jpg', 'image', NULL, '2025-03-26 12:13:55', '2025-03-26 12:13:55', NULL),
(453, NULL, 'uploads/20250326071532_640918.jpg', 1, 17, 'jpg', 'image', NULL, '2025-03-26 12:15:33', '2025-03-26 12:15:33', NULL),
(454, NULL, 'uploads/more/20250326071533_343379.jpg', 1, 17, 'jpg', 'image', NULL, '2025-03-26 12:15:33', '2025-03-26 12:15:33', NULL),
(455, NULL, 'uploads/20250326072643_459898.webp', 1, 8, 'webp', 'image', NULL, '2025-03-26 12:26:43', '2025-03-26 12:26:43', NULL),
(456, NULL, 'uploads/more/20250326072643_559155.webp', 1, 8, 'webp', 'image', NULL, '2025-03-26 12:26:43', '2025-03-26 12:26:43', NULL),
(457, NULL, 'uploads/20250326074131_571787.jpg', 1, 129, 'jpg', 'image', NULL, '2025-03-26 12:41:31', '2025-03-26 12:41:31', NULL),
(458, NULL, 'uploads/more/20250326074131_309825.jpg', 1, 129, 'jpg', 'image', NULL, '2025-03-26 12:41:31', '2025-03-26 12:41:31', NULL),
(459, NULL, 'uploads/20250326074230_884157.jpg', 1, 84, 'jpg', 'image', NULL, '2025-03-26 12:42:30', '2025-03-26 12:42:30', NULL),
(460, NULL, 'uploads/more/20250326074230_316602.jpg', 1, 84, 'jpg', 'image', NULL, '2025-03-26 12:42:30', '2025-03-26 12:42:30', NULL),
(461, NULL, 'uploads/20250326074642_637708.jpg', 1, 113, 'jpg', 'image', NULL, '2025-03-26 12:46:42', '2025-03-26 12:46:42', NULL),
(462, NULL, 'uploads/more/20250326074642_317455.jpg', 1, 113, 'jpg', 'image', NULL, '2025-03-26 12:46:42', '2025-03-26 12:46:42', NULL),
(463, NULL, 'uploads/20250326074735_241241.jpg', 1, 112, 'jpg', 'image', NULL, '2025-03-26 12:47:35', '2025-03-26 12:47:35', NULL),
(464, NULL, 'uploads/more/20250326074735_857269.jpg', 1, 112, 'jpg', 'image', NULL, '2025-03-26 12:47:35', '2025-03-26 12:47:35', NULL),
(465, NULL, 'uploads/20250326075210_803925.jpg', 1, 222, 'jpg', 'image', NULL, '2025-03-26 12:52:10', '2025-03-26 12:52:10', NULL),
(466, NULL, 'uploads/more/20250326075210_309406.jpg', 1, 222, 'jpg', 'image', NULL, '2025-03-26 12:52:10', '2025-03-26 12:52:10', NULL),
(467, NULL, 'uploads/20250326075234_638719.webp', 1, 101, 'webp', 'image', NULL, '2025-03-26 12:52:34', '2025-03-26 12:52:34', NULL),
(468, NULL, 'uploads/more/20250326075234_403372.webp', 1, 101, 'webp', 'image', NULL, '2025-03-26 12:52:34', '2025-03-26 12:52:34', NULL),
(469, NULL, 'uploads/20250326075351_563918.webp', 1, 14, 'webp', 'image', NULL, '2025-03-26 12:53:51', '2025-03-26 12:53:51', NULL),
(470, NULL, 'uploads/more/20250326075351_276557.webp', 1, 14, 'webp', 'image', NULL, '2025-03-26 12:53:51', '2025-03-26 12:53:51', NULL),
(471, NULL, 'uploads/20250326075457_248745.jpg', 1, 29, 'jpg', 'image', NULL, '2025-03-26 12:54:57', '2025-03-26 12:54:57', NULL),
(472, NULL, 'uploads/more/20250326075457_354604.jpg', 1, 29, 'jpg', 'image', NULL, '2025-03-26 12:54:57', '2025-03-26 12:54:57', NULL),
(473, NULL, 'uploads/20250326075619_594835.jpg', 1, 461, 'jpg', 'image', NULL, '2025-03-26 12:56:19', '2025-03-26 12:56:19', NULL),
(474, NULL, 'uploads/more/20250326075619_807878.jpg', 1, 461, 'jpg', 'image', NULL, '2025-03-26 12:56:19', '2025-03-26 12:56:19', NULL),
(475, NULL, 'uploads/20250326075656_137118.jpg', 1, 429, 'jpg', 'image', NULL, '2025-03-26 12:56:56', '2025-03-26 12:56:56', NULL),
(476, NULL, 'uploads/more/20250326075656_905325.jpg', 1, 429, 'jpg', 'image', NULL, '2025-03-26 12:56:56', '2025-03-26 12:56:56', NULL),
(477, NULL, 'uploads/20250326075902_763425.webp', 1, 25, 'webp', 'image', NULL, '2025-03-26 12:59:02', '2025-03-26 12:59:02', NULL),
(478, NULL, 'uploads/more/20250326075902_733663.webp', 1, 25, 'webp', 'image', NULL, '2025-03-26 12:59:02', '2025-03-26 12:59:02', NULL),
(479, NULL, 'uploads/20250326075941_613033.webp', 1, 101, 'webp', 'image', NULL, '2025-03-26 12:59:41', '2025-03-26 12:59:41', NULL),
(480, NULL, 'uploads/more/20250326075941_165792.webp', 1, 101, 'webp', 'image', NULL, '2025-03-26 12:59:41', '2025-03-26 12:59:41', NULL),
(481, NULL, 'uploads/20250326080035_343828.jpg', 1, 282, 'jpg', 'image', NULL, '2025-03-26 13:00:35', '2025-03-26 13:00:35', NULL),
(482, NULL, 'uploads/more/20250326080035_781850.jpg', 1, 282, 'jpg', 'image', NULL, '2025-03-26 13:00:35', '2025-03-26 13:00:35', NULL),
(483, NULL, 'uploads/20250326080206_210441.jpg', 1, 335, 'jpg', 'image', NULL, '2025-03-26 13:02:06', '2025-03-26 13:02:06', NULL),
(484, NULL, 'uploads/more/20250326080206_335756.jpg', 1, 335, 'jpg', 'image', NULL, '2025-03-26 13:02:06', '2025-03-26 13:02:06', NULL),
(485, NULL, 'uploads/20250326080724_801548.webp', 1, 13, 'webp', 'image', NULL, '2025-03-26 13:07:24', '2025-03-26 13:07:24', NULL);
INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `external_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(486, NULL, 'uploads/more/20250326080724_866781.webp', 1, 13, 'webp', 'image', NULL, '2025-03-26 13:07:24', '2025-03-26 13:07:24', NULL),
(487, NULL, 'uploads/20250326080901_880273.webp', 1, 40, 'webp', 'image', NULL, '2025-03-26 13:09:01', '2025-03-26 13:09:01', NULL),
(488, NULL, 'uploads/more/20250326080901_487404.webp', 1, 40, 'webp', 'image', NULL, '2025-03-26 13:09:01', '2025-03-26 13:09:01', NULL),
(489, NULL, 'uploads/20250326080956_348167.jpg', 1, 107, 'jpg', 'image', NULL, '2025-03-26 13:09:56', '2025-03-26 13:09:56', NULL),
(490, NULL, 'uploads/more/20250326080957_660841.jpg', 1, 107, 'jpg', 'image', NULL, '2025-03-26 13:09:57', '2025-03-26 13:09:57', NULL),
(491, NULL, 'uploads/20250326081140_623004.webp', 1, 54, 'webp', 'image', NULL, '2025-03-26 13:11:40', '2025-03-26 13:11:40', NULL),
(492, NULL, 'uploads/more/20250326081140_430547.webp', 1, 54, 'webp', 'image', NULL, '2025-03-26 13:11:40', '2025-03-26 13:11:40', NULL),
(493, NULL, 'uploads/20250326081952_829209.webp', 1, 9, 'webp', 'image', NULL, '2025-03-26 13:19:52', '2025-03-26 13:19:52', NULL),
(494, NULL, 'uploads/more/20250326081952_945824.webp', 1, 9, 'webp', 'image', NULL, '2025-03-26 13:19:52', '2025-03-26 13:19:52', NULL),
(495, NULL, 'uploads/20250326082147_193756.webp', 1, 5, 'webp', 'image', NULL, '2025-03-26 13:21:47', '2025-03-26 13:21:47', NULL),
(496, NULL, 'uploads/more/20250326082147_796408.webp', 1, 5, 'webp', 'image', NULL, '2025-03-26 13:21:47', '2025-03-26 13:21:47', NULL),
(497, NULL, 'uploads/20250326082313_736956.jpg', 1, 109, 'jpg', 'image', NULL, '2025-03-26 13:23:13', '2025-03-26 13:23:13', NULL),
(498, NULL, 'uploads/more/20250326082313_931327.jpg', 1, 109, 'jpg', 'image', NULL, '2025-03-26 13:23:13', '2025-03-26 13:23:13', NULL),
(499, NULL, 'uploads/20250326082420_835912.jpg', 1, 103, 'jpg', 'image', NULL, '2025-03-26 13:24:20', '2025-03-26 13:24:20', NULL),
(500, NULL, 'uploads/more/20250326082420_459958.jpg', 1, 103, 'jpg', 'image', NULL, '2025-03-26 13:24:20', '2025-03-26 13:24:20', NULL),
(501, NULL, 'uploads/20250326082512_495115.jpg', 1, 135, 'jpg', 'image', NULL, '2025-03-26 13:25:12', '2025-03-26 13:25:12', NULL),
(502, NULL, 'uploads/more/20250326082512_471858.jpg', 1, 135, 'jpg', 'image', NULL, '2025-03-26 13:25:12', '2025-03-26 13:25:12', NULL),
(503, NULL, 'uploads/20250326082837_730585.jpg', 1, 147, 'jpg', 'image', NULL, '2025-03-26 13:28:37', '2025-03-26 13:28:37', NULL),
(504, NULL, 'uploads/more/20250326082837_395400.jpg', 1, 147, 'jpg', 'image', NULL, '2025-03-26 13:28:37', '2025-03-26 13:28:37', NULL),
(505, NULL, 'uploads/20250326083055_645254.webp', 1, 46, 'webp', 'image', NULL, '2025-03-26 13:30:56', '2025-03-26 13:30:56', NULL),
(506, NULL, 'uploads/more/20250326083056_721525.webp', 1, 46, 'webp', 'image', NULL, '2025-03-26 13:30:56', '2025-03-26 13:30:56', NULL),
(507, NULL, 'uploads/20250326084131_921151.png', 1, 64, 'png', 'image', NULL, '2025-03-26 13:41:31', '2025-03-26 13:41:31', NULL),
(508, NULL, 'uploads/more/20250326084131_539829.png', 1, 64, 'png', 'image', NULL, '2025-03-26 13:41:31', '2025-03-26 13:41:31', NULL),
(509, NULL, 'uploads/20250326084406_858017.webp', 1, 11, 'webp', 'image', NULL, '2025-03-26 13:44:06', '2025-03-26 13:44:06', NULL),
(510, NULL, 'uploads/more/20250326084406_541745.webp', 1, 11, 'webp', 'image', NULL, '2025-03-26 13:44:06', '2025-03-26 13:44:06', NULL),
(511, NULL, 'uploads/20250326084559_168572.jpg', 1, 106, 'jpg', 'image', NULL, '2025-03-26 13:45:59', '2025-03-26 13:45:59', NULL),
(512, NULL, 'uploads/more/20250326084559_655733.jpg', 1, 106, 'jpg', 'image', NULL, '2025-03-26 13:45:59', '2025-03-26 13:45:59', NULL),
(513, NULL, 'uploads/20250326084854_559409.jpg', 1, 106, 'jpg', 'image', NULL, '2025-03-26 13:48:54', '2025-03-26 13:48:54', NULL),
(514, NULL, 'uploads/more/20250326084854_536659.jpg', 1, 106, 'jpg', 'image', NULL, '2025-03-26 13:48:54', '2025-03-26 13:48:54', NULL),
(515, NULL, 'uploads/20250326084948_424088.jpg', 1, 112, 'jpg', 'image', NULL, '2025-03-26 13:49:48', '2025-03-26 13:49:48', NULL),
(516, NULL, 'uploads/more/20250326084948_500990.jpg', 1, 112, 'jpg', 'image', NULL, '2025-03-26 13:49:48', '2025-03-26 13:49:48', NULL),
(517, NULL, 'uploads/20250326085142_523081.png', 1, 53, 'png', 'image', NULL, '2025-03-26 13:51:42', '2025-03-26 13:51:42', NULL),
(518, NULL, 'uploads/more/20250326085142_934870.png', 1, 53, 'png', 'image', NULL, '2025-03-26 13:51:42', '2025-03-26 13:51:42', NULL),
(519, NULL, 'uploads/20250326085350_528172.jpg', 1, 112, 'jpg', 'image', NULL, '2025-03-26 13:53:50', '2025-03-26 13:53:50', NULL),
(520, NULL, 'uploads/more/20250326085350_518107.jpg', 1, 112, 'jpg', 'image', NULL, '2025-03-26 13:53:50', '2025-03-26 13:53:50', NULL),
(521, NULL, 'uploads/more/20250326085540_718941.png', 1, 60, 'png', 'image', NULL, '2025-03-26 13:55:40', '2025-03-26 13:55:40', NULL),
(522, NULL, 'uploads/20250326085634_377105.png', 1, 60, 'png', 'image', NULL, '2025-03-26 13:56:34', '2025-03-26 13:56:34', NULL),
(523, NULL, 'uploads/more/20250326085634_460411.png', 1, 60, 'png', 'image', NULL, '2025-03-26 13:56:34', '2025-03-26 13:56:34', NULL),
(524, NULL, 'uploads/20250326085835_180395.png', 1, 18, 'png', 'image', NULL, '2025-03-26 13:58:35', '2025-03-26 13:58:35', NULL),
(525, NULL, 'uploads/more/20250326085835_969483.png', 1, 18, 'png', 'image', NULL, '2025-03-26 13:58:35', '2025-03-26 13:58:35', NULL),
(526, NULL, 'uploads/20250326085926_751444.png', 1, 64, 'png', 'image', NULL, '2025-03-26 13:59:26', '2025-03-26 13:59:26', NULL),
(527, NULL, 'uploads/more/20250326085926_332226.png', 1, 64, 'png', 'image', NULL, '2025-03-26 13:59:27', '2025-03-26 13:59:27', NULL),
(528, NULL, 'uploads/20250326090005_930003.png', 1, 64, 'png', 'image', NULL, '2025-03-26 14:00:05', '2025-03-26 14:00:05', NULL),
(529, NULL, 'uploads/more/20250326090005_458681.png', 1, 64, 'png', 'image', NULL, '2025-03-26 14:00:05', '2025-03-26 14:00:05', NULL),
(530, NULL, 'uploads/20250326090450_230248.jpg', 1, 106, 'jpg', 'image', NULL, '2025-03-26 14:04:50', '2025-03-26 14:04:50', NULL),
(531, NULL, 'uploads/more/20250326090450_957203.jpg', 1, 106, 'jpg', 'image', NULL, '2025-03-26 14:04:50', '2025-03-26 14:04:50', NULL),
(532, NULL, 'uploads/20250326090530_634069.jpg', 1, 106, 'jpg', 'image', NULL, '2025-03-26 14:05:30', '2025-03-26 14:05:30', NULL),
(533, NULL, 'uploads/more/20250326090530_320294.jpg', 1, 106, 'jpg', 'image', NULL, '2025-03-26 14:05:30', '2025-03-26 14:05:30', NULL),
(534, NULL, 'uploads/20250326090737_344829.jpg', 1, 106, 'jpg', 'image', NULL, '2025-03-26 14:07:37', '2025-03-26 14:07:37', NULL),
(535, NULL, 'uploads/more/20250326090737_549143.jpg', 1, 106, 'jpg', 'image', NULL, '2025-03-26 14:07:37', '2025-03-26 14:07:37', NULL),
(536, NULL, 'uploads/20250326091632_755225.webp', 1, 29, 'webp', 'image', NULL, '2025-03-26 14:16:32', '2025-03-26 14:16:32', NULL),
(537, NULL, 'uploads/more/20250326091632_340387.webp', 1, 29, 'webp', 'image', NULL, '2025-03-26 14:16:32', '2025-03-26 14:16:32', NULL),
(538, NULL, 'uploads/20250326092104_134794.webp', 1, 16, 'webp', 'image', NULL, '2025-03-26 14:21:04', '2025-03-26 14:21:04', NULL),
(539, NULL, 'uploads/more/20250326092104_451356.webp', 1, 16, 'webp', 'image', NULL, '2025-03-26 14:21:04', '2025-03-26 14:21:04', NULL),
(540, NULL, 'uploads/20250326092236_920479.webp', 1, 7, 'webp', 'image', NULL, '2025-03-26 14:22:36', '2025-03-26 14:22:36', NULL),
(541, NULL, 'uploads/more/20250326092236_218461.webp', 1, 7, 'webp', 'image', NULL, '2025-03-26 14:22:36', '2025-03-26 14:22:36', NULL),
(542, NULL, 'uploads/20250326092636_225325.jpg', 1, 225, 'jpg', 'image', NULL, '2025-03-26 14:26:36', '2025-03-26 14:26:36', NULL),
(543, NULL, 'uploads/more/20250326092636_959476.jpg', 1, 225, 'jpg', 'image', NULL, '2025-03-26 14:26:36', '2025-03-26 14:26:36', NULL),
(544, NULL, 'uploads/20250326092808_185648.jpg', 1, 283, 'jpg', 'image', NULL, '2025-03-26 14:28:08', '2025-03-26 14:28:08', NULL),
(545, NULL, 'uploads/more/20250326092808_886696.jpg', 1, 283, 'jpg', 'image', NULL, '2025-03-26 14:28:08', '2025-03-26 14:28:08', NULL),
(546, NULL, 'uploads/20250326092908_353562.jpg', 1, 265, 'jpg', 'image', NULL, '2025-03-26 14:29:08', '2025-03-26 14:29:08', NULL),
(547, NULL, 'uploads/more/20250326092908_979405.jpg', 1, 265, 'jpg', 'image', NULL, '2025-03-26 14:29:08', '2025-03-26 14:29:08', NULL),
(548, NULL, 'uploads/20250326093930_403360.jpg', 1, 189, 'jpg', 'image', NULL, '2025-03-26 14:39:30', '2025-03-26 14:39:30', NULL),
(549, NULL, 'uploads/more/20250326093930_110113.jpg', 1, 189, 'jpg', 'image', NULL, '2025-03-26 14:39:30', '2025-03-26 14:39:30', NULL),
(550, NULL, 'uploads/20250326093950_875324.jpg', 1, 133, 'jpg', 'image', NULL, '2025-03-26 14:39:50', '2025-03-26 14:39:50', NULL),
(551, NULL, 'uploads/more/20250326093950_153889.jpg', 1, 133, 'jpg', 'image', NULL, '2025-03-26 14:39:50', '2025-03-26 14:39:50', NULL),
(552, NULL, 'uploads/20250326094046_785618.jpg', 1, 133, 'jpg', 'image', NULL, '2025-03-26 14:40:46', '2025-03-26 14:40:46', NULL),
(553, NULL, 'uploads/more/20250326094046_286441.jpg', 1, 133, 'jpg', 'image', NULL, '2025-03-26 14:40:46', '2025-03-26 14:40:46', NULL),
(554, NULL, 'uploads/20250326094332_886506.jpg', 1, 107, 'jpg', 'image', NULL, '2025-03-26 14:43:32', '2025-03-26 14:43:32', NULL),
(555, NULL, 'uploads/more/20250326094332_231303.jpg', 1, 107, 'jpg', 'image', NULL, '2025-03-26 14:43:32', '2025-03-26 14:43:32', NULL),
(556, NULL, 'uploads/20250326094347_705474.jpg', 1, 97, 'jpg', 'image', NULL, '2025-03-26 14:43:47', '2025-03-26 14:43:47', NULL),
(557, NULL, 'uploads/more/20250326094347_548012.jpg', 1, 97, 'jpg', 'image', NULL, '2025-03-26 14:43:47', '2025-03-26 14:43:47', NULL),
(558, NULL, 'uploads/20250326094827_693894.png', 1, 60, 'png', 'image', NULL, '2025-03-26 14:48:28', '2025-03-26 14:48:28', NULL),
(559, NULL, 'uploads/20250326095036_229606.png', 1, 105, 'png', 'image', NULL, '2025-03-26 14:50:36', '2025-03-26 14:50:36', NULL),
(560, NULL, 'uploads/more/20250326095036_251766.png', 1, 105, 'png', 'image', NULL, '2025-03-26 14:50:36', '2025-03-26 14:50:36', NULL),
(561, NULL, 'uploads/20250326095155_409560.png', 1, 74, 'png', 'image', NULL, '2025-03-26 14:51:55', '2025-03-26 14:51:55', NULL),
(562, NULL, 'uploads/more/20250326095155_135633.png', 1, 74, 'png', 'image', NULL, '2025-03-26 14:51:55', '2025-03-26 14:51:55', NULL),
(563, NULL, 'uploads/20250326095326_619738.webp', 1, 15, 'webp', 'image', NULL, '2025-03-26 14:53:26', '2025-03-26 14:53:26', NULL),
(564, NULL, 'uploads/more/20250326095326_435006.webp', 1, 15, 'webp', 'image', NULL, '2025-03-26 14:53:26', '2025-03-26 14:53:26', NULL),
(565, NULL, 'uploads/20250327140539_742881.webp', 1, 29, 'webp', 'image', NULL, '2025-03-27 19:05:39', '2025-03-27 19:05:39', NULL),
(566, NULL, 'uploads/more/20250327140539_437166.webp', 1, 29, 'webp', 'image', NULL, '2025-03-27 19:05:39', '2025-03-27 19:05:39', NULL),
(567, NULL, 'uploads/20250327140810_147248.jpg', 1, 109, 'jpg', 'image', NULL, '2025-03-27 19:08:10', '2025-03-27 19:08:10', NULL),
(568, NULL, 'uploads/more/20250327140810_970766.jpg', 1, 109, 'jpg', 'image', NULL, '2025-03-27 19:08:10', '2025-03-27 19:08:10', NULL),
(569, NULL, 'uploads/20250327141021_956345.jpg', 1, 400, 'jpg', 'image', NULL, '2025-03-27 19:10:21', '2025-03-27 19:10:21', NULL),
(570, NULL, 'uploads/more/20250327141021_514925.jpg', 1, 400, 'jpg', 'image', NULL, '2025-03-27 19:10:21', '2025-03-27 19:10:21', NULL),
(571, NULL, 'uploads/20250327141256_603925.jpg', 1, 459, 'jpg', 'image', NULL, '2025-03-27 19:12:56', '2025-03-27 19:12:56', NULL),
(572, NULL, 'uploads/more/20250327141256_166812.jpg', 1, 459, 'jpg', 'image', NULL, '2025-03-27 19:12:56', '2025-03-27 19:12:56', NULL),
(573, NULL, 'uploads/20250327141333_271814.jpg', 1, 459, 'jpg', 'image', NULL, '2025-03-27 19:13:33', '2025-03-27 19:13:33', NULL),
(574, NULL, 'uploads/more/20250327141333_918684.jpg', 1, 459, 'jpg', 'image', NULL, '2025-03-27 19:13:33', '2025-03-27 19:13:33', NULL),
(575, NULL, 'uploads/20250327142111_570445.jpg', 1, 522, 'jpg', 'image', NULL, '2025-03-27 19:21:11', '2025-03-27 19:21:11', NULL),
(576, NULL, 'uploads/more/20250327142111_686284.jpg', 1, 522, 'jpg', 'image', NULL, '2025-03-27 19:21:11', '2025-03-27 19:21:11', NULL),
(577, NULL, 'uploads/20250327142327_314444.jpg', 1, 522, 'jpg', 'image', NULL, '2025-03-27 19:23:27', '2025-03-27 19:23:27', NULL),
(578, NULL, 'uploads/more/20250327142327_200268.jpg', 1, 522, 'jpg', 'image', NULL, '2025-03-27 19:23:27', '2025-03-27 19:23:27', NULL),
(579, NULL, 'uploads/20250327144101_117697.webp', 1, 12, 'webp', 'image', NULL, '2025-03-27 19:41:01', '2025-03-27 19:41:01', NULL),
(580, NULL, 'uploads/more/20250327144101_501168.webp', 1, 12, 'webp', 'image', NULL, '2025-03-27 19:41:01', '2025-03-27 19:41:01', NULL),
(581, NULL, 'uploads/20250327144425_308369.webp', 1, 11, 'webp', 'image', NULL, '2025-03-27 19:44:25', '2025-03-27 19:44:25', NULL),
(582, NULL, 'uploads/more/20250327144425_931308.webp', 1, 11, 'webp', 'image', NULL, '2025-03-27 19:44:25', '2025-03-27 19:44:25', NULL),
(583, NULL, 'uploads/20250329042416_458016.jpg', 1, 39, 'jpg', 'image', NULL, '2025-03-29 09:24:16', '2025-03-29 09:24:16', NULL),
(584, NULL, 'uploads/more/20250329042416_980903.jpg', 1, 39, 'jpg', 'image', NULL, '2025-03-29 09:24:16', '2025-03-29 09:24:16', NULL),
(585, NULL, 'uploads/20250329042755_472560.webp', 1, 5, 'webp', 'image', NULL, '2025-03-29 09:27:55', '2025-03-29 09:27:55', NULL),
(586, NULL, 'uploads/more/20250329042755_291378.webp', 1, 5, 'webp', 'image', NULL, '2025-03-29 09:27:55', '2025-03-29 09:27:55', NULL),
(587, NULL, 'uploads/20250329042952_923636.webp', 1, 4, 'webp', 'image', NULL, '2025-03-29 09:29:52', '2025-03-29 09:29:52', NULL),
(588, NULL, 'uploads/more/20250329042952_132910.webp', 1, 4, 'webp', 'image', NULL, '2025-03-29 09:29:52', '2025-03-29 09:29:52', NULL),
(589, NULL, 'uploads/20250329043400_418444.webp', 1, 14, 'webp', 'image', NULL, '2025-03-29 09:34:00', '2025-03-29 09:34:00', NULL),
(590, NULL, 'uploads/more/20250329043400_822507.webp', 1, 14, 'webp', 'image', NULL, '2025-03-29 09:34:00', '2025-03-29 09:34:00', NULL),
(591, NULL, 'uploads/20250329050623_890713.jpg', 1, 234, 'jpg', 'image', NULL, '2025-03-29 10:06:23', '2025-03-29 10:06:23', NULL),
(592, NULL, 'uploads/more/20250329050623_661715.jpg', 1, 234, 'jpg', 'image', NULL, '2025-03-29 10:06:23', '2025-03-29 10:06:23', NULL),
(593, NULL, 'uploads/20250329050900_214002.jpg', 1, 298, 'jpg', 'image', NULL, '2025-03-29 10:09:00', '2025-03-29 10:09:00', NULL),
(594, NULL, 'uploads/more/20250329050900_956457.jpg', 1, 298, 'jpg', 'image', NULL, '2025-03-29 10:09:00', '2025-03-29 10:09:00', NULL),
(595, NULL, 'uploads/20250329051152_267466.webp', 1, 59, 'webp', 'image', NULL, '2025-03-29 10:11:52', '2025-03-29 10:11:52', NULL),
(596, NULL, 'uploads/more/20250329051152_605390.webp', 1, 59, 'webp', 'image', NULL, '2025-03-29 10:11:52', '2025-03-29 10:11:52', NULL),
(597, NULL, 'uploads/20250329051231_777658.webp', 1, 59, 'webp', 'image', NULL, '2025-03-29 10:12:31', '2025-03-29 10:12:31', NULL),
(598, NULL, 'uploads/more/20250329051231_845519.webp', 1, 59, 'webp', 'image', NULL, '2025-03-29 10:12:31', '2025-03-29 10:12:31', NULL),
(599, NULL, 'uploads/20250329051331_236440.webp', 1, 194, 'webp', 'image', NULL, '2025-03-29 10:13:31', '2025-03-29 10:13:31', NULL),
(600, NULL, 'uploads/more/20250329051331_639713.webp', 1, 194, 'webp', 'image', NULL, '2025-03-29 10:13:31', '2025-03-29 10:13:31', NULL),
(601, NULL, 'uploads/20250329051456_121057.webp', 1, 39, 'webp', 'image', NULL, '2025-03-29 10:14:56', '2025-03-29 10:14:56', NULL),
(602, NULL, 'uploads/more/20250329051456_887527.webp', 1, 39, 'webp', 'image', NULL, '2025-03-29 10:14:56', '2025-03-29 10:14:56', NULL),
(603, NULL, 'uploads/20250329051638_281898.webp', 1, 24, 'webp', 'image', NULL, '2025-03-29 10:16:38', '2025-03-29 10:16:38', NULL),
(604, NULL, 'uploads/more/20250329051638_587909.webp', 1, 24, 'webp', 'image', NULL, '2025-03-29 10:16:38', '2025-03-29 10:16:38', NULL),
(605, NULL, 'uploads/20250329051742_460201.webp', 1, 23, 'webp', 'image', NULL, '2025-03-29 10:17:42', '2025-03-29 10:17:42', NULL),
(606, NULL, 'uploads/more/20250329051742_151390.webp', 1, 23, 'webp', 'image', NULL, '2025-03-29 10:17:42', '2025-03-29 10:17:42', NULL),
(607, NULL, 'uploads/20250329051843_366451.png', 1, 7, 'png', 'image', NULL, '2025-03-29 10:18:43', '2025-03-29 10:18:43', NULL),
(608, NULL, 'uploads/more/20250329051843_713382.png', 1, 7, 'png', 'image', NULL, '2025-03-29 10:18:43', '2025-03-29 10:18:43', NULL),
(609, NULL, 'uploads/20250329052034_195198.webp', 1, 14, 'webp', 'image', NULL, '2025-03-29 10:20:34', '2025-03-29 10:20:34', NULL),
(610, NULL, 'uploads/more/20250329052035_564514.webp', 1, 14, 'webp', 'image', NULL, '2025-03-29 10:20:35', '2025-03-29 10:20:35', NULL),
(611, NULL, 'uploads/20250329052133_225177.webp', 1, 14, 'webp', 'image', NULL, '2025-03-29 10:21:33', '2025-03-29 10:21:33', NULL),
(612, NULL, 'uploads/more/20250329052133_168453.webp', 1, 14, 'webp', 'image', NULL, '2025-03-29 10:21:33', '2025-03-29 10:21:33', NULL),
(613, NULL, 'uploads/20250329052517_569878.webp', 1, 14, 'webp', 'image', NULL, '2025-03-29 10:25:17', '2025-03-29 10:25:17', NULL),
(614, NULL, 'uploads/more/20250329052517_982223.webp', 1, 14, 'webp', 'image', NULL, '2025-03-29 10:25:17', '2025-03-29 10:25:17', NULL),
(615, NULL, 'uploads/20250329052711_549812.webp', 1, 108, 'webp', 'image', NULL, '2025-03-29 10:27:11', '2025-03-29 10:27:11', NULL),
(616, NULL, 'uploads/more/20250329052711_505217.webp', 1, 108, 'webp', 'image', NULL, '2025-03-29 10:27:11', '2025-03-29 10:27:11', NULL),
(617, NULL, 'uploads/20250329053005_739098.jpg', 1, 326, 'jpg', 'image', NULL, '2025-03-29 10:30:05', '2025-03-29 10:30:05', NULL),
(618, NULL, 'uploads/more/20250329053005_599698.jpg', 1, 326, 'jpg', 'image', NULL, '2025-03-29 10:30:05', '2025-03-29 10:30:05', NULL),
(619, NULL, 'uploads/20250329053215_306193.webp', 1, 48, 'webp', 'image', NULL, '2025-03-29 10:32:15', '2025-03-29 10:32:15', NULL),
(620, NULL, 'uploads/more/20250329053215_155633.webp', 1, 48, 'webp', 'image', NULL, '2025-03-29 10:32:15', '2025-03-29 10:32:15', NULL),
(621, NULL, 'uploads/20250329053344_808026.png', 1, 76, 'png', 'image', NULL, '2025-03-29 10:33:44', '2025-03-29 10:33:44', NULL),
(622, NULL, 'uploads/more/20250329053344_986150.png', 1, 76, 'png', 'image', NULL, '2025-03-29 10:33:44', '2025-03-29 10:33:44', NULL),
(623, NULL, 'uploads/20250329053442_731249.png', 1, 76, 'png', 'image', NULL, '2025-03-29 10:34:42', '2025-03-29 10:34:42', NULL),
(624, NULL, 'uploads/more/20250329053442_722196.png', 1, 76, 'png', 'image', NULL, '2025-03-29 10:34:42', '2025-03-29 10:34:42', NULL),
(625, NULL, 'uploads/20250329053553_934411.jpg', 1, 116, 'jpg', 'image', NULL, '2025-03-29 10:35:53', '2025-03-29 10:35:53', NULL),
(626, NULL, 'uploads/more/20250329053553_325962.jpg', 1, 116, 'jpg', 'image', NULL, '2025-03-29 10:35:53', '2025-03-29 10:35:53', NULL),
(627, NULL, 'uploads/20250329080218_339807.webp', 1, 17, 'webp', 'image', NULL, '2025-03-29 13:02:18', '2025-03-29 13:02:18', NULL),
(628, NULL, 'uploads/more/20250329080218_799783.webp', 1, 17, 'webp', 'image', NULL, '2025-03-29 13:02:18', '2025-03-29 13:02:18', NULL),
(629, NULL, 'uploads/20250329081350_847805.webp', 1, 15, 'webp', 'image', NULL, '2025-03-29 13:13:50', '2025-03-29 13:13:50', NULL),
(630, NULL, 'uploads/more/20250329081350_406837.webp', 1, 15, 'webp', 'image', NULL, '2025-03-29 13:13:50', '2025-03-29 13:13:50', NULL),
(631, NULL, 'uploads/20250329081657_964917.webp', 1, 15, 'webp', 'image', NULL, '2025-03-29 13:16:57', '2025-03-29 13:16:57', NULL),
(632, NULL, 'uploads/more/20250329081657_784679.webp', 1, 15, 'webp', 'image', NULL, '2025-03-29 13:16:57', '2025-03-29 13:16:57', NULL),
(633, NULL, 'uploads/20250330060133_668910.webp', 1, 15, 'webp', 'image', NULL, '2025-03-30 11:01:33', '2025-03-30 11:01:33', NULL),
(634, NULL, 'uploads/more/20250330060133_505647.webp', 1, 15, 'webp', 'image', NULL, '2025-03-30 11:01:33', '2025-03-30 11:01:33', NULL),
(635, NULL, 'uploads/20250330075755_847005.jpg', 1, 26, 'jpg', 'image', NULL, '2025-03-30 12:57:55', '2025-03-30 12:57:55', NULL),
(636, NULL, 'uploads/more/20250330075755_471043.jpg', 1, 26, 'jpg', 'image', NULL, '2025-03-30 12:57:55', '2025-03-30 12:57:55', NULL),
(637, NULL, 'uploads/20250330080107_131870.png', 1, 601, 'png', 'image', NULL, '2025-03-30 13:01:07', '2025-03-30 13:01:07', NULL),
(638, NULL, 'uploads/more/20250330080108_914528.png', 1, 601, 'png', 'image', NULL, '2025-03-30 13:01:08', '2025-03-30 13:01:08', NULL),
(639, NULL, 'uploads/20250330080218_978918.webp', 1, 7, 'webp', 'image', NULL, '2025-03-30 13:02:18', '2025-03-30 13:02:18', NULL),
(640, NULL, 'uploads/more/20250330080218_407009.webp', 1, 7, 'webp', 'image', NULL, '2025-03-30 13:02:18', '2025-03-30 13:02:18', NULL),
(641, NULL, 'uploads/20250330080307_899569.jpg', 1, 19, 'jpg', 'image', NULL, '2025-03-30 13:03:07', '2025-03-30 13:03:07', NULL),
(642, NULL, 'uploads/more/20250330080307_231964.jpg', 1, 19, 'jpg', 'image', NULL, '2025-03-30 13:03:07', '2025-03-30 13:03:07', NULL),
(643, NULL, 'uploads/20250330080358_237920.png', 1, 119, 'png', 'image', NULL, '2025-03-30 13:03:58', '2025-03-30 13:03:58', NULL),
(644, NULL, 'uploads/more/20250330080358_187077.png', 1, 119, 'png', 'image', NULL, '2025-03-30 13:03:58', '2025-03-30 13:03:58', NULL),
(645, NULL, 'uploads/20250330080524_146745.jpg', 1, 34, 'jpg', 'image', NULL, '2025-03-30 13:05:24', '2025-03-30 13:05:24', NULL),
(646, NULL, 'uploads/more/20250330080524_750741.jpg', 1, 34, 'jpg', 'image', NULL, '2025-03-30 13:05:24', '2025-03-30 13:05:24', NULL),
(647, NULL, 'uploads/20250330080619_231575.webp', 1, 145, 'webp', 'image', NULL, '2025-03-30 13:06:19', '2025-03-30 13:06:19', NULL),
(648, NULL, 'uploads/more/20250330080619_982221.webp', 1, 145, 'webp', 'image', NULL, '2025-03-30 13:06:19', '2025-03-30 13:06:19', NULL),
(649, NULL, 'uploads/20250330080706_545311.jpg', 1, 16, 'jpg', 'image', NULL, '2025-03-30 13:07:06', '2025-03-30 13:07:06', NULL),
(650, NULL, 'uploads/more/20250330080706_956966.jpg', 1, 16, 'jpg', 'image', NULL, '2025-03-30 13:07:06', '2025-03-30 13:07:06', NULL),
(651, NULL, 'uploads/20250330080806_799662.webp', 1, 53, 'webp', 'image', NULL, '2025-03-30 13:08:06', '2025-03-30 13:08:06', NULL),
(652, NULL, 'uploads/more/20250330080806_645234.webp', 1, 53, 'webp', 'image', NULL, '2025-03-30 13:08:06', '2025-03-30 13:08:06', NULL),
(653, NULL, 'uploads/20250330080912_578087.webp', 1, 23, 'webp', 'image', NULL, '2025-03-30 13:09:12', '2025-03-30 13:09:12', NULL),
(654, NULL, 'uploads/more/20250330080912_751419.webp', 1, 23, 'webp', 'image', NULL, '2025-03-30 13:09:12', '2025-03-30 13:09:12', NULL),
(655, NULL, 'uploads/20250330081015_778042.jpg', 1, 279, 'jpg', 'image', NULL, '2025-03-30 13:10:15', '2025-03-30 13:10:15', NULL),
(656, NULL, 'uploads/more/20250330081015_241437.jpg', 1, 279, 'jpg', 'image', NULL, '2025-03-30 13:10:15', '2025-03-30 13:10:15', NULL),
(657, NULL, 'uploads/20250330081111_350720.jpg', 1, 264, 'jpg', 'image', NULL, '2025-03-30 13:11:11', '2025-03-30 13:11:11', NULL),
(658, NULL, 'uploads/more/20250330081111_809724.jpg', 1, 264, 'jpg', 'image', NULL, '2025-03-30 13:11:11', '2025-03-30 13:11:11', NULL),
(659, NULL, 'uploads/20250330081200_752848.jpg', 1, 264, 'jpg', 'image', NULL, '2025-03-30 13:12:00', '2025-03-30 13:12:00', NULL),
(660, NULL, 'uploads/more/20250330081200_251627.jpg', 1, 264, 'jpg', 'image', NULL, '2025-03-30 13:12:00', '2025-03-30 13:12:00', NULL),
(661, NULL, 'uploads/20250330081259_207708.webp', 1, 39, 'webp', 'image', NULL, '2025-03-30 13:12:59', '2025-03-30 13:12:59', NULL),
(662, NULL, 'uploads/more/20250330081259_582872.webp', 1, 39, 'webp', 'image', NULL, '2025-03-30 13:12:59', '2025-03-30 13:12:59', NULL),
(663, NULL, 'uploads/20250330081351_948949.jpg', 1, 264, 'jpg', 'image', NULL, '2025-03-30 13:13:51', '2025-03-30 13:13:51', NULL),
(664, NULL, 'uploads/more/20250330081351_625841.jpg', 1, 264, 'jpg', 'image', NULL, '2025-03-30 13:13:51', '2025-03-30 13:13:51', NULL),
(665, NULL, 'uploads/20250330081445_881514.webp', 1, 17, 'webp', 'image', NULL, '2025-03-30 13:14:45', '2025-03-30 13:14:45', NULL),
(666, NULL, 'uploads/more/20250330081445_300249.webp', 1, 17, 'webp', 'image', NULL, '2025-03-30 13:14:45', '2025-03-30 13:14:45', NULL),
(667, NULL, 'uploads/20250330081545_982975.webp', 1, 17, 'webp', 'image', NULL, '2025-03-30 13:15:45', '2025-03-30 13:15:45', NULL),
(668, NULL, 'uploads/more/20250330081545_648533.webp', 1, 17, 'webp', 'image', NULL, '2025-03-30 13:15:45', '2025-03-30 13:15:45', NULL),
(669, NULL, 'uploads/20250401053654_839646.webp', 1, 15, 'webp', 'image', NULL, '2025-04-01 10:36:54', '2025-04-01 10:36:54', NULL),
(670, NULL, 'uploads/more/20250401053654_706797.webp', 1, 15, 'webp', 'image', NULL, '2025-04-01 10:36:54', '2025-04-01 10:36:54', NULL),
(671, NULL, 'uploads/20250401053752_301177.jpg', 1, 154, 'jpg', 'image', NULL, '2025-04-01 10:37:52', '2025-04-01 10:37:52', NULL),
(672, NULL, 'uploads/more/20250401053753_679730.jpg', 1, 154, 'jpg', 'image', NULL, '2025-04-01 10:37:53', '2025-04-01 10:37:53', NULL),
(673, NULL, 'uploads/20250401054137_920739.webp', 1, 7, 'webp', 'image', NULL, '2025-04-01 10:41:37', '2025-04-01 10:41:37', NULL),
(674, NULL, 'uploads/more/20250401054137_406751.webp', 1, 7, 'webp', 'image', NULL, '2025-04-01 10:41:37', '2025-04-01 10:41:37', NULL),
(675, NULL, 'uploads/20250401054228_474565.webp', 1, 17, 'webp', 'image', NULL, '2025-04-01 10:42:28', '2025-04-01 10:42:28', NULL),
(676, NULL, 'uploads/more/20250401054228_482991.webp', 1, 17, 'webp', 'image', NULL, '2025-04-01 10:42:28', '2025-04-01 10:42:28', NULL),
(677, NULL, 'uploads/20250401054327_964383.png', 1, 683, 'png', 'image', NULL, '2025-04-01 10:43:27', '2025-04-01 10:43:27', NULL),
(678, NULL, 'uploads/more/20250401054327_794627.png', 1, 683, 'png', 'image', NULL, '2025-04-01 10:43:28', '2025-04-01 10:43:28', NULL),
(679, NULL, 'uploads/20250401054425_294581.webp', 1, 37, 'webp', 'image', NULL, '2025-04-01 10:44:25', '2025-04-01 10:44:25', NULL),
(680, NULL, 'uploads/more/20250401054425_160512.webp', 1, 37, 'webp', 'image', NULL, '2025-04-01 10:44:25', '2025-04-01 10:44:25', NULL),
(681, NULL, 'uploads/20250401054550_325124.webp', 1, 12, 'webp', 'image', NULL, '2025-04-01 10:45:50', '2025-04-01 10:45:50', NULL),
(682, NULL, 'uploads/more/20250401054550_352648.webp', 1, 12, 'webp', 'image', NULL, '2025-04-01 10:45:50', '2025-04-01 10:45:50', NULL),
(683, NULL, 'uploads/20250401054826_142514.jpg', 1, 43, 'jpg', 'image', NULL, '2025-04-01 10:48:26', '2025-04-01 10:48:26', NULL),
(684, NULL, 'uploads/more/20250401054826_698894.jpg', 1, 43, 'jpg', 'image', NULL, '2025-04-01 10:48:26', '2025-04-01 10:48:26', NULL),
(685, NULL, 'uploads/20250401054950_346404.webp', 1, 34, 'webp', 'image', NULL, '2025-04-01 10:49:50', '2025-04-01 10:49:50', NULL),
(686, NULL, 'uploads/more/20250401054950_942019.webp', 1, 34, 'webp', 'image', NULL, '2025-04-01 10:49:50', '2025-04-01 10:49:50', NULL),
(687, NULL, 'uploads/20250401055138_256533.png', 1, 94, 'png', 'image', NULL, '2025-04-01 10:51:38', '2025-04-01 10:51:38', NULL),
(688, NULL, 'uploads/more/20250401055138_494987.png', 1, 94, 'png', 'image', NULL, '2025-04-01 10:51:38', '2025-04-01 10:51:38', NULL),
(689, NULL, 'uploads/20250401055344_378468.webp', 1, 5, 'webp', 'image', NULL, '2025-04-01 10:53:44', '2025-04-01 10:53:44', NULL),
(690, NULL, 'uploads/more/20250401055344_291456.webp', 1, 5, 'webp', 'image', NULL, '2025-04-01 10:53:44', '2025-04-01 10:53:44', NULL),
(691, NULL, 'uploads/20250401055512_529723.webp', 1, 5, 'webp', 'image', NULL, '2025-04-01 10:55:12', '2025-04-01 10:55:12', NULL),
(692, NULL, 'uploads/more/20250401055512_407692.webp', 1, 5, 'webp', 'image', NULL, '2025-04-01 10:55:12', '2025-04-01 10:55:12', NULL),
(693, NULL, 'uploads/20250401055721_351924.jpg', 1, 36, 'jpg', 'image', NULL, '2025-04-01 10:57:22', '2025-04-01 10:57:22', NULL),
(694, NULL, 'uploads/more/20250401055722_421216.jpg', 1, 36, 'jpg', 'image', NULL, '2025-04-01 10:57:22', '2025-04-01 10:57:22', NULL),
(695, NULL, 'uploads/20250401161721_408731.jpeg', 1, 49, 'jpeg', 'image', NULL, '2025-04-01 21:17:21', '2025-04-01 21:17:21', NULL),
(696, NULL, 'uploads/more/20250401161721_966549.jpeg', 1, 49, 'jpeg', 'image', NULL, '2025-04-01 21:17:21', '2025-04-01 21:17:21', NULL),
(697, NULL, 'uploads/20250401161925_862448.webp', 1, 39, 'webp', 'image', NULL, '2025-04-01 21:19:25', '2025-04-01 21:19:25', NULL),
(698, NULL, 'uploads/more/20250401161926_971254.webp', 1, 23, 'webp', 'image', NULL, '2025-04-01 21:19:26', '2025-04-01 21:19:26', NULL),
(699, NULL, 'uploads/20250401162610_222470.jpg', 1, 25, 'jpg', 'image', NULL, '2025-04-01 21:26:10', '2025-04-01 21:26:10', NULL),
(700, NULL, 'uploads/more/20250401162610_132414.jpg', 1, 25, 'jpg', 'image', NULL, '2025-04-01 21:26:10', '2025-04-01 21:26:10', NULL),
(701, NULL, 'uploads/20250401162720_785571.webp', 1, 29, 'webp', 'image', NULL, '2025-04-01 21:27:20', '2025-04-01 21:27:20', NULL),
(702, NULL, 'uploads/more/20250401162720_672468.webp', 1, 29, 'webp', 'image', NULL, '2025-04-01 21:27:20', '2025-04-01 21:27:20', NULL),
(703, NULL, 'uploads/20250401162948_673260.webp', 1, 34, 'webp', 'image', NULL, '2025-04-01 21:29:48', '2025-04-01 21:29:48', NULL),
(704, NULL, 'uploads/more/20250401162948_956662.webp', 1, 34, 'webp', 'image', NULL, '2025-04-01 21:29:48', '2025-04-01 21:29:48', NULL),
(705, NULL, 'uploads/20250401163201_531521.jpg', 1, 658, 'jpg', 'image', NULL, '2025-04-01 21:32:01', '2025-04-01 21:32:01', NULL),
(706, NULL, 'uploads/more/20250401163201_394332.jpg', 1, 658, 'jpg', 'image', NULL, '2025-04-01 21:32:01', '2025-04-01 21:32:01', NULL),
(707, NULL, 'uploads/20250401163646_724102.jpg', 1, 113, 'jpg', 'image', NULL, '2025-04-01 21:36:46', '2025-04-01 21:36:46', NULL),
(708, NULL, 'uploads/more/20250401163647_754077.jpg', 1, 113, 'jpg', 'image', NULL, '2025-04-01 21:36:47', '2025-04-01 21:36:47', NULL),
(709, NULL, 'uploads/20250401163857_191841.jpg', 1, 334, 'jpg', 'image', NULL, '2025-04-01 21:38:57', '2025-04-01 21:38:57', NULL),
(710, NULL, 'uploads/more/20250401163857_785296.jpg', 1, 334, 'jpg', 'image', NULL, '2025-04-01 21:38:57', '2025-04-01 21:38:57', NULL),
(711, NULL, 'uploads/20250401164025_490119.jpg', 1, 148, 'jpg', 'image', NULL, '2025-04-01 21:40:25', '2025-04-01 21:40:25', NULL),
(712, NULL, 'uploads/more/20250401164025_162505.jpg', 1, 148, 'jpg', 'image', NULL, '2025-04-01 21:40:25', '2025-04-01 21:40:25', NULL),
(713, NULL, 'uploads/20250401164515_924898.jpg', 1, 26, 'jpg', 'image', NULL, '2025-04-01 21:45:15', '2025-04-01 21:45:15', NULL),
(714, NULL, 'uploads/more/20250401164515_352422.jpg', 1, 26, 'jpg', 'image', NULL, '2025-04-01 21:45:15', '2025-04-01 21:45:15', NULL),
(715, NULL, 'uploads/20250401164627_221922.jpg', 1, 47, 'jpg', 'image', NULL, '2025-04-01 21:46:27', '2025-04-01 21:46:27', NULL),
(716, NULL, 'uploads/more/20250401164627_395976.jpg', 1, 47, 'jpg', 'image', NULL, '2025-04-01 21:46:27', '2025-04-01 21:46:27', NULL),
(717, NULL, 'uploads/20250401164841_215023.jpg', 1, 43, 'jpg', 'image', NULL, '2025-04-01 21:48:41', '2025-04-01 21:48:41', NULL),
(718, NULL, 'uploads/more/20250401164841_854190.jpg', 1, 43, 'jpg', 'image', NULL, '2025-04-01 21:48:41', '2025-04-01 21:48:41', NULL),
(719, NULL, 'uploads/20250401165042_740533.webp', 1, 30, 'webp', 'image', NULL, '2025-04-01 21:50:42', '2025-04-01 21:50:42', NULL),
(720, NULL, 'uploads/more/20250401165042_130275.webp', 1, 30, 'webp', 'image', NULL, '2025-04-01 21:50:42', '2025-04-01 21:50:42', NULL),
(721, NULL, 'uploads/20250401165242_951014.webp', 1, 30, 'webp', 'image', NULL, '2025-04-01 21:52:42', '2025-04-01 21:52:42', NULL),
(722, NULL, 'uploads/more/20250401165242_650617.webp', 1, 30, 'webp', 'image', NULL, '2025-04-01 21:52:42', '2025-04-01 21:52:42', NULL),
(723, NULL, 'uploads/20250401165432_525976.png', 1, 65, 'png', 'image', NULL, '2025-04-01 21:54:32', '2025-04-01 21:54:32', NULL),
(724, NULL, 'uploads/more/20250401165432_995299.png', 1, 65, 'png', 'image', NULL, '2025-04-01 21:54:32', '2025-04-01 21:54:32', NULL),
(725, NULL, 'uploads/20250402042359_921584.webp', 1, 33, 'webp', 'image', NULL, '2025-04-02 09:23:59', '2025-04-02 09:23:59', NULL),
(726, NULL, 'uploads/more/20250402042359_243651.webp', 1, 33, 'webp', 'image', NULL, '2025-04-02 09:23:59', '2025-04-02 09:23:59', NULL),
(727, NULL, 'uploads/20250402042453_344597.jpg', 1, 99, 'jpg', 'image', NULL, '2025-04-02 09:24:53', '2025-04-02 09:24:53', NULL),
(728, NULL, 'uploads/more/20250402042453_658829.jpg', 1, 99, 'jpg', 'image', NULL, '2025-04-02 09:24:53', '2025-04-02 09:24:53', NULL),
(729, NULL, 'uploads/20250402042608_568556.webp', 1, 39, 'webp', 'image', NULL, '2025-04-02 09:26:08', '2025-04-02 09:26:08', NULL),
(730, NULL, 'uploads/more/20250402042608_854974.webp', 1, 39, 'webp', 'image', NULL, '2025-04-02 09:26:08', '2025-04-02 09:26:08', NULL),
(731, NULL, 'uploads/20250402042728_939191.png', 1, 215, 'png', 'image', NULL, '2025-04-02 09:27:28', '2025-04-02 09:27:28', NULL),
(732, NULL, 'uploads/more/20250402042728_417905.png', 1, 215, 'png', 'image', NULL, '2025-04-02 09:27:28', '2025-04-02 09:27:28', NULL),
(733, NULL, 'uploads/20250402043007_949480.jpeg', 1, 15, 'jpeg', 'image', NULL, '2025-04-02 09:30:07', '2025-04-02 09:30:07', NULL),
(734, NULL, 'uploads/more/20250402043007_231713.jpeg', 1, 15, 'jpeg', 'image', NULL, '2025-04-02 09:30:07', '2025-04-02 09:30:07', NULL),
(735, NULL, 'uploads/20250402043115_664144.jpeg', 1, 7, 'jpeg', 'image', NULL, '2025-04-02 09:31:15', '2025-04-02 09:31:15', NULL),
(736, NULL, 'uploads/more/20250402043115_360237.jpeg', 1, 7, 'jpeg', 'image', NULL, '2025-04-02 09:31:15', '2025-04-02 09:31:15', NULL),
(737, NULL, 'uploads/20250402043331_123727.webp', 1, 24, 'webp', 'image', NULL, '2025-04-02 09:33:31', '2025-04-02 09:33:31', NULL),
(738, NULL, 'uploads/more/20250402043331_280989.webp', 1, 24, 'webp', 'image', NULL, '2025-04-02 09:33:31', '2025-04-02 09:33:31', NULL),
(739, NULL, 'uploads/20250402043533_429606.png', 1, 53, 'png', 'image', NULL, '2025-04-02 09:35:33', '2025-04-02 09:35:33', NULL),
(740, NULL, 'uploads/more/20250402043533_137091.png', 1, 53, 'png', 'image', NULL, '2025-04-02 09:35:33', '2025-04-02 09:35:33', NULL),
(741, NULL, 'uploads/20250402043636_803913.jpeg', 1, 29, 'jpeg', 'image', NULL, '2025-04-02 09:36:36', '2025-04-02 09:36:36', NULL),
(742, NULL, 'uploads/more/20250402043636_370144.jpeg', 1, 29, 'jpeg', 'image', NULL, '2025-04-02 09:36:36', '2025-04-02 09:36:36', NULL),
(743, NULL, 'uploads/20250402043910_886754.jpg', 1, 10, 'jpg', 'image', NULL, '2025-04-02 09:39:10', '2025-04-02 09:39:10', NULL),
(744, NULL, 'uploads/more/20250402043910_674452.jpg', 1, 10, 'jpg', 'image', NULL, '2025-04-02 09:39:10', '2025-04-02 09:39:10', NULL),
(745, NULL, 'uploads/20250402044023_817673.jpg', 1, 21, 'jpg', 'image', NULL, '2025-04-02 09:40:23', '2025-04-02 09:40:23', NULL),
(746, NULL, 'uploads/more/20250402044023_150520.jpg', 1, 21, 'jpg', 'image', NULL, '2025-04-02 09:40:23', '2025-04-02 09:40:23', NULL),
(747, NULL, 'uploads/20250403132731_949141.jpeg', 1, 17, 'jpeg', 'image', NULL, '2025-04-03 18:27:31', '2025-04-03 18:27:31', NULL),
(748, NULL, 'uploads/more/20250403132731_574772.jpeg', 1, 17, 'jpeg', 'image', NULL, '2025-04-03 18:27:31', '2025-04-03 18:27:31', NULL),
(749, NULL, 'uploads/20250403132834_599240.jpeg', 1, 65, 'jpeg', 'image', NULL, '2025-04-03 18:28:34', '2025-04-03 18:28:34', NULL),
(750, NULL, 'uploads/more/20250403132834_211560.jpeg', 1, 65, 'jpeg', 'image', NULL, '2025-04-03 18:28:34', '2025-04-03 18:28:34', NULL),
(751, NULL, 'uploads/20250403132921_936242.jpeg', 1, 56, 'jpeg', 'image', NULL, '2025-04-03 18:29:21', '2025-04-03 18:29:21', NULL),
(752, NULL, 'uploads/more/20250403132921_751998.jpeg', 1, 56, 'jpeg', 'image', NULL, '2025-04-03 18:29:21', '2025-04-03 18:29:21', NULL),
(753, NULL, 'uploads/20250403133007_677593.jpeg', 1, 7, 'jpeg', 'image', NULL, '2025-04-03 18:30:07', '2025-04-03 18:30:07', NULL),
(754, NULL, 'uploads/more/20250403133007_111861.jpeg', 1, 7, 'jpeg', 'image', NULL, '2025-04-03 18:30:07', '2025-04-03 18:30:07', NULL),
(755, NULL, 'uploads/20250403133056_934247.jpg', 1, 57, 'jpg', 'image', NULL, '2025-04-03 18:30:56', '2025-04-03 18:30:56', NULL),
(756, NULL, 'uploads/more/20250403133056_673115.jpg', 1, 57, 'jpg', 'image', NULL, '2025-04-03 18:30:56', '2025-04-03 18:30:56', NULL),
(757, NULL, 'uploads/20250403133214_431295.webp', 1, 9, 'webp', 'image', NULL, '2025-04-03 18:32:14', '2025-04-03 18:32:14', NULL),
(758, NULL, 'uploads/more/20250403133214_452883.webp', 1, 9, 'webp', 'image', NULL, '2025-04-03 18:32:14', '2025-04-03 18:32:14', NULL),
(759, NULL, 'uploads/20250403133507_550416.png', 1, 107, 'png', 'image', NULL, '2025-04-03 18:35:07', '2025-04-03 18:35:07', NULL),
(760, NULL, 'uploads/more/20250403133507_287764.png', 1, 107, 'png', 'image', NULL, '2025-04-03 18:35:07', '2025-04-03 18:35:07', NULL),
(761, NULL, 'uploads/20250403133622_457987.webp', 1, 7, 'webp', 'image', NULL, '2025-04-03 18:36:22', '2025-04-03 18:36:22', NULL),
(762, NULL, 'uploads/more/20250403133622_608650.webp', 1, 7, 'webp', 'image', NULL, '2025-04-03 18:36:22', '2025-04-03 18:36:22', NULL),
(763, NULL, 'uploads/20250403134207_608658.webp', 1, 10, 'webp', 'image', NULL, '2025-04-03 18:42:07', '2025-04-03 18:42:07', NULL),
(764, NULL, 'uploads/more/20250403134207_940289.webp', 1, 10, 'webp', 'image', NULL, '2025-04-03 18:42:07', '2025-04-03 18:42:07', NULL),
(765, NULL, 'uploads/more/20250403134818_388917.jpg', 1, 120, 'jpg', 'image', NULL, '2025-04-03 18:48:18', '2025-04-03 18:48:18', NULL),
(766, NULL, 'uploads/20250403134856_135492.jpg', 1, 154, 'jpg', 'image', NULL, '2025-04-03 18:48:56', '2025-04-03 18:48:56', NULL),
(767, NULL, 'uploads/more/20250403134856_212469.jpg', 1, 154, 'jpg', 'image', NULL, '2025-04-03 18:48:56', '2025-04-03 18:48:56', NULL),
(768, NULL, 'uploads/20250403135019_590392.jpeg', 1, 108, 'jpeg', 'image', NULL, '2025-04-03 18:50:19', '2025-04-03 18:50:19', NULL),
(769, NULL, 'uploads/more/20250403135019_889614.jpeg', 1, 108, 'jpeg', 'image', NULL, '2025-04-03 18:50:19', '2025-04-03 18:50:19', NULL),
(770, NULL, 'uploads/20250403135054_831778.jpeg', 1, 108, 'jpeg', 'image', NULL, '2025-04-03 18:50:54', '2025-04-03 18:50:54', NULL),
(771, NULL, 'uploads/more/20250403135054_339076.jpeg', 1, 108, 'jpeg', 'image', NULL, '2025-04-03 18:50:54', '2025-04-03 18:50:54', NULL),
(772, NULL, 'uploads/20250403135219_637553.jpeg', 1, 108, 'jpeg', 'image', NULL, '2025-04-03 18:52:19', '2025-04-03 18:52:19', NULL),
(773, NULL, 'uploads/more/20250403135219_495847.jpeg', 1, 108, 'jpeg', 'image', NULL, '2025-04-03 18:52:19', '2025-04-03 18:52:19', NULL),
(774, NULL, 'uploads/20250403135344_775537.webp', 1, 16, 'webp', 'image', NULL, '2025-04-03 18:53:44', '2025-04-03 18:53:44', NULL),
(775, NULL, 'uploads/more/20250403135344_154834.webp', 1, 16, 'webp', 'image', NULL, '2025-04-03 18:53:44', '2025-04-03 18:53:44', NULL),
(776, NULL, 'uploads/20250403135406_756514.webp', 1, 16, 'webp', 'image', NULL, '2025-04-03 18:54:06', '2025-04-03 18:54:06', NULL),
(777, NULL, 'uploads/more/20250403135406_189971.webp', 1, 16, 'webp', 'image', NULL, '2025-04-03 18:54:06', '2025-04-03 18:54:06', NULL),
(778, NULL, 'uploads/20250403135431_437118.webp', 1, 16, 'webp', 'image', NULL, '2025-04-03 18:54:31', '2025-04-03 18:54:31', NULL),
(779, NULL, 'uploads/more/20250403135431_333574.webp', 1, 16, 'webp', 'image', NULL, '2025-04-03 18:54:31', '2025-04-03 18:54:31', NULL),
(780, NULL, 'uploads/20250403135500_638683.webp', 1, 16, 'webp', 'image', NULL, '2025-04-03 18:55:00', '2025-04-03 18:55:00', NULL),
(781, NULL, 'uploads/more/20250403135500_884004.webp', 1, 16, 'webp', 'image', NULL, '2025-04-03 18:55:00', '2025-04-03 18:55:00', NULL),
(782, NULL, 'uploads/20250403135606_107751.webp', 1, 16, 'webp', 'image', NULL, '2025-04-03 18:56:06', '2025-04-03 18:56:06', NULL),
(783, NULL, 'uploads/more/20250403135606_826932.webp', 1, 16, 'webp', 'image', NULL, '2025-04-03 18:56:06', '2025-04-03 18:56:06', NULL),
(784, NULL, 'uploads/20250403135701_594836.jpeg', 1, 17, 'jpeg', 'image', NULL, '2025-04-03 18:57:01', '2025-04-03 18:57:01', NULL),
(785, NULL, 'uploads/more/20250403135701_142905.jpeg', 1, 17, 'jpeg', 'image', NULL, '2025-04-03 18:57:01', '2025-04-03 18:57:01', NULL),
(786, NULL, 'uploads/20250403135738_203878.jpeg', 1, 56, 'jpeg', 'image', NULL, '2025-04-03 18:57:38', '2025-04-03 18:57:38', NULL),
(787, NULL, 'uploads/more/20250403135738_736056.jpeg', 1, 56, 'jpeg', 'image', NULL, '2025-04-03 18:57:38', '2025-04-03 18:57:38', NULL),
(788, NULL, 'uploads/20250403135810_771173.jpeg', 1, 17, 'jpeg', 'image', NULL, '2025-04-03 18:58:10', '2025-04-03 18:58:10', NULL),
(789, NULL, 'uploads/more/20250403135810_642202.jpeg', 1, 17, 'jpeg', 'image', NULL, '2025-04-03 18:58:10', '2025-04-03 18:58:10', NULL),
(790, NULL, 'uploads/20250403140217_139904.webp', 1, 21, 'webp', 'image', NULL, '2025-04-03 19:02:17', '2025-04-03 19:02:17', NULL),
(791, NULL, 'uploads/more/20250403140217_594989.webp', 1, 21, 'webp', 'image', NULL, '2025-04-03 19:02:17', '2025-04-03 19:02:17', NULL),
(792, NULL, 'uploads/20250403141139_531308.png', 1, 601, 'png', 'image', NULL, '2025-04-03 19:11:39', '2025-04-03 19:11:39', NULL),
(793, NULL, 'uploads/more/20250403141140_517045.png', 1, 601, 'png', 'image', NULL, '2025-04-03 19:11:40', '2025-04-03 19:11:40', NULL),
(794, NULL, 'uploads/20250403141311_276143.png', 1, 336, 'png', 'image', NULL, '2025-04-03 19:13:11', '2025-04-03 19:13:11', NULL),
(795, NULL, 'uploads/more/20250403141312_211506.png', 1, 336, 'png', 'image', NULL, '2025-04-03 19:13:12', '2025-04-03 19:13:12', NULL),
(796, NULL, 'uploads/20250405060539_518128.jpeg', 1, 45, 'jpeg', 'image', NULL, '2025-04-05 11:05:39', '2025-04-05 11:05:39', NULL),
(797, NULL, 'uploads/more/20250405060539_562966.jpeg', 1, 45, 'jpeg', 'image', NULL, '2025-04-05 11:05:39', '2025-04-05 11:05:39', NULL),
(798, NULL, 'uploads/20250405065339_845805.jpg', 1, 9, 'jpg', 'image', NULL, '2025-04-05 11:53:39', '2025-04-05 11:53:39', NULL),
(799, NULL, 'uploads/more/20250405065339_934944.jpg', 1, 9, 'jpg', 'image', NULL, '2025-04-05 11:53:39', '2025-04-05 11:53:39', NULL),
(800, NULL, 'uploads/20250405071223_943965.jpeg', 1, 13, 'jpeg', 'image', NULL, '2025-04-05 12:12:23', '2025-04-05 12:12:23', NULL),
(801, NULL, 'uploads/more/20250405071223_446370.jpeg', 1, 13, 'jpeg', 'image', NULL, '2025-04-05 12:12:23', '2025-04-05 12:12:23', NULL),
(802, NULL, 'uploads/20250405071431_832294.png', 1, 54, 'png', 'image', NULL, '2025-04-05 12:14:31', '2025-04-05 12:14:31', NULL),
(803, NULL, 'uploads/more/20250405071431_230348.png', 1, 54, 'png', 'image', NULL, '2025-04-05 12:14:31', '2025-04-05 12:14:31', NULL),
(804, NULL, 'uploads/20250405071714_853105.png', 1, 54, 'png', 'image', NULL, '2025-04-05 12:17:14', '2025-04-05 12:17:14', NULL),
(805, NULL, 'uploads/more/20250405071714_847117.png', 1, 54, 'png', 'image', NULL, '2025-04-05 12:17:14', '2025-04-05 12:17:14', NULL),
(806, NULL, 'uploads/20250405071926_248411.webp', 1, 36, 'webp', 'image', NULL, '2025-04-05 12:19:26', '2025-04-05 12:19:26', NULL),
(807, NULL, 'uploads/more/20250405071926_370262.webp', 1, 36, 'webp', 'image', NULL, '2025-04-05 12:19:26', '2025-04-05 12:19:26', NULL),
(808, NULL, 'uploads/20250405072136_108647.webp', 1, 36, 'webp', 'image', NULL, '2025-04-05 12:21:36', '2025-04-05 12:21:36', NULL),
(809, NULL, 'uploads/more/20250405072136_573478.webp', 1, 36, 'webp', 'image', NULL, '2025-04-05 12:21:36', '2025-04-05 12:21:36', NULL),
(810, NULL, 'uploads/20250405083503_313490.webp', 1, 38, 'webp', 'image', NULL, '2025-04-05 13:35:03', '2025-04-05 13:35:03', NULL),
(811, NULL, 'uploads/more/20250405083503_270149.webp', 1, 38, 'webp', 'image', NULL, '2025-04-05 13:35:03', '2025-04-05 13:35:03', NULL),
(812, NULL, 'uploads/20250405083619_317524.png', 1, 600, 'png', 'image', NULL, '2025-04-05 13:36:19', '2025-04-05 13:36:19', NULL),
(813, NULL, 'uploads/more/20250405083619_955470.png', 1, 600, 'png', 'image', NULL, '2025-04-05 13:36:19', '2025-04-05 13:36:19', NULL),
(814, NULL, 'uploads/20250405083741_755012.jpeg', 1, 54, 'jpeg', 'image', NULL, '2025-04-05 13:37:41', '2025-04-05 13:37:41', NULL),
(815, NULL, 'uploads/more/20250405083741_472786.jpeg', 1, 54, 'jpeg', 'image', NULL, '2025-04-05 13:37:41', '2025-04-05 13:37:41', NULL),
(816, NULL, 'uploads/20250405083849_667771.jpg', 1, 26, 'jpg', 'image', NULL, '2025-04-05 13:38:49', '2025-04-05 13:38:49', NULL),
(817, NULL, 'uploads/more/20250405083849_589704.jpg', 1, 26, 'jpg', 'image', NULL, '2025-04-05 13:38:49', '2025-04-05 13:38:49', NULL),
(818, NULL, 'uploads/20250405085544_361423.jpg', 1, 41, 'jpg', 'image', NULL, '2025-04-05 13:55:44', '2025-04-05 13:55:44', NULL),
(819, NULL, 'uploads/more/20250405085544_997524.jpg', 1, 41, 'jpg', 'image', NULL, '2025-04-05 13:55:44', '2025-04-05 13:55:44', NULL),
(820, NULL, 'uploads/20250405085910_168752.jpg', 1, 41, 'jpg', 'image', NULL, '2025-04-05 13:59:10', '2025-04-05 13:59:10', NULL),
(821, NULL, 'uploads/more/20250405085910_622300.jpg', 1, 41, 'jpg', 'image', NULL, '2025-04-05 13:59:10', '2025-04-05 13:59:10', NULL),
(822, NULL, 'uploads/20250405090247_638511.jpeg', 1, 11, 'jpeg', 'image', NULL, '2025-04-05 14:02:47', '2025-04-05 14:02:47', NULL),
(823, NULL, 'uploads/more/20250405090247_811985.jpeg', 1, 11, 'jpeg', 'image', NULL, '2025-04-05 14:02:47', '2025-04-05 14:02:47', NULL),
(824, NULL, 'uploads/20250405090433_990154.jpeg', 1, 52, 'jpeg', 'image', NULL, '2025-04-05 14:04:33', '2025-04-05 14:04:33', NULL),
(825, NULL, 'uploads/more/20250405090434_876161.jpeg', 1, 52, 'jpeg', 'image', NULL, '2025-04-05 14:04:34', '2025-04-05 14:04:34', NULL),
(826, NULL, 'uploads/20250405090526_204106.jpeg', 1, 11, 'jpeg', 'image', NULL, '2025-04-05 14:05:26', '2025-04-05 14:05:26', NULL),
(827, NULL, 'uploads/more/20250405090526_711618.jpeg', 1, 11, 'jpeg', 'image', NULL, '2025-04-05 14:05:26', '2025-04-05 14:05:26', NULL),
(828, NULL, 'uploads/20250405090942_431183.jpeg', 1, 48, 'jpeg', 'image', NULL, '2025-04-05 14:09:42', '2025-04-05 14:09:42', NULL),
(829, NULL, 'uploads/more/20250405090942_789916.jpeg', 1, 48, 'jpeg', 'image', NULL, '2025-04-05 14:09:42', '2025-04-05 14:09:42', NULL),
(830, NULL, 'uploads/20250405091034_148288.jpeg', 1, 10, 'jpeg', 'image', NULL, '2025-04-05 14:10:34', '2025-04-05 14:10:34', NULL),
(831, NULL, 'uploads/more/20250405091034_596540.jpeg', 1, 10, 'jpeg', 'image', NULL, '2025-04-05 14:10:34', '2025-04-05 14:10:34', NULL),
(832, NULL, 'uploads/20250405091205_533628.png', 1, 265, 'png', 'image', NULL, '2025-04-05 14:12:05', '2025-04-05 14:12:05', NULL),
(833, NULL, 'uploads/more/20250405091205_900718.png', 1, 265, 'png', 'image', NULL, '2025-04-05 14:12:05', '2025-04-05 14:12:05', NULL),
(834, NULL, 'uploads/20250405091259_244242.webp', 1, 47, 'webp', 'image', NULL, '2025-04-05 14:12:59', '2025-04-05 14:12:59', NULL),
(835, NULL, 'uploads/more/20250405091259_965096.webp', 1, 47, 'webp', 'image', NULL, '2025-04-05 14:12:59', '2025-04-05 14:12:59', NULL),
(836, NULL, 'uploads/20250405091543_219038.webp', 1, 45, 'webp', 'image', NULL, '2025-04-05 14:15:43', '2025-04-05 14:15:43', NULL),
(837, NULL, 'uploads/more/20250405091543_938311.webp', 1, 45, 'webp', 'image', NULL, '2025-04-05 14:15:43', '2025-04-05 14:15:43', NULL),
(838, NULL, 'uploads/20250405091817_201143.webp', 1, 18, 'webp', 'image', NULL, '2025-04-05 14:18:17', '2025-04-05 14:18:17', NULL),
(839, NULL, 'uploads/more/20250405091817_757978.webp', 1, 18, 'webp', 'image', NULL, '2025-04-05 14:18:18', '2025-04-05 14:18:18', NULL),
(840, NULL, 'uploads/20250405091951_252413.png', 1, 601, 'png', 'image', NULL, '2025-04-05 14:19:51', '2025-04-05 14:19:51', NULL),
(841, NULL, 'uploads/more/20250405091951_297280.png', 1, 601, 'png', 'image', NULL, '2025-04-05 14:19:51', '2025-04-05 14:19:51', NULL),
(842, NULL, 'uploads/20250405092659_382991.jpg', 1, 467, 'jpg', 'image', NULL, '2025-04-05 14:26:59', '2025-04-05 14:26:59', NULL),
(843, NULL, 'uploads/more/20250405092659_282582.jpg', 1, 467, 'jpg', 'image', NULL, '2025-04-05 14:26:59', '2025-04-05 14:26:59', NULL),
(844, NULL, 'uploads/20250405092851_677753.jpeg', 1, 98, 'jpeg', 'image', NULL, '2025-04-05 14:28:51', '2025-04-05 14:28:51', NULL),
(845, NULL, 'uploads/more/20250405092851_684631.jpeg', 1, 98, 'jpeg', 'image', NULL, '2025-04-05 14:28:51', '2025-04-05 14:28:51', NULL),
(846, NULL, 'uploads/20250405093013_137650.webp', 1, 16, 'webp', 'image', NULL, '2025-04-05 14:30:13', '2025-04-05 14:30:13', NULL),
(847, NULL, 'uploads/more/20250405093013_233014.webp', 1, 16, 'webp', 'image', NULL, '2025-04-05 14:30:13', '2025-04-05 14:30:13', NULL),
(848, NULL, 'uploads/20250405093233_273531.png', 1, 587, 'png', 'image', NULL, '2025-04-05 14:32:33', '2025-04-05 14:32:33', NULL),
(849, NULL, 'uploads/more/20250405093233_649796.png', 1, 587, 'png', 'image', NULL, '2025-04-05 14:32:33', '2025-04-05 14:32:33', NULL),
(850, NULL, 'uploads/20250405093809_387248.jpg', 1, 21, 'jpg', 'image', NULL, '2025-04-05 14:38:09', '2025-04-05 14:38:09', NULL),
(851, NULL, 'uploads/more/20250405093809_927341.jpg', 1, 21, 'jpg', 'image', NULL, '2025-04-05 14:38:09', '2025-04-05 14:38:09', NULL),
(852, NULL, 'uploads/20250405094248_452426.jpg', 1, 75, 'jpg', 'image', NULL, '2025-04-05 14:42:48', '2025-04-05 14:42:48', NULL),
(853, NULL, 'uploads/more/20250405094248_323340.jpg', 1, 75, 'jpg', 'image', NULL, '2025-04-05 14:42:48', '2025-04-05 14:42:48', NULL),
(854, NULL, 'uploads/20250405094342_227428.jpeg', 1, 10, 'jpeg', 'image', NULL, '2025-04-05 14:43:42', '2025-04-05 14:43:42', NULL),
(855, NULL, 'uploads/more/20250405094342_757645.jpeg', 1, 10, 'jpeg', 'image', NULL, '2025-04-05 14:43:42', '2025-04-05 14:43:42', NULL),
(856, NULL, 'uploads/20250405100641_911291.jpg', 1, 469, 'jpg', 'image', NULL, '2025-04-05 15:06:41', '2025-04-05 15:06:41', NULL),
(857, NULL, 'uploads/more/20250405100641_972545.jpg', 1, 469, 'jpg', 'image', NULL, '2025-04-05 15:06:41', '2025-04-05 15:06:41', NULL),
(858, NULL, 'uploads/20250405100708_985856.jpg', 1, 357, 'jpg', 'image', NULL, '2025-04-05 15:07:08', '2025-04-05 15:07:08', NULL),
(859, NULL, 'uploads/more/20250405100708_728273.jpg', 1, 357, 'jpg', 'image', NULL, '2025-04-05 15:07:08', '2025-04-05 15:07:08', NULL),
(860, NULL, 'uploads/20250405100914_138293.jpeg', 1, 60, 'jpeg', 'image', NULL, '2025-04-05 15:09:14', '2025-04-05 15:09:14', NULL);
INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `external_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(861, NULL, 'uploads/more/20250405100914_234101.jpeg', 1, 60, 'jpeg', 'image', NULL, '2025-04-05 15:09:14', '2025-04-05 15:09:14', NULL),
(862, NULL, 'uploads/20250405101020_307695.jpg', 1, 76, 'jpg', 'image', NULL, '2025-04-05 15:10:20', '2025-04-05 15:10:20', NULL),
(863, NULL, 'uploads/more/20250405101020_971942.webp', 1, 68, 'webp', 'image', NULL, '2025-04-05 15:10:20', '2025-04-05 15:10:20', NULL),
(864, NULL, 'uploads/20250405101143_279964.jpeg', 1, 10, 'jpeg', 'image', NULL, '2025-04-05 15:11:43', '2025-04-05 15:11:43', NULL),
(865, NULL, 'uploads/more/20250405101143_868581.jpeg', 1, 10, 'jpeg', 'image', NULL, '2025-04-05 15:11:43', '2025-04-05 15:11:43', NULL),
(866, NULL, 'uploads/20250405101241_254318.jpeg', 1, 60, 'jpeg', 'image', NULL, '2025-04-05 15:12:41', '2025-04-05 15:12:41', NULL),
(867, NULL, 'uploads/more/20250405101241_218882.jpeg', 1, 60, 'jpeg', 'image', NULL, '2025-04-05 15:12:41', '2025-04-05 15:12:41', NULL),
(868, NULL, 'uploads/20250405101345_972134.jpeg', 1, 129, 'jpeg', 'image', NULL, '2025-04-05 15:13:45', '2025-04-05 15:13:45', NULL),
(869, NULL, 'uploads/more/20250405101345_425011.jpeg', 1, 129, 'jpeg', 'image', NULL, '2025-04-05 15:13:45', '2025-04-05 15:13:45', NULL),
(870, NULL, 'uploads/20250405101439_274107.webp', 1, 20, 'webp', 'image', NULL, '2025-04-05 15:14:39', '2025-04-05 15:14:39', NULL),
(871, NULL, 'uploads/more/20250405101439_981386.webp', 1, 20, 'webp', 'image', NULL, '2025-04-05 15:14:39', '2025-04-05 15:14:39', NULL),
(872, NULL, 'uploads/20250405101555_605872.webp', 1, 20, 'webp', 'image', NULL, '2025-04-05 15:15:55', '2025-04-05 15:15:55', NULL),
(873, NULL, 'uploads/more/20250405101555_459087.webp', 1, 20, 'webp', 'image', NULL, '2025-04-05 15:15:56', '2025-04-05 15:15:56', NULL),
(874, NULL, 'uploads/20250405101818_263803.jpeg', 1, 36, 'jpeg', 'image', NULL, '2025-04-05 15:18:18', '2025-04-05 15:18:18', NULL),
(875, NULL, 'uploads/more/20250405101818_160439.jpeg', 1, 36, 'jpeg', 'image', NULL, '2025-04-05 15:18:18', '2025-04-05 15:18:18', NULL),
(876, NULL, 'uploads/20250405102050_771976.png', 1, 601, 'png', 'image', NULL, '2025-04-05 15:20:50', '2025-04-05 15:20:50', NULL),
(877, NULL, 'uploads/more/20250405102050_316394.png', 1, 601, 'png', 'image', NULL, '2025-04-05 15:20:50', '2025-04-05 15:20:50', NULL),
(878, NULL, 'uploads/20250405102240_589133.jpeg', 1, 121, 'jpeg', 'image', NULL, '2025-04-05 15:22:40', '2025-04-05 15:22:40', NULL),
(879, NULL, 'uploads/more/20250405102240_921783.jpeg', 1, 121, 'jpeg', 'image', NULL, '2025-04-05 15:22:40', '2025-04-05 15:22:40', NULL),
(880, NULL, 'uploads/20250405102354_887568.jpg', 1, 234, 'jpg', 'image', NULL, '2025-04-05 15:23:54', '2025-04-05 15:23:54', NULL),
(881, NULL, 'uploads/more/20250405102354_733284.jpg', 1, 234, 'jpg', 'image', NULL, '2025-04-05 15:23:54', '2025-04-05 15:23:54', NULL),
(882, NULL, 'uploads/20250405103009_257829.jpeg', 1, 108, 'jpeg', 'image', NULL, '2025-04-05 15:30:09', '2025-04-05 15:30:09', NULL),
(883, NULL, 'uploads/20250405103037_269415.webp', 1, 68, 'webp', 'image', NULL, '2025-04-05 15:30:37', '2025-04-05 15:30:37', NULL),
(884, NULL, 'uploads/20250405103214_598523.jpeg', 1, 5, 'jpeg', 'image', NULL, '2025-04-05 15:32:14', '2025-04-05 15:32:14', NULL),
(885, NULL, 'uploads/more/20250405103214_750269.jpeg', 1, 5, 'jpeg', 'image', NULL, '2025-04-05 15:32:14', '2025-04-05 15:32:14', NULL),
(886, NULL, 'uploads/20250405103338_187646.jpeg', 1, 4, 'jpeg', 'image', NULL, '2025-04-05 15:33:38', '2025-04-05 15:33:38', NULL),
(887, NULL, 'uploads/more/20250405103338_405345.jpeg', 1, 4, 'jpeg', 'image', NULL, '2025-04-05 15:33:38', '2025-04-05 15:33:38', NULL),
(888, NULL, 'uploads/20250405104315_290643.jpeg', 1, 4, 'jpeg', 'image', NULL, '2025-04-05 15:43:15', '2025-04-05 15:43:15', NULL),
(889, NULL, 'uploads/more/20250405104315_551339.jpeg', 1, 4, 'jpeg', 'image', NULL, '2025-04-05 15:43:15', '2025-04-05 15:43:15', NULL),
(890, NULL, 'uploads/20250405104512_707320.jpg', 1, 32, 'jpg', 'image', NULL, '2025-04-05 15:45:12', '2025-04-05 15:45:12', NULL),
(891, NULL, 'uploads/more/20250405104512_284075.jpg', 1, 32, 'jpg', 'image', NULL, '2025-04-05 15:45:12', '2025-04-05 15:45:12', NULL),
(892, NULL, 'uploads/20250405104616_541980.png', 1, 85, 'png', 'image', NULL, '2025-04-05 15:46:16', '2025-04-05 15:46:16', NULL),
(893, NULL, 'uploads/more/20250405104616_816555.png', 1, 85, 'png', 'image', NULL, '2025-04-05 15:46:16', '2025-04-05 15:46:16', NULL),
(894, NULL, 'uploads/20250405104945_512217.jpg', 1, 467, 'jpg', 'image', NULL, '2025-04-05 15:49:45', '2025-04-05 15:49:45', NULL),
(895, NULL, 'uploads/more/20250405104945_497995.jpg', 1, 467, 'jpg', 'image', NULL, '2025-04-05 15:49:45', '2025-04-05 15:49:45', NULL),
(896, NULL, 'uploads/20250405105228_675334.webp', 1, 13, 'webp', 'image', NULL, '2025-04-05 15:52:28', '2025-04-05 15:52:28', NULL),
(897, NULL, 'uploads/more/20250405105228_235493.webp', 1, 13, 'webp', 'image', NULL, '2025-04-05 15:52:28', '2025-04-05 15:52:28', NULL),
(898, NULL, 'uploads/20250405105430_292742.webp', 1, 34, 'webp', 'image', NULL, '2025-04-05 15:54:30', '2025-04-05 15:54:30', NULL),
(899, NULL, 'uploads/more/20250405105430_158316.webp', 1, 34, 'webp', 'image', NULL, '2025-04-05 15:54:30', '2025-04-05 15:54:30', NULL),
(900, NULL, 'uploads/20250405105627_236331.webp', 1, 34, 'webp', 'image', NULL, '2025-04-05 15:56:27', '2025-04-05 15:56:27', NULL),
(901, NULL, 'uploads/more/20250405105627_531160.webp', 1, 34, 'webp', 'image', NULL, '2025-04-05 15:56:27', '2025-04-05 15:56:27', NULL),
(902, NULL, 'uploads/20250405105902_376534.png', 1, 199, 'png', 'image', NULL, '2025-04-05 15:59:02', '2025-04-05 15:59:02', NULL),
(903, NULL, 'uploads/more/20250405105902_941603.png', 1, 199, 'png', 'image', NULL, '2025-04-05 15:59:03', '2025-04-05 15:59:03', NULL),
(904, NULL, 'uploads/20250405111216_934737.webp', 1, 21, 'webp', 'image', NULL, '2025-04-05 16:12:16', '2025-04-05 16:12:16', NULL),
(905, NULL, 'uploads/more/20250405111217_228026.webp', 1, 21, 'webp', 'image', NULL, '2025-04-05 16:12:17', '2025-04-05 16:12:17', NULL),
(906, NULL, 'uploads/20250405111345_196115.png', 1, 178, 'png', 'image', NULL, '2025-04-05 16:13:45', '2025-04-05 16:13:45', NULL),
(907, NULL, 'uploads/more/20250405111345_301407.png', 1, 178, 'png', 'image', NULL, '2025-04-05 16:13:45', '2025-04-05 16:13:45', NULL),
(908, NULL, 'uploads/20250405112236_833056.png', 1, 456, 'png', 'image', NULL, '2025-04-05 16:22:36', '2025-04-05 16:22:36', NULL),
(909, NULL, 'uploads/more/20250405112236_349686.png', 1, 456, 'png', 'image', NULL, '2025-04-05 16:22:36', '2025-04-05 16:22:36', NULL),
(910, NULL, 'uploads/20250405112325_861837.webp', 1, 14, 'webp', 'image', NULL, '2025-04-05 16:23:25', '2025-04-05 16:23:25', NULL),
(911, NULL, 'uploads/more/20250405112325_373824.webp', 1, 14, 'webp', 'image', NULL, '2025-04-05 16:23:26', '2025-04-05 16:23:26', NULL),
(912, NULL, 'uploads/20250405112510_844972.webp', 1, 41, 'webp', 'image', NULL, '2025-04-05 16:25:10', '2025-04-05 16:25:10', NULL),
(913, NULL, 'uploads/more/20250405112510_288163.webp', 1, 41, 'webp', 'image', NULL, '2025-04-05 16:25:10', '2025-04-05 16:25:10', NULL),
(914, NULL, 'uploads/20250405112559_216380.webp', 1, 41, 'webp', 'image', NULL, '2025-04-05 16:25:59', '2025-04-05 16:25:59', NULL),
(915, NULL, 'uploads/more/20250405112559_902143.webp', 1, 41, 'webp', 'image', NULL, '2025-04-05 16:25:59', '2025-04-05 16:25:59', NULL),
(916, NULL, 'uploads/20250405113100_643393.png', 1, 199, 'png', 'image', NULL, '2025-04-05 16:31:00', '2025-04-05 16:31:00', NULL),
(917, NULL, 'uploads/more/20250405113100_938902.png', 1, 199, 'png', 'image', NULL, '2025-04-05 16:31:00', '2025-04-05 16:31:00', NULL),
(920, NULL, 'uploads/20250417104353_466550.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-17 04:43:53', '2025-04-17 04:43:53', NULL),
(921, NULL, 'uploads/more/20250417104353_519398.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-17 04:43:53', '2025-04-17 04:43:53', NULL),
(923, NULL, 'uploads/20250420061342_122167.jpg', 7, 45, 'jpg', 'image', NULL, '2025-04-20 00:13:42', '2025-04-20 00:13:42', NULL),
(924, NULL, 'uploads/more/20250420061342_101580.png', 7, 133, 'png', 'image', NULL, '2025-04-20 00:13:42', '2025-04-20 00:13:42', NULL),
(925, NULL, 'uploads/20250420073537_825552.jpg', 7, 358, 'jpg', 'image', NULL, '2025-04-20 01:35:37', '2025-04-20 01:35:37', NULL),
(926, NULL, 'uploads/more/20250420073537_802197.jpg', 7, 358, 'jpg', 'image', NULL, '2025-04-20 01:35:37', '2025-04-20 01:35:37', NULL),
(927, NULL, 'uploads/20250420073921_867891.jpg', 7, 158, 'jpg', 'image', NULL, '2025-04-20 01:39:21', '2025-04-20 01:39:21', NULL),
(928, NULL, 'uploads/more/20250420073921_936130.jpg', 7, 158, 'jpg', 'image', NULL, '2025-04-20 01:39:21', '2025-04-20 01:39:21', NULL),
(929, NULL, 'uploads/20250420074043_243874.jpg', 7, 174, 'jpg', 'image', NULL, '2025-04-20 01:40:43', '2025-04-20 01:40:43', NULL),
(930, NULL, 'uploads/more/20250420074043_478834.jpg', 7, 174, 'jpg', 'image', NULL, '2025-04-20 01:40:43', '2025-04-20 01:40:43', NULL),
(931, NULL, 'uploads/20250420074156_500867.jpg', 7, 188, 'jpg', 'image', NULL, '2025-04-20 01:41:56', '2025-04-20 01:41:56', NULL),
(932, NULL, 'uploads/more/20250420074156_887987.jpg', 7, 188, 'jpg', 'image', NULL, '2025-04-20 01:41:56', '2025-04-20 01:41:56', NULL),
(933, NULL, 'uploads/20250420081547_162947.jpg', 7, 395, 'jpg', 'image', NULL, '2025-04-20 02:15:47', '2025-04-20 02:15:47', NULL),
(934, NULL, 'uploads/more/20250420081547_556355.jpg', 7, 395, 'jpg', 'image', NULL, '2025-04-20 02:15:47', '2025-04-20 02:15:47', NULL),
(935, NULL, 'uploads/20250421065552_664224.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 00:55:52', '2025-04-21 00:55:52', NULL),
(936, NULL, 'uploads/more/20250421065552_953082.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 00:55:52', '2025-04-21 00:55:52', NULL),
(937, NULL, 'uploads/20250421065931_204863.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 00:59:31', '2025-04-21 00:59:31', NULL),
(938, NULL, 'uploads/more/20250421065931_484237.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 00:59:31', '2025-04-21 00:59:31', NULL),
(939, NULL, 'uploads/20250421071427_563202.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 01:14:27', '2025-04-21 01:14:27', NULL),
(940, NULL, 'uploads/more/20250421071427_295225.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 01:14:27', '2025-04-21 01:14:27', NULL),
(941, NULL, 'uploads/20250421071807_444672.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 01:18:07', '2025-04-21 01:18:07', NULL),
(942, NULL, 'uploads/more/20250421071807_565443.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 01:18:07', '2025-04-21 01:18:07', NULL),
(943, NULL, 'uploads/20250421072009_189699.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 01:20:09', '2025-04-21 01:20:09', NULL),
(944, NULL, 'uploads/more/20250421072009_900471.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 01:20:09', '2025-04-21 01:20:09', NULL),
(947, NULL, 'uploads/20250421082030_980897.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 02:20:30', '2025-04-21 02:20:30', NULL),
(948, NULL, 'uploads/more/20250421082030_640570.PNG', 7, 6, 'PNG', 'image', NULL, '2025-04-21 02:20:30', '2025-04-21 02:20:30', NULL),
(953, NULL, 'uploads/20250505041429_310159.jpg', 7, 1140, 'jpg', 'image', NULL, '2025-05-04 22:14:29', '2025-05-04 22:14:29', NULL),
(954, NULL, 'uploads/more/20250505041429_778411.jpg', 7, 998, 'jpg', 'image', NULL, '2025-05-04 22:14:29', '2025-05-04 22:14:29', NULL),
(955, NULL, 'uploads/more/20250505041430_454600.jpg', 7, 1084, 'jpg', 'image', NULL, '2025-05-04 22:14:30', '2025-05-04 22:14:30', NULL),
(956, NULL, 'uploads/20250505041550_473200.jpg', 7, 1240, 'jpg', 'image', NULL, '2025-05-04 22:15:50', '2025-05-04 22:15:50', NULL),
(957, NULL, 'uploads/more/20250505041551_951825.jpg', 7, 1221, 'jpg', 'image', NULL, '2025-05-04 22:15:51', '2025-05-04 22:15:51', NULL),
(958, NULL, 'uploads/more/20250505041551_103392.jpg', 7, 1344, 'jpg', 'image', NULL, '2025-05-04 22:15:51', '2025-05-04 22:15:51', NULL),
(959, NULL, 'uploads/20250505041704_461935.jpg', 7, 1524, 'jpg', 'image', NULL, '2025-05-04 22:17:04', '2025-05-04 22:17:04', NULL),
(960, NULL, 'uploads/more/20250505041704_151659.jpg', 7, 1134, 'jpg', 'image', NULL, '2025-05-04 22:17:04', '2025-05-04 22:17:04', NULL),
(961, NULL, 'uploads/more/20250505041705_503705.jpg', 7, 1299, 'jpg', 'image', NULL, '2025-05-04 22:17:05', '2025-05-04 22:17:05', NULL),
(962, NULL, 'uploads/20250505041738_983723.jpg', 7, 1104, 'jpg', 'image', NULL, '2025-05-04 22:17:38', '2025-05-04 22:17:38', NULL),
(963, NULL, 'uploads/more/20250505041739_264588.jpg', 7, 1051, 'jpg', 'image', NULL, '2025-05-04 22:17:39', '2025-05-04 22:17:39', NULL),
(964, NULL, 'uploads/more/20250505041739_688046.jpg', 7, 1084, 'jpg', 'image', NULL, '2025-05-04 22:17:39', '2025-05-04 22:17:39', NULL),
(965, NULL, 'uploads/20250505041855_881378.jpg', 7, 1038, 'jpg', 'image', NULL, '2025-05-04 22:18:55', '2025-05-04 22:18:55', NULL),
(966, NULL, 'uploads/more/20250505041855_838757.jpg', 7, 1042, 'jpg', 'image', NULL, '2025-05-04 22:18:55', '2025-05-04 22:18:55', NULL),
(967, NULL, 'uploads/more/20250505041856_390725.jpg', 7, 935, 'jpg', 'image', NULL, '2025-05-04 22:18:56', '2025-05-04 22:18:56', NULL),
(968, NULL, 'uploads/20250505042406_779494.jpg', 7, 1257, 'jpg', 'image', NULL, '2025-05-04 22:24:06', '2025-05-04 22:24:06', NULL),
(969, NULL, 'uploads/more/20250505042406_621105.jpg', 7, 1143, 'jpg', 'image', NULL, '2025-05-04 22:24:06', '2025-05-04 22:24:06', NULL),
(970, NULL, 'uploads/more/20250505042407_285020.jpg', 7, 1122, 'jpg', 'image', NULL, '2025-05-04 22:24:07', '2025-05-04 22:24:07', NULL),
(971, NULL, 'uploads/20250505042614_498824.jpg', 7, 766, 'jpg', 'image', NULL, '2025-05-04 22:26:14', '2025-05-04 22:26:14', NULL),
(972, NULL, 'uploads/more/20250505042614_685752.jpg', 7, 904, 'jpg', 'image', NULL, '2025-05-04 22:26:14', '2025-05-04 22:26:14', NULL),
(973, NULL, 'uploads/more/20250505042614_773438.jpg', 7, 959, 'jpg', 'image', NULL, '2025-05-04 22:26:14', '2025-05-04 22:26:14', NULL),
(974, NULL, 'uploads/20250505044151_704639.jpg', 7, 1436, 'jpg', 'image', NULL, '2025-05-04 22:41:51', '2025-05-04 22:41:51', NULL),
(975, NULL, 'uploads/more/20250505044152_224954.jpg', 7, 1310, 'jpg', 'image', NULL, '2025-05-04 22:41:52', '2025-05-04 22:41:52', NULL),
(976, NULL, 'uploads/more/20250505044152_285953.jpg', 7, 1361, 'jpg', 'image', NULL, '2025-05-04 22:41:52', '2025-05-04 22:41:52', NULL),
(977, NULL, 'uploads/20250505044252_405648.jpg', 7, 1341, 'jpg', 'image', NULL, '2025-05-04 22:42:52', '2025-05-04 22:42:52', NULL),
(978, NULL, 'uploads/more/20250505044252_287053.jpg', 7, 1345, 'jpg', 'image', NULL, '2025-05-04 22:42:52', '2025-05-04 22:42:52', NULL),
(979, NULL, 'uploads/more/20250505044253_781218.jpg', 7, 1447, 'jpg', 'image', NULL, '2025-05-04 22:42:53', '2025-05-04 22:42:53', NULL),
(980, NULL, 'uploads/20250505044426_437777.jpg', 7, 734, 'jpg', 'image', NULL, '2025-05-04 22:44:26', '2025-05-04 22:44:26', NULL),
(981, NULL, 'uploads/more/20250505044427_383298.jpg', 7, 791, 'jpg', 'image', NULL, '2025-05-04 22:44:27', '2025-05-04 22:44:27', NULL),
(982, NULL, 'uploads/more/20250505044427_527821.jpg', 7, 703, 'jpg', 'image', NULL, '2025-05-04 22:44:27', '2025-05-04 22:44:27', NULL),
(983, NULL, 'uploads/20250505095914_617149.jpg', 7, 1257, 'jpg', 'image', NULL, '2025-05-05 03:59:15', '2025-05-05 03:59:15', NULL),
(984, NULL, 'uploads/more/20250505095915_721774.jpg', 7, 1060, 'jpg', 'image', NULL, '2025-05-05 03:59:15', '2025-05-05 03:59:15', NULL),
(985, NULL, 'uploads/more/20250505095915_677134.jpg', 7, 1120, 'jpg', 'image', NULL, '2025-05-05 03:59:15', '2025-05-05 03:59:15', NULL),
(986, NULL, 'uploads/more/20250506092853_521446.jpg', 7, 1569, 'jpg', 'image', NULL, '2025-05-06 03:28:53', '2025-05-06 03:28:53', NULL),
(987, NULL, 'uploads/20250507100215_520185.jpg', 7, 1500, 'jpg', 'image', NULL, '2025-05-07 04:02:16', '2025-05-07 04:02:16', NULL),
(988, NULL, 'uploads/more/20250507100216_914412.jpg', 7, 1569, 'jpg', 'image', NULL, '2025-05-07 04:02:16', '2025-05-07 04:02:16', NULL),
(989, NULL, 'uploads/more/20250507100216_948149.jpg', 7, 1532, 'jpg', 'image', NULL, '2025-05-07 04:02:16', '2025-05-07 04:02:16', NULL),
(990, NULL, 'uploads/20250507100715_636302.jpg', 7, 1569, 'jpg', 'image', NULL, '2025-05-07 04:07:15', '2025-05-07 04:07:15', NULL),
(991, NULL, 'uploads/more/20250507100716_678954.jpg', 7, 1569, 'jpg', 'image', NULL, '2025-05-07 04:07:16', '2025-05-07 04:07:16', NULL),
(992, NULL, 'uploads/more/20250507100716_900506.jpg', 7, 1532, 'jpg', 'image', NULL, '2025-05-07 04:07:16', '2025-05-07 04:07:16', NULL),
(993, NULL, 'uploads/more/20250507100717_445079.jpg', 7, 1500, 'jpg', 'image', NULL, '2025-05-07 04:07:17', '2025-05-07 04:07:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_type` enum('superadmin','admin','user','seller','retailer','staff') NOT NULL,
  `email` varchar(255) NOT NULL,
  `otpcode` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `status` enum('active','inactive','suspend') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL,
  `stuff_type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `email`, `otpcode`, `email_verified_at`, `password`, `provider`, `provider_id`, `remember_token`, `phone`, `avatar`, `status`, `created_at`, `updated_at`, `otp_expires_at`, `stuff_type`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', NULL, NULL, '$2y$12$ocQ41HfHpRKgV99nUZHXJO66MCteWCYZxiC7RyaXy2Pjkf3Jx6fU6', NULL, NULL, 'fy9AM40IDpjHiyYcMwsr41UzLGPgGBIuifolvRNNxGRxeD0pU6ztk95OKBZp', NULL, NULL, 'active', '2024-10-01 22:36:36', '2024-10-01 22:36:36', NULL, 1),
(2, 'Seller', 'seller', 'seller@gmail.com', NULL, NULL, '$2y$12$ocQ41HfHpRKgV99nUZHXJO66MCteWCYZxiC7RyaXy2Pjkf3Jx6fU6', NULL, NULL, NULL, NULL, NULL, 'inactive', '2024-10-01 22:36:36', '2024-10-01 22:36:36', NULL, 1),
(3, 'Masud', 'staff', 'ma@gmail.com', NULL, NULL, '$2y$12$Z17QCnbuVNFRsu39vcPHke235rlTe.mUjQHwGw3ieS949q490rT26', NULL, NULL, NULL, '01776543564', NULL, 'suspend', '2024-10-19 16:21:31', '2024-10-19 16:40:42', NULL, 1),
(4, 'demo', 'admin', 'demoadmin@gmail.com', '682628', NULL, '$2y$12$u3sQRtyDaVZYfdd6EmL1R.ig9kxUrI28i4IvtLoRd9uE.UB8VV9g.', NULL, NULL, NULL, NULL, NULL, 'suspend', '2024-10-01 22:36:36', '2025-05-04 02:44:54', '2025-05-04 02:54:54', 1),
(5, 'sabbir', 'staff', 'sabbirsuvro9@gmail.com', NULL, NULL, '$2y$12$PFpnarMNJokDjZ00HQ5X.OstwI0wa/x9s1Zaz15bbnlwZkbH3oKEC', NULL, NULL, NULL, '01751155302', NULL, 'active', '2025-01-19 22:34:27', '2025-01-19 22:34:27', NULL, 1),
(6, 'staff', 'admin', 'staff@gmail.com', NULL, NULL, '$2y$12$GHZ6MLSpoQP7Bcumu1X.Nuwl9jygJt/Rrj81neVvRr8GGrz5pOR5u', NULL, NULL, NULL, '01751155333', NULL, 'active', '2025-01-20 17:03:04', '2025-04-09 00:05:59', NULL, 1),
(7, 'main admin', 'admin', 'sabbir.startupmind@gmail.com', '619706', NULL, '$2y$12$u3sQRtyDaVZYfdd6EmL1R.ig9kxUrI28i4IvtLoRd9uE.UB8VV9g.', NULL, NULL, NULL, NULL, NULL, 'active', '2024-10-01 22:36:36', '2025-05-07 10:09:06', '2025-05-07 10:19:06', 1),
(8, 'stuff', 'staff', 'demostuff@gmail.com', '561775', NULL, '$2y$12$u3sQRtyDaVZYfdd6EmL1R.ig9kxUrI28i4IvtLoRd9uE.UB8VV9g.', NULL, NULL, NULL, NULL, NULL, 'inactive', '2024-10-01 22:36:36', '2025-04-08 05:49:42', '2025-04-08 05:59:42', 1),
(10, 'Sabbir Ahmed', 'admin', 'demo1@gmail.com', '680642', NULL, '$2y$12$WhgB/FHtN1r.jEGTpvfXDOKQ0JTqbRVtefePGeKlSHJCyWzsx8h.S', NULL, NULL, NULL, '01751155243', NULL, 'active', '2025-04-09 00:28:20', '2025-04-09 01:11:45', '2025-04-09 01:21:45', 2),
(11, 'Sayema Akter', 'admin', 'sayemaakter1980@gmail.com', '688474', NULL, '$2y$12$HPnBHwgN4JKBWkJJ.3Tq1eZWcOzpe6MTkb/eyigGgkmP.R8c64oCC', NULL, NULL, '88TmQkQVdYPIgdFH0JZfZVoamijmzcdiQDoqAeY5HUFTf5xKIxLeRZHo7aX5', NULL, NULL, 'active', '2025-05-07 10:06:38', '2025-05-07 12:28:15', '2025-05-07 12:38:15', 1),
(12, 'Jarif Khan', 'admin', 'jarifk004@gmail.com', '758972', NULL, '$2y$12$NhrTLiIeTLbyZ2PudgRloemnFK3hmwtBb4uyoB83U/f.CeNX0WVKm', NULL, NULL, 'XUdCZQOjQRhDwrAf7hH9EWceiwh4c9P8jlMwSUGk3CU2HCf6pwkizDMYKwHT', NULL, NULL, 'active', '2025-05-07 10:56:19', '2025-05-07 13:48:12', '2025-05-07 13:58:12', 1),
(13, 'imran ahmed', 'admin', 'imranahmedmosiho123@gmail.com', '241234', NULL, '$2y$12$Z74XhFHQFFa58xpoNhNQEOAlWglANObN0d4uCy..WxfIr8yjarsqO', NULL, NULL, NULL, NULL, NULL, 'active', '2025-05-07 12:26:12', '2025-05-07 12:30:06', '2025-05-07 12:40:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `webrands`
--

CREATE TABLE `webrands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rdetails` varchar(191) DEFAULT NULL,
  `img` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `webrands`
--

INSERT INTO `webrands` (`id`, `rdetails`, `img`, `created_at`, `updated_at`) VALUES
(1, NULL, '20250421090334.jpg', '2025-04-20 04:48:47', '2025-04-21 03:03:34'),
(2, NULL, '20250421090340.png', '2025-04-20 04:57:52', '2025-04-21 03:03:40'),
(4, NULL, '20250421090346.jpg', '2025-04-21 03:03:46', '2025-04-21 03:03:46'),
(5, NULL, '20250421090351.png', '2025-04-21 03:03:51', '2025-04-21 03:03:51'),
(6, NULL, '20250421090357.jpg', '2025-04-21 03:03:57', '2025-04-21 03:03:57'),
(7, NULL, '20250421090557.jpg', '2025-04-21 03:05:57', '2025-04-21 03:05:57');

-- --------------------------------------------------------

--
-- Table structure for table `website_infos`
--

CREATE TABLE `website_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_no` varchar(50) DEFAULT NULL,
  `working_hours` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `contact_info` text DEFAULT NULL,
  `our_history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `website_infos`
--

INSERT INTO `website_infos` (`id`, `company_name`, `address`, `website`, `email`, `contact_no`, `working_hours`, `facebook`, `twitter`, `youtube`, `linkedin`, `logo`, `updated_at`, `created_at`, `contact_info`, `our_history`) VALUES
(1, 'Dhara Online', 'Dhaka', 'https://www.dharaonline.com', 'info@dharaonline.com', '+8801700000000', 'Mon - Sun / 9:00AM - 9:00PM', 'https://facebook.com', 'https://facebook.com', 'https://facebook.com', 'https://facebook.com', 'uploads/20250506043814_376740.jpeg', '2025-05-05 22:38:15', NULL, '<p>Good descriptive writing creates an impression in the reader&#39;s mind of an event, a place, a person, or a thing. The writing will be such that it will set a mood or describe something in such detail that if the reader saw it, they would recognize it.</p>\r\n\r\n<p>To be good, descriptive writing has to be concrete, evocative and plausible.</p>\r\n\r\n<ul>\r\n	<li>To be&nbsp;<strong>concrete</strong>, descriptive writing has to offer specifics the reader can envision. Rather than &ldquo;Her eyes were the color of blue rocks&rdquo; (Light blue? Dark blue? Marble? Slate?), try instead, &ldquo;Her eyes sparkled like sapphires in the dark.&rdquo;</li>\r\n	<li>To be&nbsp;<strong>evocative</strong>, descriptive writing has to unite the concrete image with phrasing that evokes the impression the writer wants the reader to have. Consider &ldquo;her eyes shone like sapphires, warming my night&rdquo; versus &ldquo;the woman&rsquo;s eyes had a light like sapphires, bright and hard.&rdquo; Each phrase uses the same concrete image, then employs evocative language to create different impressions.</li>\r\n	<li>To be&nbsp;<strong>plausible</strong>, the descriptive writer has to constrain the concrete, evocative image to suit the reader&rsquo;s knowledge and attention span. &ldquo;Her eyes were brighter than the sapphires in the armrests of the Tipu Sultan&rsquo;s golden throne, yet sharper than the tulwars of his cruelest executioners&rdquo; will have the reader checking their phone halfway through. &ldquo;Her eyes were sapphires, bright and hard&rdquo; creates the same effect in a fraction of the reading time. As always in the craft of writing: when in doubt, write less.</li>\r\n</ul>', '<p>Good descriptive writing creates an impression in the reader&#39;s mind of an event, a place, a person, or a thing. The writing will be such that it will set a mood or describe something in such detail that if the reader saw it, they would recognize it.</p>\r\n\r\n<p>To be good, descriptive writing has to be concrete, evocative and plausible.</p>\r\n\r\n<ul>\r\n	<li>To be&nbsp;<strong>concrete</strong>, descriptive writing has to offer specifics the reader can envision. Rather than &ldquo;Her eyes were the color of blue rocks&rdquo; (Light blue? Dark blue? Marble? Slate?), try instead, &ldquo;Her eyes sparkled like sapphires in the dark.&rdquo;</li>\r\n	<li>To be&nbsp;<strong>evocative</strong>, descriptive writing has to unite the concrete image with phrasing that evokes the impression the writer wants the reader to have. Consider &ldquo;her eyes shone like sapphires, warming my night&rdquo; versus &ldquo;the woman&rsquo;s eyes had a light like sapphires, bright and hard.&rdquo; Each phrase uses the same concrete image, then employs evocative language to create different impressions.</li>\r\n	<li>To be&nbsp;<strong>plausible</strong>, the descriptive writer has to constrain the concrete, evocative image to suit the reader&rsquo;s knowledge and attention span. &ldquo;Her eyes were brighter than the sapphires in the armrests of the Tipu Sultan&rsquo;s golden throne, yet sharper than the tulwars of his cruelest executioners&rdquo; will have the reader checking their phone halfway through. &ldquo;Her eyes were sapphires, bright and hard&rdquo; creates the same effect in a fraction of the reading time. As always in the craft of writing: when in doubt, write less.</li>\r\n</ul>');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 57, 42, '2025-01-08 22:51:51', '2025-01-08 22:51:51'),
(23, 27, 32, '2025-02-18 00:36:41', '2025-02-18 00:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `payment_method` varchar(191) NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `customer_id`, `amount`, `status`, `payment_method`, `transaction_id`, `created_at`, `updated_at`) VALUES
(15, 54, 900.00, 'pending', 'mobile', NULL, '2025-02-23 17:27:32', '2025-02-23 17:27:32'),
(16, 54, 1000.00, 'approved', 'mobile', 'ddr4rgfg5', '2025-02-23 17:29:42', '2025-02-23 17:29:58'),
(17, 54, 1400.00, 'approved', 'mobile', '23j434df4e', '2025-02-23 17:40:05', '2025-02-23 17:40:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_settings`
--
ALTER TABLE `all_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`) USING BTREE;

--
-- Indexes for table `blog_contents`
--
ALTER TABLE `blog_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`),
  ADD KEY `brands_create_by_foreign` (`create_by`);

--
-- Indexes for table `btobs`
--
ALTER TABLE `btobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_create_by_foreign` (`create_by`);

--
-- Indexes for table `client_reviews`
--
ALTER TABLE `client_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD KEY `customers_referral_by_foreign` (`referral_by`);

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_details_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maplis`
--
ALTER TABLE `maplis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pending_orders_order_no_unique` (`order_no`),
  ADD UNIQUE KEY `pending_orders_tracking_code_unique` (`tracking_code`),
  ADD UNIQUE KEY `pending_orders_transaction_id_unique` (`transaction_id`),
  ADD KEY `pending_orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `pixel_gtms`
--
ALTER TABLE `pixel_gtms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section_products`
--
ALTER TABLE `section_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `single_banners`
--
ALTER TABLE `single_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tandcs`
--
ALTER TABLE `tandcs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topmars`
--
ALTER TABLE `topmars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `webrands`
--
ALTER TABLE `webrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website_infos`
--
ALTER TABLE `website_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_customer_id_foreign` (`customer_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_customer_id_foreign` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_settings`
--
ALTER TABLE `all_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blog_contents`
--
ALTER TABLE `blog_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `btobs`
--
ALTER TABLE `btobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;

--
-- AUTO_INCREMENT for table `client_reviews`
--
ALTER TABLE `client_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maplis`
--
ALTER TABLE `maplis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pixel_gtms`
--
ALTER TABLE `pixel_gtms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1302;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `section_products`
--
ALTER TABLE `section_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `single_banners`
--
ALTER TABLE `single_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tandcs`
--
ALTER TABLE `tandcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `topmars`
--
ALTER TABLE `topmars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=994;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `webrands`
--
ALTER TABLE `webrands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `website_infos`
--
ALTER TABLE `website_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_referral_by_foreign` FOREIGN KEY (`referral_by`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD CONSTRAINT `pending_orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
