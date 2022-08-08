-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 22 avr. 2020 à 15:09
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `paty12`
--

-- --------------------------------------------------------

--
-- Structure de la table `cnxassistants`
--

DROP TABLE IF EXISTS `cnxassistants`;
CREATE TABLE IF NOT EXISTS `cnxassistants` (
  `emailAss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passAss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `cnxassistants_emailass_unique` (`emailAss`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cnxassistants`
--

INSERT INTO `cnxassistants` (`emailAss`, `passAss`) VALUES
('oumaimamery25@gmail.com', '123456789');

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `save` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `likes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `fullname`, `email`, `telephone`, `date`, `message`, `save`, `likes`) VALUES
(1, 'tttttttt', 'yyy@gmail.com', '355342232624', '2020-04-21', 'GUyyyyyyyyyyyyyyyyyyyyyy', '1', '0'),
(6, 'bbbbbbb', 'bb@gmail.com', '0978564534', '2020-04-21', 'bbbbbbbbbbbbbbbbbbbbbbbb', '1', '0'),
(4, 'boutaina', 'bbbb@gmail.com', '0678994566', '2020-04-21', 'AZZERAZREZAE', '0', '0'),
(5, 'boutaina', 'bbbb@gmail.com', '0678994566', '2020-04-21', 'AZZERAZREZAE', '0', '0');

-- --------------------------------------------------------

--
-- Structure de la table `deletedmessages`
--

DROP TABLE IF EXISTS `deletedmessages`;
CREATE TABLE IF NOT EXISTS `deletedmessages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dossiermedicales`
--

DROP TABLE IF EXISTS `dossiermedicales`;
CREATE TABLE IF NOT EXISTS `dossiermedicales` (
  `iddossier` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idpatient` bigint(20) UNSIGNED DEFAULT NULL,
  `data` blob NOT NULL,
  PRIMARY KEY (`iddossier`),
  KEY `dossiermedicales_idpatient_foreign` (`idpatient`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `files_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `files`
--

INSERT INTO `files` (`id`, `user_id`, `name`, `file_url`) VALUES
(3, 22, 'Ø§Ù„ÙƒÙ‡Ø±Ø¨Ø§Ø¡ ÙˆØ§ÙƒØ³Ø¯Ø©-Ø§Ø®ØªØ²Ø§Ù„.pdf', 'files/Ø§Ù„ÙƒÙ‡Ø±Ø¨Ø§Ø¡ ÙˆØ§ÙƒØ³Ø¯Ø©-Ø§Ø®ØªØ²Ø§Ù„.pdf'),
(2, 22, 'Devoir 4.pdf', 'files/Devoir 4.pdf'),
(4, 22, 'doc.pdf', 'files/doc.pdf'),
(5, 22, 'Voici les prÃ©visions du 1er modÃ¨le marocain de propagation du Covid-19 .pdf', 'files/Voici les prÃ©visions du 1er modÃ¨le marocain de propagation du Covid-19 .pdf');

-- --------------------------------------------------------

--
-- Structure de la table `medecins`
--

DROP TABLE IF EXISTS `medecins`;
CREATE TABLE IF NOT EXISTS `medecins` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `medecins_email_unique` (`email`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medecins`
--

INSERT INTO `medecins` (`id`, `name`, `email`, `password`) VALUES
(1, 'ali mezouary', 'boutynaour8@gmail.com', 'ali ali');

-- --------------------------------------------------------

--
-- Structure de la table `memoasses`
--

DROP TABLE IF EXISTS `memoasses`;
CREATE TABLE IF NOT EXISTS `memoasses` (
  `idMemoAss` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datehr` date NOT NULL,
  PRIMARY KEY (`idMemoAss`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `memoasses`
--

INSERT INTO `memoasses` (`idMemoAss`, `text`, `datehr`) VALUES
(1, 'bonjour je ne serai pas disponible pour demain', '2020-04-21'),
(3, 'cc', '2020-04-22');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'fffffffffffffffffffffff', '2020-04-03 00:00:00', NULL),
(8, NULL, 'desole mes chere patients', '2020-04-22 07:57:18', NULL),
(4, 1, 'gaggagagagggagaggaga', '2020-04-11 22:24:19', NULL),
(7, NULL, 'desole pour les gens qui ont pris des rendez vous pour demain je ne serai pas disponnible', '2020-04-21 07:42:26', NULL),
(10, NULL, 'bonjour desole pour le retard de demain', '2020-04-21 07:24:13', NULL),
(11, NULL, 'lala laala', '2020-04-21 22:25:11', NULL),
(12, NULL, 'ffff', '2020-04-21 14:25:48', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 2),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(7, '2016_06_01_000004_create_oauth_clients_table', 2),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(9, '2020_03_30_221939_create_messages_table', 3),
(10, '2020_03_31_010147_create_messages_table', 4),
(11, '2020_04_01_155204_create_messages_table', 5),
(12, '2020_04_01_155615_create_messages_table', 6),
(13, '2020_04_02_201012_create_messages_table', 7),
(14, '2020_04_02_202149_create_medecins_table', 7),
(15, '2020_04_03_153248_create_messages_table', 8),
(16, '2020_04_03_153603_create_messages_table', 9),
(17, '2020_04_04_164344_create_rendezvouses_table', 10),
(133, '2020_04_04_174215_create_rendezvouses_table', 11),
(134, '2020_04_09_220602_create_password_resets_table', 11),
(135, '2020_04_14_151838_create_cnxassistants_table', 11),
(136, '2020_04_14_154300_create_contacts_table', 11),
(137, '2020_04_14_160431_create_deletedmessages_table', 11),
(138, '2020_04_14_161928_create_memoasses_table', 11),
(139, '2020_04_14_164057_create_optics_table', 11),
(140, '2020_04_14_165828_create_prescriptions_table', 11),
(141, '2020_04_14_170732_create_tickets_table', 11),
(142, '2020_04_14_174157_create_dossiermedicales_table', 11),
(143, '2020_04_14_175011_create_files_table', 11);

-- --------------------------------------------------------

--
-- Structure de la table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('342c45a88915d7e0c26035ace6c469a02732087f60183d6fa0d55371d02ddb35f788ac69afbbffa4', 11, 1, 'MySecret', '[]', 0, '2020-03-27 23:11:38', '2020-03-27 23:11:38', '2021-03-28 00:11:38'),
('84c21ac4981727403e9c5c4edc5fe6b7e37a29818c4993482622a93099e638750642231ed83c9f16', 4, 1, 'MySecret', '[]', 0, '2020-03-29 10:09:09', '2020-03-29 10:09:09', '2021-03-29 11:09:09'),
('570ecdec6e97369a533154d1fbc100302a6591655603c446e8e85e094342bd6e7eb94bedfac7e837', 4, 1, 'MySecret', '[]', 0, '2020-03-29 10:12:49', '2020-03-29 10:12:49', '2021-03-29 11:12:49'),
('f2591b6acba7b72c4fe8286220db2a05611e9269a66b502dd70c08c52b2878cebc7873383e12648f', 4, 1, 'MySecret', '[]', 0, '2020-03-29 10:42:04', '2020-03-29 10:42:04', '2021-03-29 11:42:04'),
('3a0b3415decaed3dc9fc9287a881665f75517ae8545c7bd748c8d08aa291d81f1f6d8a2449c1a887', 4, 1, 'MySecret', '[]', 0, '2020-03-29 11:12:01', '2020-03-29 11:12:01', '2021-03-29 12:12:01'),
('00dc7cbcedffb9f93a3fa5fec21109776b797d8e030573495b36e8e90cffc4fe03955792339c7ca4', 4, 1, 'MySecret', '[]', 0, '2020-03-29 11:14:04', '2020-03-29 11:14:04', '2021-03-29 12:14:04'),
('d9f36db11433979d6c297cc7f044ada483ff7c20cb823d51c584bdcf64e29c75a98e854f94b6ba96', 1, 1, 'MySecret', '[]', 0, '2020-03-29 11:18:21', '2020-03-29 11:18:21', '2021-03-29 12:18:21'),
('578a71b9bab77e14967a13a997b3bba35c229c56277ca360ac83f4bf34842c05c99c95e47591a6cb', 4, 1, 'MySecret', '[]', 0, '2020-03-29 11:24:39', '2020-03-29 11:24:39', '2021-03-29 12:24:39'),
('ee1d85b19f5deb28f8dcb18a50db8852f1f69ea4e119e67936dcc966a298aeb0ad59f804fdabdae9', 4, 1, 'MySecret', '[]', 0, '2020-03-29 11:25:14', '2020-03-29 11:25:14', '2021-03-29 12:25:14'),
('a87a04f0df645e9dd9a9f33552099c328bed358464f7426dc4a38889b4d9d33c2fb3e4bc6137e127', 4, 1, 'MySecret', '[]', 0, '2020-03-29 11:56:57', '2020-03-29 11:56:57', '2021-03-29 12:56:57'),
('4298b14bf18960f74703ec54af79f68fbb8826c649df78888543041f199b1c68ff0964dc052b232f', 4, 1, 'MySecret', '[]', 0, '2020-03-29 11:58:17', '2020-03-29 11:58:17', '2021-03-29 12:58:17'),
('6d5801876f4eadd573f89d0f342b092b7b980bc657955ce651dbf62c7b327da66c3cc08b676585af', 4, 1, 'MySecret', '[]', 0, '2020-03-29 11:58:53', '2020-03-29 11:58:53', '2021-03-29 12:58:53'),
('ae0a8c458d90ba791c563fa451ef2ee532ba532bd2548311e28da82e552f2d0079ab53feb11c8f72', 1, 1, 'MySecret', '[]', 0, '2020-03-29 12:36:29', '2020-03-29 12:36:29', '2021-03-29 13:36:29'),
('a5ef9317c111834a762eac78069c926c8fdfe5865cf4499e272d627a65af4e909968fa40e9d0eb4b', 4, 1, 'MySecret', '[]', 0, '2020-03-29 12:51:34', '2020-03-29 12:51:34', '2021-03-29 13:51:34'),
('520b472c0cfebbd434b325b3d0fdf1400122f41a712e094e91cac12ed30160bf6392da5e50c5a343', 1, 1, 'MySecret', '[]', 0, '2020-03-29 12:52:54', '2020-03-29 12:52:54', '2021-03-29 13:52:54'),
('4e7e6e612590891db7880a6bfa42729b8972b5ac982afd395d1bcc87bd354b349269f3d145549050', 10, 1, 'MySecret', '[]', 0, '2020-03-29 12:56:29', '2020-03-29 12:56:29', '2021-03-29 13:56:29'),
('2ca9d2b88f534322ddbc367c43f92a5760b4516650911781b7b605b24ac9f6d52579b67a6424f13e', 12, 1, 'MySecret', '[]', 0, '2020-03-29 13:00:30', '2020-03-29 13:00:30', '2021-03-29 14:00:30'),
('f82c3dc84e3555b47e5867484d2f257cfa80c771ea4a2e6638859e5b9f6c6a82d840957926cab742', 13, 1, 'MySecret', '[]', 0, '2020-03-29 13:21:39', '2020-03-29 13:21:39', '2021-03-29 14:21:39'),
('04c715aa382c9c7710e36773c702e4675b33ba5da3dd3c6916954aba1f2a2a56d2b3b06935288cbc', 8, 1, 'MySecret', '[]', 0, '2020-03-29 13:22:44', '2020-03-29 13:22:44', '2021-03-29 14:22:44'),
('67ddf81f56a439146319b7a263e272f4151d86db825165c49210fa6ff6c0e324a8fa099c87f880bd', 9, 1, 'MySecret', '[]', 0, '2020-03-29 15:02:37', '2020-03-29 15:02:37', '2021-03-29 16:02:37'),
('959047fff28ae82e946d45419e58a30f2d27a2e3cb6343baedec4eefc7d366b5cff9f45d57a77843', 3, 1, 'MySecret', '[]', 0, '2020-03-29 20:00:56', '2020-03-29 20:00:56', '2021-03-29 21:00:56'),
('51de4fd8eaa5a2866caebb86ff02426031a72fd78007d6069a6d14c5973386e32f9f3d6f51214d58', 14, 1, 'MySecret', '[]', 0, '2020-03-29 22:54:17', '2020-03-29 22:54:17', '2021-03-29 23:54:17'),
('44837432a11239f3a2374aff943f9af70181fb0d6ff6700f51eb13dfe2b38abade0c49e918849bf5', 14, 1, 'MySecret', '[]', 0, '2020-03-30 12:42:03', '2020-03-30 12:42:03', '2021-03-30 13:42:03'),
('25cd26d49a75b2f405c99f299d3f6dd4f04c97226f369e6a5b67f5a9ff074228a9a25a0a22ec4a7b', 14, 1, 'MySecret', '[]', 0, '2020-03-30 13:18:42', '2020-03-30 13:18:42', '2021-03-30 14:18:42'),
('9f354b6390d5c98d6c991d7cab701c425e599923c0e4a0b507f686650d4ff666c578c5cda35b9035', 1, 1, 'MySecret', '[]', 0, '2020-03-30 22:24:51', '2020-03-30 22:24:51', '2021-03-30 23:24:51'),
('10a798938c6e8d7f5eeeb5c2f0f44eaced8325a48e26387df6340e625c0216dd25547387f5e026ed', 4, 1, 'MySecret', '[]', 0, '2020-03-30 23:50:16', '2020-03-30 23:50:16', '2021-03-31 00:50:16'),
('870d19ee614c24f6111669fc8b50720bdf734d81ce9b769849fadf66b5599e07f9fa097baf410d3d', 1, 1, 'MySecret', '[]', 0, '2020-03-31 00:10:14', '2020-03-31 00:10:14', '2021-03-31 01:10:14'),
('e90fb4b4eb501943b87a9029a09502735aea592cc1fa5c55e530fafe398080dea2a876339b4e5534', 4, 1, 'MySecret', '[]', 0, '2020-03-31 13:08:18', '2020-03-31 13:08:18', '2021-03-31 14:08:18'),
('d132fc0f3c2ab3364561e1f848c8c6764cb6f9c252ef0cb0bf22f777234764d72ae299ec8e152eeb', 4, 1, 'MySecret', '[]', 0, '2020-03-31 15:09:16', '2020-03-31 15:09:16', '2021-03-31 16:09:16'),
('809e85fa70c2fe023d20d48d2a59edf89bc75a8d9ccbce5e0ee00ac563f8fe674cca44d5ce3fbb60', 15, 1, 'MySecret', '[]', 0, '2020-03-31 15:10:05', '2020-03-31 15:10:05', '2021-03-31 16:10:05'),
('f81378548c12720a3b916325b03e78b86d8748e7a8baa0ba646f8097660cc3c33372fe487e770746', 15, 1, 'MySecret', '[]', 0, '2020-03-31 15:16:23', '2020-03-31 15:16:23', '2021-03-31 16:16:23'),
('0f715999a84a22fd877867faa6b223b22f4875290ba8c056d17b5e8d5cf58bbc38ca355c82b4c6b4', 16, 1, 'MySecret', '[]', 0, '2020-03-31 15:18:17', '2020-03-31 15:18:17', '2021-03-31 16:18:17'),
('ff78b7e75cc19da8b5da9b89d92a1ff6fc8ed42f5dff4809cb059f715eac1891900cec2e7dfcdfd7', 16, 1, 'MySecret', '[]', 0, '2020-03-31 15:19:45', '2020-03-31 15:19:45', '2021-03-31 16:19:45'),
('6fd6db15f4dcc2af52cb4770d149d40dbd61d20b16a269b3cb2514b018c1ed4b6b49c2435782b290', 16, 1, 'MySecret', '[]', 0, '2020-03-31 15:20:45', '2020-03-31 15:20:45', '2021-03-31 16:20:45'),
('85dda837ab6b5f3bed8068e1f4ba2020f08a344dc61ebdf7b5c34d6476b46cbd8746e771bc046406', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:00:38', '2020-04-01 13:00:38', '2021-04-01 14:00:38'),
('acf705a4e777bdcd18179b6ff9d7cc8e8adbcb910cfbb53e61300096c7041fc648e341e09db3220e', 4, 1, 'MySecret', '[]', 0, '2020-04-01 13:02:18', '2020-04-01 13:02:18', '2021-04-01 14:02:18'),
('31a92bb8a05e8475a51eed75aeff3e2a298bc5c3c5e6339e0eabcc9a9c93e5f5de65f188873c41b5', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:04:28', '2020-04-01 13:04:28', '2021-04-01 14:04:28'),
('862ef76422540d05d9eb2945a9485cc939a79f4d652e54bb32d1ab48b8c46e1a74fd599262d3e0a7', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:17:56', '2020-04-01 13:17:56', '2021-04-01 14:17:56'),
('aebaf9356dbbcd56398bfd133023bc123b18d26cea5ce26d3081b8a08ef9d8b68314abc9f007bfc8', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:21:00', '2020-04-01 13:21:00', '2021-04-01 14:21:00'),
('436f204cf18744971486e2f729bacc2e2e0fc606caa4589d980ed826eb80ef48e13424b32f8d4449', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:25:48', '2020-04-01 13:25:48', '2021-04-01 14:25:48'),
('1f095768e084fc5136329346a9354c6a355e77ed02461e31b888e00f8d3925fc682deb1c8dd089a3', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:29:34', '2020-04-01 13:29:34', '2021-04-01 14:29:34'),
('e4dd86ba56c567129e47a7732931781ef4b732a939db84c507f6cc58e0f938751e2b2ea01d63e2c4', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:31:51', '2020-04-01 13:31:51', '2021-04-01 14:31:51'),
('35693f206ad95a59c21d68a0f37d6a18ce6b39648a2849b4c6681f7aa365ac6bf60159c74c0dc95e', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:33:42', '2020-04-01 13:33:42', '2021-04-01 14:33:42'),
('69c6cf4ce379545aef44e8454ad1f8729e36c2269a216db5ac80f3b224f2c93595028ad35880d707', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:34:28', '2020-04-01 13:34:28', '2021-04-01 14:34:28'),
('8a9528d3c3c66cf2b7e5494227f0deb2fadbef89b574bd3268a68a41d0413d0c4a2bca08fe7ffc53', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:34:50', '2020-04-01 13:34:50', '2021-04-01 14:34:50'),
('6db9d37a1d5a6d1e75963bf4509c7bed3f32768274a1227094186f57b856fe3d1502dcb8d4020e85', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:38:00', '2020-04-01 13:38:00', '2021-04-01 14:38:00'),
('b506762ecb15c814a058c4a7afdee1ddb32388bc1e536de7f6e7b532d9d2b292ce81b3ce97cb80f1', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:41:45', '2020-04-01 13:41:45', '2021-04-01 14:41:45'),
('43ea27913cf17c30faf02b75baf2c2e6fae7339dc5649a9ed2124c6392777224c334611d8057e6b2', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:43:18', '2020-04-01 13:43:18', '2021-04-01 14:43:18'),
('8e03485360c0ee5bedaa27c1de9c1fc734dbe7142b9dce3799c2e5b2abb3c26411a9d66e3128639e', 16, 1, 'MySecret', '[]', 0, '2020-04-01 13:45:14', '2020-04-01 13:45:14', '2021-04-01 14:45:14'),
('6648a3e7f674c14b9791ca9cbf745bc3e6370e5a9b6a7f44ee4f08b24656b822fabf7aca7ef8f872', 17, 1, 'MySecret', '[]', 0, '2020-04-01 13:50:04', '2020-04-01 13:50:04', '2021-04-01 14:50:04'),
('8e30b7869b1fab02e0464405b6e588408eb3a955c2acc200c02aa8714d1bef12c62e6c5a3538afae', 17, 1, 'MySecret', '[]', 0, '2020-04-01 13:50:34', '2020-04-01 13:50:34', '2021-04-01 14:50:34'),
('dece58c3907eeb67c177f3facd2ebdba265697c27daf30a792d212561b9221789f438d3b1adc7f95', 17, 1, 'MySecret', '[]', 0, '2020-04-01 13:55:26', '2020-04-01 13:55:26', '2021-04-01 14:55:26'),
('856cf3ee88493101b9e096cf8dbaf8db930d18deebf8aeed2a933c1613b519d108dd1010064634d7', 17, 1, 'MySecret', '[]', 0, '2020-04-01 13:56:50', '2020-04-01 13:56:50', '2021-04-01 14:56:50'),
('6d7b39246dfa5bcd6290eb082555610cb93a30f391a87634696345dad6a03a7e129ba6a0ca3cfabd', 17, 1, 'MySecret', '[]', 0, '2020-04-01 13:58:35', '2020-04-01 13:58:35', '2021-04-01 14:58:35'),
('4a4860cfb95ea8b0b7e1e5a12a3256e1430e9d3c86b2c36f73ca0edaa319df1406ff851449db2fdc', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:20:12', '2020-04-01 14:20:12', '2021-04-01 15:20:12'),
('bf1e5a9f18bbf758e98d4425bee0e03cc2b33f1dbdadd6362c670edc27924b38811abd78b8bb168f', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:24:09', '2020-04-01 14:24:09', '2021-04-01 15:24:09'),
('410504f5e742f01a3f360cffe58a64350f8f4cda1d9753dfab439a9bbb042175dc6030beeadffc20', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:26:59', '2020-04-01 14:26:59', '2021-04-01 15:26:59'),
('c5394c298ad5e652b8d1308e545eb615a51fcb6b27a5fe5067d683f02f17c6d4966cd8bcebc98a14', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:27:29', '2020-04-01 14:27:29', '2021-04-01 15:27:29'),
('55ec94a654155b063261584c834e5ac2737761b4ca9cc41ab255d0d145115a9058ace41e93f44239', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:31:00', '2020-04-01 14:31:00', '2021-04-01 15:31:00'),
('401b09f87af1591a91d795f1b660556a1893abcf82548cc312c6474480f65f0b621a4391dc2d66a2', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:33:32', '2020-04-01 14:33:32', '2021-04-01 15:33:32'),
('f276eef3da67c86c5697a7d0e28e1dffa40443269f7dc57b96462fd7c6051f6dae620cb921cf6b38', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:33:59', '2020-04-01 14:33:59', '2021-04-01 15:33:59'),
('d451a583e9011d1cccdfb81b8e40d941d823a48b79db732840495ff777a998d0a916c888b5b3326b', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:35:32', '2020-04-01 14:35:32', '2021-04-01 15:35:32'),
('632b57fd343a2228fc65893b01ad071cc5aa8a3f789df187ba8f09a5fe6b2a2a40e885006340339b', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:35:59', '2020-04-01 14:35:59', '2021-04-01 15:35:59'),
('ebe06ab2abc9ed7e8118778a17956b32154a1f4e2dad52707ef1f7117cb7ff2e6801ea461fbea56e', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:38:03', '2020-04-01 14:38:03', '2021-04-01 15:38:03'),
('83fccc891a5487477eb9ad2a9635ce447c0413363abcbfad84ce47cd88f0b8a5f36f322e06c4c2f1', 4, 1, 'MySecret', '[]', 0, '2020-04-01 14:41:27', '2020-04-01 14:41:27', '2021-04-01 15:41:27'),
('c0f2c311ca4d27ff0e2600cc99b0ea2831f8abe96c0d7dac56228715e94c611894bf7a857d33fa78', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:42:27', '2020-04-01 14:42:27', '2021-04-01 15:42:27'),
('a212920d48b5b3b9433153a49f9e709c00b584166bb9f3d5e2f439a0fed41716a97b10129597536a', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:45:54', '2020-04-01 14:45:54', '2021-04-01 15:45:54'),
('0a94b52cfda5c0ea2b3b759a1e6faf41c684e973f9aef923027517cee021b1477dff60e2486fd6ff', 17, 1, 'MySecret', '[]', 0, '2020-04-01 14:47:57', '2020-04-01 14:47:57', '2021-04-01 15:47:57'),
('e0c038b9af151626b8a717c9bc2151dabeb9ef914ac1357390e5d677f83a4557b2ccdb8cd55b5ff3', 4, 1, 'MySecret', '[]', 0, '2020-04-01 15:02:59', '2020-04-01 15:02:59', '2021-04-01 16:02:59'),
('2325907c509a342f81414deb2b01074bb6763e681287bf1ee5a43026b5569d7634a4e33edf6f07c1', 4, 1, 'MySecret', '[]', 0, '2020-04-01 15:04:48', '2020-04-01 15:04:48', '2021-04-01 16:04:48'),
('79d2d6f521517f20d314bf1f9218e42c39bd3256e72c2e892a3eb0e0503f17abb87119aa382a91b0', 1, 1, 'MySecret', '[]', 0, '2020-04-01 15:09:39', '2020-04-01 15:09:39', '2021-04-01 16:09:39'),
('d10a14da34ee9d1cc445c9fbfd086e27eb1ef2ee2125f9d16fae15a74f9684f4bd53764f004aac30', 17, 1, 'MySecret', '[]', 0, '2020-04-01 15:11:04', '2020-04-01 15:11:04', '2021-04-01 16:11:04'),
('d4162fa709e4772b91c166361a33d1ba8f753e22b155cf50ac58d367e27f4094d4828c9cff8e1153', 17, 1, 'MySecret', '[]', 0, '2020-04-01 15:16:50', '2020-04-01 15:16:50', '2021-04-01 16:16:50'),
('63d30010e962e17ef5589da088dc8e5cc283271d716adff06b0be61863f493710c164c9c6ce3ba7e', 17, 1, 'MySecret', '[]', 0, '2020-04-01 15:19:49', '2020-04-01 15:19:49', '2021-04-01 16:19:49'),
('8252cda597fe6bf65a2053b07aa7407da5c73271f5a72d78008d6b78b31a2623773b7084e206cd1e', 17, 1, 'MySecret', '[]', 0, '2020-04-01 15:20:44', '2020-04-01 15:20:44', '2021-04-01 16:20:44'),
('4f52806a55c6a2b5fdc82b70c0d903974021206d3d6672dc6389d77c0cb1cb62916683ee2b18428e', 17, 1, 'MySecret', '[]', 0, '2020-04-01 15:21:13', '2020-04-01 15:21:13', '2021-04-01 16:21:13'),
('8861bf74b612813019a8b3cd12bcbd8da9ca266d4a82a57bdc2eb57391a57d9774719afde2bb2dba', 17, 1, 'MySecret', '[]', 0, '2020-04-01 15:21:17', '2020-04-01 15:21:17', '2021-04-01 16:21:17'),
('e25c164b00e105afadc9bc3a867569b675378d8de51db9e6a1c66402b0542b40fe0be08208b9f181', 17, 1, 'MySecret', '[]', 0, '2020-04-01 15:22:42', '2020-04-01 15:22:42', '2021-04-01 16:22:42'),
('a6bc0f195189a4318bb1185341b217306a20094c4857f20532d11ab0c6b0a56d525eb687c4de9fc4', 17, 1, 'MySecret', '[]', 0, '2020-04-01 15:23:49', '2020-04-01 15:23:49', '2021-04-01 16:23:49'),
('3942bf0c7c436bfb9b7fe34bb6a5a713efa14bdccfce02fcaaa565a54af82a8fd6d155e1e7ae8813', 17, 1, 'MySecret', '[]', 0, '2020-04-01 15:25:01', '2020-04-01 15:25:01', '2021-04-01 16:25:01'),
('4ba3a387006852c157c7f4e03bd17f4b0b8d761438e26e1ded10ddaace46925fce2513d1136f9bfc', 17, 1, 'MySecret', '[]', 0, '2020-04-01 15:25:19', '2020-04-01 15:25:19', '2021-04-01 16:25:19'),
('4c942cc19dec10ffa6ab8288bace3ceed060bebb7f3b4497dbbc939ab6f9046be86e8ab69b711bf3', 4, 1, 'MySecret', '[]', 0, '2020-04-01 19:44:12', '2020-04-01 19:44:12', '2021-04-01 20:44:12'),
('b4ad2bd028f06b12065d3501036192ce508041f2f7e5d308e5f725cbffdad7c08af6ccae77894550', 4, 1, 'MySecret', '[]', 0, '2020-04-01 19:44:53', '2020-04-01 19:44:53', '2021-04-01 20:44:53'),
('456e23e9eb7089284a20b39aaafdf5b88737abb3b28c15767557cd4e94f84f1f0c92bf615081a367', 4, 1, 'MySecret', '[]', 0, '2020-04-01 21:22:30', '2020-04-01 21:22:30', '2021-04-01 22:22:30'),
('e48f1e26bae3da2065d9e4f694b08afc53b5fda3dc6e924a06983a9bc3721c3b1bcf20de8acb2a3c', 2, 1, 'MySecret', '[]', 0, '2020-03-18 16:13:59', '2020-03-18 16:13:59', '2021-03-18 17:13:59'),
('450bf280185b19a96e14ae88954ce20eb9a6e7c86be81b89d91eea955b2e89623a6c072a0d31aaf9', 4, 1, 'MySecret', '[]', 0, '2020-04-01 21:46:24', '2020-04-01 21:46:24', '2021-04-01 22:46:24'),
('16536a8c3bcd3928abdeec5e1c490e0bdf81b6d53fe6f80021d1d9017eb86643e0dc029d13175f67', 3, 1, 'MySecret', '[]', 0, '2020-03-20 14:20:08', '2020-03-20 14:20:08', '2021-03-20 15:20:08'),
('7509fbe1a0ac10b1b743c9c8cb802248f8fe37b5137aba9bfdf91a8f109816a5e99ad1ab8169266c', 17, 1, 'MySecret', '[]', 0, '2020-04-01 23:09:06', '2020-04-01 23:09:06', '2021-04-02 00:09:06'),
('028be61e999879466e9681ec2988b3e8206b6e43e36d3759b94dd4d24d9671621a2aae8c1d1897e6', 4, 1, 'MySecret', '[]', 0, '2020-03-20 15:08:36', '2020-03-20 15:08:36', '2021-03-20 16:08:36'),
('a65a44c5c6f1db3ea7c5a4b6add67fc58921bc1789ec1df61559fb295bb281b00c4d85c44120cbfe', 1, 1, 'MySecret', '[]', 0, '2020-04-02 14:07:02', '2020-04-02 14:07:02', '2021-04-02 15:07:02'),
('15f1ec8e54f9cf9acf3d9fdf73cde7c485318eb851b8c6a8b9c6e7d13639b9582e3c47eaac80d4ea', 4, 1, 'MySecret', '[]', 0, '2020-03-20 16:22:36', '2020-03-20 16:22:36', '2021-03-20 17:22:36'),
('00d2499f962000bafebe66ccdafe87a10b48d92d2f69a066ef4cded5050a305a5397d0e617187b97', 4, 1, 'MySecret', '[]', 0, '2020-03-20 16:29:29', '2020-03-20 16:29:29', '2021-03-20 17:29:29'),
('8bd85b7b25b5c5a2ac76d6f8d586784356a720303dd8d33c199e8c99ed3459ae833af3d1fa06f804', 5, 1, 'MySecret', '[]', 0, '2020-03-20 16:38:59', '2020-03-20 16:38:59', '2021-03-20 17:38:59'),
('f8d122e01abff416408139d1c7932fa35570d5c03c58dd49d86d09b8d6547e3f877cbb8a32c69b05', 6, 1, 'MySecret', '[]', 0, '2020-03-20 16:54:35', '2020-03-20 16:54:35', '2021-03-20 17:54:35'),
('2183ad91c94213864834c18e90224de68d9f3939f801d96103c6d670d5db6bc8c0e01beb681b1411', 4, 1, 'MySecret', '[]', 0, '2020-03-20 20:36:58', '2020-03-20 20:36:58', '2021-03-20 21:36:58'),
('7dabec3e9ba1596054dc4e9b372a5b82dd524b0946e94681b2d22d75140896306ab81caca9638336', 4, 1, 'MySecret', '[]', 0, '2020-03-20 21:14:22', '2020-03-20 21:14:22', '2021-03-20 22:14:22'),
('bd1989d275210d2c874cf44fbebc063d50bc588b30dbf840a492b6989ee7891bc06d86605c723c36', 5, 1, 'MySecret', '[]', 0, '2020-03-20 21:46:04', '2020-03-20 21:46:04', '2021-03-20 22:46:04'),
('5daaa6760112c99c631acba7ac85fe5f3386c4d43472c21ba9b67ed13710f3ee462a353f510f1261', 4, 1, 'MySecret', '[]', 0, '2020-03-20 22:41:45', '2020-03-20 22:41:45', '2021-03-20 23:41:45'),
('fcf31786bae57d383ca050457dfbff25969adf798b98be44808af268e02fbaca041a7fdd8f37dbfc', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:25:33', '2020-03-21 20:25:33', '2021-03-21 21:25:33'),
('1c1a9802697b7900edf055b8751548b596705fc7473798ca1374480d254f8919ad9352b3a396dd31', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:26:55', '2020-03-21 20:26:55', '2021-03-21 21:26:55'),
('dadee76b45842a62551095c39558e5e19322cc073da5507d896cd4251e1935cbbc032ba3d168825d', 5, 1, 'MySecret', '[]', 0, '2020-03-21 20:30:40', '2020-03-21 20:30:40', '2021-03-21 21:30:40'),
('1a2ce7e61a2dbcedc8383a0e4837719c987208ba3a076c1c37e4dc6ee77c6f6c040682c4c15f6911', 5, 1, 'MySecret', '[]', 0, '2020-03-21 20:31:31', '2020-03-21 20:31:31', '2021-03-21 21:31:31'),
('6eee5946f72d7833fa54992653c75e4283ed6677f8bfd0b47dd34fed78f0f8efe4716a0d01b735e9', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:32:33', '2020-03-21 20:32:33', '2021-03-21 21:32:33'),
('b7076d33423842260def0f0c5a2876b211e9f992d8ce8d0900fa19bf72b21f3aa8a38aacc012cd19', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:33:35', '2020-03-21 20:33:35', '2021-03-21 21:33:35'),
('3b22b677daffe435597a7f96dc6ae1ee84ac381ac676ebe40777b6610d005ebc62de7d142d281c02', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:35:09', '2020-03-21 20:35:09', '2021-03-21 21:35:09'),
('f4c0b4047a74704154e187eda6aa98ca4d2ffce07491e202857c82f517f4a3c56468e74b271a2db5', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:36:44', '2020-03-21 20:36:44', '2021-03-21 21:36:44'),
('4a438ae51dc716eaf09e7d41793318bfbab392116d6bd343633797027e294c6d41ddef06a5bc5b46', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:39:05', '2020-03-21 20:39:05', '2021-03-21 21:39:05'),
('9f2855fb71ab1a37e3445113d33be3e452fbb14db3db7ffeacdf8354ceb3bbbc33191ad11446796b', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:41:04', '2020-03-21 20:41:04', '2021-03-21 21:41:04'),
('52ed2f8f4c597c8fb41994d85e91f48062ad3cdcf9af7d8a7c22a051ed1058eb5e0042696db310ae', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:43:28', '2020-03-21 20:43:28', '2021-03-21 21:43:28'),
('ca5de0b04435586a128e235a021e659f11b2865fa11d136180e69b9585597ddd737aa8adeb43d6fd', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:48:07', '2020-03-21 20:48:07', '2021-03-21 21:48:07'),
('0322d978d2881f585e33762bd0596149df8a9fffac4c8684a3b79c27cd16c767033a42b95776ba09', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:51:12', '2020-03-21 20:51:12', '2021-03-21 21:51:12'),
('e4de864a05f90608c3674d8e4b3997d1121ef1b9c2af9f7ac5320682233360a21621934b472c4fe5', 4, 1, 'MySecret', '[]', 0, '2020-03-21 20:52:35', '2020-03-21 20:52:35', '2021-03-21 21:52:35'),
('b710a139205b77f7bb55cfc306de441c7bd6700705344ccfead644db9f6ab665bc370e4606e7b46d', 7, 1, 'MySecret', '[]', 0, '2020-03-21 21:31:26', '2020-03-21 21:31:26', '2021-03-21 22:31:26'),
('f032dd8a501ed50a3e28897813b81ca52d0f9112cbf9c114283f06808a94841febf09662387b5c49', 8, 1, 'MySecret', '[]', 0, '2020-03-21 23:14:47', '2020-03-21 23:14:47', '2021-03-22 00:14:47'),
('803b6ae4c3b23353b539609281b3682ec0e93d1d6a729f15ec5290be38947bc29acfc73d4f1a00ab', 4, 1, 'MySecret', '[]', 0, '2020-03-21 23:24:56', '2020-03-21 23:24:56', '2021-03-22 00:24:56'),
('06c8b34fa066e6141cbf84fb867c42881aeb2565d85d159a341e750e580be17d55ceb45fb797cccb', 4, 1, 'MySecret', '[]', 0, '2020-03-22 22:08:44', '2020-03-22 22:08:44', '2021-03-22 23:08:44'),
('8678707c5e8c07364b473546faa27dfb23a7fd014dbb8836435e5a6632480c61a05048d4750ec5d1', 4, 1, 'MySecret', '[]', 0, '2020-03-22 22:28:37', '2020-03-22 22:28:37', '2021-03-22 23:28:37'),
('9832c473dbb6942199a1f0a6b228dcad115c6f83a63fea00c76df77dad0ba4d7577240fbec5257eb', 4, 1, 'MySecret', '[]', 0, '2020-03-23 17:49:55', '2020-03-23 17:49:55', '2021-03-23 18:49:55'),
('317667c49c7c09e82a690b28df2804cc33e59fdbdc781800ef6f02c45ab2f32b881030699bf708b9', 4, 1, 'MySecret', '[]', 0, '2020-03-23 18:09:28', '2020-03-23 18:09:28', '2021-03-23 19:09:28'),
('865b42e8ba1aa2a9ec4eef12bc9dbb638d1026579756905453c0d5dc8ac90aab532444446d3a3246', 9, 1, 'MySecret', '[]', 0, '2020-03-23 18:26:05', '2020-03-23 18:26:05', '2021-03-23 19:26:05'),
('5440063f62e38be251d5d0c7700252b67cc46d8598015b6e1bf577a78d787cb1bdf84ca19955240b', 1, 1, 'MySecret', '[]', 0, '2020-04-02 15:11:59', '2020-04-02 15:11:59', '2021-04-02 16:11:59'),
('aa58cff3da4fd2c17fa2cc27440245f21bbe9b6dab3abd38619f06fbcb790be02c2ca9c1c019df2e', 4, 1, 'MySecret', '[]', 0, '2020-03-24 23:15:29', '2020-03-24 23:15:29', '2021-03-25 00:15:29'),
('451152f5aa5a67d3da3af8368aee416b9ef5bacabc041e6e731d33328e0fbd9963ef53dc9ec81702', 4, 1, 'MySecret', '[]', 0, '2020-03-24 23:42:21', '2020-03-24 23:42:21', '2021-03-25 00:42:21'),
('5908f2bbddc054f0d0af74a7685082e1f5a03c771824f1a53cca9b5c19b8030dcb2229511fcd5ccd', 4, 1, 'MySecret', '[]', 0, '2020-03-24 23:44:16', '2020-03-24 23:44:16', '2021-03-25 00:44:16'),
('7ecd5a595e87816a1144a37f166ff3fd41a402abc48d01001463934a2e0a1c8c73aeeb1847396f71', 4, 1, 'MySecret', '[]', 0, '2020-03-24 23:44:38', '2020-03-24 23:44:38', '2021-03-25 00:44:38'),
('37ec608f173824c52e556708d65bfec347cd6be8e2ce7bf5d500df4df823f3106a683380503a186f', 9, 1, 'MySecret', '[]', 0, '2020-03-24 23:58:01', '2020-03-24 23:58:01', '2021-03-25 00:58:01'),
('7de05ce641304c1d6486b66ae297bef702caa895c564ff60ba39fa8d514c433a9706d78a7e1bc696', 4, 1, 'MySecret', '[]', 0, '2020-03-25 00:04:45', '2020-03-25 00:04:45', '2021-03-25 01:04:45'),
('a486a1d8bef84823ef6c0b56a6c0bc60e538f53dc7f046ba36dbe2e2fe5709f5905e21b3df62ed2c', 4, 1, 'MySecret', '[]', 0, '2020-03-25 00:07:56', '2020-03-25 00:07:56', '2021-03-25 01:07:56'),
('7bfd31202928f1656b4bd0adf55ad7da1630be6118e24306930b746de6ad78479d52f82d38d4c90c', 4, 1, 'MySecret', '[]', 0, '2020-03-25 22:42:41', '2020-03-25 22:42:41', '2021-03-25 23:42:41'),
('4a33e14cc7b7e91ad385cd14c17a473c4a699173901ed5844898ff75659a7d5334fcadf479309694', 4, 1, 'MySecret', '[]', 0, '2020-03-25 23:45:42', '2020-03-25 23:45:42', '2021-03-26 00:45:42'),
('8a157718aee8347ade01d9417afb17cb48ee1a5ebb8bfebbcffe5030343318e5e3fbd7a5e57d1451', 4, 1, 'MySecret', '[]', 0, '2020-03-26 00:01:46', '2020-03-26 00:01:46', '2021-03-26 01:01:46'),
('23889211c6644efb63d1260b84bcc77fbc1857f27d723bf58ee7d1961e4c3eafbb94f61034203b8c', 4, 1, 'MySecret', '[]', 0, '2020-03-26 00:31:57', '2020-03-26 00:31:57', '2021-03-26 01:31:57'),
('be75129b7e3d630b11223ad7802d3192b60bae2a8bcdf8647c63bf5b93691dd389a6bbf522ca7a0b', 4, 1, 'MySecret', '[]', 0, '2020-03-26 00:44:05', '2020-03-26 00:44:05', '2021-03-26 01:44:05'),
('d7f6c2607896b807ef51829c57d4a725560e01a8da1123bc0aa2f56fb8f53174b9c48d25e68ee437', 4, 1, 'MySecret', '[]', 0, '2020-03-26 00:52:02', '2020-03-26 00:52:02', '2021-03-26 01:52:02'),
('bb2ecbc1ff2673911d84a349e95cbca0a007c2754a84339992b56e746adf9688656dfccf54c92e57', 4, 1, 'MySecret', '[]', 0, '2020-03-26 01:35:28', '2020-03-26 01:35:28', '2021-03-26 02:35:28'),
('843c8a8b42841d37967cc69a2ee11753306c800d8a289cf04ca365f64fd1cc898e67da37b0db2384', 4, 1, 'MySecret', '[]', 0, '2020-03-26 01:48:59', '2020-03-26 01:48:59', '2021-03-26 02:48:59'),
('b9154cbda3d881fa93f969037375b28e2505e4963b4cae97fbdabe667c8e593b064bacce4c06fb0b', 4, 1, 'MySecret', '[]', 0, '2020-03-26 01:55:54', '2020-03-26 01:55:54', '2021-03-26 02:55:54'),
('26bd5a1fdc84b9b1230221dcbb26b50108e257bc769655e41b063f4e4214231905074c0666769d34', 4, 1, 'MySecret', '[]', 0, '2020-03-26 02:00:34', '2020-03-26 02:00:34', '2021-03-26 03:00:34'),
('fdbbe1dca1d131de3193dc3e408e8ac548515fdd44b99c2cd74a56bba59d4ed21b39cc186ffee4d1', 4, 1, 'MySecret', '[]', 0, '2020-03-26 15:04:32', '2020-03-26 15:04:32', '2021-03-26 16:04:32'),
('8084ef400caf8061b6f97b84531664e736a9d5bbceed8270d1c4ae8251fdcb7a817275459f4a4a09', 4, 1, 'MySecret', '[]', 0, '2020-03-26 15:49:28', '2020-03-26 15:49:28', '2021-03-26 16:49:28'),
('6d2e0d5e4e382727816df934c796df96230a8a8af1bf0e22eb415a415450389b00d95580a6ea871b', 1, 1, 'MySecret', '[]', 0, '2020-04-02 15:20:46', '2020-04-02 15:20:46', '2021-04-02 16:20:46'),
('49af6c670624365d7da452ab729f417ea53775810461dce8b3362762a4236d8c4e20a13e8b4de295', 4, 1, 'MySecret', '[]', 0, '2020-03-26 20:32:24', '2020-03-26 20:32:24', '2021-03-26 21:32:24'),
('f1e71607de72a733681f8b8600fa5f87892feef8ae22de07c9be80c075c8cbb35e75295a820d7cd0', 10, 1, 'MySecret', '[]', 0, '2020-03-26 20:45:11', '2020-03-26 20:45:11', '2021-03-26 21:45:11'),
('93a7625683fa3da4adaab0ce2e50dac8ab0f60ae26e2bd9e6bd87c67b282349da153c0aa2a6ee6e3', 1, 1, 'MySecret', '[]', 0, '2020-04-02 18:44:36', '2020-04-02 18:44:36', '2021-04-02 19:44:36'),
('c61c445b81a85757d2c67751a488f60da1a4bfadacb32cd2532cae519e9f33f97d9035657fbe9cbc', 4, 1, 'MySecret', '[]', 0, '2020-03-27 00:39:17', '2020-03-27 00:39:17', '2021-03-27 01:39:17'),
('a37ad355372dc6f44921209c50218b93be1d238f24f1f36861bc82e3befb4b3994e9364306521e76', 1, 1, 'MySecret', '[]', 0, '2020-04-02 18:45:57', '2020-04-02 18:45:57', '2021-04-02 19:45:57'),
('43dff8a8011c2c32a4dd2e67fc60272b2c25ea2e21393e68875607bca3e013f9487af70c83389360', 1, 1, 'MySecret', '[]', 0, '2020-04-02 21:28:07', '2020-04-02 21:28:07', '2021-04-02 22:28:07'),
('cdc0b2773c9ef7907b3a4c55a3d05ed91942d8e66ec7ba97270a63f0be5ca48e3a1b44032ccb3b7e', 2, 1, 'MySecret', '[]', 0, '2020-04-02 21:29:11', '2020-04-02 21:29:11', '2021-04-02 22:29:11'),
('e68e8e7cad647d1530ea6945f11479d3f524d674388fa1fb051973f60069eb6a058833b9270bb51e', 8, 1, 'MySecret', '[]', 0, '2020-04-02 22:19:05', '2020-04-02 22:19:05', '2021-04-02 23:19:05'),
('9fe669a2a08abdcd45d786e8a5a87dda94403dc762d1b14977930418769029de25594239ab1da838', 1, 1, 'MySecret', '[]', 0, '2020-04-03 12:51:05', '2020-04-03 12:51:05', '2021-04-03 13:51:05'),
('2a801e5341f398eca323eec843969f2d5dfddf3f0b03ddfaa0288ad78002d71dc7fb6cd310a81053', 1, 1, 'MySecret', '[]', 0, '2020-04-03 14:07:26', '2020-04-03 14:07:26', '2021-04-03 15:07:26'),
('40668766938632684fca8986b34f577b0ec998c67a1d9fcdb36b91dc92bc4be54fc57dd62412d789', 1, 1, 'MySecret', '[]', 0, '2020-04-03 15:57:33', '2020-04-03 15:57:33', '2021-04-03 16:57:33'),
('c59a7f1b37bdb6c2ec72cd68daef536feff794c9b73196fd49041141769e7b4ae01a157248723bc2', 18, 1, 'MySecret', '[]', 0, '2020-04-03 16:33:04', '2020-04-03 16:33:04', '2021-04-03 17:33:04'),
('e54967a6be30c2935fe9dc15598367d48e4148fb0d7b27c35554cdb8b8d536dd4ff6642709132ca1', 1, 1, 'MySecret', '[]', 0, '2020-04-04 14:27:29', '2020-04-04 14:27:29', '2021-04-04 15:27:29'),
('e40295ddec80e92c2ad45363191f0d2e6476584a425285ae837c9b42f56726267f2a2b5430152923', 1, 1, 'MySecret', '[]', 0, '2020-04-04 15:15:39', '2020-04-04 15:15:39', '2021-04-04 16:15:39'),
('6ae60dc03327c33e3f5c8f388ac90704cd0f688bee1096330bd6920ea0d43faa1223e7e171b2b8f4', 1, 1, 'MySecret', '[]', 0, '2020-04-04 15:25:37', '2020-04-04 15:25:37', '2021-04-04 16:25:37'),
('5d9fae65799aeeba5f59aa4b8b0a9fc9a62ac826bb20b0c9578f25373140bdc2f0a3d509b985040c', 1, 1, 'MySecret', '[]', 0, '2020-04-05 11:30:20', '2020-04-05 11:30:20', '2021-04-05 12:30:20'),
('91b9ff7aad18599256ecb81e0012448e416fabd811182a21e08ad48fd1af7df0b2fb215bd43e7cbf', 1, 1, 'MySecret', '[]', 0, '2020-04-05 11:30:20', '2020-04-05 11:30:20', '2021-04-05 12:30:20'),
('5d6ebddedaa225fd9fb5626f3b72ccbe90ef0e92d212881cae81d3fc560acc36530c33880fbd0a0f', 1, 1, 'MySecret', '[]', 0, '2020-04-05 14:53:25', '2020-04-05 14:53:25', '2021-04-05 15:53:25'),
('6b451b7b6ea3c1d00250ccc159c3006da4cae028951ad56acaee1de56bf390836c0f72b3b8e2ad6f', 2, 1, 'MySecret', '[]', 0, '2020-04-05 14:58:42', '2020-04-05 14:58:42', '2021-04-05 15:58:42'),
('e79dcb3dc160fd3dc07ded0a1edcc8f0618740f9db81bb1af807047ac3d3aa16063321b2ffc8fe2b', 2, 1, 'MySecret', '[]', 0, '2020-04-05 15:01:05', '2020-04-05 15:01:05', '2021-04-05 16:01:05'),
('afafc155c074bd26df066a2c6612e7da6170af696e4fd0434347440a7889fe22b94c20c209199d2e', 1, 1, 'MySecret', '[]', 0, '2020-04-05 15:05:09', '2020-04-05 15:05:09', '2021-04-05 16:05:09'),
('477e360c3a88e8bce7af0c412c946b033f2651a4c745286af887366bbfd3e5847edafdc29bd6134c', 1, 1, 'MySecret', '[]', 0, '2020-04-05 20:02:10', '2020-04-05 20:02:10', '2021-04-05 21:02:10'),
('8b950cc53198c270b9b49b27f3784cfc62c089996ef895487afd2cc7501cd08b5c286cb940041761', 2, 1, 'MySecret', '[]', 0, '2020-04-05 20:16:38', '2020-04-05 20:16:38', '2021-04-05 21:16:38'),
('77c482510f3afa6fba57fb31e24ae2ec9dc5962a440873ca9cb6d4743a7b2d5d85fa9a3792d49802', 8, 1, 'MySecret', '[]', 0, '2020-04-05 20:20:02', '2020-04-05 20:20:02', '2021-04-05 21:20:02'),
('f11265d2abb2c0ab3ff55fb6db352eeef75cdee902a1d240bf22c7f0bab15bf675160c587bc2476b', 1, 1, 'MySecret', '[]', 0, '2020-04-05 20:22:05', '2020-04-05 20:22:05', '2021-04-05 21:22:05'),
('c52bac60a3d3188647d23b077cd2e9017afdc87a1fd8961b77136680a6392074793b00fea29585ef', 8, 1, 'MySecret', '[]', 0, '2020-04-05 21:09:28', '2020-04-05 21:09:28', '2021-04-05 22:09:28'),
('8a0fea2ec9a7edc65c4ccf53976b01ac2b00205b9afb5cae3fd07629d4f796abe323974deff4b466', 1, 1, 'MySecret', '[]', 0, '2020-04-05 23:33:05', '2020-04-05 23:33:05', '2021-04-06 00:33:05'),
('7f604f61740943d18cb4cc560dedc48cfdc0941c99875d7c62006f77a748e59d3d2c101ccecdbfc5', 8, 1, 'MySecret', '[]', 0, '2020-04-06 21:53:01', '2020-04-06 21:53:01', '2021-04-06 22:53:01'),
('1a24ffcb07be94cc5298f8e917ef287d992911e7684dd3d1b47c0abd9da95a49812b2690b1f1ec96', 8, 1, 'MySecret', '[]', 0, '2020-04-09 11:20:28', '2020-04-09 11:20:28', '2021-04-09 12:20:28'),
('c5424cfd3bc18bd970d93e0e8737cae008c307af017541c2ff93b2bc15f9eb6308e494af54de7cd4', 8, 1, 'MySecret', '[]', 0, '2020-04-09 13:53:02', '2020-04-09 13:53:02', '2021-04-09 14:53:02'),
('5dee7156d50c2dee9c12f614909c84e4701c8bcd46d40af7b31362bebc6f776155fb850083dfbae8', 19, 1, 'MySecret', '[]', 0, '2020-04-09 13:53:44', '2020-04-09 13:53:44', '2021-04-09 14:53:44'),
('94d867e32de138cdd5a0b3c4ca6ea280751aeebc6c9a2cb5333e2a6e34ed50bd0b0bbe2f4d4d705b', 20, 1, 'MySecret', '[]', 0, '2020-04-09 14:09:15', '2020-04-09 14:09:15', '2021-04-09 15:09:15'),
('a68d0f1df3cf3c6c10f056870a24cde30353c79648321247c0e0f4a4fbd64d48210f7ce273be9e7c', 20, 1, 'MySecret', '[]', 0, '2020-04-09 15:06:09', '2020-04-09 15:06:09', '2021-04-09 16:06:09'),
('9976563890aa606eb16c218051c09915f93d58baf66aec3972268e2fbd65f85a98e9d6540df30661', 20, 1, 'MySecret', '[]', 0, '2020-04-09 15:07:26', '2020-04-09 15:07:26', '2021-04-09 16:07:26'),
('0479d9ed878eb48416d840c10e392bea61197155864ab150a298beb0c7c2dc2a32db58902ec94846', 20, 1, 'MySecret', '[]', 0, '2020-04-09 21:10:19', '2020-04-09 21:10:19', '2021-04-09 22:10:19'),
('9ab35fb3a468ec7cda71c490fb8289dec2a1805606b921e11fc681b7d7317347da206048231f4e2c', 20, 1, 'MySecret', '[]', 0, '2020-04-09 22:14:29', '2020-04-09 22:14:29', '2021-04-09 23:14:29'),
('6ed9caa65ba7184c446f63a10998fb0fbfde9df77b054b9d8b05cd40edc100a207caa0c94d99023a', 21, 1, 'MySecret', '[]', 0, '2020-04-09 22:16:14', '2020-04-09 22:16:14', '2021-04-09 23:16:14'),
('8f01c07f3d464ce451f70d44f7a178cfa7e734210ecfbc03138ec5dc8abf43818b2b9d43251d6fc8', 20, 1, 'MySecret', '[]', 0, '2020-04-09 22:29:18', '2020-04-09 22:29:18', '2021-04-09 23:29:18'),
('d77ed1bfb49a1fe10d98b658e96b91474806f2540dfd4565aba0a9cad17dce35d31d299c02900453', 20, 1, 'MySecret', '[]', 0, '2020-04-09 22:35:52', '2020-04-09 22:35:52', '2021-04-09 23:35:52'),
('1566b5616d7f35a3aee10f447ec5bb9995610d375e15275add26a9631714fcf97d279cd8ee9c8f32', 20, 1, 'MySecret', '[]', 0, '2020-04-09 23:53:35', '2020-04-09 23:53:35', '2021-04-10 00:53:35'),
('2bfc5f0494f7b72e9992d707385816a68778d53b4a51666f9b0fc2700b1912d68bf9e4f4096df3d2', 20, 1, 'MySecret', '[]', 0, '2020-04-10 12:46:31', '2020-04-10 12:46:31', '2021-04-10 13:46:31'),
('0fd1e298b05422138309860b62fe2e67464a97e9a0bf2116db8c58c9af61e5b85a9dd712cfd36d2c', 22, 1, 'MySecret', '[]', 0, '2020-04-10 12:50:34', '2020-04-10 12:50:34', '2021-04-10 13:50:34'),
('87542ab08c9059a610a98137d75a50509584395523013c6c729fa1e2766694f18b28c50c66a78b7f', 22, 1, 'MySecret', '[]', 0, '2020-04-10 12:55:11', '2020-04-10 12:55:11', '2021-04-10 13:55:11'),
('9b056a3392ab058a2765b9c00f1732dc5933286e81f8ffa49e0aaa735cef18c76b3c7b4c0edc91b5', 22, 1, 'MySecret', '[]', 0, '2020-04-10 12:57:52', '2020-04-10 12:57:52', '2021-04-10 13:57:52'),
('d97c62e18a0fd2469dbce84fe62a0a0c6ef59ccd9643bf837e820f57eb936b8e38c00a6c8b6326ea', 22, 1, 'MySecret', '[]', 0, '2020-04-10 12:59:15', '2020-04-10 12:59:15', '2021-04-10 13:59:15'),
('a886eeab80a4705d78aed2cb4a84df30c76ed6b65bfb60ac18d638b8fadb5db2d3ff36e3b9a34606', 22, 1, 'MySecret', '[]', 0, '2020-04-10 15:23:04', '2020-04-10 15:23:04', '2021-04-10 16:23:04'),
('a232adea049db05b9ea36d4936e54a6ad17aa636965d7f08a1a0396e5a0c3eb29a4ea05b01c58c1a', 22, 1, 'MySecret', '[]', 0, '2020-04-10 20:59:47', '2020-04-10 20:59:47', '2021-04-10 21:59:47'),
('e5d5ddace7e35074f248bb276be1b7d48423aabb9d1c67f7e65ae0dc5d4da949a0e581b65fe07dd3', 22, 1, 'MySecret', '[]', 0, '2020-04-11 00:33:16', '2020-04-11 00:33:16', '2021-04-11 01:33:16'),
('da5d3716a1727c84933963dc3c3251ac0499ca05fb71de069d9b8180c9bdb70f7cf723bd20a28667', 22, 1, 'MySecret', '[]', 0, '2020-04-11 02:50:45', '2020-04-11 02:50:45', '2021-04-11 03:50:45'),
('162aabbdbe20d611c0bb6b24ab32259204804d98b084bd53885a78f492f0b8dc12f58cd006180ace', 22, 1, 'MySecret', '[]', 0, '2020-04-11 17:19:42', '2020-04-11 17:19:42', '2021-04-11 18:19:42'),
('e518a2373f6e639038a8e8b4ff74b9ba3cdd4de1672f783fff75609c8882f31401378db966bcb447', 22, 1, 'MySecret', '[]', 0, '2020-04-11 17:30:26', '2020-04-11 17:30:26', '2021-04-11 18:30:26'),
('2e3ae1f446ee4248bf93d624e8522a2de8fc40cc1a8b4bd1e425a0072c3511aed8ac5180501293c6', 22, 1, 'MySecret', '[]', 0, '2020-04-15 22:14:39', '2020-04-15 22:14:39', '2021-04-15 23:14:39'),
('57f489fd48b40f26b40da5ed375a8842e7354db7bfab75a9a2c7fe83750fc9ae7759e366d6238861', 22, 1, 'MySecret', '[]', 0, '2020-04-15 22:29:57', '2020-04-15 22:29:57', '2021-04-15 23:29:57'),
('63995ca66fdb9ecbb223e3c02a645f68a83e58bcb17f2296b96c5cf9739a81edb210e3097a2795b3', 5, 1, 'MySecret', '[]', 0, '2020-04-15 22:39:39', '2020-04-15 22:39:39', '2021-04-15 23:39:39'),
('8309b1e6615862c00d85766582f50a3676555fdd0e01917f20d07f5894d1bf46bc4062c6382aa2ec', 22, 1, 'MySecret', '[]', 0, '2020-04-15 23:56:24', '2020-04-15 23:56:24', '2021-04-16 00:56:24'),
('2dd82295f2b6e56fc84492f26a9ce089c7c2436f3c17064f4c0fb3b9abb3fa4c437618bcdafa8dd8', 22, 1, 'MySecret', '[]', 0, '2020-04-15 23:57:38', '2020-04-15 23:57:38', '2021-04-16 00:57:38'),
('b7794a7c40465997fc7f69554e6ddc08e8175279ab80d0978159b76c481c159a2fb1360e7f86edf1', 20, 1, 'MySecret', '[]', 0, '2020-04-16 00:34:37', '2020-04-16 00:34:37', '2021-04-16 01:34:37'),
('66f555db2eb31e40a7c524927b6c224f1dd87ae02ecc0b6a717050708149836057b5c96ba45ddf58', 5, 1, 'MySecret', '[]', 0, '2020-04-16 00:36:10', '2020-04-16 00:36:10', '2021-04-16 01:36:10'),
('fb70d6ae477684421b9488deb0111ca26b0c2bd22e4cb834b008340edd4736511ae5ecc27360a658', 22, 1, 'MySecret', '[]', 0, '2020-04-16 00:38:16', '2020-04-16 00:38:16', '2021-04-16 01:38:16'),
('7b46ca4bebf46514bbebb990f4386a01f43654e762d70875e500805730494059467d311515db044d', 22, 1, 'MySecret', '[]', 0, '2020-04-16 00:49:58', '2020-04-16 00:49:58', '2021-04-16 01:49:58'),
('4a386a7ad98d1c95e8a26edfe39b6f52bf40c2fa533f5286d2d189e818c55c09f2062a8caefe723a', 22, 1, 'MySecret', '[]', 0, '2020-04-16 01:08:27', '2020-04-16 01:08:27', '2021-04-16 02:08:27'),
('973d696438d28230f56f9bb4c52e1440fefe20e1f4133b31030b1bcbc1d58dbbb3a17ce87337ca49', 22, 1, 'MySecret', '[]', 0, '2020-04-20 14:02:19', '2020-04-20 14:02:19', '2021-04-20 14:02:19'),
('e0758198af38e5d3e1d669a922a0b2696f6018fd059af0f60dd22e3f78028b4b3dc0e166a79790f1', 22, 1, 'MySecret', '[]', 0, '2020-04-21 15:23:41', '2020-04-21 15:23:41', '2021-04-21 15:23:41');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'CUp50S2yGemTjEb3qQLfvnvXLioZCbah0FbfVOO1', 'http://localhost', 1, 0, 0, '2020-03-17 17:47:03', '2020-03-17 17:47:03'),
(2, NULL, 'Laravel Password Grant Client', 'phSzn1SEEYqMYIy3Xbi0w4KkrPD6mCCEVBb7C3hY', 'http://localhost', 0, 1, 0, '2020-03-17 17:47:03', '2020-03-17 17:47:03');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-03-17 17:47:03', '2020-03-17 17:47:03');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `optics`
--

DROP TABLE IF EXISTS `optics`;
CREATE TABLE IF NOT EXISTS `optics` (
  `idOptic` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idRDV` bigint(20) UNSIGNED DEFAULT NULL,
  `leftSphere` double(8,2) NOT NULL,
  `leftCylindre` double(8,2) NOT NULL,
  `leftAxe` double(8,2) NOT NULL,
  `leftAdd` double(8,2) NOT NULL,
  `rightSphere` double(8,2) NOT NULL,
  `rightCylindre` double(8,2) NOT NULL,
  `rightAxe` double(8,2) NOT NULL,
  `rightAdd` double(8,2) NOT NULL,
  PRIMARY KEY (`idOptic`),
  KEY `optics_idrdv_foreign` (`idRDV`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `optics`
--

INSERT INTO `optics` (`idOptic`, `idRDV`, `leftSphere`, `leftCylindre`, `leftAxe`, `leftAdd`, `rightSphere`, `rightCylindre`, `rightAxe`, `rightAdd`) VALUES
(1, 3, 1.00, 1.00, 1.00, 1.00, 2.00, 2.00, 2.00, 2.00),
(2, 3, 67.00, 9.00, 8.00, 1.00, 3.00, 4.00, 4.00, 4.00),
(3, 9, 9.00, 6.00, 2.00, 9.00, 3.00, 8.00, 7.00, 6.00),
(4, 4, 6.00, 8.00, 9.00, 4.00, 4.00, 7.00, 8.00, 8.00);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
CREATE TABLE IF NOT EXISTS `prescriptions` (
  `idPrescription` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idRdv` bigint(20) UNSIGNED DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idPrescription`),
  KEY `prescriptions_idrdv_foreign` (`idRdv`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prescriptions`
--

INSERT INTO `prescriptions` (`idPrescription`, `idRdv`, `data`) VALUES
(1, 3, '\n-mzyaaan\n-ca marche\n-stiiktiik'),
(2, 3, '\n-bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'),
(3, 3, '\n-ddd'),
(4, 3, '\n-vvvvvvvvvvvv\n-ttttttttttt\n-yyyyyyyyyy'),
(5, 3, ''),
(6, 9, '\n-ffffffff\n-hgytrfyttr'),
(7, 4, '\n-medicament');

-- --------------------------------------------------------

--
-- Structure de la table `rendezvouses`
--

DROP TABLE IF EXISTS `rendezvouses`;
CREATE TABLE IF NOT EXISTS `rendezvouses` (
  `idRendezVous` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idRendezVous`),
  KEY `rendezvouses_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rendezvouses`
--

INSERT INTO `rendezvouses` (`idRendezVous`, `description`, `user_id`, `start`, `end`, `created_at`, `updated_at`) VALUES
(1, 'gggggggggggggg', 22, '2020-04-20 12:00:00.000Z', '2020-04-20 12:00:00.000Z', '2020-04-21 15:25:41', '2020-04-20 15:25:41'),
(2, 'bbbbbbbbbbbbbbbbb', 22, '2020-04-2112:00:00.000Z', '2020-04-20 12:00:00.000Z', '2020-04-20 15:49:35', '2020-04-20 15:49:35'),
(17, 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 16:46:58', '2020-04-21 16:46:58'),
(4, 'je veux prendre un rendez-vous pour demain.', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 15:50:11', '2020-04-21 15:50:11'),
(5, 'je veux prendre un rendez-vous pour demain.', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 15:51:02', '2020-04-21 15:51:02'),
(6, 'je veux prendre un rendez vous pour demain', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 15:51:54', '2020-04-21 15:51:54'),
(7, 'je veux prendre un rendez vous pour demain', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 15:53:30', '2020-04-21 15:53:30'),
(8, 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 15:53:53', '2020-04-21 15:53:53'),
(9, 'bbbbbbbbbbbb', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 15:54:26', '2020-04-21 15:54:26'),
(10, 'tttttttttttttttttttttttttttttttt', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 16:04:58', '2020-04-21 16:04:58'),
(11, 'bbbbbbbbbbbbbbbbbbbbbbbbbb', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 16:05:33', '2020-04-21 16:05:33'),
(12, 'ggggggggggggggggg', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 16:05:57', '2020-04-21 16:05:57'),
(15, 'vvvvvvvvvvvvvv', 22, '2020-04-22 12:00:00.000Z', '2020-04-22 12:00:00.000Z', '2020-04-21 16:41:05', '2020-04-21 16:41:05');

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`id`, `date`) VALUES
(1, '2020-04-22');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_cin_unique` (`cin`) USING HASH,
  UNIQUE KEY `users_email_unique` (`email`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `cin`, `mobile`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(22, 'boutaina naour', 'BE457689', '0691747472', 'naourboutaina7@gmail.com', NULL, '$2y$10$jYNrSIyz7yuSHQaPLCKW1O4w.HIS9qvb15/.6uNiXKQ7T3XL3qNrK', '8k1gSpcLCAfdVv0DWIAHTMiBaUFCTlpxQcN9ecIonhmYJrVNtPThvoLmP4Z2', '2020-04-10 12:50:33', '2020-04-21 15:34:06'),
(20, 'oumaima rhezoune', 'JM45678', '06789945672', 'oumaimamery25@gmail.com', NULL, '$2y$10$USlpsTme9mp4hikll8eK/Ory31BB1HGKec8hstBN5gxuz.h97.BFC', 'aJDwEk6Cc3NZ33ma2zdWQjnIikzYLfefQx3hbXmUcRnh7rCGEjYEwALDDBcZ', '2020-04-09 14:09:15', '2020-04-16 00:24:18');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
