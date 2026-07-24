-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2026 at 03:09 PM
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
-- Database: `chauminhkhoa_2124110096`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `link` varchar(1000) DEFAULT NULL,
  `image` varchar(1000) NOT NULL,
  `position` enum('slideshow','ads') NOT NULL DEFAULT 'slideshow',
  `description` text DEFAULT NULL,
  `sort_order` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `name`, `link`, `image`, `position`, `description`, `sort_order`, `created_by`, `updated_by`, `deleted_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main Slideshow Banner', 'https://example.com', 'banner1.jpg', 'slideshow', 'This is the main slideshow banner.', 1, 1, 1, NULL, 1, '2025-03-11 01:21:00', '2025-03-11 01:21:00'),
(2, 'Main Slideshow Banner', 'https://example.com', 'banner1.jpg', 'slideshow', 'This is the main slideshow banner.', 1, 1, 1, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `description`, `sort_order`, `created_by`, `updated_by`, `deleted_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Việt Tiến', 'viet-tien', 'vt.jpg', 'Thời trang Việt Nam.', 1, 1, NULL, NULL, 1, '2025-03-11 01:21:00', '2025-03-11 01:21:00'),
(2, 'Hồng Hà', 'hong-ha', 'samsung.jpg', 'Fashion of South Korean multinational conglomerate.', 2, 1, NULL, NULL, 1, '2025-03-11 01:21:00', '2025-03-11 01:21:00'),
(3, 'Lucy', 'lucy', 'vt.jpg', 'Thời trang Việt Nam.', 1, 1, NULL, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32'),
(4, 'Amany', 'amany', 'samsung.jpg', 'Fashion of South Korean multinational conglomerate.', 2, 1, NULL, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(23, 3, 12, 1, '2025-07-02 04:05:27', '2025-07-02 04:05:27'),
(24, 3, 9, 1, '2025-07-02 04:05:34', '2025-07-02 04:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`, `parent_id`, `sort_order`, `image`, `description`, `created_by`, `updated_by`, `deleted_at`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Thời trang nam', 'thoi-trang-nam', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-03-11 03:35:44', '2025-03-11 03:35:44'),
(3, 'Thời trang nữ', 'thoi-trang-nu', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-03-13 02:07:24', '2025-03-13 02:07:24'),
(4, 'Phụ kiện', 'phu-kien', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-03-13 02:13:34', '2025-03-13 02:13:34'),
(5, 'Áo thun nam', 'ao-thun-nam', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-03-13 02:16:31', '2025-04-09 01:52:48'),
(6, 'Áo sơ mi nam', 'ao-so-mi-nam', 2, NULL, NULL, NULL, NULL, NULL, '2025-04-09 01:43:50', 1, '2025-03-15 07:22:37', '2025-04-09 01:43:50'),
(7, 'Quần tây nam', 'quan-tay-nam', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-03-15 07:47:57', '2025-03-15 07:47:57'),
(8, 'Quần jean nam', 'quan-jean-nam', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-03-15 16:01:03', '2025-03-15 16:01:03'),
(9, 'Đầm nữ', 'dam-nu', 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-03-15 16:14:39', '2025-03-15 20:10:11'),
(10, 'Áo thun nữ', 'ao-thun-nu', 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-03-15 20:12:48', '2025-05-13 17:55:16'),
(11, 'Quần jean nữ', 'quan-jean-nu', 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-03-15 21:01:36', '2025-04-09 01:52:37'),
(13, 'Áo sơ mi nữ', 'ao-so-mi-nu', 3, NULL, NULL, NULL, 1, NULL, NULL, 1, '2025-03-18 01:38:53', '2025-03-18 23:27:24'),
(14, 'Mắt kính', 'mat-kinh', 4, NULL, NULL, NULL, 1, NULL, NULL, 1, '2025-03-18 23:28:26', '2025-03-18 23:28:26'),
(47, 'Giày dép', 'giay-dep', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-02-11 03:50:00', '2026-02-11 03:50:00'),
(48, 'aádfas', 'aadfas', 40, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-02-11 03:54:20', '2026-02-11 03:54:20'),
(49, 'test api', 'test-api', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-18 03:22:03', '2026-03-18 03:22:03'),
(51, 'New Category', 'new-category', 4, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-25 02:23:23', '2026-03-25 02:23:23'),
(52, 'New Category 1', 'new-category-1', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-25 02:28:57', '2026-03-25 02:28:57'),
(53, 'New Category 2', 'new-category-2', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-25 02:47:25', '2026-03-25 02:47:25'),
(54, 'test tiep nua ne', 'test-tiep-nua-ne', 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-07-08 11:08:56', '2026-07-08 11:10:13');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `content` longtext NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_users`
--

CREATE TABLE `custom_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `updated_by` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_users`
--

INSERT INTO `custom_users` (`id`, `fullname`, `username`, `email`, `phone`, `address`, `birthday`, `gender`, `avatar`, `password`, `remember_token`, `email_verified_at`, `role`, `created_by`, `updated_by`, `deleted_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 'user1', 'user1', 'user1@gmail.com', '1234567890', 'sdas', NULL, 'male', NULL, '$2y$12$KKDkae2auubAVQAMT0q31eK3hCMQHzuSwM/B43/fTgqYsZgemGTdq', NULL, NULL, 'user', 1, 1, NULL, 1, '2025-04-16 21:02:51', '2025-04-16 21:02:51'),
(2, 'test_custom', 'custom1', 'testcustom@gmail.com', '0987654321', 'ádfa', NULL, 'male', '1744862672_5-Ways-Education-Uses-Digital-Technology.jpg', '$2y$12$32iU9f9vL2qsq9R3RLZUr.twVMJ3IBo5bEPvEnbDt3FdQ49R7wj/2', NULL, NULL, 'user', 1, 1, NULL, 1, '2025-04-16 21:04:33', '2025-04-16 21:04:33'),
(3, 'test_custom1', 'custom2', 'testcustom1@gmail.com', '0987654322', 'ádfa', NULL, 'male', '1744862772_2.jpg', '$2y$12$IHE41mDPaRlkWPnu.9WuBeJ8AyFCd7mp0wRkCDvLWW2taN7bQYiyi', NULL, NULL, 'user', 1, 1, NULL, 1, '2025-04-16 21:06:12', '2025-04-16 21:06:12');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `position` enum('mainmenu','footermenu') NOT NULL DEFAULT 'mainmenu',
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '0001_01_01_000000_create_users_table', 1),
(17, '0001_01_01_000001_create_cache_table', 1),
(18, '0001_01_01_000002_create_jobs_table', 1),
(19, '2025_02_25_082132_create_banners_table', 1),
(20, '2025_02_25_085048_create_brands_table', 1),
(21, '2025_02_25_085152_create_categories_table', 1),
(22, '2025_02_25_085231_create_contacts_table', 1),
(23, '2025_02_25_085606_create_menus_table', 1),
(24, '2025_02_25_085647_create_products_table', 1),
(25, '2025_02_25_085714_create_orders_table', 1),
(26, '2025_02_25_085730_create_order_details_table', 1),
(27, '2025_02_25_090614_create_posts_table', 1),
(28, '2025_02_25_090634_create_custom_users_table', 1),
(29, '2025_02_25_150034_create_product_images_table', 1),
(30, '2025_03_11_044456_update_created_by_nullable_in_categories_table', 1),
(31, '2025_03_17_023827_update_created_by_nullable', 2),
(32, '2025_03_18_061333_update_created_by_nullable_in_posts_table', 3),
(33, '2025_04_16_075910_add_extra_fields_to_users_table', 4),
(34, '2025_04_17_033711_create_custom_users_table', 5),
(35, '2025_04_17_034954_add_created_by_to_custom_users_table', 6),
(36, '2025_04_17_035830_add_created_by_deleted_at_status_to_custom_users_table', 7),
(37, '2025_04_22_034831_add_role_to_users_table', 8),
(38, '2025_05_21_022803_create_cart_items_table', 9),
(39, '2025_06_11_033029_update_orders_table', 10),
(40, '2025_06_25_022409_rename_amount_to_total_in_order_details_table', 11),
(41, '2026_03_10_104946_create_personal_access_tokens_table', 12),
(42, '2026_07_01_154155_modify_users_unique_constraints', 13),
(43, '2026_07_01_154307_readd_unique_to_username', 14);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `status` enum('pending','processing','completed','cancelled') NOT NULL DEFAULT 'pending',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `status`, `created_by`, `updated_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 2, 299000.00, 'pending', 2, NULL, NULL, '2025-06-24 19:26:08', '2025-06-24 19:26:08'),
(4, 2, 640000.00, 'pending', 2, NULL, NULL, '2025-06-24 19:26:44', '2025-06-24 19:26:44'),
(5, 2, 399000.00, 'pending', 2, NULL, NULL, '2025-06-24 20:28:24', '2025-06-24 20:28:24'),
(6, 2, 299000.00, 'pending', 2, NULL, NULL, '2025-07-01 19:06:49', '2025-07-01 19:06:49'),
(7, 3, 408000.00, 'pending', 3, NULL, NULL, '2025-07-01 21:39:24', '2025-07-01 21:39:24'),
(8, 1, 2330000.00, 'pending', 1, NULL, NULL, '2025-12-25 21:28:57', '2025-12-25 21:28:57'),
(9, 17, 600342.00, 'pending', 17, NULL, NULL, '2026-07-11 07:44:01', '2026-07-11 07:44:01'),
(10, 17, 3301000.00, 'pending', 17, NULL, NULL, '2026-07-11 07:45:01', '2026-07-11 07:45:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `qty`, `price`, `discount`, `total`, `created_at`, `updated_at`) VALUES
(1, 3, 12, 1, 299000, 0, 299000, '2025-06-24 19:26:08', '2025-06-24 19:26:08'),
(2, 4, 5, 1, 341000, 0, 341000, '2025-06-24 19:26:44', '2025-06-24 19:26:44'),
(3, 4, 8, 1, 299000, 0, 299000, '2025-06-24 19:26:44', '2025-06-24 19:26:44'),
(4, 5, 9, 1, 399000, 0, 399000, '2025-06-24 20:28:24', '2025-06-24 20:28:24'),
(5, 6, 8, 1, 299000, 0, 299000, '2025-07-01 19:06:49', '2025-07-01 19:06:49'),
(6, 7, 12, 2, 199000, 0, 398000, '2025-07-01 21:39:24', '2025-07-01 21:39:24'),
(7, 7, 8, 1, 10000, 0, 10000, '2025-07-01 21:39:24', '2025-07-01 21:39:24'),
(8, 8, 9, 8, 290000, 0, 2320000, '2025-12-25 21:28:57', '2025-12-25 21:28:57'),
(9, 8, 8, 1, 10000, 0, 10000, '2025-12-25 21:28:57', '2025-12-25 21:28:57'),
(10, 9, 11, 1, 2342, 0, 2342, '2026-07-11 07:44:01', '2026-07-11 07:44:01'),
(11, 9, 12, 2, 299000, 0, 598000, '2026-07-11 07:44:01', '2026-07-11 07:44:01'),
(12, 10, 12, 1, 299000, 0, 299000, '2026-07-11 07:45:01', '2026-07-11 07:45:01'),
(13, 10, 19, 1, 3000000, 0, 3000000, '2026-07-11 07:45:01', '2026-07-11 07:45:01'),
(14, 10, 17, 1, 2000, 0, 2000, '2026-07-11 07:45:01', '2026-07-11 07:45:01');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 12, 'auth_token', '787a6a7bb3e3501ee6d7f492fc7098e3d34e70b9f924de48362438df2b642a02', '[\"*\"]', NULL, NULL, '2026-03-12 01:56:24', '2026-03-12 01:56:24'),
(2, 'App\\Models\\User', 12, 'auth_token', 'e0fd51cbf9e8f8d7795971a80e6c973504956b08846c877de047565b05f47d38', '[\"*\"]', '2026-03-12 02:02:53', NULL, '2026-03-12 02:00:07', '2026-03-12 02:02:53'),
(3, 'App\\Models\\User', 12, 'auth_token', '3c417725cf51afb248d17a7ec5f927357cd6baf125ce5d13d7d9ee4b6ea8d241', '[\"*\"]', NULL, NULL, '2026-03-12 02:03:37', '2026-03-12 02:03:37'),
(4, 'App\\Models\\User', 13, 'auth_token', '2b952f2b69711f5dec440da89afa080a71aafb175d60fdf1ebd2dd9140727a03', '[\"*\"]', NULL, NULL, '2026-03-12 04:07:31', '2026-03-12 04:07:31'),
(5, 'App\\Models\\User', 13, 'auth_token', '2bf7091314290ca7ef16970f7c5a4f8998b0183336d35f3a17d286804c11b081', '[\"*\"]', NULL, NULL, '2026-03-12 04:10:32', '2026-03-12 04:10:32'),
(7, 'App\\Models\\User', 13, 'auth_token', '4415e4a347fe3a6408b77f8c80f5e332506b441553a1772cff8a94e1a131bf90', '[\"*\"]', '2026-03-12 08:28:48', NULL, '2026-03-12 05:19:15', '2026-03-12 08:28:48'),
(8, 'App\\Models\\User', 14, 'auth_token', '6b1cf0e218fe0342419d55ef870a830cf821424145c2ef337e7e7f2e28730bbd', '[\"*\"]', NULL, NULL, '2026-03-12 08:19:38', '2026-03-12 08:19:38'),
(9, 'App\\Models\\User', 14, 'auth_token', 'e3a4b7394f0427628917e0c7851cfdcf39816785f6d6c06a160f6fef7f650bc1', '[\"*\"]', '2026-03-13 02:22:01', NULL, '2026-03-12 20:55:04', '2026-03-13 02:22:01'),
(10, 'App\\Models\\User', 14, 'auth_token', '8df435e6292276729fa4a8850fec2a1ec38c1f36ceb1af157ca584c09086374a', '[\"*\"]', '2026-03-16 01:07:33', NULL, '2026-03-13 02:34:25', '2026-03-16 01:07:33'),
(11, 'App\\Models\\User', 14, 'auth_token', '8ae26f116860a260e5966818c2cf40fd36411169364951718cf965e01929c252', '[\"*\"]', '2026-03-16 01:22:37', NULL, '2026-03-16 01:21:39', '2026-03-16 01:22:37'),
(12, 'App\\Models\\User', 14, 'auth_token', 'fdf1ffad10fe22cf02f4a2577ef152668088b5ae9fcef66617e6b1a651757a2b', '[\"*\"]', '2026-03-18 07:02:19', NULL, '2026-03-18 03:18:26', '2026-03-18 07:02:19'),
(13, 'App\\Models\\User', 14, 'auth_token', 'e67460b04f36cff5bf9ca65c130076b6db75ef793df0f2d380262bbca7da529e', '[\"*\"]', '2026-03-25 02:47:25', NULL, '2026-03-25 02:14:33', '2026-03-25 02:47:25'),
(17, 'App\\Models\\User', 17, 'auth_token', 'c652b676702fa650c73a5a6508742d5811b560ce764080fe14e910f7def9f0fc', '[\"*\"]', '2026-07-01 08:51:07', NULL, '2026-07-01 08:50:36', '2026-07-01 08:51:07'),
(27, 'App\\Models\\User', 17, 'auth_token', '03313d7439a429fad7bfe017f3086788bfcd375978e6f29124d20257b17f9420', '[\"*\"]', '2026-07-11 07:40:20', NULL, '2026-07-08 11:05:47', '2026-07-11 07:40:20');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `content` longtext NOT NULL,
  `description` text NOT NULL,
  `thumbnail` varchar(1000) NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `description`, `thumbnail`, `created_by`, `updated_by`, `deleted_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sample Post 1', 'sample-post-1', 'This is the content of post 1.', 'Short description for post 1.', 'https://via.placeholder.com/300.png?text=Post+1', 2, 1, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32'),
(2, 'Sample Post 2', 'sample-post-2', 'This is the content of post 2.', 'Short description for post 2.', 'https://via.placeholder.com/300.png?text=Post+2', 1, 1, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32'),
(3, 'Sample Post 3', 'sample-post-3', 'This is the content of post 3.', 'Short description for post 3.', 'https://via.placeholder.com/300.png?text=Post+3', 4, 1, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32'),
(4, 'Sample Post 4', 'sample-post-4', 'This is the content of post 4.', 'Short description for post 4.', 'https://via.placeholder.com/300.png?text=Post+4', 1, 1, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32'),
(5, 'Sample Post 5', 'sample-post-5', 'This is the content of post 5.', 'Short description for post 5.', 'https://via.placeholder.com/300.png?text=Post+5', 3, 1, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32'),
(6, 'Sample Post 6', 'sample-post-6', 'This is the content of post 6.', 'Short description for post 6.', 'https://via.placeholder.com/300.png?text=Post+6', 2, 4, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32'),
(7, 'Sample Post 7', 'sample-post-7', 'This is the content of post 7.', 'Short description for post 7.', 'https://via.placeholder.com/300.png?text=Post+7', 2, 2, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32'),
(8, 'Sample Post 8', 'sample-post-8', 'This is the content of post 8.', 'Short description for post 8.', 'https://via.placeholder.com/300.png?text=Post+8', 3, 1, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32'),
(9, 'Sample Post 9', 'sample-post-9', 'This is the content of post 9.', 'Short description for post 9.', 'https://via.placeholder.com/300.png?text=Post+9', 2, 3, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32'),
(10, 'Sample Post 10', 'sample-post-10', 'This is the content of post 10.', 'Short description for post 10.', 'https://via.placeholder.com/300.png?text=Post+10', 5, 1, NULL, 1, '2025-03-17 23:29:32', '2025-03-17 23:29:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `description` text DEFAULT NULL,
  `is_on_sale` tinyint(1) NOT NULL DEFAULT 0,
  `sale_price` double DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `slug`, `cat_id`, `brand_id`, `image`, `price`, `description`, `is_on_sale`, `sale_price`, `views`, `qty`, `created_by`, `updated_by`, `deleted_at`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Áo thun nam 1', 'ao-thun-nam-1', 5, 1, 'products/THUNNAM1.jpg', 156363, 'áo thun nam 1', 0, 0, 1, 1, NULL, NULL, NULL, 1, '2025-03-16 19:46:34', '2025-04-09 00:19:20'),
(3, 'Áo thun nam 2', 'ao-thun-nam-2', 5, 1, 'products/THUNNAM2.jpg', 156363, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 1, '2025-03-16 20:11:22', '2025-03-16 20:11:22'),
(4, 'Áo thun nam 3', 'ao-thun-nam-3', 5, 1, 'products/THUNNAM3.jpg', 341000, 'Áo thun nam', 0, 0, 0, 0, NULL, NULL, NULL, 1, '2025-03-16 20:12:41', '2025-03-16 20:12:41'),
(5, 'Áo thun nam 4', 'ao-thun-nam-4', 5, 1, 'products/THUNNAM4.png', 341000, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 1, '2025-03-16 20:13:01', '2025-04-02 04:42:12'),
(6, 'Áo thun nam 5', 'ao-thun-nam-5', 5, 1, 'products/THUNNAM5.jpg', 151000, NULL, 0, 0, 0, 0, NULL, NULL, NULL, 1, '2025-03-16 20:13:43', '2025-04-02 04:42:04'),
(7, 'Đầm nữ 1', 'dam-nu-1', 9, 1, 'products/DM1.jpeg', 268900, 'Đầm nữ', 1, 200000, 6, 10, NULL, NULL, NULL, 1, '2025-03-24 21:05:47', '2025-06-05 02:22:27'),
(8, 'Đầm nữ 2', 'dam-nu-2', 9, 4, 'products/DM2.jpg', 299000, 'Đầm nữ 2', 1, 10000, 4, 10, NULL, NULL, NULL, 1, '2025-03-25 00:01:09', '2025-06-24 18:44:31'),
(9, 'Đầm nữ 3', 'dam-nu-3', 9, 3, 'products/DM2.jpg', 399000, 'Đầm nữ 3', 1, 290000, 13, 10, NULL, NULL, NULL, 1, '2025-03-25 00:10:04', '2025-12-25 20:46:23'),
(10, 'sua san phẩm 1', 'sua-san-pham-1', 7, 4, 'products/DM2.jpg', 3423, 'sdfas dfsdf', 1, 3300, 0, 32, 1, NULL, NULL, 0, '2025-03-30 21:19:47', '2025-04-02 04:41:32'),
(11, 'Đầm nữ 5', 'dam-nu-5', 9, 2, 'products/DM2.jpg', 2342, 'fgsd sdf gdf g', 0, 0, 0, 11, 1, NULL, NULL, 1, '2025-04-02 00:57:16', '2026-07-08 10:35:18'),
(12, 'Áo sơ mi nữ 1', 'ao-so-mi-nu-1', 13, 3, 'products/DM2.jpg', 299000, 'mo ta mota mot a', 1, 199000, 12, 10, 1, NULL, NULL, 1, '2025-04-08 23:59:13', '2025-12-27 21:26:35'),
(13, 'thêm sản phẩm mới', 'them-san-pham-moi', 8, 2, 'products/DM2.jpg', 42342, 'sfasd', 0, 0, 0, 32, 1, NULL, NULL, 0, '2025-06-24 18:14:22', '2025-06-24 18:42:48'),
(14, 'Laptop Dell', 'laptop-dell', 5, 1, 'products/DM2.jpg', 15000000, 'Laptop văn phòng', 0, 0, 0, 0, NULL, NULL, NULL, 1, '2026-01-15 02:20:10', '2026-01-15 02:20:10'),
(15, 'Laptop Dell 3-bonus', 'laptop-dell-3-bonus', 5, 1, 'products/DM2.jpg', 160000, 'Laptop văn phòng', 0, 0, 0, 0, NULL, NULL, NULL, 1, '2026-01-16 01:51:39', '2026-07-08 10:35:14'),
(17, 'test update 2', 'test-update-2', 3, 1, 'products/dBRFnHzHgfPzZ77QLVJzypDgUPXtoscmZgkSuJCy.png', 2000, 'aaa', 0, 0, 0, 5, NULL, NULL, NULL, 1, '2026-01-18 18:40:15', '2026-01-21 23:14:29'),
(18, 'test upload 1', 'test-upload-1', 4, 2, 'products/LQhIxrG54CQSuQpgB75l449qdnV3japr6ornPPNW.jpg', 3000000, 'dfasdf', 0, 0, 0, 0, NULL, NULL, NULL, 1, '2026-01-21 19:35:41', '2026-01-21 19:35:41'),
(19, 'test upload 2', 'test-upload-2', 4, 2, 'products/zbOPqOweZ3qnoqlu7EZ25QhUsQBxeyKGlg9Pk8VJ.jpg', 3000000, 'dfasdf', 0, 0, 0, 10, NULL, NULL, NULL, 1, '2026-03-12 20:55:30', '2026-03-12 20:55:30'),
(21, 'test thu lai', 'test-thu-lai', 51, 1, 'products/b7jAKcZPLnsAJ5vmqhqMExw2WSCxR060EdUEI6Jx.jpg', 1231231, 'r23r23', 0, NULL, 0, 12, NULL, NULL, NULL, 1, '2026-07-08 10:24:17', '2026-07-08 10:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(1000) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('0FOxwWCDUN5eD6h40fViuL5jvYP50D0oCZloxqky', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWpOWmpNaGh2alExTm5uTGZHU3N2N0RaRDIycGQxbjdtVEo2Vm9lNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781880),
('0P89QcYEwtwXdCVkHGwihmWp6JXi3gcBKAeAv6GA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0lBQmNkdjVkZ0Q4UTFJSXhRb0J5WHhPdzQxS1BoTDVPZUo5N2ZldCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781848),
('0wUWjP92XGWoPzvziGTDrAtW4Ft37tpdG8LnQKZS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1VSZ0w0Z3pSSmN5S2VmTlM5M0VxdVZIRTF3NnlMVnZDa24wR1gwMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781865),
('1nq6xOCmNkeHES1jg6pxc0zJARn5K8J97dIa0GOA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWNwbUpoM0NsNEdPZUM3a1BCTmVBTjdBMjg2QW92N3pjUWF2akxZbyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781782),
('21T8jo1MWqDSCESXpkhwMFuV6IllLjLsP85onVzw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0kwMnRVdTBWTjAyZk5TZERXZm1qY1dLNmFYUlRlRFlLUU9OdEZFYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781864),
('2JYqOFyDGFoM1BRKHTBtIhyfLvj1iYxVSWRmjzig', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXZFNmVOeXlEOTEyVDBlM3Z3N2JVQUpaV1Zhek9iQTBTYkYwOUVDayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb3JkZXJzIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781868),
('2SGyqmjGl5j7YvLHOprquy6buA7KhfI0IFSh1Cd4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV05MYk91emtuTkdiNFRPV3lEMEs4TjNlaTdsMkxzdTd5OEV5VGh4YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780829),
('2XZXvvkB7YRU8IBNd0QXZJEs1F7DeAWNUa8DloYV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0lIOTM2dEZ4RFI3VlRsUDBCS2JWQmVVMGhGZHRjWDNXamVjS3RhYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781782),
('3HpgH6GFSxKq5ylM11IHgFSl1XrTEQ5az2pLVmqY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUxVc2hKYjNxdUQxck1pNXJsSzU2c2RkZGhZZHpTR1RNSXRTRFNLciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781995),
('3oBUw6g25FrDgGKfr20T48JsByxOTH74Z81cDW3T', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUs0N1lNd2JueTBjelhPYjhoNE14R0lyS1BqQWVsMWZUOUhMS09zTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780806),
('3UNgvpdiaZWiMW514jomzRyr2taqgBz5YaLkTH5E', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0pRMmFrS3lzTTFSNDVGY2JMMjlnWXhxTWptVmxleDhWeVJacXplciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdXNlcnNCeVBhZ2VTaXplP3BhZ2luYXRpb24lNUJwYWdlJTVEPTEmcGFnaW5hdGlvbiU1QnBhZ2VTaXplJTVEPTEwMDAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781869),
('5nlyxisfMXX9RJMgJQ1qV7PdQFK3fWKyK9S41wmr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUEwcFhQRkI5RVZSR0VOMDIyQlZMRzBjbVVtcUtIUW5iTG45SlhjUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781840),
('7J7OYBFJDtu9J8Jo47sJrZ2Wb34DEgfbTWyffR30', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHZGek1Rc2lLTWJIanN2aE1mRXlPaGdTREtPWGlFTFdUNkRaMzVoOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781880),
('7MFamML2C4t0Epjo4S4Al1cIkFErCbqXVk2iPJjX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWlKM2NxYUxwWmpOYTZhMFlzSGl5TDdHRmY5d3E3UTVYY091enZiciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781994),
('9tNnaamaQFrpovwEqhLVX0zpduLlK67rRPIeqgcm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjEzT1VTMGI2eE1IemhwcjM0ZlRHVmJLRlBjdnhXMWE1aVhsWXRXeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2FjdGl2ZVByb2R1Y3RzQnlQYWdlU2l6ZT9wYWdpbmF0aW9uJTVCcGFnZSU1RD0xJnBhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD04IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784380036),
('9Z2GtIcHUB07y9UiUYU7onYE31BZohUMFmghV3Xu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMldXNE4zYjk5ejViMmswelVzckR2eHpEb1ZxVGxsNHFNekJ1c3YzQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHNCeVBhZ2VTaXplP3BhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD0xMDAwMDAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781864),
('AR8ti8aCW5jQgJS4pnU0JvSRtfjVO5lLtDN1wziv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3BneWRvVmUzZkQyQjNQeFJFNjBmQzZXVGw0ZGc3TXBraFg1OXpZdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781880),
('b3JPlNps6Q82qqwS689T1kaFGRZ2MhjsvmVsH0yF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2p6UXdnMlRNd1NaR1kzbXdzRzBFbnVwVHVNb3l5TzFqS0FKd1VQMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781841),
('bDKNd2KElBw4JT9VgbiPfXLZKa7wm4maMkzeijTQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGd2WlJkOHllS1doMjRCM2E1RFRxelZCck9mRkxVeFBqWDhVSkJUTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780318),
('c5dhgt1biBXTqNo6hUCd6P1Jp4QO66z89siYHPCW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODRGN0hZNE9vSzBJT1V0aVdYNGVVNm41MXdzb1dmR0FCcGFUOXdmRCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781994),
('Cby7LbcGfnBQTfcGfgEJssOtglBNMy9k4FZl4opd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEdWOVNuVFpQaEQ5T1FvYm53YXdTZ3pQQ2ZvRmtUSHI2U083NXNBbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783778997),
('cTeT4oNJW7IM6c0Ja6tqKXfd72ti0q7ZMajymsqj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTENZd3o1OHB6QkZ0RlZlMDZDUHRoYVVvNFBuVTRQMVM4UHJxRlVmUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781863),
('CuSBCCGTNYGbWOzZGi1hab9uPhIMXLru1hVbTaUU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZDJvT2JESWNLZ3lvWFlKMTFHOXk4VXZsZ1Y1S1ZXTTdUZzdER25xaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780876),
('cUUy6ThGjAaMses6b3jOXKOPhDUyPmyro4JPr8mC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiazZwc29vZndCMFlDNjBNa2hNMnY5QmxRM0M0TnU4VGtVOUQzRUZ1NyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781840),
('cZsIopuYjBsoHPmykf6ctmWXhWhXsBt9fof6h63T', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0lDcGFaU01KSGl5QmtuM1JBU3A2cjNKQmhPeE5oZ0wzQllDalNVQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781434),
('D5uBnlnN8X7TtrikwjGmHdDrA7fIhcBAFJ6onlVB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlZ4OXc4QXE1WXk1TktOZlV6ZnlsZ0NyTkxtM2k2MXFaZGRpRGJzViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781645),
('dCCqqrj7i4Vetsx64hCApCwIJiHa44IIgRt0txLZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3k0MTVEcGIyY2tweG02SzQ1dG53S1JQRUFrbEJwYzRINDdSZnl0byI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784380036),
('DF682ZXEt1GDw5EpW9QBfUOTHkpamPkhUmZTvrVu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWG55OHl2Z3pjYmlCNFZjZEFJaUdlQ25vUTBONHdGbzEwQ1dhOFZJWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781101),
('DJOzE8IVFdtvBMEH2WIZjQ223ceZEA1ZSo7qrRSK', 17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnVxWjM5RU9sOWtsVVJEb0JPZnlkYW9EVmN6OTQ2NWx5bUhTbk5ydCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYXV0aC9tZSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783778998),
('DQzEYbqdjDPqFLbNfRciuGATYwGNrP9ZxFTNAKaF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzd6V3prNkduMGdEeENIMzlHbkhkZHgwOVBOdlB4NFRRVndDTW14biI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb3JkZXJzIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781868),
('DS8L38ONTJcKq7lxXbXNxDu0pJZnVHrIdC1Si6mj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjlndmg1ZkNhQlhnUDBKYUZEanY2Mno0NGVMdFB1QzFta0c4T2pPYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHNCeVBhZ2VTaXplP3BhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD0xMDAwMDAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783779004),
('ehrBfD4N7ZxzkJm4KJOOGo0yIlcuUlhVcLhP438c', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibE5CekkwazRBU09JTFFHdE9lQXBWc2I2ZmNyNGRHMFZURnhmTlF2SSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781994),
('EkaUjtOjeU1LTB2esizWDxomKWB4g7dxxmcc8qoj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGRhMk5JZHJuODBnVlh3d0d6ejMwMjZHTDFUTWJxQk9hdlVubUpsOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2FjdGl2ZVByb2R1Y3RzQnlQYWdlU2l6ZT9wYWdpbmF0aW9uJTVCcGFnZSU1RD0xJnBhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD04IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781434),
('fyOH8uB9DGgo5VpRuBTsXixBxTQM1lQi87MLQHTm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXBuVGRFbk5vN2xMQXhPMXJRRkl3QXZsRThSV1hpSUNHOGRxa3p4cSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781851),
('G1LaNBcaXxrJWLii5GGOjyPVegv2FWq7Hl83FmJB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibG8yNmo4MDJSTWV1Wkdua3QxaTR1d0o2b0IyZ3VXdWNwSGd6ekpmRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781851),
('g55Oc7EpqKCeGIvfiw39eU09vAsonx3bB235BkJo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3RWQ2RvbkFmQThyaUlRbFlDUGpJa1JkcTRJcUdUYUNUZjhpMkptZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHNCeVBhZ2VTaXplP3BhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD0xMDAwMDAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783779004),
('GANpKL7DVeZMm16IrycCvAL1uLrXkmpeoYZTFiYy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzZteGw4QmZBUDNVdDI3VkdhTGJTR0xTd2xhOEVpZGRJZWZ3RGgzTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1784380026),
('gCjTdTBdEiLXKk8nfd9wBiiegN94I6SHp8LQrg4O', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0FiSzBMcDVkY0dTbHBFOXRBRHJOcE95RkJGTk1QMk9tUWhIMkEydCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781782),
('ggwoKFdEhoU2piwEkgb2fiX8dWgYbXfGJipFXq3D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWt5MnlTbDlOWTVReXZKS3FLY3VuRU56V2Q0RWcwRjRJdUZrS3J2SCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781994),
('gy8PcVx03meby7pNyJu22Qpop6SH9x8qlnU6LLRa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDR3djVzV1IzNFV0TWhuVFRDVTZESllvTUZYNEhmUVlkYTdNV1cydSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783779007),
('hNxReuAFIJ4YHekMNz6Tm16nzOVLjMCXQiukBLA5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1k3cmRNSnZuREZ4eGM0NXl4Yk1QbGNReTRVOFliY3VUeTBhRnVYVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHNCeVBhZ2VTaXplP3BhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD0xMDAwMDAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781863),
('Ho7cWjhChntl90lsmiU2oW9lxmkaJAnurwVGj2op', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGNHMjZPaENTSlYzRVFlMmdVSEV6YkxIVFhoTDZUT2Y0RUxJZzRXaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781865),
('Hy1bvWsXEqDFXajnhmbB9l72XEPAPvBFcM91DVrl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVBETnZvUHE5TGZzdkdsYkVjM0FZNkVjSTg2NDlKMFRLb1lBZ0RLNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2FjdGl2ZVByb2R1Y3RzQnlQYWdlU2l6ZT9wYWdpbmF0aW9uJTVCcGFnZSU1RD0xJnBhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD04IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781781),
('ikrQ9iNd6dXH2aYASKtu1BVUOhPo7IXRBd0nDLSC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicElBc29DZE1YZEdwTnpSRjM3NUkyN3NZRXFOWGZBWENYaDVsN2NHNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2FjdGl2ZVByb2R1Y3RzQnlQYWdlU2l6ZT9wYWdpbmF0aW9uJTVCcGFnZSU1RD0xJnBhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD04IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781435),
('ipEwToEc5NVm33wcZapBgGRlzVsLXPZygaHe05jL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjgyVm80Z0hoZkxTaGFTQVNtOXMxU2NuNTFxd3ZSeUNIaDRZMGJQRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784380026),
('IqfYMSAAqZqTDmzknQWqwXxoWib6s3q9cU9Jh6Rc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3Mxd1NyS215UUs0U2ZiMFQ1RXlJa2hGakJCOXRvSmZTR2RodmhGUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783779824),
('iT21BUBnbD105GBSrhzcExpwOicSJYe3I0ATFsMV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGdmNk9vRDdlcGpHVTQ3dDVHYlhrZmpYMjBEWDI4SVloOHVRZU1DMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781782),
('iU3dBY734zT6YegaKMghhn6tzoNAtzdatfZVHzGY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0RvcVFhOExmRVRJRnA4TnpmYkNSUTZwZDJyWmVYcDlQWmhBRGp6dCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781840),
('JrdD6KKj4DTN9Y7uJbbf7smcKPmOXo33E4z1oWfl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjViQ2tHek91M2cyTVNpSFR1bzY4cGtFUmhyRjdlUm54MVpBeTNSVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781851),
('jU3ikuBXUG68vxW1hSzZ2Pw0iMVn9wm7GMlplInB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWpFUkpraEZsYTgzWEhMQXZwVEs1MzFWS1RTdnNlcFJSdVFmR1BjOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvYW8tc28tbWktbnUtMSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780839),
('K4lVeOdf3FmGL5P8D9WS6HVhKXx8iVSlwz5f0cKW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2toMllvUGhWOGpOcHlFbDZHcktSeTBEeWpWTkJEUGZXcXlzbXZFbiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2FjdGl2ZVByb2R1Y3RzQnlQYWdlU2l6ZT9wYWdpbmF0aW9uJTVCcGFnZSU1RD0xJnBhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD04IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784380036),
('kALQ5uAAUwT5jLR29lzhwQZ7Z26QWPFk8EjFqr70', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGdUMHZDbTBHdVlLY0txRDdhR3BpQk5hUHBCUE9Tajl0NHlSOHBoaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783779824),
('knxShrnP931aHLU3QEtGtgO0rQERwmq4NZDGez4S', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXBZeEFoNGlNcmpRT0VUMkhFQ21oejJxTDRvOWdhU21kUnVSV0hqWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2FjdGl2ZVByb2R1Y3RzQnlQYWdlU2l6ZT9wYWdpbmF0aW9uJTVCcGFnZSU1RD0xJnBhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD04IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781991),
('kokgNNPi0eIEkC1vutkTHgTnxull8lE6eQNdcGm9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzhIZnBKNFpPTVZDdVlGbERXWTBETjhidlBqM2h6VDVmT2tDVXpCQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781046),
('KZd4vgS7N5yC3ovZRObA14F8XkslTnPv3tRfv4ar', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1QyZUdKRFlsRUtReE00Nm1HMFJFdG4xNG9FYzlSR1BvNmxUbnhtTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2FjdGl2ZVByb2R1Y3RzQnlQYWdlU2l6ZT9wYWdpbmF0aW9uJTVCcGFnZSU1RD0xJnBhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD04IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781991),
('L57jHmIaIGRb4pdk0a9IBjCmlOLNTVvem6nYkJdt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1B4SklCcnJFUUxDNTR4bEFlU1R6U0Y5dVlYRE0zVHY3ZzFUeTZBMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783779004),
('l8ah9aGpkrwUUcuBTVeaEuUVVQQndSXj3MSB8Z7I', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUp3cXFkaEVwYnpiTkc3UzY5all5SnlUdE5JbVhSU254aFBpTkJKRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780806),
('lrkz0LHxEBmuQGpTCyiXZY6QoI4UxHCse7sskCFH', 17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGdiT2ZVd1NZaGRLVHhOelM5WHpRN3R0Rmp4YUk5bmtqTVczQU5QaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYXV0aC9tZSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780820),
('LVgZtPllmhk9gZxwbcyO64Mmi0QI3bg21UHVWpZu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblQzUUZVWDNxeDI0cnZBZ0I5dkNNMW5ic1VMMFo5ZmJVZGJlUDZQYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781046),
('muujvohHruMKkrPaZVBjlPHwWUt9c5JKWYvsLrxa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGRMaDc2QnhJWlNROVJiTHZJTFZDZ1p0Y2ZCN1hZa09ycHY3YTRGSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784380036),
('N0n3eiOXwE5AAgCIJGIEpiljY5ZFAli2CJcggyfy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlJnU3ZlUVFjbTQ4NHFwTUZOa0EzeXAwWXJhQmNoTnh1SjFNZDZEQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvdGVzdC10aHUtbGFpIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781061),
('Ng8NjUArfQp1Q2D2GIV0MUUZsoar29Hpat8hE1Ux', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNVQ3elV1RUcxTmltVE0wSWxPdXdSc0xUYWg0Wkg2SmxpNUZRbHBmRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781041),
('NT7AyZeTQfkx8QTgxLONn3mjD1rItkehod1Qa4vH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTFVbkZZRlRPcjRmcWREZ3JQaVpjZDg3NERHdmpOaFgyT1JnREJQSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781781),
('OkcfgXBFv8JtLiqS1GwUPpyVxkjSrL2th8xlpfWb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlNDZ3lMOUROZnhuaUhRYXhKeVFwZWY4WkptMmQ4UTBtZFRpdFdTZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781848),
('OKoU0WFA4EAdpspYPZGWLH50kdLryefmgtsiOvlT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUJ3d0Q2WGZyMElDM0JkT2UwajVqa2VjaEc1cDE1akVwV3Z1ZDNJdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvYW8tc28tbWktbnUtMSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780840),
('oOcP6dbzU3hHgnbwbQJuee2KaqwINsZpE7vZp82Y', 17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVdhR2Q2d1NsQ3NUbXJwUGJaUVRyNVcwdzRVemxoNWJRVmg1WFJGbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYXV0aC9tZSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780315),
('OtmwW0OeVW6cniiW7Q07mJeGsJo6hPAnHEBZWTP0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzRnWjVCSGRkSHhycVdtdXp5bGFqWTkzejBTQWJrRWw4aXpNNjhsayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2FjdGl2ZVByb2R1Y3RzQnlQYWdlU2l6ZT9wYWdpbmF0aW9uJTVCcGFnZSU1RD0yJnBhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD04IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781437),
('OzwrxpinhaowkgPZ3zXlavTO6HZL9MEusjGpPLdY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk42YVV6ZjR4cmZXWTd0b2xhcElkR3NFYm1vRkE0WlBNRFE0UnByTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781991),
('P12xwVSXV0i5nNgOwPKjoSAwUv8viMja6qr0NWMh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzB1alN5U3pRd3A4aFFNaW5BZ3dWeU1ReVZ0UDh5b3BBc2xqaE9CaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781879),
('P2CC1n65Bqm4AjO5JDwo1U3ffF0E880GszFB9xT1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDZPSDNkT285c29NOTd4Y3FDNnVPYWsxeFEySUFEUVZwZTRXSlRLdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780318),
('skAOPNOv2iyxHY78UvD68LlRKsxqpncMcMqDwTvI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXk5NVl4eGQzMW14SVNWVDlqOEFHdTVvOG9UZTVEUXVhOVlTYWRpeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781840),
('SONl5DPEcp0ojyaYa6XKCeC97awCxnWJWCQdT79Q', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGx4M05FUHlwM1hFYWRLVGZBemFjMzFpcHEycGxqdG5td3Q1emZaYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781443),
('sqUrRbZKL9n9wLK5Ypklk9s4auIBn0GmVdHlD021', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiempiMU92a25UcWh6aFdVRzFFdzJ3aTEzMUtIRjd5cXZzVXBRZ1NHOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781851),
('T8FoZvozeMCxiRS8HAZbC1Az860eL6VH0pJbuR3M', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFJ1Y2liOTdtb0VYM0pRTjBOdWFiTXMyVDVQb1RMNGE1b29zdDRLSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781994),
('Tj3P1J2HktiCsEx1dcVSWOlr2teeGGpeGZwSPiRO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXIwd3dFYUg2N0RQWDNDcklDTFFEVEM2SEpreG9BOHVvaFpEbldWTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTQ4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2FjdGl2ZVByb2R1Y3RzQnlQYWdlU2l6ZT9maWx0ZXJzJTVCcHJvZHVjdF9uYW1lJTVEJTVCJTI0Y29udGFpbnMlNUQ9dGVzdCZwYWdpbmF0aW9uJTVCcGFnZSU1RD0xJnBhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD04IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1784380040),
('tUuBHLKRwa7AiT7BWdMCxR06Zt9swcvoa9h741wZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0l6djJvUnJVR0F0b255QTVybEQzRUFuY1dHTXdWY2pScHJKN1dreCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2FjdGl2ZVByb2R1Y3RzQnlQYWdlU2l6ZT9wYWdpbmF0aW9uJTVCcGFnZSU1RD0xJnBhZ2luYXRpb24lNUJwYWdlU2l6ZSU1RD04IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781780),
('TX1eeFaU30bLZ6r1dRDWbmbsSJWLELlkVpJceB8n', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXJHU1FndGxTNUdBYVJYRmhZWHNJOGdmRHo2Q0E1Q3RDU3FkWXhCUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780829),
('tZEgLflQ2LymHc2Mgy59077aqGaSFaYAX7EKyIYO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNm40Y1dOazBWSUpjSUVDVUt5bnVHTnA0ZE1mVUVQS0NrYmFjZHJ6UiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvdGVzdC10aHUtbGFpIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783781061),
('TZPsWV1gTdMlb3z6cHNlAcLrrJSzHTOOS1evTP77', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZklzWjlMb0xaZmFTS0hJY29LdHB3UWs5eGxCQnRUYlRlR0cxaVBqOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781783),
('U86U1Leao3u57oOA6nvSSd81RAxryRs9Z5xjiy68', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnpNTWUzTGduQVlxN2NobHphSVY4c2pGV3RpVkNKRks1UHRadU41OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781841),
('uJSudgzLv12Z82sgOQMapIGXbIntzHXXzKF0cnVj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnNLMVVhcG1DWTBTY2dGY2t6VEpDTFRoYUw2cTg5cHpUeUNqUlNSaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781443),
('uOyVUd0zsYu4dZk7nhmoEqxlCTgKDPk5BNr4JBGa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGFKNHdsMkZvVkhMSzlEQ25UbkZ3UkxMWDhKS2hPTnJjeGd0eE1nSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781780),
('UzB6XtfAlceTw24sSgh6kTblHpkKZfxnZGZnH5q6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicG5OWmllZElVVThsZ1hQN0t5emdKUGlHbmlSSnp4TG9LckQyUjNUViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781851),
('VMfROPltJNhtk8gtBlO8iCWKTaeNvuaymXHPwCpV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUNwTFFPeFNVQ1V0amNwQnZ3YjhZQ1FoTThveDRsMGtqTjJReExLOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781645),
('VvHysfg1QD6kQ2KOdfkq2DJJpuio7hJFomohVDtS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVpOdjFJRHRyRTZRaWtldlNVV3FaRzRKcDJ3c05Qamg1VmtTWGpIOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1784380025),
('vybaLpm6BCgL7bvnlo5sghjqAquZvP8dnYb5IwWV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaERSTzRuTVBDbzJCeE9sOXVTTmhDam1LbWJTOFlxWGtWdUpkZm1HUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780867),
('WJBfKmMzQ6p11KZw0ToNanPF7cDsM12jXKAxSUnV', 17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2pTQWRPaUZ3YWRvejNVd2pleTFTSlQ0eFFRRDdENVM2Q1E1MHdvcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYXV0aC9tZSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783780649),
('WKMoYUO2fCl9EGGZ0s9SpSrRvUkyz24rGw7li9gT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWN1Y3JBSzg2U05NemVMZ3R1SXZDNE83TE5XVnNkWFBXaHc4MWpGSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781645),
('xdBbKW8t2rpNwrMMh2GKNWxHBP1xB7hS9vp8wAvG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkh4bm1kbFMwNVJLWTRwcFRaaXc3NXh3dmZzakJER3R5a05nSHdhQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781880),
('XfdDA1yGQJ2Fj3BNeZBLq8joLFexHTLB4c4mMZS9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmFlMnZOeVBPaXE3WW50NzdsZ1l3VG9QdlRXN0ZTbXVtZTBYcFRNMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdXNlcnNCeVBhZ2VTaXplP3BhZ2luYXRpb24lNUJwYWdlJTVEPTEmcGFnaW5hdGlvbiU1QnBhZ2VTaXplJTVEPTEwMDAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781869),
('xRVe7MFunhe22nPR9r6bmK8GTBHSeutM4NUP3S9t', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajBlU2FpeW9YWTVYZzJLM1ZCWWdHWmR6WFlsbHdjbmRoRW40M09aUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781880),
('yDxvir8U7MpTGANXqBrHRy5gYhpVloDYb0dGTiYK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGxrdG1mS1VOWjhvM0tXb3g5bE5yaE5FUGJHZjducFRYZlZwMHpHaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781434),
('yiEnxWgLw49X5hBv5nkGEtsfkJMzzYBUmVJpNcWg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnI2SGphdWQ2ZkFXcDhMeTE1R3FLWXpNNXRLRWJiRk1mNkthcWZnMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvOCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781782),
('yXZyi0jtd1NL88IF7wBCyWwIdoiIxIh78X5vi5qH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzQ2eFR1RDVkNnRJQ0RndFVjekF1N3JjdW1jbzAwb1dZZ2FnYkhuSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783779005),
('zktRB82ugSwk8a5NxiWdYeWsOrk96mnJQmntI4WS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzF6VDdZdTlyU2plUXBEZEpsdDZDNmpRV3ZxOEtBYll6eGdKUmk0ZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783781990),
('zRS2touXLiSKR4MzRGuzK3bgFZkc0PpbohbPzHzB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0kwT2FwelVDWlRzMzBLeDl6Uk5uY25rYmNsTzBVRmRxVzluUnY2VCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1783781851),
('ZyIinV1dORhsmz2K7VSgyCviHgRFYJpBlfpRbDvq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1RNaFRmTFcyYjRXWkpmUEo3Y0RMeVdGUFA0VGQ3VEU5ZkVxWnRzdCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1783779008);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `phone`, `address`, `birthday`, `gender`, `image`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '0987655432', 'adsfas', '2025-04-07', 1, '1744790800_5-Ways-Education-Uses-Digital-Technology.jpg', NULL, '$2y$12$m8i1a9L6c9t9IDFt4E7XOO8tZcNWmzx8uaYgLTp/6TgKsSqksbJDq', NULL, '2025-04-16 01:06:41', '2026-07-08 11:08:30', 'admin'),
(2, 'doi ten 1', 'user1@gmail.com', 'user1', '12366666', 'sda', '2025-04-16', 0, '1745388097_add-img-02.jpg', NULL, '$2y$12$yEAeDEr4krUBRvRnrs98Zed/qmnZaTDGSs3VXQNjpnuA/32JE0sO2', NULL, '2025-04-16 01:16:54', '2025-07-08 20:23:26', 'user'),
(3, 'user2', 'user2@gmail.com', 'user2', '1234567891', 'sda', NULL, 1, '1744791543_add-img-02.jpg', NULL, '$2y$12$kBGrRRmcfka46oLcV009ZeyFVfKvB1SlpRlve/Yj4e1byImFgGJ0G', NULL, '2025-04-16 01:19:03', '2025-04-16 01:19:03', 'user'),
(4, 'user3-update', 'user3@gmail.com', 'user3-update', '1111111', 'dfa', '2025-04-08', 1, '1745291877_5-Ways-Education-Uses-Digital-Technology.jpg', NULL, '$2y$12$9TjS/waansRki7fKE.R.JuLQB1Dr5p5vpu2YkxIaPZzk2tHU3QXhu', NULL, '2025-04-16 01:23:28', '2025-04-21 20:19:27', 'user'),
(5, 'user4', 'user4@gmail.com', 'user4', '22889292', 'dfa', '2025-04-09', 1, '1744792841_3555a283393a8064d92b.jpg', NULL, '$2y$12$dvKW//PpPi.def/R8bV85ehBgMcZKEOsLznciLjJFzRT3hozqT5FG', NULL, '2025-04-16 01:40:41', '2025-04-16 01:40:41', 'user'),
(6, 'test_user', 'testuser@gmail.com', 'test', '1234567899', 'sda', NULL, 1, NULL, NULL, '$2y$12$Q6Du2vDpJVbpxZlYrr/9Mu814M3zZva7VylQ2tLK3JAaJIgSbEVkG', NULL, '2025-04-16 21:13:28', '2025-04-16 21:13:28', 'user'),
(7, 'testuser1', 'testcustom2@gmail.com', 'custom2', '323121123', 'ádfa', NULL, 0, '1745292048_2090be78a4d10d8f54c0.jpg', NULL, '$2y$12$YKjcp6daYirUANlGRGZPDOV0zzM7WFs08ZEtll2/eomlIkzSMosPG', NULL, '2025-04-21 20:20:49', '2025-04-21 20:21:54', 'user'),
(8, 'vczc', 'admin11@gmail.com', 'user111', '4534534', 'xvzx', NULL, 1, '1745387765_5-Ways-Education-Uses-Digital-Technology.jpg', NULL, '$2y$12$WG2UB7Pa3kZWg8pkLR2PseejgmrHDiBFHtjl15z0qtNYJwzRBrYUi', NULL, '2025-04-22 22:56:08', '2025-04-22 22:56:08', 'user'),
(9, 'fsdfa', 'user5@gmail.com', 'aaa', '4234231', 'sdfasd', NULL, 1, '1747183942_82a2dd231113a24dfb02.jpg', NULL, '$2y$12$TBiykC3nvV4VXWfAtk7bmu13nyW5XQIJNWwWsMYyOV4FHSv7MPJjq', NULL, '2025-05-13 17:52:23', '2025-05-13 17:52:23', 'user'),
(10, 'sua ten dangky', 'dk@example.com', 'dksua', '423413132', 'sdfads', NULL, 1, '1752021889_d6210e26-b060-4513-8442-115d1302ff31.jpg', NULL, '$2y$12$U9lrJsv9y2mnYUgK3vBx2.u9T3phok9W8lR0aLAzwvjATdsuEOr/e', NULL, '2025-07-08 17:44:49', '2025-07-08 17:46:27', 'user'),
(11, 'test', 'test@gmail.com', 'teeee', '3413121', 'adsfa', '2025-07-01', 0, '1752032650_8c83dffd89603e3e6771.jpg', NULL, '$2y$12$nwzzrXwzeQO4qQyIZlLQGe1VDalRvUDCMGGIqaAqA.MjEiLc/lNUC', NULL, '2025-07-08 20:44:11', '2025-07-08 20:44:11', 'user'),
(12, 'John Doe', 'john@example.com', 'John Doe', NULL, NULL, NULL, 1, NULL, NULL, '$2y$12$9kF6a9OxiZimD5yXXYHfG.xUS2axbvrDm/puqeNYa0Ew2xb19FDoC', NULL, '2026-03-12 01:56:24', '2026-03-12 02:02:54', 'user'),
(13, 'Nguyen Van B', 'nguyenvanba@gmail.com', 'nguyenvanba', '0987654324', '123 Nguyen Trai, Ho Chi Minh', '1995-06-15', 1, 'users/iUuJZfiTl1EE4oklWoJAle8GD2O4uH5HpLASZ5w8.png', NULL, '$2y$12$icRybpmkdOHHUaKOgBUpvODVUZUInbztCUc0wGecSI3GBjM9zAY5u', NULL, '2026-03-12 04:07:30', '2026-03-12 08:28:49', 'user'),
(14, 'Nguyen Van b', 'nguyenvanb@gmail.com', 'nguyenvanb', '0987654322', '123 Nguyen Trai, Ho Chi Minh', '1995-06-15', 1, 'users/wF4N0GrfBJY6co4zcHaimo2ggsdEhJrMqAJotEsg.png', NULL, '$2y$12$XCwtFefEW8mmS2HsAlpmNuQB6ycltHYT1kCLFHkrrTRNeqBro.ata', NULL, '2026-03-12 08:19:38', '2026-03-12 08:19:38', 'user'),
(17, 'khoa', 'minhkhoa070406@gmail.com', 'khoa', '0932390247', '123 acb', NULL, 1, 'users/qx3YHDSoSYbIWfMCIkICEJuhEt3IcJVZrDuISOpb.jpg', NULL, '$2y$12$BsEV.1V3fCLMZXgPbsHhTuYfe4p4X7ccyjOCT6Bi.VNGYGX6XwvDO', NULL, '2026-07-01 08:42:39', '2026-07-08 11:07:47', 'admin'),
(18, 'khoaAdmin', 'khoaadmin@gmail.com', 'khoaAdmin', '0999999999', NULL, NULL, 1, NULL, NULL, '$2y$12$8FJoUB/w6vJq3/0g8wU8VeaOr5v7U3Bf6NPdJXa1ZhV2H9ymocHum', NULL, '2026-07-01 08:48:39', '2026-07-01 08:48:39', 'admin'),
(19, 'khoa', 'khoa1@gmail.com', 'khoa1', '0', NULL, NULL, 1, NULL, NULL, '$2y$12$7kipslcqA0eQJsrz1bmM2OWuValO5UDFPpuHNkhUYt7DYgX7Sdc6m', NULL, '2026-07-01 08:53:53', '2026-07-01 08:53:53', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
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
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_users`
--
ALTER TABLE `custom_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_users_username_unique` (`username`),
  ADD UNIQUE KEY `custom_users_email_unique` (`email`),
  ADD UNIQUE KEY `custom_users_phone_unique` (`phone`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `menus`
--
ALTER TABLE `menus`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_name_unique` (`product_name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_users`
--
ALTER TABLE `custom_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
