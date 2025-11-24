-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2025 at 12:57 PM
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
-- Database: `smellbucket`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_settings`
--

CREATE TABLE `all_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `d_charge_inside_dhaka` decimal(8,2) NOT NULL DEFAULT 0.00,
  `d_charge_outside_dhaka` decimal(8,2) NOT NULL DEFAULT 0.00,
  `urban` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `all_settings`
--

INSERT INTO `all_settings` (`id`, `d_charge_inside_dhaka`, `d_charge_outside_dhaka`, `urban`, `created_at`, `updated_at`) VALUES
(1, 70.00, 120.00, 100, '2024-10-19 04:15:00', '2025-06-21 02:47:55');

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
(1, 'Home Banner 01', 1, '/product-category/3', 'uploads/20250622090144_537015.jpg', 'active', '2024-10-13 18:11:20', '2025-06-22 03:01:44', NULL),
(11, 'Three Pice', 2, '/product-category/2', 'uploads/20250622090203_562186.jpg', 'active', '2025-04-20 00:49:22', '2025-06-22 03:02:03', NULL),
(12, 'Family Combo', 3, '/product-category/1', 'uploads/20250622090213_883257.jpg', 'active', '2025-04-20 00:49:36', '2025-06-22 03:02:13', NULL),
(14, 'test', 4, '/product-category/4', 'uploads/20251124092151_775023.jpg', 'active', '2025-11-24 03:21:51', '2025-11-24 05:20:09', NULL);

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
(1, 0, NULL, 'Cosmetics', 'cosmetics', 'uploads/1763532276_69368.png', 'inactive', 'active', 15, '2024-01-16 22:51:57', '2025-11-19 00:04:37'),
(2, 0, NULL, 'Wellness', 'wellness', 'uploads/20250622085551_762352.jpg', 'inactive', 'active', 4, '2024-01-16 22:51:57', '2025-11-18 05:10:32'),
(3, 0, NULL, 'Lifestyle', 'lifestyle', 'uploads/20250622085627_138631.jpg', 'inactive', 'active', 4, '2024-01-16 22:51:57', '2025-11-18 05:10:33'),
(4, 0, NULL, 'Gadget', 'gadget', 'uploads/1763974147_23077.jpg', 'inactive', 'active', 15, '2025-11-22 04:20:58', '2025-11-24 02:49:07');

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
(146, 'merun', '#6c1313', 'active', '2025-01-08 23:31:04', '2025-01-08 23:31:04'),
(147, 'AQUA', '#0fccbf', 'active', '2025-06-21 04:03:48', '2025-06-21 04:03:48');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Ashrafur', 'ashrafur@gmail.com', 'hi', '2025-11-18 04:42:01', '2025-11-18 04:42:01'),
(2, 'Sabbir Ahmed', 'demoadmin@gmail.com', 'ok', '2025-11-18 04:46:27', '2025-11-18 04:46:27'),
(3, 'Sabbir Ahmed', 'demoadmin@gmail.com', 'kjb', '2025-11-18 04:54:18', '2025-11-18 04:54:18');

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
(55, 'guest customer', 'ok@gmail.com', '$2y$12$erNb3YxffqJVu8qdn4VBTuKYQSxyN0R0IHfIzrjaNNji/xjQBNxeq', '01926189960', NULL, 1, 'guestkhanxuxmr', 0.00, NULL, '2025-03-11 08:46:04', '2025-03-11 08:46:04', NULL, NULL, NULL),
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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `short_des` longtext DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `name`, `serial`, `link`, `image`, `status`, `created_at`, `updated_at`, `deleted_at`, `short_des`, `color`) VALUES
(1, 'smellbucket', 3, 'ok', 'uploads/20250622085148_144626.jpg', 'active', '2024-10-13 19:02:32', '2025-06-22 02:51:48', NULL, 'this is our best collection', '#358ca7'),
(2, 'smellbucket', 2, '/product-category/2', 'uploads/20250622085200_539038.jpg', 'active', '2024-10-13 19:02:47', '2025-06-22 02:52:00', NULL, NULL, '#d8f6ff'),
(3, 'Best Option', 1, '/product-category/3', 'uploads/20250622085210_443617.jpg', 'active', '2024-10-13 19:02:57', '2025-06-22 02:52:10', NULL, NULL, '#d8f6ff'),
(9, 'best', 4, '/product-category/4', 'uploads/20250512063609_554306.jpg', 'active', '2025-05-11 22:35:36', '2025-06-22 02:52:11', '2025-06-22 02:52:11', NULL, '#000000');

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
(29, '2025_05_07_091748_add_videoid_to_products_table', 23),
(30, '2025_05_10_045005_add_short_des_and_color_to_home_sliders_table', 24),
(31, '2025_06_21_083714_add_urban_to_all_settings_table', 25),
(32, '2025_02_11_083322_create_orders_table_2', 26),
(33, '2025_02_24_111154_create_pending_orders_table', 27),
(34, '2025_11_17_041948_create_privacy_policies_table', 27),
(35, '2025_02_11_083322_create_orders_table', 28),
(36, '2025_11_17_061127_create_privacy_policies_table', 29),
(37, '2025_11_17_071230_create_privacy_policies_table', 30),
(38, '2025_11_17_115232_create_privacy_policies_table', 31),
(39, '2025_11_18_090557_create_contact_messages_table', 32);

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
(294, '2025-06-22', 250622050148628, '25062229050148', '68578e3c90fbc', 4, NULL, 'sabbir ahmed', '01751166302', '123 Office Street, Business City', 'Approved', 'cash', 'Cash On Delivery', NULL, 1200.00, 0.00, NULL, 120.00, 1320.00, 0.00, 'pending', NULL, NULL, '2025-06-21 23:01:48', '2025-06-22 00:19:31', 'lal da');

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
(240, 294, 1409, 'Satin Fabric Bedsheet 06 (VRS)', 600.00, 600.00, 0.00, 1, '75ml', '1', 600.00, 'unpaid', 'Pending', NULL, NULL, 0, '2025-06-21 23:01:48', '2025-06-21 23:01:48'),
(241, 294, 1408, 'Jarif Khan', 600.00, 600.00, 0.00, 1, '75ml', '2', 600.00, 'unpaid', 'Pending', NULL, NULL, 0, '2025-06-21 23:01:48', '2025-06-21 23:01:48');

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
(7, '250505101955449', 'sabbir', '01751166302', 570.00, 500.00, '123 Office Street, Business City', 'online', 'Pay Online', 70.00, '2505053101955', '2025-05-05', NULL, 'BDT', '{\"91c381bc1e976d7d21205df003bf3e6a\":{\"rowId\":\"91c381bc1e976d7d21205df003bf3e6a\",\"id\":1287,\"name\":\"Three Pice 1\",\"qty\":\"1\",\"price\":500,\"weight\":1,\"options\":{\"thumbnail\":\"[956]\",\"slug\":\"three-pice-1\",\"size\":null,\"color\":null},\"discount\":0,\"tax\":105,\"subtotal\":500}}', '681890cb29a8c', '2025-05-05 04:19:55', '2025-05-05 04:19:55'),
(8, '250513070541890', 'sabbir ahmed', '01751166302', 570.00, 500.00, '123 Office Street, Business City', 'online', 'Pay Online', 70.00, '25051318070541', '2025-05-13', 55, 'BDT', '{\"91c381bc1e976d7d21205df003bf3e6a\":{\"rowId\":\"91c381bc1e976d7d21205df003bf3e6a\",\"id\":1287,\"name\":\"Three Pice 1\",\"qty\":\"1\",\"price\":500,\"weight\":1,\"options\":{\"thumbnail\":\"[956]\",\"slug\":\"three-pice-1\",\"size\":null,\"color\":null},\"discount\":0,\"tax\":105,\"subtotal\":500}}', '6822ef457becd', '2025-05-13 01:05:41', '2025-05-13 01:05:41'),
(9, '250513071034846', 'sabbir ahmed', '01751166302', 570.00, 500.00, '123 Office Street, Business City', 'online', 'Pay Online', 70.00, '25051318071034', '2025-05-13', NULL, 'BDT', '{\"91c381bc1e976d7d21205df003bf3e6a\":{\"rowId\":\"91c381bc1e976d7d21205df003bf3e6a\",\"id\":1287,\"name\":\"Three Pice 1\",\"qty\":\"1\",\"price\":500,\"weight\":1,\"options\":{\"thumbnail\":\"[956]\",\"slug\":\"three-pice-1\",\"size\":null,\"color\":null},\"discount\":0,\"tax\":105,\"subtotal\":500}}', '6822f06af0f55', '2025-05-13 01:10:34', '2025-05-13 01:10:34'),
(10, '250513071107386', 'sabbir ahmed', '01751166302', 570.00, 500.00, '123 Office Street, Business City', 'online', 'Pay Online', 70.00, '25051318071107', '2025-05-13', NULL, 'BDT', '{\"91c381bc1e976d7d21205df003bf3e6a\":{\"rowId\":\"91c381bc1e976d7d21205df003bf3e6a\",\"id\":1287,\"name\":\"Three Pice 1\",\"qty\":\"1\",\"price\":500,\"weight\":1,\"options\":{\"thumbnail\":\"[956]\",\"slug\":\"three-pice-1\",\"size\":null,\"color\":null},\"discount\":0,\"tax\":105,\"subtotal\":500}}', '6822f08b9b6a5', '2025-05-13 01:11:07', '2025-05-13 01:11:07'),
(11, '250513103251242', 'Sabbir Ahmed', '01751155245', 570.00, 500.00, 'road#35 sector-7', 'online', 'Pay Online', 70.00, '25051318103251', '2025-05-13', NULL, 'BDT', '{\"6fafe879f667de3447578f449f7eb019\":{\"rowId\":\"6fafe879f667de3447578f449f7eb019\",\"id\":1296,\"name\":\"Three Pice 3\",\"qty\":\"1\",\"price\":500,\"weight\":1,\"options\":{\"thumbnail\":\"[974]\",\"slug\":\"three-pice-3\",\"size\":null,\"color\":null},\"discount\":0,\"tax\":105,\"subtotal\":500}}', '68231fd39700b', '2025-05-13 15:32:51', '2025-05-13 15:32:51'),
(12, '250513105420530', 'H2222', '01926189960', 650.00, 500.00, 'Dhaka', 'online', 'Pay Online', 150.00, '25051319105420', '2025-05-13', NULL, 'BDT', '{\"0d592fd1ec60fb0d0e622ef7081c0926\":{\"rowId\":\"0d592fd1ec60fb0d0e622ef7081c0926\",\"id\":1313,\"name\":\"test\",\"qty\":\"1\",\"price\":500,\"weight\":1,\"options\":{\"thumbnail\":\"[1026]\",\"slug\":\"test\",\"size\":null,\"color\":null},\"discount\":0,\"tax\":105,\"subtotal\":500}}', '682324dc3e06a', '2025-05-13 15:54:20', '2025-05-13 15:54:20'),
(14, '250513105451684', 'Jarif', '01926189960', 650.00, 500.00, 'Dhaka', 'online', 'Pay Online', 150.00, '25051319105451', '2025-05-13', NULL, 'BDT', '{\"0d592fd1ec60fb0d0e622ef7081c0926\":{\"rowId\":\"0d592fd1ec60fb0d0e622ef7081c0926\",\"id\":1313,\"name\":\"test\",\"qty\":\"1\",\"price\":500,\"weight\":1,\"options\":{\"thumbnail\":\"[1026]\",\"slug\":\"test\",\"size\":null,\"color\":null},\"discount\":0,\"tax\":105,\"subtotal\":500}}', '682324fbf403d', '2025-05-13 15:54:52', '2025-05-13 15:54:52'),
(15, '250513105513525', 'Jarif', '01926189960', 650.00, 500.00, 'Dhaka', 'online', 'Pay Online', 150.00, '25051319105513', '2025-05-13', NULL, 'BDT', '{\"0d592fd1ec60fb0d0e622ef7081c0926\":{\"rowId\":\"0d592fd1ec60fb0d0e622ef7081c0926\",\"id\":1313,\"name\":\"test\",\"qty\":\"1\",\"price\":500,\"weight\":1,\"options\":{\"thumbnail\":\"[1026]\",\"slug\":\"test\",\"size\":null,\"color\":null},\"discount\":0,\"tax\":105,\"subtotal\":500}}', '682325117f64d', '2025-05-13 15:55:13', '2025-05-13 15:55:13');

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
(1, '<!-- Meta Pixel Code --> <script> !function(f,b,e,v,n,t,s) {if(f.fbq)return;n=f.fbq=function(){n.callMethod? n.callMethod.apply(n,arguments):n.queue.push(arguments)}; if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version=\'2.0\'; n.queue=[];t=b.createElement(e);t.async=!0; t.src=v;s=b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t,s)}(window, document,\'script\', \'https://connect.facebook.net/en_US/fbevents.js\'); fbq(\'init\', \'691112623419300\'); fbq(\'track\', \'PageView\'); </script> <noscript><img height=\"1\" width=\"1\" style=\"display:none\" src=\"https://www.facebook.com/tr?id=691112623419300&ev=PageView&noscript=1\" /></noscript> <!-- End Meta Pixel Code -->', NULL, '2025-05-07 00:09:48', '2025-05-08 11:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policies`
--

CREATE TABLE `privacy_policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_policies`
--

INSERT INTO `privacy_policies` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(6, 'Interpretation and Definitions', '<h3 style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-size: 24px; line-height: 36px; font-weight: 700; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: normal; background-color: rgb(255, 255, 255);\">Interpretation</h3><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">The words whose initial letters are capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p><h3 style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-size: 24px; line-height: 36px; font-weight: 700; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: normal; background-color: rgb(255, 255, 255);\">Definitions</h3><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">For the purposes of this Privacy Policy:</p><ul style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\"><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Account</strong>&nbsp;means a unique account created for You to access our Service or parts of our Service.</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Affiliate</strong>&nbsp;means an entity that controls, is controlled by, or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Company</strong>&nbsp;(referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Smellbucket.</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Cookies</strong>&nbsp;are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Country</strong>&nbsp;refers to: Bangladesh</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Device</strong>&nbsp;means any device that can access the Service such as a computer, a cell phone or a digital tablet.</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Personal Data</strong>&nbsp;is any information that relates to an identified or identifiable individual.</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Service</strong>&nbsp;refers to the Website.</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Service Provider</strong>&nbsp;means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Usage Data</strong>&nbsp;refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Website</strong>&nbsp;refers to Smellbucket, accessible from&nbsp;<a href=\"https://smellbucket.com/\" rel=\"external nofollow noopener\" target=\"_blank\" style=\"text-decoration: underline; cursor: pointer; color: rgb(85, 61, 244);\">https://smellbucket.com/</a></p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>You</strong>&nbsp;means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p></li></ul>', '2025-11-18 00:54:20', '2025-11-18 00:54:20'),
(7, 'Collecting and Using Your Personal Data', '<h3 style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-size: 24px; line-height: 36px; font-weight: 700; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: normal; background-color: rgb(255, 255, 255);\">Types of Data Collected</h3><h4 style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-weight: 700; font-size: 20px; line-height: 30px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: normal; background-color: rgb(255, 255, 255);\">Personal Data</h4><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:</p><ul style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\"><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">First name and last name</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Phone number</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Address, State, Province, ZIP/Postal code, City</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Usage Data</p></li></ul><h4 style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-weight: 700; font-size: 20px; line-height: 30px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: normal; background-color: rgb(255, 255, 255);\">Usage Data</h4><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">Usage Data is collected automatically when using the Service.</p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">Usage Data may include information such as Your Device\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device\'s unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.</p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">We may also collect information that Your browser sends whenever You visit Our Service or when You access the Service by or through a mobile device.</p><h4 style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-weight: 700; font-size: 20px; line-height: 30px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: normal; background-color: rgb(255, 255, 255);\">Tracking Technologies and Cookies</h4><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies We use include beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:</p><ul style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\"><li style=\"margin: 0px 0px 16px;\"><strong>Cookies or Browser Cookies.</strong>&nbsp;A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.</li><li style=\"margin: 0px 0px 16px;\"><strong>Web Beacons.</strong>&nbsp;Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).</li></ul><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">Cookies can be \"Persistent\" or \"Session\" Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies on the&nbsp;<a href=\"https://www.freeprivacypolicy.com/blog/sample-privacy-policy-template/#Use_Of_Cookies_And_Tracking\" target=\"_blank\" style=\"text-decoration: none; cursor: pointer; color: rgb(0, 0, 0);\">Free Privacy Policy website</a>&nbsp;article.</p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">We use both Session and Persistent Cookies for the purposes set out below:</p><ul style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\"><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Necessary / Essential Cookies</strong></p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Type: Session Cookies</p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Administered by: Us</p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Cookies Policy / Notice Acceptance Cookies</strong></p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Type: Persistent Cookies</p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Administered by: Us</p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Purpose: These Cookies identify if users have accepted the use of cookies on the Website.</p></li><li style=\"margin: 0px 0px 16px;\"><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\"><strong>Functionality Cookies</strong></p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Type: Persistent Cookies</p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Administered by: Us</p><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px;\">Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.</p></li></ul><p style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px; letter-spacing: normal; background-color: rgb(255, 255, 255);\">For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.</p>', '2025-11-18 00:56:36', '2025-11-18 00:56:36');

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
(1408, 4, 'Wild Stone Edge Perfume- 50ml', 'wild-stone-edge-perfume-50ml', 1, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 750.00, NULL, NULL, 100.00, 'flat', 50, 0, NULL, '[\"147\"]', '[\"50ml\"]', '[1420]', '[1411,1412,1421,1422,1423]', 0, NULL, '<p><br></p>', '<p><span style=\"color: rgb(126, 126, 126);\">Fragrance Family: Woody Marine. Post bath freshness fragrance. Perfect casual wear perfume. Apply on pulse points, such as your inner wrists and neck. Re-spray if required.</span></p><p><span style=\"color: rgb(33, 37, 41);\">Wild Stone Edge Perfume is an edgy, contemporary, and magnetic fragrance featuring notes of Lemon, Green, Artemisia, Cedar wood, Amber, and Tonka Bean, enhancing mood and confidence.</span></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-06-21 05:06:11', '2025-06-22 03:54:34', '2025-06-22 03:54:34', NULL),
(1409, 4, 'Denver Perfume Pride- 100ml', 'denver-perfume-pride-100ml', 1, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 1450.00, NULL, NULL, 200.00, 'flat', 50, 0, NULL, '[\"2\"]', '[\"100ml\"]', '[1416]', '[1414,1415,1417,1418,1419]', 0, NULL, '<p><br></p>', '<p><span style=\"color: rgb(126, 126, 126);\">Signature Luxurious Imported Fragrance Blend Extremely Long-Lasting Versatile Use: Indoor or Outdoor, Night or Day, Party or Office</span></p><p><span style=\"color: rgb(33, 37, 41);\">This fragrance is crafted for self-confident, passionate men, featuring fresh bergamot, lavender, verbena, oakmoss, geranium, apple, sandalwood, and tonka in a rich base.</span></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-06-21 05:46:02', '2025-06-22 03:54:14', '2025-06-22 03:54:14', NULL),
(1410, 4, 'Wild Stone Edge Perfume- 50ml', 'wild-stone-edge-perfume-50ml', 1, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 750.00, NULL, NULL, 100.00, 'flat', 50, 0, NULL, '[\"147\"]', '[\"50ml\"]', '[1424]', '[1425,1426,1427]', 0, NULL, '<p><br></p>', '<p><strong style=\"color: rgb(126, 126, 126);\">Fragrance Family: Woody Marine. Post bath freshness fragrance. Perfect casual wear perfume. Apply on pulse points, such as your inner wrists and neck. Re-spray if required.</strong></p><p><strong style=\"color: rgb(33, 37, 41);\">Wild Stone Edge Perfume is an edgy, contemporary, and magnetic fragrance featuring notes of Lemon, Green, Artemisia, Cedar wood, Amber, and Tonka Bean, enhancing mood and confidence.</strong></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-06-22 03:52:13', '2025-06-22 03:52:35', '2025-06-22 03:52:35', NULL),
(1411, 4, 'Denver Perfume Pride- 100ml', 'denver-perfume-pride-100ml', 1, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 1450.00, NULL, NULL, 200.00, 'flat', 50, 0, NULL, '[\"2\"]', '[\"100ml\"]', '[1428]', '[1429,1430,1431]', 0, NULL, '<p><br></p>', '<p><span style=\"color: rgb(126, 126, 126);\">Signature Luxurious Imported Fragrance Blend Extremely Long-Lasting Versatile Use: Indoor or Outdoor, Night or Day, Party or Office</span></p><p><span style=\"color: rgb(126, 126, 126);\"><span class=\"ql-cursor\">﻿</span></span></p><p><span style=\"color: rgb(33, 37, 41);\">This fragrance is crafted for self-confident, passionate men, featuring fresh bergamot, lavender, verbena, oakmoss, geranium, apple, sandalwood, and tonka in a rich base.</span></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-06-22 03:53:56', '2025-06-22 03:53:56', NULL, NULL),
(1412, 4, 'Wild Stone Edge Perfume- 50ml', 'wild-stone-edge-perfume-50ml', 1, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 750.00, NULL, NULL, 100.00, 'flat', 50, 0, NULL, '[\"147\"]', '[\"50ml\"]', '[1432]', '[1433,1434,1435]', 0, NULL, '<p><br></p>', '<p><span style=\"color: rgb(126, 126, 126);\">Fragrance Family: Woody Marine. Post bath freshness fragrance. Perfect casual wear perfume. Apply on pulse points, such as your inner wrists and neck. Re-spray if required.</span></p><p><span style=\"color: rgb(126, 126, 126);\"><span class=\"ql-cursor\">﻿</span></span></p><p><span style=\"color: rgb(33, 37, 41);\">Wild Stone Edge Perfume is an edgy, contemporary, and magnetic fragrance featuring notes of Lemon, Green, Artemisia, Cedar wood, Amber, and Tonka Bean, enhancing mood and confidenc</span></p><p><br></p><p>No returns after opening the box.</p><p>Call Us: +8801303352256</p><p>Email:&nbsp;smellbucket@gmail.com</p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-06-22 03:56:54', '2025-06-22 03:56:54', NULL, NULL),
(1413, 15, 'Phone', 'phone', 4, 1, 'Desi Model', 'Box', '1', 1, 0.00, 10000.00, NULL, NULL, 99999.00, 'flat', 10, 0, NULL, '[]', '[]', '[1436]', '[1437]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-11-22 04:24:12', '2025-11-24 02:47:56', '2025-11-24 02:47:56', NULL),
(1414, 15, 'Phone', 'phone', 4, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 15000.00, NULL, NULL, 500.00, 'flat', 50, 0, NULL, '[\"3\"]', '[]', '[1438]', '{\"2\":1452,\"3\":1453,\"4\":1454}', 0, NULL, '<p><br></p>', '<p><span style=\"color: rgb(33, 37, 41);\">Wild Stone Edge Perfume is an edgy, contemporary, and magnetic fragrance featuring notes of Lemon, Green, Artemisia, Cedar wood, Amber, and Tonka Bean, enhancing mood and confidenc</span></p><p><br></p><p>No returns after opening the box.</p><p>Call Us: +8801303352256</p><p>Email:&nbsp;smellbucket@gmail.com</p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-11-24 02:47:48', '2025-11-24 05:23:34', '2025-11-24 05:23:34', NULL),
(1415, 15, 'Smart Phone', 'smart-phone', 4, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 20000.00, NULL, NULL, 1500.00, 'flat', 50, 0, NULL, '[\"2\"]', '[]', '[1440]', '{\"0\":1441,\"2\":1456,\"3\":1457}', 0, NULL, '<p><br></p>', '<p><span style=\"color: rgb(33, 37, 41);\">Wild Stone Edge Perfume is an edgy, contemporary, and magnetic fragrance featuring notes of Lemon, Green, Artemisia, Cedar wood, Amber, and Tonka Bean, enhancing mood and confidenc</span></p><p><br></p><p>No returns after opening the box.</p><p>Call Us: +8801303352256</p><p>Email:&nbsp;smellbucket@gmail.com</p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-11-24 02:50:28', '2025-11-24 05:23:32', '2025-11-24 05:23:32', NULL),
(1416, 15, 'well-1', 'well-1', 2, 1, 'Desi Model', 'Kg', '1', 1, 0.00, 500.00, NULL, NULL, 20.00, 'flat', 50, 0, NULL, '[\"1\"]', '[]', '[1442]', '[1443]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-11-24 02:54:08', '2025-11-24 02:55:39', NULL, NULL),
(1417, 15, 'well-2', 'well-2', 2, 1, 'Desi Model', 'Kg', '1', 1, 0.00, 600.00, NULL, NULL, 0.00, 'flat', 60, 0, NULL, '[\"4\"]', '[]', '[1444]', '[1445]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-11-24 02:54:45', '2025-11-24 02:55:56', NULL, NULL),
(1418, 15, 'life-1', 'life-1', 3, 1, 'Desi Model', 'Packet', '1', 1, 0.00, 800.00, NULL, NULL, 0.00, 'flat', 60, 0, NULL, '[\"5\"]', '[]', '[1446]', '[1447]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-11-24 02:56:33', '2025-11-24 02:56:33', NULL, NULL),
(1419, 15, 'life-2', 'life-2', 3, 1, 'Desi Model', 'Packet', '1', 1, 0.00, 900.00, NULL, NULL, 0.00, 'flat', 40, 0, NULL, '[\"1\"]', '[]', '[1448]', '[1449]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-11-24 02:57:10', '2025-11-24 02:57:10', NULL, NULL),
(1420, 15, 'Phone', 'phone', 4, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 5000.00, NULL, NULL, 0.00, 'flat', 50, 0, NULL, '[\"2\"]', '[]', '[1458]', '[1459]', 0, NULL, '<p><br></p>', '<p>fdgbdkfjgbvdsfngbv</p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-11-24 05:24:48', '2025-11-24 05:24:48', NULL, NULL),
(1421, 15, 'Cool Projector', 'cool-projector', 4, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 30000.00, NULL, NULL, 0.00, 'flat', 15, 0, NULL, '[]', '[]', '[1460]', '[1461]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-11-24 05:28:37', '2025-11-24 05:28:37', NULL, NULL),
(1422, 15, 'Wireless Charger', 'wireless-charger', 4, 1, 'Desi Model', 'Pcs', '1', 1, 0.00, 8000.00, NULL, NULL, 0.00, 'flat', 30, 0, NULL, '[\"3\"]', '[]', '[1462]', '[1463]', 0, NULL, '<p><br></p>', '<p><br></p>', 'yes', 'yes', 'yes', 0, '5', 0, 'inactive', '2025-11-24 05:30:54', '2025-11-24 05:30:54', NULL, NULL);

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
(1, 'Scroll', 'Cosmetics', 1, 'active', '2024-10-12 17:08:59', '2024-10-12 17:32:41', NULL),
(2, 'Scroll', 'Wellness', 2, 'active', '2024-10-12 17:10:59', '2024-10-12 17:32:43', NULL),
(3, 'Scroll', 'Lifestyle', 3, 'active', '2024-10-12 17:11:10', '2024-10-12 17:11:10', NULL),
(4, 'new_arrival', 'New Arrival', NULL, 'active', '2024-10-12 17:11:22', '2024-10-12 20:52:17', NULL),
(7, 'single_banner', 'Single Banner', NULL, 'active', '2024-10-12 17:11:22', '2024-10-13 21:26:56', '2024-10-13 21:26:56'),
(8, 'single_card', 'Sincle Card', NULL, 'active', '2024-10-14 05:13:57', '2024-10-14 05:13:57', NULL),
(9, 'Scroll', 'Gadget', 4, 'active', '2024-10-12 17:11:10', '2024-10-12 17:11:10', NULL);

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
(37, 2, 1284, 'inactive', '2025-04-20 02:11:53', '2025-05-11 11:38:08'),
(38, 3, 1285, 'inactive', '2025-04-20 02:11:54', '2025-05-11 11:38:09'),
(39, 2, 1286, 'active', '2025-04-20 02:11:56', '2025-04-20 02:11:56'),
(40, 3, 1287, 'inactive', '2025-04-20 02:11:57', '2025-05-11 11:38:13'),
(41, 4, 1284, 'active', '2025-04-20 02:12:04', '2025-04-20 02:12:04'),
(42, 1, 1285, 'active', '2025-04-20 02:12:04', '2025-04-20 02:12:04'),
(43, 4, 1286, 'active', '2025-04-20 02:12:05', '2025-04-20 02:12:05'),
(44, 1, 1287, 'active', '2025-04-20 02:12:06', '2025-04-20 02:12:06'),
(45, 2, 1288, 'active', '2025-04-20 02:16:25', '2025-04-20 02:16:25'),
(46, 4, 1288, 'active', '2025-04-20 02:16:27', '2025-04-20 02:16:27'),
(47, 3, 1284, 'inactive', '2025-04-20 02:20:45', '2025-05-11 11:38:08'),
(48, 3, 1286, 'inactive', '2025-04-20 02:20:46', '2025-05-11 11:38:12'),
(49, 3, 1288, 'inactive', '2025-04-20 02:20:47', '2025-05-11 11:38:16'),
(50, 2, 1285, 'inactive', '2025-04-20 02:20:49', '2025-05-11 11:38:10'),
(51, 2, 1287, 'active', '2025-04-20 02:20:50', '2025-04-20 02:20:50'),
(52, 1, 1284, 'active', '2025-04-20 02:20:51', '2025-04-20 02:20:51'),
(53, 1, 1286, 'active', '2025-04-20 02:20:52', '2025-04-20 02:20:52'),
(54, 1, 1288, 'active', '2025-04-20 02:20:53', '2025-04-20 02:20:53'),
(55, 4, 1285, 'active', '2025-04-20 02:20:55', '2025-04-20 02:20:55'),
(56, 4, 1287, 'active', '2025-04-20 02:20:57', '2025-04-20 02:20:57'),
(57, 3, 1295, 'inactive', '2025-05-04 22:45:05', '2025-05-11 11:38:17'),
(58, 3, 1296, 'inactive', '2025-05-04 22:45:06', '2025-05-11 11:38:19'),
(59, 3, 1297, 'inactive', '2025-05-04 22:45:06', '2025-05-11 11:38:18'),
(60, 3, 1298, 'inactive', '2025-05-04 22:45:08', '2025-05-11 11:38:21'),
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
(73, 3, 1299, 'inactive', '2025-05-06 03:38:39', '2025-05-11 11:38:21'),
(74, 2, 1299, 'active', '2025-05-06 03:38:40', '2025-05-06 03:38:40'),
(75, 1, 1299, 'active', '2025-05-06 03:38:42', '2025-05-06 03:38:42'),
(76, 4, 1299, 'active', '2025-05-06 03:38:42', '2025-05-06 03:38:42'),
(77, 8, 1299, 'active', '2025-05-06 03:38:44', '2025-05-11 11:36:56'),
(78, 3, 1302, 'inactive', '2025-05-11 11:36:18', '2025-05-11 11:38:23'),
(79, 2, 1302, 'active', '2025-05-11 11:36:18', '2025-05-11 11:36:18'),
(80, 1, 1302, 'active', '2025-05-11 11:36:20', '2025-05-11 11:36:20'),
(81, 4, 1302, 'active', '2025-05-11 11:36:20', '2025-05-11 11:36:20'),
(82, 3, 1304, 'active', '2025-05-11 11:36:21', '2025-05-11 11:36:21'),
(83, 2, 1304, 'active', '2025-05-11 11:36:22', '2025-05-11 11:36:22'),
(84, 4, 1304, 'active', '2025-05-11 11:36:24', '2025-05-11 11:36:24'),
(85, 1, 1304, 'active', '2025-05-11 11:36:25', '2025-05-11 11:36:25'),
(86, 3, 1305, 'active', '2025-05-11 11:36:27', '2025-05-11 11:36:27'),
(87, 2, 1305, 'active', '2025-05-11 11:36:27', '2025-05-11 11:36:27'),
(88, 1, 1305, 'active', '2025-05-11 11:36:28', '2025-05-11 11:36:28'),
(89, 4, 1305, 'active', '2025-05-11 11:36:29', '2025-05-11 11:36:29'),
(90, 3, 1306, 'active', '2025-05-11 11:36:32', '2025-05-11 11:36:32'),
(91, 3, 1307, 'active', '2025-05-11 11:36:32', '2025-05-11 11:36:32'),
(92, 3, 1308, 'active', '2025-05-11 11:36:33', '2025-05-11 11:36:33'),
(93, 2, 1308, 'active', '2025-05-11 11:36:34', '2025-05-11 11:36:34'),
(94, 2, 1307, 'active', '2025-05-11 11:36:35', '2025-05-11 11:36:35'),
(95, 2, 1306, 'active', '2025-05-11 11:36:36', '2025-05-11 11:36:36'),
(96, 1, 1306, 'active', '2025-05-11 11:36:37', '2025-05-11 11:36:37'),
(97, 1, 1307, 'active', '2025-05-11 11:36:38', '2025-05-11 11:36:38'),
(98, 1, 1308, 'active', '2025-05-11 11:36:38', '2025-05-11 11:36:38'),
(99, 4, 1308, 'active', '2025-05-11 11:36:39', '2025-05-11 11:36:39'),
(100, 4, 1307, 'active', '2025-05-11 11:36:40', '2025-05-11 11:36:40'),
(101, 8, 1308, 'active', '2025-05-11 11:36:43', '2025-05-11 11:36:43'),
(102, 8, 1307, 'active', '2025-05-11 11:36:44', '2025-05-11 11:36:44'),
(103, 8, 1306, 'active', '2025-05-11 11:36:45', '2025-05-11 11:36:45'),
(104, 4, 1306, 'active', '2025-05-11 11:36:48', '2025-05-11 11:36:48'),
(105, 8, 1302, 'active', '2025-05-11 11:36:51', '2025-05-11 11:36:51'),
(106, 8, 1304, 'active', '2025-05-11 11:36:52', '2025-05-11 11:36:52'),
(107, 8, 1305, 'active', '2025-05-11 11:36:53', '2025-05-11 11:36:53'),
(108, 8, 1298, 'active', '2025-05-11 11:36:55', '2025-05-11 11:36:55'),
(109, 8, 1295, 'active', '2025-05-11 11:36:57', '2025-05-11 11:36:57'),
(110, 8, 1296, 'active', '2025-05-11 11:36:58', '2025-05-11 11:36:58'),
(111, 8, 1297, 'active', '2025-05-11 11:36:59', '2025-05-11 11:36:59'),
(112, 8, 1285, 'active', '2025-05-11 11:37:01', '2025-05-11 11:37:01'),
(113, 8, 1286, 'active', '2025-05-11 11:37:02', '2025-05-11 11:37:02'),
(114, 8, 1287, 'active', '2025-05-11 11:37:03', '2025-05-11 11:37:03'),
(115, 8, 1288, 'active', '2025-05-11 11:37:05', '2025-05-11 11:37:05'),
(116, 8, 1284, 'active', '2025-05-11 11:37:07', '2025-05-11 11:37:07'),
(117, 3, 1408, 'active', '2025-06-22 03:48:44', '2025-06-22 03:48:44'),
(118, 3, 1409, 'active', '2025-06-22 03:48:44', '2025-06-22 03:48:44'),
(119, 2, 1408, 'active', '2025-06-22 03:48:45', '2025-06-22 03:48:45'),
(120, 2, 1409, 'active', '2025-06-22 03:48:47', '2025-06-22 03:48:47'),
(121, 1, 1408, 'active', '2025-06-22 03:48:48', '2025-06-22 03:48:48'),
(122, 1, 1409, 'active', '2025-06-22 03:48:49', '2025-06-22 03:48:49'),
(123, 4, 1408, 'active', '2025-06-22 03:48:50', '2025-06-22 03:48:50'),
(124, 4, 1409, 'active', '2025-06-22 03:48:51', '2025-06-22 03:48:51'),
(125, 3, 1411, 'inactive', '2025-06-22 03:57:08', '2025-11-24 05:25:44'),
(126, 3, 1412, 'inactive', '2025-06-22 03:57:09', '2025-11-24 05:25:43'),
(127, 2, 1411, 'inactive', '2025-06-22 03:57:10', '2025-11-24 05:25:18'),
(128, 2, 1412, 'inactive', '2025-06-22 03:57:10', '2025-11-24 05:25:18'),
(129, 1, 1411, 'active', '2025-06-22 03:57:12', '2025-11-24 05:25:45'),
(130, 1, 1412, 'active', '2025-06-22 03:57:13', '2025-11-24 05:25:45'),
(131, 4, 1412, 'inactive', '2025-06-22 03:57:18', '2025-06-22 03:57:32'),
(132, 4, 1411, 'inactive', '2025-06-22 03:57:19', '2025-06-22 03:57:31'),
(133, 9, 1420, 'active', '2025-11-24 05:25:06', '2025-11-24 05:25:06'),
(134, 3, 1416, 'inactive', '2025-11-24 05:25:22', '2025-11-24 05:25:29'),
(135, 3, 1417, 'inactive', '2025-11-24 05:25:23', '2025-11-24 05:25:29'),
(136, 2, 1416, 'active', '2025-11-24 05:25:28', '2025-11-24 05:25:28'),
(137, 2, 1417, 'active', '2025-11-24 05:25:28', '2025-11-24 05:25:28'),
(138, 3, 1418, 'active', '2025-11-24 05:25:38', '2025-11-24 05:25:38'),
(139, 3, 1419, 'active', '2025-11-24 05:25:39', '2025-11-24 05:25:39'),
(140, 9, 1421, 'active', '2025-11-24 05:28:50', '2025-11-24 05:28:50'),
(141, 9, 1422, 'active', '2025-11-24 05:31:00', '2025-11-24 05:31:00');

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
('Yc0sjM9fEHD2pf8PK5fAJbmwzy71yIzPV6SyINYT', 15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieG1IbUlmakN6UUlJRlJRb0I3UEZVbkltdFo3QUFta0V0YnVLYTF0VSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hc3NldHMvY3NzL2Jvb3RzdHJhcC5taW4uY3NzLm1hcCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE1O30=', 1763985381);

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
(3, 'Inside Our Factory', NULL, '/product-category/2', 'uploads/20250622085908_418014.jpg', 'active', '2025-04-19 05:14:23', '2025-06-22 02:59:08', NULL);

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

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(2, 'tnpgfimd@testform.xyz', '2025-06-07 14:39:40', '2025-06-07 14:39:40'),
(3, 'zewonjmy@testform.xyz', '2025-06-16 11:57:20', '2025-06-16 11:57:20');

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
(1403, NULL, 'uploads/20250621065901_629325.jpeg', 4, 489, 'jpeg', NULL, NULL, '2025-06-21 00:59:01', '2025-06-21 00:59:01', NULL),
(1404, NULL, 'uploads/more/20250621065901_320241.jpeg', 4, 489, 'jpeg', NULL, NULL, '2025-06-21 00:59:01', '2025-06-21 00:59:01', NULL),
(1405, NULL, 'uploads/more/20250621065901_197360.jpeg', 4, 498, 'jpeg', NULL, NULL, '2025-06-21 00:59:01', '2025-06-21 00:59:01', NULL),
(1406, NULL, 'uploads/more/20250621065901_107712.jpeg', 4, 498, 'jpeg', NULL, NULL, '2025-06-21 00:59:01', '2025-06-21 00:59:01', NULL),
(1407, NULL, 'uploads/20250621100922_485015.jpg', 4, 2736, 'jpg', NULL, NULL, '2025-06-21 04:09:22', '2025-06-21 04:09:22', NULL),
(1408, NULL, 'uploads/more/20250621100923_362668.jpg', 4, 2625, 'jpg', NULL, NULL, '2025-06-21 04:09:23', '2025-06-21 04:09:23', NULL),
(1409, NULL, 'uploads/more/20250621100923_470090.jpg', 4, 2736, 'jpg', NULL, NULL, '2025-06-21 04:09:23', '2025-06-21 04:09:23', NULL),
(1410, NULL, 'uploads/20250621110611_781644.jpg', 4, 6, 'jpg', NULL, NULL, '2025-06-21 05:06:11', '2025-06-21 05:06:11', NULL),
(1411, NULL, 'uploads/more/20250621110611_132109.jpg', 4, 7, 'jpg', NULL, NULL, '2025-06-21 05:06:11', '2025-06-21 05:06:11', NULL),
(1412, NULL, 'uploads/more/20250621110611_788869.jpg', 4, 6, 'jpg', NULL, NULL, '2025-06-21 05:06:11', '2025-06-21 05:06:11', NULL),
(1413, NULL, 'uploads/20250621114602_757284.jpg', 4, 6, 'jpg', NULL, NULL, '2025-06-21 05:46:02', '2025-06-21 05:46:02', NULL),
(1414, NULL, 'uploads/more/20250621114602_872030.jpg', 4, 7, 'jpg', NULL, NULL, '2025-06-21 05:46:02', '2025-06-21 05:46:02', NULL),
(1415, NULL, 'uploads/more/20250621114602_962270.jpg', 4, 6, 'jpg', NULL, NULL, '2025-06-21 05:46:02', '2025-06-21 05:46:02', NULL),
(1416, NULL, 'uploads/20250622094641_644261.jpg', 4, 53, 'jpg', 'image', NULL, '2025-06-22 03:46:41', '2025-06-22 03:46:41', NULL),
(1417, NULL, 'uploads/more/20250622094641_367517.jpg', 4, 20, 'jpg', 'image', NULL, '2025-06-22 03:46:41', '2025-06-22 03:46:41', NULL),
(1418, NULL, 'uploads/more/20250622094641_966267.jpg', 4, 29, 'jpg', 'image', NULL, '2025-06-22 03:46:41', '2025-06-22 03:46:41', NULL),
(1419, NULL, 'uploads/more/20250622094641_448240.jpg', 4, 53, 'jpg', 'image', NULL, '2025-06-22 03:46:41', '2025-06-22 03:46:41', NULL),
(1420, NULL, 'uploads/20250622094833_735868.jpg', 4, 30, 'jpg', 'image', NULL, '2025-06-22 03:48:33', '2025-06-22 03:48:33', NULL),
(1421, NULL, 'uploads/more/20250622094833_632115.jpg', 4, 30, 'jpg', 'image', NULL, '2025-06-22 03:48:33', '2025-06-22 03:48:33', NULL),
(1422, NULL, 'uploads/more/20250622094834_170016.jpg', 4, 48, 'jpg', 'image', NULL, '2025-06-22 03:48:34', '2025-06-22 03:48:34', NULL),
(1423, NULL, 'uploads/more/20250622094834_442915.jpg', 4, 31, 'jpg', 'image', NULL, '2025-06-22 03:48:34', '2025-06-22 03:48:34', NULL),
(1424, NULL, 'uploads/20250622095213_609025.jpg', 4, 31, 'jpg', NULL, NULL, '2025-06-22 03:52:13', '2025-06-22 03:52:13', NULL),
(1425, NULL, 'uploads/more/20250622095213_842785.jpg', 4, 30, 'jpg', NULL, NULL, '2025-06-22 03:52:13', '2025-06-22 03:52:13', NULL),
(1426, NULL, 'uploads/more/20250622095213_456542.jpg', 4, 48, 'jpg', NULL, NULL, '2025-06-22 03:52:13', '2025-06-22 03:52:13', NULL),
(1427, NULL, 'uploads/more/20250622095213_882557.jpg', 4, 31, 'jpg', NULL, NULL, '2025-06-22 03:52:13', '2025-06-22 03:52:13', NULL),
(1428, NULL, 'uploads/20250622095356_791698.jpg', 4, 53, 'jpg', NULL, NULL, '2025-06-22 03:53:56', '2025-06-22 03:53:56', NULL),
(1429, NULL, 'uploads/more/20250622095356_799486.jpg', 4, 20, 'jpg', NULL, NULL, '2025-06-22 03:53:56', '2025-06-22 03:53:56', NULL),
(1430, NULL, 'uploads/more/20250622095356_823971.jpg', 4, 29, 'jpg', NULL, NULL, '2025-06-22 03:53:56', '2025-06-22 03:53:56', NULL),
(1431, NULL, 'uploads/more/20250622095356_723506.jpg', 4, 53, 'jpg', NULL, NULL, '2025-06-22 03:53:56', '2025-06-22 03:53:56', NULL),
(1432, NULL, 'uploads/20250622095654_824226.jpg', 4, 48, 'jpg', NULL, NULL, '2025-06-22 03:56:54', '2025-06-22 03:56:54', NULL),
(1433, NULL, 'uploads/more/20250622095654_889031.jpg', 4, 30, 'jpg', NULL, NULL, '2025-06-22 03:56:54', '2025-06-22 03:56:54', NULL),
(1434, NULL, 'uploads/more/20250622095654_525685.jpg', 4, 48, 'jpg', NULL, NULL, '2025-06-22 03:56:54', '2025-06-22 03:56:54', NULL),
(1435, NULL, 'uploads/more/20250622095654_843039.jpg', 4, 31, 'jpg', NULL, NULL, '2025-06-22 03:56:54', '2025-06-22 03:56:54', NULL),
(1436, NULL, 'uploads/20251122102412_244272.jpg', 15, 177, 'jpg', NULL, NULL, '2025-11-22 04:24:12', '2025-11-22 04:24:12', NULL),
(1437, NULL, 'uploads/more/20251122102412_426578.jpg', 15, 177, 'jpg', NULL, NULL, '2025-11-22 04:24:12', '2025-11-22 04:24:12', NULL),
(1438, NULL, 'uploads/20251124084748_542887.jpg', 15, 177, 'jpg', NULL, NULL, '2025-11-24 02:47:48', '2025-11-24 02:47:48', NULL),
(1439, NULL, 'uploads/more/20251124084748_801124.jpg', 15, 177, 'jpg', NULL, NULL, '2025-11-24 02:47:48', '2025-11-24 02:47:48', NULL),
(1440, NULL, 'uploads/20251124085027_555659.jpg', 15, 177, 'jpg', NULL, NULL, '2025-11-24 02:50:27', '2025-11-24 02:50:27', NULL),
(1441, NULL, 'uploads/more/20251124085027_646647.jpg', 15, 177, 'jpg', NULL, NULL, '2025-11-24 02:50:28', '2025-11-24 02:50:28', NULL),
(1442, NULL, 'uploads/20251124085408_596573.jpg', 15, 33, 'jpg', NULL, NULL, '2025-11-24 02:54:08', '2025-11-24 02:54:08', NULL),
(1443, NULL, 'uploads/more/20251124085408_110855.jpg', 15, 33, 'jpg', NULL, NULL, '2025-11-24 02:54:08', '2025-11-24 02:54:08', NULL),
(1444, NULL, 'uploads/20251124085445_615854.jpg', 15, 33, 'jpg', NULL, NULL, '2025-11-24 02:54:45', '2025-11-24 02:54:45', NULL),
(1445, NULL, 'uploads/more/20251124085445_550431.jpg', 15, 33, 'jpg', NULL, NULL, '2025-11-24 02:54:45', '2025-11-24 02:54:45', NULL),
(1446, NULL, 'uploads/20251124085633_301207.jpg', 15, 31, 'jpg', NULL, NULL, '2025-11-24 02:56:33', '2025-11-24 02:56:33', NULL),
(1447, NULL, 'uploads/more/20251124085633_356348.jpg', 15, 31, 'jpg', NULL, NULL, '2025-11-24 02:56:33', '2025-11-24 02:56:33', NULL),
(1448, NULL, 'uploads/20251124085710_576452.jpg', 15, 31, 'jpg', NULL, NULL, '2025-11-24 02:57:10', '2025-11-24 02:57:10', NULL),
(1449, NULL, 'uploads/more/20251124085710_999624.jpg', 15, 31, 'jpg', NULL, NULL, '2025-11-24 02:57:10', '2025-11-24 02:57:10', NULL),
(1450, NULL, 'uploads/more/20251124085919_100446.jpg', 15, 33, 'jpg', 'image', NULL, '2025-11-24 02:59:19', '2025-11-24 02:59:19', NULL),
(1451, NULL, 'uploads/more/20251124085919_385134.jpg', 15, 31, 'jpg', 'image', NULL, '2025-11-24 02:59:19', '2025-11-24 02:59:19', NULL),
(1452, NULL, 'uploads/more/20251124085940_708030.jpg', 15, 177, 'jpg', 'image', NULL, '2025-11-24 02:59:40', '2025-11-24 02:59:40', NULL),
(1453, NULL, 'uploads/more/20251124085940_755356.jpg', 15, 33, 'jpg', 'image', NULL, '2025-11-24 02:59:40', '2025-11-24 02:59:40', NULL),
(1454, NULL, 'uploads/more/20251124085940_548435.jpg', 15, 31, 'jpg', 'image', NULL, '2025-11-24 02:59:41', '2025-11-24 02:59:41', NULL),
(1455, NULL, 'uploads/more/20251124085953_928824.jpg', 15, 177, 'jpg', 'image', NULL, '2025-11-24 02:59:53', '2025-11-24 02:59:53', NULL),
(1456, NULL, 'uploads/more/20251124085953_395690.jpg', 15, 33, 'jpg', 'image', NULL, '2025-11-24 02:59:53', '2025-11-24 02:59:53', NULL),
(1457, NULL, 'uploads/more/20251124085954_867627.jpg', 15, 31, 'jpg', 'image', NULL, '2025-11-24 02:59:54', '2025-11-24 02:59:54', NULL),
(1458, NULL, 'uploads/20251124112448_479030.jpg', 15, 177, 'jpg', NULL, NULL, '2025-11-24 05:24:48', '2025-11-24 05:24:48', NULL),
(1459, NULL, 'uploads/more/20251124112448_954209.jpg', 15, 177, 'jpg', NULL, NULL, '2025-11-24 05:24:48', '2025-11-24 05:24:48', NULL),
(1460, NULL, 'uploads/20251124112837_692421.jpg', 15, 92, 'jpg', NULL, NULL, '2025-11-24 05:28:37', '2025-11-24 05:28:37', NULL),
(1461, NULL, 'uploads/more/20251124112837_573662.jpg', 15, 92, 'jpg', NULL, NULL, '2025-11-24 05:28:37', '2025-11-24 05:28:37', NULL),
(1462, NULL, 'uploads/20251124113054_751491.jpg', 15, 83, 'jpg', NULL, NULL, '2025-11-24 05:30:54', '2025-11-24 05:30:54', NULL),
(1463, NULL, 'uploads/more/20251124113054_695104.jpg', 15, 83, 'jpg', NULL, NULL, '2025-11-24 05:30:54', '2025-11-24 05:30:54', NULL);

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
(4, 'demo', 'admin', 'demoadmin@gmail.com', '236516', NULL, '$2y$12$u3sQRtyDaVZYfdd6EmL1R.ig9kxUrI28i4IvtLoRd9uE.UB8VV9g.', NULL, NULL, NULL, NULL, NULL, 'active', '2024-10-01 22:36:36', '2025-06-05 00:04:16', '2025-06-05 00:14:16', 1),
(5, 'sabbir', 'admin', 'sabbirsuvro9@gmail.com', NULL, NULL, '$2y$12$PFpnarMNJokDjZ00HQ5X.OstwI0wa/x9s1Zaz15bbnlwZkbH3oKEC', NULL, NULL, NULL, '01751155302', NULL, 'active', '2025-01-19 22:34:27', '2025-05-23 22:54:41', NULL, 1),
(6, 'staff', 'admin', 'staff@gmail.com', NULL, NULL, '$2y$12$GHZ6MLSpoQP7Bcumu1X.Nuwl9jygJt/Rrj81neVvRr8GGrz5pOR5u', NULL, NULL, NULL, '01751155333', NULL, 'active', '2025-01-20 17:03:04', '2025-04-09 00:05:59', NULL, 1),
(7, 'main admin', 'admin', 'sabbir.startupmind@gmail.com', '225380', NULL, '$2y$12$u3sQRtyDaVZYfdd6EmL1R.ig9kxUrI28i4IvtLoRd9uE.UB8VV9g.', NULL, NULL, NULL, NULL, NULL, 'active', '2024-10-01 22:36:36', '2025-06-05 14:15:14', '2025-06-05 14:25:14', 1),
(8, 'stuff', 'staff', 'demostuff@gmail.com', '561775', NULL, '$2y$12$u3sQRtyDaVZYfdd6EmL1R.ig9kxUrI28i4IvtLoRd9uE.UB8VV9g.', NULL, NULL, NULL, NULL, NULL, 'inactive', '2024-10-01 22:36:36', '2025-04-08 05:49:42', '2025-04-08 05:59:42', 1),
(10, 'Sabbir Ahmed', 'admin', 'demo1@gmail.com', '680642', NULL, '$2y$12$WhgB/FHtN1r.jEGTpvfXDOKQ0JTqbRVtefePGeKlSHJCyWzsx8h.S', NULL, NULL, NULL, '01751155243', NULL, 'active', '2025-04-09 00:28:20', '2025-04-09 01:11:45', '2025-04-09 01:21:45', 2),
(11, 'Sayema Akter', 'admin', 'sayemaakter1980@gmail.com', NULL, NULL, '$2y$12$HPnBHwgN4JKBWkJJ.3Tq1eZWcOzpe6MTkb/eyigGgkmP.R8c64oCC', NULL, NULL, '88TmQkQVdYPIgdFH0JZfZVoamijmzcdiQDoqAeY5HUFTf5xKIxLeRZHo7aX5', NULL, NULL, 'active', '2025-05-07 10:06:38', '2025-06-01 16:47:14', NULL, 1),
(12, 'Jarif Khan', 'admin', 'jarifk004@gmail.com', '994675', NULL, '$2y$12$NhrTLiIeTLbyZ2PudgRloemnFK3hmwtBb4uyoB83U/f.CeNX0WVKm', NULL, NULL, '1lEcLSt1AMgfgw1mivwgLlPf8v7G4FDt6XLIAAfLLoxrDqjJHfdAbiSiXtpN', NULL, NULL, 'active', '2025-05-07 10:56:19', '2025-06-08 09:11:08', '2025-06-08 09:21:08', 1),
(13, 'imran ahmed', 'admin', 'imranahmedmosiho123@gmail.com', '349423', NULL, '$2y$12$Z74XhFHQFFa58xpoNhNQEOAlWglANObN0d4uCy..WxfIr8yjarsqO', NULL, NULL, 'KkYTeqtVyb6WgF7EVUxU0oHNLnh5EJlnK2lKGEZCxu9rltOUpkXVqidAcX2H', NULL, NULL, 'active', '2025-05-07 12:26:12', '2025-06-09 00:26:45', '2025-06-09 00:36:45', 1),
(15, 'Ashrafur', 'admin', 'ashrafur@gmail.com', NULL, NULL, '$2y$12$/SNlvG4MOKr5AuxwWMIRR.o7rnQPkA7v4hxmUG3a6537i5A8.L25.', NULL, NULL, NULL, NULL, NULL, 'inactive', '2025-11-17 04:55:49', '2025-11-17 04:55:49', NULL, 1);

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
  `google_business` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `tiktok` varchar(100) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `contact_info` text DEFAULT NULL,
  `our_history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- Dumping data for table `website_infos`
--

INSERT INTO `website_infos` (`id`, `company_name`, `address`, `website`, `email`, `contact_no`, `working_hours`, `facebook`, `google_business`, `youtube`, `tiktok`, `logo`, `updated_at`, `created_at`, `contact_info`, `our_history`) VALUES
(1, 'Smell Bucket', 'Uttora-7, Dhaka-1206, Bangladesh', 'https://smellbucket.com/', 'info@dharaonlinebd.com', '+8801817562714', 'Mon - Sun / 9:00AM - 8:00PM', 'https://facebook.com', 'https://business.google.com', 'https://youtube.com', 'https://www.tiktok.com/@eyenewsbdtiktok', 'uploads/20250622072315_681256.png', '2025-11-24 05:55:34', NULL, '<p>Good descriptive writing creates an impression in the reader&#39;s mind of an event, a place, a person, or a thing. The writing will be such that it will set a mood or describe something in such detail that if the reader saw it, they would recognize it.</p>\r\n\r\n<p>To be good, descriptive writing has to be concrete, evocative and plausible.</p>\r\n\r\n<ul>\r\n	<li>To be&nbsp;<strong>concrete</strong>, descriptive writing has to offer specifics the reader can envision. Rather than &ldquo;Her eyes were the color of blue rocks&rdquo; (Light blue? Dark blue? Marble? Slate?), try instead, &ldquo;Her eyes sparkled like sapphires in the dark.&rdquo;</li>\r\n	<li>To be&nbsp;<strong>evocative</strong>, descriptive writing has to unite the concrete image with phrasing that evokes the impression the writer wants the reader to have. Consider &ldquo;her eyes shone like sapphires, warming my night&rdquo; versus &ldquo;the woman&rsquo;s eyes had a light like sapphires, bright and hard.&rdquo; Each phrase uses the same concrete image, then employs evocative language to create different impressions.</li>\r\n	<li>To be&nbsp;<strong>plausible</strong>, the descriptive writer has to constrain the concrete, evocative image to suit the reader&rsquo;s knowledge and attention span. &ldquo;Her eyes were brighter than the sapphires in the armrests of the Tipu Sultan&rsquo;s golden throne, yet sharper than the tulwars of his cruelest executioners&rdquo; will have the reader checking their phone halfway through. &ldquo;Her eyes were sapphires, bright and hard&rdquo; creates the same effect in a fraction of the reading time. As always in the craft of writing: when in doubt, write less.</li>\r\n</ul>', '<p>Good descriptive writing creates an impression in the reader&#39;s mind of an event, a place, a person, or a thing. The writing will be such that it will set a mood or describe something in such detail that if the reader saw it, they would recognize it.</p>\r\n\r\n<p>To be good, descriptive writing has to be concrete, evocative and plausible.</p>\r\n\r\n<ul>\r\n	<li>To be&nbsp;<strong>concrete</strong>, descriptive writing has to offer specifics the reader can envision. Rather than &ldquo;Her eyes were the color of blue rocks&rdquo; (Light blue? Dark blue? Marble? Slate?), try instead, &ldquo;Her eyes sparkled like sapphires in the dark.&rdquo;</li>\r\n	<li>To be&nbsp;<strong>evocative</strong>, descriptive writing has to unite the concrete image with phrasing that evokes the impression the writer wants the reader to have. Consider &ldquo;her eyes shone like sapphires, warming my night&rdquo; versus &ldquo;the woman&rsquo;s eyes had a light like sapphires, bright and hard.&rdquo; Each phrase uses the same concrete image, then employs evocative language to create different impressions.</li>\r\n	<li>To be&nbsp;<strong>plausible</strong>, the descriptive writer has to constrain the concrete, evocative image to suit the reader&rsquo;s knowledge and attention span. &ldquo;Her eyes were brighter than the sapphires in the armrests of the Tipu Sultan&rsquo;s golden throne, yet sharper than the tulwars of his cruelest executioners&rdquo; will have the reader checking their phone halfway through. &ldquo;Her eyes were sapphires, bright and hard&rdquo; creates the same effect in a fraction of the reading time. As always in the craft of writing: when in doubt, write less.</li>\r\n</ul>');

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
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
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
-- Indexes for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT for table `client_reviews`
--
ALTER TABLE `client_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pixel_gtms`
--
ALTER TABLE `pixel_gtms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1423;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `section_products`
--
ALTER TABLE `section_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1464;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
