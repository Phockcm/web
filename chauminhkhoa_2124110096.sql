-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2026 at 05:40 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_2025_v3`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` enum('slideshow','ads') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'slideshow',
  `description` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int UNSIGNED DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
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
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int UNSIGNED DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
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
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
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
  `id` bigint UNSIGNED NOT NULL,
  `category_name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sort_order` int UNSIGNED DEFAULT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
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
(53, 'New Category 2', 'new-category-2', 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-03-25 02:47:25', '2026-03-25 02:47:25');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_users`
--

CREATE TABLE `custom_users` (
  `id` bigint UNSIGNED NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `birthday` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `created_by` int UNSIGNED NOT NULL DEFAULT '1',
  `updated_by` int UNSIGNED NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
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
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` enum('mainmenu','footermenu') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mainmenu',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
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
(41, '2026_03_10_104946_create_personal_access_tokens_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `status` enum('pending','processing','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
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
(8, 1, 2330000.00, 'pending', 1, NULL, NULL, '2025-12-25 21:28:57', '2025-12-25 21:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `qty` int UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
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
(9, 8, 8, 1, 10000, 0, 10000, '2025-12-25 21:28:57', '2025-12-25 21:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
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
(13, 'App\\Models\\User', 14, 'auth_token', 'e67460b04f36cff5bf9ca65c130076b6db75ef793df0f2d380262bbca7da529e', '[\"*\"]', '2026-03-25 02:47:25', NULL, '2026-03-25 02:14:33', '2026-03-25 02:47:25');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int UNSIGNED DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
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
  `id` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_id` bigint UNSIGNED NOT NULL,
  `brand_id` int UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_on_sale` tinyint(1) NOT NULL DEFAULT '0',
  `sale_price` double DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0',
  `qty` int UNSIGNED NOT NULL DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
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
(11, 'Đầm nữ 5', 'dam-nu-5', 9, 2, 'products/DM2.jpg', 2342, 'fgsd sdf gdf g', 0, 0, 0, 11, 1, NULL, '2025-04-03 23:50:15', 1, '2025-04-02 00:57:16', '2025-04-03 23:50:15'),
(12, 'Áo sơ mi nữ 1', 'ao-so-mi-nu-1', 13, 3, 'products/DM2.jpg', 299000, 'mo ta mota mot a', 1, 199000, 12, 10, 1, NULL, NULL, 1, '2025-04-08 23:59:13', '2025-12-27 21:26:35'),
(13, 'thêm sản phẩm mới', 'them-san-pham-moi', 8, 2, 'products/DM2.jpg', 42342, 'sfasd', 0, 0, 0, 32, 1, NULL, NULL, 0, '2025-06-24 18:14:22', '2025-06-24 18:42:48'),
(14, 'Laptop Dell', 'laptop-dell', 5, 1, 'products/DM2.jpg', 15000000, 'Laptop văn phòng', 0, 0, 0, 0, NULL, NULL, NULL, 1, '2026-01-15 02:20:10', '2026-01-15 02:20:10'),
(15, 'Laptop Dell 3-bonus', 'laptop-dell-3-bonus', 5, 1, 'products/DM2.jpg', 160000, 'Laptop văn phòng', 0, 0, 0, 0, NULL, NULL, '2026-01-19 01:30:06', 1, '2026-01-16 01:51:39', '2026-01-19 01:30:06'),
(17, 'test update 2', 'test-update-2', 3, 1, 'products/dBRFnHzHgfPzZ77QLVJzypDgUPXtoscmZgkSuJCy.png', 2000, 'aaa', 0, 0, 0, 5, NULL, NULL, NULL, 1, '2026-01-18 18:40:15', '2026-01-21 23:14:29'),
(18, 'test upload 1', 'test-upload-1', 4, 2, 'products/LQhIxrG54CQSuQpgB75l449qdnV3japr6ornPPNW.jpg', 3000000, 'dfasdf', 0, 0, 0, 0, NULL, NULL, NULL, 1, '2026-01-21 19:35:41', '2026-01-21 19:35:41'),
(19, 'test upload 2', 'test-upload-2', 4, 2, 'products/zbOPqOweZ3qnoqlu7EZ25QhUsQBxeyKGlg9Pk8VJ.jpg', 3000000, 'dfasdf', 0, 0, 0, 10, NULL, NULL, NULL, 1, '2026-03-12 20:55:30', '2026-03-12 20:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `updated_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0TjGpGKNSkHE8P56s1H5DHotGbzy74UBLrkCQeFU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkxzMFVRdlh3WWpYNDM4cEtUbzFxdnpnZ28xb3hMWDk1QTIxV3dTWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2hvd0RldGFpbHMvYW8tc28tbWktbnUtMSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583280),
('2kLH011fq8cSmINnTDxNWTEIYwCEmTIKpYux3awr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTllOUjlTb2JZR1ZqbVNBekdZWmp1SHBwenJoOFJtNlNvTGNJV3VGWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvYW8tc28tbWktbnUtMSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583956),
('3EJy4xI6F3YC1kXaC9HpcnYK5ellOV2dhaji3kKC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGFQVURocnBQMG1wbGJaU2w5N3pwTlJmYXBKMWNkV1N5alcwYmt0VyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774580929),
('3keWY1GDHlU8VRMBpHoOaN0EoZv6bHVUFl7xstzl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGtoa05GNHZadkswWVBvU2EzdUh4UVFKZnR5anVZZlBZOGxsUGE5ViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583278),
('3yudO8sd7CeXrobQH8EltsMHtR5pz7rJByfoFkyC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWhrV2xRZkw2SGRuS3RvUVIzam5WRkhXZXlzeHQ1Y3BOaWpJTk9kMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583993),
('5b4qzGeHTYrCV7XN7zpcdJDYA7XHbgg5Yc22F085', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0RjS1BlV29lQ3VBRld1ekxheFF1SHZOY2kzYmJyYm8wZk5hanoxUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774585055),
('6P0KmGaLhiq5WzN42W8jx2eebWTQXjammAwTKiVY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3lMT2didFVodTQwQnBLTkVyc0pNZEo1akloUll4bTlNeGtxTWpGOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774576362),
('6zM8dBV4zKjlBgRZYdUyGVMsgYm9jO8AZIJxM0uZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGlZcG91Q0pLeFNjYVl4VGNXVnN0ZUhydnRqVTBCc3VxWnc3a0lsMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774583275),
('85ICq59k954HYAl0UftHBjvzMbmzUcQ7lNQ86H2C', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzFDNXJPVUJvdUIwQmh2a040RElUelJselV4N3phZ1RIR0tGOU1kdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTEiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774585056),
('8BP9WTKaF6mOmgHveRJwbwWzBK3GSQOCZIJAKKi6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlNOQ2dzektNNGFSd3lhenBUNDZya3AxMUd4R0VKRE5XU3BtUW1RYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2FsZVByb2R1Y3RzLzQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774583278),
('a5MyxxC1WEZvbITiymUrdQ2WNRZ96wPfckPHETcM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDUxRVZVNnEyVWU1VkgwR3RycHEyb3dPbVZNUjRmbGZkZUVqalNJNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583993),
('BeQDf6YN1CMyoAOHMKuNn9Ao2qhcnultK72Gu4Ct', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT203Z2F6eG5jUVNGa3hQc2REeHFEc1NCbXBZc1lDZDdnUmU1aVlzbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2FsZVByb2R1Y3RzLzQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774581916),
('c7TYDb75VVAz18bfSEloUySDjG5s9KGbfPXEtFp9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0tOODY4eVBleG1jY2ViOFhhaVZsOXRGMHZHMlg4T2l3YUNFNVBIcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbmV3UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583278),
('CQ1PsOGfxNCu05hwsvJ8uOFBO0U0eenhKRySU5DY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3RXaVg0eU1ZZGxOaW9DVzBRZ0pBZkxJOUdlelg5dTg1NEtRVmljWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2FsZVByb2R1Y3RzLzQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774583279),
('CZzSX7XuNUORFnbznYMW1B9j5OSBUGUKbe53mXU4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnhZNTJVejR3RVNRUDltUjhqUjgyQUpSRXk3NXhhajJSNGZBQzk4dSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774583177),
('e03jzYpxvaZQR8O61z4tLjpxlxttv28KSaKDrKGs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0dZSklLcEFrMUpUaDdZM3RJQUJFRGVEUEtuS2NrZ0x2akUzYUxGYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774583241),
('eAaZca2ka6EXTb7BrTIxScLf1e9QZdVYAVM2UeBJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDlFcWVvbkhpckNxenl5WGdLRTZZd3lPeWYyYnlkU1pOZ3hhaU9SWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774585050),
('EHW7fjWGb6rbSuK5Aohd5D5gim6Rs3wall3cZb5v', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3RIY3lHRk54YnhZd2pVR2RzZndhb1pLY053YUpFYUtzS2g2a0gzZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583994),
('FRR0JaItuHkRDBnF9wEIBgESGIBvOyJVgRx5I6Wy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEpoSmRnRFY0UjNtNDZscUg4MlBmNk5JQmpaajZzUURrSnlnMWlZZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774576104),
('hp91887mr7mLs6a93hAuroJbFEj40Nym2sN2W7Qc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGt4UGpKMHRPdmdTWWpQNDU4TFBpRVZDb280Q0JNTlZkQUxXemV6aSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774585050),
('jz9Hwl1KRN8bysm0lzzRtFcCJlLLwtw3Of1JZtTm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkE5YUduTE5vSEdaWTFRMWZkYm1mVE5LVmFtZXpKb0FJTGhyckVKQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774585054),
('l6TPTLmiHEuZZ3NbC0CP4ZmmPaZYdItGO9kmsqmq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1JPV1h0Sm01eElpaGc4T0JqNVhRZFFHVkZQcWp4NUN5VGdLNUd4SCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774576290),
('ldtgKUdFTO0wjn3gMKUeGOo5cctyYNiTiyLNXwbm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3drMDBtbXRBbUoyNnRQU29RMThGc2VtN2hSbmhXazRVWFBoSGdMbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583175),
('lEHn8UL3NaIb1IvWNdaHdTw54QjKDQ4C8BU1Mihb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDhjdlVaRDJmazJLa2ZiRDZHZXlEOEpBMFpaZjBZN3I5cDJGdGRpVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZVByb2R1Y3RzLzQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774585055),
('LUj5iW6eU8SQRYio2rXtA0a1WHXN7IIXM268yvNs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0RXV24waTFpZlREbHM1MjhSeHFnNjZ2a09qaXlNQVh0MEF6UTBPMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774583178),
('mwhGjQfUfOFf4bRTzOJP700qOldABTlieuptIc8T', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU9CU3hFeU1oVHRWWkN2cFptNFVLb1JQWmwzRzBiSGVmVURGblYwYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2hvd0RldGFpbHMvYW8tc28tbWktbnUtMSI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583280),
('NFOmZB0pQ7525GOu2crRsB4oQJOUHxmVW7AYphq0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDNIR2gzWUZ1VEk1SWZSak1XdEd0UGxmczlzdFVJeUduQjNPYmZ4eiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774581624),
('nMvKfP6mUzsnzwQeGmBQkReiagzjad9EqZDyASC5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieThuNlYzcHBCY1UyQ05WaDl4RW9qdm0yVE9Bb3k0UWVJbzJZRUtXUSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774576274),
('P3fLVv4MS6Aps8ugGnKJSlwK2qQSzhAJs80oZrTh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2ZvS3cyT2taZlQybWVCMUNHS1RJQ25VSks3UFZYMDZ1UG40MG5sUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbmV3UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774581780),
('pBICv0R9K3sBISlD9w2bTpednSxbKTbVMiO0EFHw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmVzemJlZlFBOUROU3Q2c2FZc2pRQTYwb3VZMWdmOHk2VkhJTXNrSyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZVByb2R1Y3RzLzQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774585055),
('PzHqNoLlLzwUYIi2rBMl8S487XXggJbsG004eWZv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGpmN1J4ODhHS013c3NUUno3R24yZlNYVXNHRjV5NW5OMGFvTmtVWCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774581551),
('q4zlzf8EK0H8ppxr4ZueQv9pme84vLkaoThxQjwr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZk1wZ2FPc3RLT1ZRc3ZtYXE4NVJSQ2NIV2hVTk5hczYxOWRMMFJxZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774576829),
('Q6x7fyLy1B26lzYMVl4wZ5TIy5OteFnnMiK5H0HV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjFOOWRwR2xMQnR3Tk80VU9HT010bFBUNjZCNHhXc0hva29OM3pqNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbmV3UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774581917),
('qoAHA95s2F8WrUtiyoCrtgU0eSH0MZBm2Ar7DXwi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickQ1Y0hsb2c5c2d6ZWZmeHkyVXJUM1U5Y0lFUHFGQmdCVEtjUDd1ZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbmV3UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583278),
('QU1ng9MO6WOiJ7SJzSXCl4UKgQH6DFtQIugcGdMI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTNPY2w5VUVBRXpINUMyTHVkdmVRbVRDYTZYdW03MUE0NmpKQm1vTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774585055),
('RpZQewMS7MzaBZ7UPYqBdcduaMVGnO5YOuHDrnJQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGNGcGNrdWdpcDBnWnY5ckdpT1BKN3Y2cXJHQVBhS1MxSDNJcTI5diI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTEiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774585056),
('tbxvUSb8cdiPuXU33DNeFDL7gyfb0pv1nnkpXRIa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZldXbkc5OUJLb2NhTVdvZEJ1ejVjUzFWdEhUVmMwY3FqTnliNk45YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZVByb2R1Y3RzLzQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774583993),
('ULWesbSy0EbSUervf1WNQHIRoLQMrWOR9k6filOx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXRvTVhkWEk5TTNZM1FhNGJCTnc2RTlrSDhzcm9JOFUwZWpXa3lueSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2hvd0RldGFpbHMvZGFtLW51LTMiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774583265),
('uZadR6UGcB447c8njG6QLt5QoLR1OQCX4suAsiPZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjFlSHBtM1RjSXh4QlkzSG9hMDRzUTZwSmVWSlFLVUlyamprZDhvSiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZVByb2R1Y3RzLzQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774583994),
('V486aeDHeKxttOpMipttcvIl80RXp7jqyiALJklc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3l1QkpnS0I1NHB3MklSTEZqNkNyYlBWSFVmWVdVM3hTaHJGU3dXcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774581916),
('wwYCf0b9oWynlOSr9V07SmJO9cqY0EguhF4I9tNt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjhQajVDV2R4U2ROb2FqV1NtQjFHVm5yeW5sZTI5a0xHb0FMVVQxRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583277),
('Y9bjY5Ugqs7OLj3zUTyRQ4O69dhpEwMIcb43JlmZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlJtRE1iQlBSb3YwZUpwT3dlQVUzaVc0NnNNcjZ2WkVuR2p4SkxuNiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc2FsZVByb2R1Y3RzLzQiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1774583175),
('YrfshRRfS8kDNhj8kNx7rS3bC71csJTpKWSJ6vnS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXRJdFhyWWwyRzE1OG1oVDFoOEE1TGFuVDVCTGdiRUh4TzZRS1BsZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774581551),
('YvArT5VvZi1hWoruLNm8VrtlvWaV45ZhQpzuXMzs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3pSZzRZaG9KdWJrTjgzWjBBS21WOUlpUFBZMHhGbXdlVXVsMEJBeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583994),
('z8CdyZ9EspYdgLnV0cwY6qyU9Lkg7gudakirrrCJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjJmR3NSNUxqdWdKNjF4ZGZnb0NKMzhjYnpNNG1oZlBUOXZEMlRrQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaG90UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774581780),
('ZH33bU6vXbCKbp1LByyuPLRMrcHJb83MLjv64tg9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEs4N0x3WkZpN0dSbEh1QVpOY3l1bUs1S2lhRGJJZUFNUWtUZjU5WCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbmV3UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774583175),
('zOhMhPN7TwRFyTFviR6RfZouSOYICZFtvXPbuzrT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2xJNGJGM1V3dVdyekZmRTRDU1VFd3B1R0x1Z0xCcVdTQjB5YkhuVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbmV3UHJvZHVjdHMvNCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774585054);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `phone`, `address`, `birthday`, `gender`, `image`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'admin', 'admin@gmail.com', 'test_admin', '09876554321', 'adsfas', '2025-04-07', 1, '1744790800_5-Ways-Education-Uses-Digital-Technology.jpg', NULL, '$2y$12$m8i1a9L6c9t9IDFt4E7XOO8tZcNWmzx8uaYgLTp/6TgKsSqksbJDq', NULL, '2025-04-16 01:06:41', '2025-04-16 01:06:41', 'admin'),
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
(14, 'Nguyen Van b', 'nguyenvanb@gmail.com', 'nguyenvanb', '0987654322', '123 Nguyen Trai, Ho Chi Minh', '1995-06-15', 1, 'users/wF4N0GrfBJY6co4zcHaimo2ggsdEhJrMqAJotEsg.png', NULL, '$2y$12$XCwtFefEW8mmS2HsAlpmNuQB6ycltHYT1kCLFHkrrTRNeqBro.ata', NULL, '2026-03-12 08:19:38', '2026-03-12 08:19:38', 'user');

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
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_users`
--
ALTER TABLE `custom_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
