-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2017 at 08:04 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2_paslaugos`
--
CREATE DATABASE IF NOT EXISTS `yii2_paslaugos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci;
USE `yii2_paslaugos`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', NULL),
('admin', '4', NULL),
('all-services-list', '5', NULL),
('create-services', '2', NULL),
('create-services', '5', NULL),
('update-users-service', '2', NULL),
('update-users-service', '5', NULL),
('users-profile', '2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('add-permission', 1, 'Add a Permission (auth)', NULL, NULL, NULL, NULL),
('admin', 1, 'admin all', NULL, NULL, NULL, NULL),
('all-services-list', 1, 'All services list', NULL, NULL, NULL, NULL),
('change-satus', 1, 'Disable or Enable a User Account', NULL, NULL, NULL, NULL),
('create-services', 1, 'create-services', NULL, NULL, NULL, NULL),
('update-users-service', 1, 'update-users-service', NULL, NULL, NULL, NULL),
('users-profile', 1, 'users-profile', NULL, NULL, NULL, NULL),
('view-settings-page', 1, 'View Settings Page', NULL, NULL, NULL, NULL),
('view-user-list', 1, 'Wiew user list page (settings/user)', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('add-permission', 'users-profile'),
('admin', 'add-permission'),
('admin', 'all-services-list'),
('admin', 'change-satus'),
('admin', 'create-services'),
('admin', 'update-users-service'),
('admin', 'users-profile'),
('admin', 'view-settings-page'),
('admin', 'view-user-list');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_general_mysql500_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1511861476),
('m130524_201442_init', 1511861483);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_general_mysql500_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `description`, `updated_at`, `created_at`) VALUES
(13, 4, 'Sporto klubas', 'Vilniaus sporto klubas!!', '2017-11-29 18:11:13', '2017-11-29 18:11:29'),
(14, 4, 'Girstučio baseinas', 'Sportas, treniruotės, baseinas.', '2017-11-29 19:11:30', '2017-11-29 19:11:30'),
(15, 4, 'Bokso klubas', 'Bendros bokso treniruotės', '2017-11-29 19:11:10', '2017-11-29 19:11:10'),
(16, 5, 'Šokių pamokos', 'Rengiamos šokių pamokos suaugusiems ir vaikams.', '2017-11-29 19:11:06', '2017-11-29 19:11:06'),
(17, 5, 'Masažas', 'Masažas tau!!!', '2017-11-29 19:11:28', '2017-11-29 19:11:28');

-- --------------------------------------------------------

--
-- Table structure for table `services_categories`
--

CREATE TABLE `services_categories` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_general_mysql500_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `services_categories`
--

INSERT INTO `services_categories` (`id`, `service_id`, `name`, `description`, `updated_at`, `created_at`) VALUES
(32, 13, 'Treneris', 'Treniruotė su treneriu.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 13, 'Grupinė treniruotė', 'Grupinė treniruotė su treneriu.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 14, 'Grupiniai užsiėmimai', 'Grupiniai užsiėmimai', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 14, 'Baseinas', 'Plaukimas ir kt..', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 14, 'Treniruoklių salė', 'Treniruoklių salė ir kt...', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 15, 'Individualios bokso treniruotės', 'Tokių treniruočiu metu treneriai dirba su klientu individualiai. Profesionaliai – norintiems siekti aukštų rezultatų bokso srityje arba norintiems pagerinti fizinę formą, turintiems sveikatos problemų', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 15, 'Vaikų ir jaunimo bokso grupė', 'Grupėje dirbama su vaikais nuo 10 metų amžiaus, bei jaunimu. Šios amžiaus grupės sportininkai mokomi bokso technikos, strategijos, lavinami raumenys, jėga, ištvermė bei greitis. Krūviai didinami laipsniškai, atsižvelgiant į kiekvieno sportininko fizinę būklę, bei galimybes.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 16, 'Dovanų kuponai', 'Norite nustebinti artimąjį? Įteikite dovanų kuponą į \"Aistra Šokiui\" rengiamus pramoginių šokių kursus! Šokių pamokos puiki dovana įvairių švenčių proga!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 17, 'Tailandietiškas viso kūno masažas', 'Tailandietiškas viso kūno masažas', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `first_name`, `last_name`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 'viktoras', 'Viktoras', 'Viktoraitis', '1kEhQA_QVGftLOXAa0xuK2Vie9VodRQQ', '$2y$13$KrGblsuzhm/EmgznrbJqUeewWR0KakYa6utHzAsIUgIgT3H3w2qiK', NULL, 'viktoras@viktoras.lt', 10, 1511949660, 1511982202),
(3, 'mykolas', 'Mykolas', 'Mykolaitis', 'qAEU31ksLcKmgQheXrLDrvMlZ5YkfL-O', '$2y$13$yZ5yWI5PM854foWfGXFtu.HCGU56PtQGRjjfdE6gAPfVAMB6D.Hcq', NULL, 'mykolas@mykolas.lt', 10, 1511973262, 1511973262),
(4, 'demo', 'Demo', 'Demooo', 'A5m2PR-R6VjBhYbsJNpdxYtJrEKZE_hJ', '$2y$13$9G4mbo9tNW2vtJe.JNu8lOdTkTDq0jU5ghTeCvY8Cehowi92/vI..', NULL, 'demo@demo.demo', 10, 1511976725, 1511976725),
(5, 'edvardas', 'Edvardas', 'Edvardauskas', 'eJ9CxFxlUIoU-2i7og2T0Haqpn1y3qpW', '$2y$13$YzsNaTgOUY8giLYBJZr9keYP1Vq1.bFJtrPqb47vroT4ppS8sKImG', NULL, 'edvardas@edvardas.lt', 10, 1511981242, 1511981242);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `services_categories`
--
ALTER TABLE `services_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `services_categories`
--
ALTER TABLE `services_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `services_categories`
--
ALTER TABLE `services_categories`
  ADD CONSTRAINT `services_categories_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
