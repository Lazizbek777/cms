-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 28 2018 г., 17:28
-- Версия сервера: 5.5.53
-- Версия PHP: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `demo116`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_user`
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
-- Дамп данных таблицы `admin_user`
--

INSERT INTO `admin_user` (`id`, `role`, `login`, `email`, `name`, `password`, `active`) VALUES
(1, 'admin', 'admin', 'web@eskiz.uz', 'Eskiz.uz', '$2y$10$KTinuT1zFJRNtnNno1v3ouDjRwOdDS0KcyjeSqKHW4bMKFhpih.3q', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `cms_configuration`
--

CREATE TABLE `cms_configuration` (
  `key` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cms_configuration`
--

INSERT INTO `cms_configuration` (`key`, `value`) VALUES
('ADMIN_EMAIL', 'web@eskiz.uz'),
('DEBUG_MODE', '1'),
('DISPLAY_CHANGELOG', '1'),
('PROFILER', '0'),
('TECHNICAL_WORKS', '0'),
('WIDGETS_CACHE', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `cms_javascript`
--

CREATE TABLE `cms_javascript` (
  `id` varchar(20) NOT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cms_javascript`
--

INSERT INTO `cms_javascript` (`id`, `text`) VALUES
('body', '<!-- custom javascript code or any html -->'),
('head', '<!-- custom javascript code or any html -->');

-- --------------------------------------------------------

--
-- Структура таблицы `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int(11) NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `site_name`, `email`, `favicon`, `logo`) VALUES
(1, 'Eskiz IT Company', 'info@eskiz.uz', 'favicon.png', 'logo.svg');

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `employee_translate`
--

CREATE TABLE `employee_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `language`
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
-- Дамп данных таблицы `language`
--

INSERT INTO `language` (`id`, `iso`, `locale`, `name`, `short_name`, `url`, `sortorder`, `primary`) VALUES
(1, 'ru', 'ru_RU', 'Русский', 'Рус', 'ru', 1, '1'),
(2, 'en', 'en_EN', 'English', 'Eng', 'en', 2, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
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
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `root`, `parent_id`, `slug`, `depth`, `left_key`, `right_key`, `created_at`, `updated_at`) VALUES
(4, 'main', NULL, 'contacts', 1, 10, 11, '2016-11-30 20:33:50', '2017-09-15 14:53:58'),
(5, 'main', NULL, 'news', 1, 6, 7, '2016-11-30 21:06:14', '2017-09-15 14:53:58'),
(11, 'main', NULL, 'products', 1, 4, 5, '2017-06-08 11:52:33', '2017-09-15 14:53:58'),
(13, 'main', NULL, 'about', 1, 2, 3, '2017-06-13 13:15:30', '2017-09-15 14:53:58'),
(14, 'main', NULL, 'delivery', 1, 8, 9, '2017-06-13 13:21:33', '2017-09-15 14:53:58');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_translate`
--

CREATE TABLE `menu_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu_translate`
--

INSERT INTO `menu_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(6, 4, 'ru', 'title', 'Контакты'),
(7, 4, 'en', 'title', 'Contacts'),
(8, 5, 'ru', 'title', 'Новости'),
(9, 5, 'en', 'title', 'Services'),
(18, 11, 'ru', 'title', 'Продукты'),
(20, 13, 'ru', 'title', 'О нас'),
(21, 14, 'ru', 'title', 'Доставка'),
(22, 13, 'ru', 'status', '1'),
(23, 11, 'ru', 'status', '1'),
(24, 5, 'ru', 'status', '1'),
(25, 4, 'ru', 'status', '1'),
(26, 14, 'ru', 'status', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `page`
--

INSERT INTO `page` (`id`, `slug`, `created_at`, `updated_at`, `index_page`) VALUES
(1, 'index', '2014-08-03 15:18:47', '2017-01-02 10:48:32', '0'),
(2, 'contacts', '2014-08-03 22:25:13', '2017-06-12 12:28:12', '0'),
(7, 'about', '2017-06-12 13:33:35', '2017-06-13 13:16:31', '0'),
(8, 'delivery', '2017-06-12 13:34:19', '2017-06-13 13:21:19', '0'),
(13, 'product-details', '2017-06-12 13:48:58', '2017-06-12 13:48:58', '0'),
(14, 'products', '2017-06-12 13:49:54', '2017-06-12 13:49:54', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `page_translate`
--

CREATE TABLE `page_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `page_translate`
--

INSERT INTO `page_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Главная'),
(2, 1, 'ru', 'meta_title', 'Главная'),
(3, 1, 'ru', 'meta_description', 'meta-описание главной страницы'),
(4, 1, 'ru', 'meta_keywords', ''),
(5, 1, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<h1>Подзаголовок</h1>\r\n<p>Съешь еще этих мягких французских булок да выпей чаю.&nbsp;Съешь еще этих мягких французских булок да выпей чаю.&nbsp;Съешь еще этих мягких французских булок да выпей чаю.&nbsp;Съешь еще этих мягких французских булок да выпей чаю.&nbsp;Съешь еще этих мягких французских булок да выпей чаю.&nbsp;Съешь еще этих мягких французских булок да выпей чаю.&nbsp;</p>\r\n<h3>Под-подзаголовок</h3>\r\n<p>Список:</p>\r\n<ul>\r\n<li>Первый&nbsp;пункт</li>\r\n<li>Второй пукт<br />\r\n<ul>\r\n<li>Вложенный уровень второго пункта</li>\r\n<li>Еще один</li>\r\n</ul>\r\n</li>\r\n<li>Третий пункт</li>\r\n</ul>\r\n<p>Таблица</p>\r\n<table class=\"table\" style=\"width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<th>Заглавие</th>\r\n<th>Заглавие</th>\r\n<th>Заглавие</th>\r\n</tr>\r\n<tr>\r\n<td>Текст в ячейке</td>\r\n<td>Текст в ячейке</td>\r\n<td>Текст в ячейке</td>\r\n</tr>\r\n<tr>\r\n<td>Текст в ячейке</td>\r\n<td>Текст в ячейке</td>\r\n<td>Текст в ячейке</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Числовой список:</p>\r\n<ol>\r\n<li>Первый</li>\r\n<li>Второй</li>\r\n<li>Третий</li>\r\n</ol>\r\n</body>\r\n</html>'),
(11, 2, 'ru', 'title', 'Контакты'),
(12, 2, 'ru', 'meta_title', 'Контакты'),
(13, 2, 'ru', 'meta_description', ''),
(14, 2, 'ru', 'meta_keywords', ''),
(15, 2, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>E-Shopper Inc.</p>\r\n<p>Узбекистан, г. Ташкент, ул. Навои, дом 9, 4 этаж, 1 комната. Ориентир: Урда, рядом с банком Trastbank</p>\r\n<p>Тел: +998 71 202 60 60</p>\r\n<p>Email: info@eskiz.uz</p>\r\n</body>\r\n</html>'),
(61, 1, 'en', 'title', 'Home'),
(62, 1, 'en', 'meta_title', 'Home'),
(63, 1, 'en', 'meta_description', ''),
(64, 1, 'en', 'meta_keywords', ''),
(65, 1, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(66, 2, 'en', 'title', 'Contacts'),
(67, 2, 'en', 'meta_title', 'Contacts'),
(68, 2, 'en', 'meta_description', ''),
(69, 2, 'en', 'meta_keywords', ''),
(70, 2, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(81, 7, 'ru', 'title', 'О нас'),
(82, 7, 'ru', 'meta_description', ''),
(83, 7, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias vitae neque ipsa veritatis amet, esse temporibus quasi voluptatem possimus tempore, obcaecati, assumenda ex maxime cupiditate voluptate excepturi alias, iste quibusdam. Officia, sit. Voluptatem quod quis autem debitis vel, quasi laborum ipsam maiores nostrum sequi velit, est itaque maxime dolores eaque possimus quos repudiandae voluptas similique excepturi perspiciatis? Totam voluptatibus velit numquam et at quisquam voluptas quod sapiente id, expedita animi quo maiores eius commodi! Laudantium aliquam nam a fugiat repellat ex harum tempora, nemo voluptate dolore aperiam, mollitia excepturi praesentium! Sapiente veniam magnam velit id, dignissimos neque consequuntur doloremque esse perferendis, fugit laborum necessitatibus pariatur, enim earum dolorem nemo ut modi recusandae at cum minima animi adipisci sed, distinctio placeat. Quos cumque, obcaecati quidem voluptatem fugiat quas laboriosam corporis beatae nemo reprehenderit architecto soluta ex nostrum earum minima, quasi sequi ipsum itaque et illo hic, suscipit accusantium quo! A quidem nisi voluptate dolores porro, illum tempore suscipit, quas corporis numquam cumque eos in distinctio alias aliquam natus, facilis consequatur reiciendis autem mollitia! Itaque porro blanditiis rem, explicabo totam dolorum a quo tempore facilis, reiciendis nam architecto? Rerum voluptatibus aliquam enim ipsam, nobis, cumque odit exercitationem, ducimus pariatur officia aperiam dicta.</p>\r\n</body>\r\n</html>'),
(84, 8, 'ru', 'title', 'Доставка  '),
(85, 8, 'ru', 'meta_description', ''),
(86, 8, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>\r\n<p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p>\r\n<p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>\r\n</body>\r\n</html>'),
(99, 13, 'ru', 'title', 'Детали продукта'),
(100, 13, 'ru', 'meta_description', ''),
(101, 13, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n</body>\r\n</html>'),
(102, 14, 'ru', 'title', 'Продукты'),
(103, 14, 'ru', 'meta_description', ''),
(104, 14, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>');

-- --------------------------------------------------------

--
-- Структура таблицы `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `anons` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `portfolio_category`
--

CREATE TABLE `portfolio_category` (
  `id` int(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `portfolio_category`
--

INSERT INTO `portfolio_category` (`id`, `sort`) VALUES
(1, 5),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `portfolio_category_translate`
--

CREATE TABLE `portfolio_category_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `portfolio_category_translate`
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
-- Структура таблицы `portfolio_gallery`
--

CREATE TABLE `portfolio_gallery` (
  `id` int(11) NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `portfolio_translate`
--

CREATE TABLE `portfolio_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
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
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `slug`, `price`, `special_offer`, `created_at`, `updated_at`, `anons`, `index_page`) VALUES
(2, 9, 'bags02', 0, '0', '2017-06-09 10:01:20', '2017-06-09 10:01:20', 'files/original/products/2.jpg', '0'),
(3, 19, 'clothing01', 100, '1', '2017-06-09 10:06:31', '2017-06-12 10:45:27', 'files/original/products/3.jpg', '0'),
(4, 19, 'fendi01', 50, '1', '2017-06-09 10:12:36', '2017-06-14 13:44:42', 'files/original/products/4.jpg', '0'),
(5, 19, 'guess01', 0, '1', '2017-06-09 10:16:48', '2017-06-12 08:54:46', 'files/original/products/5.jpg', '0'),
(6, 19, 'moda01', 5, '1', '2017-06-09 10:23:33', '2017-06-14 14:36:49', 'files/original/products/6.jpg', '0'),
(8, 19, 'blouse', 300, '1', '2017-06-13 12:15:38', '2017-06-14 13:23:01', 'files/original/products/8.jpg', '0'),
(9, 3, 'zara', 0, '0', '2017-10-16 09:32:26', '2017-10-16 09:32:26', NULL, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `products_additional`
--

CREATE TABLE `products_additional` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `language` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products_additional`
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
(49, 2, 'ru', 'Материал', 'Кожа'),
(50, 7, 'ru', '1 ден', 'Uzb'),
(51, 4, 'ru', 'nike', '5055365.0'),
(52, 4, 'ru', 'chanel', '400'),
(53, 3, 'ru', 'versache', '1005'),
(54, 8, 'ru', 'Chine', '3'),
(55, 6, 'ru', 'Сделано в', 'England'),
(56, 6, 'ru', 'Состояние', 'Новый'),
(57, 6, 'ru', 'Материал', 'Кожа');

-- --------------------------------------------------------

--
-- Структура таблицы `products_category`
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
-- Дамп данных таблицы `products_category`
--

INSERT INTO `products_category` (`id`, `slug`, `limit`, `format`, `foto`, `parent_cat`, `index_page`) VALUES
(1, 'sportwear', 10, NULL, 'files/original/category/1.jpg', 0, '0'),
(2, 'mens', 10, NULL, 'files/original/category/2.jpg', 0, '0'),
(3, 'womens', 10, NULL, 'files/original/category/3.jpg', 0, '0'),
(4, 'kids', 10, NULL, 'files/original/category/4.jpg', 0, '0'),
(5, 'fashion', 10, NULL, 'files/original/category/5.jpg', 0, '0'),
(6, 'householder', 10, NULL, 'files/original/category/6.jpg', 0, '0'),
(7, 'interiors', 10, NULL, 'files/original/category/7.jpg', 0, '0'),
(8, 'clothing', 10, NULL, 'files/original/category/8.jpg', 0, '0'),
(9, 'bags', 10, NULL, 'files/original/category/9.jpg', 0, '0'),
(10, 'shoes', 10, NULL, 'files/original/category/10.jpg', 0, '0'),
(11, 'men-fendi', 10, NULL, 'files/original/category/11.jpg', 2, '0'),
(12, 'men-guess', 10, NULL, 'files/original/category/12.jpg', 2, '0'),
(19, 'nike', 10, NULL, 'files/original/category/19.jpg', 1, '0'),
(20, 'under', 10, NULL, 'files/original/category/20.jpg', 1, '0'),
(21, 'adidas', 10, NULL, 'files/original/category/21.jpg', 1, '0'),
(22, 'dior', 10, NULL, 'files/original/category/22.jpg', 3, '0'),
(23, 'versace', 10, NULL, 'files/original/category/23.jpg', 3, '0'),
(24, 'men-valentino', 10, NULL, 'files/original/category/24.jpg', 2, '0'),
(25, 'wfr', 10, NULL, NULL, 3, '0'),
(26, 'wter', 10, NULL, NULL, 1, '0'),
(27, 'zara', 10, NULL, NULL, 3, '0'),
(28, 'dsad', 10, NULL, NULL, 3, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `products_category_translate`
--

CREATE TABLE `products_category_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products_category_translate`
--

INSERT INTO `products_category_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Спортивная одежда'),
(2, 1, 'ru', 'meta_description', ''),
(3, 1, 'en', 'title', 'Parent category 1'),
(4, 1, 'en', 'meta_description', ''),
(5, 1, 'ru', 'text', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.'),
(6, 2, 'ru', 'title', 'Мужской'),
(7, 2, 'ru', 'meta_description', ''),
(8, 2, 'ru', 'text', ''),
(9, 3, 'ru', 'title', 'Женский'),
(10, 3, 'ru', 'meta_description', ''),
(11, 3, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(12, 4, 'ru', 'title', 'Дети'),
(13, 4, 'ru', 'meta_description', ''),
(14, 4, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(15, 5, 'ru', 'title', 'мода'),
(16, 5, 'ru', 'meta_description', ''),
(17, 5, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(18, 6, 'ru', 'title', 'Домохозяин'),
(19, 6, 'ru', 'meta_description', ''),
(20, 6, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(21, 7, 'ru', 'title', 'Интерьеры'),
(22, 7, 'ru', 'meta_description', ''),
(23, 7, 'ru', 'text', '\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(24, 8, 'ru', 'title', 'одежда'),
(25, 8, 'ru', 'meta_description', ''),
(26, 8, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(27, 9, 'ru', 'title', 'Сумки'),
(28, 9, 'ru', 'meta_description', ''),
(29, 9, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(30, 10, 'ru', 'title', 'обувь'),
(31, 10, 'ru', 'meta_description', ''),
(32, 10, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(33, 11, 'ru', 'title', 'Fendi'),
(34, 11, 'ru', 'meta_description', ''),
(35, 11, 'ru', 'text', '\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(36, 12, 'ru', 'title', 'Guess'),
(37, 12, 'ru', 'meta_description', ''),
(38, 12, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(57, 19, 'ru', 'title', 'Nike '),
(58, 19, 'ru', 'meta_description', ''),
(59, 19, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(60, 20, 'ru', 'title', 'Под панцырь'),
(61, 20, 'ru', 'meta_description', ''),
(62, 20, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(63, 21, 'ru', 'title', 'Адидас'),
(64, 21, 'ru', 'meta_description', ''),
(65, 21, 'ru', 'text', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(66, 22, 'ru', 'title', 'Dior'),
(67, 22, 'ru', 'meta_description', ''),
(68, 22, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(69, 23, 'ru', 'title', 'Versace'),
(70, 23, 'ru', 'meta_description', ''),
(71, 23, 'ru', 'text', '\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(72, 24, 'ru', 'title', 'Valentino'),
(73, 24, 'ru', 'meta_description', ''),
(74, 24, 'ru', 'text', '\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ad nostrum dolorem, cum ratione. Sit debitis veniam optio labore. Iste perspiciatis corporis obcaecati voluptatem maxime, sint beatae itaque quis ratione neque, laborum nesciunt. Rem ducimus reiciendis in, doloribus iusto corporis hic porro esse fugiat aliquid quam, debitis, sunt deserunt fugit molestiae incidunt quos ex distinctio voluptates, odit molestias. Dignissimos architecto placeat natus, ducimus non ea, quam aperiam eligendi laudantium illo labore quis esse. Excepturi, deserunt, debitis voluptates praesentium ducimus, totam dignissimos nulla quia blanditiis quam quibusdam sint eaque enim mollitia est distinctio, cupiditate porro assumenda dicta laborum inventore consequatur. Cumque iure vero ducimus nisi quo veniam ab, inventore quaerat, mollitia tempore tenetur. Officia accusamus pariatur hic dicta, quos quod enim libero deleniti consequuntur sit ducimus aperiam minima nam ex quam esse nostrum totam mollitia! Quaerat, ea, impedit officiis iusto at quo ratione libero atque, consequatur minima ipsam blanditiis odit. Debitis, reiciendis quibusdam sunt deleniti animi at, vitae et atque voluptatem accusamus aliquam, tenetur quaerat officiis, dignissimos laboriosam quia amet perferendis obcaecati ullam suscipit veritatis velit. Minus, delectus perferendis odit laboriosam consectetur?'),
(75, 25, 'ru', 'title', 'trhyt'),
(76, 25, 'ru', 'meta_description', ''),
(77, 25, 'ru', 'text', ''),
(78, 26, 'ru', 'title', 'fgtwer'),
(79, 26, 'ru', 'meta_description', ''),
(80, 26, 'ru', 'text', ''),
(81, 27, 'ru', 'title', 'zara'),
(82, 27, 'ru', 'meta_title', ''),
(83, 27, 'ru', 'meta_description', ''),
(84, 27, 'ru', 'text', ''),
(85, 27, 'ru', 'menu_check', '0'),
(86, 28, 'ru', 'title', 'dsadd'),
(87, 28, 'ru', 'meta_title', ''),
(88, 28, 'ru', 'meta_description', ''),
(89, 28, 'ru', 'text', ''),
(90, 28, 'ru', 'menu_check', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `products_photos`
--

CREATE TABLE `products_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_id` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products_photos`
--

INSERT INTO `products_photos` (`id`, `product_id`, `file`, `file_id`, `foto`) VALUES
(4, 4, 'files/original/products_gallery/7b68a6d6d62049290ccb53b0949849f9.jpg', '7b68a6d6d62049290ccb53b0949849f9', NULL),
(5, 3, 'files/original/products_gallery/f84ffce45b1add2378b53c42c919336b.jpg', 'f84ffce45b1add2378b53c42c919336b', NULL),
(6, 8, 'files/original/products_gallery/9a442e4411242b8298ea9dcd86d05afe.jpg', '9a442e4411242b8298ea9dcd86d05afe', NULL),
(7, 8, 'files/original/products_gallery/fcc076e6958f28a05e63a8d48c30deb1.jpg', 'fcc076e6958f28a05e63a8d48c30deb1', NULL),
(8, 8, 'files/original/products_gallery/11cebc680b0d4a286c5d42280e5eb921.jpg', '11cebc680b0d4a286c5d42280e5eb921', NULL),
(9, 8, 'files/original/products_gallery/23b28f6e0a0ecdd3855672e1f5ac573b.jpg', '23b28f6e0a0ecdd3855672e1f5ac573b', NULL),
(10, 4, 'files/original/products_gallery/89811ad3414b1feaab3ce6a3f9946d02.jpg', '89811ad3414b1feaab3ce6a3f9946d02', NULL),
(11, 4, 'files/original/products_gallery/640b8dc7db6b6473202f04aa94650c41.jpg', '640b8dc7db6b6473202f04aa94650c41', NULL),
(12, 4, 'files/original/products_gallery/d9b7e1aefa4ada1d90098bf23fbc5888.jpg', 'd9b7e1aefa4ada1d90098bf23fbc5888', NULL),
(16, 6, 'files/original/products_gallery/54f391e631abac0b31bdc021b5785a85.jpg', '54f391e631abac0b31bdc021b5785a85', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `products_translate`
--

CREATE TABLE `products_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products_translate`
--

INSERT INTO `products_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(4, 2, 'ru', 'title', 'сумка'),
(5, 2, 'ru', 'meta_description', ''),
(6, 2, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>'),
(7, 3, 'ru', 'title', 'сумка'),
(8, 3, 'ru', 'meta_description', ''),
(9, 3, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>lorem ipsum</p>\r\n</body>\r\n</html>'),
(10, 4, 'ru', 'title', 'Футболки'),
(11, 4, 'ru', 'meta_description', ''),
(12, 4, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><br />Lorem ipsum dolor sit.</p>\r\n</body>\r\n</html>'),
(13, 5, 'ru', 'title', 'Футболки'),
(14, 5, 'ru', 'meta_description', ''),
(15, 5, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>'),
(16, 6, 'ru', 'title', 'Майка'),
(17, 6, 'ru', 'meta_description', ''),
(18, 6, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><br /> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iure assumenda architecto, quibusdam consequuntur nesciunt debitis perspiciatis, voluptas quae atque ducimus a temporibus eveniet error pariatur est dignissimos non autem?</p>\r\n</body>\r\n</html>'),
(22, 8, 'ru', 'title', 'блузка'),
(23, 8, 'ru', 'meta_description', ''),
(24, 8, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><br /> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, corrupti maxime! Laboriosam ipsum et nobis, nulla, similique id maxime adipisci itaque ex, accusamus cupiditate officiis repellat. Sit repellendus natus quam.</p>\r\n</body>\r\n</html>'),
(25, 9, 'ru', 'title', 'zara'),
(26, 9, 'ru', 'meta_title', ''),
(27, 9, 'ru', 'meta_description', ''),
(28, 9, 'ru', 'text', '');

-- --------------------------------------------------------

--
-- Структура таблицы `publication`
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
-- Дамп данных таблицы `publication`
--

INSERT INTO `publication` (`id`, `type_id`, `slug`, `created_at`, `updated_at`, `date`, `preview_inner`, `preview_src`, `index_page`) VALUES
(1, 1, 'news01', '2017-06-13 09:26:04', '2017-06-13 09:26:04', '2017-06-07 11:25:47', '1', 'files/original/publication/1.jpg', '0'),
(3, 1, 'news03', '2017-06-13 09:36:10', '2017-06-13 09:36:10', '2017-06-11 11:35:20', '1', 'files/original/publication/3.jpg', '0'),
(4, 1, 'news02', '2017-06-13 09:46:34', '2017-06-13 09:46:34', '2017-06-10 11:46:27', '1', 'files/original/publication/4.jpg', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `publication_translate`
--

CREATE TABLE `publication_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `publication_translate`
--

INSERT INTO `publication_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'ДЕВОЧЕК РОЗОВЫЙ ПРИЕХАЛА ФУТБОЛКА В МАГАЗИНЕ'),
(2, 1, 'ru', 'meta_description', ''),
(3, 1, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n</body>\r\n</html>'),
(7, 3, 'ru', 'title', 'ДЕВОЧЕК РОЗОВЫЙ ПРИЕХАЛА ФУТБОЛКА В МАГАЗИНЕ'),
(8, 3, 'ru', 'meta_description', ''),
(9, 3, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n</body>\r\n</html>'),
(10, 4, 'ru', 'title', 'ДЕВОЧЕК РОЗОВЫЙ ПРИЕХАЛА ФУТБОЛКА В МАГАЗИНЕ'),
(11, 4, 'ru', 'meta_description', ''),
(12, 4, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n</body>\r\n</html>');

-- --------------------------------------------------------

--
-- Структура таблицы `publication_type`
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
-- Дамп данных таблицы `publication_type`
--

INSERT INTO `publication_type` (`id`, `slug`, `limit`, `format`, `display_date`, `index_page`) VALUES
(1, 'news', 10, 'grid', '1', '0'),
(2, 'articles', 10, 'list', '0', '0'),
(3, 'services', 10, 'services', '0', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `publication_type_translate`
--

CREATE TABLE `publication_type_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `publication_type_translate`
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
(89, 2, 'en', 'seo_text', 'Articles');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reviews_translate`
--

CREATE TABLE `reviews_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `seo_manager`
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
-- Дамп данных таблицы `seo_manager`
--

INSERT INTO `seo_manager` (`id`, `url`, `head_title`, `meta_description`, `meta_keywords`, `seo_text`, `created_at`, `updated_at`) VALUES
(1, '/news', '', '', '', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>', '2014-09-30 10:39:23', '2016-12-24 16:14:34'),
(2, '/contacts', '', '', '', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>', '2015-05-21 16:33:14', '2016-12-24 16:14:16');

-- --------------------------------------------------------

--
-- Структура таблицы `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `view_title` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `slider`
--

INSERT INTO `slider` (`id`, `banner`, `view_title`) VALUES
(3, 'files/original/banner/3.jpg', '0'),
(4, 'files/original/banner/4.jpg', '0'),
(5, 'files/original/banner/5.jpg', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `slider_translate`
--

CREATE TABLE `slider_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `slider_translate`
--

INSERT INTO `slider_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(7, 3, 'ru', 'title', 'Гарантия лучшей цены'),
(8, 3, 'ru', 'text', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(9, 4, 'ru', 'title', 'Бесплатная доставка'),
(10, 4, 'ru', 'text', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(11, 5, 'ru', 'title', 'Удобный возврат'),
(12, 5, 'ru', 'text', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');

-- --------------------------------------------------------

--
-- Структура таблицы `translate`
--

CREATE TABLE `translate` (
  `id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `phrase` varchar(500) DEFAULT NULL,
  `translation` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `translate`
--

INSERT INTO `translate` (`id`, `lang`, `phrase`, `translation`) VALUES
(1, 'ru', 'Ошибка валидации формы', 'Ошибка валидации формы'),
(2, 'ru', 'Подробнее', 'Подробнее'),
(3, 'ru', 'Назад к перечню публикаций', 'Назад к перечню публикаций'),
(4, 'ru', 'SITE NAME', 'Eskiz IT Company'),
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
(65, 'ru', 'Latest news', 'ПОСЛЕДНИЕ ИЗ НАШИХ новостей'),
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
(86, 'ru', 'Portfolio', ''),
(87, 'ru', 'Products', ''),
(88, 'ru', 'Tours', ''),
(89, 'ru', 'Employee', ''),
(90, 'ru', 'Category', 'Категория'),
(91, 'ru', 'Back to products list', 'назад'),
(92, 'ru', 'New products', ''),
(93, 'ru', 'Special offers', ''),
(94, 'ru', 'Back to tours list', ''),
(95, 'ru', 'Department', ''),
(96, 'ru', 'Send', ''),
(97, 'ru', 'Email has been send', ''),
(98, 'ru', 'Tour name', ''),
(99, 'ru', 'amount', ''),
(100, 'ru', 'Number of People', ''),
(101, 'ru', 'Full name', ''),
(102, 'ru', 'Email', ''),
(103, 'ru', 'Phone', ''),
(104, 'ru', 'set a date', ''),
(105, 'ru', 'special request', ''),
(106, 'ru', 'To book', ''),
(107, 'ru', 'Your request has been sent', ''),
(108, 'ru', 'Your email dont sent', ''),
(109, 'ru', 'Brands', 'Бренды'),
(110, 'ru', 'Price Range', 'Ценовой Диапазон'),
(111, 'ru', 'Features Items', 'Особенности Элементов'),
(112, 'ru', 'recommended items', 'рекомендуемые элементы'),
(113, 'ru', 'Get it now', 'Получите его сейчас'),
(114, 'ru', 'price from ', ''),
(115, 'ru', 'Schedule', ''),
(116, 'ru', 'details', ''),
(117, 'ru', 'price', ''),
(118, 'ru', 'Check in', ''),
(119, 'ru', 'location', ''),
(120, 'ru', 'Adults', ''),
(121, 'ru', 'rate', ''),
(122, 'ru', 'view on map', ''),
(123, 'ru', 'book now', ''),
(124, 'ru', 'useful information', ''),
(125, 'ru', 'Need Help', ''),
(126, 'ru', 'Get In Touch', 'Связаться'),
(127, 'ru', 'Contact Info', 'КОНТАКТНАЯ ИНФОРМАЦИЯ'),
(128, 'ru', 'Social Networking', 'СОЦИАЛЬНЫХ СЕТЕЙ'),
(129, 'ru', 'Submit', 'Отправить'),
(130, 'ru', 'Read More', 'Подробнее'),
(131, 'ru', 'Description', 'Описание');

-- --------------------------------------------------------

--
-- Структура таблицы `tree_category`
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
-- Структура таблицы `tree_category_translate`
--

CREATE TABLE `tree_category_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `widget`
--

CREATE TABLE `widget` (
  `id` int(11) NOT NULL,
  `block` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget`
--

INSERT INTO `widget` (`id`, `block`, `title`) VALUES
(16, 'header-top', 'header'),
(17, 'footer-logo', 'footer'),
(18, 'footer-map', 'footer'),
(19, 'footer-search', 'footer'),
(20, 'social', 'contact');

-- --------------------------------------------------------

--
-- Структура таблицы `widget_translate`
--

CREATE TABLE `widget_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_translate`
--

INSERT INTO `widget_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(42, 16, 'ru', 'html', '<div class=\"col-sm-6\">\r\n    <div class=\"contactinfo\">\r\n        <ul class=\"nav nav-pills\">\r\n            <li><a href=\"#\"><i class=\"fa fa-phone\"></i> +998(71) 202 60 60</a></li>\r\n            <li><a href=\"#\"><i class=\"fa fa-envelope\"></i> info@eskiz.uz</a></li>\r\n        </ul>\r\n    </div>\r\n</div>\r\n<div class=\"col-sm-6\">\r\n    <div class=\"social-icons pull-right\">\r\n        <ul class=\"nav navbar-nav\">\r\n            <li><a href=\"#\"><i class=\"fa fa-facebook\"></i></a></li>\r\n            <li><a href=\"#\"><i class=\"fa fa-vk\"></i></a></li>\r\n            <li><a href=\"#\"><i class=\"fa fa-odnoklassniki\"></i></a></li>\r\n            <li><a href=\"#\"><i class=\"fa fa-google-plus\"></i></a></li>\r\n        </ul>\r\n    </div>\r\n</div>'),
(43, 17, 'ru', 'html', '\r\n<h2><span>e</span>-shopper</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>'),
(44, 18, 'ru', 'html', '<img src=\"/assets/images/home/map.png\" alt=\"\" />\r\n<p>505 с Атлантик-Авеню Вирджиния Бич, VA(Виргиния)</p>'),
(45, 19, 'ru', 'html', '<h3>О нас Shopper</h3>\r\n<form action=\"#\" class=\"searchform\">\r\n    <input type=\"text\" placeholder=\"Ваш электронной почты\" />\r\n    <button type=\"submit\" class=\"btn btn-default\"><i class=\"fa fa-arrow-circle-o-right\"></i></button>\r\n</form>'),
(46, 20, 'ru', 'html', '<li>\r\n                            <a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\r\n                        </li>\r\n                        <li>\r\n                            <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\r\n                        </li>\r\n                        <li>\r\n                            <a href=\"#\"><i class=\"fa fa-google-plus\"></i></a>\r\n                        </li>\r\n                        <li>\r\n                            <a href=\"#\"><i class=\"fa fa-youtube\"></i></a>\r\n                        </li>');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `cms_configuration`
--
ALTER TABLE `cms_configuration`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `cms_javascript`
--
ALTER TABLE `cms_javascript`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employee_translate`
--
ALTER TABLE `employee_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso` (`iso`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `menu_translate`
--
ALTER TABLE `menu_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`);

--
-- Индексы таблицы `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `page_translate`
--
ALTER TABLE `page_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `portfolio_category`
--
ALTER TABLE `portfolio_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `portfolio_category_translate`
--
ALTER TABLE `portfolio_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `portfolio_gallery`
--
ALTER TABLE `portfolio_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_id` (`portfolio_id`) USING BTREE;

--
-- Индексы таблицы `portfolio_translate`
--
ALTER TABLE `portfolio_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `products_additional`
--
ALTER TABLE `products_additional`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products_category_translate`
--
ALTER TABLE `products_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `products_photos`
--
ALTER TABLE `products_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `products_translate`
--
ALTER TABLE `products_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `publication_translate`
--
ALTER TABLE `publication_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `publication_type`
--
ALTER TABLE `publication_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `publication_type_translate`
--
ALTER TABLE `publication_type_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `reviews_translate`
--
ALTER TABLE `reviews_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `seo_manager`
--
ALTER TABLE `seo_manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Индексы таблицы `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `slider_translate`
--
ALTER TABLE `slider_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `tree_category`
--
ALTER TABLE `tree_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `tree_category_translate`
--
ALTER TABLE `tree_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `widget`
--
ALTER TABLE `widget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `block` (`block`);

--
-- Индексы таблицы `widget_translate`
--
ALTER TABLE `widget_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `employee_translate`
--
ALTER TABLE `employee_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `menu_translate`
--
ALTER TABLE `menu_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT для таблицы `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `page_translate`
--
ALTER TABLE `page_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT для таблицы `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `portfolio_category`
--
ALTER TABLE `portfolio_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `portfolio_category_translate`
--
ALTER TABLE `portfolio_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `portfolio_gallery`
--
ALTER TABLE `portfolio_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `portfolio_translate`
--
ALTER TABLE `portfolio_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `products_additional`
--
ALTER TABLE `products_additional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT для таблицы `products_category`
--
ALTER TABLE `products_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT для таблицы `products_category_translate`
--
ALTER TABLE `products_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT для таблицы `products_photos`
--
ALTER TABLE `products_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `products_translate`
--
ALTER TABLE `products_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT для таблицы `publication`
--
ALTER TABLE `publication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `publication_translate`
--
ALTER TABLE `publication_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `publication_type`
--
ALTER TABLE `publication_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `publication_type_translate`
--
ALTER TABLE `publication_type_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `reviews_translate`
--
ALTER TABLE `reviews_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `seo_manager`
--
ALTER TABLE `seo_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `slider_translate`
--
ALTER TABLE `slider_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT для таблицы `tree_category`
--
ALTER TABLE `tree_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tree_category_translate`
--
ALTER TABLE `tree_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `widget`
--
ALTER TABLE `widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `widget_translate`
--
ALTER TABLE `widget_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employee_translate`
--
ALTER TABLE `employee_translate`
  ADD CONSTRAINT `employee_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_translate`
--
ALTER TABLE `menu_translate`
  ADD CONSTRAINT `menu_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `page_translate`
--
ALTER TABLE `page_translate`
  ADD CONSTRAINT `page_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `page_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `portfolio_gallery`
--
ALTER TABLE `portfolio_gallery`
  ADD CONSTRAINT `portfolio_gallery_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `portfolio_translate`
--
ALTER TABLE `portfolio_translate`
  ADD CONSTRAINT `portfolio_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `portfolio_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products_category_translate`
--
ALTER TABLE `products_category_translate`
  ADD CONSTRAINT `products_category_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `products_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_category_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products_photos`
--
ALTER TABLE `products_photos`
  ADD CONSTRAINT `products_photos_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products_translate`
--
ALTER TABLE `products_translate`
  ADD CONSTRAINT `products_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `publication_translate`
--
ALTER TABLE `publication_translate`
  ADD CONSTRAINT `publication_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `publication_type_translate`
--
ALTER TABLE `publication_type_translate`
  ADD CONSTRAINT `publication_type_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_type_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews_translate`
--
ALTER TABLE `reviews_translate`
  ADD CONSTRAINT `reviews_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `slider_translate`
--
ALTER TABLE `slider_translate`
  ADD CONSTRAINT `slider_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `slider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `slider_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `translate`
--
ALTER TABLE `translate`
  ADD CONSTRAINT `translate_ibfk_1` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Ограничения внешнего ключа таблицы `tree_category`
--
ALTER TABLE `tree_category`
  ADD CONSTRAINT `tree_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tree_category` (`id`);

--
-- Ограничения внешнего ключа таблицы `tree_category_translate`
--
ALTER TABLE `tree_category_translate`
  ADD CONSTRAINT `tree_category_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `tree_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tree_category_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `widget_translate`
--
ALTER TABLE `widget_translate`
  ADD CONSTRAINT `widget_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `widget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `widget_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
