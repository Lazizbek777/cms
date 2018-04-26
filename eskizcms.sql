-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 21, 2018 at 06:38 PM
-- Server version: 5.5.53
-- PHP Version: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eskizcms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL,
  `role` enum('journalist','editor','admin') NOT NULL DEFAULT 'journalist',
  `login` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `role`, `login`, `email`, `name`, `password`, `active`) VALUES
(1, 'admin', 'admin', 'web@eskiz.uz', 'Eskiz.uz', '$2y$10$KTinuT1zFJRNtnNno1v3ouDjRwOdDS0KcyjeSqKHW4bMKFhpih.3q', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_configuration`
--

CREATE TABLE `cms_configuration` (
  `key` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_configuration`
--

INSERT INTO `cms_configuration` (`key`, `value`) VALUES
('ADMIN_EMAIL', 'web@eskiz.uz'),
('DEBUG_MODE', '1'),
('DISPLAY_CHANGELOG', '0'),
('PROFILER', '0'),
('TECHNICAL_WORKS', '0'),
('WIDGETS_CACHE', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cms_javascript`
--

CREATE TABLE `cms_javascript` (
  `id` varchar(20) NOT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_javascript`
--

INSERT INTO `cms_javascript` (`id`, `text`) VALUES
('body', '<!-- custom javascript code or any html -->'),
('head', '<!-- custom javascript code or any html -->');

-- --------------------------------------------------------

--
-- Table structure for table `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int(11) NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `site_name`, `email`, `favicon`, `logo`) VALUES
(1, 'Eskiz IT Company', 'mystore.uz@gmail.com', 'favicon.png', 'logo.svg');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `foto`, `phone`, `email`) VALUES
(1, 'uploads/employee/1.png', '998909002211', 'info@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `employee_translate`
--

CREATE TABLE `employee_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_translate`
--

INSERT INTO `employee_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Анвар салимов'),
(2, 1, 'ru', 'job', 'Менеджер'),
(3, 1, 'ru', 'text', 'Хороший парень классный парень');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `faq_translate`
--

CREATE TABLE `faq_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq_translate`
--

INSERT INTO `faq_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Asdasd'),
(2, 1, 'ru', 'text', 'asdasdasd'),
(3, 2, 'ru', 'title', 'Asdasd'),
(4, 2, 'ru', 'text', 'asdasdasd'),
(5, 3, 'ru', 'title', 'asdasd'),
(6, 3, 'ru', 'text', 'qeqweqwe');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `iso` varchar(10) NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `url` varchar(20) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `primary` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `iso`, `locale`, `name`, `short_name`, `url`, `sortorder`, `primary`) VALUES
(1, 'ru', 'ru_RU', 'Русский', 'Рус', 'ru', 1, '1'),
(2, 'en', 'en_EN', 'English', 'Eng', 'en', 2, '0');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `root` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  `left_key` int(11) DEFAULT NULL,
  `right_key` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `root`, `parent_id`, `slug`, `depth`, `left_key`, `right_key`, `created_at`, `updated_at`) VALUES
(3, 'main', 31, 'about-us', 3, 8, 9, '2016-11-30 19:36:25', '2017-12-13 13:32:33'),
(5, 'main', NULL, '#', 1, 12, 13, '2016-11-30 21:06:14', '2017-10-12 13:35:08'),
(6, 'main', 31, 'services/service-1', 3, 4, 5, '2016-11-30 21:08:26', '2017-10-12 13:35:08'),
(7, 'main', NULL, 'news', 1, 14, 15, '2016-11-30 21:30:10', '2017-10-12 13:35:08'),
(9, 'main', NULL, 'employee', 1, 22, 23, '2016-12-21 10:28:12', '2017-10-12 13:35:09'),
(21, 'main', NULL, 'contacts', 1, 20, 21, '2017-09-11 13:13:05', '2017-10-12 13:35:09'),
(24, 'main', NULL, 'products', 1, 18, 19, '2017-09-12 13:15:20', '2017-10-12 13:35:08'),
(25, 'main', 31, 'products/category1', 3, 6, 7, '2017-09-12 13:15:20', '2017-10-12 13:35:08'),
(29, 'main', NULL, 'articles', 1, 16, 17, '2017-09-12 18:52:59', '2017-10-12 13:35:08'),
(30, 'main', NULL, 'tours', 1, 2, 11, '2017-09-12 19:01:23', '2017-10-12 13:35:08'),
(31, 'main', 30, 'tours/last-minute', 2, 3, 10, '2017-09-12 19:01:23', '2017-10-12 13:35:08'),
(32, 'main', NULL, 'test-page', 1, NULL, NULL, '2017-11-25 11:10:41', '2017-11-25 11:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `menu_translate`
--

CREATE TABLE `menu_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_translate`
--

INSERT INTO `menu_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(3, 3, 'ru', 'title', 'О нас'),
(4, 3, 'en', 'title', 'About us'),
(8, 5, 'ru', 'title', 'Услуги'),
(9, 5, 'en', 'title', 'Services'),
(10, 6, 'ru', 'title', 'Услуги №1'),
(11, 6, 'en', 'title', 'Service №1'),
(12, 7, 'ru', 'title', 'Новости'),
(13, 7, 'en', 'title', 'News'),
(16, 9, 'ru', 'title', 'Сотрудники'),
(29, 21, 'ru', 'title', 'Контакты'),
(30, 21, 'en', 'title', 'Contacts'),
(62, 9, 'ru', 'status', '1'),
(63, 21, 'ru', 'status', '1'),
(65, 7, 'ru', 'status', '1'),
(66, 5, 'ru', 'status', '1'),
(67, 3, 'ru', 'status', '0'),
(69, 6, 'ru', 'status', '1'),
(70, 3, 'en', 'status', '1'),
(72, 21, 'en', 'status', '1'),
(73, 5, 'en', 'status', '1'),
(74, 7, 'en', 'status', '1'),
(76, 24, 'ru', 'title', 'Продукция'),
(77, 24, 'ru', 'status', '1'),
(78, 25, 'ru', 'title', 'Игрушки'),
(79, 25, 'ru', 'status', '1'),
(88, 24, 'en', 'title', 'Products'),
(89, 24, 'en', 'status', '1'),
(90, 25, 'en', 'title', 'Toys'),
(91, 25, 'en', 'status', '1'),
(92, 9, 'en', 'title', 'Employee'),
(93, 9, 'en', 'status', '1'),
(94, 6, 'en', 'status', '1'),
(95, 29, 'ru', 'title', 'Статьи'),
(96, 29, 'ru', 'status', '1'),
(97, 29, 'en', 'title', 'Articles'),
(98, 29, 'en', 'status', '1'),
(99, 30, 'ru', 'title', 'Туры'),
(100, 30, 'ru', 'status', '1'),
(101, 31, 'ru', 'title', 'Экзотичные'),
(102, 31, 'ru', 'status', '1'),
(103, 32, 'ru', 'title', 'Тестовая страница'),
(104, 32, 'ru', 'status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `slug`, `created_at`, `updated_at`, `index_page`) VALUES
(2, 'contacts', '2014-08-03 22:25:13', '2017-09-13 18:54:27', '0'),
(4, 'about-us', '2016-11-28 13:16:52', '2017-12-13 13:32:33', '0'),
(6, 'services-1', '2016-11-30 21:10:07', '2017-08-20 16:52:27', '0'),
(9, 'test-page', '2017-09-11 13:17:18', '2017-11-25 11:12:11', '0'),
(11, 'index', '2017-09-12 22:55:01', '2017-09-12 22:55:48', '0');

-- --------------------------------------------------------

--
-- Table structure for table `page_translate`
--

CREATE TABLE `page_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page_translate`
--

INSERT INTO `page_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(11, 2, 'ru', 'title', 'Контакты'),
(12, 2, 'ru', 'meta_title', 'Контакты'),
(13, 2, 'ru', 'meta_description', 'Контакты описание'),
(14, 2, 'ru', 'meta_keywords', ''),
(15, 2, 'ru', 'text', '<p>&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue tuaasdasdrpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>'),
(46, 4, 'ru', 'title', 'О нас'),
(47, 4, 'ru', 'meta_title', 'О компании'),
(48, 4, 'ru', 'meta_description', 'О нас описание '),
(49, 4, 'ru', 'meta_keywords', ''),
(50, 4, 'ru', 'text', '<p>О нас текст текст ...<img src="../../../uploads/files/megapolis.jpg" alt="" width="1200" height="800" /></p>'),
(56, 6, 'ru', 'title', 'Услуга №1'),
(57, 6, 'ru', 'meta_title', 'Услуга №1'),
(58, 6, 'ru', 'meta_description', ''),
(59, 6, 'ru', 'meta_keywords', ''),
(60, 6, 'ru', 'text', '<p>Услуга текст текст текст Phalcon</p>'),
(66, 2, 'en', 'title', 'Contacts'),
(67, 2, 'en', 'meta_title', 'Contacts'),
(68, 2, 'en', 'meta_description', ''),
(69, 2, 'en', 'meta_keywords', ''),
(70, 2, 'en', 'text', '<p>&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>'),
(71, 4, 'en', 'title', 'About us'),
(72, 4, 'en', 'meta_title', 'About us'),
(73, 4, 'en', 'meta_description', ''),
(74, 4, 'en', 'meta_keywords', ''),
(75, 4, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(76, 6, 'en', 'title', 'Service #1'),
(77, 6, 'en', 'meta_title', 'Service #1'),
(78, 6, 'en', 'meta_description', ''),
(79, 6, 'en', 'meta_keywords', ''),
(80, 6, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(81, 2, 'ru', 'menu_check', '0'),
(82, 4, 'ru', 'menu_check', '0'),
(83, 2, 'en', 'menu_check', '1'),
(104, 9, 'ru', 'title', 'Тестовая страница'),
(105, 9, 'ru', 'meta_title', ''),
(106, 9, 'ru', 'meta_description', ''),
(107, 9, 'ru', 'menu_check', '1'),
(108, 9, 'ru', 'text', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n<p><img src="../../../uploads/files/semeyniy_anons.jpg" alt="" width="400" height="225" /></p>\r\n<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed mi lectus, dapibus vel mi et, tempus venenatis erat. Ut pellentesque nisi ipsum, id facilisis diam blandit ac. Etiam nec arcu mi. Donec lacus nibh, vulputate id blandit vel, porttitor eu augue. Proin sit amet blandit nisi. Pellentesque eget elit leo. Nullam semper vehicula nibh quis pharetra. Suspendisse quis enim magna. Proin ac erat sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam feugiat sodales efficitur. Vivamus molestie iaculis pulvinar. Vestibulum eget arcu in nibh placerat mollis in quis tellus.</p>\r\n<p><img style="margin: 5px;" src="../../../uploads/files/vibtat-kvartiru.jpg" alt="" width="400" height="225" /></p>\r\n<p>Duis imperdiet nisi nec turpis lobortis hendrerit. Fusce dictum metus auctor augue porttitor interdum. Vivamus dapibus faucibus mi, sit amet fermentum lacus tincidunt eu. Sed feugiat ipsum diam. Maecenas id elit blandit, viverra odio eu, gravida arcu. Nunc consequat condimentum imperdiet. Nullam tristique turpis et tellus vehicula, eu laoreet lectus tristique. Phasellus nec tempor erat, aliquam porta est. Mauris bibendum erat ut leo tincidunt fermentum. Nunc hendrerit lacus nec suscipit malesuada. Ut at tellus ut tortor porttitor rhoncus. Quisque blandit tempor varius.</p>\r\n<p><br /><img style="float: left;" src="../../../uploads/files/megapolis.jpg" width="400" height="267" /></p>'),
(109, 9, 'en', 'title', 'TEst page'),
(110, 9, 'en', 'meta_title', ''),
(111, 9, 'en', 'meta_description', ''),
(112, 9, 'en', 'menu_check', '1'),
(113, 9, 'en', 'text', '<p>asdasdasdasd</p>'),
(121, 11, 'ru', 'title', 'Главная'),
(122, 11, 'ru', 'meta_title', ''),
(123, 11, 'ru', 'meta_description', ''),
(124, 11, 'ru', 'text', ''),
(125, 11, 'ru', 'menu_check', '0'),
(126, 11, 'en', 'title', 'Home'),
(127, 11, 'en', 'meta_title', ''),
(128, 11, 'en', 'meta_description', ''),
(129, 11, 'en', 'text', ''),
(130, 11, 'en', 'menu_check', '0');

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE `poll` (
  `id` int(11) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` (`id`, `status`, `created_at`) VALUES
(1, '0', '2017-09-23 09:23:45');

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE `poll_options` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `language` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `vote` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_options`
--

INSERT INTO `poll_options` (`id`, `poll_id`, `language`, `title`, `vote`) VALUES
(1, 1, 'ru', 'Отличный сайт', 1),
(2, 1, 'ru', 'Хороший сайт', 2),
(5, 1, 'ru', 'Средний сайт', 3),
(6, 1, 'ru', 'Плохой сайт', 4),
(7, 1, 'en', 'Excellent website', 1),
(8, 1, 'en', 'Good website', 2),
(9, 1, 'en', 'Normal website', 3),
(10, 1, 'en', 'Bad website', 4);

-- --------------------------------------------------------

--
-- Table structure for table `poll_translate`
--

CREATE TABLE `poll_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_translate`
--

INSERT INTO `poll_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Оцените наш новый сайт'),
(2, 1, 'en', 'title', 'Rate our new website');

-- --------------------------------------------------------

--
-- Table structure for table `poll_votes`
--

CREATE TABLE `poll_votes` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `language` varchar(32) NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_votes`
--

INSERT INTO `poll_votes` (`id`, `poll_id`, `language`, `vote`) VALUES
(52, 1, 'ru', 1),
(53, 1, 'ru', 2),
(55, 1, 'ru', 2),
(56, 1, 'ru', 2),
(57, 1, 'ru', 1),
(58, 1, 'ru', 1),
(66, 1, 'ru', 2),
(67, 1, 'ru', 1),
(70, 1, 'en', 2),
(73, 1, 'ru', 1),
(81, 1, 'ru', 3),
(82, 1, 'ru', 3),
(83, 1, 'ru', 3),
(84, 1, 'ru', 2),
(85, 1, 'ru', 2),
(86, 1, 'ru', 3),
(87, 1, 'ru', 1),
(88, 1, 'ru', 4),
(89, 1, 'ru', 4),
(90, 1, 'ru', 1),
(91, 1, 'ru', 4),
(92, 1, 'ru', 2),
(93, 1, 'ru', 3),
(94, 1, 'ru', 1),
(95, 1, 'ru', 3),
(96, 1, 'ru', 1),
(97, 1, 'ru', 2),
(98, 1, 'ru', 1),
(99, 1, 'ru', 2),
(100, 1, 'ru', 1),
(101, 1, 'ru', 2),
(102, 1, 'ru', 3);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `anons` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`id`, `slug`, `category_id`, `anons`) VALUES
(1, 'uzairways', 3, 'files/original/portfolio/1.jpg'),
(2, 'aaaa', 1, 'files/original/portfolio/2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_category`
--

CREATE TABLE `portfolio_category` (
  `id` int(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portfolio_category`
--

INSERT INTO `portfolio_category` (`id`, `sort`) VALUES
(1, 5),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_category_translate`
--

CREATE TABLE `portfolio_category_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portfolio_category_translate`
--

INSERT INTO `portfolio_category_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Фотографии'),
(2, 2, 'ru', 'title', 'Дизайн'),
(3, 3, 'ru', 'title', 'Вебсайт'),
(4, 1, 'en', 'title', 'Photogallery'),
(5, 2, 'en', 'title', 'Design'),
(6, 3, 'en', 'title', 'Website'),
(7, 4, 'ru', 'title', 'ghfhgh');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_gallery`
--

CREATE TABLE `portfolio_gallery` (
  `id` int(11) NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portfolio_gallery`
--

INSERT INTO `portfolio_gallery` (`id`, `portfolio_id`, `file`, `file_id`) VALUES
(20, 2, 'files/original/portfolio_gallery/b3d04889c7f9e4c3459875ad83d3ec2f.jpg', 'b3d04889c7f9e4c3459875ad83d3ec2f'),
(21, 2, 'files/original/portfolio_gallery/94d5f164f2611376e8c4c6fffed8ad71.jpg', '94d5f164f2611376e8c4c6fffed8ad71'),
(23, 2, 'files/original/portfolio_gallery/369326aa59749e02fb1fde0e5afc6bd3.jpg', '369326aa59749e02fb1fde0e5afc6bd3'),
(26, 2, 'files/original/portfolio_gallery/533b6a3390713598d55a023b54c36633.jpg', '533b6a3390713598d55a023b54c36633'),
(27, 1, 'files/original/portfolio_gallery/c90cb754629afe7da444780ce7ab81c4.jpg', 'c90cb754629afe7da444780ce7ab81c4'),
(28, 1, 'files/original/portfolio_gallery/5bfe320a67617a2f53d76b3767d722c5.jpg', '5bfe320a67617a2f53d76b3767d722c5'),
(29, 1, 'files/original/portfolio_gallery/a099804094d800c0b8f685f494d2a9f0.jpg', 'a099804094d800c0b8f685f494d2a9f0'),
(30, 1, 'files/original/portfolio_gallery/bbb4f2ed7c99ed62889c0ea234eefbeb.jpg', 'bbb4f2ed7c99ed62889c0ea234eefbeb');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_translate`
--

CREATE TABLE `portfolio_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portfolio_translate`
--

INSERT INTO `portfolio_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Uzairways'),
(2, 1, 'ru', 'meta_description', 'Uzairways'),
(3, 1, 'ru', 'text', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(4, 1, 'en', 'title', 'Uzairways'),
(5, 1, 'en', 'meta_description', 'Uzairways'),
(6, 1, 'en', 'text', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit English'),
(7, 2, 'ru', 'title', 'asdasdasd'),
(8, 2, 'ru', 'meta_description', ''),
(9, 2, 'ru', 'text', '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `special_offer` enum('1','0') DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `anons` varchar(255) DEFAULT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `slug`, `price`, `special_offer`, `created_at`, `updated_at`, `anons`, `index_page`) VALUES
(1, 1, 'test-product', 90000, '1', '2017-01-03 14:23:51', '2017-10-12 13:35:29', 'files/original/products/1.png', '0'),
(2, 1, 'test-product2', 75000, '0', '2017-01-04 06:18:35', '2017-01-04 19:38:49', 'files/original/products/2.jpg', '0');

-- --------------------------------------------------------

--
-- Table structure for table `products_additional`
--

CREATE TABLE `products_additional` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `language` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_additional`
--

INSERT INTO `products_additional` (`id`, `product_id`, `language`, `title`, `text`) VALUES
(1, 1, 'ru', 'Производитель', 'Италия'),
(2, 1, 'ru', 'Цвет', 'Белый'),
(3, 1, 'ru', 'Материал', 'Кожа'),
(4, 1, 'en', 'Manufactured', 'Italy'),
(5, 1, 'en', 'Color', 'White'),
(6, 1, 'en', 'Material', 'Leather'),
(41, 2, 'en', 'Manufacture', 'Uzbekistan'),
(42, 2, 'en', 'Color', 'Black'),
(43, 2, 'ru', 'Производитель', 'Китай'),
(49, 2, 'ru', 'Материал', 'Кожа');

-- --------------------------------------------------------

--
-- Table structure for table `products_category`
--

CREATE TABLE `products_category` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `limit` int(4) DEFAULT NULL,
  `format` enum('list','grid') DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `parent_cat` int(11) NOT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_category`
--

INSERT INTO `products_category` (`id`, `slug`, `limit`, `format`, `foto`, `parent_cat`, `index_page`) VALUES
(1, 'category1', 10, NULL, 'files/original/category/1.jpg', 0, '0'),
(2, 'soft-toys', 10, NULL, NULL, 1, '0'),
(3, 'contstuctors', 10, NULL, NULL, 0, '0'),
(4, 'asdasdasd', 10, NULL, NULL, 0, '0'),
(5, 'qweqwe', 10, NULL, NULL, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `products_category_translate`
--

CREATE TABLE `products_category_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_category_translate`
--

INSERT INTO `products_category_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Игрушки'),
(2, 1, 'ru', 'meta_description', ''),
(3, 1, 'en', 'title', 'Toys'),
(4, 1, 'en', 'meta_description', ''),
(5, 1, 'ru', 'text', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.'),
(6, 1, 'ru', 'meta_title', ''),
(7, 1, 'ru', 'menu_check', '1'),
(18, 1, 'en', 'meta_title', ''),
(19, 1, 'en', 'menu_check', '1'),
(20, 1, 'en', 'text', ''),
(21, 2, 'ru', 'title', 'Мягкие игрушки'),
(22, 2, 'ru', 'meta_title', ''),
(23, 2, 'ru', 'meta_description', ''),
(24, 2, 'ru', 'text', ''),
(25, 2, 'ru', 'menu_check', '0'),
(26, 3, 'ru', 'title', 'Конструкторы'),
(27, 3, 'ru', 'meta_title', ''),
(28, 3, 'ru', 'meta_description', ''),
(29, 3, 'ru', 'text', ''),
(30, 3, 'ru', 'menu_check', '0'),
(31, 4, 'ru', 'title', 'asdasdas'),
(32, 4, 'ru', 'meta_title', ''),
(33, 4, 'ru', 'meta_description', ''),
(34, 4, 'ru', 'text', ''),
(35, 4, 'ru', 'menu_check', '0'),
(36, 5, 'ru', 'title', 'asdasd'),
(37, 5, 'ru', 'meta_title', ''),
(38, 5, 'ru', 'meta_description', ''),
(39, 5, 'ru', 'text', ''),
(40, 5, 'ru', 'menu_check', '0');

-- --------------------------------------------------------

--
-- Table structure for table `products_photos`
--

CREATE TABLE `products_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_photos`
--

INSERT INTO `products_photos` (`id`, `product_id`, `file`, `file_id`) VALUES
(2, 1, 'files/original/products_gallery/e9fa355fe4faff5d76060d2812df2f9f.jpg', 'e9fa355fe4faff5d76060d2812df2f9f'),
(3, 1, 'files/original/products_gallery/d6ac340ac8cfdc5d98054cc2caace79c.jpg', 'd6ac340ac8cfdc5d98054cc2caace79c'),
(4, 1, 'files/original/products_gallery/2c0772edb8966e8792ed0e68b573ec34.jpg', '2c0772edb8966e8792ed0e68b573ec34'),
(5, 2, 'files/original/products_gallery/2b7923e40d40d04eb8c3b2ea15bea4ec.jpg', '2b7923e40d40d04eb8c3b2ea15bea4ec'),
(6, 2, 'files/original/products_gallery/7fbd393e0d6d34557195a9b959cebb3f.jpg', '7fbd393e0d6d34557195a9b959cebb3f');

-- --------------------------------------------------------

--
-- Table structure for table `products_translate`
--

CREATE TABLE `products_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_translate`
--

INSERT INTO `products_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Test product'),
(2, 1, 'ru', 'meta_description', 'asdasdsdsd'),
(3, 1, 'ru', 'text', '<p>&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>'),
(4, 1, 'en', 'title', 'Test product'),
(5, 1, 'en', 'meta_description', ''),
(6, 1, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>asdasdasdasdasdasd</p>\r\n</body>\r\n</html>'),
(7, 2, 'ru', 'title', 'Тест продукт №2'),
(8, 2, 'ru', 'meta_description', ''),
(9, 2, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(10, 2, 'en', 'title', 'Test product #2'),
(11, 2, 'en', 'meta_description', ''),
(12, 2, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(13, 1, 'ru', 'meta_title', '');

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `preview_inner` enum('1','0') DEFAULT '1',
  `preview_src` varchar(255) DEFAULT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`id`, `type_id`, `slug`, `created_at`, `updated_at`, `date`, `preview_inner`, `preview_src`, `index_page`) VALUES
(2, 1, 'phalcon-community-hangout', '2014-08-22 10:42:08', '2017-11-21 11:28:42', '2014-08-22 10:42:08', '1', 'files/original/publication/2.jpg', '0'),
(3, 2, 'builtwith-phalcon', '2014-11-05 18:00:20', '2017-08-20 15:56:44', '2014-11-05 18:00:20', '1', 'files/original/publication/3.jpg', '0'),
(6, 1, 'my-first-test', '2016-11-27 15:14:47', '2017-08-20 15:56:24', '2016-11-27 15:14:47', '1', 'files/original/publication/6.jpg', '0'),
(7, 2, 'test-2', '2016-11-27 23:17:57', '2017-08-20 16:49:11', '2016-11-27 23:17:57', '0', NULL, '0'),
(8, 3, 'service-1', '2017-01-05 11:19:01', '2017-12-13 14:01:52', '2017-01-05 13:18:19', '0', 'files/original/publication/8.jpg', '0'),
(9, 1, 'asdasdasdd', '2017-11-28 17:26:53', '2017-11-28 17:26:53', '2017-11-28 17:26:53', '0', NULL, '0'),
(10, 1, 'asdasd', '2017-12-19 16:54:47', '2017-12-19 17:14:01', '2017-12-19 16:54:47', '0', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `publication_translate`
--

CREATE TABLE `publication_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publication_translate`
--

INSERT INTO `publication_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(6, 2, 'ru', 'title', 'Видеовстреча сообщества Phalcon'),
(7, 2, 'ru', 'meta_title', 'Видеовстреча сообщества Phalcon'),
(8, 2, 'ru', 'meta_description', ''),
(9, 2, 'ru', 'meta_keywords', ''),
(10, 2, 'ru', 'text', '<p><img style="float: left; margin-right: 10px; margin-left: 10px;" src="../../../uploads/files/megapolis.jpg" width="300" height="200" />Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>'),
(31, 3, 'ru', 'title', 'BuiltWith Phalcon'),
(32, 3, 'ru', 'meta_title', 'BuiltWith Phalcon'),
(33, 3, 'ru', 'meta_description', 'BuiltWith Phalcon'),
(34, 3, 'ru', 'meta_keywords', 'Built, Phalcon'),
(35, 3, 'ru', 'text', '<p>Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.</p>\r\n<p>Introducing <a href="http://builtwith.phalconphp.com/">builtwith.phalconphp.com</a></p>\r\n<p>Taking the example from our friends at <a href="http://www.angularjs.org/">AngularJS</a> we have cloned their <a href="https://github.com/angular/builtwith.angularjs.org">repository</a> and we have Phalcon-ized it. Special thanks to the <a href="http://en.wikipedia.org/wiki/AngularJS">AngularJS</a>team as well as <a href="https://github.com/oaass">Ole Aass</a> (<a href="http://oleaass.com/">website</a>) who is leading the project.</p>\r\n<p>The new site has a very easy interface that users can navigate to and even search for projects with tags.&nbsp;</p>\r\n<p>You can add your own project by simply cloning our <a href="https://github.com/phalcon/builtwith">repository</a> and adding your project as well as a logo and screenshots and then issue a pull request for it to appear in the live site.</p>\r\n<p>Looking forward to seeing your projects listed up there!</p>\r\n<p>&nbsp;</p>'),
(81, 6, 'ru', 'title', 'Привет'),
(82, 6, 'ru', 'meta_title', 'Привет'),
(83, 6, 'ru', 'meta_description', 'asdasd'),
(84, 6, 'ru', 'meta_keywords', 'asdasdsd'),
(85, 6, 'ru', 'text', '<p>Привет&nbsp;Phalcon</p>'),
(86, 6, 'en', 'title', 'News about something #1'),
(87, 6, 'en', 'meta_title', 'News about something #1'),
(88, 6, 'en', 'meta_description', ''),
(89, 6, 'en', 'meta_keywords', ''),
(90, 6, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(91, 7, 'en', 'title', 'News about something #2'),
(92, 7, 'en', 'meta_title', 'News about something #2'),
(93, 7, 'en', 'meta_description', ''),
(94, 7, 'en', 'meta_keywords', ''),
(95, 7, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(96, 3, 'en', 'title', 'News about something #3'),
(97, 3, 'en', 'meta_title', 'News about something #3'),
(98, 3, 'en', 'meta_description', ''),
(99, 3, 'en', 'meta_keywords', ''),
(100, 3, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(101, 2, 'en', 'title', 'News about something #4'),
(102, 2, 'en', 'meta_title', 'News about something #4'),
(103, 2, 'en', 'meta_description', ''),
(104, 2, 'en', 'meta_keywords', ''),
(105, 2, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(106, 7, 'ru', 'title', 'Статья №2'),
(107, 7, 'ru', 'meta_title', 'Статья №2'),
(108, 7, 'ru', 'meta_description', ''),
(109, 7, 'ru', 'meta_keywords', ''),
(110, 7, 'ru', 'text', '<p>ewrerwerewrwe</p>'),
(111, 8, 'ru', 'title', 'Услуга №1'),
(112, 8, 'ru', 'meta_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(113, 8, 'ru', 'text', '<p>Lorem ipsum dolor sit amet, Phalcon consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n<p>&nbsp;</p>'),
(114, 8, 'en', 'title', 'Service #1'),
(115, 8, 'en', 'meta_description', ''),
(116, 8, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(117, 8, 'ru', 'meta_title', ''),
(118, 9, 'ru', 'title', 'asdasdasdd'),
(119, 9, 'ru', 'meta_title', ''),
(120, 9, 'ru', 'meta_description', ''),
(121, 9, 'ru', 'text', '<p>asdasdad</p>'),
(122, 10, 'ru', 'title', 'asdasdasdd'),
(123, 10, 'ru', 'meta_title', ''),
(124, 10, 'ru', 'meta_description', ''),
(125, 10, 'ru', 'text', '<ul>\r\n<li>fhhgfhf</li>\r\n<li>hgnhgjhgjg</li>\r\n</ul>\r\n<p>mgghgjhgjhg</p>\r\n<p>- Kjhjkghj</p>\r\n<p>- Ggjgjhg</p>\r\n<p>- mgjhgjgjgh</p>');

-- --------------------------------------------------------

--
-- Table structure for table `publication_type`
--

CREATE TABLE `publication_type` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `limit` int(4) DEFAULT NULL,
  `format` enum('list','grid','services') DEFAULT NULL,
  `display_date` enum('0','1') DEFAULT '0',
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publication_type`
--

INSERT INTO `publication_type` (`id`, `slug`, `limit`, `format`, `display_date`, `index_page`) VALUES
(1, 'news', 10, 'grid', '1', '0'),
(2, 'articles', 10, 'list', '0', '0'),
(3, 'services', 10, 'services', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `publication_type_translate`
--

CREATE TABLE `publication_type_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publication_type_translate`
--

INSERT INTO `publication_type_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'head_title', 'Новости'),
(2, 1, 'ru', 'meta_description', ''),
(3, 1, 'ru', 'meta_keywords', ''),
(4, 1, 'ru', 'seo_text', ''),
(64, 1, 'ru', 'title', 'Новости'),
(65, 2, 'ru', 'title', 'Статьи'),
(66, 2, 'ru', 'head_title', 'Статьи'),
(67, 2, 'ru', 'meta_description', ''),
(68, 2, 'ru', 'meta_keywords', ''),
(69, 2, 'ru', 'seo_text', ''),
(70, 3, 'ru', 'title', 'Услуги'),
(71, 3, 'ru', 'head_title', 'Услуги'),
(72, 3, 'ru', 'meta_description', 'Услуги'),
(73, 3, 'ru', 'meta_keywords', ''),
(74, 3, 'ru', 'seo_text', 'Услуги'),
(75, 3, 'en', 'title', 'Services'),
(76, 3, 'en', 'head_title', 'Services'),
(77, 3, 'en', 'meta_description', 'Services'),
(78, 3, 'en', 'meta_keywords', ''),
(79, 3, 'en', 'seo_text', 'Services'),
(80, 1, 'en', 'title', 'News'),
(81, 1, 'en', 'head_title', 'News'),
(82, 1, 'en', 'meta_description', 'News'),
(83, 1, 'en', 'meta_keywords', ''),
(84, 1, 'en', 'seo_text', 'News'),
(85, 2, 'en', 'title', 'Articles'),
(86, 2, 'en', 'head_title', 'Articles'),
(87, 2, 'en', 'meta_description', 'Articles'),
(88, 2, 'en', 'meta_keywords', ''),
(89, 2, 'en', 'seo_text', 'Articles'),
(90, 2, 'ru', 'meta_title', ''),
(91, 2, 'ru', 'menu_check', '1'),
(92, 2, 'en', 'meta_title', ''),
(93, 2, 'en', 'menu_check', '1');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `foto`) VALUES
(1, 'files/original/reviews/1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews_translate`
--

CREATE TABLE `reviews_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews_translate`
--

INSERT INTO `reviews_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Анвар салимов'),
(2, 1, 'ru', 'job', 'Директор'),
(3, 1, 'ru', 'text', 'Спасибо ребята отличная работа, я был доволен!'),
(4, 1, 'en', 'title', 'Anvar Salimov'),
(5, 1, 'en', 'job', 'Director'),
(6, 1, 'en', 'text', 'Great works guys!');

-- --------------------------------------------------------

--
-- Table structure for table `seo_manager`
--

CREATE TABLE `seo_manager` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `head_title` varchar(500) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `meta_keywords` varchar(500) DEFAULT NULL,
  `seo_text` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seo_manager`
--

INSERT INTO `seo_manager` (`id`, `url`, `head_title`, `meta_description`, `meta_keywords`, `seo_text`, `created_at`, `updated_at`) VALUES
(1, '/news', '', '', '', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>', '2014-09-30 10:39:23', '2016-12-24 16:14:34'),
(2, '/contacts', '', '', '', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>', '2015-05-21 16:33:14', '2016-12-24 16:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `view_title` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `banner`, `view_title`) VALUES
(1, 'uploads/slider/1.jpg', '1'),
(2, 'uploads/slider/2.jpg', '0'),
(3, 'uploads/slider/3.jpg', '0');

-- --------------------------------------------------------

--
-- Table structure for table `slider_translate`
--

CREATE TABLE `slider_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slider_translate`
--

INSERT INTO `slider_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Слайдер №1'),
(2, 1, 'ru', 'text', 'текст для слайдера'),
(5, 2, 'ru', 'title', 'Слайдер №2'),
(6, 2, 'ru', 'text', 'Текст для слайдера'),
(7, 3, 'ru', 'title', 'Slider #3'),
(8, 3, 'ru', 'text', 'Текст для слайдера');

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE `tours` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `special_offer` enum('1','0') DEFAULT '0',
  `top_tour` enum('1','0') DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `anons` varchar(255) DEFAULT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tours`
--

INSERT INTO `tours` (`id`, `category_id`, `country_id`, `slug`, `duration`, `price`, `special_offer`, `top_tour`, `created_at`, `updated_at`, `anons`, `index_page`) VALUES
(1, 8, 7, '-', 'с 03 по 11 января ', 396, '0', '0', '2017-02-18 08:07:07', '2017-02-20 11:31:38', 'files/original/tours/1.jpg', '0'),
(2, 1, 14, 'yakudze', 'С 03 ПО 11 ЯНВАРЯ', 333.5, '1', '1', '2017-02-18 09:22:22', '2017-02-21 08:04:26', 'files/original/tours/2.jpg', '0'),
(3, 2, 9, 'shanghai', 'С 03 ПО 11 ЯНВАРЯ', 250, '0', '1', '2017-02-18 10:34:05', '2017-02-21 08:04:37', 'files/original/tours/3.jpg', '0'),
(4, 3, 1, 'jerusalem', 'с 03 по 11 января ', 500, '0', '0', '2017-02-18 10:35:35', '2017-02-21 08:04:52', 'files/original/tours/4.jpg', '0'),
(5, 4, 1, 'sydney', 'с 03 по 11 января ', 1000, '0', '0', '2017-02-18 10:36:53', '2017-02-21 08:04:59', 'files/original/tours/5.jpg', '0'),
(6, 5, 1, 'bordeaux', 'с 03 по 11 января ', 999, '0', '0', '2017-02-18 10:38:58', '2017-02-21 08:05:13', 'files/original/tours/6.jpg', '0'),
(7, 6, 1, 'prague', 'с 03 по 11 января ', 999.9, '0', '0', '2017-02-18 10:39:36', '2017-02-21 08:05:27', 'files/original/tours/7.jpg', '0'),
(8, 1, 1, 'greece', 'С 03 ПО 11 ЯНВАРЯ', 2525, '1', '0', '2017-02-18 11:20:04', '2017-02-21 07:56:48', 'files/original/tours/8.jpg', '0'),
(9, 2, 1, 'spain', 'С 03 ПО 11 ЯНВАРЯ', 2535, '1', '0', '2017-02-18 11:23:51', '2017-02-21 15:06:42', 'files/original/tours/9.jpg', '0'),
(10, 3, 1, 'mexiko', 'С 01 ПО 11 ЯНВАРЯ ', 5000, '1', '0', '2017-02-18 11:30:19', '2017-02-21 07:56:32', 'files/original/tours/10.jpg', '0'),
(11, 3, 1, 'spec-tur', 'С 01 ПО 11 ЯНВАРЯ ', 250, '1', '0', '2017-02-18 11:42:32', '2017-02-21 07:53:32', 'files/original/tours/11.jpg', '0'),
(12, 8, 7, 'komsomol-lake', 'с 03 по 19 января', 255, '0', '1', '2017-02-18 15:14:44', '2017-02-20 15:02:40', 'files/original/tours/12.jpg', '0'),
(13, 5, 1, 'greciya', 'С 01 ПО 11 ЯНВАРЯ ', 25252, '0', '0', '2017-02-18 15:17:26', '2017-02-21 08:02:03', 'files/original/tours/13.jpg', '0'),
(14, 5, 1, 'kaliforniya', 'с 03 по 11 января ', 3502, '0', '0', '2017-02-18 15:18:09', '2017-02-21 08:05:05', 'files/original/tours/14.jpg', '0'),
(15, 6, 1, 'parish', 'с 03 по 11 января ', 300, '0', '0', '2017-02-18 15:19:10', '2017-02-21 08:05:21', 'files/original/tours/15.jpg', '0'),
(16, 6, 1, 'no-ponyat', 'С 01 ПО 11 ЯНВАРЯ ', 236, '0', '1', '2017-02-18 15:20:30', '2017-09-10 18:48:51', 'files/original/tours/16.jpg', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tours_category`
--

CREATE TABLE `tours_category` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `limit` int(4) DEFAULT NULL,
  `format` enum('list','grid') DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tours_category`
--

INSERT INTO `tours_category` (`id`, `slug`, `limit`, `format`, `foto`, `index_page`) VALUES
(1, 'last-minute', 10, NULL, 'files/original/tour_category/1.jpg', '0'),
(2, 'aptechka', 10, NULL, 'files/original/tour_category/2.jpg', '0'),
(3, 'romantik', 10, NULL, 'files/original/tour_category/3.jpg', '0'),
(4, 'famili', 10, NULL, 'files/original/tour_category/4.jpg', '0'),
(5, 'gid', 10, NULL, 'files/original/tour_category/5.jpg', '0'),
(6, 'plyaji', 10, NULL, 'files/original/tour_category/6.jpg', '0'),
(7, 'layner', 10, NULL, 'files/original/tour_category/7.jpg', '0'),
(8, 'zima', 10, NULL, 'files/original/tour_category/8.jpg', '0'),
(9, 'imdia', 10, NULL, 'files/original/tour_category/9.jpg', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tours_category_translate`
--

CREATE TABLE `tours_category_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tours_category_translate`
--

INSERT INTO `tours_category_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Экзотичные'),
(2, 1, 'ru', 'meta_description', ''),
(3, 1, 'ru', 'text', ''),
(4, 2, 'ru', 'title', 'Лечебные'),
(5, 2, 'ru', 'meta_description', ''),
(6, 2, 'ru', 'text', ''),
(7, 3, 'ru', 'title', 'Романтичные'),
(8, 3, 'ru', 'meta_description', ''),
(9, 3, 'ru', 'text', ''),
(10, 4, 'ru', 'title', 'Отдых с детьми'),
(11, 4, 'ru', 'meta_description', ''),
(12, 4, 'ru', 'text', ''),
(13, 5, 'ru', 'title', 'Эскурсионные'),
(14, 5, 'ru', 'meta_description', ''),
(15, 5, 'ru', 'text', ''),
(16, 6, 'ru', 'title', 'Пляжи'),
(17, 6, 'ru', 'meta_description', ''),
(18, 6, 'ru', 'text', ''),
(19, 7, 'ru', 'title', 'Круизы'),
(20, 7, 'ru', 'meta_description', ''),
(21, 7, 'ru', 'text', ''),
(22, 8, 'ru', 'title', 'Зимний'),
(23, 8, 'ru', 'meta_description', ''),
(24, 8, 'ru', 'text', ''),
(25, 9, 'ru', 'title', 'Индия'),
(26, 9, 'ru', 'meta_description', ''),
(27, 9, 'ru', 'text', ''),
(28, 1, 'ru', 'meta_title', ''),
(29, 1, 'ru', 'menu_check', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tours_country`
--

CREATE TABLE `tours_country` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tours_country`
--

INSERT INTO `tours_country` (`id`, `slug`) VALUES
(1, 'alpa'),
(2, 'armeniya'),
(3, 'gruziya'),
(4, 'izrail'),
(5, 'indiya'),
(6, 'kazahstan'),
(7, 'ozbikiston'),
(8, 'kirkiziya'),
(9, 'kitay'),
(10, 'malaziya'),
(11, 'maldivi'),
(12, 'turciya'),
(13, 'yujnaya'),
(14, 'yaponiya'),
(15, 'belgiya'),
(16, 'bolgariya'),
(17, 'vatican'),
(18, 'velikobritaniya'),
(19, 'chvecariya'),
(20, 'shviciya'),
(21, 'rojdestva'),
(22, 'panama');

-- --------------------------------------------------------

--
-- Table structure for table `tours_country_translate`
--

CREATE TABLE `tours_country_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tours_country_translate`
--

INSERT INTO `tours_country_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Азербайджан '),
(2, 2, 'ru', 'title', 'Армения '),
(3, 3, 'ru', 'title', 'Грузия '),
(4, 4, 'ru', 'title', 'Израиль '),
(5, 5, 'ru', 'title', 'Индия '),
(6, 6, 'ru', 'title', 'Казахстан '),
(7, 7, 'ru', 'title', 'Узбекистан'),
(8, 8, 'ru', 'title', 'Киргизия '),
(9, 9, 'ru', 'title', 'Китай '),
(10, 10, 'ru', 'title', 'Малайзия '),
(11, 11, 'ru', 'title', 'Мальдивы'),
(12, 12, 'ru', 'title', 'Турция '),
(13, 13, 'ru', 'title', 'Южная Корея '),
(14, 14, 'ru', 'title', 'Япония '),
(15, 15, 'ru', 'title', 'Бельгия '),
(16, 16, 'ru', 'title', 'Болгария '),
(17, 17, 'ru', 'title', 'Ватикан '),
(18, 18, 'ru', 'title', 'Великобритания '),
(19, 19, 'ru', 'title', 'Швейцария '),
(20, 20, 'ru', 'title', 'Швеция '),
(21, 21, 'ru', 'title', 'Рождества остров '),
(22, 22, 'ru', 'title', 'Панама ');

-- --------------------------------------------------------

--
-- Table structure for table `tours_photos`
--

CREATE TABLE `tours_photos` (
  `id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tours_photos`
--

INSERT INTO `tours_photos` (`id`, `tour_id`, `file`, `file_id`) VALUES
(1, 1, 'files/original/tours_gallery/a754156c3eacd068927bcb11cd2490e2.jpg', 'a754156c3eacd068927bcb11cd2490e2'),
(2, 1, 'files/original/tours_gallery/b0865dbfb82a0906114612e58db41d1b.jpg', 'b0865dbfb82a0906114612e58db41d1b'),
(3, 1, 'files/original/tours_gallery/fd504816edcb39deadc0adb0e35bf70a.jpg', 'fd504816edcb39deadc0adb0e35bf70a'),
(4, 1, 'files/original/tours_gallery/926f57dec251b3ab10b4d4e2499652a5.jpg', '926f57dec251b3ab10b4d4e2499652a5'),
(5, 2, 'files/original/tours_gallery/f526a7ae73f769f0953525deac44df70.jpg', 'f526a7ae73f769f0953525deac44df70'),
(6, 2, 'files/original/tours_gallery/3aefca11ac528775e5c400661a027b0f.jpg', '3aefca11ac528775e5c400661a027b0f'),
(7, 3, 'files/original/tours_gallery/b888af1358faf8d2029e565bc462d258.jpg', 'b888af1358faf8d2029e565bc462d258'),
(8, 3, 'files/original/tours_gallery/717c82f6e4cab916b9a49e09470e7146.jpg', '717c82f6e4cab916b9a49e09470e7146'),
(9, 3, 'files/original/tours_gallery/4e40387a21486bdf7d0cd4310ed7b1ee.jpg', '4e40387a21486bdf7d0cd4310ed7b1ee'),
(10, 3, 'files/original/tours_gallery/eb12f6ea92522f4707625e1f8c831015.jpg', 'eb12f6ea92522f4707625e1f8c831015'),
(11, 3, 'files/original/tours_gallery/801cad21920195f4078634db8862cde8.jpg', '801cad21920195f4078634db8862cde8'),
(12, 4, 'files/original/tours_gallery/d4585e6c2669f1d1c734333868d99898.jpg', 'd4585e6c2669f1d1c734333868d99898'),
(13, 4, 'files/original/tours_gallery/b5c95efb73eac5191babcd7f2a87da06.jpg', 'b5c95efb73eac5191babcd7f2a87da06'),
(14, 4, 'files/original/tours_gallery/d506caf54555563011965f78dfe23326.jpg', 'd506caf54555563011965f78dfe23326'),
(15, 4, 'files/original/tours_gallery/67a8028b9535bbb277448083925b7ffb.jpg', '67a8028b9535bbb277448083925b7ffb'),
(16, 4, 'files/original/tours_gallery/c1c4753f8a74b4d80dcdb0642c00fc72.jpg', 'c1c4753f8a74b4d80dcdb0642c00fc72'),
(17, 5, 'files/original/tours_gallery/5680e246db8e5ca988e10a5a30b4aefa.jpg', '5680e246db8e5ca988e10a5a30b4aefa'),
(18, 5, 'files/original/tours_gallery/57f36d3db98a754fef1089c1a7e00e48.jpg', '57f36d3db98a754fef1089c1a7e00e48'),
(19, 5, 'files/original/tours_gallery/dba9b0216c96d6228549e2fc58f8ad8d.jpg', 'dba9b0216c96d6228549e2fc58f8ad8d'),
(20, 5, 'files/original/tours_gallery/cdd8f974fb05b2c2d4af57ed99fc864f.jpg', 'cdd8f974fb05b2c2d4af57ed99fc864f'),
(21, 5, 'files/original/tours_gallery/3f4548c274abd6a9f476337ed15c4bc3.jpg', '3f4548c274abd6a9f476337ed15c4bc3'),
(22, 6, 'files/original/tours_gallery/0f82219989c49c92166b81b97d036691.jpg', '0f82219989c49c92166b81b97d036691'),
(23, 6, 'files/original/tours_gallery/31c6a95b9df7fab853947731b4a24f03.jpg', '31c6a95b9df7fab853947731b4a24f03'),
(24, 6, 'files/original/tours_gallery/56059f004f89d8e2241d78ef0b992893.jpg', '56059f004f89d8e2241d78ef0b992893'),
(25, 6, 'files/original/tours_gallery/5e95aec44ea741e56b62408d7d922587.jpg', '5e95aec44ea741e56b62408d7d922587'),
(26, 6, 'files/original/tours_gallery/6e2b25b3ee03516434ec3582f58546c5.jpg', '6e2b25b3ee03516434ec3582f58546c5'),
(27, 7, 'files/original/tours_gallery/a146271658a9cc799553ba96c01f8235.jpg', 'a146271658a9cc799553ba96c01f8235'),
(28, 7, 'files/original/tours_gallery/c548b8be88a04d46956f3cbfac09fcad.jpg', 'c548b8be88a04d46956f3cbfac09fcad'),
(29, 7, 'files/original/tours_gallery/88d7e1f228d6ab28fefa8193ff74cdf1.jpg', '88d7e1f228d6ab28fefa8193ff74cdf1'),
(30, 7, 'files/original/tours_gallery/a6e27e074c224d4624fc323f6fe8ef42.jpg', 'a6e27e074c224d4624fc323f6fe8ef42'),
(31, 8, 'files/original/tours_gallery/f5f5631e68322d0837509f9a80117846.jpg', 'f5f5631e68322d0837509f9a80117846'),
(32, 8, 'files/original/tours_gallery/9013c3ee55a71ffaf3ceed9b5286c8c5.jpg', '9013c3ee55a71ffaf3ceed9b5286c8c5'),
(33, 8, 'files/original/tours_gallery/1c8b321f9931b6c83aa3fcc4a64d1712.jpg', '1c8b321f9931b6c83aa3fcc4a64d1712'),
(34, 8, 'files/original/tours_gallery/eb234e61f3b232318f45ba52b3062ba2.jpg', 'eb234e61f3b232318f45ba52b3062ba2'),
(35, 9, 'files/original/tours_gallery/c8c03bfff3d5c9310bcfa563996763a4.jpg', 'c8c03bfff3d5c9310bcfa563996763a4'),
(36, 9, 'files/original/tours_gallery/3838ec1ebc6f9142be07d5e4485d11dc.jpg', '3838ec1ebc6f9142be07d5e4485d11dc'),
(37, 9, 'files/original/tours_gallery/94bb3c359be7f8920e74d3d2192cd190.jpg', '94bb3c359be7f8920e74d3d2192cd190'),
(38, 9, 'files/original/tours_gallery/bbe6544a4c3cbc7ab59e0012ae2140e8.jpg', 'bbe6544a4c3cbc7ab59e0012ae2140e8'),
(39, 9, 'files/original/tours_gallery/9a7d5cd4969206ac0d36b3f8f48794ef.jpg', '9a7d5cd4969206ac0d36b3f8f48794ef'),
(40, 10, 'files/original/tours_gallery/4ba602d6516440bc8662e92aefba9f58.jpg', '4ba602d6516440bc8662e92aefba9f58'),
(41, 10, 'files/original/tours_gallery/68232a032b88c2639e95377fde27c984.jpg', '68232a032b88c2639e95377fde27c984'),
(42, 10, 'files/original/tours_gallery/106a54d2f3d771582daa9f5e9dce0e61.jpg', '106a54d2f3d771582daa9f5e9dce0e61'),
(43, 10, 'files/original/tours_gallery/929f7c31ffc13e7b7f1f408c2ccfbedb.jpg', '929f7c31ffc13e7b7f1f408c2ccfbedb'),
(44, 10, 'files/original/tours_gallery/e4d84b77064495244c8159457b4ea895.jpg', 'e4d84b77064495244c8159457b4ea895'),
(45, 11, 'files/original/tours_gallery/1321e8700f68f16bd8d68f109234ad53.jpg', '1321e8700f68f16bd8d68f109234ad53'),
(46, 11, 'files/original/tours_gallery/e3062b1d4f86196de9f4d3eaf7143a8d.jpg', 'e3062b1d4f86196de9f4d3eaf7143a8d'),
(47, 11, 'files/original/tours_gallery/6aa9d666dcfd48b8074f69c42a7f3ad2.jpg', '6aa9d666dcfd48b8074f69c42a7f3ad2'),
(48, 11, 'files/original/tours_gallery/fb9d844b7437fd6a4d23ee49c00f0efb.jpg', 'fb9d844b7437fd6a4d23ee49c00f0efb'),
(49, 11, 'files/original/tours_gallery/071c4fca3d219e786580191d73a57882.jpg', '071c4fca3d219e786580191d73a57882'),
(50, 12, 'files/original/tours_gallery/82cbe2ce1d11b467d8e57af63a0d471a.jpg', '82cbe2ce1d11b467d8e57af63a0d471a'),
(51, 12, 'files/original/tours_gallery/91cf91cabb718fb83146e0248fc2c1da.jpg', '91cf91cabb718fb83146e0248fc2c1da'),
(52, 12, 'files/original/tours_gallery/f6f1645e3be39024971e75e8962d8b20.jpg', 'f6f1645e3be39024971e75e8962d8b20'),
(53, 12, 'files/original/tours_gallery/c1eb06ac3d599a49f1780deb14a90511.jpg', 'c1eb06ac3d599a49f1780deb14a90511'),
(54, 12, 'files/original/tours_gallery/fb8d6fedbde11260a5b7cb37a763a2b4.jpg', 'fb8d6fedbde11260a5b7cb37a763a2b4'),
(55, 13, 'files/original/tours_gallery/3fd2b5348e51f6239a431ebdcd41cb26.jpg', '3fd2b5348e51f6239a431ebdcd41cb26'),
(56, 13, 'files/original/tours_gallery/150e6cbacc1e7dc6e99f55cfde10fb6a.jpg', '150e6cbacc1e7dc6e99f55cfde10fb6a'),
(57, 13, 'files/original/tours_gallery/78719abaaa1f5f1a319e3ad1fce4fc56.jpg', '78719abaaa1f5f1a319e3ad1fce4fc56'),
(58, 13, 'files/original/tours_gallery/29c09b05c32884754f6b832df1fb2e73.jpg', '29c09b05c32884754f6b832df1fb2e73'),
(59, 14, 'files/original/tours_gallery/9099e4b6fe92d58bc3842569563df516.jpg', '9099e4b6fe92d58bc3842569563df516'),
(60, 14, 'files/original/tours_gallery/75e475b709e83baa7b45548c6b8b803d.jpg', '75e475b709e83baa7b45548c6b8b803d'),
(61, 14, 'files/original/tours_gallery/69f8cb52f5801b809d9719bcd9599cba.jpg', '69f8cb52f5801b809d9719bcd9599cba'),
(62, 14, 'files/original/tours_gallery/85ee3fdc3bdefd4519a743f77234471b.jpg', '85ee3fdc3bdefd4519a743f77234471b'),
(63, 15, 'files/original/tours_gallery/25a61efc85882b186d282b4c4d9b77a9.jpg', '25a61efc85882b186d282b4c4d9b77a9'),
(64, 15, 'files/original/tours_gallery/2be6ee831355ed273e1ee04a5d05417b.jpg', '2be6ee831355ed273e1ee04a5d05417b'),
(65, 15, 'files/original/tours_gallery/80960ae9be44c951b22a6fc65ed43114.jpg', '80960ae9be44c951b22a6fc65ed43114'),
(66, 15, 'files/original/tours_gallery/1a5874acc384fdc74b10cc40d6c4d69d.jpg', '1a5874acc384fdc74b10cc40d6c4d69d'),
(67, 15, 'files/original/tours_gallery/0a7f634afeeb902588205a0a53cf32ea.jpg', '0a7f634afeeb902588205a0a53cf32ea'),
(77, 16, 'files/original/tours_gallery/d1ab37597976f3da36af281c46c8cdbc.jpg', 'd1ab37597976f3da36af281c46c8cdbc'),
(78, 16, 'files/original/tours_gallery/18552fd4d5c39e983f5dbd898d9608b7.jpg', '18552fd4d5c39e983f5dbd898d9608b7'),
(79, 16, 'files/original/tours_gallery/a93a49fd3158cfa5ba2785b7082b3efc.jpg', 'a93a49fd3158cfa5ba2785b7082b3efc'),
(80, 16, 'files/original/tours_gallery/368d53953a7fb645be649b36d1a668a4.jpg', '368d53953a7fb645be649b36d1a668a4'),
(81, 16, 'files/original/tours_gallery/71e47ab75be217a93659c46c3c1b6c04.jpg', '71e47ab75be217a93659c46c3c1b6c04'),
(82, 16, 'files/original/tours_gallery/6ac88a8ff802d3ec5e85c7a4ebc79a87.jpg', '6ac88a8ff802d3ec5e85c7a4ebc79a87');

-- --------------------------------------------------------

--
-- Table structure for table `tours_timetable`
--

CREATE TABLE `tours_timetable` (
  `id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `language` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tours_timetable`
--

INSERT INTO `tours_timetable` (`id`, `tour_id`, `language`, `title`, `day`, `text`) VALUES
(1, 12, 'ru', 'воскресенье', '1 день', 'Прибытие в Рим. Встреча с русскоговорящим сопровождающим. Трансфер и размещение в отеле в центре Рима. Свободное время. Ужин в ресторане. Для желающих экскурсия «Ночной Рим» (за дополнительную плату). Ночь в отеле.'),
(2, 12, 'ru', 'понедельник', '2 день', 'Завтрак в отеле. Экскурсия в музеи Ватикана с посещением Собора Св. Петра с русскоговорящим гидом. Обзорная экскурсия по Риму с русскоговорящим гидом. Свободное время. Для желающих экскурсия\r\n«Римские Замки» - характерные средневековые маленькие города, н'),
(3, 12, 'ru', 'вторник', '3 день', 'Завтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(4, 12, 'ru', 'среда', '4 день', 'Завтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по гор'),
(5, 12, 'ru', 'пятница', '6 день', ' \r\nЗавтрак в отеле. Трансфер в Венецию - “Город на воде” (катер по Каналу делла Джудекка или по Гранд Каналу оплачивается дополнительно). Обзорная экскурсия с русскоговорящим гидом. Свободное время или возможность дополнительной экскурсии в дворец Дожей с'),
(6, 16, 'ru', 'воскресенье', '1 день ', 'Прибытие в Рим. Встреча с русскоговорящим сопровождающим. Трансфер и размещение в отеле в центре Рима. Свободное время. Ужин в ресторане. Для желающих экскурсия «Ночной Рим» (за дополнительную плату). Ночь в отеле.'),
(7, 16, 'ru', 'понедельник', '2 день', 'Завтрак в отеле. Экскурсия в музеи Ватикана с посещением Собора Св. Петра с русскоговорящим гидом. Обзорная экскурсия по Риму с русскоговорящим гидом. Свободное время. Для желающих экскурсия\r\n«Римские Замки» - характерные средневековые маленькие города, н'),
(8, 16, 'ru', 'вторник', '3 день', 'Завтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(9, 16, 'ru', 'среда', '4 день', 'Завтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по гор'),
(10, 16, 'ru', 'четверг', '5 день', 'Завтрак в отеле. Свободное время во Флоренции или экскурсия в Лукку и Пизу с\r\nрусскоговорящим гидом (за дополнительную плату). Типичный тосканский обед в ресторане “Rubaconte” (включен в стоимость тура). Свободное время. Эскурсия в галерею Уффици или двор'),
(11, 15, 'ru', 'понедельник', '1 день', 'Прибытие в Рим. Встреча с русскоговорящим сопровождающим. Трансфер и размещение в отеле в центре Рима. Свободное время. Ужин в ресторане. Для желающих экскурсия «Ночной Рим» (за дополнительную плату). Ночь в отеле.'),
(12, 15, 'ru', 'вторник', '2 день', 'Завтрак в отеле. Экскурсия в музеи Ватикана с посещением Собора Св. Петра с русскоговорящим гидом. Обзорная экскурсия по Риму с русскоговорящим гидом. Свободное время. Для желающих экскурсия\r\n«Римские Замки» - характерные средневековые маленькие города, н'),
(13, 15, 'ru', 'вторник', '3 день', 'Завтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(14, 15, 'ru', 'четверг', '4 день', 'Завтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по гор'),
(15, 7, 'ru', 'четверг', '1 день', 'Завтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по гор'),
(16, 7, 'ru', 'пятница', '2 день', 'Завтрак в отеле. Свободное время во Флоренции или экскурсия в Лукку и Пизу с\r\nрусскоговорящим гидом (за дополнительную плату). Типичный тосканский обед в ресторане “Rubaconte” (включен в стоимость тура). Свободное время. Эскурсия в галерею Уффици или двор'),
(17, 7, 'ru', 'суббота', '3 день', 'Завтрак в отеле. Трансфер в Венецию - “Город на воде” (катер по Каналу делла Джудекка или по Гранд Каналу оплачивается дополнительно). Обзорная экскурсия с русскоговорящим гидом. Свободное время или возможность дополнительной экскурсии в дворец Дожей с ру'),
(18, 7, 'ru', 'воскресенье', '4 день', ' \r\nЗавтрак в отеле. Трансфер в Милан. Размещение в отеле (во время выставок и конгрессов возможно размещение в окрестностях Милана). Посещение Милана с русскоговорящим сопровождающим. Свободное время. Ужин. Ночь в отеле.'),
(19, 8, 'ru', 'понедельник', '1 день', 'Прибытие в Рим. Встреча с русскоговорящим сопровождающим. Трансфер и размещение в отеле в центре Рима. Свободное время. Ужин в ресторане. Для желающих экскурсия «Ночной Рим» (за дополнительную плату). Ночь в отеле.'),
(20, 8, 'ru', 'вторник', '2 день', ' \r\nЗавтрак в отеле. Экскурсия в музеи Ватикана с посещением Собора Св. Петра с русскоговорящим гидом. Обзорная экскурсия по Риму с русскоговорящим гидом. Свободное время. Для желающих экскурсия\r\n«Римские Замки» - характерные средневековые маленькие горо'),
(21, 8, 'ru', 'среда', '3 день', ' \r\nЗавтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(22, 2, 'ru', 'вторник', '1 день', 'Завтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(23, 2, 'ru', 'среда', '2 день', 'Завтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по г'),
(24, 2, 'ru', 'четверг', '3 день', ' \r\n \r\nЗавтрак в отеле. Свободное время во Флоренции или экскурсия в Лукку и Пизу с\r\nрусскоговорящим гидом (за дополнительную плату). Типичный тосканский обед в ресторане “Rubaconte” (включен в стоимость тура). Свободное время. Эскурсия в галерею Уффици ил'),
(25, 2, 'ru', 'пятница', '4 день', 'Завтрак в отеле. Трансфер в Венецию - “Город на воде” (катер по Каналу делла Джудекка или по Гранд Каналу оплачивается дополнительно). Обзорная экскурсия с русскоговорящим гидом. Свободное время или возможность дополнительной экскурсии в дворец Дожей с '),
(26, 9, 'ru', 'пятница', '1 день', 'Завтрак в отеле. Трансфер в Венецию - “Город на воде” (катер по Каналу делла Джудекка или по Гранд Каналу оплачивается дополнительно). Обзорная экскурсия с русскоговорящим гидом. Свободное время или возможность дополнительной экскурсии в дворец Дожей с '),
(27, 9, 'ru', 'суббота', '2 день', ' \r\nЗавтрак в отеле. Трансфер в Милан. Размещение в отеле (во время выставок и конгрессов возможно размещение в окрестностях Милана). Посещение Милана с русскоговорящим сопровождающим. Свободное время. Ужин. Ночь в отеле'),
(28, 9, 'ru', 'воскресенье', '3 день', 'Завтрак в отеле. Трансфер в аэропорт Милана. Завершение обслуживания'),
(29, 3, 'ru', 'воскресенье', '1 день', 'Прибытие в Рим. Встреча с русскоговорящим сопровождающим. Трансфер и размещение в отеле в центре Рима. Свободное время. Ужин в ресторане. Для желающих экскурсия «Ночной Рим» (за дополнительную плату). Ночь в отеле.'),
(30, 3, 'ru', 'понедельник', '2 день', 'Завтрак в отеле. Экскурсия в музеи Ватикана с посещением Собора Св. Петра с русскоговорящим гидом. Обзорная экскурсия по Риму с русскоговорящим гидом. Свободное время. Для желающих экскурсия\r\n«Римские Замки» - характерные средневековые маленькие города,'),
(31, 3, 'ru', 'вторник', '3 день', 'Завтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(32, 11, 'ru', 'вторник', '1 день', '\r\nЗавтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(33, 11, 'ru', 'среда', '4 день', '\r\nЗавтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по г'),
(34, 11, 'ru', 'четверг', '5 день', '\r\nЗавтрак в отеле. Свободное время во Флоренции или экскурсия в Лукку и Пизу с\r\nрусскоговорящим гидом (за дополнительную плату). Типичный тосканский обед в ресторане “Rubaconte” (включен в стоимость тура). Свободное время. Эскурсия в галерею Уффици или дв'),
(35, 11, 'ru', 'пятница', '6 день', '\r\nЗавтрак в отеле. Трансфер в Венецию - “Город на воде” (катер по Каналу делла Джудекка или по Гранд Каналу оплачивается дополнительно). Обзорная экскурсия с русскоговорящим гидом. Свободное время или возможность дополнительной экскурсии в дворец Дожей с '),
(36, 10, 'ru', 'пятница', '1 день', 'Завтрак в отеле. Трансфер в Венецию - “Город на воде” (катер по Каналу делла Джудекка или по Гранд Каналу оплачивается дополнительно). Обзорная экскурсия с русскоговорящим гидом. Свободное время или возможность дополнительной экскурсии в дворец Дожей с '),
(37, 10, 'ru', 'суббота', '2 день', 'Завтрак в отеле. Трансфер в Милан. Размещение в отеле (во время выставок и конгрессов возможно размещение в окрестностях Милана). Посещение Милана с русскоговорящим сопровождающим. Свободное время. Ужин. Ночь в отеле.'),
(38, 10, 'ru', 'воскресенье', 'День 3', 'Завтрак в отеле. Трансфер в аэропорт Милана. Завершение обслуживания'),
(39, 4, 'ru', 'воскресенье', '1 день', 'Прибытие в Рим. Встреча с русскоговорящим сопровождающим. Трансфер и размещение в отеле в центре Рима. Свободное время. Ужин в ресторане. Для желающих экскурсия «Ночной Рим» (за дополнительную плату). Ночь в отеле.'),
(40, 4, 'ru', 'понедельник', '2 день ', 'Завтрак в отеле. Экскурсия в музеи Ватикана с посещением Собора Св. Петра с русскоговорящим гидом. Обзорная экскурсия по Риму с русскоговорящим гидом. Свободное время. Для желающих экскурсия\r\n«Римские Замки» - характерные средневековые маленькие города,'),
(41, 4, 'ru', 'вторникнь', '3 день', ' \r\nЗавтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(42, 4, 'ru', 'среда', '4 день', 'Завтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по г'),
(43, 4, 'ru', 'четверг', '5 день', ' \r\nЗавтрак в отеле. Свободное время во Флоренции или экскурсия в Лукку и Пизу с\r\nрусскоговорящим гидом (за дополнительную плату). Типичный тосканский обед в ресторане “Rubaconte” (включен в стоимость тура). Свободное время. Эскурсия в галерею Уффици или'),
(44, 5, 'ru', 'воскресенье', '1 день', ' \r\nПрибытие в Рим. Встреча с русскоговорящим сопровождающим. Трансфер и размещение в отеле в центре Рима. Свободное время. Ужин в ресторане. Для желающих экскурсия «Ночной Рим» (за дополнительную плату). Ночь в отеле.'),
(45, 5, 'ru', 'понедельник', '2 день ', ' \r\nЗавтрак в отеле. Экскурсия в музеи Ватикана с посещением Собора Св. Петра с русскоговорящим гидом. Обзорная экскурсия по Риму с русскоговорящим гидом. Свободное время. Для желающих экскурсия\r\n«Римские Замки» - характерные средневековые маленькие горо'),
(46, 5, 'ru', 'вторник', '3 день', ' \r\nЗавтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(47, 5, 'ru', 'среда', '4 день ', 'Завтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по г'),
(48, 5, 'ru', 'четверг', '5 день', ' \r\nЗавтрак в отеле. Свободное время во Флоренции или экскурсия в Лукку и Пизу с\r\nрусскоговорящим гидом (за дополнительную плату). Типичный тосканский обед в ресторане “Rubaconte” (включен в стоимость тура). Свободное время. Эскурсия в галерею Уффици или'),
(49, 5, 'ru', 'пятница', '6 день', 'Завтрак в отеле. Трансфер в Венецию - “Город на воде” (катер по Каналу делла Джудекка или по Гранд Каналу оплачивается дополнительно). Обзорная экскурсия с русскоговорящим гидом. Свободное время или возможность дополнительной экскурсии в дворец Дожей с '),
(50, 14, 'ru', 'воскресенье', '1 день', ' \r\nПрибытие в Рим. Встреча с русскоговорящим сопровождающим. Трансфер и размещение в отеле в центре Рима. Свободное время. Ужин в ресторане. Для желающих экскурсия «Ночной Рим» (за дополнительную плату). Ночь в отеле.'),
(51, 14, 'ru', '2 день', 'понедельник', ' \r\nЗавтрак в отеле. Экскурсия в музеи Ватикана с посещением Собора Св. Петра с русскоговорящим гидом. Обзорная экскурсия по Риму с русскоговорящим гидом. Свободное время. Для желающих экскурсия\r\n«Римские Замки» - характерные средневековые маленькие горо'),
(52, 14, 'ru', 'вторник', '3 день', 'Завтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(53, 14, 'ru', 'среда', '4 день ', 'Завтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по гор'),
(54, 14, 'ru', 'четверг', '5 день', 'Завтрак в отеле. Свободное время во Флоренции или экскурсия в Лукку и Пизу с\r\nрусскоговорящим гидом (за дополнительную плату). Типичный тосканский обед в ресторане “Rubaconte” (включен в стоимость тура). Свободное время. Эскурсия в галерею Уффици или двор'),
(55, 13, 'ru', 'пятница', '1 день', ' (пятница)\r\n \r\nЗавтрак в отеле. Трансфер в Венецию - “Город на воде” (катер по Каналу делла Джудекка или по Гранд Каналу оплачивается дополнительно). Обзорная экскурсия с русскоговорящим гидом. Свободное время или возможность дополнительной экскурсии в дв'),
(56, 13, 'ru', 'суббота', '2 день', 'Завтрак в отеле. Трансфер в Милан. Размещение в отеле (во время выставок и конгрессов возможно размещение в окрестностях Милана). Посещение Милана с русскоговорящим сопровождающим. Свободное время. Ужин. Ночь в отеле.'),
(57, 13, 'ru', 'воскресенье', '3 день ', 'Прибытие в Рим. Встреча с русскоговорящим сопровождающим. Трансфер и размещение в отеле в центре Рима. Свободное время. Ужин в ресторане. Для желающих экскурсия «Ночной Рим» (за дополнительную плату). Ночь в отеле.'),
(58, 13, 'ru', 'понедельник', '4 день', ' \r\nЗавтрак в отеле. Экскурсия в музеи Ватикана с посещением Собора Св. Петра с русскоговорящим гидом. Обзорная экскурсия по Риму с русскоговорящим гидом. Свободное время. Для желающих экскурсия\r\n«Римские Замки» - характерные средневековые маленькие города'),
(59, 13, 'ru', 'вторник', '5 день', 'Завтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(60, 13, 'ru', 'среда', '6 день', '\r\nЗавтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по г'),
(61, 6, 'ru', 'воскресенье', '1 день', 'Прибытие в Рим. Встреча с русскоговорящим сопровождающим. Трансфер и размещение в отеле в центре Рима. Свободное время. Ужин в ресторане. Для желающих экскурсия «Ночной Рим» (за дополнительную плату). Ночь в отеле.'),
(62, 6, 'ru', 'понедельник', '2 день ', ' \r\nЗавтрак в отеле. Экскурсия в музеи Ватикана с посещением Собора Св. Петра с русскоговорящим гидом. Обзорная экскурсия по Риму с русскоговорящим гидом. Свободное время. Для желающих экскурсия\r\n«Римские Замки» - характерные средневековые маленькие города'),
(63, 6, 'ru', 'вторник', '3 день', 'Завтрак в отеле. Свободное время. Для желающих экскурсия на целый день в Неаполь и Помпеи (целый день). Все экскурсии осуществляются русскоговорящими гидами и за дополнительную плату. Ужин в ресторане. Ночь в отеле.'),
(64, 6, 'ru', 'среда', '4 день', 'Завтрак в отеле. Отправление из Рима. По пути остановка в районе Кьянти для дегустации вина и типичных продуктов и в Сиене для обзорной экскурсии с русскоговорящим гидом.Трансфер во Флоренцию – “Родину\r\nитальянского Ренессанса” и обзорная экскурсия по г'),
(65, 6, 'ru', 'четверг', '5 день', 'Завтрак в отеле. Свободное время во Флоренции или экскурсия в Лукку и Пизу с\r\nрусскоговорящим гидом (за дополнительную плату). Типичный тосканский обед в ресторане “Rubaconte” (включен в стоимость тура). Свободное время. Эскурсия в галерею Уффици или двор');

-- --------------------------------------------------------

--
-- Table structure for table `tours_translate`
--

CREATE TABLE `tours_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tours_translate`
--

INSERT INTO `tours_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', ' Пляжный ЗИМНИЕ КАНИКУЛЫ в Таиланде'),
(2, 1, 'ru', 'meta_description', ''),
(3, 1, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(4, 2, 'ru', 'title', 'Frange'),
(5, 2, 'ru', 'meta_description', ''),
(6, 2, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(7, 3, 'ru', 'title', 'SHANGHAI'),
(8, 3, 'ru', 'meta_description', ''),
(9, 3, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(10, 4, 'ru', 'title', 'JERUSALEM'),
(11, 4, 'ru', 'meta_description', ''),
(12, 4, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(13, 5, 'ru', 'title', 'SYDNEY'),
(14, 5, 'ru', 'meta_description', ''),
(15, 5, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(16, 6, 'ru', 'title', 'BORDEAUX'),
(17, 6, 'ru', 'meta_description', ''),
(18, 6, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(19, 7, 'ru', 'title', 'PRAGUE'),
(20, 7, 'ru', 'meta_description', ''),
(21, 7, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(22, 8, 'ru', 'title', 'Greece'),
(23, 8, 'ru', 'meta_description', ''),
(24, 8, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(25, 9, 'ru', 'title', 'spain'),
(26, 9, 'ru', 'meta_description', ''),
(27, 9, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(28, 10, 'ru', 'title', 'Mexiko'),
(29, 10, 'ru', 'meta_description', ''),
(30, 10, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(31, 11, 'ru', 'title', 'Spec-tur'),
(32, 11, 'ru', 'meta_description', ''),
(33, 11, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(34, 12, 'ru', 'title', 'Карибы'),
(35, 12, 'ru', 'meta_description', ''),
(36, 12, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(37, 13, 'ru', 'title', 'Греция'),
(38, 13, 'ru', 'meta_description', ''),
(39, 13, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(40, 14, 'ru', 'title', 'Kaliforniya'),
(41, 14, 'ru', 'meta_description', ''),
(42, 14, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(43, 15, 'ru', 'title', 'Parish'),
(44, 15, 'ru', 'meta_description', ''),
(45, 15, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div id="1" class="tab-pane active">\r\n<h4>GENERAL INFORMATION ABOUT TOUR</h4>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n<p>Shopping history Hot offers according your settings Multi-product search Opportunity to share with friends</p>\r\n<h3>YOU NEED TO KNOW</h3>\r\n</div>\r\n<div id="2" class="tab-pane">\r\n<h3>Notice the gap between the content and tab after applying a background color</h3>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus. Pellentesque ac turpis egestas, varius justo et, condimentum augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. INTERESTING FOR YOU</p>\r\n<p>Pellentesque ac turpis egestas, varius justo et, condimentum augue. Praesent aliquam, nisl feugiat vehicula condimentum, justo tellus scelerisque metus.</p>\r\n</div>\r\n</body>\r\n</html>'),
(46, 16, 'ru', 'title', 'Великобритания '),
(47, 16, 'ru', 'meta_description', ''),
(48, 16, 'ru', 'text', '<p><strong>В стоимость включено:&nbsp;</strong></p>\r\n<div class="field-items">\r\n<ol>\r\n<li class="field-item even">Авиа перелет</li>\r\n<li class="field-item odd">Услуги по бронированию</li>\r\n<li class="field-item even">Медицинская страховка</li>\r\n<li class="field-item odd">Проживание в отеле</li>\r\n<li class="field-item even">Трансфер</li>\r\n</ol>\r\n</div>'),
(49, 16, 'ru', 'meta_title', '');

-- --------------------------------------------------------

--
-- Table structure for table `translate`
--

CREATE TABLE `translate` (
  `id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `phrase` varchar(500) DEFAULT NULL,
  `translation` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `translate`
--

INSERT INTO `translate` (`id`, `lang`, `phrase`, `translation`) VALUES
(1, 'ru', 'Ошибка валидации формы', 'Ошибка валидации формы'),
(2, 'ru', 'Подробнее', 'Подробнее'),
(3, 'ru', 'Назад к перечню публикаций', 'Назад к перечню публикаций'),
(4, 'ru', 'SITE NAME', 'Eskiz Group'),
(5, 'ru', 'Главная', 'Главная'),
(6, 'ru', 'Новости', 'Новости'),
(7, 'ru', 'Контакты', 'Контакты'),
(22, 'ru', 'Статьи', 'Статьи'),
(33, 'ru', 'Home', 'Главная'),
(34, 'ru', 'News', 'Новости'),
(35, 'ru', 'Articles', 'Статьи'),
(36, 'ru', 'Contacts', 'Контакты'),
(37, 'ru', 'Admin', 'Админка'),
(38, 'ru', 'YonaCms Admin Panel', 'Административная панель YonaCms'),
(39, 'ru', 'Back к перечню публикаций', 'Назад к перечню публикаций'),
(40, 'ru', 'Страница №', 'Страница №'),
(54, 'ru', 'Полная версия', 'Полная версия'),
(55, 'ru', 'Мобильная версия', 'Мобильная версия'),
(56, 'ru', 'Services', 'Services'),
(57, 'ru', 'Printing', 'Printing'),
(58, 'ru', 'Design', 'Design'),
(65, 'ru', 'Latest news', 'Последние новости'),
(71, 'ru', 'Entries not found', 'Записи не найдены'),
(72, 'ru', 'Back to publications list', 'Обратно к перечню публикаций'),
(73, 'en', 'SITE NAME', 'Eskiz Group'),
(74, 'en', 'Ошибка валидации формы', 'Error validataion form'),
(75, 'en', 'Страница №', 'Page №'),
(76, 'en', 'Подробнее', 'Read more'),
(77, 'en', 'Entries not found', 'Entries not found'),
(78, 'en', 'Back to publications list', 'Back to publications list'),
(79, 'en', 'Latest news', 'Latest news'),
(80, 'ru', 'Search    ', 'Поиск'),
(81, 'ru', 'Search results', 'Результаты поиска'),
(82, 'en', 'Search', 'Search'),
(83, 'en', 'Search results', 'Search results'),
(84, 'ru', 'Pages', 'Страницы'),
(85, 'ru', 'Publications', 'Публикации'),
(86, 'ru', 'Portfolio', 'Портфолио'),
(87, 'ru', 'Products', 'Продукция'),
(88, 'ru', 'Tours', 'Туры'),
(89, 'ru', 'Employee', 'Сотрудники'),
(90, 'ru', 'Back to products list', 'К спискам продукции'),
(91, 'ru', 'New products', 'Новый продукции'),
(92, 'ru', 'Special offers', 'Спецпредложение'),
(93, 'ru', 'Back to tours list', 'К спискам тур'),
(94, 'ru', 'name', 'ФИО'),
(95, 'ru', 'Phone', 'Телефон'),
(96, 'ru', 'Attach file', 'Прикрепить файл'),
(97, 'ru', 'company', 'Компания'),
(98, 'ru', 'massage', 'Сообщение'),
(99, 'ru', 'Send', 'Отправить'),
(100, 'ru', 'Email has been send', 'Ваша сообщение было успешно отправленно'),
(101, 'en', 'Home', 'Home'),
(102, 'en', 'Portfolio', 'Portfolio'),
(103, 'en', 'Products', 'Products'),
(104, 'en', 'Tours', 'Tours'),
(105, 'en', 'Employee', 'Employee'),
(106, 'en', 'Faq', 'Faq'),
(107, 'en', 'Partner', 'Partner'),
(108, 'en', 'Back to products list', 'Back to products list'),
(109, 'en', 'New products', 'New products'),
(110, 'en', 'Special offers', 'Special offers'),
(111, 'en', 'Pages', 'Pages'),
(112, 'en', 'Publications', 'Publications'),
(113, 'en', 'Back to tours list', 'Back to tours list'),
(114, 'en', 'name', 'Name'),
(115, 'en', 'Phone', 'Phone'),
(116, 'en', 'Attach file', 'Attach file'),
(117, 'en', 'company', 'Company'),
(118, 'en', 'massage', 'Message'),
(119, 'en', 'Send', 'Send'),
(120, 'en', 'Email has been send', 'Email has been send'),
(121, 'ru', 'Faq', 'Вопросы и Ответы'),
(122, 'ru', 'Partner', 'Партнеры'),
(123, 'ru', 'Vote', 'Голосовать');

-- --------------------------------------------------------

--
-- Table structure for table `tree_category`
--

CREATE TABLE `tree_category` (
  `id` int(11) NOT NULL,
  `root` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  `left_key` int(11) DEFAULT NULL,
  `right_key` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE `widget` (
  `id` int(11) NOT NULL,
  `block` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widget`
--

INSERT INTO `widget` (`id`, `block`, `title`) VALUES
(14, 'slogan', 'Слоган'),
(15, 'main-menu', 'Главная меню');

-- --------------------------------------------------------

--
-- Table structure for table `widget_translate`
--

CREATE TABLE `widget_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widget_translate`
--

INSERT INTO `widget_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(39, 14, 'ru', 'html', '<div class="slogan">Пора работать</div>'),
(41, 15, 'ru', 'html', '<ul class="nav">\r\n    <li class="scroll"><a href="#header">Главная</a></li>\r\n    <li class="scroll"><a href="#about">О нас</a></li>\r\n    <li class="scroll"><a href="#trainers">Тренера</a></li>\r\n    <li class="scroll active"><a href="#pricing">Стоимость</a></li>\r\n    <li class="scroll"><a href="#contacts">Контакты</a></li>\r\n</ul>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Indexes for table `cms_configuration`
--
ALTER TABLE `cms_configuration`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cms_javascript`
--
ALTER TABLE `cms_javascript`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_translate`
--
ALTER TABLE `employee_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_translate`
--
ALTER TABLE `faq_translate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso` (`iso`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `menu_translate`
--
ALTER TABLE `menu_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `page_translate`
--
ALTER TABLE `page_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll_translate`
--
ALTER TABLE `poll_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio_category`
--
ALTER TABLE `portfolio_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio_category_translate`
--
ALTER TABLE `portfolio_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `portfolio_gallery`
--
ALTER TABLE `portfolio_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_id` (`portfolio_id`) USING BTREE;

--
-- Indexes for table `portfolio_translate`
--
ALTER TABLE `portfolio_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `products_additional`
--
ALTER TABLE `products_additional`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_category_translate`
--
ALTER TABLE `products_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `products_photos`
--
ALTER TABLE `products_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products_translate`
--
ALTER TABLE `products_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `publication_translate`
--
ALTER TABLE `publication_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `publication_type`
--
ALTER TABLE `publication_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `publication_type_translate`
--
ALTER TABLE `publication_type_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `reviews_translate`
--
ALTER TABLE `reviews_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `seo_manager`
--
ALTER TABLE `seo_manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_translate`
--
ALTER TABLE `slider_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `tours`
--
ALTER TABLE `tours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `tours_category`
--
ALTER TABLE `tours_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tours_category_translate`
--
ALTER TABLE `tours_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `tours_country`
--
ALTER TABLE `tours_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tours_country_translate`
--
ALTER TABLE `tours_country_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `tours_photos`
--
ALTER TABLE `tours_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Indexes for table `tours_timetable`
--
ALTER TABLE `tours_timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_id` (`tour_id`);

--
-- Indexes for table `tours_translate`
--
ALTER TABLE `tours_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `tree_category`
--
ALTER TABLE `tree_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `widget`
--
ALTER TABLE `widget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `block` (`block`);

--
-- Indexes for table `widget_translate`
--
ALTER TABLE `widget_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee_translate`
--
ALTER TABLE `employee_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faq_translate`
--
ALTER TABLE `faq_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `menu_translate`
--
ALTER TABLE `menu_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `page_translate`
--
ALTER TABLE `page_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `poll`
--
ALTER TABLE `poll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `poll_translate`
--
ALTER TABLE `poll_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `poll_votes`
--
ALTER TABLE `poll_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `portfolio_category`
--
ALTER TABLE `portfolio_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `portfolio_category_translate`
--
ALTER TABLE `portfolio_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `portfolio_gallery`
--
ALTER TABLE `portfolio_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `portfolio_translate`
--
ALTER TABLE `portfolio_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `products_additional`
--
ALTER TABLE `products_additional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `products_category`
--
ALTER TABLE `products_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `products_category_translate`
--
ALTER TABLE `products_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `products_photos`
--
ALTER TABLE `products_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `products_translate`
--
ALTER TABLE `products_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `publication_translate`
--
ALTER TABLE `publication_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `publication_type`
--
ALTER TABLE `publication_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `publication_type_translate`
--
ALTER TABLE `publication_type_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reviews_translate`
--
ALTER TABLE `reviews_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `seo_manager`
--
ALTER TABLE `seo_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `slider_translate`
--
ALTER TABLE `slider_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tours_category`
--
ALTER TABLE `tours_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tours_category_translate`
--
ALTER TABLE `tours_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `tours_country`
--
ALTER TABLE `tours_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `tours_country_translate`
--
ALTER TABLE `tours_country_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `tours_photos`
--
ALTER TABLE `tours_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `tours_timetable`
--
ALTER TABLE `tours_timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `tours_translate`
--
ALTER TABLE `tours_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `tree_category`
--
ALTER TABLE `tree_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `widget`
--
ALTER TABLE `widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `widget_translate`
--
ALTER TABLE `widget_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_translate`
--
ALTER TABLE `employee_translate`
  ADD CONSTRAINT `employee_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `menu_translate`
--
ALTER TABLE `menu_translate`
  ADD CONSTRAINT `menu_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_translate`
--
ALTER TABLE `page_translate`
  ADD CONSTRAINT `page_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `page_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `portfolio_gallery`
--
ALTER TABLE `portfolio_gallery`
  ADD CONSTRAINT `portfolio_gallery_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `portfolio_translate`
--
ALTER TABLE `portfolio_translate`
  ADD CONSTRAINT `portfolio_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `portfolio_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_category_translate`
--
ALTER TABLE `products_category_translate`
  ADD CONSTRAINT `products_category_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `products_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_category_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_photos`
--
ALTER TABLE `products_photos`
  ADD CONSTRAINT `products_photos_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_translate`
--
ALTER TABLE `products_translate`
  ADD CONSTRAINT `products_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `publication_translate`
--
ALTER TABLE `publication_translate`
  ADD CONSTRAINT `publication_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `publication_type_translate`
--
ALTER TABLE `publication_type_translate`
  ADD CONSTRAINT `publication_type_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_type_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews_translate`
--
ALTER TABLE `reviews_translate`
  ADD CONSTRAINT `reviews_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slider_translate`
--
ALTER TABLE `slider_translate`
  ADD CONSTRAINT `slider_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `slider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `slider_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tours`
--
ALTER TABLE `tours`
  ADD CONSTRAINT `tours_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tours_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tours_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `tours_country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tours_category_translate`
--
ALTER TABLE `tours_category_translate`
  ADD CONSTRAINT `tours_category_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `tours_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tours_category_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tours_country_translate`
--
ALTER TABLE `tours_country_translate`
  ADD CONSTRAINT `tours_country_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tours_photos`
--
ALTER TABLE `tours_photos`
  ADD CONSTRAINT `tours_photos_bfk1` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tours_timetable`
--
ALTER TABLE `tours_timetable`
  ADD CONSTRAINT `tours_timetable_ibfk_1` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tours_translate`
--
ALTER TABLE `tours_translate`
  ADD CONSTRAINT `tours_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `tours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tours_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `translate`
--
ALTER TABLE `translate`
  ADD CONSTRAINT `translate_ibfk_1` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `tree_category`
--
ALTER TABLE `tree_category`
  ADD CONSTRAINT `tree_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tree_category` (`id`);

--
-- Constraints for table `widget_translate`
--
ALTER TABLE `widget_translate`
  ADD CONSTRAINT `widget_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `widget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `widget_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
