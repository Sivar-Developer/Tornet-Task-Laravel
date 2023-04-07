/*
 Navicat Premium Data Transfer

 Source Server         : Tornet Task
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : blog_laravel

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 07/04/2023 13:29:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` (`id`, `title`, `image`) VALUES (1, '{\"en\":\"What ever\",\"ar\":\"\\u0623\\u064a\\u0627 \\u0643\\u0627\\u0646\",\"ku\":\"\\u0686\\u06cc \\u0647\\u06d5\\u0631\\u06af\\u06cc\\u0632\"}', '642ed46802794.jpg');
INSERT INTO `categories` (`id`, `title`, `image`) VALUES (2, '{\"en\":\"What ever\",\"ar\":\"\\u0623\\u064a\\u0627 \\u0643\\u0627\\u0646\",\"ku\":\"\\u0686\\u06cc \\u0647\\u06d5\\u0631\\u06af\\u06cc\\u0632\"}', '642ef9f827ba5.jpg');
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5, '2023_04_06_103826_create_posts_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '2023_04_06_105524_create_categories_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (54, 'App\\Models\\User', 2, 'token', '55cc1d1d64bbb532bbcd9fa7327bf3428ff4ae36337a4595ba7b814ac39433cf', '[\"*\"]', '2023-04-06 19:07:04', NULL, '2023-04-06 19:07:04', '2023-04-06 19:07:04');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (80, 'App\\Models\\User', 1, 'token', '68602f1ab9ba5216203e34f1cce4bfee1efd6b0e6e358a6633e48b8d0edf7198', '[\"*\"]', '2023-04-06 21:08:23', NULL, '2023-04-06 21:08:23', '2023-04-06 21:08:23');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (81, 'App\\Models\\User', 1, 'token', 'f76d78bc0465921f22a05346f68f6b74dca253e50b6096088a000a952b5751e4', '[\"*\"]', '2023-04-06 21:21:30', NULL, '2023-04-06 21:21:30', '2023-04-06 21:21:30');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (82, 'App\\Models\\User', 1, 'token', 'a46c2e8f48bf16a85b18f35551cdba0e7c322f1eeae9656bad389f4c0cb5596e', '[\"*\"]', '2023-04-06 21:41:47', NULL, '2023-04-06 21:23:22', '2023-04-06 21:41:47');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (83, 'App\\Models\\User', 1, 'token', '261eebdf084db7157781c924b31e037f8d6474cae6a24b7e816442d6a7e3d83a', '[\"*\"]', '2023-04-06 21:42:03', NULL, '2023-04-06 21:42:02', '2023-04-06 21:42:03');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (84, 'App\\Models\\User', 1, 'token', '83eacc1debfccf045b67a4b07b519358be3fdd3c65bc2bbbf923b2df440a8b35', '[\"*\"]', '2023-04-06 21:58:08', NULL, '2023-04-06 21:58:07', '2023-04-06 21:58:08');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (85, 'App\\Models\\User', 1, 'token', '1ae0ad84533812886e1a3a79c555cafbbb7c081595d6fd252ebaf989cc529e26', '[\"*\"]', '2023-04-06 21:58:52', NULL, '2023-04-06 21:58:52', '2023-04-06 21:58:52');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (86, 'App\\Models\\User', 1, 'token', 'a78508bd6e36775006a7f3d28b4cba6f794b61e615d48e68ac82badf725083f0', '[\"*\"]', '2023-04-06 22:00:29', NULL, '2023-04-06 22:00:15', '2023-04-06 22:00:29');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (87, 'App\\Models\\User', 1, 'token', '8b52f99c6daa4819748fcd267857f2d3d5ee588b72fbb5a7d452ad6bbaa8bd35', '[\"*\"]', '2023-04-06 22:01:06', NULL, '2023-04-06 22:01:06', '2023-04-06 22:01:06');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (88, 'App\\Models\\User', 1, 'token', '681cfa693fff9790fb59b64c449ab19172eb3cf74baea4a9d4d467c95c0660bb', '[\"*\"]', '2023-04-06 22:02:04', NULL, '2023-04-06 22:01:48', '2023-04-06 22:02:04');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (89, 'App\\Models\\User', 1, 'token', '60cfa787b03312235f095fc646ca8288bdacaf19284114135108a9fc2fd1f0dd', '[\"*\"]', '2023-04-06 22:05:45', NULL, '2023-04-06 22:05:34', '2023-04-06 22:05:45');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (90, 'App\\Models\\User', 1, 'token', '6bdff51a17ae2930d421d143df51463c68d52572dc5924c2c9e9ac580d5e2202', '[\"*\"]', '2023-04-06 22:06:40', NULL, '2023-04-06 22:06:40', '2023-04-06 22:06:40');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (91, 'App\\Models\\User', 1, 'token', '824f5b1f50e7a051251b3c39685d58f8c5985ad60b0a5965feae5d11c4fff5e0', '[\"*\"]', '2023-04-06 22:11:11', NULL, '2023-04-06 22:11:11', '2023-04-06 22:11:11');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (92, 'App\\Models\\User', 1, 'token', 'a9b6b3f9a5edfdf6734b653be0a171647470a4e9ddad6e607794a9566681aa76', '[\"*\"]', '2023-04-06 22:15:41', NULL, '2023-04-06 22:15:40', '2023-04-06 22:15:41');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (93, 'App\\Models\\User', 1, 'token', '9fbdb2726cb10806b2cc1edab293e7c89905a5e011ee2ba3e40c71f904ca8ec8', '[\"*\"]', '2023-04-06 22:18:05', NULL, '2023-04-06 22:18:05', '2023-04-06 22:18:05');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (94, 'App\\Models\\User', 1, 'token', '59ff5ef5f7c69bce907f51f3064186d78c0bad0450413221ab95fca6bd8339fb', '[\"*\"]', '2023-04-06 22:19:11', NULL, '2023-04-06 22:19:11', '2023-04-06 22:19:11');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (95, 'App\\Models\\User', 1, 'token', '84ce4ca2074a88c3ed4bf1e6ab1a240c69d2c9953cb4697a0e422bd14f2be33e', '[\"*\"]', '2023-04-06 22:20:27', NULL, '2023-04-06 22:20:27', '2023-04-06 22:20:27');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (96, 'App\\Models\\User', 1, 'token', 'f6da33a3c8038d81be83acecd1524cbcd09adc8bb85e914f01bc3ffe618b98be', '[\"*\"]', '2023-04-06 22:21:29', NULL, '2023-04-06 22:21:29', '2023-04-06 22:21:29');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (97, 'App\\Models\\User', 1, 'token', '030c5278c7961fdc8d5cb3935b7d0f25876c710e676d8ed1642b1e6ac894bc18', '[\"*\"]', '2023-04-06 22:22:54', NULL, '2023-04-06 22:22:54', '2023-04-06 22:22:54');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (98, 'App\\Models\\User', 1, 'token', '272a971ebb550c79cf29d6bbca3af7125f801b2859a4eb4508667fa420e5baad', '[\"*\"]', '2023-04-06 22:24:11', NULL, '2023-04-06 22:24:11', '2023-04-06 22:24:11');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (99, 'App\\Models\\User', 1, 'token', '2779d3cfe4072d06f159dfa92440a85cb87dc2117b97e3df8c5e1b0dd7e5838a', '[\"*\"]', '2023-04-06 22:25:45', NULL, '2023-04-06 22:25:45', '2023-04-06 22:25:45');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (100, 'App\\Models\\User', 1, 'token', '569ad489b70633618e59a8e72488e39291f78fab9ded5240ec7edf927b6a6e66', '[\"*\"]', '2023-04-06 22:26:29', NULL, '2023-04-06 22:26:29', '2023-04-06 22:26:29');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (101, 'App\\Models\\User', 1, 'token', '6436b50eadf9a110bd04319413606418c2b06fc8fbe51acde4a4b3a53a3ae98d', '[\"*\"]', '2023-04-06 22:27:50', NULL, '2023-04-06 22:27:50', '2023-04-06 22:27:50');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (102, 'App\\Models\\User', 1, 'token', '50f89c169dd14c6bcb6fc452ac928158569985a90fe24a982aa788bcbecd55bc', '[\"*\"]', '2023-04-06 22:30:17', NULL, '2023-04-06 22:30:17', '2023-04-06 22:30:17');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (103, 'App\\Models\\User', 1, 'token', 'bc92f1ba42afb8ae63c295f4418534a48da520f221dde4d009791aa553bd9ab5', '[\"*\"]', '2023-04-06 22:43:53', NULL, '2023-04-06 22:31:22', '2023-04-06 22:43:53');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (104, 'App\\Models\\User', 1, 'token', 'b048f067d9c8059f0415c2c80ec491eb933dd5fea7b5ee4cd074afb9a11c7a18', '[\"*\"]', '2023-04-06 22:31:55', NULL, '2023-04-06 22:31:55', '2023-04-06 22:31:55');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (105, 'App\\Models\\User', 1, 'token', '96dcfbd2cdde10ddf348ddc5df1a0cef99eb0f258763a81c57a5713e4e231ca2', '[\"*\"]', '2023-04-06 22:37:29', NULL, '2023-04-06 22:37:28', '2023-04-06 22:37:29');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (106, 'App\\Models\\User', 1, 'token', '21216d14628bccec2b9fc2707c85b28cd3c3c35ecffc20ef424e262b1928452f', '[\"*\"]', '2023-04-06 22:42:43', NULL, '2023-04-06 22:42:42', '2023-04-06 22:42:43');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (107, 'App\\Models\\User', 1, 'token', 'a1cc7cbd218de3504c1d153390a390e994f5871762a21954cc1514bf3fcd339d', '[\"*\"]', '2023-04-06 22:44:19', NULL, '2023-04-06 22:44:19', '2023-04-06 22:44:19');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (108, 'App\\Models\\User', 1, 'token', '6cb5fc367a1a2b3bc57f7f0ec5be0bc965da7302a666ea2d0bb36a0f938a038a', '[\"*\"]', '2023-04-06 22:45:21', NULL, '2023-04-06 22:45:21', '2023-04-06 22:45:21');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (109, 'App\\Models\\User', 1, 'token', 'ca0474f30d122e2d1eba9f058b6cf4ddaea8de678de54b5bb9d1eb3fa4ad357a', '[\"*\"]', '2023-04-06 22:51:45', NULL, '2023-04-06 22:51:45', '2023-04-06 22:51:45');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (110, 'App\\Models\\User', 1, 'token', '4c5fc746df722c8c10afe84bdb9fd0fe9f70b72d44d4d9a48e57ed5ee1a40777', '[\"*\"]', '2023-04-06 22:53:11', NULL, '2023-04-06 22:53:11', '2023-04-06 22:53:11');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (111, 'App\\Models\\User', 1, 'token', '0afd11f0b80e2f1f9ad8f7f3ef09b728e2facf9c63d2ba69f461f5ecab43e025', '[\"*\"]', '2023-04-06 22:55:22', NULL, '2023-04-06 22:55:22', '2023-04-06 22:55:22');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (112, 'App\\Models\\User', 1, 'token', '6f695b5318764404fb5f78f9cb2c98fe81396d4d5fe5c1a3116f67ff1689415e', '[\"*\"]', '2023-04-06 22:58:27', NULL, '2023-04-06 22:58:27', '2023-04-06 22:58:27');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (113, 'App\\Models\\User', 1, 'token', '96fe15bbd30aa4f440438829ad2bc295662ca478f62187ccab4b0988188762ec', '[\"*\"]', '2023-04-06 23:00:58', NULL, '2023-04-06 23:00:58', '2023-04-06 23:00:58');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (114, 'App\\Models\\User', 1, 'token', 'c306eec1ad17a0fcd7ee49b798a87f2745d6797d71b9ef535de174ec9c9a2952', '[\"*\"]', '2023-04-06 23:01:58', NULL, '2023-04-06 23:01:58', '2023-04-06 23:01:58');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (115, 'App\\Models\\User', 1, 'token', 'c455b73f1439abb960cf57ab089716a546f9f4c3540bff312151140526e6897f', '[\"*\"]', '2023-04-06 23:02:41', NULL, '2023-04-06 23:02:41', '2023-04-06 23:02:41');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (116, 'App\\Models\\User', 1, 'token', 'c1476b2f44af41ea56e1430ebb19fd057404e0b99cb16e5bec083b2ddeb5dee5', '[\"*\"]', '2023-04-06 23:05:16', NULL, '2023-04-06 23:05:16', '2023-04-06 23:05:16');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (117, 'App\\Models\\User', 1, 'token', 'd521b7ed133ee8ace675a71118700896f7aeb0cc3b02851db6fc95ab3ddc18c5', '[\"*\"]', '2023-04-06 23:06:33', NULL, '2023-04-06 23:06:33', '2023-04-06 23:06:33');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (118, 'App\\Models\\User', 1, 'token', '879598fddca5bd67b8b4115e74a5814d6c8159d129b50bd3533579a6a524daa5', '[\"*\"]', '2023-04-06 23:06:35', NULL, '2023-04-06 23:06:34', '2023-04-06 23:06:35');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (119, 'App\\Models\\User', 1, 'token', '8aa778a0e6ac93236cfd0e345698439a7cb97f5371ce39f37ce5a07090f4d191', '[\"*\"]', '2023-04-06 23:06:37', NULL, '2023-04-06 23:06:36', '2023-04-06 23:06:37');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (120, 'App\\Models\\User', 1, 'token', 'c95786b904ef46711790f1896fd3e9a95d58466cfa10f9fdd055f5930836d69a', '[\"*\"]', '2023-04-06 23:06:53', NULL, '2023-04-06 23:06:53', '2023-04-06 23:06:53');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (121, 'App\\Models\\User', 1, 'token', '90156b546b99cf69fc27d8593f7b931cd7a40582733653c8b2ff8c5bb4c9857a', '[\"*\"]', '2023-04-06 23:09:00', NULL, '2023-04-06 23:08:59', '2023-04-06 23:09:00');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (122, 'App\\Models\\User', 1, 'token', '206dd841769e5ef6bc48084d5eecaeda142013314e41bfb8164d8faca0c0944f', '[\"*\"]', '2023-04-06 23:10:17', NULL, '2023-04-06 23:10:04', '2023-04-06 23:10:17');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (123, 'App\\Models\\User', 1, 'token', '9d6b4c83ca538a830a92b1ec868fe365b2f744eb0ba05cd1dd5bf9b9e2e51442', '[\"*\"]', '2023-04-06 23:12:43', NULL, '2023-04-06 23:10:44', '2023-04-06 23:12:43');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (124, 'App\\Models\\User', 1, 'token', '99866c705a4954c4fd37ded0b88a872d5aaca0d3372fdd77327127c31e8abb41', '[\"*\"]', '2023-04-07 07:47:15', NULL, '2023-04-07 07:47:06', '2023-04-07 07:47:15');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (125, 'App\\Models\\User', 1, 'token', '1859e6036e6c9027511b9588a9bc29ab26712a254ae22eda661c3484c145e123', '[\"*\"]', '2023-04-07 07:57:33', NULL, '2023-04-07 07:57:13', '2023-04-07 07:57:33');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (126, 'App\\Models\\User', 1, 'token', 'e128f0db15ecc9192d41f7f220b4155922560dcd11c07bba321ccc52a9f92170', '[\"*\"]', '2023-04-07 08:06:01', NULL, '2023-04-07 08:06:00', '2023-04-07 08:06:01');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (127, 'App\\Models\\User', 1, 'token', 'fa0db2746a1e455c33396a82f2b5adfa03c0ab4c894749ecaa7c08f8b4f0877d', '[\"*\"]', '2023-04-07 08:06:37', NULL, '2023-04-07 08:06:37', '2023-04-07 08:06:37');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (128, 'App\\Models\\User', 1, 'token', 'e33edcfedd33c1c955f9708605393a936c33ba8a3221ae59218af2bd07f4c3c8', '[\"*\"]', '2023-04-07 08:09:08', NULL, '2023-04-07 08:08:57', '2023-04-07 08:09:08');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (129, 'App\\Models\\User', 1, 'token', '34099db1c5d12e4868b72bdc35c23c3b3ff22ff924c42edd4866e070bdd66a3b', '[\"*\"]', '2023-04-07 08:19:56', NULL, '2023-04-07 08:19:41', '2023-04-07 08:19:56');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (130, 'App\\Models\\User', 1, 'token', '72ba32031cae79c509fa47ece1c7c34542d447cfb798ee32f05bf76d5d79b8ca', '[\"*\"]', '2023-04-07 08:20:41', NULL, '2023-04-07 08:20:29', '2023-04-07 08:20:41');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (131, 'App\\Models\\User', 1, 'token', 'c44ea0e2b64af574f3a8f3a043154a337f0548c5d7fa12ad86e6850b7a67656d', '[\"*\"]', '2023-04-07 08:23:45', NULL, '2023-04-07 08:23:31', '2023-04-07 08:23:45');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (132, 'App\\Models\\User', 1, 'token', 'c05f07a0b93424892d4faa8f30b7d4791e7e3428fc8c39a1c3c6431110abe223', '[\"*\"]', '2023-04-07 08:32:05', NULL, '2023-04-07 08:32:05', '2023-04-07 08:32:05');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (133, 'App\\Models\\User', 1, 'token', '496aea185d9720f86fa662c54d91cdf4422c04ba68b7b917d510186fafd29bef', '[\"*\"]', '2023-04-07 08:33:25', NULL, '2023-04-07 08:33:25', '2023-04-07 08:33:25');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (134, 'App\\Models\\User', 1, 'token', '09cfa79a30350f16905137d289deb4b1fbdac21e29dc077c0a49671925aacb47', '[\"*\"]', '2023-04-07 08:34:17', NULL, '2023-04-07 08:34:17', '2023-04-07 08:34:17');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (135, 'App\\Models\\User', 1, 'token', '5b56c744775902eec2d9cb385780216794ed09234c9d502a172add8143fcb109', '[\"*\"]', '2023-04-07 08:36:25', NULL, '2023-04-07 08:36:24', '2023-04-07 08:36:25');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (136, 'App\\Models\\User', 1, 'token', '308f38eda5845cbeac82954101efb9433193aa22374d4bb3233b6a9dc28b8c6f', '[\"*\"]', '2023-04-07 08:40:17', NULL, '2023-04-07 08:40:16', '2023-04-07 08:40:17');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (137, 'App\\Models\\User', 1, 'token', '38b055d8f9584cdf313843c1a002fbba7f93762b0ef489fc41e190ec63ddb768', '[\"*\"]', '2023-04-07 08:41:14', NULL, '2023-04-07 08:41:14', '2023-04-07 08:41:14');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (138, 'App\\Models\\User', 1, 'token', '40e724a9d26ea664c8c1f2a588a031bdb0718a70e700dacb309dafd1ccb24922', '[\"*\"]', '2023-04-07 08:44:20', NULL, '2023-04-07 08:42:13', '2023-04-07 08:44:20');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (139, 'App\\Models\\User', 1, 'token', 'f6779d72f74d2ea145a81fc7bbb03bdcb8185a3ea4409a8e1f4001c597a4fb18', '[\"*\"]', '2023-04-07 08:49:53', NULL, '2023-04-07 08:49:53', '2023-04-07 08:49:53');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (140, 'App\\Models\\User', 1, 'token', '2fcc7b4a0539e29a2326436a130925dc8adf31deaf4d51fa734d00aa055954f1', '[\"*\"]', '2023-04-07 08:50:31', NULL, '2023-04-07 08:49:53', '2023-04-07 08:50:31');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (141, 'App\\Models\\User', 1, 'token', '95da8c5946688096dcb1c15b3b850e93b5c4a278ad3f21c7acfcc35dd74f444f', '[\"*\"]', '2023-04-07 08:51:20', NULL, '2023-04-07 08:51:07', '2023-04-07 08:51:20');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (142, 'App\\Models\\User', 1, 'token', '1d2958929e0dc56e8862da5bbbf62ad14435e2729a838848287b7e7b4b2222bc', '[\"*\"]', '2023-04-07 08:51:40', NULL, '2023-04-07 08:51:40', '2023-04-07 08:51:40');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (143, 'App\\Models\\User', 1, 'token', 'f42673a17965469788650829dbd42feb133d17e95acac1076340dbd603a55abe', '[\"*\"]', '2023-04-07 08:52:22', NULL, '2023-04-07 08:52:22', '2023-04-07 08:52:22');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (144, 'App\\Models\\User', 1, 'token', '8548f10d065f5e7e56e28c85fffb25553ed71841285369382b8968fee129c733', '[\"*\"]', '2023-04-07 08:53:20', NULL, '2023-04-07 08:53:09', '2023-04-07 08:53:20');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (145, 'App\\Models\\User', 1, 'token', 'e0f1befe14e75ef941335a10e6e10cd37872fe4124540ffe3d5f35d50860f9fc', '[\"*\"]', '2023-04-07 08:57:05', NULL, '2023-04-07 08:56:32', '2023-04-07 08:57:05');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (146, 'App\\Models\\User', 1, 'token', '45549694f12d84d80beb5478f2fa98a2400ae40c36761c578101f90bbc14c7d2', '[\"*\"]', '2023-04-07 08:59:21', NULL, '2023-04-07 08:59:21', '2023-04-07 08:59:21');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (147, 'App\\Models\\User', 1, 'token', 'b545e676d79e5bd6172f3a4e50d6446a85c9db32c556442807e471b41bb270cd', '[\"*\"]', '2023-04-07 09:08:06', NULL, '2023-04-07 09:08:06', '2023-04-07 09:08:06');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (148, 'App\\Models\\User', 1, 'token', 'df5d9b85de80591bf54c087553b10b93cb02105542ae5615c403b0a731bdec34', '[\"*\"]', '2023-04-07 09:09:00', NULL, '2023-04-07 09:09:00', '2023-04-07 09:09:00');
COMMIT;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint unsigned DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_author_id_foreign` (`author_id`),
  KEY `posts_category_id_foreign` (`category_id`),
  CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
BEGIN;
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (1, NULL, '{\"en\":\"My First Post update\",\"ar\":\"\\u0645\\u0634\\u0627\\u0631\\u0643\\u062a\\u064a \\u0627\\u0644\\u0623\\u0648\\u0644\\u0649 update\",\"ku\":\"\\u06cc\\u06d5\\u06a9\\u06d5\\u0645 \\u067e\\u06c6\\u0633\\u062a update\"}', '{\"en\":\"What is in your mind update\",\"ar\":\"\\u0645\\u0627 \\u064a\\u062f\\u0648\\u0631 \\u0641\\u064a \\u0630\\u0647\\u0646\\u0643 update\",\"ku\":\"\\u0626\\u06d5\\u0648\\u06d5\\u06cc \\u0644\\u06d5 \\u0645\\u06ce\\u0634\\u06a9\\u062a\\u062f\\u0627\\u06cc\\u06d5 update\"}', '642ed2a26057a.jpg', '2023-04-06 14:38:26', '2023-04-06 14:09:38', '2023-04-06 14:38:26', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (4, 1, '{\"en\":\"My First Post\",\"ar\":\"\\u0645\\u0634\\u0627\\u0631\\u0643\\u062a\\u064a \\u0627\\u0644\\u0623\\u0648\\u0644\\u0649\",\"ku\":\"\\u06cc\\u06d5\\u06a9\\u06d5\\u0645 \\u067e\\u06c6\\u0633\\u062a\"}', '{\"en\":\"What is in your mind\",\"ar\":\"\\u0645\\u0627 \\u064a\\u062f\\u0648\\u0631 \\u0641\\u064a \\u0630\\u0647\\u0646\\u0643\",\"ku\":\"\\u0626\\u06d5\\u0648\\u06d5\\u06cc \\u0644\\u06d5 \\u0645\\u06ce\\u0634\\u06a9\\u062a\\u062f\\u0627\\u06cc\\u06d5\"}', '642ed46c3cd06.jpg', NULL, '2023-04-06 14:17:16', '2023-04-06 14:17:16', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (5, 1, '{\"en\":\"My First Post\",\"ar\":\"\\u0645\\u0634\\u0627\\u0631\\u0643\\u062a\\u064a \\u0627\\u0644\\u0623\\u0648\\u0644\\u0649\",\"ku\":\"\\u06cc\\u06d5\\u06a9\\u06d5\\u0645 \\u067e\\u06c6\\u0633\\u062a\"}', '{\"en\":\"What is in your mind\",\"ar\":\"\\u0645\\u0627 \\u064a\\u062f\\u0648\\u0631 \\u0641\\u064a \\u0630\\u0647\\u0646\\u0643\",\"ku\":\"\\u0626\\u06d5\\u0648\\u06d5\\u06cc \\u0644\\u06d5 \\u0645\\u06ce\\u0634\\u06a9\\u062a\\u062f\\u0627\\u06cc\\u06d5\"}', '642ef9fc2e14d.jpg', NULL, '2023-04-06 16:57:32', '2023-04-06 16:57:32', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (6, 1, '{\"en\":\"My First Post\",\"ar\":\"\\u0645\\u0634\\u0627\\u0631\\u0643\\u062a\\u064a \\u0627\\u0644\\u0623\\u0648\\u0644\\u0649\",\"ku\":\"\\u06cc\\u06d5\\u06a9\\u06d5\\u0645 \\u067e\\u06c6\\u0633\\u062a\"}', '{\"en\":\"What is in your mind\",\"ar\":\"\\u0645\\u0627 \\u064a\\u062f\\u0648\\u0631 \\u0641\\u064a \\u0630\\u0647\\u0646\\u0643\",\"ku\":\"\\u0626\\u06d5\\u0648\\u06d5\\u06cc \\u0644\\u06d5 \\u0645\\u06ce\\u0634\\u06a9\\u062a\\u062f\\u0627\\u06cc\\u06d5\"}', '642ef9ff95a92.jpg', NULL, '2023-04-06 16:57:35', '2023-04-06 16:57:35', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (7, 1, '{\"en\":\"My First Post\",\"ar\":\"\\u0645\\u0634\\u0627\\u0631\\u0643\\u062a\\u064a \\u0627\\u0644\\u0623\\u0648\\u0644\\u0649\",\"ku\":\"\\u06cc\\u06d5\\u06a9\\u06d5\\u0645 \\u067e\\u06c6\\u0633\\u062a\"}', '{\"en\":\"What is in your mind\",\"ar\":\"\\u0645\\u0627 \\u064a\\u062f\\u0648\\u0631 \\u0641\\u064a \\u0630\\u0647\\u0646\\u0643\",\"ku\":\"\\u0626\\u06d5\\u0648\\u06d5\\u06cc \\u0644\\u06d5 \\u0645\\u06ce\\u0634\\u06a9\\u062a\\u062f\\u0627\\u06cc\\u06d5\"}', '642f00181197a.jpg', NULL, '2023-04-06 17:23:36', '2023-04-06 17:23:36', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (8, 1, '{\"en\":\"fgsgdfg\",\"ar\":\"fgfghgfer\",\"ku\":\"erterte\"}', '{\"en\":\"234234\",\"ar\":\"asda\",\"ku\":\"xzxcvz\"}', '642f40fcdea29.jpg', '2023-04-07 08:56:46', '2023-04-06 22:00:28', '2023-04-07 08:56:46', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (9, 1, '{\"en\":\"fdfgdfgdf\",\"ar\":\"adasd\",\"ku\":\"cascsdc\"}', '{\"en\":\"wewer\",\"ar\":\"wewe\",\"ku\":\"vddfvdf\"}', '642f415c79abe.jpg', '2023-04-07 08:56:45', '2023-04-06 22:02:04', '2023-04-07 08:56:45', 2);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (10, 1, '{\"en\":\"sdfsdf\",\"ar\":\"sdfsdf\",\"ku\":\"sdsdfsd\"}', '{\"en\":\"sdfsdf\",\"ar\":\"sdfsdf\",\"ku\":\"sdfsdfs\"}', '642f423910f7f.jpg', '2023-04-07 08:56:44', '2023-04-06 22:05:45', '2023-04-07 08:56:44', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (11, 1, '{\"en\":\"My First Post\",\"ar\":\"\\u0645\\u0634\\u0627\\u0631\\u0643\\u062a\\u064a \\u0627\\u0644\\u0623\\u0648\\u0644\\u0649\",\"ku\":\"\\u06cc\\u06d5\\u06a9\\u06d5\\u0645 \\u067e\\u06c6\\u0633\\u062a\"}', '{\"en\":\"What is in your mind\",\"ar\":\"\\u0645\\u0627 \\u064a\\u062f\\u0648\\u0631 \\u0641\\u064a \\u0630\\u0647\\u0646\\u0643\",\"ku\":\"\\u0626\\u06d5\\u0648\\u06d5\\u06cc \\u0644\\u06d5 \\u0645\\u06ce\\u0634\\u06a9\\u062a\\u062f\\u0627\\u06cc\\u06d5\"}', '642f484f3be6c.jpg', '2023-04-07 08:56:42', '2023-04-06 22:31:43', '2023-04-07 08:56:42', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (12, 1, '{\"en\":\"asfasfa\",\"ar\":\"sfasf\",\"ku\":\"sdfwef\"}', '{\"en\":\"wefwef\",\"ar\":\"wefwef\",\"ku\":\"aasfaf\"}', '642f517eb1390.jpg', '2023-04-07 08:56:41', '2023-04-06 23:10:54', '2023-04-07 08:56:41', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (13, 1, '{\"en\":\"env\",\"ar\":\"sdf\",\"ku\":\"ssdfsdg\"}', '{\"en\":\"sdsdgs\",\"ar\":\"sdgsdg\",\"ku\":\"sdgsdg\"}', '642fcced97cc5.jpg', NULL, '2023-04-07 07:57:33', '2023-04-07 07:57:33', 2);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (14, 1, '{\"en\":\"asfasf\",\"ar\":\"sdgsdg\",\"ku\":\"sdgsdg\"}', '{\"en\":\"ergerg\",\"ar\":\"ergerg\",\"ku\":\"ergerg\"}', '642fcfa4256b8.jpg', '2023-04-07 08:57:05', '2023-04-07 08:09:08', '2023-04-07 08:57:05', 2);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (15, 1, '{\"en\":\"sdsdg\",\"ar\":\"sdgdfgfd\",\"ku\":\"ergerger\"}', '{\"en\":\"ergerg\",\"ar\":\"ergerg\",\"ku\":\"ergerg\"}', '642fd22d00ced.jpg', '2023-04-07 08:57:02', '2023-04-07 08:19:56', '2023-04-07 08:57:02', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (16, 1, '{\"en\":\"sdsdf\",\"ar\":\"sdgsdgs\",\"ku\":\"dgsdg\"}', '{\"en\":\"sdg\",\"ar\":\"sdgs\",\"ku\":\"dg\"}', '642fd259aaaeb.jpg', '2023-04-07 08:56:35', '2023-04-07 08:20:41', '2023-04-07 08:56:35', 1);
INSERT INTO `posts` (`id`, `author_id`, `title`, `content`, `image`, `deleted_at`, `created_at`, `updated_at`, `category_id`) VALUES (17, 1, '{\"en\":\"adsfasdf updated\",\"ar\":\"asfasf updated\",\"ku\":\"ewrferg updated\"}', '{\"en\":\"gergerge updated\",\"ar\":\"sdsdfs updated\",\"ku\":\"sdgsg updated\"}', '642fd310d3451.jpg', '2023-04-07 08:56:57', '2023-04-07 08:23:44', '2023-04-07 08:56:57', 2);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (1, 'Sivar Sarkawt', 'info@sivarsarkawt.com', NULL, '$2y$10$nEpydG3uXiN9ZVX5cZdoROhFtIUYuaHDkq8doShuq4vLF343KUc6e', NULL, '2023-04-06 13:21:10', '2023-04-06 13:21:10');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (2, 'Sivar', 'info1@sivarsarkawt.com', NULL, '$2y$10$6KCZK3f9GoyjZuw2V1VRl./ZySdhL6ZlWCaopTBhTIs4G6cgZ9amO', NULL, '2023-04-06 19:07:04', '2023-04-06 19:07:04');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
