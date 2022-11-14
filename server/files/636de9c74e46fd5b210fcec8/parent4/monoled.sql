-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 21 2022 г., 18:35
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `monoled`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_address`
--

CREATE TABLE `oc_address` (
  `address_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int NOT NULL DEFAULT '0',
  `zone_id` int NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'test', 'testovic', 'asgSGsdg', 'Cherson', 'Cherson', 'Kyiv', '75000', 220, 3496, '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_attribute_values`
--

CREATE TABLE `oc_af_attribute_values` (
  `attribute_value_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `language_id` int NOT NULL,
  `sort_order` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_af_attribute_values`
--

INSERT INTO `oc_af_attribute_values` (`attribute_value_id`, `attribute_id`, `language_id`, `sort_order`, `image`, `text`) VALUES
(1, 3, 1, 0, '', '100mhz'),
(2, 2, 1, 0, '', '1'),
(3, 4, 1, 0, '', '8gb'),
(4, 2, 1, 0, '', '4'),
(5, 4, 1, 0, '', '16GB');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_ean`
--

CREATE TABLE `oc_af_ean` (
  `ean_id` int NOT NULL,
  `value` varchar(96) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_filter`
--

CREATE TABLE `oc_af_filter` (
  `filter_id` int NOT NULL,
  `language_id` int NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_product_attribute`
--

CREATE TABLE `oc_af_product_attribute` (
  `product_attribute_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `attribute_id` int DEFAULT NULL,
  `attribute_value_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_af_product_attribute`
--

INSERT INTO `oc_af_product_attribute` (`product_attribute_id`, `product_id`, `attribute_id`, `attribute_value_id`) VALUES
(1, 42, 3, 1),
(2, 43, 2, 2),
(3, 43, 4, 3),
(4, 47, 2, 4),
(5, 47, 4, 5),
(6, 50, 3, 1),
(7, 52, 2, 4),
(8, 52, 4, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_product_ean`
--

CREATE TABLE `oc_af_product_ean` (
  `product_ean_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `ean_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_product_tag`
--

CREATE TABLE `oc_af_product_tag` (
  `product_tag_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `tag_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_query`
--

CREATE TABLE `oc_af_query` (
  `query_id` int NOT NULL,
  `path` varchar(256) NOT NULL,
  `params` varchar(256) NOT NULL,
  `popularity` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_query_description`
--

CREATE TABLE `oc_af_query_description` (
  `query_id` int NOT NULL,
  `language_id` int NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `h1` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `meta_title` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `meta_description` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `meta_keyword` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_tag`
--

CREATE TABLE `oc_af_tag` (
  `tag_id` int NOT NULL,
  `language_id` int NOT NULL,
  `value` varchar(96) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_translit`
--

CREATE TABLE `oc_af_translit` (
  `type` varchar(64) NOT NULL,
  `group_id` int NOT NULL,
  `value` int NOT NULL,
  `language_id` int NOT NULL,
  `text` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_af_values`
--

CREATE TABLE `oc_af_values` (
  `af_value_id` int NOT NULL,
  `type` varchar(64) NOT NULL,
  `group_id` int NOT NULL,
  `value` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api`
--

CREATE TABLE `oc_api` (
  `api_id` int NOT NULL,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'Qu47BNCchaTbyQacRhXWowFbx16iZVmHkfErQUo5OybBbp2vpchdhdbwdk8lqjldP2RaSBIJXWBB8rw76Zp8nAgeXGxCgE27lnyhq290wlyRXKAJql0VB0rVElW3iFCLhd79FzQblySw6QLDxRjLoEpJisYaRFIyFrDeldYbpLZVdL7f7c4jNKxj3o75QziqA2qzfgvMwUQ0HtN2OopJO3Ea66qHIkrVOirqymJCkv2KQqaUoX7hXPddJcr7rYf6', 1, '2022-02-09 23:48:19', '2022-02-09 23:48:19');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_ip`
--

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int NOT NULL,
  `api_id` int NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_session`
--

CREATE TABLE `oc_api_session` (
  `api_session_id` int NOT NULL,
  `api_id` int NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_api_session`
--

INSERT INTO `oc_api_session` (`api_session_id`, `api_id`, `session_id`, `ip`, `date_added`, `date_modified`) VALUES
(9, 1, '160bba455fe4dfb43d515482e1', '127.0.0.1', '2022-02-21 15:21:44', '2022-02-21 15:21:47'),
(8, 1, '42461a8fb23c88ac3c909234e7', '127.0.0.1', '2022-02-21 15:21:41', '2022-02-21 15:21:44'),
(7, 1, '9dc2b0a9a24bab3cf09a9d1692', '127.0.0.1', '2022-02-21 15:21:38', '2022-02-21 15:21:41'),
(6, 1, '9d7f073f134c0fdcdb38d49d51', '127.0.0.1', '2022-02-21 15:21:35', '2022-02-21 15:21:38'),
(5, 1, 'e8352143d2058585af68e07ada', '127.0.0.1', '2022-02-21 15:21:20', '2022-02-21 15:21:35'),
(10, 1, 'c9b6560a78218d5d4130a45251', '127.0.0.1', '2022-02-21 15:21:47', '2022-02-21 15:21:51'),
(11, 1, 'd6edb56b53e3db238dc19b22db', '127.0.0.1', '2022-02-21 15:21:51', '2022-02-21 15:21:51');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article`
--

CREATE TABLE `oc_article` (
  `article_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_available` date NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `article_review` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int NOT NULL DEFAULT '0',
  `gstatus` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_article`
--

INSERT INTO `oc_article` (`article_id`, `image`, `date_available`, `sort_order`, `article_review`, `status`, `noindex`, `date_added`, `date_modified`, `viewed`, `gstatus`) VALUES
(120, 'catalog/Блог/blog-grid-home-1-img-1.png', '0000-00-00', 1, 1, 1, 1, '2014-04-08 04:26:00', '2022-02-20 18:41:47', 22, 0),
(127, 'catalog/Блог/blog-grid-home-1-img-3.png', '0000-00-00', 1, 0, 1, 1, '2022-02-20 18:42:28', '2022-02-20 18:42:34', 5, 0),
(126, 'catalog/Блог/blog-grid-home-1-img-2.png', '0000-00-00', 1, 0, 1, 1, '2022-02-20 18:09:29', '2022-02-20 20:03:45', 50, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_description`
--

CREATE TABLE `oc_article_description` (
  `article_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL,
  `tag` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_article_description`
--

INSERT INTO `oc_article_description` (`article_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `meta_title`, `meta_h1`, `tag`) VALUES
(120, 1, 'CMS для интернет магазинов ocStore v3.x', '&lt;p&gt;&lt;img style=&quot;width: 776px;&quot; src=&quot;http://monoled/image/catalog/Блог/blog-grid-home-1-img-1.png&quot;&gt;Рады представить Вашему вниманию ocStore v3.x основанную на OPENCART v3.x&lt;/p&gt;\r\n', 'CMS для интернет магазинов ocStore v3.x это бесплатный функциональный движок для создания качественных продающих магазинов.', 'cms, opencart, ocstore', 'CMS для интернет магазинов ocStore v3.x - Скачать', 'CMS для интернет магазинов ocStore v3.x', ''),
(120, 3, 'CMS для интернет магазинов ocStore v3.x', '', '', '', '', '', ''),
(120, 2, 'CMS for online stores ocStore v3.x', '&lt;p&gt;&lt;span class=&quot;long_text&quot; id=&quot;result_box&quot; lang=&quot;en&quot;&gt;&lt;span class=&quot;hps&quot;&gt;Are pleased to announce&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;ocStore v3.x&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;based on&lt;/span&gt; &lt;span class=&quot;hps&quot;&gt;OpenCart v2.x&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 'CMS for online stores ocStore v3.x is a free functional engine to create high-quality shops selling.', 'cms, opencart, ocstore', 'CMS for online stores ocStore v3.x - Download', 'CMS for online stores ocStore v3.x', ''),
(126, 1, 'Новая статья', '&lt;p&gt;Новая статья&lt;/p&gt;&lt;p&gt;&lt;img style=&quot;width: 50%;&quot; src=&quot;http://monoled/image/catalog/Блог/blog-grid-home-1-img-3.png&quot;&gt;&lt;br&gt;&lt;/p&gt;', 'Новая статья', 'Новая статья', 'Новая статья', 'Новая статья', ''),
(127, 1, 'Новая статья 3', '', '', '', '', '', ''),
(127, 3, 'Новая статья 3', '', '', '', '', '', ''),
(127, 2, 'Новая статья 3', '', '', '', '', '', ''),
(126, 3, 'Новая статья', '&lt;p&gt;Новая статья&lt;br&gt;&lt;/p&gt;', '', '', 'Новая статья', 'Новая статья', ''),
(126, 2, 'Новая статья', '&lt;p&gt;Новая статья&lt;br&gt;&lt;/p&gt;', '', '', '', 'Новая статья', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_image`
--

CREATE TABLE `oc_article_image` (
  `article_image_id` int NOT NULL,
  `article_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_related`
--

CREATE TABLE `oc_article_related` (
  `article_id` int NOT NULL,
  `related_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_related_mn`
--

CREATE TABLE `oc_article_related_mn` (
  `article_id` int NOT NULL,
  `manufacturer_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_article_related_mn`
--

INSERT INTO `oc_article_related_mn` (`article_id`, `manufacturer_id`) VALUES
(120, 8),
(120, 9),
(123, 8),
(124, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_related_product`
--

CREATE TABLE `oc_article_related_product` (
  `article_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_article_related_product`
--

INSERT INTO `oc_article_related_product` (`article_id`, `product_id`) VALUES
(30, 123),
(31, 123),
(43, 123),
(45, 123),
(120, 28),
(120, 30),
(120, 41);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_related_wb`
--

CREATE TABLE `oc_article_related_wb` (
  `article_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_article_related_wb`
--

INSERT INTO `oc_article_related_wb` (`article_id`, `category_id`) VALUES
(120, 26),
(123, 20),
(124, 18),
(125, 18),
(125, 27);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_to_blog_category`
--

CREATE TABLE `oc_article_to_blog_category` (
  `article_id` int NOT NULL,
  `blog_category_id` int NOT NULL,
  `main_blog_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_article_to_blog_category`
--

INSERT INTO `oc_article_to_blog_category` (`article_id`, `blog_category_id`, `main_blog_category`) VALUES
(127, 72, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_to_download`
--

CREATE TABLE `oc_article_to_download` (
  `article_id` int NOT NULL,
  `download_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_to_layout`
--

CREATE TABLE `oc_article_to_layout` (
  `article_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_article_to_layout`
--

INSERT INTO `oc_article_to_layout` (`article_id`, `store_id`, `layout_id`) VALUES
(120, 0, 0),
(127, 0, 0),
(126, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_to_store`
--

CREATE TABLE `oc_article_to_store` (
  `article_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_article_to_store`
--

INSERT INTO `oc_article_to_store` (`article_id`, `store_id`) VALUES
(120, 0),
(126, 0),
(127, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute`
--

CREATE TABLE `oc_attribute` (
  `attribute_id` int NOT NULL,
  `attribute_group_id` int NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_description`
--

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed'),
(3, 2, 'Clockspeed'),
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(1, 3, 'Description'),
(2, 3, 'No. of Cores'),
(4, 3, 'test 1'),
(5, 3, 'test 2'),
(6, 3, 'test 3'),
(7, 3, 'test 4'),
(8, 3, 'test 5'),
(9, 3, 'test 6'),
(10, 3, 'test 7'),
(11, 3, 'test 8'),
(3, 3, 'Clockspeed');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group`
--

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group_description`
--

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 2, 'Memory'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor'),
(4, 2, 'Technical'),
(3, 3, 'Memory'),
(4, 3, 'Technical'),
(5, 3, 'Motherboard'),
(6, 3, 'Processor');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner`
--

CREATE TABLE `oc_banner` (
  `banner_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Главный слайдер', 1),
(8, 'Manufacturers', 1),
(9, 'Наши преимущества', 1),
(10, 'Центральный баннер', 1),
(11, '4 баннера снизу', 1),
(12, 'Сетка баннеров Категорий', 1),
(13, 'Баннер в сайдбаре', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner_image`
--

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int NOT NULL,
  `banner_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `custom_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `custom_text`, `sort_order`) VALUES
(103, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', '', 0),
(113, 8, 1, 'Disney', '', 'catalog/demo/manufacturer/disney.png', '', 0),
(112, 8, 1, 'Dell', '', 'catalog/demo/manufacturer/dell.png', '', 0),
(111, 8, 1, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', '', 0),
(110, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/canon.png', '', 0),
(109, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', '', 0),
(108, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', '', 0),
(107, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/sony.png', '', 0),
(106, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', '', 0),
(105, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', '', 0),
(305, 7, 3, 'iPhone 6', '', 'catalog/Баннеры/sale-1200x400.jpg', '', 0),
(306, 7, 3, 'MacBookAir', '', 'catalog/Главное слайдшоу На главной/hero-slider-1.jpg', '', 0),
(104, 6, 2, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', '', 0),
(114, 8, 1, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', '', 0),
(115, 8, 1, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', '', 0),
(116, 8, 2, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', '', 0),
(117, 8, 2, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', '', 0),
(118, 8, 2, 'Sony', '', 'catalog/demo/manufacturer/sony.png', '', 0),
(119, 8, 2, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', '', 0),
(120, 8, 2, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', '', 0),
(121, 8, 2, 'Canon', '', 'catalog/demo/manufacturer/canon.png', '', 0),
(122, 8, 2, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', '', 0),
(123, 8, 2, 'Dell', '', 'catalog/demo/manufacturer/dell.png', '', 0),
(124, 8, 2, 'Disney', '', 'catalog/demo/manufacturer/disney.png', '', 0),
(125, 8, 2, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', '', 0),
(126, 8, 2, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', '', 0),
(303, 7, 1, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/Главное слайдшоу На главной/herro-slider (1).jpg', 'Luxy Brands Design Award ', 0),
(158, 9, 1, 'Лояльні клієнти', '', 'catalog/Слайдшоу/service-promo-4.png', 'Велика кількість лояльних та задоволених клієнтів ', 4),
(155, 9, 1, 'Доставка', '', 'catalog/Слайдшоу/service-promo-1.png', 'Отримайте 10% кешбеку, безкоштовну доставку, безкоштовне повернення та багато іншого', 1),
(156, 9, 1, ' Повернення коштів  ', '', 'catalog/Слайдшоу/service-promo-2.png', 'Гарантія 100% чи повернення грошей протягом 30 днів!', 2),
(157, 9, 1, 'Безпечна оплата', '', 'catalog/Слайдшоу/service-promo-3.png', 'Платіть за допомогою найпопулярніших та найбезпечніших способів оплати.', 3),
(168, 10, 2, 'Cучасні світлові рішення', '', 'catalog/monologo.png', 'Ми зробимо ваш будинок яскравішим', 1),
(167, 10, 1, 'Cучасні світлові рішення', '', 'catalog/banner-style-3-img-1.png', 'Ми зробимо ваш будинок яскравішим', 1),
(210, 11, 2, 'Світильники', '', 'catalog/Баннеры/banner-style-4-img-4.png', '', 1),
(209, 11, 2, 'Ландшафтне світло', '', 'catalog/Баннеры/banner-style-4-img-1111.png', '', 0),
(208, 11, 2, 'Технічне світло', '', 'catalog/Баннеры/banner-style-4-img-2.png', '', 0),
(207, 11, 2, 'Лінійні системи', '', 'catalog/Баннеры/banner-style-4-img-3.png', '', 0),
(206, 11, 1, 'Світильники', '', 'catalog/Баннеры/banner-style-4-img-4.png', '', 1),
(203, 11, 1, 'Лінійні системи', '', 'catalog/Баннеры/banner-style-4-img-1111.png', '', 0),
(204, 11, 1, 'Технічне світло', '', 'catalog/Баннеры/banner-style-4-img-2.png', '', 0),
(205, 11, 1, 'Ландшафтне світло', '', 'catalog/Баннеры/banner-style-4-img-3.png', '', 0),
(309, 7, 2, 'MacBookAir', '', 'catalog/Главное слайдшоу На главной/hero-slider-1.jpg', '', 0),
(236, 12, 1, 'Люстры', 'http://monoled/index.php?route=product/category&amp;path=20', 'catalog/Баннеры/banner-style-2-img-1.png', '', 1),
(235, 12, 1, 'Лампы', '', 'catalog/Баннеры/banner-style-2-img-2.png', '', 0),
(234, 12, 1, 'Светильники', '', 'catalog/Баннеры/banner-style-2-img-3.png', '', 0),
(233, 12, 1, 'Люстры', '', 'catalog/Баннеры/banner-style-2-img-4.png', '', 0),
(232, 12, 1, 'Лампы', '', 'catalog/Баннеры/banner-style-2-img-3.png', '', 0),
(231, 12, 1, 'Светильники', '', 'catalog/Баннеры/banner-style-2-img-2.png', '', 0),
(237, 12, 2, 'Светильники', '', 'catalog/Баннеры/banner-style-2-img-4.png', '', 0),
(238, 12, 2, 'Лампы', '', 'catalog/Баннеры/banner-style-2-img-3.png', '', 0),
(239, 12, 2, 'Люстры', '', 'catalog/Баннеры/banner-style-2-img-2.png', '', 0),
(240, 12, 2, 'Светильники', '', 'catalog/Баннеры/banner-style-2-img-4.png', '', 0),
(241, 12, 2, 'Лампы', '', 'catalog/Баннеры/banner-style-2-img-3.png', '', 0),
(242, 12, 2, 'Люстры', 'http://monoled/index.php?route=product/category&amp;path=20', 'catalog/Баннеры/banner-style-2-img-1.png', '', 1),
(277, 13, 2, 'Баннер', '', 'catalog/Баннеры/side-banner.png', '', 0),
(276, 13, 3, 'Баннер', '', 'catalog/Баннеры/side-banner.png', '', 0),
(245, 6, 3, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', '', 0),
(246, 8, 3, 'Disney', '', 'catalog/demo/manufacturer/disney.png', '', 0),
(247, 8, 3, 'Dell', '', 'catalog/demo/manufacturer/dell.png', '', 0),
(248, 8, 3, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', '', 0),
(249, 8, 3, 'Canon', '', 'catalog/demo/manufacturer/canon.png', '', 0),
(250, 8, 3, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', '', 0),
(251, 8, 3, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', '', 0),
(252, 8, 3, 'Sony', '', 'catalog/demo/manufacturer/sony.png', '', 0),
(253, 8, 3, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', '', 0),
(254, 8, 3, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', '', 0),
(308, 7, 2, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/Главное слайдшоу На главной/herro-slider (1).jpg', '', 0),
(256, 8, 3, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', '', 0),
(257, 8, 3, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', '', 0),
(307, 7, 3, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/Главное слайдшоу На главной/herro-slider (1).jpg', '', 0),
(259, 9, 3, 'Лояльні клієнти', '', 'catalog/Слайдшоу/service-promo-4.png', '', 4),
(260, 9, 3, 'Доставка', '', 'catalog/Слайдшоу/service-promo-1.png', '', 1),
(261, 9, 3, ' Повернення коштів  ', '', 'catalog/Слайдшоу/service-promo-2.png', '', 2),
(262, 9, 3, 'Безпечна оплата', '', 'catalog/Слайдшоу/service-promo-3.png', '', 3),
(263, 10, 3, 'Cучасні світлові рішення', '', 'catalog/banner-style-3-img-1.png', '', 1),
(264, 11, 3, 'Світильники', '', 'catalog/Баннеры/banner-style-4-img-4.png', '', 1),
(265, 11, 3, 'Лінійні системи', '', 'catalog/Баннеры/banner-style-4-img-1111.png', '', 0),
(266, 11, 3, 'Технічне світло', '', 'catalog/Баннеры/banner-style-4-img-2.png', '', 0),
(267, 11, 3, 'Ландшафтне світло', '', 'catalog/Баннеры/banner-style-4-img-3.png', '', 0),
(268, 12, 3, 'Люстры', 'http://monoled/index.php?route=product/category&amp;path=20', 'catalog/Баннеры/banner-style-2-img-1.png', '', 1),
(269, 12, 3, 'Лампы', '', 'catalog/Баннеры/banner-style-2-img-2.png', '', 0),
(270, 12, 3, 'Светильники', '', 'catalog/Баннеры/banner-style-2-img-3.png', '', 0),
(271, 12, 3, 'Люстры', '', 'catalog/Баннеры/banner-style-2-img-4.png', '', 0),
(272, 12, 3, 'Лампы', '', 'catalog/Баннеры/banner-style-2-img-3.png', '', 0),
(273, 12, 3, 'Светильники', '', 'catalog/Баннеры/banner-style-2-img-2.png', '', 0),
(275, 13, 1, 'Баннер', '', 'catalog/Баннеры/side-banner.png', '', 0),
(304, 7, 1, 'MacBookAir', '', 'catalog/Баннеры/sale-1200x400.jpg', 'Best Of NeoCon Gold Award ', 0),
(302, 7, 1, 'MacBook', '', 'catalog/Баннеры/hero-slider-1.jpg', 'Luxy Brands Design Award ', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_bf_attribute_value`
--

CREATE TABLE `oc_bf_attribute_value` (
  `attribute_value_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `language_id` int NOT NULL,
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_bf_attribute_value`
--

INSERT INTO `oc_bf_attribute_value` (`attribute_value_id`, `attribute_id`, `language_id`, `value`, `sort_order`) VALUES
(1, 2, 1, '1', 0),
(2, 2, 1, '4', 0),
(3, 2, 2, '', 0),
(4, 3, 1, '100mhz', 0),
(5, 3, 2, '', 0),
(6, 4, 1, '16GB', 0),
(7, 4, 1, '8gb', 0),
(8, 4, 2, '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_bf_filter`
--

CREATE TABLE `oc_bf_filter` (
  `product_id` int NOT NULL,
  `filter_group` varchar(10) NOT NULL,
  `filter_id` int NOT NULL,
  `language_id` int NOT NULL,
  `out_of_stock` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_bf_filter`
--

INSERT INTO `oc_bf_filter` (`product_id`, `filter_group`, `filter_id`, `language_id`, `out_of_stock`) VALUES
(43, 'a2', 1, 1, 0),
(47, 'a2', 2, 1, 0),
(52, 'a2', 2, 1, 0),
(42, 'a3', 4, 1, 0),
(50, 'a3', 4, 1, 0),
(47, 'a4', 6, 1, 0),
(52, 'a4', 6, 1, 0),
(43, 'a4', 7, 1, 0),
(42, 'o5', 41, 1, 0),
(42, 'o1', 31, 1, 0),
(42, 'o1', 43, 1, 0),
(42, 'o1', 32, 1, 0),
(42, 'o5', 39, 1, 0),
(42, 'o5', 42, 1, 0),
(42, 'o5', 40, 1, 0),
(42, 'o2', 23, 1, 0),
(42, 'o2', 44, 1, 0),
(42, 'o2', 24, 1, 0),
(42, 'o2', 45, 1, 0),
(35, 'o11', 46, 1, 1),
(35, 'o11', 47, 1, 0),
(35, 'o11', 48, 1, 0),
(50, 'o5', 39, 1, 0),
(50, 'o5', 40, 1, 0),
(50, 'o2', 45, 1, 0),
(50, 'o2', 44, 1, 0),
(50, 'o2', 24, 1, 0),
(50, 'o2', 23, 1, 0),
(50, 'o1', 43, 1, 0),
(50, 'o1', 31, 1, 0),
(50, 'o1', 32, 1, 0),
(50, 'o5', 41, 1, 0),
(50, 'o5', 42, 1, 0),
(28, 'm0', 5, 1, 0),
(29, 'm0', 6, 1, 0),
(30, 'm0', 9, 1, 0),
(31, 'm0', 0, 1, 0),
(32, 'm0', 8, 1, 0),
(33, 'm0', 0, 1, 0),
(34, 'm0', 8, 1, 0),
(35, 'm0', 0, 1, 0),
(36, 'm0', 8, 1, 0),
(40, 'm0', 8, 1, 0),
(41, 'm0', 8, 1, 0),
(42, 'm0', 8, 1, 0),
(43, 'm0', 8, 1, 0),
(44, 'm0', 8, 1, 0),
(45, 'm0', 8, 1, 0),
(46, 'm0', 10, 1, 0),
(47, 'm0', 7, 1, 0),
(48, 'm0', 8, 1, 0),
(49, 'm0', 0, 1, 1),
(50, 'm0', 8, 1, 0),
(51, 'm0', 9, 1, 0),
(52, 'm0', 7, 1, 0),
(53, 'm0', 5, 1, 0),
(50, 'r0', 5, 1, 0),
(28, 's0', 7, 1, 0),
(29, 's0', 7, 1, 0),
(30, 's0', 7, 1, 0),
(31, 's0', 7, 1, 0),
(32, 's0', 7, 1, 0),
(33, 's0', 7, 1, 0),
(34, 's0', 7, 1, 0),
(35, 's0', 7, 1, 0),
(36, 's0', 7, 1, 0),
(40, 's0', 7, 1, 0),
(41, 's0', 7, 1, 0),
(42, 's0', 7, 1, 0),
(43, 's0', 7, 1, 0),
(44, 's0', 7, 1, 0),
(45, 's0', 7, 1, 0),
(46, 's0', 7, 1, 0),
(47, 's0', 7, 1, 0),
(48, 's0', 7, 1, 0),
(49, 's0', 8, 1, 1),
(50, 's0', 7, 1, 0),
(51, 's0', 7, 1, 0),
(52, 's0', 7, 1, 0),
(53, 's0', 7, 1, 0),
(28, 'c0', 20, 1, 0),
(28, 'c0', 24, 1, 0),
(29, 'c0', 20, 1, 0),
(29, 'c0', 24, 1, 0),
(30, 'c0', 20, 1, 0),
(30, 'c0', 33, 1, 0),
(31, 'c0', 33, 1, 0),
(33, 'c0', 20, 1, 0),
(33, 'c0', 25, 1, 0),
(33, 'c0', 28, 1, 0),
(35, 'c0', 20, 1, 0),
(40, 'c0', 20, 1, 0),
(40, 'c0', 24, 1, 0),
(41, 'c0', 20, 1, 0),
(41, 'c0', 27, 1, 0),
(42, 'c0', 20, 1, 0),
(42, 'c0', 25, 1, 0),
(42, 'c0', 28, 1, 0),
(43, 'c0', 18, 1, 0),
(43, 'c0', 20, 1, 0),
(43, 'c0', 46, 1, 0),
(44, 'c0', 18, 1, 0),
(44, 'c0', 20, 1, 0),
(44, 'c0', 46, 1, 0),
(45, 'c0', 18, 1, 0),
(45, 'c0', 46, 1, 0),
(46, 'c0', 18, 1, 0),
(46, 'c0', 20, 1, 0),
(46, 'c0', 45, 1, 0),
(47, 'c0', 18, 1, 0),
(47, 'c0', 20, 1, 0),
(47, 'c0', 45, 1, 0),
(48, 'c0', 20, 1, 0),
(49, 'c0', 57, 1, 1),
(50, 'c0', 20, 1, 0),
(50, 'c0', 25, 1, 0),
(50, 'c0', 28, 1, 0),
(51, 'c0', 20, 1, 0),
(51, 'c0', 33, 1, 0),
(52, 'c0', 18, 1, 0),
(52, 'c0', 20, 1, 0),
(52, 'c0', 45, 1, 0),
(53, 'c0', 20, 1, 0),
(53, 'c0', 24, 1, 0),
(47, 'a2', 3, 2, 0),
(52, 'a2', 3, 2, 0),
(50, 'a3', 5, 2, 0),
(47, 'a4', 8, 2, 0),
(52, 'a4', 8, 2, 0),
(28, 'm0', 5, 2, 0),
(29, 'm0', 6, 2, 0),
(30, 'm0', 9, 2, 0),
(31, 'm0', 0, 2, 0),
(32, 'm0', 8, 2, 0),
(33, 'm0', 0, 2, 0),
(34, 'm0', 8, 2, 0),
(35, 'm0', 0, 2, 0),
(36, 'm0', 8, 2, 0),
(40, 'm0', 8, 2, 0),
(41, 'm0', 8, 2, 0),
(42, 'm0', 8, 2, 0),
(43, 'm0', 8, 2, 0),
(44, 'm0', 8, 2, 0),
(45, 'm0', 8, 2, 0),
(46, 'm0', 10, 2, 0),
(47, 'm0', 7, 2, 0),
(48, 'm0', 8, 2, 0),
(49, 'm0', 0, 2, 1),
(50, 'm0', 8, 2, 0),
(51, 'm0', 9, 2, 0),
(52, 'm0', 7, 2, 0),
(53, 'm0', 5, 2, 0),
(50, 'r0', 5, 2, 0),
(28, 's0', 7, 2, 0),
(29, 's0', 7, 2, 0),
(30, 's0', 7, 2, 0),
(31, 's0', 7, 2, 0),
(32, 's0', 7, 2, 0),
(33, 's0', 7, 2, 0),
(34, 's0', 7, 2, 0),
(35, 's0', 7, 2, 0),
(36, 's0', 7, 2, 0),
(40, 's0', 7, 2, 0),
(41, 's0', 7, 2, 0),
(42, 's0', 7, 2, 0),
(43, 's0', 7, 2, 0),
(44, 's0', 7, 2, 0),
(45, 's0', 7, 2, 0),
(46, 's0', 7, 2, 0),
(47, 's0', 7, 2, 0),
(48, 's0', 7, 2, 0),
(49, 's0', 8, 2, 1),
(50, 's0', 7, 2, 0),
(51, 's0', 7, 2, 0),
(52, 's0', 7, 2, 0),
(53, 's0', 7, 2, 0),
(28, 'c0', 20, 2, 0),
(28, 'c0', 24, 2, 0),
(29, 'c0', 20, 2, 0),
(29, 'c0', 24, 2, 0),
(30, 'c0', 20, 2, 0),
(30, 'c0', 33, 2, 0),
(31, 'c0', 33, 2, 0),
(33, 'c0', 20, 2, 0),
(33, 'c0', 25, 2, 0),
(33, 'c0', 28, 2, 0),
(35, 'c0', 20, 2, 0),
(40, 'c0', 20, 2, 0),
(40, 'c0', 24, 2, 0),
(41, 'c0', 20, 2, 0),
(41, 'c0', 27, 2, 0),
(42, 'c0', 20, 2, 0),
(42, 'c0', 25, 2, 0),
(42, 'c0', 28, 2, 0),
(43, 'c0', 18, 2, 0),
(43, 'c0', 20, 2, 0),
(43, 'c0', 46, 2, 0),
(44, 'c0', 18, 2, 0),
(44, 'c0', 20, 2, 0),
(44, 'c0', 46, 2, 0),
(45, 'c0', 18, 2, 0),
(45, 'c0', 46, 2, 0),
(46, 'c0', 18, 2, 0),
(46, 'c0', 20, 2, 0),
(46, 'c0', 45, 2, 0),
(47, 'c0', 18, 2, 0),
(47, 'c0', 20, 2, 0),
(47, 'c0', 45, 2, 0),
(48, 'c0', 20, 2, 0),
(49, 'c0', 57, 2, 1),
(50, 'c0', 20, 2, 0),
(50, 'c0', 25, 2, 0),
(50, 'c0', 28, 2, 0),
(51, 'c0', 20, 2, 0),
(51, 'c0', 33, 2, 0),
(52, 'c0', 18, 2, 0),
(52, 'c0', 20, 2, 0),
(52, 'c0', 45, 2, 0),
(53, 'c0', 20, 2, 0),
(53, 'c0', 24, 2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_bf_product_attribute_value`
--

CREATE TABLE `oc_bf_product_attribute_value` (
  `product_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `attribute_value_id` int NOT NULL,
  `language_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_bf_product_attribute_value`
--

INSERT INTO `oc_bf_product_attribute_value` (`product_id`, `attribute_id`, `attribute_value_id`, `language_id`) VALUES
(43, 2, 1, 1),
(47, 2, 2, 1),
(52, 2, 2, 1),
(47, 2, 3, 2),
(52, 2, 3, 2),
(42, 3, 4, 1),
(50, 3, 4, 1),
(50, 3, 5, 2),
(47, 4, 6, 1),
(52, 4, 6, 1),
(43, 4, 7, 1),
(47, 4, 8, 2),
(52, 4, 8, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_bf_tax_rate`
--

CREATE TABLE `oc_bf_tax_rate` (
  `id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  `country_id` int NOT NULL,
  `zone_id` int NOT NULL,
  `tax_class_id` int NOT NULL,
  `based` varchar(10) NOT NULL,
  `percent_rate` decimal(15,4) NOT NULL,
  `fixed_rate` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_bf_tax_rate`
--

INSERT INTO `oc_bf_tax_rate` (`id`, `customer_group_id`, `country_id`, `zone_id`, `tax_class_id`, `based`, `percent_rate`, `fixed_rate`) VALUES
(1, 1, 222, 3972, 10, 'payment', '20.0000', '0.0000'),
(2, 1, 222, 3955, 10, 'payment', '20.0000', '0.0000'),
(3, 1, 222, 3954, 10, 'payment', '20.0000', '0.0000'),
(4, 1, 222, 3953, 10, 'payment', '20.0000', '0.0000'),
(5, 1, 222, 3952, 10, 'payment', '20.0000', '0.0000'),
(6, 1, 222, 3951, 10, 'payment', '20.0000', '0.0000'),
(7, 1, 222, 3950, 10, 'payment', '20.0000', '0.0000'),
(8, 1, 222, 3949, 10, 'payment', '20.0000', '0.0000'),
(9, 1, 222, 3612, 10, 'payment', '20.0000', '0.0000'),
(10, 1, 222, 3611, 10, 'payment', '20.0000', '0.0000'),
(11, 1, 222, 3610, 10, 'payment', '20.0000', '0.0000'),
(12, 1, 222, 3609, 10, 'payment', '20.0000', '0.0000'),
(13, 1, 222, 3608, 10, 'payment', '20.0000', '0.0000'),
(14, 1, 222, 3607, 10, 'payment', '20.0000', '0.0000'),
(15, 1, 222, 3606, 10, 'payment', '20.0000', '0.0000'),
(16, 1, 222, 3605, 10, 'payment', '20.0000', '0.0000'),
(17, 1, 222, 3604, 10, 'payment', '20.0000', '0.0000'),
(18, 1, 222, 3603, 10, 'payment', '20.0000', '0.0000'),
(19, 1, 222, 3602, 10, 'payment', '20.0000', '0.0000'),
(20, 1, 222, 3601, 10, 'payment', '20.0000', '0.0000'),
(21, 1, 222, 3600, 10, 'payment', '20.0000', '0.0000'),
(22, 1, 222, 3599, 10, 'payment', '20.0000', '0.0000'),
(23, 1, 222, 3598, 10, 'payment', '20.0000', '0.0000'),
(24, 1, 222, 3597, 10, 'payment', '20.0000', '0.0000'),
(25, 1, 222, 3596, 10, 'payment', '20.0000', '0.0000'),
(26, 1, 222, 3595, 10, 'payment', '20.0000', '0.0000'),
(27, 1, 222, 3594, 10, 'payment', '20.0000', '0.0000'),
(28, 1, 222, 3593, 10, 'payment', '20.0000', '0.0000'),
(29, 1, 222, 3592, 10, 'payment', '20.0000', '0.0000'),
(30, 1, 222, 3591, 10, 'payment', '20.0000', '0.0000'),
(31, 1, 222, 3590, 10, 'payment', '20.0000', '0.0000'),
(32, 1, 222, 3589, 10, 'payment', '20.0000', '0.0000'),
(33, 1, 222, 3588, 10, 'payment', '20.0000', '0.0000'),
(34, 1, 222, 3587, 10, 'payment', '20.0000', '0.0000'),
(35, 1, 222, 3586, 10, 'payment', '20.0000', '0.0000'),
(36, 1, 222, 3585, 10, 'payment', '20.0000', '0.0000'),
(37, 1, 222, 3584, 10, 'payment', '20.0000', '0.0000'),
(38, 1, 222, 3583, 10, 'payment', '20.0000', '0.0000'),
(39, 1, 222, 3582, 10, 'payment', '20.0000', '0.0000'),
(40, 1, 222, 3581, 10, 'payment', '20.0000', '0.0000'),
(41, 1, 222, 3580, 10, 'payment', '20.0000', '0.0000'),
(42, 1, 222, 3579, 10, 'payment', '20.0000', '0.0000'),
(43, 1, 222, 3578, 10, 'payment', '20.0000', '0.0000'),
(44, 1, 222, 3577, 10, 'payment', '20.0000', '0.0000'),
(45, 1, 222, 3576, 10, 'payment', '20.0000', '0.0000'),
(46, 1, 222, 3575, 10, 'payment', '20.0000', '0.0000'),
(47, 1, 222, 3574, 10, 'payment', '20.0000', '0.0000'),
(48, 1, 222, 3573, 10, 'payment', '20.0000', '0.0000'),
(49, 1, 222, 3572, 10, 'payment', '20.0000', '0.0000'),
(50, 1, 222, 3571, 10, 'payment', '20.0000', '0.0000'),
(51, 1, 222, 3570, 10, 'payment', '20.0000', '0.0000'),
(52, 1, 222, 3569, 10, 'payment', '20.0000', '0.0000'),
(53, 1, 222, 3568, 10, 'payment', '20.0000', '0.0000'),
(54, 1, 222, 3567, 10, 'payment', '20.0000', '0.0000'),
(55, 1, 222, 3566, 10, 'payment', '20.0000', '0.0000'),
(56, 1, 222, 3565, 10, 'payment', '20.0000', '0.0000'),
(57, 1, 222, 3564, 10, 'payment', '20.0000', '0.0000'),
(58, 1, 222, 3563, 10, 'payment', '20.0000', '0.0000'),
(59, 1, 222, 3562, 10, 'payment', '20.0000', '0.0000'),
(60, 1, 222, 3561, 10, 'payment', '20.0000', '0.0000'),
(61, 1, 222, 3560, 10, 'payment', '20.0000', '0.0000'),
(62, 1, 222, 3559, 10, 'payment', '20.0000', '0.0000'),
(63, 1, 222, 3558, 10, 'payment', '20.0000', '0.0000'),
(64, 1, 222, 3557, 10, 'payment', '20.0000', '0.0000'),
(65, 1, 222, 3556, 10, 'payment', '20.0000', '0.0000'),
(66, 1, 222, 3555, 10, 'payment', '20.0000', '0.0000'),
(67, 1, 222, 3554, 10, 'payment', '20.0000', '0.0000'),
(68, 1, 222, 3553, 10, 'payment', '20.0000', '0.0000'),
(69, 1, 222, 3552, 10, 'payment', '20.0000', '0.0000'),
(70, 1, 222, 3551, 10, 'payment', '20.0000', '0.0000'),
(71, 1, 222, 3550, 10, 'payment', '20.0000', '0.0000'),
(72, 1, 222, 3549, 10, 'payment', '20.0000', '0.0000'),
(73, 1, 222, 3548, 10, 'payment', '20.0000', '0.0000'),
(74, 1, 222, 3547, 10, 'payment', '20.0000', '0.0000'),
(75, 1, 222, 3546, 10, 'payment', '20.0000', '0.0000'),
(76, 1, 222, 3545, 10, 'payment', '20.0000', '0.0000'),
(77, 1, 222, 3544, 10, 'payment', '20.0000', '0.0000'),
(78, 1, 222, 3543, 10, 'payment', '20.0000', '0.0000'),
(79, 1, 222, 3542, 10, 'payment', '20.0000', '0.0000'),
(80, 1, 222, 3541, 10, 'payment', '20.0000', '0.0000'),
(81, 1, 222, 3540, 10, 'payment', '20.0000', '0.0000'),
(82, 1, 222, 3539, 10, 'payment', '20.0000', '0.0000'),
(83, 1, 222, 3538, 10, 'payment', '20.0000', '0.0000'),
(84, 1, 222, 3537, 10, 'payment', '20.0000', '0.0000'),
(85, 1, 222, 3536, 10, 'payment', '20.0000', '0.0000'),
(86, 1, 222, 3535, 10, 'payment', '20.0000', '0.0000'),
(87, 1, 222, 3534, 10, 'payment', '20.0000', '0.0000'),
(88, 1, 222, 3533, 10, 'payment', '20.0000', '0.0000'),
(89, 1, 222, 3532, 10, 'payment', '20.0000', '0.0000'),
(90, 1, 222, 3531, 10, 'payment', '20.0000', '0.0000'),
(91, 1, 222, 3530, 10, 'payment', '20.0000', '0.0000'),
(92, 1, 222, 3529, 10, 'payment', '20.0000', '0.0000'),
(93, 1, 222, 3528, 10, 'payment', '20.0000', '0.0000'),
(94, 1, 222, 3527, 10, 'payment', '20.0000', '0.0000'),
(95, 1, 222, 3526, 10, 'payment', '20.0000', '0.0000'),
(96, 1, 222, 3525, 10, 'payment', '20.0000', '0.0000'),
(97, 1, 222, 3524, 10, 'payment', '20.0000', '0.0000'),
(98, 1, 222, 3523, 10, 'payment', '20.0000', '0.0000'),
(99, 1, 222, 3522, 10, 'payment', '20.0000', '0.0000'),
(100, 1, 222, 3521, 10, 'payment', '20.0000', '0.0000'),
(101, 1, 222, 3520, 10, 'payment', '20.0000', '0.0000'),
(102, 1, 222, 3519, 10, 'payment', '20.0000', '0.0000'),
(103, 1, 222, 3518, 10, 'payment', '20.0000', '0.0000'),
(104, 1, 222, 3517, 10, 'payment', '20.0000', '0.0000'),
(105, 1, 222, 3516, 10, 'payment', '20.0000', '0.0000'),
(106, 1, 222, 3515, 10, 'payment', '20.0000', '0.0000'),
(107, 1, 222, 3514, 10, 'payment', '20.0000', '0.0000'),
(108, 1, 222, 3513, 10, 'payment', '20.0000', '0.0000'),
(109, 1, 222, 3972, 10, 'store', '0.0000', '2.0000'),
(110, 1, 222, 3955, 10, 'store', '0.0000', '2.0000'),
(111, 1, 222, 3954, 10, 'store', '0.0000', '2.0000'),
(112, 1, 222, 3953, 10, 'store', '0.0000', '2.0000'),
(113, 1, 222, 3952, 10, 'store', '0.0000', '2.0000'),
(114, 1, 222, 3951, 10, 'store', '0.0000', '2.0000'),
(115, 1, 222, 3950, 10, 'store', '0.0000', '2.0000'),
(116, 1, 222, 3949, 10, 'store', '0.0000', '2.0000'),
(117, 1, 222, 3612, 10, 'store', '0.0000', '2.0000'),
(118, 1, 222, 3611, 10, 'store', '0.0000', '2.0000'),
(119, 1, 222, 3610, 10, 'store', '0.0000', '2.0000'),
(120, 1, 222, 3609, 10, 'store', '0.0000', '2.0000'),
(121, 1, 222, 3608, 10, 'store', '0.0000', '2.0000'),
(122, 1, 222, 3607, 10, 'store', '0.0000', '2.0000'),
(123, 1, 222, 3606, 10, 'store', '0.0000', '2.0000'),
(124, 1, 222, 3605, 10, 'store', '0.0000', '2.0000'),
(125, 1, 222, 3604, 10, 'store', '0.0000', '2.0000'),
(126, 1, 222, 3603, 10, 'store', '0.0000', '2.0000'),
(127, 1, 222, 3602, 10, 'store', '0.0000', '2.0000'),
(128, 1, 222, 3601, 10, 'store', '0.0000', '2.0000'),
(129, 1, 222, 3600, 10, 'store', '0.0000', '2.0000'),
(130, 1, 222, 3599, 10, 'store', '0.0000', '2.0000'),
(131, 1, 222, 3598, 10, 'store', '0.0000', '2.0000'),
(132, 1, 222, 3597, 10, 'store', '0.0000', '2.0000'),
(133, 1, 222, 3596, 10, 'store', '0.0000', '2.0000'),
(134, 1, 222, 3595, 10, 'store', '0.0000', '2.0000'),
(135, 1, 222, 3594, 10, 'store', '0.0000', '2.0000'),
(136, 1, 222, 3593, 10, 'store', '0.0000', '2.0000'),
(137, 1, 222, 3592, 10, 'store', '0.0000', '2.0000'),
(138, 1, 222, 3591, 10, 'store', '0.0000', '2.0000'),
(139, 1, 222, 3590, 10, 'store', '0.0000', '2.0000'),
(140, 1, 222, 3589, 10, 'store', '0.0000', '2.0000'),
(141, 1, 222, 3588, 10, 'store', '0.0000', '2.0000'),
(142, 1, 222, 3587, 10, 'store', '0.0000', '2.0000'),
(143, 1, 222, 3586, 10, 'store', '0.0000', '2.0000'),
(144, 1, 222, 3585, 10, 'store', '0.0000', '2.0000'),
(145, 1, 222, 3584, 10, 'store', '0.0000', '2.0000'),
(146, 1, 222, 3583, 10, 'store', '0.0000', '2.0000'),
(147, 1, 222, 3582, 10, 'store', '0.0000', '2.0000'),
(148, 1, 222, 3581, 10, 'store', '0.0000', '2.0000'),
(149, 1, 222, 3580, 10, 'store', '0.0000', '2.0000'),
(150, 1, 222, 3579, 10, 'store', '0.0000', '2.0000'),
(151, 1, 222, 3578, 10, 'store', '0.0000', '2.0000'),
(152, 1, 222, 3577, 10, 'store', '0.0000', '2.0000'),
(153, 1, 222, 3576, 10, 'store', '0.0000', '2.0000'),
(154, 1, 222, 3575, 10, 'store', '0.0000', '2.0000'),
(155, 1, 222, 3574, 10, 'store', '0.0000', '2.0000'),
(156, 1, 222, 3573, 10, 'store', '0.0000', '2.0000'),
(157, 1, 222, 3572, 10, 'store', '0.0000', '2.0000'),
(158, 1, 222, 3571, 10, 'store', '0.0000', '2.0000'),
(159, 1, 222, 3570, 10, 'store', '0.0000', '2.0000'),
(160, 1, 222, 3569, 10, 'store', '0.0000', '2.0000'),
(161, 1, 222, 3568, 10, 'store', '0.0000', '2.0000'),
(162, 1, 222, 3567, 10, 'store', '0.0000', '2.0000'),
(163, 1, 222, 3566, 10, 'store', '0.0000', '2.0000'),
(164, 1, 222, 3565, 10, 'store', '0.0000', '2.0000'),
(165, 1, 222, 3564, 10, 'store', '0.0000', '2.0000'),
(166, 1, 222, 3563, 10, 'store', '0.0000', '2.0000'),
(167, 1, 222, 3562, 10, 'store', '0.0000', '2.0000'),
(168, 1, 222, 3561, 10, 'store', '0.0000', '2.0000'),
(169, 1, 222, 3560, 10, 'store', '0.0000', '2.0000'),
(170, 1, 222, 3559, 10, 'store', '0.0000', '2.0000'),
(171, 1, 222, 3558, 10, 'store', '0.0000', '2.0000'),
(172, 1, 222, 3557, 10, 'store', '0.0000', '2.0000'),
(173, 1, 222, 3556, 10, 'store', '0.0000', '2.0000'),
(174, 1, 222, 3555, 10, 'store', '0.0000', '2.0000'),
(175, 1, 222, 3554, 10, 'store', '0.0000', '2.0000'),
(176, 1, 222, 3553, 10, 'store', '0.0000', '2.0000'),
(177, 1, 222, 3552, 10, 'store', '0.0000', '2.0000'),
(178, 1, 222, 3551, 10, 'store', '0.0000', '2.0000'),
(179, 1, 222, 3550, 10, 'store', '0.0000', '2.0000'),
(180, 1, 222, 3549, 10, 'store', '0.0000', '2.0000'),
(181, 1, 222, 3548, 10, 'store', '0.0000', '2.0000'),
(182, 1, 222, 3547, 10, 'store', '0.0000', '2.0000'),
(183, 1, 222, 3546, 10, 'store', '0.0000', '2.0000'),
(184, 1, 222, 3545, 10, 'store', '0.0000', '2.0000'),
(185, 1, 222, 3544, 10, 'store', '0.0000', '2.0000'),
(186, 1, 222, 3543, 10, 'store', '0.0000', '2.0000'),
(187, 1, 222, 3542, 10, 'store', '0.0000', '2.0000'),
(188, 1, 222, 3541, 10, 'store', '0.0000', '2.0000'),
(189, 1, 222, 3540, 10, 'store', '0.0000', '2.0000'),
(190, 1, 222, 3539, 10, 'store', '0.0000', '2.0000'),
(191, 1, 222, 3538, 10, 'store', '0.0000', '2.0000'),
(192, 1, 222, 3537, 10, 'store', '0.0000', '2.0000'),
(193, 1, 222, 3536, 10, 'store', '0.0000', '2.0000'),
(194, 1, 222, 3535, 10, 'store', '0.0000', '2.0000'),
(195, 1, 222, 3534, 10, 'store', '0.0000', '2.0000'),
(196, 1, 222, 3533, 10, 'store', '0.0000', '2.0000'),
(197, 1, 222, 3532, 10, 'store', '0.0000', '2.0000'),
(198, 1, 222, 3531, 10, 'store', '0.0000', '2.0000'),
(199, 1, 222, 3530, 10, 'store', '0.0000', '2.0000'),
(200, 1, 222, 3529, 10, 'store', '0.0000', '2.0000'),
(201, 1, 222, 3528, 10, 'store', '0.0000', '2.0000'),
(202, 1, 222, 3527, 10, 'store', '0.0000', '2.0000'),
(203, 1, 222, 3526, 10, 'store', '0.0000', '2.0000'),
(204, 1, 222, 3525, 10, 'store', '0.0000', '2.0000'),
(205, 1, 222, 3524, 10, 'store', '0.0000', '2.0000'),
(206, 1, 222, 3523, 10, 'store', '0.0000', '2.0000'),
(207, 1, 222, 3522, 10, 'store', '0.0000', '2.0000'),
(208, 1, 222, 3521, 10, 'store', '0.0000', '2.0000'),
(209, 1, 222, 3520, 10, 'store', '0.0000', '2.0000'),
(210, 1, 222, 3519, 10, 'store', '0.0000', '2.0000'),
(211, 1, 222, 3518, 10, 'store', '0.0000', '2.0000'),
(212, 1, 222, 3517, 10, 'store', '0.0000', '2.0000'),
(213, 1, 222, 3516, 10, 'store', '0.0000', '2.0000'),
(214, 1, 222, 3515, 10, 'store', '0.0000', '2.0000'),
(215, 1, 222, 3514, 10, 'store', '0.0000', '2.0000'),
(216, 1, 222, 3513, 10, 'store', '0.0000', '2.0000'),
(217, 1, 222, 3972, 9, 'shipping', '20.0000', '2.0000'),
(218, 1, 222, 3955, 9, 'shipping', '20.0000', '2.0000'),
(219, 1, 222, 3954, 9, 'shipping', '20.0000', '2.0000'),
(220, 1, 222, 3953, 9, 'shipping', '20.0000', '2.0000'),
(221, 1, 222, 3952, 9, 'shipping', '20.0000', '2.0000'),
(222, 1, 222, 3951, 9, 'shipping', '20.0000', '2.0000'),
(223, 1, 222, 3950, 9, 'shipping', '20.0000', '2.0000'),
(224, 1, 222, 3949, 9, 'shipping', '20.0000', '2.0000'),
(225, 1, 222, 3612, 9, 'shipping', '20.0000', '2.0000'),
(226, 1, 222, 3611, 9, 'shipping', '20.0000', '2.0000'),
(227, 1, 222, 3610, 9, 'shipping', '20.0000', '2.0000'),
(228, 1, 222, 3609, 9, 'shipping', '20.0000', '2.0000'),
(229, 1, 222, 3608, 9, 'shipping', '20.0000', '2.0000'),
(230, 1, 222, 3607, 9, 'shipping', '20.0000', '2.0000'),
(231, 1, 222, 3606, 9, 'shipping', '20.0000', '2.0000'),
(232, 1, 222, 3605, 9, 'shipping', '20.0000', '2.0000'),
(233, 1, 222, 3604, 9, 'shipping', '20.0000', '2.0000'),
(234, 1, 222, 3603, 9, 'shipping', '20.0000', '2.0000'),
(235, 1, 222, 3602, 9, 'shipping', '20.0000', '2.0000'),
(236, 1, 222, 3601, 9, 'shipping', '20.0000', '2.0000'),
(237, 1, 222, 3600, 9, 'shipping', '20.0000', '2.0000'),
(238, 1, 222, 3599, 9, 'shipping', '20.0000', '2.0000'),
(239, 1, 222, 3598, 9, 'shipping', '20.0000', '2.0000'),
(240, 1, 222, 3597, 9, 'shipping', '20.0000', '2.0000'),
(241, 1, 222, 3596, 9, 'shipping', '20.0000', '2.0000'),
(242, 1, 222, 3595, 9, 'shipping', '20.0000', '2.0000'),
(243, 1, 222, 3594, 9, 'shipping', '20.0000', '2.0000'),
(244, 1, 222, 3593, 9, 'shipping', '20.0000', '2.0000'),
(245, 1, 222, 3592, 9, 'shipping', '20.0000', '2.0000'),
(246, 1, 222, 3591, 9, 'shipping', '20.0000', '2.0000'),
(247, 1, 222, 3590, 9, 'shipping', '20.0000', '2.0000'),
(248, 1, 222, 3589, 9, 'shipping', '20.0000', '2.0000'),
(249, 1, 222, 3588, 9, 'shipping', '20.0000', '2.0000'),
(250, 1, 222, 3587, 9, 'shipping', '20.0000', '2.0000'),
(251, 1, 222, 3586, 9, 'shipping', '20.0000', '2.0000'),
(252, 1, 222, 3585, 9, 'shipping', '20.0000', '2.0000'),
(253, 1, 222, 3584, 9, 'shipping', '20.0000', '2.0000'),
(254, 1, 222, 3583, 9, 'shipping', '20.0000', '2.0000'),
(255, 1, 222, 3582, 9, 'shipping', '20.0000', '2.0000'),
(256, 1, 222, 3581, 9, 'shipping', '20.0000', '2.0000'),
(257, 1, 222, 3580, 9, 'shipping', '20.0000', '2.0000'),
(258, 1, 222, 3579, 9, 'shipping', '20.0000', '2.0000'),
(259, 1, 222, 3578, 9, 'shipping', '20.0000', '2.0000'),
(260, 1, 222, 3577, 9, 'shipping', '20.0000', '2.0000'),
(261, 1, 222, 3576, 9, 'shipping', '20.0000', '2.0000'),
(262, 1, 222, 3575, 9, 'shipping', '20.0000', '2.0000'),
(263, 1, 222, 3574, 9, 'shipping', '20.0000', '2.0000'),
(264, 1, 222, 3573, 9, 'shipping', '20.0000', '2.0000'),
(265, 1, 222, 3572, 9, 'shipping', '20.0000', '2.0000'),
(266, 1, 222, 3571, 9, 'shipping', '20.0000', '2.0000'),
(267, 1, 222, 3570, 9, 'shipping', '20.0000', '2.0000'),
(268, 1, 222, 3569, 9, 'shipping', '20.0000', '2.0000'),
(269, 1, 222, 3568, 9, 'shipping', '20.0000', '2.0000'),
(270, 1, 222, 3567, 9, 'shipping', '20.0000', '2.0000'),
(271, 1, 222, 3566, 9, 'shipping', '20.0000', '2.0000'),
(272, 1, 222, 3565, 9, 'shipping', '20.0000', '2.0000'),
(273, 1, 222, 3564, 9, 'shipping', '20.0000', '2.0000'),
(274, 1, 222, 3563, 9, 'shipping', '20.0000', '2.0000'),
(275, 1, 222, 3562, 9, 'shipping', '20.0000', '2.0000'),
(276, 1, 222, 3561, 9, 'shipping', '20.0000', '2.0000'),
(277, 1, 222, 3560, 9, 'shipping', '20.0000', '2.0000'),
(278, 1, 222, 3559, 9, 'shipping', '20.0000', '2.0000'),
(279, 1, 222, 3558, 9, 'shipping', '20.0000', '2.0000'),
(280, 1, 222, 3557, 9, 'shipping', '20.0000', '2.0000'),
(281, 1, 222, 3556, 9, 'shipping', '20.0000', '2.0000'),
(282, 1, 222, 3555, 9, 'shipping', '20.0000', '2.0000'),
(283, 1, 222, 3554, 9, 'shipping', '20.0000', '2.0000'),
(284, 1, 222, 3553, 9, 'shipping', '20.0000', '2.0000'),
(285, 1, 222, 3552, 9, 'shipping', '20.0000', '2.0000'),
(286, 1, 222, 3551, 9, 'shipping', '20.0000', '2.0000'),
(287, 1, 222, 3550, 9, 'shipping', '20.0000', '2.0000'),
(288, 1, 222, 3549, 9, 'shipping', '20.0000', '2.0000'),
(289, 1, 222, 3548, 9, 'shipping', '20.0000', '2.0000'),
(290, 1, 222, 3547, 9, 'shipping', '20.0000', '2.0000'),
(291, 1, 222, 3546, 9, 'shipping', '20.0000', '2.0000'),
(292, 1, 222, 3545, 9, 'shipping', '20.0000', '2.0000'),
(293, 1, 222, 3544, 9, 'shipping', '20.0000', '2.0000'),
(294, 1, 222, 3543, 9, 'shipping', '20.0000', '2.0000'),
(295, 1, 222, 3542, 9, 'shipping', '20.0000', '2.0000'),
(296, 1, 222, 3541, 9, 'shipping', '20.0000', '2.0000'),
(297, 1, 222, 3540, 9, 'shipping', '20.0000', '2.0000'),
(298, 1, 222, 3539, 9, 'shipping', '20.0000', '2.0000'),
(299, 1, 222, 3538, 9, 'shipping', '20.0000', '2.0000'),
(300, 1, 222, 3537, 9, 'shipping', '20.0000', '2.0000'),
(301, 1, 222, 3536, 9, 'shipping', '20.0000', '2.0000'),
(302, 1, 222, 3535, 9, 'shipping', '20.0000', '2.0000'),
(303, 1, 222, 3534, 9, 'shipping', '20.0000', '2.0000'),
(304, 1, 222, 3533, 9, 'shipping', '20.0000', '2.0000'),
(305, 1, 222, 3532, 9, 'shipping', '20.0000', '2.0000'),
(306, 1, 222, 3531, 9, 'shipping', '20.0000', '2.0000'),
(307, 1, 222, 3530, 9, 'shipping', '20.0000', '2.0000'),
(308, 1, 222, 3529, 9, 'shipping', '20.0000', '2.0000'),
(309, 1, 222, 3528, 9, 'shipping', '20.0000', '2.0000'),
(310, 1, 222, 3527, 9, 'shipping', '20.0000', '2.0000'),
(311, 1, 222, 3526, 9, 'shipping', '20.0000', '2.0000'),
(312, 1, 222, 3525, 9, 'shipping', '20.0000', '2.0000'),
(313, 1, 222, 3524, 9, 'shipping', '20.0000', '2.0000'),
(314, 1, 222, 3523, 9, 'shipping', '20.0000', '2.0000'),
(315, 1, 222, 3522, 9, 'shipping', '20.0000', '2.0000'),
(316, 1, 222, 3521, 9, 'shipping', '20.0000', '2.0000'),
(317, 1, 222, 3520, 9, 'shipping', '20.0000', '2.0000'),
(318, 1, 222, 3519, 9, 'shipping', '20.0000', '2.0000'),
(319, 1, 222, 3518, 9, 'shipping', '20.0000', '2.0000'),
(320, 1, 222, 3517, 9, 'shipping', '20.0000', '2.0000'),
(321, 1, 222, 3516, 9, 'shipping', '20.0000', '2.0000'),
(322, 1, 222, 3515, 9, 'shipping', '20.0000', '2.0000'),
(323, 1, 222, 3514, 9, 'shipping', '20.0000', '2.0000'),
(324, 1, 222, 3513, 9, 'shipping', '20.0000', '2.0000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category`
--

CREATE TABLE `oc_blog_category` (
  `blog_category_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_blog_category`
--

INSERT INTO `oc_blog_category` (`blog_category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `noindex`, `date_added`, `date_modified`) VALUES
(72, '', 0, 0, 0, 0, 1, 1, '2022-02-20 18:25:13', '2022-02-20 18:25:13'),
(73, '', 0, 0, 0, 0, 1, 1, '2022-02-20 18:25:27', '2022-02-20 18:25:27');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_description`
--

CREATE TABLE `oc_blog_category_description` (
  `blog_category_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_blog_category_description`
--

INSERT INTO `oc_blog_category_description` (`blog_category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `meta_title`, `meta_h1`) VALUES
(72, 3, 'Новости', '', '', '', '', ''),
(72, 2, 'Новости', '', '', '', '', ''),
(73, 1, 'Новости 2', '', '', '', '', ''),
(73, 3, 'Новости 2', '', '', '', '', ''),
(73, 2, 'Новости 2', '', '', '', '', ''),
(72, 1, 'Новости', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_path`
--

CREATE TABLE `oc_blog_category_path` (
  `blog_category_id` int NOT NULL,
  `path_id` int NOT NULL,
  `level` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_blog_category_path`
--

INSERT INTO `oc_blog_category_path` (`blog_category_id`, `path_id`, `level`) VALUES
(73, 73, 0),
(72, 72, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_to_layout`
--

CREATE TABLE `oc_blog_category_to_layout` (
  `blog_category_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_blog_category_to_layout`
--

INSERT INTO `oc_blog_category_to_layout` (`blog_category_id`, `store_id`, `layout_id`) VALUES
(73, 0, 0),
(72, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_to_store`
--

CREATE TABLE `oc_blog_category_to_store` (
  `blog_category_id` int NOT NULL,
  `store_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_blog_category_to_store`
--

INSERT INTO `oc_blog_category_to_store` (`blog_category_id`, `store_id`) VALUES
(72, 0),
(73, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_cart`
--

CREATE TABLE `oc_cart` (
  `cart_id` int UNSIGNED NOT NULL,
  `api_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int NOT NULL,
  `recurring_id` int NOT NULL,
  `option` text NOT NULL,
  `quantity` int NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_cart`
--

INSERT INTO `oc_cart` (`cart_id`, `api_id`, `customer_id`, `session_id`, `product_id`, `recurring_id`, `option`, `quantity`, `date_added`) VALUES
(39, 0, 2, 'd7f00b5356dcf20f9ae2e357ac', 36, 0, '[]', 2, '2022-02-16 17:18:49'),
(59, 0, 1, '1fd15918557f4e7240e304131a', 43, 0, '[]', 1, '2022-02-17 21:48:46'),
(69, 0, 2, 'd7f00b5356dcf20f9ae2e357ac', 32, 0, '[]', 2, '2022-02-19 19:01:44');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category`
--

CREATE TABLE `oc_category` (
  `category_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`, `noindex`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-05-30 12:14:55', 1),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2010-08-22 06:32:15', 1),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2017-07-26 16:50:08', 1),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-05-30 12:15:18', 1),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2011-05-30 12:13:55', 1),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2017-07-26 22:20:22', 0),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2010-08-22 06:32:46', 1),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2010-08-22 06:31:45', 1),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2010-08-22 06:32:39', 1),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00', 1),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06', 1),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12', 1),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2017-07-26 21:59:42', 1),
(59, '', 0, 0, 1, 0, 1, '2022-02-10 17:52:29', '2022-02-10 17:52:29', 1),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42', 1),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55', 1),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2011-04-26 08:52:11', 1),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2011-04-26 08:52:23', 1),
(61, '', 0, 0, 1, 0, 1, '2022-02-10 17:52:57', '2022-02-10 17:52:57', 1),
(60, '', 0, 0, 1, 0, 1, '2022-02-10 17:52:44', '2022-02-10 17:52:44', 1),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2011-05-30 12:15:05', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_description`
--

CREATE TABLE `oc_category_description` (
  `category_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(28, 1, 'Мониторы', '', '', '', '', ''),
(32, 1, 'Веб-камеры', '', '', '', '', ''),
(31, 1, 'Сканеры', '', '', '', '', ''),
(30, 1, 'Принтеры', '', '', '', '', ''),
(29, 1, 'Мышки', '', 'Мышки', '', '', ''),
(27, 1, 'Mac', '', '', '', '', ''),
(26, 1, 'PC', '', '', '', '', ''),
(17, 1, 'Програмное обеспечение', '', '', '', '', ''),
(25, 1, 'Компоненты', '', 'Components', '', '', ''),
(24, 1, 'Телефоны и PDA', '', '', '', '', ''),
(20, 1, 'Компьютеры', '&lt;p&gt;\r\n	Пример текста в описания категории&lt;/p&gt;\r\n', '', '', '', ''),
(35, 1, 'test 1', '', 'test 1', '', '', ''),
(36, 1, 'test 2', '', 'test 2', '', '', ''),
(59, 2, 'Лампы', '', '', '', '', ''),
(60, 1, 'Люстры', '', '', '', '', ''),
(60, 2, 'Люстры', '', '', '', '', ''),
(61, 1, 'Торшеры', '', '', '', '', ''),
(61, 2, 'Торшеры', '', '', '', '', ''),
(28, 3, 'Мониторы', '', '', '', '', ''),
(32, 3, 'Веб-камеры', '', '', '', '', ''),
(31, 3, 'Сканеры', '', '', '', '', ''),
(30, 3, 'Принтеры', '', '', '', '', ''),
(29, 3, 'Мышки', '', 'Мышки', '', '', ''),
(27, 3, 'Mac', '', '', '', '', ''),
(26, 3, 'PC', '', '', '', '', ''),
(18, 1, 'Ноутбуки', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', '', ''),
(45, 1, 'Windows', '', '', '', '', ''),
(46, 1, 'Macs', '', '', '', '', ''),
(20, 3, 'Компьютеры', '&lt;p&gt;\r\n	Пример текста в описания категории&lt;/p&gt;\r\n', '', '', '', ''),
(25, 3, 'Компоненты', '', 'Components', '', '', ''),
(57, 1, 'Планшеты', '', '', '', '', ''),
(33, 1, 'Камеры', '', '', '', '', ''),
(20, 2, 'Desktops', '&lt;p&gt;Example of category description text&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(18, 2, 'Laptops &amp; Notebooks', '&lt;p&gt;Shop Laptop feature only the best laptop deals on the market. By \r\ncomparing laptop deals from the likes of PC World, Comet, Dixons, The \r\nLink and Carphone Warehouse, Shop Laptop has the most comprehensive \r\nselection of laptops on the internet. At Shop Laptop, we pride ourselves\r\n on offering customers the very best laptop deals. From refurbished \r\nlaptops to netbooks, Shop Laptop ensures that every laptop - in every \r\ncolour, style, size and technical spec - is featured on the site at the \r\nlowest possible price.&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(25, 2, 'Components', '', '', '', '', ''),
(29, 2, 'Mice and Trackballs', '', '', '', '', ''),
(28, 2, 'Monitors', '', '', '', '', ''),
(35, 2, 'test 1', '', '', '', '', ''),
(36, 2, 'test 2', '', '', '', '', ''),
(30, 2, 'Printers', '', '', '', '', ''),
(31, 2, 'Scanners', '', '', '', '', ''),
(32, 2, 'Web Cameras', '', '', '', '', ''),
(57, 2, 'Tablets', '', '', '', '', ''),
(17, 2, 'Software', '', '', '', '', ''),
(24, 2, 'Phones &amp; PDAs', '', '', '', '', ''),
(17, 3, 'Програмное обеспечение', '', '', '', '', ''),
(33, 2, 'Cameras', '', '', '', '', ''),
(46, 2, 'Macs', '', '', '', '', ''),
(45, 2, 'Windows', '', '', '', '', ''),
(18, 3, 'Ноутбуки', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', '', ''),
(61, 3, 'Торшеры', '', '', '', '', ''),
(27, 2, 'Mac', '', '', '', '', ''),
(26, 2, 'PC', '', '', '', '', ''),
(60, 3, 'Люстры', '', '', '', '', ''),
(36, 3, 'test 2', '', 'test 2', '', '', ''),
(35, 3, 'test 1', '', 'test 1', '', '', ''),
(24, 3, 'Телефоны и PDA', '', '', '', '', ''),
(59, 1, 'Лампы', '', '', '', '', ''),
(45, 3, 'Windows', '', '', '', '', ''),
(46, 3, 'Macs', '', '', '', '', ''),
(57, 3, 'Планшеты', '', '', '', '', ''),
(33, 3, 'Камеры', '', '', '', '', ''),
(59, 3, 'Лампы', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_filter`
--

CREATE TABLE `oc_category_filter` (
  `category_id` int NOT NULL,
  `filter_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_path`
--

CREATE TABLE `oc_category_path` (
  `category_id` int NOT NULL,
  `path_id` int NOT NULL,
  `level` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 25, 0),
(35, 28, 1),
(35, 35, 2),
(36, 25, 0),
(36, 28, 1),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(17, 17, 0),
(33, 33, 0),
(61, 61, 0),
(60, 60, 0),
(59, 59, 0),
(57, 57, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_layout`
--

CREATE TABLE `oc_category_to_layout` (
  `category_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(59, 0, 0),
(60, 0, 0),
(61, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_store`
--

CREATE TABLE `oc_category_to_store` (
  `category_id` int NOT NULL,
  `store_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(35, 0),
(36, 0),
(45, 0),
(46, 0),
(57, 0),
(59, 0),
(60, 0),
(61, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_country`
--

CREATE TABLE `oc_country` (
  `country_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Армения', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Азербайджан', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Белоруссия (Беларусь)', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Грузия', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Казахстан', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Киргизия (Кыргызстан)', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Молдова', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Российская Федерация', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Таджикистан', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Туркменистан', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Украина', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Узбекистан', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon`
--

CREATE TABLE `oc_coupon` (
  `coupon_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_category`
--

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_history`
--

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_product`
--

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_currency`
--

CREATE TABLE `oc_currency` (
  `currency_id` int NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(2, 'US Dollar', 'USD', '$', '', '2', 0.03510669, 1, '2022-02-21 15:20:08'),
(3, 'Euro', 'EUR', '', '€', '2', 0.03097059, 1, '2022-02-21 15:20:08'),
(4, 'Гривна', 'UAH', '', 'грн.', '2', 1.00000000, 1, '2022-02-21 15:20:08');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer`
--

CREATE TABLE `oc_customer` (
  `customer_id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  `language_id` int NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `language_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `safe`, `token`, `code`, `date_added`) VALUES
(1, 1, 0, 1, 'test', 'testovic', 'm@mail.com', '09700000000', '', 'e5dc0dd88e09ac35373726bc0df749ee43fc6c98', 'jYEMqO4hr', NULL, NULL, 1, 1, '', '127.0.0.1', 1, 0, '', '', '2022-02-14 20:07:09'),
(2, 1, 0, 3, 'Test', 'Testovic', 'a@mail.com', '09700000000', '', '4c11de2a565d132fb1a6cf8e1880678ab4da4779', 'lyhuQVXto', NULL, NULL, 0, 0, '', '127.0.0.1', 1, 0, '', '', '2022-02-16 17:18:49');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_activity`
--

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_affiliate`
--

CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_approval`
--

CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group`
--

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int NOT NULL,
  `approval` int NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group_description`
--

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 3, 'Default', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_history`
--

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_ip`
--

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '127.0.0.1', '2022-02-14 20:07:09'),
(2, 2, '127.0.0.1', '2022-02-16 17:18:49');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_login`
--

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(4, 'test', '127.0.0.1', 1, '2022-02-19 18:58:22', '2022-02-19 18:58:22');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_online`
--

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_reward`
--

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int NOT NULL,
  `customer_id` int NOT NULL DEFAULT '0',
  `order_id` int NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_search`
--

CREATE TABLE `oc_customer_search` (
  `customer_search_id` int NOT NULL,
  `store_id` int NOT NULL,
  `language_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int DEFAULT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_transaction`
--

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_wishlist`
--

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_customer_wishlist`
--

INSERT INTO `oc_customer_wishlist` (`customer_id`, `product_id`, `date_added`) VALUES
(1, 47, '2022-02-14 20:32:53'),
(1, 43, '2022-02-17 21:37:31'),
(1, 44, '2022-02-17 21:37:39'),
(1, 52, '2022-02-17 21:38:25');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field`
--

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_customer_group`
--

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_description`
--

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value`
--

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int NOT NULL,
  `custom_field_id` int NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value_description`
--

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int NOT NULL,
  `language_id` int NOT NULL,
  `custom_field_id` int NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download`
--

CREATE TABLE `oc_download` (
  `download_id` int NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download_description`
--

CREATE TABLE `oc_download_description` (
  `download_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_dqc_setting`
--

CREATE TABLE `oc_dqc_setting` (
  `setting_id` int NOT NULL,
  `store_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_dqc_statistic`
--

CREATE TABLE `oc_dqc_statistic` (
  `statistic_id` int NOT NULL,
  `setting_id` int NOT NULL,
  `order_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `data` text NOT NULL,
  `rating` int NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_dqc_statistic`
--

INSERT INTO `oc_dqc_statistic` (`statistic_id`, `setting_id`, `order_id`, `customer_id`, `data`, `rating`, `date_added`, `date_modified`) VALUES
(1, 0, 12, 1, '{\"account\":\"logged\",\"field\":{\"guest\":{\"payment_address\":16,\"shipping_address\":7,\"confirm\":2},\"register\":{\"payment_address\":19,\"shipping_address\":7,\"confirm\":2},\"logged\":{\"payment_address\":9,\"shipping_address\":7,\"confirm\":2}}}', 0, '2022-02-17 21:41:56', '2022-02-17 21:41:56'),
(2, 0, 14, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":16,\"shipping_address\":7,\"confirm\":2},\"register\":{\"payment_address\":19,\"shipping_address\":7,\"confirm\":2},\"logged\":{\"payment_address\":9,\"shipping_address\":7,\"confirm\":2}}}', 0, '2022-02-18 19:07:01', '2022-02-18 19:07:01');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_d_meta_data`
--

CREATE TABLE `oc_d_meta_data` (
  `route` varchar(255) NOT NULL,
  `store_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `short_description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  `custom_title_1` varchar(255) NOT NULL,
  `custom_title_2` varchar(255) NOT NULL,
  `custom_image_title` varchar(255) NOT NULL,
  `custom_image_alt` varchar(255) NOT NULL,
  `meta_robots` varchar(32) NOT NULL DEFAULT 'index,follow'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_d_target_keyword`
--

CREATE TABLE `oc_d_target_keyword` (
  `route` varchar(255) NOT NULL,
  `store_id` int NOT NULL,
  `language_id` int NOT NULL,
  `sort_order` int NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int NOT NULL,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1, 0),
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1, 0),
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1, 0),
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1, 0),
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1, 0),
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1, 0),
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1, 0),
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1, 0),
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1, 0),
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1, 0),
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1, 0),
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1, 0),
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1, 0),
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 0),
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 0),
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 0),
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1, 0),
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1, 0),
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1, 0),
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1, 0),
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1, 0),
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1, 0),
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1, 0),
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1, 0),
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1, 0),
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1, 0),
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1, 0),
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1, 0),
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1, 0),
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 0),
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 0),
(32, 'admin_mail_return', 'admin/model/sale/return/addReturnHistory/after', 'mail/return', 1, 0),
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 0),
(34, 'advertise_google', 'admin/model/catalog/product/deleteProduct/after', 'extension/advertise/google/deleteProduct', 1, 0),
(35, 'advertise_google', 'admin/model/catalog/product/copyProduct/after', 'extension/advertise/google/copyProduct', 1, 0),
(36, 'advertise_google', 'admin/view/common/column_left/before', 'extension/advertise/google/admin_link', 1, 0),
(37, 'advertise_google', 'admin/model/catalog/product/addProduct/after', 'extension/advertise/google/addProduct', 1, 0),
(38, 'advertise_google', 'catalog/controller/checkout/success/before', 'extension/advertise/google/before_checkout_success', 1, 0),
(39, 'advertise_google', 'catalog/view/common/header/after', 'extension/advertise/google/google_global_site_tag', 1, 0),
(40, 'advertise_google', 'catalog/view/common/success/after', 'extension/advertise/google/google_dynamic_remarketing_purchase', 1, 0),
(41, 'advertise_google', 'catalog/view/product/product/after', 'extension/advertise/google/google_dynamic_remarketing_product', 1, 0),
(42, 'advertise_google', 'catalog/view/product/search/after', 'extension/advertise/google/google_dynamic_remarketing_searchresults', 1, 0),
(43, 'advertise_google', 'catalog/view/product/category/after', 'extension/advertise/google/google_dynamic_remarketing_category', 1, 0),
(44, 'advertise_google', 'catalog/view/common/home/after', 'extension/advertise/google/google_dynamic_remarketing_home', 1, 0),
(45, 'advertise_google', 'catalog/view/checkout/cart/after', 'extension/advertise/google/google_dynamic_remarketing_cart', 1, 0),
(49, 'module_quickcheckout', 'catalog/controller/checkout/success/before', 'extension/quickcheckout/checkout/eventPreControllerCheckoutSuccess', 1, 0),
(48, 'module_quickcheckout', 'catalog/controller/checkout/checkout/before', 'extension/quickcheckout/checkout/eventPreControllerCheckoutCheckout', 1, 0),
(50, 'brainyfilter', 'admin/model/catalog/product/addProduct/after', 'extension/module/brainyfilter/eventAddProduct', 1, 0),
(51, 'brainyfilter', 'admin/model/catalog/product/editProduct/after', 'extension/module/brainyfilter/eventEditProduct', 1, 0),
(52, 'brainyfilter', 'admin/model/catalog/product/deleteProduct/after', 'extension/module/brainyfilter/eventDeleteProduct', 1, 0),
(53, 'brainyfilter', 'admin/model/catalog/review/addReview/after', 'extension/module/brainyfilter/eventEditReview', 1, 0),
(54, 'brainyfilter', 'admin/model/catalog/review/editReview/after', 'extension/module/brainyfilter/eventEditReview', 1, 0),
(55, 'brainyfilter', 'admin/model/catalog/review/deleteReview/after', 'extension/module/brainyfilter/eventEditReview', 1, 0),
(56, 'd_seo_module', 'admin/view/common/column_left/before', 'extension/module/d_seo_module/column_left_before', 1, 0),
(57, 'd_seo_module', 'admin/model/localisation/language/addLanguage/after', 'extension/module/d_seo_module/language_add_language_after', 1, 0),
(58, 'd_seo_module', 'admin/model/localisation/language/editLanguage/after', 'extension/module/d_seo_module/language_edit_language_after', 1, 0),
(59, 'd_seo_module', 'admin/model/localisation/language/deleteLanguage/after', 'extension/module/d_seo_module/language_delete_language_after', 1, 0),
(60, 'd_seo_module', 'admin/view/setting/setting/after', 'extension/module/d_seo_module/setting_after', 1, 0),
(61, 'd_seo_module', 'admin/view/setting/store_form/after', 'extension/module/d_seo_module/store_form_after', 1, 0),
(62, 'd_seo_module', 'admin/model/setting/store/addStore/after', 'extension/module/d_seo_module/store_add_store_after', 1, 0),
(63, 'd_seo_module', 'admin/model/setting/store/editStore/after', 'extension/module/d_seo_module/store_edit_store_after', 1, 0),
(64, 'd_seo_module', 'admin/model/setting/store/deleteStore/after', 'extension/module/d_seo_module/store_delete_store_after', 1, 0),
(65, 'd_seo_module', 'admin/view/catalog/category_form/after', 'extension/module/d_seo_module/category_form_after', 1, 0),
(66, 'd_seo_module', 'admin/model/catalog/category/addCategory/after', 'extension/module/d_seo_module/category_add_category_after', 1, 0),
(67, 'd_seo_module', 'admin/model/catalog/category/editCategory/after', 'extension/module/d_seo_module/category_edit_category_after', 1, 0),
(68, 'd_seo_module', 'admin/model/catalog/category/deleteCategory/after', 'extension/module/d_seo_module/category_delete_category_after', 1, 0),
(69, 'd_seo_module', 'admin/view/catalog/product_form/after', 'extension/module/d_seo_module/product_form_after', 1, 0),
(70, 'd_seo_module', 'admin/model/catalog/product/addProduct/after', 'extension/module/d_seo_module/product_add_product_after', 1, 0),
(71, 'd_seo_module', 'admin/model/catalog/product/editProduct/after', 'extension/module/d_seo_module/product_edit_product_after', 1, 0),
(72, 'd_seo_module', 'admin/model/catalog/product/deleteProduct/after', 'extension/module/d_seo_module/product_delete_product_after', 1, 0),
(73, 'd_seo_module', 'admin/view/catalog/manufacturer_form/after', 'extension/module/d_seo_module/manufacturer_form_after', 1, 0),
(74, 'd_seo_module', 'admin/model/catalog/manufacturer/addManufacturer/after', 'extension/module/d_seo_module/manufacturer_add_manufacturer_after', 1, 0),
(75, 'd_seo_module', 'admin/model/catalog/manufacturer/editManufacturer/after', 'extension/module/d_seo_module/manufacturer_edit_manufacturer_after', 1, 0),
(76, 'd_seo_module', 'admin/model/catalog/manufacturer/deleteManufacturer/after', 'extension/module/d_seo_module/manufacturer_delete_manufacturer_after', 1, 0),
(77, 'd_seo_module', 'admin/view/catalog/information_form/after', 'extension/module/d_seo_module/information_form_after', 1, 0),
(78, 'd_seo_module', 'admin/model/catalog/information/addInformation/after', 'extension/module/d_seo_module/information_add_information_after', 1, 0),
(79, 'd_seo_module', 'admin/model/catalog/information/editInformation/after', 'extension/module/d_seo_module/information_edit_information_after', 1, 0),
(80, 'd_seo_module', 'admin/model/catalog/information/deleteInformation/after', 'extension/module/d_seo_module/information_delete_information_after', 1, 0),
(81, 'd_seo_module', 'catalog/view/common/header/before', 'extension/module/d_seo_module/header_before', 1, 0),
(82, 'd_seo_module', 'catalog/view/common/header/after', 'extension/module/d_seo_module/header_after', 1, 0),
(83, 'd_seo_module', 'catalog/view/common/footer/before', 'extension/module/d_seo_module/footer_before', 1, 0),
(84, 'd_seo_module', 'catalog/view/common/footer/after', 'extension/module/d_seo_module/footer_after', 1, 0),
(85, 'd_seo_module', 'catalog/view/common/home/before', 'extension/module/d_seo_module/home_before', 1, 0),
(86, 'd_seo_module', 'catalog/view/common/home/after', 'extension/module/d_seo_module/home_after', 1, 0),
(87, 'd_seo_module', 'catalog/view/product/category/before', 'extension/module/d_seo_module/category_before', 1, 0),
(88, 'd_seo_module', 'catalog/view/product/category/after', 'extension/module/d_seo_module/category_after', 1, 0),
(89, 'd_seo_module', 'catalog/model/catalog/category/getCategory/after', 'extension/module/d_seo_module/category_get_category_after', 1, 0),
(90, 'd_seo_module', 'catalog/model/catalog/category/getCategories/after', 'extension/module/d_seo_module/category_get_categories_after', 1, 0),
(91, 'd_seo_module', 'catalog/view/product/product/before', 'extension/module/d_seo_module/product_before', 1, 0),
(92, 'd_seo_module', 'catalog/view/product/product/after', 'extension/module/d_seo_module/product_after', 1, 0),
(93, 'd_seo_module', 'catalog/model/catalog/product/getProduct/after', 'extension/module/d_seo_module/product_get_product_after', 1, 0),
(94, 'd_seo_module', 'catalog/model/catalog/product/getProducts/after', 'extension/module/d_seo_module/product_get_products_after', 1, 0),
(95, 'd_seo_module', 'catalog/view/product/manufacturer_list/before', 'extension/module/d_seo_module/manufacturer_list_before', 1, 0),
(96, 'd_seo_module', 'catalog/view/product/manufacturer_list/after', 'extension/module/d_seo_module/manufacturer_list_after', 1, 0),
(97, 'd_seo_module', 'catalog/view/product/manufacturer_info/before', 'extension/module/d_seo_module/manufacturer_info_before', 1, 0),
(98, 'd_seo_module', 'catalog/view/product/manufacturer_info/after', 'extension/module/d_seo_module/manufacturer_info_after', 1, 0),
(99, 'd_seo_module', 'catalog/model/catalog/manufacturer/getManufacturer/after', 'extension/module/d_seo_module/manufacturer_get_manufacturer_after', 1, 0),
(100, 'd_seo_module', 'catalog/model/catalog/manufacturer/getManufacturers/after', 'extension/module/d_seo_module/manufacturer_get_manufacturers_after', 1, 0),
(101, 'd_seo_module', 'catalog/view/information/information/before', 'extension/module/d_seo_module/information_before', 1, 0),
(102, 'd_seo_module', 'catalog/view/information/information/after', 'extension/module/d_seo_module/information_after', 1, 0),
(103, 'd_seo_module', 'catalog/model/catalog/information/getInformation/after', 'extension/module/d_seo_module/information_get_information_after', 1, 0),
(104, 'd_seo_module', 'catalog/model/catalog/information/getInformations/after', 'extension/module/d_seo_module/information_get_informations_after', 1, 0),
(105, 'd_seo_module', 'catalog/view/product/search/before', 'extension/module/d_seo_module/search_before', 1, 0),
(106, 'd_seo_module', 'catalog/view/product/search/after', 'extension/module/d_seo_module/search_after', 1, 0),
(107, 'd_seo_module', 'catalog/view/product/special/before', 'extension/module/d_seo_module/special_before', 1, 0),
(108, 'd_seo_module', 'catalog/view/product/special/after', 'extension/module/d_seo_module/special_after', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension`
--

CREATE TABLE `oc_extension` (
  `extension_id` int NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'report', 'sale_coupon'),
(31, 'report', 'customer_search'),
(32, 'report', 'customer_transaction'),
(33, 'report', 'product_purchased'),
(34, 'report', 'product_viewed'),
(35, 'report', 'sale_return'),
(36, 'report', 'sale_order'),
(37, 'report', 'sale_shipping'),
(38, 'report', 'sale_tax'),
(39, 'report', 'customer_activity'),
(40, 'report', 'customer_order'),
(41, 'report', 'customer_reward'),
(42, 'advertise', 'google'),
(43, 'module', 'blog_latest'),
(44, 'module', 'blog_featured'),
(45, 'module', 'blog_category'),
(46, 'module', 'featured_article'),
(47, 'module', 'featured_product'),
(48, 'currency', 'cbr'),
(49, 'currency', 'ecb'),
(50, 'currency', 'nbu'),
(51, 'dashboard', 'domovoy'),
(52, 'module', 'preimushestva_banner'),
(58, 'module', 'center_banner'),
(54, 'module', 'hit'),
(57, 'module', 'newest'),
(60, 'module', 'bottom_banner'),
(64, 'module', 'quickcheckout'),
(65, 'shipping', 'free'),
(66, 'payment', 'bank_transfer'),
(67, 'module', 'd_quickcheckout'),
(68, 'module', 'newsletter'),
(72, 'module', 'banners_grid'),
(79, 'module', 'sidebar_banner'),
(77, 'dashboard', 'd_seo_module_target_keyword');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension_install`
--

CREATE TABLE `oc_extension_install` (
  `extension_install_id` int NOT NULL,
  `extension_download_id` int NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_extension_install`
--

INSERT INTO `oc_extension_install` (`extension_install_id`, `extension_download_id`, `filename`, `date_added`) VALUES
(1, 0, 'ZAKAZ_KORZINA_oc3.ocmod.zip', '2022-02-15 09:14:20'),
(2, 0, 'dquickcheckoutlitecompiledoc3.0.2.0.v6.6.2.ocmod.zip', '2022-02-16 08:10:28'),
(3, 0, 'newsletter-subscription_oc3.ocmod.zip', '2022-02-17 21:59:59'),
(4, 0, 'localcopy_oc3.ocmod.zip', '2022-02-17 22:01:05'),
(5, 0, 'newsletter-subscription_oc3.ocmod.zip', '2022-02-17 22:01:22'),
(10, 0, 'export-import-multilingual_oc3x.ocmod.zip', '2022-02-20 23:14:52'),
(9, 0, '[ocmod.net] opencart-uk-ua_oc30.ocmod.zip', '2022-02-19 19:43:24'),
(8, 0, '[ocmod.net] opencart-uk-ua_oc30.ocmod.zip', '2022-02-19 17:51:14');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension_path`
--

CREATE TABLE `oc_extension_path` (
  `extension_path_id` int NOT NULL,
  `extension_install_id` int NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_extension_path`
--

INSERT INTO `oc_extension_path` (`extension_path_id`, `extension_install_id`, `path`, `date_added`) VALUES
(1, 1, 'admin/language/uk-ua', '2022-02-15 09:14:25'),
(2, 1, 'catalog/language/uk-ua', '2022-02-15 09:14:25'),
(3, 1, 'admin/language/uk-ua/extension', '2022-02-15 09:14:25'),
(4, 1, 'admin/view/javascript/quickcheckout', '2022-02-15 09:14:25'),
(5, 1, 'admin/view/stylesheet/quickcheckout.css', '2022-02-15 09:14:25'),
(6, 1, 'catalog/controller/extension/quickcheckout', '2022-02-15 09:14:25'),
(7, 1, 'catalog/language/uk-ua/extension', '2022-02-15 09:14:25'),
(8, 1, 'admin/controller/extension/module/quickcheckout.php', '2022-02-15 09:14:25'),
(9, 1, 'admin/language/uk-ua/extension/module', '2022-02-15 09:14:25'),
(10, 1, 'admin/model/extension/module/quickcheckout.php', '2022-02-15 09:14:25'),
(11, 1, 'admin/view/javascript/quickcheckout/bootstrap-slider', '2022-02-15 09:14:25'),
(12, 1, 'admin/view/javascript/quickcheckout/bootstrap-sortable.js', '2022-02-15 09:14:25'),
(13, 1, 'admin/view/javascript/quickcheckout/tinysort', '2022-02-15 09:14:25'),
(14, 1, 'catalog/controller/extension/quickcheckout/cart.php', '2022-02-15 09:14:25'),
(15, 1, 'catalog/controller/extension/quickcheckout/checkout.php', '2022-02-15 09:14:25'),
(16, 1, 'catalog/controller/extension/quickcheckout/confirm.php', '2022-02-15 09:14:25'),
(17, 1, 'catalog/controller/extension/quickcheckout/guest.php', '2022-02-15 09:14:25'),
(18, 1, 'catalog/controller/extension/quickcheckout/guest_shipping.php', '2022-02-15 09:14:25'),
(19, 1, 'catalog/controller/extension/quickcheckout/login.php', '2022-02-15 09:14:25'),
(20, 1, 'catalog/controller/extension/quickcheckout/payment_address.php', '2022-02-15 09:14:25'),
(21, 1, 'catalog/controller/extension/quickcheckout/payment_method.php', '2022-02-15 09:14:25'),
(22, 1, 'catalog/controller/extension/quickcheckout/register.php', '2022-02-15 09:14:25'),
(23, 1, 'catalog/controller/extension/quickcheckout/shipping_address.php', '2022-02-15 09:14:25'),
(24, 1, 'catalog/controller/extension/quickcheckout/shipping_method.php', '2022-02-15 09:14:25'),
(25, 1, 'catalog/controller/extension/quickcheckout/terms.php', '2022-02-15 09:14:25'),
(26, 1, 'catalog/controller/extension/quickcheckout/voucher.php', '2022-02-15 09:14:25'),
(27, 1, 'catalog/language/en-gb/extension/quickcheckout', '2022-02-15 09:14:25'),
(28, 1, 'catalog/language/ru-ru/extension/quickcheckout', '2022-02-15 09:14:25'),
(29, 1, 'catalog/language/uk-ua/extension/quickcheckout', '2022-02-15 09:14:25'),
(30, 1, 'catalog/view/javascript/jquery/quickcheckout', '2022-02-15 09:14:25'),
(31, 1, 'admin/language/en-gb/extension/module/quickcheckout.php', '2022-02-15 09:14:25'),
(32, 1, 'admin/language/ru-ru/extension/module/quickcheckout.php', '2022-02-15 09:14:25'),
(33, 1, 'admin/language/uk-ua/extension/module/quickcheckout.php', '2022-02-15 09:14:25'),
(34, 1, 'admin/view/javascript/quickcheckout/bootstrap-slider/css', '2022-02-15 09:14:25'),
(35, 1, 'admin/view/javascript/quickcheckout/bootstrap-slider/js', '2022-02-15 09:14:25'),
(36, 1, 'admin/view/javascript/quickcheckout/tinysort/jquery.tinysort.min.js', '2022-02-15 09:14:25'),
(37, 1, 'admin/view/template/extension/module/quickcheckout.twig', '2022-02-15 09:14:25'),
(38, 1, 'catalog/language/en-gb/extension/quickcheckout/checkout.php', '2022-02-15 09:14:25'),
(39, 1, 'catalog/language/ru-ru/extension/quickcheckout/checkout.php', '2022-02-15 09:14:25'),
(40, 1, 'catalog/language/uk-ua/extension/quickcheckout/checkout.php', '2022-02-15 09:14:25'),
(41, 1, 'catalog/view/javascript/jquery/quickcheckout/bootstrap-datetimepicker.min.css', '2022-02-15 09:14:25'),
(42, 1, 'catalog/view/javascript/jquery/quickcheckout/bootstrap-datetimepicker.min.js', '2022-02-15 09:14:25'),
(43, 1, 'catalog/view/javascript/jquery/quickcheckout/jquery.tinysort.min.js', '2022-02-15 09:14:25'),
(44, 1, 'catalog/view/javascript/jquery/quickcheckout/moment-with-locales.min.js', '2022-02-15 09:14:25'),
(45, 1, 'catalog/view/javascript/jquery/quickcheckout/quickcheckout.block.js', '2022-02-15 09:14:25'),
(46, 1, 'catalog/view/javascript/jquery/quickcheckout/quickcheckout.js', '2022-02-15 09:14:25'),
(47, 1, 'catalog/view/theme/default/stylesheet/quickcheckout.css', '2022-02-15 09:14:25'),
(48, 1, 'catalog/view/theme/default/stylesheet/quickcheckout_custom.css', '2022-02-15 09:14:25'),
(49, 1, 'catalog/view/theme/default/stylesheet/quickcheckout_mobile.css', '2022-02-15 09:14:25'),
(50, 1, 'catalog/view/theme/default/stylesheet/quickcheckout_one.css', '2022-02-15 09:14:25'),
(51, 1, 'catalog/view/theme/default/stylesheet/quickcheckout_three.css', '2022-02-15 09:14:25'),
(52, 1, 'catalog/view/theme/default/stylesheet/quickcheckout_two.css', '2022-02-15 09:14:25'),
(53, 1, 'admin/view/javascript/quickcheckout/bootstrap-slider/css/slider.css', '2022-02-15 09:14:25'),
(54, 1, 'admin/view/javascript/quickcheckout/bootstrap-slider/js/bootstrap-slider.js', '2022-02-15 09:14:25'),
(55, 1, 'catalog/view/theme/default/template/extension/quickcheckout', '2022-02-15 09:14:25'),
(56, 1, 'catalog/view/theme/default/template/extension/quickcheckout/cart.twig', '2022-02-15 09:14:25'),
(57, 1, 'catalog/view/theme/default/template/extension/quickcheckout/checkout.twig', '2022-02-15 09:14:25'),
(58, 1, 'catalog/view/theme/default/template/extension/quickcheckout/confirm.twig', '2022-02-15 09:14:25'),
(59, 1, 'catalog/view/theme/default/template/extension/quickcheckout/guest.twig', '2022-02-15 09:14:25'),
(60, 1, 'catalog/view/theme/default/template/extension/quickcheckout/guest_shipping.twig', '2022-02-15 09:14:25'),
(61, 1, 'catalog/view/theme/default/template/extension/quickcheckout/login.twig', '2022-02-15 09:14:25'),
(62, 1, 'catalog/view/theme/default/template/extension/quickcheckout/payment_address.twig', '2022-02-15 09:14:25'),
(63, 1, 'catalog/view/theme/default/template/extension/quickcheckout/payment_method.twig', '2022-02-15 09:14:25'),
(64, 1, 'catalog/view/theme/default/template/extension/quickcheckout/register.twig', '2022-02-15 09:14:25'),
(65, 1, 'catalog/view/theme/default/template/extension/quickcheckout/shipping_address.twig', '2022-02-15 09:14:25'),
(66, 1, 'catalog/view/theme/default/template/extension/quickcheckout/shipping_method.twig', '2022-02-15 09:14:25'),
(67, 1, 'catalog/view/theme/default/template/extension/quickcheckout/terms.twig', '2022-02-15 09:14:25'),
(68, 1, 'catalog/view/theme/default/template/extension/quickcheckout/voucher.twig', '2022-02-15 09:14:25'),
(69, 2, 'image/catalog/d_quickcheckout', '2022-02-16 08:10:30'),
(70, 2, 'system/config/d_quickcheckout.php', '2022-02-16 08:10:30'),
(71, 2, 'system/library/d_compress', '2022-02-16 08:10:30'),
(72, 2, 'system/library/d_shopunity', '2022-02-16 08:10:30'),
(73, 2, 'admin/model/extension/d_opencart_patch', '2022-02-16 08:10:30'),
(74, 2, 'admin/view/javascript/d_bootstrap_switch', '2022-02-16 08:10:30'),
(75, 2, 'admin/view/javascript/d_quickcheckout', '2022-02-16 08:10:30'),
(76, 2, 'admin/view/javascript/d_rubaxa_sortable', '2022-02-16 08:10:30'),
(77, 2, 'admin/view/javascript/d_tinysort', '2022-02-16 08:10:30'),
(78, 2, 'admin/view/stylesheet/d_quickcheckout.css', '2022-02-16 08:10:30'),
(79, 2, 'admin/view/stylesheet/d_quickcheckout.less', '2022-02-16 08:10:30'),
(80, 2, 'catalog/controller/extension/d_quickcheckout', '2022-02-16 08:10:30'),
(81, 2, 'catalog/model/extension/d_opencart_patch', '2022-02-16 08:10:30'),
(82, 2, 'catalog/model/extension/d_quickcheckout', '2022-02-16 08:10:30'),
(83, 2, 'catalog/view/javascript/d_bootstrap_switch', '2022-02-16 08:10:30'),
(84, 2, 'catalog/view/javascript/d_quickcheckout', '2022-02-16 08:10:30'),
(85, 2, 'catalog/view/javascript/d_rubaxa_sortable', '2022-02-16 08:10:30'),
(86, 2, 'catalog/view/javascript/d_tinysort', '2022-02-16 08:10:30'),
(87, 2, 'image/catalog/d_quickcheckout/payment', '2022-02-16 08:10:30'),
(88, 2, 'image/catalog/d_quickcheckout/svg-loaders', '2022-02-16 08:10:30'),
(89, 2, 'system/library/d_compress/compress.php', '2022-02-16 08:10:30'),
(90, 2, 'system/library/d_compress/cssmin.php', '2022-02-16 08:10:30'),
(91, 2, 'system/library/d_compress/jsmin.php', '2022-02-16 08:10:30'),
(92, 2, 'system/library/d_shopunity/extension', '2022-02-16 08:10:30'),
(93, 2, 'system/library/d_shopunity/install', '2022-02-16 08:10:30'),
(94, 2, 'system/library/d_shopunity/readme', '2022-02-16 08:10:30'),
(95, 2, 'system/library/template/Twig', '2022-02-16 08:10:30'),
(96, 2, 'admin/controller/extension/module/d_quickcheckout.php', '2022-02-16 08:10:30'),
(97, 2, 'admin/model/extension/d_opencart_patch/cache.php', '2022-02-16 08:10:30'),
(98, 2, 'admin/model/extension/d_opencart_patch/event.php', '2022-02-16 08:10:30'),
(99, 2, 'admin/model/extension/d_opencart_patch/extension.php', '2022-02-16 08:10:30'),
(100, 2, 'admin/model/extension/d_opencart_patch/load.php', '2022-02-16 08:10:30'),
(101, 2, 'admin/model/extension/d_opencart_patch/modification.php', '2022-02-16 08:10:30'),
(102, 2, 'admin/model/extension/d_opencart_patch/module.php', '2022-02-16 08:10:30'),
(103, 2, 'admin/model/extension/d_opencart_patch/setting.php', '2022-02-16 08:10:30'),
(104, 2, 'admin/model/extension/d_opencart_patch/store.php', '2022-02-16 08:10:30'),
(105, 2, 'admin/model/extension/d_opencart_patch/url.php', '2022-02-16 08:10:30'),
(106, 2, 'admin/model/extension/d_opencart_patch/user.php', '2022-02-16 08:10:30'),
(107, 2, 'admin/model/extension/d_opencart_patch/vqmod.php', '2022-02-16 08:10:30'),
(108, 2, 'admin/model/extension/module/d_quickcheckout.php', '2022-02-16 08:10:30'),
(109, 2, 'admin/model/extension/module/d_twig_manager.php', '2022-02-16 08:10:30'),
(110, 2, 'admin/view/javascript/d_bootstrap_switch/css', '2022-02-16 08:10:30'),
(111, 2, 'admin/view/javascript/d_bootstrap_switch/js', '2022-02-16 08:10:30'),
(112, 2, 'admin/view/javascript/d_quickcheckout/bootstrap-slider', '2022-02-16 08:10:30'),
(113, 2, 'admin/view/javascript/d_quickcheckout/bootstrap-sortable', '2022-02-16 08:10:30'),
(114, 2, 'admin/view/javascript/d_quickcheckout/bootstrap-sortable.js', '2022-02-16 08:10:30'),
(115, 2, 'admin/view/javascript/d_quickcheckout/bootstrap.css', '2022-02-16 08:10:30'),
(116, 2, 'admin/view/javascript/d_quickcheckout/jquery.tinysort.min.js', '2022-02-16 08:10:30'),
(117, 2, 'admin/view/javascript/d_quickcheckout/serializeObject', '2022-02-16 08:10:30'),
(118, 2, 'admin/view/javascript/d_rubaxa_sortable/jquery.binding.js', '2022-02-16 08:10:30'),
(119, 2, 'admin/view/javascript/d_rubaxa_sortable/knockout-sortable.js', '2022-02-16 08:10:30'),
(120, 2, 'admin/view/javascript/d_rubaxa_sortable/ng-sortable.js', '2022-02-16 08:10:30'),
(121, 2, 'admin/view/javascript/d_rubaxa_sortable/react-sortable-mixin.js', '2022-02-16 08:10:30'),
(122, 2, 'admin/view/javascript/d_rubaxa_sortable/sortable.css', '2022-02-16 08:10:30'),
(123, 2, 'admin/view/javascript/d_rubaxa_sortable/sortable.js', '2022-02-16 08:10:30'),
(124, 2, 'admin/view/javascript/d_rubaxa_sortable/sortable.min.js', '2022-02-16 08:10:30'),
(125, 2, 'admin/view/javascript/d_tinysort/jquery.tinysort.js', '2022-02-16 08:10:30'),
(126, 2, 'admin/view/javascript/d_tinysort/jquery.tinysort.min.js', '2022-02-16 08:10:30'),
(127, 2, 'admin/view/javascript/d_tinysort/tinysort.charorder.js', '2022-02-16 08:10:30'),
(128, 2, 'admin/view/javascript/d_tinysort/tinysort.charorder.min.js', '2022-02-16 08:10:30'),
(129, 2, 'admin/view/javascript/d_tinysort/tinysort.js', '2022-02-16 08:10:30'),
(130, 2, 'admin/view/javascript/d_tinysort/tinysort.min.js', '2022-02-16 08:10:30'),
(131, 2, 'catalog/controller/extension/d_quickcheckout/cart.php', '2022-02-16 08:10:30'),
(132, 2, 'catalog/controller/extension/d_quickcheckout/confirm.php', '2022-02-16 08:10:30'),
(133, 2, 'catalog/controller/extension/d_quickcheckout/field.php', '2022-02-16 08:10:30'),
(134, 2, 'catalog/controller/extension/d_quickcheckout/login.php', '2022-02-16 08:10:30'),
(135, 2, 'catalog/controller/extension/d_quickcheckout/payment.php', '2022-02-16 08:10:30'),
(136, 2, 'catalog/controller/extension/d_quickcheckout/payment_address.php', '2022-02-16 08:10:30'),
(137, 2, 'catalog/controller/extension/d_quickcheckout/payment_method.php', '2022-02-16 08:10:30'),
(138, 2, 'catalog/controller/extension/d_quickcheckout/shipping_address.php', '2022-02-16 08:10:30'),
(139, 2, 'catalog/controller/extension/d_quickcheckout/shipping_method.php', '2022-02-16 08:10:30'),
(140, 2, 'catalog/controller/extension/module/d_quickcheckout.php', '2022-02-16 08:10:30'),
(141, 2, 'catalog/model/extension/d_opencart_patch/load.php', '2022-02-16 08:10:30'),
(142, 2, 'catalog/model/extension/d_opencart_patch/user.php', '2022-02-16 08:10:30'),
(143, 2, 'catalog/model/extension/d_quickcheckout/address.php', '2022-02-16 08:10:30'),
(144, 2, 'catalog/model/extension/d_quickcheckout/custom_field.php', '2022-02-16 08:10:30'),
(145, 2, 'catalog/model/extension/d_quickcheckout/method.php', '2022-02-16 08:10:30'),
(146, 2, 'catalog/model/extension/d_quickcheckout/order.php', '2022-02-16 08:10:30'),
(147, 2, 'catalog/model/extension/module/d_quickcheckout.php', '2022-02-16 08:10:30'),
(148, 2, 'catalog/view/javascript/d_bootstrap_switch/css', '2022-02-16 08:10:30'),
(149, 2, 'catalog/view/javascript/d_bootstrap_switch/js', '2022-02-16 08:10:30'),
(150, 2, 'catalog/view/javascript/d_quickcheckout/compress', '2022-02-16 08:10:30'),
(151, 2, 'catalog/view/javascript/d_quickcheckout/engine', '2022-02-16 08:10:30'),
(152, 2, 'catalog/view/javascript/d_quickcheckout/library', '2022-02-16 08:10:30'),
(153, 2, 'catalog/view/javascript/d_quickcheckout/main.js', '2022-02-16 08:10:30'),
(154, 2, 'catalog/view/javascript/d_quickcheckout/model', '2022-02-16 08:10:30'),
(155, 2, 'catalog/view/javascript/d_quickcheckout/require.js', '2022-02-16 08:10:30'),
(156, 2, 'catalog/view/javascript/d_quickcheckout/view', '2022-02-16 08:10:30'),
(157, 2, 'catalog/view/javascript/d_rubaxa_sortable/jquery.binding.js', '2022-02-16 08:10:30'),
(158, 2, 'catalog/view/javascript/d_rubaxa_sortable/knockout-sortable.js', '2022-02-16 08:10:30'),
(159, 2, 'catalog/view/javascript/d_rubaxa_sortable/ng-sortable.js', '2022-02-16 08:10:30'),
(160, 2, 'catalog/view/javascript/d_rubaxa_sortable/react-sortable-mixin.js', '2022-02-16 08:10:30'),
(161, 2, 'catalog/view/javascript/d_rubaxa_sortable/sortable.css', '2022-02-16 08:10:30'),
(162, 2, 'catalog/view/javascript/d_rubaxa_sortable/sortable.js', '2022-02-16 08:10:30'),
(163, 2, 'catalog/view/javascript/d_rubaxa_sortable/sortable.min.js', '2022-02-16 08:10:30'),
(164, 2, 'catalog/view/javascript/d_tinysort/jquery.tinysort.js', '2022-02-16 08:10:30'),
(165, 2, 'catalog/view/javascript/d_tinysort/jquery.tinysort.min.js', '2022-02-16 08:10:30'),
(166, 2, 'catalog/view/javascript/d_tinysort/tinysort.charorder.js', '2022-02-16 08:10:30'),
(167, 2, 'catalog/view/javascript/d_tinysort/tinysort.charorder.min.js', '2022-02-16 08:10:30'),
(168, 2, 'catalog/view/javascript/d_tinysort/tinysort.js', '2022-02-16 08:10:30'),
(169, 2, 'catalog/view/javascript/d_tinysort/tinysort.min.js', '2022-02-16 08:10:30'),
(170, 2, 'image/catalog/d_quickcheckout/payment/authorizenet_aim.png', '2022-02-16 08:10:30'),
(171, 2, 'image/catalog/d_quickcheckout/payment/bank_transfer.png', '2022-02-16 08:10:30'),
(172, 2, 'image/catalog/d_quickcheckout/payment/cheque.png', '2022-02-16 08:10:30'),
(173, 2, 'image/catalog/d_quickcheckout/payment/cod.png', '2022-02-16 08:10:30'),
(174, 2, 'image/catalog/d_quickcheckout/payment/liqpay.png', '2022-02-16 08:10:30'),
(175, 2, 'image/catalog/d_quickcheckout/payment/moneybookers.png', '2022-02-16 08:10:30'),
(176, 2, 'image/catalog/d_quickcheckout/payment/nochex.png', '2022-02-16 08:10:30'),
(177, 2, 'image/catalog/d_quickcheckout/payment/paymate.png', '2022-02-16 08:10:30'),
(178, 2, 'image/catalog/d_quickcheckout/payment/paypoint.png', '2022-02-16 08:10:30'),
(179, 2, 'image/catalog/d_quickcheckout/payment/payza.png', '2022-02-16 08:10:30'),
(180, 2, 'image/catalog/d_quickcheckout/payment/pp_express.png', '2022-02-16 08:10:30'),
(181, 2, 'image/catalog/d_quickcheckout/payment/pp_pro.png', '2022-02-16 08:10:30'),
(182, 2, 'image/catalog/d_quickcheckout/payment/pp_pro_uk.png', '2022-02-16 08:10:30'),
(183, 2, 'image/catalog/d_quickcheckout/payment/pp_standard.png', '2022-02-16 08:10:30'),
(184, 2, 'image/catalog/d_quickcheckout/payment/sagepay.png', '2022-02-16 08:10:30'),
(185, 2, 'image/catalog/d_quickcheckout/payment/sagepay_direct.png', '2022-02-16 08:10:30'),
(186, 2, 'image/catalog/d_quickcheckout/payment/sagepay_us.png', '2022-02-16 08:10:30'),
(187, 2, 'image/catalog/d_quickcheckout/payment/twocheckout.png', '2022-02-16 08:10:30'),
(188, 2, 'image/catalog/d_quickcheckout/payment/web_payment_software.png', '2022-02-16 08:10:30'),
(189, 2, 'image/catalog/d_quickcheckout/payment/worldpay.png', '2022-02-16 08:10:30'),
(190, 2, 'image/catalog/d_quickcheckout/svg-loaders/audio.svg', '2022-02-16 08:10:30'),
(191, 2, 'image/catalog/d_quickcheckout/svg-loaders/ball-triangle.svg', '2022-02-16 08:10:30'),
(192, 2, 'image/catalog/d_quickcheckout/svg-loaders/bars.svg', '2022-02-16 08:10:30'),
(193, 2, 'image/catalog/d_quickcheckout/svg-loaders/circles.svg', '2022-02-16 08:10:30'),
(194, 2, 'image/catalog/d_quickcheckout/svg-loaders/grid.svg', '2022-02-16 08:10:30'),
(195, 2, 'image/catalog/d_quickcheckout/svg-loaders/hearts.svg', '2022-02-16 08:10:30'),
(196, 2, 'image/catalog/d_quickcheckout/svg-loaders/oval.svg', '2022-02-16 08:10:30'),
(197, 2, 'image/catalog/d_quickcheckout/svg-loaders/puff.svg', '2022-02-16 08:10:30'),
(198, 2, 'image/catalog/d_quickcheckout/svg-loaders/rings.svg', '2022-02-16 08:10:30'),
(199, 2, 'image/catalog/d_quickcheckout/svg-loaders/spinning-circles.svg', '2022-02-16 08:10:30'),
(200, 2, 'image/catalog/d_quickcheckout/svg-loaders/tail-spin.svg', '2022-02-16 08:10:30'),
(201, 2, 'image/catalog/d_quickcheckout/svg-loaders/three-dots.svg', '2022-02-16 08:10:30'),
(202, 2, 'system/library/d_shopunity/extension/d_bootstrap_switch.json', '2022-02-16 08:10:30'),
(203, 2, 'system/library/d_shopunity/extension/d_opencart_patch.json', '2022-02-16 08:10:30'),
(204, 2, 'system/library/d_shopunity/extension/d_quickcheckout_lite.json', '2022-02-16 08:10:30'),
(205, 2, 'system/library/d_shopunity/extension/d_rubaxa_sortable.json', '2022-02-16 08:10:30'),
(206, 2, 'system/library/d_shopunity/extension/d_tinysort.json', '2022-02-16 08:10:30'),
(207, 2, 'system/library/d_shopunity/extension/d_twig_manager.json', '2022-02-16 08:10:30'),
(208, 2, 'system/library/d_shopunity/install/d_opencart_patch.xml', '2022-02-16 08:10:30'),
(209, 2, 'system/library/d_shopunity/install/d_quickcheckout.xml', '2022-02-16 08:10:30'),
(210, 2, 'system/library/d_shopunity/install/d_twig_manager.xml', '2022-02-16 08:10:30'),
(211, 2, 'system/library/d_shopunity/readme/d_opencart_patch.md', '2022-02-16 08:10:30'),
(212, 2, 'system/library/template/Twig/Extension', '2022-02-16 08:10:30'),
(213, 2, 'admin/language/en-gb/extension/module/d_quickcheckout.php', '2022-02-16 08:10:30'),
(214, 2, 'admin/language/en-gb/extension/module/d_quickcheckout_instruction.php', '2022-02-16 08:10:30'),
(215, 2, 'admin/view/javascript/d_bootstrap_switch/css/bootstrap-switch.css', '2022-02-16 08:10:30'),
(216, 2, 'admin/view/javascript/d_bootstrap_switch/css/bootstrap-switch.min.css', '2022-02-16 08:10:30'),
(217, 2, 'admin/view/javascript/d_bootstrap_switch/js/bootstrap-switch.js', '2022-02-16 08:10:30'),
(218, 2, 'admin/view/javascript/d_bootstrap_switch/js/bootstrap-switch.min.js', '2022-02-16 08:10:30'),
(219, 2, 'admin/view/javascript/d_quickcheckout/bootstrap-slider/css', '2022-02-16 08:10:30'),
(220, 2, 'admin/view/javascript/d_quickcheckout/bootstrap-slider/js', '2022-02-16 08:10:30'),
(221, 2, 'admin/view/javascript/d_quickcheckout/bootstrap-sortable/bootstrap-sortable.js', '2022-02-16 08:10:30'),
(222, 2, 'admin/view/javascript/d_quickcheckout/serializeObject/serializeObject.js', '2022-02-16 08:10:30'),
(223, 2, 'admin/view/template/extension/module/d_quickcheckout.twig', '2022-02-16 08:10:30'),
(224, 2, 'catalog/language/en-gb/extension/module/d_quickcheckout.php', '2022-02-16 08:10:30'),
(225, 2, 'catalog/view/javascript/d_bootstrap_switch/css/bootstrap-switch.css', '2022-02-16 08:10:30'),
(226, 2, 'catalog/view/javascript/d_bootstrap_switch/css/bootstrap-switch.min.css', '2022-02-16 08:10:30'),
(227, 2, 'catalog/view/javascript/d_bootstrap_switch/js/bootstrap-switch.js', '2022-02-16 08:10:30'),
(228, 2, 'catalog/view/javascript/d_bootstrap_switch/js/bootstrap-switch.min.js', '2022-02-16 08:10:30'),
(229, 2, 'catalog/view/javascript/d_quickcheckout/compress/d_quickcheckout.min.js', '2022-02-16 08:10:30'),
(230, 2, 'catalog/view/javascript/d_quickcheckout/engine/model.js', '2022-02-16 08:10:30'),
(231, 2, 'catalog/view/javascript/d_quickcheckout/engine/view.js', '2022-02-16 08:10:30'),
(232, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone', '2022-02-16 08:10:30'),
(233, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms', '2022-02-16 08:10:30'),
(234, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-nested', '2022-02-16 08:10:30'),
(235, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-maskedinput', '2022-02-16 08:10:30'),
(236, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate', '2022-02-16 08:10:30'),
(237, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat', '2022-02-16 08:10:30'),
(238, 2, 'catalog/view/javascript/d_quickcheckout/library/tinysort', '2022-02-16 08:10:30'),
(239, 2, 'catalog/view/javascript/d_quickcheckout/library/underscore', '2022-02-16 08:10:30'),
(240, 2, 'catalog/view/javascript/d_quickcheckout/model/_field.js', '2022-02-16 08:10:30'),
(241, 2, 'catalog/view/javascript/d_quickcheckout/model/cart.js', '2022-02-16 08:10:30'),
(242, 2, 'catalog/view/javascript/d_quickcheckout/model/confirm.js', '2022-02-16 08:10:30'),
(243, 2, 'catalog/view/javascript/d_quickcheckout/model/login.js', '2022-02-16 08:10:30'),
(244, 2, 'catalog/view/javascript/d_quickcheckout/model/payment.js', '2022-02-16 08:10:30'),
(245, 2, 'catalog/view/javascript/d_quickcheckout/model/payment_address.js', '2022-02-16 08:10:30'),
(246, 2, 'catalog/view/javascript/d_quickcheckout/model/payment_method.js', '2022-02-16 08:10:30'),
(247, 2, 'catalog/view/javascript/d_quickcheckout/model/shipping_address.js', '2022-02-16 08:10:30'),
(248, 2, 'catalog/view/javascript/d_quickcheckout/model/shipping_method.js', '2022-02-16 08:10:30'),
(249, 2, 'catalog/view/javascript/d_quickcheckout/view/cart.js', '2022-02-16 08:10:30'),
(250, 2, 'catalog/view/javascript/d_quickcheckout/view/confirm.js', '2022-02-16 08:10:30'),
(251, 2, 'catalog/view/javascript/d_quickcheckout/view/field.js', '2022-02-16 08:10:30'),
(252, 2, 'catalog/view/javascript/d_quickcheckout/view/login.js', '2022-02-16 08:10:30'),
(253, 2, 'catalog/view/javascript/d_quickcheckout/view/payment.js', '2022-02-16 08:10:30'),
(254, 2, 'catalog/view/javascript/d_quickcheckout/view/payment_address.js', '2022-02-16 08:10:30'),
(255, 2, 'catalog/view/javascript/d_quickcheckout/view/payment_method.js', '2022-02-16 08:10:30'),
(256, 2, 'catalog/view/javascript/d_quickcheckout/view/shipping_address.js', '2022-02-16 08:10:30'),
(257, 2, 'catalog/view/javascript/d_quickcheckout/view/shipping_method.js', '2022-02-16 08:10:30'),
(258, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout', '2022-02-16 08:10:30'),
(259, 2, 'catalog/view/theme/default/template/d_quickcheckout', '2022-02-16 08:10:30'),
(260, 2, 'catalog/view/theme/default/template/module', '2022-02-16 08:10:30'),
(261, 2, 'system/library/template/Twig/Extension/DTwigManager.php', '2022-02-16 08:10:30'),
(262, 2, 'admin/view/javascript/d_quickcheckout/bootstrap-slider/css/slider.css', '2022-02-16 08:10:30'),
(263, 2, 'admin/view/javascript/d_quickcheckout/bootstrap-slider/js/bootstrap-slider.js', '2022-02-16 08:10:30'),
(264, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone/backbone-min.js', '2022-02-16 08:10:30'),
(265, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone/backbone.epoxy.min.js', '2022-02-16 08:10:30'),
(266, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone/backbone.validation.min.js', '2022-02-16 08:10:30'),
(267, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/adapters', '2022-02-16 08:10:30'),
(268, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/backbone-forms.js', '2022-02-16 08:10:30'),
(269, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/backbone-forms.min.js', '2022-02-16 08:10:30'),
(270, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/editors', '2022-02-16 08:10:30'),
(271, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/templates', '2022-02-16 08:10:30'),
(272, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-nested/backbone-nested.js', '2022-02-16 08:10:30'),
(273, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-maskedinput/jquery.maskedinput.min.js', '2022-02-16 08:10:30'),
(274, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/additional-methods.js', '2022-02-16 08:10:30'),
(275, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/additional-methods.min.js', '2022-02-16 08:10:30'),
(276, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/jquery.validate.js', '2022-02-16 08:10:30'),
(277, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/jquery.validate.min.js', '2022-02-16 08:10:30'),
(278, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization', '2022-02-16 08:10:30'),
(279, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat/css', '2022-02-16 08:10:30'),
(280, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat/img', '2022-02-16 08:10:30'),
(281, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat/js', '2022-02-16 08:10:30'),
(282, 2, 'catalog/view/javascript/d_quickcheckout/library/tinysort/jquery.tinysort.min.js', '2022-02-16 08:10:30'),
(283, 2, 'catalog/view/javascript/d_quickcheckout/library/underscore/underscore-min.js', '2022-02-16 08:10:30'),
(284, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/bootstrap.css', '2022-02-16 08:10:30'),
(285, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/bootstrap.less', '2022-02-16 08:10:30'),
(286, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/d_quickcheckout.css', '2022-02-16 08:10:30'),
(287, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/d_quickcheckout.less', '2022-02-16 08:10:30'),
(288, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme', '2022-02-16 08:10:30'),
(289, 2, 'catalog/view/theme/default/template/checkout/d_quickcheckout.twig', '2022-02-16 08:10:30'),
(290, 2, 'catalog/view/theme/default/template/d_quickcheckout/cart.twig', '2022-02-16 08:10:30'),
(291, 2, 'catalog/view/theme/default/template/d_quickcheckout/confirm.twig', '2022-02-16 08:10:30'),
(292, 2, 'catalog/view/theme/default/template/d_quickcheckout/field.twig', '2022-02-16 08:10:30'),
(293, 2, 'catalog/view/theme/default/template/d_quickcheckout/login.twig', '2022-02-16 08:10:30'),
(294, 2, 'catalog/view/theme/default/template/d_quickcheckout/payment.twig', '2022-02-16 08:10:30'),
(295, 2, 'catalog/view/theme/default/template/d_quickcheckout/payment_address.twig', '2022-02-16 08:10:30'),
(296, 2, 'catalog/view/theme/default/template/d_quickcheckout/payment_method.twig', '2022-02-16 08:10:30'),
(297, 2, 'catalog/view/theme/default/template/d_quickcheckout/shipping_address.twig', '2022-02-16 08:10:30'),
(298, 2, 'catalog/view/theme/default/template/d_quickcheckout/shipping_method.twig', '2022-02-16 08:10:30'),
(299, 2, 'catalog/view/theme/default/template/module/d_quickcheckout.twig', '2022-02-16 08:10:30'),
(300, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/adapters/backbone.bootstrap-modal.js', '2022-02-16 08:10:30'),
(301, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/adapters/backbone.bootstrap-modal.min.js', '2022-02-16 08:10:30'),
(302, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/editors/list.js', '2022-02-16 08:10:30'),
(303, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/editors/list.min.js', '2022-02-16 08:10:30'),
(304, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/templates/bootstrap.css', '2022-02-16 08:10:30'),
(305, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/templates/bootstrap.js', '2022-02-16 08:10:30'),
(306, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/templates/bootstrap3.css', '2022-02-16 08:10:30'),
(307, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/templates/bootstrap3.js', '2022-02-16 08:10:30'),
(308, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/templates/old.css', '2022-02-16 08:10:30'),
(309, 2, 'catalog/view/javascript/d_quickcheckout/library/backbone-forms/templates/old.js', '2022-02-16 08:10:30'),
(310, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ar.js', '2022-02-16 08:10:30'),
(311, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ar.min.js', '2022-02-16 08:10:30'),
(312, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_bg.js', '2022-02-16 08:10:30'),
(313, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_bg.min.js', '2022-02-16 08:10:30'),
(314, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ca.js', '2022-02-16 08:10:30'),
(315, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ca.min.js', '2022-02-16 08:10:30'),
(316, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_cs.js', '2022-02-16 08:10:30'),
(317, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_cs.min.js', '2022-02-16 08:10:30'),
(318, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_da.js', '2022-02-16 08:10:30'),
(319, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_da.min.js', '2022-02-16 08:10:30'),
(320, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_de.js', '2022-02-16 08:10:30'),
(321, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_de.min.js', '2022-02-16 08:10:30'),
(322, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_el.js', '2022-02-16 08:10:30'),
(323, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_el.min.js', '2022-02-16 08:10:30'),
(324, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_es.js', '2022-02-16 08:10:30'),
(325, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_es.min.js', '2022-02-16 08:10:30'),
(326, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_es_AR.js', '2022-02-16 08:10:30'),
(327, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_es_AR.min.js', '2022-02-16 08:10:30'),
(328, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_et.js', '2022-02-16 08:10:30'),
(329, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_et.min.js', '2022-02-16 08:10:30'),
(330, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_eu.js', '2022-02-16 08:10:30'),
(331, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_eu.min.js', '2022-02-16 08:10:30'),
(332, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_fa.js', '2022-02-16 08:10:30'),
(333, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_fa.min.js', '2022-02-16 08:10:30'),
(334, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_fi.js', '2022-02-16 08:10:30'),
(335, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_fi.min.js', '2022-02-16 08:10:30'),
(336, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_fr.js', '2022-02-16 08:10:30'),
(337, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_fr.min.js', '2022-02-16 08:10:30'),
(338, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_gl.js', '2022-02-16 08:10:30'),
(339, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_gl.min.js', '2022-02-16 08:10:30'),
(340, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_he.js', '2022-02-16 08:10:30'),
(341, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_he.min.js', '2022-02-16 08:10:30'),
(342, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_hr.js', '2022-02-16 08:10:30'),
(343, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_hr.min.js', '2022-02-16 08:10:30'),
(344, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_hu.js', '2022-02-16 08:10:30'),
(345, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_hu.min.js', '2022-02-16 08:10:30'),
(346, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_id.js', '2022-02-16 08:10:30'),
(347, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_id.min.js', '2022-02-16 08:10:30'),
(348, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_is.js', '2022-02-16 08:10:30'),
(349, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_is.min.js', '2022-02-16 08:10:30'),
(350, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_it.js', '2022-02-16 08:10:30'),
(351, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_it.min.js', '2022-02-16 08:10:30'),
(352, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ja.js', '2022-02-16 08:10:30'),
(353, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ja.min.js', '2022-02-16 08:10:30'),
(354, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ka.js', '2022-02-16 08:10:30'),
(355, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ka.min.js', '2022-02-16 08:10:30'),
(356, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_kk.js', '2022-02-16 08:10:30'),
(357, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_kk.min.js', '2022-02-16 08:10:30'),
(358, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ko.js', '2022-02-16 08:10:30'),
(359, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ko.min.js', '2022-02-16 08:10:30'),
(360, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_lt.js', '2022-02-16 08:10:30'),
(361, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_lt.min.js', '2022-02-16 08:10:30'),
(362, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_lv.js', '2022-02-16 08:10:30'),
(363, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_lv.min.js', '2022-02-16 08:10:30'),
(364, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_my.js', '2022-02-16 08:10:30'),
(365, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_my.min.js', '2022-02-16 08:10:30'),
(366, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_nl.js', '2022-02-16 08:10:30'),
(367, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_nl.min.js', '2022-02-16 08:10:30'),
(368, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_no.js', '2022-02-16 08:10:30'),
(369, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_no.min.js', '2022-02-16 08:10:30'),
(370, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_pl.js', '2022-02-16 08:10:30'),
(371, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_pl.min.js', '2022-02-16 08:10:30'),
(372, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_pt_BR.js', '2022-02-16 08:10:30'),
(373, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_pt_BR.min.js', '2022-02-16 08:10:30'),
(374, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_pt_PT.js', '2022-02-16 08:10:30'),
(375, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_pt_PT.min.js', '2022-02-16 08:10:30'),
(376, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ro.js', '2022-02-16 08:10:30'),
(377, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ro.min.js', '2022-02-16 08:10:30'),
(378, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ru.js', '2022-02-16 08:10:30'),
(379, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_ru.min.js', '2022-02-16 08:10:30'),
(380, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_si.js', '2022-02-16 08:10:30'),
(381, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_si.min.js', '2022-02-16 08:10:30'),
(382, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_sk.js', '2022-02-16 08:10:30'),
(383, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_sk.min.js', '2022-02-16 08:10:30'),
(384, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_sl.js', '2022-02-16 08:10:30'),
(385, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_sl.min.js', '2022-02-16 08:10:30'),
(386, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_sr.js', '2022-02-16 08:10:30'),
(387, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_sr.min.js', '2022-02-16 08:10:30'),
(388, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_sr_lat.js', '2022-02-16 08:10:30'),
(389, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_sr_lat.min.js', '2022-02-16 08:10:30'),
(390, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_sv.js', '2022-02-16 08:10:30'),
(391, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_sv.min.js', '2022-02-16 08:10:30'),
(392, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_th.js', '2022-02-16 08:10:30'),
(393, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_th.min.js', '2022-02-16 08:10:30'),
(394, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_tj.js', '2022-02-16 08:10:30'),
(395, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_tj.min.js', '2022-02-16 08:10:30'),
(396, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_tr.js', '2022-02-16 08:10:30'),
(397, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_tr.min.js', '2022-02-16 08:10:30'),
(398, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_uk.js', '2022-02-16 08:10:30'),
(399, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_uk.min.js', '2022-02-16 08:10:30'),
(400, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_vi.js', '2022-02-16 08:10:30'),
(401, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_vi.min.js', '2022-02-16 08:10:30'),
(402, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_zh.js', '2022-02-16 08:10:30'),
(403, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_zh.min.js', '2022-02-16 08:10:30'),
(404, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_zh_TW.js', '2022-02-16 08:10:30'),
(405, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/messages_zh_TW.min.js', '2022-02-16 08:10:30'),
(406, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/methods_de.js', '2022-02-16 08:10:30'),
(407, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/methods_de.min.js', '2022-02-16 08:10:30'),
(408, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/methods_es_CL.js', '2022-02-16 08:10:30'),
(409, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/methods_es_CL.min.js', '2022-02-16 08:10:30'),
(410, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/methods_fi.js', '2022-02-16 08:10:30'),
(411, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/methods_fi.min.js', '2022-02-16 08:10:30'),
(412, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/methods_nl.js', '2022-02-16 08:10:30'),
(413, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/methods_nl.min.js', '2022-02-16 08:10:30'),
(414, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/methods_pt.js', '2022-02-16 08:10:30'),
(415, 2, 'catalog/view/javascript/d_quickcheckout/library/jquery-validate/localization/methods_pt.min.js', '2022-02-16 08:10:30'),
(416, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat/css/demo.css', '2022-02-16 08:10:30'),
(417, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat/css/intlTelInput.css', '2022-02-16 08:10:30'),
(418, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat/img/flags.png', '2022-02-16 08:10:30'),
(419, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat/img/flags@2x.png', '2022-02-16 08:10:30'),
(420, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat/js/intlTelInput.js', '2022-02-16 08:10:30'),
(421, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat/js/intlTelInput.min.js', '2022-02-16 08:10:30'),
(422, 2, 'catalog/view/javascript/d_quickcheckout/library/phoneformat/js/utils.js', '2022-02-16 08:10:30'),
(423, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/BurnEngine.css', '2022-02-16 08:10:30'),
(424, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/blue.css', '2022-02-16 08:10:30'),
(425, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/blue.less', '2022-02-16 08:10:30'),
(426, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/dark.css', '2022-02-16 08:10:30'),
(427, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/dark.less', '2022-02-16 08:10:30'),
(428, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/default.css', '2022-02-16 08:10:30'),
(429, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/green.css', '2022-02-16 08:10:30'),
(430, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/green.less', '2022-02-16 08:10:30'),
(431, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/journal.css', '2022-02-16 08:10:30'),
(432, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/journal.less', '2022-02-16 08:10:30'),
(433, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/red.css', '2022-02-16 08:10:30'),
(434, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/red.less', '2022-02-16 08:10:30'),
(435, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/seablue.css', '2022-02-16 08:10:30'),
(436, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/seablue.less', '2022-02-16 08:10:30'),
(437, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/yellow.css', '2022-02-16 08:10:30'),
(438, 2, 'catalog/view/theme/default/stylesheet/d_quickcheckout/theme/yellow.less', '2022-02-16 08:10:30'),
(439, 5, 'admin/model/common', '2022-02-17 22:01:22'),
(440, 5, 'admin/controller/common/newsletter.php', '2022-02-17 22:01:22'),
(441, 5, 'admin/model/common/newsletter.php', '2022-02-17 22:01:22'),
(442, 5, 'admin/controller/extension/module/newsletter.php', '2022-02-17 22:01:22'),
(443, 5, 'admin/model/extension/module/newsletter.php', '2022-02-17 22:01:22'),
(444, 5, 'admin/view/template/common/newsletter.twig', '2022-02-17 22:01:22'),
(445, 5, 'catalog/controller/extension/module/newsletter.php', '2022-02-17 22:01:22'),
(446, 5, 'catalog/model/extension/module/newsletter.php', '2022-02-17 22:01:22'),
(447, 5, 'catalog/view/javascript/jquery/jquery.cookie.js', '2022-02-17 22:01:22'),
(448, 5, 'admin/language/en-gb/extension/module/newsletter.php', '2022-02-17 22:01:22'),
(449, 5, 'admin/language/ru-ru/extension/module/newsletter.php', '2022-02-17 22:01:22'),
(450, 5, 'admin/view/template/extension/module/newsletter.twig', '2022-02-17 22:01:22'),
(451, 5, 'catalog/language/en-gb/extension/module/newsletter.php', '2022-02-17 22:01:22'),
(452, 5, 'catalog/language/ru-ru/extension/module/newsletter.php', '2022-02-17 22:01:22'),
(453, 5, 'catalog/view/theme/default/stylesheet/newsletter.css', '2022-02-17 22:01:22'),
(454, 5, 'catalog/view/theme/default/template/extension/module/newsletter.twig', '2022-02-17 22:01:22'),
(1564, 9, 'admin/language/uk-ua/localisation/currency.php', '2022-02-19 19:43:24'),
(1565, 9, 'admin/language/uk-ua/localisation/geo_zone.php', '2022-02-19 19:43:24'),
(1566, 9, 'admin/language/uk-ua/localisation/language.php', '2022-02-19 19:43:24'),
(1567, 9, 'admin/language/uk-ua/localisation/length_class.php', '2022-02-19 19:43:24'),
(1568, 9, 'admin/language/uk-ua/localisation/location.php', '2022-02-19 19:43:24'),
(1569, 9, 'admin/language/uk-ua/localisation/order_status.php', '2022-02-19 19:43:24'),
(1570, 9, 'admin/language/uk-ua/localisation/return_action.php', '2022-02-19 19:43:24'),
(1571, 9, 'admin/language/uk-ua/localisation/return_reason.php', '2022-02-19 19:43:24'),
(1572, 9, 'admin/language/uk-ua/localisation/return_status.php', '2022-02-19 19:43:24'),
(1573, 9, 'admin/language/uk-ua/localisation/stock_status.php', '2022-02-19 19:43:24'),
(1574, 9, 'admin/language/uk-ua/localisation/tax_class.php', '2022-02-19 19:43:24'),
(1575, 9, 'admin/language/uk-ua/localisation/tax_rate.php', '2022-02-19 19:43:24'),
(1576, 9, 'admin/language/uk-ua/localisation/weight_class.php', '2022-02-19 19:43:24'),
(1577, 9, 'admin/language/uk-ua/localisation/zone.php', '2022-02-19 19:43:24'),
(1578, 9, 'admin/language/uk-ua/mail/affiliate.php', '2022-02-19 19:43:24'),
(1579, 9, 'admin/language/uk-ua/mail/customer.php', '2022-02-19 19:43:24'),
(1580, 9, 'admin/language/uk-ua/mail/forgotten.php', '2022-02-19 19:43:24'),
(1581, 9, 'admin/language/uk-ua/mail/return.php', '2022-02-19 19:43:24'),
(1582, 9, 'admin/language/uk-ua/mail/voucher.php', '2022-02-19 19:43:24'),
(1583, 9, 'admin/language/uk-ua/marketing/affiliate.php', '2022-02-19 19:43:24'),
(1584, 9, 'admin/language/uk-ua/marketing/contact.php', '2022-02-19 19:43:24'),
(1585, 9, 'admin/language/uk-ua/marketing/coupon.php', '2022-02-19 19:43:24'),
(1586, 9, 'admin/language/uk-ua/marketing/marketing.php', '2022-02-19 19:43:24'),
(1587, 9, 'admin/language/uk-ua/report/affiliate.php', '2022-02-19 19:43:24'),
(1588, 9, 'admin/language/uk-ua/report/affiliate_activity.php', '2022-02-19 19:43:24'),
(1589, 9, 'admin/language/uk-ua/report/customer_activity.php', '2022-02-19 19:43:24'),
(1590, 9, 'admin/language/uk-ua/report/customer_credit.php', '2022-02-19 19:43:24'),
(1591, 9, 'admin/language/uk-ua/report/customer_online.php', '2022-02-19 19:43:24'),
(1592, 9, 'admin/language/uk-ua/report/customer_order.php', '2022-02-19 19:43:24'),
(1593, 9, 'admin/language/uk-ua/report/customer_reward.php', '2022-02-19 19:43:24'),
(1594, 9, 'admin/language/uk-ua/report/customer_search.php', '2022-02-19 19:43:25'),
(1595, 9, 'admin/language/uk-ua/report/marketing.php', '2022-02-19 19:43:25'),
(1596, 9, 'admin/language/uk-ua/report/product_purchased.php', '2022-02-19 19:43:25'),
(1597, 9, 'admin/language/uk-ua/report/product_viewed.php', '2022-02-19 19:43:25'),
(1598, 9, 'admin/language/uk-ua/report/sale_coupon.php', '2022-02-19 19:43:25'),
(1599, 9, 'admin/language/uk-ua/report/sale_order.php', '2022-02-19 19:43:25'),
(1600, 9, 'admin/language/uk-ua/report/sale_return.php', '2022-02-19 19:43:25'),
(1601, 9, 'admin/language/uk-ua/report/sale_shipping.php', '2022-02-19 19:43:25'),
(1602, 9, 'admin/language/uk-ua/report/sale_tax.php', '2022-02-19 19:43:25'),
(1603, 9, 'admin/language/uk-ua/sale/order.php', '2022-02-19 19:43:25'),
(1604, 9, 'admin/language/uk-ua/sale/recurring.php', '2022-02-19 19:43:25'),
(1605, 9, 'admin/language/uk-ua/sale/return.php', '2022-02-19 19:43:25'),
(1606, 9, 'admin/language/uk-ua/sale/voucher.php', '2022-02-19 19:43:25'),
(1607, 9, 'admin/language/uk-ua/sale/voucher_theme.php', '2022-02-19 19:43:25'),
(1608, 9, 'admin/language/uk-ua/setting/setting.php', '2022-02-19 19:43:25'),
(1609, 9, 'admin/language/uk-ua/setting/store.php', '2022-02-19 19:43:25'),
(1610, 9, 'admin/language/uk-ua/tool/backup.php', '2022-02-19 19:43:25'),
(1611, 9, 'admin/language/uk-ua/tool/log.php', '2022-02-19 19:43:25'),
(1612, 9, 'admin/language/uk-ua/tool/upload.php', '2022-02-19 19:43:25'),
(1613, 9, 'admin/language/uk-ua/user/api.php', '2022-02-19 19:43:25'),
(1614, 9, 'admin/language/uk-ua/user/user.php', '2022-02-19 19:43:25'),
(1615, 9, 'admin/language/uk-ua/user/user_group.php', '2022-02-19 19:43:25');
INSERT INTO `oc_extension_path` (`extension_path_id`, `extension_install_id`, `path`, `date_added`) VALUES
(1616, 9, 'catalog/language/uk-ua/account/account.php', '2022-02-19 19:43:25'),
(1617, 9, 'catalog/language/uk-ua/account/address.php', '2022-02-19 19:43:25'),
(1618, 9, 'catalog/language/uk-ua/account/download.php', '2022-02-19 19:43:25'),
(1619, 9, 'catalog/language/uk-ua/account/edit.php', '2022-02-19 19:43:25'),
(1620, 9, 'catalog/language/uk-ua/account/forgotten.php', '2022-02-19 19:43:25'),
(1621, 9, 'catalog/language/uk-ua/account/login.php', '2022-02-19 19:43:25'),
(516, 7, 'admin/language/english', '2022-02-19 16:25:25'),
(517, 7, 'catalog/language/english', '2022-02-19 16:25:25'),
(518, 7, 'image/catalog/d_seo_module', '2022-02-19 16:25:25'),
(519, 7, 'system/config/d_ajax_filter', '2022-02-19 16:25:25'),
(520, 7, 'system/config/d_ajax_filter.php', '2022-02-19 16:25:25'),
(1490, 9, 'admin/language/uk-ua/catalog', '2022-02-19 19:43:24'),
(522, 7, 'system/config/d_ajax_filter_translit.php', '2022-02-19 16:25:25'),
(523, 7, 'system/config/d_event_manager.php', '2022-02-19 16:25:25'),
(524, 7, 'system/config/d_seo_module.php', '2022-02-19 16:25:25'),
(525, 7, 'system/config/d_seo_module_target_keyword.php', '2022-02-19 16:25:25'),
(526, 7, 'system/library/d_elfinder', '2022-02-19 16:25:25'),
(527, 7, 'system/library/d_excel_reader_writer', '2022-02-19 16:25:25'),
(528, 7, 'system/library/d_excel_reader_writer.php', '2022-02-19 16:25:25'),
(529, 7, 'system/library/d_robots_txt_parser', '2022-02-19 16:25:25'),
(530, 7, 'system/library/d_robots_txt_parser.php', '2022-02-19 16:25:25'),
(531, 7, 'system/library/d_simple_html_dom.php', '2022-02-19 16:25:25'),
(532, 7, 'admin/controller/extension/d_ajax_filter', '2022-02-19 16:25:25'),
(533, 7, 'admin/controller/extension/d_ajax_filter_module', '2022-02-19 16:25:25'),
(1491, 9, 'admin/language/uk-ua/common', '2022-02-19 19:43:24'),
(535, 7, 'admin/controller/extension/d_elfinder', '2022-02-19 16:25:25'),
(536, 7, 'admin/controller/extension/d_seo_module', '2022-02-19 16:25:25'),
(537, 7, 'admin/controller/extension/d_seo_module_adviser', '2022-02-19 16:25:25'),
(538, 7, 'admin/controller/extension/d_seo_module_ajax_filter', '2022-02-19 16:25:25'),
(539, 7, 'admin/controller/extension/d_seo_module_manager', '2022-02-19 16:25:25'),
(540, 7, 'admin/controller/extension/d_seo_module_meta', '2022-02-19 16:25:25'),
(541, 7, 'admin/controller/extension/d_seo_module_meta_title', '2022-02-19 16:25:25'),
(542, 7, 'admin/controller/extension/d_seo_module_target_keyword', '2022-02-19 16:25:25'),
(543, 7, 'admin/controller/extension/d_seo_module_url', '2022-02-19 16:25:25'),
(544, 7, 'admin/controller/extension/d_seo_module_url_keyword', '2022-02-19 16:25:25'),
(545, 7, 'admin/language/english/extension', '2022-02-19 16:25:25'),
(546, 7, 'admin/model/extension/d_ajax_filter', '2022-02-19 16:25:25'),
(547, 7, 'admin/model/extension/d_ajax_filter_module', '2022-02-19 16:25:25'),
(1492, 9, 'admin/language/uk-ua/customer', '2022-02-19 19:43:24'),
(549, 7, 'admin/model/extension/d_seo_module', '2022-02-19 16:25:25'),
(550, 7, 'admin/model/extension/d_seo_module_adviser', '2022-02-19 16:25:25'),
(551, 7, 'admin/model/extension/d_seo_module_ajax_filter', '2022-02-19 16:25:25'),
(552, 7, 'admin/model/extension/d_seo_module_manager', '2022-02-19 16:25:25'),
(553, 7, 'admin/model/extension/d_seo_module_meta', '2022-02-19 16:25:25'),
(554, 7, 'admin/model/extension/d_seo_module_meta_title', '2022-02-19 16:25:25'),
(555, 7, 'admin/model/extension/d_seo_module_target_keyword', '2022-02-19 16:25:25'),
(556, 7, 'admin/model/extension/d_seo_module_url', '2022-02-19 16:25:25'),
(557, 7, 'admin/model/extension/d_seo_module_url_keyword', '2022-02-19 16:25:25'),
(558, 7, 'admin/view/image/d_elfinder', '2022-02-19 16:25:25'),
(559, 7, 'admin/view/javascript/d_ajax_filter', '2022-02-19 16:25:25'),
(560, 7, 'admin/view/javascript/d_bootstrap_rating', '2022-02-19 16:25:25'),
(561, 7, 'admin/view/javascript/d_elfinder', '2022-02-19 16:25:25'),
(562, 7, 'admin/view/javascript/d_riot', '2022-02-19 16:25:25'),
(563, 7, 'admin/view/stylesheet/d_ajax_filter', '2022-02-19 16:25:25'),
(1493, 9, 'admin/language/uk-ua/design', '2022-02-19 19:43:24'),
(565, 7, 'admin/view/stylesheet/d_bootstrap_extra', '2022-02-19 16:25:25'),
(566, 7, 'admin/view/stylesheet/d_elfinder', '2022-02-19 16:25:25'),
(567, 7, 'admin/view/stylesheet/d_seo_module.css', '2022-02-19 16:25:25'),
(568, 7, 'admin/view/stylesheet/d_seo_module_target_keyword.css', '2022-02-19 16:25:25'),
(569, 7, 'catalog/controller/extension/d_ajax_filter', '2022-02-19 16:25:25'),
(570, 7, 'catalog/controller/extension/d_seo_module', '2022-02-19 16:25:25'),
(571, 7, 'catalog/controller/extension/d_seo_module_adviser', '2022-02-19 16:25:25'),
(572, 7, 'catalog/controller/extension/d_toolbar', '2022-02-19 16:25:25'),
(573, 7, 'catalog/controller/extension/event', '2022-02-19 16:25:25'),
(574, 7, 'catalog/language/english/extension', '2022-02-19 16:25:25'),
(575, 7, 'catalog/model/extension/d_ajax_filter', '2022-02-19 16:25:25'),
(576, 7, 'catalog/model/extension/d_seo_module', '2022-02-19 16:25:25'),
(577, 7, 'catalog/model/extension/d_seo_module_adviser', '2022-02-19 16:25:25'),
(578, 7, 'catalog/model/extension/d_toolbar', '2022-02-19 16:25:25'),
(579, 7, 'catalog/view/javascript/d_ajax_filter', '2022-02-19 16:25:25'),
(580, 7, 'catalog/view/javascript/d_bootstrap_rating', '2022-02-19 16:25:25'),
(581, 7, 'catalog/view/javascript/d_riot', '2022-02-19 16:25:25'),
(582, 7, 'image/catalog/d_seo_module/background.svg', '2022-02-19 16:25:25'),
(583, 7, 'image/catalog/d_seo_module/feature', '2022-02-19 16:25:25'),
(584, 7, 'image/catalog/d_seo_module/logo.svg', '2022-02-19 16:25:25'),
(585, 7, 'image/catalog/d_seo_module/planet.svg', '2022-02-19 16:25:25'),
(586, 7, 'system/config/d_ajax_filter/attribute.php', '2022-02-19 16:25:25'),
(587, 7, 'system/config/d_ajax_filter/category.php', '2022-02-19 16:25:25'),
(588, 7, 'system/config/d_ajax_filter/ean.php', '2022-02-19 16:25:25'),
(589, 7, 'system/config/d_ajax_filter/filter.php', '2022-02-19 16:25:25'),
(590, 7, 'system/config/d_ajax_filter/manufacturer.php', '2022-02-19 16:25:25'),
(591, 7, 'system/config/d_ajax_filter/option.php', '2022-02-19 16:25:25'),
(592, 7, 'system/config/d_ajax_filter/price.php', '2022-02-19 16:25:25'),
(593, 7, 'system/config/d_ajax_filter/rating.php', '2022-02-19 16:25:25'),
(594, 7, 'system/config/d_ajax_filter/search.php', '2022-02-19 16:25:25'),
(595, 7, 'system/config/d_ajax_filter/stock_status.php', '2022-02-19 16:25:25'),
(596, 7, 'system/config/d_ajax_filter/tag.php', '2022-02-19 16:25:25'),
(597, 7, 'system/library/d_elfinder/MySQLStorage.sql', '2022-02-19 16:25:25'),
(598, 7, 'system/library/d_elfinder/chars-test.php', '2022-02-19 16:25:25'),
(599, 7, 'system/library/d_elfinder/connector.minimal.php', '2022-02-19 16:25:25'),
(600, 7, 'system/library/d_elfinder/connector.php', '2022-02-19 16:25:25'),
(601, 7, 'system/library/d_elfinder/elFinder.class.php', '2022-02-19 16:25:25'),
(602, 7, 'system/library/d_elfinder/elFinderConnector.class.php', '2022-02-19 16:25:25'),
(603, 7, 'system/library/d_elfinder/elFinderVolumeDriver.class.php', '2022-02-19 16:25:25'),
(604, 7, 'system/library/d_elfinder/elFinderVolumeFTP.class.php', '2022-02-19 16:25:25'),
(605, 7, 'system/library/d_elfinder/elFinderVolumeLocalFileSystem.class.php', '2022-02-19 16:25:25'),
(606, 7, 'system/library/d_elfinder/elFinderVolumeMySQL.class.php', '2022-02-19 16:25:25'),
(607, 7, 'system/library/d_elfinder/jquery', '2022-02-19 16:25:25'),
(608, 7, 'system/library/d_elfinder/mime.types', '2022-02-19 16:25:25'),
(609, 7, 'system/library/d_elfinder/sounds', '2022-02-19 16:25:25'),
(610, 7, 'system/library/d_excel_reader_writer/spreadsheetreader', '2022-02-19 16:25:25'),
(611, 7, 'system/library/d_excel_reader_writer/spreadsheetreader.php', '2022-02-19 16:25:25'),
(612, 7, 'system/library/d_excel_reader_writer/xlsxwriter.php', '2022-02-19 16:25:25'),
(613, 7, 'system/library/d_robots_txt_parser/robotstxtparser.php', '2022-02-19 16:25:25'),
(614, 7, 'system/library/d_robots_txt_parser/robotstxtvalidator.php', '2022-02-19 16:25:25'),
(615, 7, 'admin/controller/extension/d_ajax_filter/attribute.php', '2022-02-19 16:25:25'),
(616, 7, 'admin/controller/extension/d_ajax_filter/cache.php', '2022-02-19 16:25:25'),
(617, 7, 'admin/controller/extension/d_ajax_filter/filter.php', '2022-02-19 16:25:25'),
(618, 7, 'admin/controller/extension/d_ajax_filter/layout.php', '2022-02-19 16:25:25'),
(619, 7, 'admin/controller/extension/d_ajax_filter/option.php', '2022-02-19 16:25:25'),
(620, 7, 'admin/controller/extension/d_ajax_filter/setting.php', '2022-02-19 16:25:25'),
(621, 7, 'admin/controller/extension/d_ajax_filter_module/attribute.php', '2022-02-19 16:25:25'),
(622, 7, 'admin/controller/extension/d_ajax_filter_module/ean.php', '2022-02-19 16:25:25'),
(623, 7, 'admin/controller/extension/d_ajax_filter_module/filter.php', '2022-02-19 16:25:25'),
(624, 7, 'admin/controller/extension/d_ajax_filter_module/option.php', '2022-02-19 16:25:25'),
(625, 7, 'admin/controller/extension/d_ajax_filter_module/tag.php', '2022-02-19 16:25:25'),
(1494, 9, 'admin/language/uk-ua/error', '2022-02-19 19:43:24'),
(1495, 9, 'admin/language/uk-ua/localisation', '2022-02-19 19:43:24'),
(628, 7, 'admin/controller/extension/d_elfinder/d_elfinder.php', '2022-02-19 16:25:25'),
(1496, 9, 'admin/language/uk-ua/mail', '2022-02-19 19:43:24'),
(630, 7, 'admin/controller/extension/d_seo_module/d_seo_module.php', '2022-02-19 16:25:25'),
(1497, 9, 'admin/language/uk-ua/marketing', '2022-02-19 19:43:24'),
(632, 7, 'admin/controller/extension/d_seo_module_adviser/d_seo_module.php', '2022-02-19 16:25:25'),
(1498, 9, 'admin/language/uk-ua/report', '2022-02-19 19:43:24'),
(1499, 9, 'admin/language/uk-ua/sale', '2022-02-19 19:43:24'),
(1500, 9, 'admin/language/uk-ua/setting', '2022-02-19 19:43:24'),
(635, 7, 'admin/controller/extension/d_seo_module_manager/d_seo_module.php', '2022-02-19 16:25:25'),
(1501, 9, 'admin/language/uk-ua/tool', '2022-02-19 19:43:24'),
(1502, 9, 'admin/language/uk-ua/uk-ua.php', '2022-02-19 19:43:24'),
(1503, 9, 'admin/language/uk-ua/uk-ua.png', '2022-02-19 19:43:24'),
(1504, 9, 'admin/language/uk-ua/user', '2022-02-19 19:43:24'),
(639, 7, 'admin/controller/extension/d_seo_module_target_keyword/d_seo_module_target_keyword.php', '2022-02-19 16:25:25'),
(1505, 9, 'catalog/language/uk-ua/account', '2022-02-19 19:43:24'),
(1506, 9, 'catalog/language/uk-ua/affiliate', '2022-02-19 19:43:24'),
(1507, 9, 'catalog/language/uk-ua/api', '2022-02-19 19:43:24'),
(642, 7, 'admin/controller/extension/dashboard/d_seo_module_target_keyword.php', '2022-02-19 16:25:25'),
(643, 7, 'admin/controller/extension/module/d_ajax_filter.php', '2022-02-19 16:25:25'),
(1508, 9, 'catalog/language/uk-ua/checkout', '2022-02-19 19:43:24'),
(645, 7, 'admin/controller/extension/module/d_seo_module.php', '2022-02-19 16:25:25'),
(646, 7, 'admin/language/en-gb/extension/d_ajax_filter', '2022-02-19 16:25:25'),
(1509, 9, 'catalog/language/uk-ua/common', '2022-02-19 19:43:24'),
(648, 7, 'admin/language/en-gb/extension/d_seo_module', '2022-02-19 16:25:25'),
(649, 7, 'admin/language/en-gb/extension/d_seo_module_adviser', '2022-02-19 16:25:25'),
(650, 7, 'admin/language/en-gb/extension/d_seo_module_manager', '2022-02-19 16:25:25'),
(651, 7, 'admin/language/en-gb/extension/d_seo_module_meta', '2022-02-19 16:25:25'),
(652, 7, 'admin/language/en-gb/extension/d_seo_module_url', '2022-02-19 16:25:25'),
(653, 7, 'admin/language/english/extension/d_ajax_filter', '2022-02-19 16:25:25'),
(1510, 9, 'catalog/language/uk-ua/error', '2022-02-19 19:43:24'),
(655, 7, 'admin/language/english/extension/d_seo_module', '2022-02-19 16:25:25'),
(656, 7, 'admin/language/english/extension/d_seo_module_adviser', '2022-02-19 16:25:25'),
(657, 7, 'admin/language/english/extension/d_seo_module_manager', '2022-02-19 16:25:25'),
(658, 7, 'admin/language/english/extension/d_seo_module_meta', '2022-02-19 16:25:25'),
(659, 7, 'admin/language/english/extension/d_seo_module_url', '2022-02-19 16:25:25'),
(660, 7, 'admin/language/english/extension/module', '2022-02-19 16:25:25'),
(661, 7, 'admin/model/extension/d_ajax_filter/attribute.php', '2022-02-19 16:25:25'),
(662, 7, 'admin/model/extension/d_ajax_filter/cache.php', '2022-02-19 16:25:25'),
(663, 7, 'admin/model/extension/d_ajax_filter/filter.php', '2022-02-19 16:25:25'),
(664, 7, 'admin/model/extension/d_ajax_filter/layout.php', '2022-02-19 16:25:25'),
(665, 7, 'admin/model/extension/d_ajax_filter/option.php', '2022-02-19 16:25:25'),
(666, 7, 'admin/model/extension/d_ajax_filter_module/attribute.php', '2022-02-19 16:25:25'),
(667, 7, 'admin/model/extension/d_ajax_filter_module/ean.php', '2022-02-19 16:25:25'),
(668, 7, 'admin/model/extension/d_ajax_filter_module/filter.php', '2022-02-19 16:25:25'),
(669, 7, 'admin/model/extension/d_ajax_filter_module/option.php', '2022-02-19 16:25:25'),
(670, 7, 'admin/model/extension/d_ajax_filter_module/tag.php', '2022-02-19 16:25:25'),
(1511, 9, 'catalog/language/uk-ua/information', '2022-02-19 19:43:24'),
(1512, 9, 'catalog/language/uk-ua/mail', '2022-02-19 19:43:24'),
(673, 7, 'admin/model/extension/d_opencart_patch/event.php', '2022-02-19 16:25:25'),
(674, 7, 'admin/model/extension/d_opencart_patch/extension.php', '2022-02-19 16:25:25'),
(675, 7, 'admin/model/extension/d_opencart_patch/load.php', '2022-02-19 16:25:25'),
(676, 7, 'admin/model/extension/d_opencart_patch/modification.php', '2022-02-19 16:25:25'),
(677, 7, 'admin/model/extension/d_opencart_patch/module.php', '2022-02-19 16:25:25'),
(678, 7, 'admin/model/extension/d_opencart_patch/setting.php', '2022-02-19 16:25:25'),
(679, 7, 'admin/model/extension/d_opencart_patch/store.php', '2022-02-19 16:25:25'),
(680, 7, 'admin/model/extension/d_opencart_patch/url.php', '2022-02-19 16:25:25'),
(681, 7, 'admin/model/extension/d_opencart_patch/user.php', '2022-02-19 16:25:25'),
(682, 7, 'admin/model/extension/d_opencart_patch/vqmod.php', '2022-02-19 16:25:25'),
(1513, 9, 'catalog/language/uk-ua/product', '2022-02-19 19:43:24'),
(684, 7, 'admin/model/extension/d_seo_module/d_seo_module.php', '2022-02-19 16:25:25'),
(1514, 9, 'catalog/language/uk-ua/tool', '2022-02-19 19:43:24'),
(686, 7, 'admin/model/extension/d_seo_module_adviser/d_seo_module.php', '2022-02-19 16:25:25'),
(1515, 9, 'catalog/language/uk-ua/uk-ua.php', '2022-02-19 19:43:24'),
(1516, 9, 'catalog/language/uk-ua/uk-ua.png', '2022-02-19 19:43:24'),
(1517, 9, 'admin/language/uk-ua/catalog/attribute.php', '2022-02-19 19:43:24'),
(689, 7, 'admin/model/extension/d_seo_module_manager/d_seo_module.php', '2022-02-19 16:25:25'),
(1518, 9, 'admin/language/uk-ua/catalog/attribute_group.php', '2022-02-19 19:43:24'),
(1519, 9, 'admin/language/uk-ua/catalog/category.php', '2022-02-19 19:43:24'),
(1520, 9, 'admin/language/uk-ua/catalog/download.php', '2022-02-19 19:43:24'),
(693, 7, 'admin/model/extension/d_seo_module_target_keyword/d_seo_module_target_keyword.php', '2022-02-19 16:25:25'),
(1521, 9, 'admin/language/uk-ua/catalog/filter.php', '2022-02-19 19:43:24'),
(1522, 9, 'admin/language/uk-ua/catalog/information.php', '2022-02-19 19:43:24'),
(696, 7, 'admin/model/extension/dashboard/d_seo_module_target_keyword.php', '2022-02-19 16:25:25'),
(697, 7, 'admin/model/extension/module/d_ajax_filter.php', '2022-02-19 16:25:25'),
(1523, 9, 'admin/language/uk-ua/catalog/manufacturer.php', '2022-02-19 19:43:24'),
(699, 7, 'admin/model/extension/module/d_event_manager.php', '2022-02-19 16:25:25'),
(700, 7, 'admin/model/extension/module/d_seo_module.php', '2022-02-19 16:25:25'),
(701, 7, 'admin/model/extension/module/d_twig_manager.php', '2022-02-19 16:25:25'),
(702, 7, 'admin/view/image/d_elfinder/arrows-active.png', '2022-02-19 16:25:25'),
(703, 7, 'admin/view/image/d_elfinder/arrows-normal.png', '2022-02-19 16:25:25'),
(704, 7, 'admin/view/image/d_elfinder/crop.gif', '2022-02-19 16:25:25'),
(705, 7, 'admin/view/image/d_elfinder/dialogs.png', '2022-02-19 16:25:25'),
(706, 7, 'admin/view/image/d_elfinder/icons-big.png', '2022-02-19 16:25:25'),
(707, 7, 'admin/view/image/d_elfinder/icons-small.png', '2022-02-19 16:25:25'),
(708, 7, 'admin/view/image/d_elfinder/logo.png', '2022-02-19 16:25:25'),
(709, 7, 'admin/view/image/d_elfinder/progress.gif', '2022-02-19 16:25:25'),
(710, 7, 'admin/view/image/d_elfinder/quicklook-bg.png', '2022-02-19 16:25:25'),
(711, 7, 'admin/view/image/d_elfinder/quicklook-icons.png', '2022-02-19 16:25:25'),
(712, 7, 'admin/view/image/d_elfinder/resize.png', '2022-02-19 16:25:25'),
(713, 7, 'admin/view/image/d_elfinder/spinner-mini.gif', '2022-02-19 16:25:25'),
(714, 7, 'admin/view/image/d_elfinder/src', '2022-02-19 16:25:25'),
(715, 7, 'admin/view/image/d_elfinder/toolbar.png', '2022-02-19 16:25:25'),
(716, 7, 'admin/view/javascript/d_ajax_filter/attribute.js', '2022-02-19 16:25:25'),
(717, 7, 'admin/view/javascript/d_ajax_filter/filter.js', '2022-02-19 16:25:25'),
(718, 7, 'admin/view/javascript/d_ajax_filter/layout.js', '2022-02-19 16:25:25'),
(719, 7, 'admin/view/javascript/d_ajax_filter/library', '2022-02-19 16:25:25'),
(720, 7, 'admin/view/javascript/d_ajax_filter/option.js', '2022-02-19 16:25:25'),
(721, 7, 'admin/view/javascript/d_bootstrap_rating/bootstrap-rating.css', '2022-02-19 16:25:25'),
(722, 7, 'admin/view/javascript/d_bootstrap_rating/bootstrap-rating.js', '2022-02-19 16:25:25'),
(723, 7, 'admin/view/javascript/d_bootstrap_rating/bootstrap-rating.min.js', '2022-02-19 16:25:25'),
(724, 7, 'admin/view/javascript/d_elfinder/commands', '2022-02-19 16:25:25'),
(725, 7, 'admin/view/javascript/d_elfinder/elFinder.command.js', '2022-02-19 16:25:25'),
(726, 7, 'admin/view/javascript/d_elfinder/elFinder.history.js', '2022-02-19 16:25:25'),
(727, 7, 'admin/view/javascript/d_elfinder/elFinder.js', '2022-02-19 16:25:25'),
(728, 7, 'admin/view/javascript/d_elfinder/elFinder.options.js', '2022-02-19 16:25:25'),
(729, 7, 'admin/view/javascript/d_elfinder/elFinder.resources.js', '2022-02-19 16:25:25'),
(730, 7, 'admin/view/javascript/d_elfinder/elFinder.version.js', '2022-02-19 16:25:25'),
(731, 7, 'admin/view/javascript/d_elfinder/i18n', '2022-02-19 16:25:25'),
(732, 7, 'admin/view/javascript/d_elfinder/jquery-1.7.2.min.js', '2022-02-19 16:25:25'),
(733, 7, 'admin/view/javascript/d_elfinder/jquery-ui-1.8.18.custom.min.js', '2022-02-19 16:25:25'),
(734, 7, 'admin/view/javascript/d_elfinder/jquery.dialogelfinder.js', '2022-02-19 16:25:25'),
(735, 7, 'admin/view/javascript/d_elfinder/jquery.elfinder.js', '2022-02-19 16:25:25'),
(736, 7, 'admin/view/javascript/d_elfinder/proxy', '2022-02-19 16:25:25'),
(737, 7, 'admin/view/javascript/d_elfinder/ui', '2022-02-19 16:25:25'),
(738, 7, 'admin/view/javascript/d_elfinder/ui-themes', '2022-02-19 16:25:25'),
(739, 7, 'admin/view/javascript/d_riot/package.json', '2022-02-19 16:25:25'),
(740, 7, 'admin/view/javascript/d_riot/riot+compiler.js', '2022-02-19 16:25:25'),
(741, 7, 'admin/view/javascript/d_riot/riot+compiler.min.js', '2022-02-19 16:25:25'),
(742, 7, 'admin/view/javascript/d_riot/riot.csp.js', '2022-02-19 16:25:25'),
(743, 7, 'admin/view/javascript/d_riot/riot.js', '2022-02-19 16:25:25'),
(744, 7, 'admin/view/javascript/d_riot/riot.min.js', '2022-02-19 16:25:25'),
(745, 7, 'admin/view/javascript/d_riot/riotcompiler.js', '2022-02-19 16:25:25'),
(746, 7, 'admin/view/javascript/d_riot/riotcompiler.min.js', '2022-02-19 16:25:25'),
(747, 7, 'admin/view/javascript/d_rubaxa_sortable/jquery.binding.js', '2022-02-19 16:25:25'),
(748, 7, 'admin/view/javascript/d_rubaxa_sortable/knockout-sortable.js', '2022-02-19 16:25:25'),
(749, 7, 'admin/view/javascript/d_rubaxa_sortable/ng-sortable.js', '2022-02-19 16:25:25'),
(750, 7, 'admin/view/javascript/d_rubaxa_sortable/react-sortable-mixin.js', '2022-02-19 16:25:25'),
(751, 7, 'admin/view/javascript/d_rubaxa_sortable/sortable.css', '2022-02-19 16:25:25'),
(752, 7, 'admin/view/javascript/d_rubaxa_sortable/sortable.js', '2022-02-19 16:25:25'),
(753, 7, 'admin/view/javascript/d_rubaxa_sortable/sortable.min.js', '2022-02-19 16:25:25'),
(754, 7, 'admin/view/javascript/d_tinysort/jquery.tinysort.js', '2022-02-19 16:25:25'),
(755, 7, 'admin/view/javascript/d_tinysort/jquery.tinysort.min.js', '2022-02-19 16:25:25'),
(756, 7, 'admin/view/javascript/d_tinysort/tinysort.charorder.js', '2022-02-19 16:25:25'),
(757, 7, 'admin/view/javascript/d_tinysort/tinysort.charorder.min.js', '2022-02-19 16:25:25'),
(758, 7, 'admin/view/javascript/d_tinysort/tinysort.js', '2022-02-19 16:25:26'),
(759, 7, 'admin/view/javascript/d_tinysort/tinysort.min.js', '2022-02-19 16:25:26'),
(760, 7, 'admin/view/stylesheet/d_ajax_filter/attribute.css', '2022-02-19 16:25:26'),
(761, 7, 'admin/view/stylesheet/d_ajax_filter/attribute.css.map', '2022-02-19 16:25:26'),
(762, 7, 'admin/view/stylesheet/d_ajax_filter/attribute.scss', '2022-02-19 16:25:26'),
(763, 7, 'admin/view/stylesheet/d_ajax_filter/filter.css', '2022-02-19 16:25:26'),
(764, 7, 'admin/view/stylesheet/d_ajax_filter/filter.css.map', '2022-02-19 16:25:26'),
(765, 7, 'admin/view/stylesheet/d_ajax_filter/filter.scss', '2022-02-19 16:25:26'),
(766, 7, 'admin/view/stylesheet/d_ajax_filter/layout.css', '2022-02-19 16:25:26'),
(767, 7, 'admin/view/stylesheet/d_ajax_filter/layout.css.map', '2022-02-19 16:25:26'),
(768, 7, 'admin/view/stylesheet/d_ajax_filter/layout.scss', '2022-02-19 16:25:26'),
(769, 7, 'admin/view/stylesheet/d_ajax_filter/option.css', '2022-02-19 16:25:26'),
(770, 7, 'admin/view/stylesheet/d_ajax_filter/option.css.map', '2022-02-19 16:25:26'),
(771, 7, 'admin/view/stylesheet/d_ajax_filter/option.scss', '2022-02-19 16:25:26'),
(772, 7, 'admin/view/stylesheet/d_ajax_filter/setting.css', '2022-02-19 16:25:26'),
(773, 7, 'admin/view/stylesheet/d_ajax_filter/setting.css.map', '2022-02-19 16:25:26'),
(774, 7, 'admin/view/stylesheet/d_ajax_filter/setting.scss', '2022-02-19 16:25:26'),
(775, 7, 'admin/view/stylesheet/d_bootstrap_extra/bootstrap.css', '2022-02-19 16:25:26'),
(776, 7, 'admin/view/stylesheet/d_elfinder/commands.css', '2022-02-19 16:25:26'),
(777, 7, 'admin/view/stylesheet/d_elfinder/common.css', '2022-02-19 16:25:26'),
(778, 7, 'admin/view/stylesheet/d_elfinder/contextmenu.css', '2022-02-19 16:25:26'),
(779, 7, 'admin/view/stylesheet/d_elfinder/cwd.css', '2022-02-19 16:25:26'),
(780, 7, 'admin/view/stylesheet/d_elfinder/dialog.css', '2022-02-19 16:25:26'),
(781, 7, 'admin/view/stylesheet/d_elfinder/navbar.css', '2022-02-19 16:25:26'),
(782, 7, 'admin/view/stylesheet/d_elfinder/places.css', '2022-02-19 16:25:26'),
(783, 7, 'admin/view/stylesheet/d_elfinder/quicklook.css', '2022-02-19 16:25:26'),
(784, 7, 'admin/view/stylesheet/d_elfinder/statusbar.css', '2022-02-19 16:25:26'),
(785, 7, 'admin/view/stylesheet/d_elfinder/theme.css', '2022-02-19 16:25:26'),
(786, 7, 'admin/view/stylesheet/d_elfinder/toolbar.css', '2022-02-19 16:25:26'),
(787, 7, 'admin/view/template/extension/d_ajax_filter', '2022-02-19 16:25:26'),
(1524, 9, 'admin/language/uk-ua/catalog/option.php', '2022-02-19 19:43:24'),
(789, 7, 'admin/view/template/extension/d_elfinder', '2022-02-19 16:25:26'),
(790, 7, 'admin/view/template/extension/d_seo_module', '2022-02-19 16:25:26'),
(791, 7, 'admin/view/template/extension/d_seo_module_ajax_filter', '2022-02-19 16:25:26'),
(792, 7, 'catalog/controller/extension/d_ajax_filter/attribute.php', '2022-02-19 16:25:26'),
(793, 7, 'catalog/controller/extension/d_ajax_filter/category.php', '2022-02-19 16:25:26'),
(794, 7, 'catalog/controller/extension/d_ajax_filter/ean.php', '2022-02-19 16:25:26'),
(795, 7, 'catalog/controller/extension/d_ajax_filter/filter.php', '2022-02-19 16:25:26'),
(796, 7, 'catalog/controller/extension/d_ajax_filter/manufacturer.php', '2022-02-19 16:25:26'),
(797, 7, 'catalog/controller/extension/d_ajax_filter/option.php', '2022-02-19 16:25:26'),
(798, 7, 'catalog/controller/extension/d_ajax_filter/price.php', '2022-02-19 16:25:26'),
(799, 7, 'catalog/controller/extension/d_ajax_filter/rating.php', '2022-02-19 16:25:26'),
(800, 7, 'catalog/controller/extension/d_ajax_filter/search.php', '2022-02-19 16:25:26'),
(801, 7, 'catalog/controller/extension/d_ajax_filter/stock_status.php', '2022-02-19 16:25:26'),
(802, 7, 'catalog/controller/extension/d_ajax_filter/tag.php', '2022-02-19 16:25:26'),
(1525, 9, 'admin/language/uk-ua/catalog/product.php', '2022-02-19 19:43:24'),
(804, 7, 'catalog/controller/extension/d_seo_module/d_seo_module.php', '2022-02-19 16:25:26'),
(1526, 9, 'admin/language/uk-ua/catalog/recurring.php', '2022-02-19 19:43:24'),
(806, 7, 'catalog/controller/extension/d_seo_module_adviser/d_seo_module.php', '2022-02-19 16:25:26'),
(1527, 9, 'admin/language/uk-ua/catalog/review.php', '2022-02-19 19:43:24'),
(808, 7, 'catalog/controller/extension/event/d_ajax_filter.php', '2022-02-19 16:25:26'),
(809, 7, 'catalog/controller/extension/module/d_ajax_filter.php', '2022-02-19 16:25:26'),
(810, 7, 'catalog/controller/extension/module/d_seo_module.php', '2022-02-19 16:25:26'),
(811, 7, 'catalog/language/en-gb/extension/d_seo_module', '2022-02-19 16:25:26'),
(812, 7, 'catalog/language/en-gb/extension/d_seo_module_adviser', '2022-02-19 16:25:26'),
(813, 7, 'catalog/language/english/extension/d_seo_module_adviser', '2022-02-19 16:25:26'),
(814, 7, 'catalog/language/english/extension/module', '2022-02-19 16:25:26'),
(815, 7, 'catalog/model/extension/d_ajax_filter/attribute.php', '2022-02-19 16:25:26'),
(816, 7, 'catalog/model/extension/d_ajax_filter/category.php', '2022-02-19 16:25:26'),
(817, 7, 'catalog/model/extension/d_ajax_filter/ean.php', '2022-02-19 16:25:26'),
(818, 7, 'catalog/model/extension/d_ajax_filter/filter.php', '2022-02-19 16:25:26'),
(819, 7, 'catalog/model/extension/d_ajax_filter/manufacturer.php', '2022-02-19 16:25:26'),
(820, 7, 'catalog/model/extension/d_ajax_filter/option.php', '2022-02-19 16:25:26'),
(821, 7, 'catalog/model/extension/d_ajax_filter/price.php', '2022-02-19 16:25:26'),
(822, 7, 'catalog/model/extension/d_ajax_filter/rating.php', '2022-02-19 16:25:26'),
(823, 7, 'catalog/model/extension/d_ajax_filter/search.php', '2022-02-19 16:25:26'),
(824, 7, 'catalog/model/extension/d_ajax_filter/stock_status.php', '2022-02-19 16:25:26'),
(825, 7, 'catalog/model/extension/d_ajax_filter/tag.php', '2022-02-19 16:25:26'),
(826, 7, 'catalog/model/extension/d_opencart_patch/load.php', '2022-02-19 16:25:26'),
(827, 7, 'catalog/model/extension/d_opencart_patch/user.php', '2022-02-19 16:25:26'),
(1528, 9, 'admin/language/uk-ua/common/column_left.php', '2022-02-19 19:43:24'),
(829, 7, 'catalog/model/extension/d_seo_module/d_seo_module.php', '2022-02-19 16:25:26'),
(830, 7, 'catalog/model/extension/d_seo_module_adviser/d_seo_module.php', '2022-02-19 16:25:26'),
(1529, 9, 'admin/language/uk-ua/common/dashboard.php', '2022-02-19 19:43:24'),
(832, 7, 'catalog/model/extension/module/d_ajax_filter.php', '2022-02-19 16:25:26'),
(1530, 9, 'admin/language/uk-ua/common/filemanager.php', '2022-02-19 19:43:24'),
(834, 7, 'catalog/model/extension/module/d_seo_module.php', '2022-02-19 16:25:26'),
(835, 7, 'catalog/view/javascript/d_ajax_filter/library', '2022-02-19 16:25:26'),
(836, 7, 'catalog/view/javascript/d_bootstrap_rating/bootstrap-rating.css', '2022-02-19 16:25:26'),
(837, 7, 'catalog/view/javascript/d_bootstrap_rating/bootstrap-rating.js', '2022-02-19 16:25:26'),
(838, 7, 'catalog/view/javascript/d_bootstrap_rating/bootstrap-rating.min.js', '2022-02-19 16:25:26'),
(839, 7, 'catalog/view/javascript/d_riot/package.json', '2022-02-19 16:25:26'),
(840, 7, 'catalog/view/javascript/d_riot/riot+compiler.js', '2022-02-19 16:25:26'),
(841, 7, 'catalog/view/javascript/d_riot/riot+compiler.min.js', '2022-02-19 16:25:26'),
(842, 7, 'catalog/view/javascript/d_riot/riot.csp.js', '2022-02-19 16:25:26'),
(843, 7, 'catalog/view/javascript/d_riot/riot.js', '2022-02-19 16:25:26'),
(844, 7, 'catalog/view/javascript/d_riot/riot.min.js', '2022-02-19 16:25:26'),
(845, 7, 'catalog/view/javascript/d_riot/riotcompiler.js', '2022-02-19 16:25:26'),
(846, 7, 'catalog/view/javascript/d_riot/riotcompiler.min.js', '2022-02-19 16:25:26'),
(847, 7, 'catalog/view/javascript/d_rubaxa_sortable/jquery.binding.js', '2022-02-19 16:25:26'),
(848, 7, 'catalog/view/javascript/d_rubaxa_sortable/knockout-sortable.js', '2022-02-19 16:25:26'),
(849, 7, 'catalog/view/javascript/d_rubaxa_sortable/ng-sortable.js', '2022-02-19 16:25:26'),
(850, 7, 'catalog/view/javascript/d_rubaxa_sortable/react-sortable-mixin.js', '2022-02-19 16:25:26'),
(851, 7, 'catalog/view/javascript/d_rubaxa_sortable/sortable.css', '2022-02-19 16:25:26'),
(852, 7, 'catalog/view/javascript/d_rubaxa_sortable/sortable.js', '2022-02-19 16:25:26'),
(853, 7, 'catalog/view/javascript/d_rubaxa_sortable/sortable.min.js', '2022-02-19 16:25:26'),
(854, 7, 'catalog/view/javascript/d_tinysort/jquery.tinysort.js', '2022-02-19 16:25:26'),
(855, 7, 'catalog/view/javascript/d_tinysort/jquery.tinysort.min.js', '2022-02-19 16:25:26'),
(856, 7, 'catalog/view/javascript/d_tinysort/tinysort.charorder.js', '2022-02-19 16:25:26'),
(857, 7, 'catalog/view/javascript/d_tinysort/tinysort.charorder.min.js', '2022-02-19 16:25:26'),
(858, 7, 'catalog/view/javascript/d_tinysort/tinysort.js', '2022-02-19 16:25:26'),
(859, 7, 'catalog/view/javascript/d_tinysort/tinysort.min.js', '2022-02-19 16:25:26'),
(860, 7, 'catalog/view/theme/default/javascript', '2022-02-19 16:25:26'),
(861, 7, 'image/catalog/d_seo_module/feature/dashboard_widget_for_duplicate_and_empty_target_keywords.svg', '2022-02-19 16:25:26'),
(862, 7, 'image/catalog/d_seo_module/feature/export_import_target_keywords_for_custom_pages.svg', '2022-02-19 16:25:26'),
(863, 7, 'image/catalog/d_seo_module/feature/htaccess_editor.svg', '2022-02-19 16:25:26'),
(864, 7, 'image/catalog/d_seo_module/feature/opencart_first_load_of_comments_fix.svg', '2022-02-19 16:25:26'),
(865, 7, 'image/catalog/d_seo_module/feature/opencart_tag_search_fix.svg', '2022-02-19 16:25:26'),
(866, 7, 'image/catalog/d_seo_module/feature/robots_txt_editor.svg', '2022-02-19 16:25:26'),
(867, 7, 'image/catalog/d_seo_module/feature/seo_module_api.svg', '2022-02-19 16:25:26'),
(868, 7, 'image/catalog/d_seo_module/feature/seo_module_multi_store_support.svg', '2022-02-19 16:25:26'),
(869, 7, 'image/catalog/d_seo_module/feature/seo_module_quick_setup.svg', '2022-02-19 16:25:26'),
(870, 7, 'image/catalog/d_seo_module/feature/target_keyword_planner.svg', '2022-02-19 16:25:26'),
(871, 7, 'system/library/d_elfinder/jquery/jquery-1.7.2.min.js', '2022-02-19 16:25:26'),
(872, 7, 'system/library/d_elfinder/jquery/jquery-ui-1.8.18.custom.min.js', '2022-02-19 16:25:26'),
(873, 7, 'system/library/d_elfinder/jquery/ui-themes', '2022-02-19 16:25:26'),
(874, 7, 'system/library/d_elfinder/sounds/rm.wav', '2022-02-19 16:25:26'),
(875, 7, 'system/library/d_excel_reader_writer/spreadsheetreader/spreadsheetreader_csv.php', '2022-02-19 16:25:26'),
(876, 7, 'system/library/d_excel_reader_writer/spreadsheetreader/spreadsheetreader_ods.php', '2022-02-19 16:25:26'),
(877, 7, 'system/library/d_excel_reader_writer/spreadsheetreader/spreadsheetreader_xls.php', '2022-02-19 16:25:26'),
(878, 7, 'system/library/d_excel_reader_writer/spreadsheetreader/spreadsheetreader_xlsx.php', '2022-02-19 16:25:26'),
(879, 7, 'system/library/d_shopunity/extension/d_ajax_filter.json', '2022-02-19 16:25:26'),
(1531, 9, 'admin/language/uk-ua/common/footer.php', '2022-02-19 19:43:24'),
(881, 7, 'system/library/d_shopunity/extension/d_bootstrap_extra.json', '2022-02-19 16:25:26'),
(882, 7, 'system/library/d_shopunity/extension/d_bootstrap_rating.json', '2022-02-19 16:25:26'),
(883, 7, 'system/library/d_shopunity/extension/d_bootstrap_switch.json', '2022-02-19 16:25:26'),
(884, 7, 'system/library/d_shopunity/extension/d_elfinder.json', '2022-02-19 16:25:26'),
(885, 7, 'system/library/d_shopunity/extension/d_event_manager.json', '2022-02-19 16:25:26'),
(886, 7, 'system/library/d_shopunity/extension/d_excel_reader_writer.json', '2022-02-19 16:25:26'),
(887, 7, 'system/library/d_shopunity/extension/d_opencart_patch.json', '2022-02-19 16:25:26'),
(888, 7, 'system/library/d_shopunity/extension/d_riot.json', '2022-02-19 16:25:26'),
(889, 7, 'system/library/d_shopunity/extension/d_robots_txt_parser.json', '2022-02-19 16:25:26'),
(890, 7, 'system/library/d_shopunity/extension/d_rubaxa_sortable.json', '2022-02-19 16:25:26'),
(891, 7, 'system/library/d_shopunity/extension/d_seo_module.json', '2022-02-19 16:25:26'),
(892, 7, 'system/library/d_shopunity/extension/d_simple_html_dom.json', '2022-02-19 16:25:26'),
(893, 7, 'system/library/d_shopunity/extension/d_tinysort.json', '2022-02-19 16:25:26'),
(894, 7, 'system/library/d_shopunity/extension/d_twig_manager.json', '2022-02-19 16:25:26'),
(895, 7, 'system/library/d_shopunity/install/d_ajax_filter.xml', '2022-02-19 16:25:26'),
(896, 7, 'system/library/d_shopunity/install/d_opencart_patch.xml', '2022-02-19 16:25:26'),
(897, 7, 'system/library/d_shopunity/install/d_seo_module.xml', '2022-02-19 16:25:26'),
(898, 7, 'system/library/d_shopunity/install/d_twig_manager.xml', '2022-02-19 16:25:26'),
(899, 7, 'system/library/d_shopunity/readme/d_opencart_patch.md', '2022-02-19 16:25:26'),
(900, 7, 'system/library/d_shopunity/readme/d_seo_module.md', '2022-02-19 16:25:26'),
(901, 7, 'admin/language/en-gb/extension/d_ajax_filter/attribute.php', '2022-02-19 16:25:26'),
(902, 7, 'admin/language/en-gb/extension/d_ajax_filter/cache.php', '2022-02-19 16:25:26'),
(903, 7, 'admin/language/en-gb/extension/d_ajax_filter/filter.php', '2022-02-19 16:25:26'),
(904, 7, 'admin/language/en-gb/extension/d_ajax_filter/layout.php', '2022-02-19 16:25:26'),
(905, 7, 'admin/language/en-gb/extension/d_ajax_filter/option.php', '2022-02-19 16:25:26'),
(906, 7, 'admin/language/en-gb/extension/d_ajax_filter/setting.php', '2022-02-19 16:25:26'),
(1532, 9, 'admin/language/uk-ua/common/forgotten.php', '2022-02-19 19:43:24'),
(1533, 9, 'admin/language/uk-ua/common/header.php', '2022-02-19 19:43:24'),
(1534, 9, 'admin/language/uk-ua/common/login.php', '2022-02-19 19:43:24'),
(910, 7, 'admin/language/en-gb/extension/d_seo_module/d_seo_module.php', '2022-02-19 16:25:26'),
(1535, 9, 'admin/language/uk-ua/common/reset.php', '2022-02-19 19:43:24'),
(912, 7, 'admin/language/en-gb/extension/d_seo_module_adviser/d_seo_module.php', '2022-02-19 16:25:26'),
(1536, 9, 'admin/language/uk-ua/customer/custom_field.php', '2022-02-19 19:43:24'),
(914, 7, 'admin/language/en-gb/extension/d_seo_module_manager/d_seo_module.php', '2022-02-19 16:25:26'),
(1537, 9, 'admin/language/uk-ua/customer/customer.php', '2022-02-19 19:43:24'),
(1538, 9, 'admin/language/uk-ua/customer/customer_group.php', '2022-02-19 19:43:24'),
(917, 7, 'admin/language/en-gb/extension/dashboard/d_seo_module_target_keyword.php', '2022-02-19 16:25:26'),
(918, 7, 'admin/language/en-gb/extension/module/d_ajax_filter.php', '2022-02-19 16:25:26'),
(1539, 9, 'admin/language/uk-ua/design/banner.php', '2022-02-19 19:43:24'),
(920, 7, 'admin/language/en-gb/extension/module/d_seo_module.php', '2022-02-19 16:25:26'),
(921, 7, 'admin/language/english/extension/d_ajax_filter/attribute.php', '2022-02-19 16:25:26'),
(922, 7, 'admin/language/english/extension/d_ajax_filter/cache.php', '2022-02-19 16:25:26'),
(923, 7, 'admin/language/english/extension/d_ajax_filter/filter.php', '2022-02-19 16:25:26'),
(924, 7, 'admin/language/english/extension/d_ajax_filter/layout.php', '2022-02-19 16:25:26'),
(925, 7, 'admin/language/english/extension/d_ajax_filter/option.php', '2022-02-19 16:25:26'),
(926, 7, 'admin/language/english/extension/d_ajax_filter/setting.php', '2022-02-19 16:25:26'),
(1540, 9, 'admin/language/uk-ua/design/language.php', '2022-02-19 19:43:24'),
(1541, 9, 'admin/language/uk-ua/design/layout.php', '2022-02-19 19:43:24'),
(1542, 9, 'admin/language/uk-ua/design/menu.php', '2022-02-19 19:43:24'),
(1543, 9, 'admin/language/uk-ua/design/theme.php', '2022-02-19 19:43:24'),
(1544, 9, 'admin/language/uk-ua/design/translation.php', '2022-02-19 19:43:24'),
(1545, 9, 'admin/language/uk-ua/error/not_found.php', '2022-02-19 19:43:24'),
(1546, 9, 'admin/language/uk-ua/error/permission.php', '2022-02-19 19:43:24'),
(1547, 9, 'admin/language/uk-ua/extension/analytics', '2022-02-19 19:43:24'),
(1548, 9, 'admin/language/uk-ua/extension/captcha', '2022-02-19 19:43:24'),
(934, 7, 'admin/language/english/extension/module/d_ajax_filter.php', '2022-02-19 16:25:26'),
(1549, 9, 'admin/language/uk-ua/extension/dashboard', '2022-02-19 19:43:24'),
(936, 7, 'admin/view/image/d_elfinder/src/dialogs.pxm', '2022-02-19 16:25:26'),
(937, 7, 'admin/view/image/d_elfinder/src/icons-big.psd', '2022-02-19 16:25:26'),
(938, 7, 'admin/view/image/d_elfinder/src/icons-big.pxm', '2022-02-19 16:25:26'),
(939, 7, 'admin/view/image/d_elfinder/src/icons-small copy.pxm', '2022-02-19 16:25:26'),
(940, 7, 'admin/view/image/d_elfinder/src/icons-small.psd', '2022-02-19 16:25:26'),
(941, 7, 'admin/view/image/d_elfinder/src/icons-small.pxm', '2022-02-19 16:25:26'),
(942, 7, 'admin/view/image/d_elfinder/src/quicklook-icons.pxm', '2022-02-19 16:25:26'),
(943, 7, 'admin/view/image/d_elfinder/src/toolbar.pxm', '2022-02-19 16:25:26'),
(944, 7, 'admin/view/javascript/d_ajax_filter/library/bootstrap.colorpickersliders', '2022-02-19 16:25:26'),
(945, 7, 'admin/view/javascript/d_ajax_filter/library/handlebars-v4.0.5.js', '2022-02-19 16:25:26'),
(946, 7, 'admin/view/javascript/d_ajax_filter/library/jquery.bootpag.min.js', '2022-02-19 16:25:26'),
(947, 7, 'admin/view/javascript/d_ajax_filter/library/jquery.serializejson.js', '2022-02-19 16:25:26'),
(948, 7, 'admin/view/javascript/d_ajax_filter/library/tinycolor-min.js', '2022-02-19 16:25:26'),
(949, 7, 'admin/view/javascript/d_ajax_filter/library/tinysort.js', '2022-02-19 16:25:26'),
(950, 7, 'admin/view/javascript/d_ajax_filter/library/underscore-min.js', '2022-02-19 16:25:26'),
(951, 7, 'admin/view/javascript/d_bootstrap_switch/css/bootstrap-switch.css', '2022-02-19 16:25:26'),
(952, 7, 'admin/view/javascript/d_bootstrap_switch/css/bootstrap-switch.min.css', '2022-02-19 16:25:26'),
(953, 7, 'admin/view/javascript/d_bootstrap_switch/js/bootstrap-switch.js', '2022-02-19 16:25:26'),
(954, 7, 'admin/view/javascript/d_bootstrap_switch/js/bootstrap-switch.min.js', '2022-02-19 16:25:26'),
(955, 7, 'admin/view/javascript/d_elfinder/commands/archive.js', '2022-02-19 16:25:26'),
(956, 7, 'admin/view/javascript/d_elfinder/commands/back.js', '2022-02-19 16:25:26'),
(957, 7, 'admin/view/javascript/d_elfinder/commands/copy.js', '2022-02-19 16:25:26'),
(958, 7, 'admin/view/javascript/d_elfinder/commands/cut.js', '2022-02-19 16:25:26'),
(959, 7, 'admin/view/javascript/d_elfinder/commands/download.js', '2022-02-19 16:25:26'),
(960, 7, 'admin/view/javascript/d_elfinder/commands/duplicate.js', '2022-02-19 16:25:26'),
(961, 7, 'admin/view/javascript/d_elfinder/commands/edit.js', '2022-02-19 16:25:26'),
(962, 7, 'admin/view/javascript/d_elfinder/commands/extract.js', '2022-02-19 16:25:26'),
(963, 7, 'admin/view/javascript/d_elfinder/commands/forward.js', '2022-02-19 16:25:26'),
(964, 7, 'admin/view/javascript/d_elfinder/commands/getfile.js', '2022-02-19 16:25:26'),
(965, 7, 'admin/view/javascript/d_elfinder/commands/help.js', '2022-02-19 16:25:26'),
(966, 7, 'admin/view/javascript/d_elfinder/commands/home.js', '2022-02-19 16:25:26'),
(967, 7, 'admin/view/javascript/d_elfinder/commands/info.js', '2022-02-19 16:25:26'),
(968, 7, 'admin/view/javascript/d_elfinder/commands/mkdir.js', '2022-02-19 16:25:26'),
(969, 7, 'admin/view/javascript/d_elfinder/commands/mkfile.js', '2022-02-19 16:25:26'),
(970, 7, 'admin/view/javascript/d_elfinder/commands/netmount.js', '2022-02-19 16:25:26'),
(971, 7, 'admin/view/javascript/d_elfinder/commands/open.js', '2022-02-19 16:25:26'),
(972, 7, 'admin/view/javascript/d_elfinder/commands/paste.js', '2022-02-19 16:25:26'),
(973, 7, 'admin/view/javascript/d_elfinder/commands/quicklook.js', '2022-02-19 16:25:26'),
(974, 7, 'admin/view/javascript/d_elfinder/commands/quicklook.plugins.js', '2022-02-19 16:25:26'),
(975, 7, 'admin/view/javascript/d_elfinder/commands/reload.js', '2022-02-19 16:25:26'),
(976, 7, 'admin/view/javascript/d_elfinder/commands/rename.js', '2022-02-19 16:25:26'),
(977, 7, 'admin/view/javascript/d_elfinder/commands/resize.js', '2022-02-19 16:25:26'),
(978, 7, 'admin/view/javascript/d_elfinder/commands/rm.js', '2022-02-19 16:25:26'),
(979, 7, 'admin/view/javascript/d_elfinder/commands/search.js', '2022-02-19 16:25:26'),
(980, 7, 'admin/view/javascript/d_elfinder/commands/selectforproduct.js', '2022-02-19 16:25:26'),
(981, 7, 'admin/view/javascript/d_elfinder/commands/sort.js', '2022-02-19 16:25:26'),
(982, 7, 'admin/view/javascript/d_elfinder/commands/up.js', '2022-02-19 16:25:26'),
(983, 7, 'admin/view/javascript/d_elfinder/commands/upload.js', '2022-02-19 16:25:26'),
(984, 7, 'admin/view/javascript/d_elfinder/commands/view.js', '2022-02-19 16:25:26'),
(985, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.LANG.js', '2022-02-19 16:25:26'),
(986, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.ar.js', '2022-02-19 16:25:26'),
(987, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.bg.js', '2022-02-19 16:25:26'),
(988, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.ca.js', '2022-02-19 16:25:26'),
(989, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.cs.js', '2022-02-19 16:25:26'),
(990, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.de.js', '2022-02-19 16:25:26'),
(991, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.en.js', '2022-02-19 16:25:26'),
(992, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.es.js', '2022-02-19 16:25:26'),
(993, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.fr.js', '2022-02-19 16:25:26'),
(994, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.hu.js', '2022-02-19 16:25:26'),
(995, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.jp.js', '2022-02-19 16:25:26'),
(996, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.nl.js', '2022-02-19 16:25:26'),
(997, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.no.js', '2022-02-19 16:25:26'),
(998, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.pl.js', '2022-02-19 16:25:26'),
(999, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.pt_BR.js', '2022-02-19 16:25:26'),
(1000, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.ru.js', '2022-02-19 16:25:26'),
(1001, 7, 'admin/view/javascript/d_elfinder/i18n/elfinder.zh_CN.js', '2022-02-19 16:25:26'),
(1002, 7, 'admin/view/javascript/d_elfinder/proxy/elFinderSupportVer1.js', '2022-02-19 16:25:26'),
(1003, 7, 'admin/view/javascript/d_elfinder/ui/button.js', '2022-02-19 16:25:26'),
(1004, 7, 'admin/view/javascript/d_elfinder/ui/contextmenu.js', '2022-02-19 16:25:26'),
(1005, 7, 'admin/view/javascript/d_elfinder/ui/cwd.js', '2022-02-19 16:25:26'),
(1006, 7, 'admin/view/javascript/d_elfinder/ui/dialog.js', '2022-02-19 16:25:26'),
(1007, 7, 'admin/view/javascript/d_elfinder/ui/navbar.js', '2022-02-19 16:25:26'),
(1008, 7, 'admin/view/javascript/d_elfinder/ui/overlay.js', '2022-02-19 16:25:26'),
(1009, 7, 'admin/view/javascript/d_elfinder/ui/panel.js', '2022-02-19 16:25:26'),
(1010, 7, 'admin/view/javascript/d_elfinder/ui/path.js', '2022-02-19 16:25:26'),
(1011, 7, 'admin/view/javascript/d_elfinder/ui/places.js', '2022-02-19 16:25:26'),
(1012, 7, 'admin/view/javascript/d_elfinder/ui/searchbutton.js', '2022-02-19 16:25:26'),
(1013, 7, 'admin/view/javascript/d_elfinder/ui/sortbutton.js', '2022-02-19 16:25:26'),
(1014, 7, 'admin/view/javascript/d_elfinder/ui/stat.js', '2022-02-19 16:25:26'),
(1015, 7, 'admin/view/javascript/d_elfinder/ui/toolbar.js', '2022-02-19 16:25:26'),
(1016, 7, 'admin/view/javascript/d_elfinder/ui/tree.js', '2022-02-19 16:25:26'),
(1017, 7, 'admin/view/javascript/d_elfinder/ui/uploadButton.js', '2022-02-19 16:25:26'),
(1018, 7, 'admin/view/javascript/d_elfinder/ui/viewbutton.js', '2022-02-19 16:25:26'),
(1019, 7, 'admin/view/javascript/d_elfinder/ui/workzone.js', '2022-02-19 16:25:26'),
(1020, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness', '2022-02-19 16:25:26'),
(1021, 7, 'admin/view/template/extension/d_ajax_filter/attribute.twig', '2022-02-19 16:25:26'),
(1022, 7, 'admin/view/template/extension/d_ajax_filter/cache.twig', '2022-02-19 16:25:26'),
(1023, 7, 'admin/view/template/extension/d_ajax_filter/filter.twig', '2022-02-19 16:25:26'),
(1024, 7, 'admin/view/template/extension/d_ajax_filter/layout.twig', '2022-02-19 16:25:26'),
(1025, 7, 'admin/view/template/extension/d_ajax_filter/layout_partial', '2022-02-19 16:25:26'),
(1026, 7, 'admin/view/template/extension/d_ajax_filter/option.twig', '2022-02-19 16:25:26'),
(1027, 7, 'admin/view/template/extension/d_ajax_filter/partials', '2022-02-19 16:25:26'),
(1028, 7, 'admin/view/template/extension/d_ajax_filter/setting.twig', '2022-02-19 16:25:26'),
(1550, 9, 'admin/language/uk-ua/extension/event.php', '2022-02-19 19:43:24'),
(1551, 9, 'admin/language/uk-ua/extension/extension', '2022-02-19 19:43:24'),
(1552, 9, 'admin/language/uk-ua/extension/extension.php', '2022-02-19 19:43:24'),
(1553, 9, 'admin/language/uk-ua/extension/feed', '2022-02-19 19:43:24'),
(1033, 7, 'admin/view/template/extension/d_elfinder/d_elfinder.twig', '2022-02-19 16:25:26'),
(1034, 7, 'admin/view/template/extension/d_seo_module/d_seo_module', '2022-02-19 16:25:26'),
(1554, 9, 'admin/language/uk-ua/extension/fraud', '2022-02-19 19:43:24'),
(1036, 7, 'admin/view/template/extension/dashboard/d_seo_module_target_keyword.twig', '2022-02-19 16:25:26'),
(1037, 7, 'admin/view/template/extension/dashboard/d_seo_module_target_keyword_info.twig', '2022-02-19 16:25:26'),
(1038, 7, 'admin/view/template/extension/dashboard/d_seo_module_target_keyword_refresh.twig', '2022-02-19 16:25:26'),
(1039, 7, 'admin/view/template/extension/module/d_seo_module', '2022-02-19 16:25:26'),
(1040, 7, 'catalog/language/en-gb/extension/d_seo_module/d_seo_module.php', '2022-02-19 16:25:26'),
(1555, 9, 'admin/language/uk-ua/extension/installer.php', '2022-02-19 19:43:24'),
(1042, 7, 'catalog/language/en-gb/extension/d_seo_module_adviser/d_seo_module.php', '2022-02-19 16:25:26'),
(1043, 7, 'catalog/language/en-gb/extension/module/d_ajax_filter.php', '2022-02-19 16:25:26'),
(1556, 9, 'admin/language/uk-ua/extension/modification.php', '2022-02-19 19:43:24'),
(1045, 7, 'catalog/language/english/extension/module/d_ajax_filter.php', '2022-02-19 16:25:26'),
(1046, 7, 'catalog/view/javascript/d_ajax_filter/library/Ion.RangeSlider', '2022-02-19 16:25:26'),
(1047, 7, 'catalog/view/javascript/d_ajax_filter/library/inline_edit.js', '2022-02-19 16:25:26'),
(1048, 7, 'catalog/view/javascript/d_ajax_filter/library/jquery.serializejson.js', '2022-02-19 16:25:26'),
(1049, 7, 'catalog/view/javascript/d_ajax_filter/library/jquery.touchwipe.min.js', '2022-02-19 16:25:26'),
(1050, 7, 'catalog/view/javascript/d_ajax_filter/library/wNumb.js', '2022-02-19 16:25:26'),
(1051, 7, 'catalog/view/javascript/d_bootstrap_switch/css/bootstrap-switch.css', '2022-02-19 16:25:26'),
(1052, 7, 'catalog/view/javascript/d_bootstrap_switch/css/bootstrap-switch.min.css', '2022-02-19 16:25:26'),
(1053, 7, 'catalog/view/javascript/d_bootstrap_switch/js/bootstrap-switch.js', '2022-02-19 16:25:26'),
(1054, 7, 'catalog/view/javascript/d_bootstrap_switch/js/bootstrap-switch.min.js', '2022-02-19 16:25:26'),
(1055, 7, 'catalog/view/theme/default/image/d_ajax_filter', '2022-02-19 16:25:26'),
(1056, 7, 'catalog/view/theme/default/javascript/d_ajax_filter', '2022-02-19 16:25:26'),
(1057, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter', '2022-02-19 16:25:26'),
(1058, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness', '2022-02-19 16:25:26'),
(1059, 7, 'system/library/template/Twig/Extension/DTwigManager.php', '2022-02-19 16:25:26'),
(1060, 7, 'admin/view/javascript/d_ajax_filter/library/bootstrap.colorpickersliders/bootstrap.colorpickersliders.min.css', '2022-02-19 16:25:26'),
(1061, 7, 'admin/view/javascript/d_ajax_filter/library/bootstrap.colorpickersliders/bootstrap.colorpickersliders.min.js', '2022-02-19 16:25:26'),
(1062, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images', '2022-02-19 16:25:26'),
(1063, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/jquery-ui-1.8.18.custom.css', '2022-02-19 16:25:26'),
(1064, 7, 'admin/view/template/extension/d_ajax_filter/layout_partial/attribute.twig', '2022-02-19 16:25:26'),
(1065, 7, 'admin/view/template/extension/d_ajax_filter/layout_partial/filter.twig', '2022-02-19 16:25:26'),
(1066, 7, 'admin/view/template/extension/d_ajax_filter/layout_partial/option.twig', '2022-02-19 16:25:26'),
(1067, 7, 'admin/view/template/extension/d_ajax_filter/partials/tabs.twig', '2022-02-19 16:25:26'),
(1068, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/category_form_script.twig', '2022-02-19 16:25:26'),
(1069, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/category_form_style.twig', '2022-02-19 16:25:26'),
(1070, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/category_form_tab_general_language.twig', '2022-02-19 16:25:26'),
(1071, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/category_form_tab_general_store_language.twig', '2022-02-19 16:25:26'),
(1072, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/information_form_script.twig', '2022-02-19 16:25:26'),
(1073, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/information_form_style.twig', '2022-02-19 16:25:26'),
(1074, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/information_form_tab_general_language.twig', '2022-02-19 16:25:26'),
(1075, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/information_form_tab_general_store_language.twig', '2022-02-19 16:25:26'),
(1076, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/manufacturer_form_script.twig', '2022-02-19 16:25:26'),
(1077, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/manufacturer_form_style.twig', '2022-02-19 16:25:26'),
(1078, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/manufacturer_form_tab_general_language.twig', '2022-02-19 16:25:26'),
(1079, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/manufacturer_form_tab_general_store_language.twig', '2022-02-19 16:25:26'),
(1080, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/product_form_script.twig', '2022-02-19 16:25:26'),
(1081, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/product_form_style.twig', '2022-02-19 16:25:26'),
(1082, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/product_form_tab_general_language.twig', '2022-02-19 16:25:26'),
(1083, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/product_form_tab_general_store_language.twig', '2022-02-19 16:25:26'),
(1084, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/setting_script.twig', '2022-02-19 16:25:26'),
(1085, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/setting_style.twig', '2022-02-19 16:25:26'),
(1086, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/setting_tab_general_language.twig', '2022-02-19 16:25:26');
INSERT INTO `oc_extension_path` (`extension_path_id`, `extension_install_id`, `path`, `date_added`) VALUES
(1087, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/store_form_script.twig', '2022-02-19 16:25:26'),
(1088, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/store_form_style.twig', '2022-02-19 16:25:26'),
(1089, 7, 'admin/view/template/extension/d_seo_module/d_seo_module/store_form_tab_general_language.twig', '2022-02-19 16:25:26'),
(1557, 9, 'admin/language/uk-ua/extension/openbay', '2022-02-19 19:43:24'),
(1558, 9, 'admin/language/uk-ua/extension/payment', '2022-02-19 19:43:24'),
(1559, 9, 'admin/language/uk-ua/extension/shipping', '2022-02-19 19:43:24'),
(1560, 9, 'admin/language/uk-ua/extension/store.php', '2022-02-19 19:43:24'),
(1561, 9, 'admin/language/uk-ua/extension/theme', '2022-02-19 19:43:24'),
(1562, 9, 'admin/language/uk-ua/extension/total', '2022-02-19 19:43:24'),
(1563, 9, 'admin/language/uk-ua/localisation/country.php', '2022-02-19 19:43:24'),
(1094, 7, 'admin/view/template/extension/module/d_seo_module/custom_page.twig', '2022-02-19 16:25:26'),
(1095, 7, 'admin/view/template/extension/module/d_seo_module/dashboard.twig', '2022-02-19 16:25:26'),
(1096, 7, 'admin/view/template/extension/module/d_seo_module/export_import.twig', '2022-02-19 16:25:26'),
(1097, 7, 'admin/view/template/extension/module/d_seo_module/field_setting.twig', '2022-02-19 16:25:26'),
(1098, 7, 'admin/view/template/extension/module/d_seo_module/install.twig', '2022-02-19 16:25:26'),
(1099, 7, 'admin/view/template/extension/module/d_seo_module/instruction.twig', '2022-02-19 16:25:26'),
(1100, 7, 'admin/view/template/extension/module/d_seo_module/setting.twig', '2022-02-19 16:25:26'),
(1101, 7, 'catalog/view/javascript/d_ajax_filter/library/Ion.RangeSlider/ion.rangeSlider.css', '2022-02-19 16:25:26'),
(1102, 7, 'catalog/view/javascript/d_ajax_filter/library/Ion.RangeSlider/ion.rangeSlider.min.js', '2022-02-19 16:25:26'),
(1103, 7, 'catalog/view/javascript/d_ajax_filter/library/Ion.RangeSlider/ion.rangeSlider.skinAjaxFilter.css', '2022-02-19 16:25:26'),
(1104, 7, 'catalog/view/javascript/d_ajax_filter/library/Ion.RangeSlider/ion.rangeSlider.skinHTML5.css', '2022-02-19 16:25:26'),
(1105, 7, 'catalog/view/theme/default/image/d_ajax_filter/arrow.svg', '2022-02-19 16:25:26'),
(1106, 7, 'catalog/view/theme/default/image/d_ajax_filter/arrow2.svg', '2022-02-19 16:25:26'),
(1107, 7, 'catalog/view/theme/default/image/d_ajax_filter/cross.svg', '2022-02-19 16:25:26'),
(1108, 7, 'catalog/view/theme/default/image/d_ajax_filter/cross_close.svg', '2022-02-19 16:25:26'),
(1109, 7, 'catalog/view/theme/default/javascript/d_ajax_filter/d_ajax_filter.js', '2022-02-19 16:25:26'),
(1110, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/d_ajax_filter.css', '2022-02-19 16:25:26'),
(1111, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/d_ajax_filter.css.map', '2022-02-19 16:25:26'),
(1112, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/d_ajax_filter.scss', '2022-02-19 16:25:26'),
(1113, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts', '2022-02-19 16:25:26'),
(1114, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/la-ball-scale-ripple-multiple.css', '2022-02-19 16:25:26'),
(1115, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/themes', '2022-02-19 16:25:26'),
(1116, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter', '2022-02-19 16:25:26'),
(1117, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images', '2022-02-19 16:25:26'),
(1118, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/jquery-ui-1.8.18.custom.css', '2022-02-19 16:25:26'),
(1119, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-bg_flat_0_aaaaaa_40x100.png', '2022-02-19 16:25:26'),
(1120, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-bg_flat_75_ffffff_40x100.png', '2022-02-19 16:25:26'),
(1121, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-bg_glass_55_fbf9ee_1x400.png', '2022-02-19 16:25:26'),
(1122, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-bg_glass_65_ffffff_1x400.png', '2022-02-19 16:25:26'),
(1123, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-bg_glass_75_dadada_1x400.png', '2022-02-19 16:25:26'),
(1124, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-bg_glass_75_e6e6e6_1x400.png', '2022-02-19 16:25:26'),
(1125, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-bg_glass_95_fef1ec_1x400.png', '2022-02-19 16:25:26'),
(1126, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png', '2022-02-19 16:25:26'),
(1127, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-icons_222222_256x240.png', '2022-02-19 16:25:26'),
(1128, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-icons_2e83ff_256x240.png', '2022-02-19 16:25:26'),
(1129, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-icons_454545_256x240.png', '2022-02-19 16:25:26'),
(1130, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-icons_888888_256x240.png', '2022-02-19 16:25:26'),
(1131, 7, 'admin/view/javascript/d_elfinder/ui-themes/smoothness/images/ui-icons_cd0a0a_256x240.png', '2022-02-19 16:25:26'),
(1132, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts/OpenSans-Bold.ttf', '2022-02-19 16:25:26'),
(1133, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts/OpenSans-BoldItalic.ttf', '2022-02-19 16:25:26'),
(1134, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts/OpenSans-ExtraBold.ttf', '2022-02-19 16:25:26'),
(1135, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts/OpenSans-ExtraBoldItalic.ttf', '2022-02-19 16:25:26'),
(1136, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts/OpenSans-Italic.ttf', '2022-02-19 16:25:26'),
(1137, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts/OpenSans-Light.ttf', '2022-02-19 16:25:26'),
(1138, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts/OpenSans-LightItalic.ttf', '2022-02-19 16:25:26'),
(1139, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts/OpenSans-Regular.ttf', '2022-02-19 16:25:26'),
(1140, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts/OpenSans-Semibold.ttf', '2022-02-19 16:25:26'),
(1141, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/fonts/OpenSans-SemiboldItalic.ttf', '2022-02-19 16:25:26'),
(1142, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/themes/default.css', '2022-02-19 16:25:26'),
(1143, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/themes/default.css.map', '2022-02-19 16:25:26'),
(1144, 7, 'catalog/view/theme/default/stylesheet/d_ajax_filter/themes/default.scss', '2022-02-19 16:25:26'),
(1145, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/component', '2022-02-19 16:25:26'),
(1146, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/d_ajax_filter.twig', '2022-02-19 16:25:26'),
(1147, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group', '2022-02-19 16:25:26'),
(1148, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-bg_flat_0_aaaaaa_40x100.png', '2022-02-19 16:25:26'),
(1149, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-bg_flat_75_ffffff_40x100.png', '2022-02-19 16:25:26'),
(1150, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-bg_glass_55_fbf9ee_1x400.png', '2022-02-19 16:25:26'),
(1151, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-bg_glass_65_ffffff_1x400.png', '2022-02-19 16:25:26'),
(1152, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-bg_glass_75_dadada_1x400.png', '2022-02-19 16:25:26'),
(1153, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-bg_glass_75_e6e6e6_1x400.png', '2022-02-19 16:25:26'),
(1154, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-bg_glass_95_fef1ec_1x400.png', '2022-02-19 16:25:26'),
(1155, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png', '2022-02-19 16:25:26'),
(1156, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-icons_222222_256x240.png', '2022-02-19 16:25:26'),
(1157, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-icons_2e83ff_256x240.png', '2022-02-19 16:25:26'),
(1158, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-icons_454545_256x240.png', '2022-02-19 16:25:26'),
(1159, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-icons_888888_256x240.png', '2022-02-19 16:25:26'),
(1160, 7, 'system/library/d_elfinder/jquery/ui-themes/smoothness/images/ui-icons_cd0a0a_256x240.png', '2022-02-19 16:25:26'),
(1161, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/component/af_button_filter.tag', '2022-02-19 16:25:26'),
(1162, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/component/af_button_view_all.tag', '2022-02-19 16:25:26'),
(1163, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/component/af_group.tag', '2022-02-19 16:25:26'),
(1164, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/component/af_loader.tag', '2022-02-19 16:25:26'),
(1165, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/component/af_quantity.tag', '2022-02-19 16:25:26'),
(1166, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/component/af_selected.tag', '2022-02-19 16:25:26'),
(1167, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/component/af_selected_range.tag', '2022-02-19 16:25:26'),
(1168, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/component/d_ajax_filter.tag', '2022-02-19 16:25:26'),
(1169, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_checkbox.tag', '2022-02-19 16:25:26'),
(1170, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_checkbox_and_image.tag', '2022-02-19 16:25:26'),
(1171, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_image_checkbox.tag', '2022-02-19 16:25:26'),
(1172, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_image_radio.tag', '2022-02-19 16:25:26'),
(1173, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_radio.tag', '2022-02-19 16:25:26'),
(1174, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_radio_and_image.tag', '2022-02-19 16:25:26'),
(1175, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_select.tag', '2022-02-19 16:25:26'),
(1176, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_slider_inputs.tag', '2022-02-19 16:25:26'),
(1177, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_slider_label.tag', '2022-02-19 16:25:26'),
(1178, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_star_checbox.tag', '2022-02-19 16:25:26'),
(1179, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_star_radio.tag', '2022-02-19 16:25:26'),
(1180, 7, 'catalog/view/theme/default/template/extension/d_ajax_filter/group/af_group_text.tag', '2022-02-19 16:25:26'),
(1181, 8, 'admin/language/uk-ua/catalog', '2022-02-19 17:51:15'),
(1182, 8, 'admin/language/uk-ua/common', '2022-02-19 17:51:15'),
(1183, 8, 'admin/language/uk-ua/customer', '2022-02-19 17:51:15'),
(1184, 8, 'admin/language/uk-ua/design', '2022-02-19 17:51:15'),
(1185, 8, 'admin/language/uk-ua/error', '2022-02-19 17:51:15'),
(1186, 8, 'admin/language/uk-ua/localisation', '2022-02-19 17:51:15'),
(1187, 8, 'admin/language/uk-ua/mail', '2022-02-19 17:51:15'),
(1188, 8, 'admin/language/uk-ua/marketing', '2022-02-19 17:51:15'),
(1189, 8, 'admin/language/uk-ua/report', '2022-02-19 17:51:15'),
(1190, 8, 'admin/language/uk-ua/sale', '2022-02-19 17:51:15'),
(1191, 8, 'admin/language/uk-ua/setting', '2022-02-19 17:51:15'),
(1192, 8, 'admin/language/uk-ua/tool', '2022-02-19 17:51:15'),
(1193, 8, 'admin/language/uk-ua/uk-ua.php', '2022-02-19 17:51:15'),
(1194, 8, 'admin/language/uk-ua/uk-ua.png', '2022-02-19 17:51:15'),
(1195, 8, 'admin/language/uk-ua/user', '2022-02-19 17:51:15'),
(1196, 8, 'catalog/language/uk-ua/account', '2022-02-19 17:51:15'),
(1197, 8, 'catalog/language/uk-ua/affiliate', '2022-02-19 17:51:15'),
(1198, 8, 'catalog/language/uk-ua/api', '2022-02-19 17:51:15'),
(1199, 8, 'catalog/language/uk-ua/checkout', '2022-02-19 17:51:15'),
(1200, 8, 'catalog/language/uk-ua/common', '2022-02-19 17:51:15'),
(1201, 8, 'catalog/language/uk-ua/error', '2022-02-19 17:51:15'),
(1202, 8, 'catalog/language/uk-ua/information', '2022-02-19 17:51:15'),
(1203, 8, 'catalog/language/uk-ua/mail', '2022-02-19 17:51:15'),
(1204, 8, 'catalog/language/uk-ua/product', '2022-02-19 17:51:15'),
(1205, 8, 'catalog/language/uk-ua/tool', '2022-02-19 17:51:15'),
(1206, 8, 'catalog/language/uk-ua/uk-ua.php', '2022-02-19 17:51:15'),
(1207, 8, 'catalog/language/uk-ua/uk-ua.png', '2022-02-19 17:51:15'),
(1208, 8, 'admin/language/uk-ua/catalog/attribute.php', '2022-02-19 17:51:15'),
(1209, 8, 'admin/language/uk-ua/catalog/attribute_group.php', '2022-02-19 17:51:15'),
(1210, 8, 'admin/language/uk-ua/catalog/category.php', '2022-02-19 17:51:15'),
(1211, 8, 'admin/language/uk-ua/catalog/download.php', '2022-02-19 17:51:15'),
(1212, 8, 'admin/language/uk-ua/catalog/filter.php', '2022-02-19 17:51:15'),
(1213, 8, 'admin/language/uk-ua/catalog/information.php', '2022-02-19 17:51:15'),
(1214, 8, 'admin/language/uk-ua/catalog/manufacturer.php', '2022-02-19 17:51:15'),
(1215, 8, 'admin/language/uk-ua/catalog/option.php', '2022-02-19 17:51:15'),
(1216, 8, 'admin/language/uk-ua/catalog/product.php', '2022-02-19 17:51:15'),
(1217, 8, 'admin/language/uk-ua/catalog/recurring.php', '2022-02-19 17:51:15'),
(1218, 8, 'admin/language/uk-ua/catalog/review.php', '2022-02-19 17:51:15'),
(1219, 8, 'admin/language/uk-ua/common/column_left.php', '2022-02-19 17:51:15'),
(1220, 8, 'admin/language/uk-ua/common/dashboard.php', '2022-02-19 17:51:15'),
(1221, 8, 'admin/language/uk-ua/common/filemanager.php', '2022-02-19 17:51:15'),
(1222, 8, 'admin/language/uk-ua/common/footer.php', '2022-02-19 17:51:15'),
(1223, 8, 'admin/language/uk-ua/common/forgotten.php', '2022-02-19 17:51:15'),
(1224, 8, 'admin/language/uk-ua/common/header.php', '2022-02-19 17:51:15'),
(1225, 8, 'admin/language/uk-ua/common/login.php', '2022-02-19 17:51:15'),
(1226, 8, 'admin/language/uk-ua/common/reset.php', '2022-02-19 17:51:15'),
(1227, 8, 'admin/language/uk-ua/customer/custom_field.php', '2022-02-19 17:51:15'),
(1228, 8, 'admin/language/uk-ua/customer/customer.php', '2022-02-19 17:51:15'),
(1229, 8, 'admin/language/uk-ua/customer/customer_group.php', '2022-02-19 17:51:15'),
(1230, 8, 'admin/language/uk-ua/design/banner.php', '2022-02-19 17:51:15'),
(1231, 8, 'admin/language/uk-ua/design/language.php', '2022-02-19 17:51:15'),
(1232, 8, 'admin/language/uk-ua/design/layout.php', '2022-02-19 17:51:15'),
(1233, 8, 'admin/language/uk-ua/design/menu.php', '2022-02-19 17:51:15'),
(1234, 8, 'admin/language/uk-ua/design/theme.php', '2022-02-19 17:51:15'),
(1235, 8, 'admin/language/uk-ua/design/translation.php', '2022-02-19 17:51:15'),
(1236, 8, 'admin/language/uk-ua/error/not_found.php', '2022-02-19 17:51:15'),
(1237, 8, 'admin/language/uk-ua/error/permission.php', '2022-02-19 17:51:15'),
(1238, 8, 'admin/language/uk-ua/extension/analytics', '2022-02-19 17:51:15'),
(1239, 8, 'admin/language/uk-ua/extension/captcha', '2022-02-19 17:51:15'),
(1240, 8, 'admin/language/uk-ua/extension/dashboard', '2022-02-19 17:51:15'),
(1241, 8, 'admin/language/uk-ua/extension/event.php', '2022-02-19 17:51:15'),
(1242, 8, 'admin/language/uk-ua/extension/extension', '2022-02-19 17:51:15'),
(1243, 8, 'admin/language/uk-ua/extension/extension.php', '2022-02-19 17:51:15'),
(1244, 8, 'admin/language/uk-ua/extension/feed', '2022-02-19 17:51:15'),
(1245, 8, 'admin/language/uk-ua/extension/fraud', '2022-02-19 17:51:15'),
(1246, 8, 'admin/language/uk-ua/extension/installer.php', '2022-02-19 17:51:15'),
(1247, 8, 'admin/language/uk-ua/extension/modification.php', '2022-02-19 17:51:15'),
(1248, 8, 'admin/language/uk-ua/extension/openbay', '2022-02-19 17:51:15'),
(1249, 8, 'admin/language/uk-ua/extension/payment', '2022-02-19 17:51:15'),
(1250, 8, 'admin/language/uk-ua/extension/shipping', '2022-02-19 17:51:15'),
(1251, 8, 'admin/language/uk-ua/extension/store.php', '2022-02-19 17:51:15'),
(1252, 8, 'admin/language/uk-ua/extension/theme', '2022-02-19 17:51:15'),
(1253, 8, 'admin/language/uk-ua/extension/total', '2022-02-19 17:51:15'),
(1254, 8, 'admin/language/uk-ua/localisation/country.php', '2022-02-19 17:51:15'),
(1255, 8, 'admin/language/uk-ua/localisation/currency.php', '2022-02-19 17:51:15'),
(1256, 8, 'admin/language/uk-ua/localisation/geo_zone.php', '2022-02-19 17:51:15'),
(1257, 8, 'admin/language/uk-ua/localisation/language.php', '2022-02-19 17:51:15'),
(1258, 8, 'admin/language/uk-ua/localisation/length_class.php', '2022-02-19 17:51:15'),
(1259, 8, 'admin/language/uk-ua/localisation/location.php', '2022-02-19 17:51:15'),
(1260, 8, 'admin/language/uk-ua/localisation/order_status.php', '2022-02-19 17:51:15'),
(1261, 8, 'admin/language/uk-ua/localisation/return_action.php', '2022-02-19 17:51:15'),
(1262, 8, 'admin/language/uk-ua/localisation/return_reason.php', '2022-02-19 17:51:15'),
(1263, 8, 'admin/language/uk-ua/localisation/return_status.php', '2022-02-19 17:51:15'),
(1264, 8, 'admin/language/uk-ua/localisation/stock_status.php', '2022-02-19 17:51:15'),
(1265, 8, 'admin/language/uk-ua/localisation/tax_class.php', '2022-02-19 17:51:15'),
(1266, 8, 'admin/language/uk-ua/localisation/tax_rate.php', '2022-02-19 17:51:15'),
(1267, 8, 'admin/language/uk-ua/localisation/weight_class.php', '2022-02-19 17:51:15'),
(1268, 8, 'admin/language/uk-ua/localisation/zone.php', '2022-02-19 17:51:15'),
(1269, 8, 'admin/language/uk-ua/mail/affiliate.php', '2022-02-19 17:51:15'),
(1270, 8, 'admin/language/uk-ua/mail/customer.php', '2022-02-19 17:51:15'),
(1271, 8, 'admin/language/uk-ua/mail/forgotten.php', '2022-02-19 17:51:15'),
(1272, 8, 'admin/language/uk-ua/mail/return.php', '2022-02-19 17:51:15'),
(1273, 8, 'admin/language/uk-ua/mail/voucher.php', '2022-02-19 17:51:15'),
(1274, 8, 'admin/language/uk-ua/marketing/affiliate.php', '2022-02-19 17:51:15'),
(1275, 8, 'admin/language/uk-ua/marketing/contact.php', '2022-02-19 17:51:15'),
(1276, 8, 'admin/language/uk-ua/marketing/coupon.php', '2022-02-19 17:51:15'),
(1277, 8, 'admin/language/uk-ua/marketing/marketing.php', '2022-02-19 17:51:15'),
(1278, 8, 'admin/language/uk-ua/report/affiliate.php', '2022-02-19 17:51:15'),
(1279, 8, 'admin/language/uk-ua/report/affiliate_activity.php', '2022-02-19 17:51:15'),
(1280, 8, 'admin/language/uk-ua/report/customer_activity.php', '2022-02-19 17:51:15'),
(1281, 8, 'admin/language/uk-ua/report/customer_credit.php', '2022-02-19 17:51:15'),
(1282, 8, 'admin/language/uk-ua/report/customer_online.php', '2022-02-19 17:51:15'),
(1283, 8, 'admin/language/uk-ua/report/customer_order.php', '2022-02-19 17:51:15'),
(1284, 8, 'admin/language/uk-ua/report/customer_reward.php', '2022-02-19 17:51:15'),
(1285, 8, 'admin/language/uk-ua/report/customer_search.php', '2022-02-19 17:51:15'),
(1286, 8, 'admin/language/uk-ua/report/marketing.php', '2022-02-19 17:51:15'),
(1287, 8, 'admin/language/uk-ua/report/product_purchased.php', '2022-02-19 17:51:15'),
(1288, 8, 'admin/language/uk-ua/report/product_viewed.php', '2022-02-19 17:51:15'),
(1289, 8, 'admin/language/uk-ua/report/sale_coupon.php', '2022-02-19 17:51:15'),
(1290, 8, 'admin/language/uk-ua/report/sale_order.php', '2022-02-19 17:51:15'),
(1291, 8, 'admin/language/uk-ua/report/sale_return.php', '2022-02-19 17:51:15'),
(1292, 8, 'admin/language/uk-ua/report/sale_shipping.php', '2022-02-19 17:51:15'),
(1293, 8, 'admin/language/uk-ua/report/sale_tax.php', '2022-02-19 17:51:15'),
(1294, 8, 'admin/language/uk-ua/sale/order.php', '2022-02-19 17:51:15'),
(1295, 8, 'admin/language/uk-ua/sale/recurring.php', '2022-02-19 17:51:15'),
(1296, 8, 'admin/language/uk-ua/sale/return.php', '2022-02-19 17:51:15'),
(1297, 8, 'admin/language/uk-ua/sale/voucher.php', '2022-02-19 17:51:15'),
(1298, 8, 'admin/language/uk-ua/sale/voucher_theme.php', '2022-02-19 17:51:15'),
(1299, 8, 'admin/language/uk-ua/setting/setting.php', '2022-02-19 17:51:15'),
(1300, 8, 'admin/language/uk-ua/setting/store.php', '2022-02-19 17:51:15'),
(1301, 8, 'admin/language/uk-ua/tool/backup.php', '2022-02-19 17:51:15'),
(1302, 8, 'admin/language/uk-ua/tool/log.php', '2022-02-19 17:51:15'),
(1303, 8, 'admin/language/uk-ua/tool/upload.php', '2022-02-19 17:51:15'),
(1304, 8, 'admin/language/uk-ua/user/api.php', '2022-02-19 17:51:15'),
(1305, 8, 'admin/language/uk-ua/user/user.php', '2022-02-19 17:51:15'),
(1306, 8, 'admin/language/uk-ua/user/user_group.php', '2022-02-19 17:51:15'),
(1307, 8, 'catalog/language/uk-ua/account/account.php', '2022-02-19 17:51:15'),
(1308, 8, 'catalog/language/uk-ua/account/address.php', '2022-02-19 17:51:15'),
(1309, 8, 'catalog/language/uk-ua/account/download.php', '2022-02-19 17:51:15'),
(1310, 8, 'catalog/language/uk-ua/account/edit.php', '2022-02-19 17:51:15'),
(1311, 8, 'catalog/language/uk-ua/account/forgotten.php', '2022-02-19 17:51:15'),
(1312, 8, 'catalog/language/uk-ua/account/login.php', '2022-02-19 17:51:15'),
(1313, 8, 'catalog/language/uk-ua/account/logout.php', '2022-02-19 17:51:15'),
(1314, 8, 'catalog/language/uk-ua/account/newsletter.php', '2022-02-19 17:51:15'),
(1315, 8, 'catalog/language/uk-ua/account/order.php', '2022-02-19 17:51:15'),
(1316, 8, 'catalog/language/uk-ua/account/password.php', '2022-02-19 17:51:15'),
(1317, 8, 'catalog/language/uk-ua/account/recurring.php', '2022-02-19 17:51:15'),
(1318, 8, 'catalog/language/uk-ua/account/register.php', '2022-02-19 17:51:15'),
(1319, 8, 'catalog/language/uk-ua/account/reset.php', '2022-02-19 17:51:15'),
(1320, 8, 'catalog/language/uk-ua/account/return.php', '2022-02-19 17:51:15'),
(1321, 8, 'catalog/language/uk-ua/account/reward.php', '2022-02-19 17:51:15'),
(1322, 8, 'catalog/language/uk-ua/account/success.php', '2022-02-19 17:51:15'),
(1323, 8, 'catalog/language/uk-ua/account/transaction.php', '2022-02-19 17:51:15'),
(1324, 8, 'catalog/language/uk-ua/account/voucher.php', '2022-02-19 17:51:15'),
(1325, 8, 'catalog/language/uk-ua/account/wishlist.php', '2022-02-19 17:51:15'),
(1326, 8, 'catalog/language/uk-ua/affiliate/account.php', '2022-02-19 17:51:15'),
(1327, 8, 'catalog/language/uk-ua/affiliate/edit.php', '2022-02-19 17:51:15'),
(1328, 8, 'catalog/language/uk-ua/affiliate/forgotten.php', '2022-02-19 17:51:15'),
(1329, 8, 'catalog/language/uk-ua/affiliate/login.php', '2022-02-19 17:51:15'),
(1330, 8, 'catalog/language/uk-ua/affiliate/logout.php', '2022-02-19 17:51:15'),
(1331, 8, 'catalog/language/uk-ua/affiliate/password.php', '2022-02-19 17:51:15'),
(1332, 8, 'catalog/language/uk-ua/affiliate/payment.php', '2022-02-19 17:51:15'),
(1333, 8, 'catalog/language/uk-ua/affiliate/register.php', '2022-02-19 17:51:15'),
(1334, 8, 'catalog/language/uk-ua/affiliate/success.php', '2022-02-19 17:51:15'),
(1335, 8, 'catalog/language/uk-ua/affiliate/tracking.php', '2022-02-19 17:51:15'),
(1336, 8, 'catalog/language/uk-ua/affiliate/transaction.php', '2022-02-19 17:51:15'),
(1337, 8, 'catalog/language/uk-ua/api/cart.php', '2022-02-19 17:51:15'),
(1338, 8, 'catalog/language/uk-ua/api/coupon.php', '2022-02-19 17:51:15'),
(1339, 8, 'catalog/language/uk-ua/api/customer.php', '2022-02-19 17:51:15'),
(1340, 8, 'catalog/language/uk-ua/api/login.php', '2022-02-19 17:51:15'),
(1341, 8, 'catalog/language/uk-ua/api/order.php', '2022-02-19 17:51:15'),
(1342, 8, 'catalog/language/uk-ua/api/payment.php', '2022-02-19 17:51:15'),
(1343, 8, 'catalog/language/uk-ua/api/reward.php', '2022-02-19 17:51:15'),
(1344, 8, 'catalog/language/uk-ua/api/shipping.php', '2022-02-19 17:51:15'),
(1345, 8, 'catalog/language/uk-ua/api/voucher.php', '2022-02-19 17:51:15'),
(1346, 8, 'catalog/language/uk-ua/checkout/cart.php', '2022-02-19 17:51:15'),
(1347, 8, 'catalog/language/uk-ua/checkout/checkout.php', '2022-02-19 17:51:15'),
(1348, 8, 'catalog/language/uk-ua/checkout/failure.php', '2022-02-19 17:51:15'),
(1349, 8, 'catalog/language/uk-ua/checkout/success.php', '2022-02-19 17:51:15'),
(1350, 8, 'catalog/language/uk-ua/common/cart.php', '2022-02-19 17:51:15'),
(1351, 8, 'catalog/language/uk-ua/common/currency.php', '2022-02-19 17:51:15'),
(1352, 8, 'catalog/language/uk-ua/common/footer.php', '2022-02-19 17:51:15'),
(1353, 8, 'catalog/language/uk-ua/common/header.php', '2022-02-19 17:51:15'),
(1354, 8, 'catalog/language/uk-ua/common/language.php', '2022-02-19 17:51:15'),
(1355, 8, 'catalog/language/uk-ua/common/maintenance.php', '2022-02-19 17:51:15'),
(1356, 8, 'catalog/language/uk-ua/common/menu.php', '2022-02-19 17:51:15'),
(1357, 8, 'catalog/language/uk-ua/common/search.php', '2022-02-19 17:51:15'),
(1358, 8, 'catalog/language/uk-ua/error/not_found.php', '2022-02-19 17:51:15'),
(1359, 8, 'catalog/language/uk-ua/extension/captcha', '2022-02-19 17:51:15'),
(1360, 8, 'catalog/language/uk-ua/extension/module', '2022-02-19 17:51:15'),
(1361, 8, 'catalog/language/uk-ua/extension/openbay', '2022-02-19 17:51:15'),
(1362, 8, 'catalog/language/uk-ua/extension/payment', '2022-02-19 17:51:15'),
(1363, 8, 'catalog/language/uk-ua/extension/recurring', '2022-02-19 17:51:15'),
(1364, 8, 'catalog/language/uk-ua/extension/shipping', '2022-02-19 17:51:15'),
(1365, 8, 'catalog/language/uk-ua/extension/total', '2022-02-19 17:51:15'),
(1366, 8, 'catalog/language/uk-ua/information/contact.php', '2022-02-19 17:51:15'),
(1367, 8, 'catalog/language/uk-ua/information/information.php', '2022-02-19 17:51:15'),
(1368, 8, 'catalog/language/uk-ua/information/sitemap.php', '2022-02-19 17:51:15'),
(1369, 8, 'catalog/language/uk-ua/mail/affiliate.php', '2022-02-19 17:51:15'),
(1370, 8, 'catalog/language/uk-ua/mail/customer.php', '2022-02-19 17:51:15'),
(1371, 8, 'catalog/language/uk-ua/mail/forgotten.php', '2022-02-19 17:51:15'),
(1372, 8, 'catalog/language/uk-ua/mail/order.php', '2022-02-19 17:51:15'),
(1373, 8, 'catalog/language/uk-ua/mail/review.php', '2022-02-19 17:51:15'),
(1374, 8, 'catalog/language/uk-ua/mail/voucher.php', '2022-02-19 17:51:15'),
(1375, 8, 'catalog/language/uk-ua/product/category.php', '2022-02-19 17:51:15'),
(1376, 8, 'catalog/language/uk-ua/product/compare.php', '2022-02-19 17:51:15'),
(1377, 8, 'catalog/language/uk-ua/product/manufacturer.php', '2022-02-19 17:51:15'),
(1378, 8, 'catalog/language/uk-ua/product/product.php', '2022-02-19 17:51:15'),
(1379, 8, 'catalog/language/uk-ua/product/search.php', '2022-02-19 17:51:15'),
(1380, 8, 'catalog/language/uk-ua/product/special.php', '2022-02-19 17:51:15'),
(1381, 8, 'catalog/language/uk-ua/tool/upload.php', '2022-02-19 17:51:15'),
(1382, 8, 'admin/language/uk-ua/extension/analytics/google_analytics.php', '2022-02-19 17:51:15'),
(1383, 8, 'admin/language/uk-ua/extension/captcha/basic_captcha.php', '2022-02-19 17:51:15'),
(1384, 8, 'admin/language/uk-ua/extension/captcha/google_captcha.php', '2022-02-19 17:51:15'),
(1385, 8, 'admin/language/uk-ua/extension/dashboard/activity.php', '2022-02-19 17:51:15'),
(1386, 8, 'admin/language/uk-ua/extension/dashboard/chart.php', '2022-02-19 17:51:15'),
(1387, 8, 'admin/language/uk-ua/extension/dashboard/customer.php', '2022-02-19 17:51:15'),
(1388, 8, 'admin/language/uk-ua/extension/dashboard/map.php', '2022-02-19 17:51:15'),
(1389, 8, 'admin/language/uk-ua/extension/dashboard/online.php', '2022-02-19 17:51:15'),
(1390, 8, 'admin/language/uk-ua/extension/dashboard/order.php', '2022-02-19 17:51:15'),
(1391, 8, 'admin/language/uk-ua/extension/dashboard/recent.php', '2022-02-19 17:51:15'),
(1392, 8, 'admin/language/uk-ua/extension/dashboard/sale.php', '2022-02-19 17:51:15'),
(1393, 8, 'admin/language/uk-ua/extension/extension/analytics.php', '2022-02-19 17:51:15'),
(1394, 8, 'admin/language/uk-ua/extension/extension/captcha.php', '2022-02-19 17:51:15'),
(1395, 8, 'admin/language/uk-ua/extension/extension/dashboard.php', '2022-02-19 17:51:15'),
(1396, 8, 'admin/language/uk-ua/extension/extension/feed.php', '2022-02-19 17:51:15'),
(1397, 8, 'admin/language/uk-ua/extension/extension/fraud.php', '2022-02-19 17:51:15'),
(1398, 8, 'admin/language/uk-ua/extension/extension/module.php', '2022-02-19 17:51:15'),
(1399, 8, 'admin/language/uk-ua/extension/extension/payment.php', '2022-02-19 17:51:15'),
(1400, 8, 'admin/language/uk-ua/extension/extension/shipping.php', '2022-02-19 17:51:15'),
(1401, 8, 'admin/language/uk-ua/extension/extension/theme.php', '2022-02-19 17:51:15'),
(1402, 8, 'admin/language/uk-ua/extension/extension/total.php', '2022-02-19 17:51:15'),
(1403, 8, 'admin/language/uk-ua/extension/feed/google_base.php', '2022-02-19 17:51:15'),
(1404, 8, 'admin/language/uk-ua/extension/feed/google_sitemap.php', '2022-02-19 17:51:15'),
(1405, 8, 'admin/language/uk-ua/extension/fraud/ip.php', '2022-02-19 17:51:15'),
(1406, 8, 'admin/language/uk-ua/extension/module/account.php', '2022-02-19 17:51:15'),
(1407, 8, 'admin/language/uk-ua/extension/module/affiliate.php', '2022-02-19 17:51:15'),
(1408, 8, 'admin/language/uk-ua/extension/module/banner.php', '2022-02-19 17:51:15'),
(1409, 8, 'admin/language/uk-ua/extension/module/bestseller.php', '2022-02-19 17:51:15'),
(1410, 8, 'admin/language/uk-ua/extension/module/carousel.php', '2022-02-19 17:51:15'),
(1411, 8, 'admin/language/uk-ua/extension/module/category.php', '2022-02-19 17:51:15'),
(1412, 8, 'admin/language/uk-ua/extension/module/featured.php', '2022-02-19 17:51:15'),
(1413, 8, 'admin/language/uk-ua/extension/module/filter.php', '2022-02-19 17:51:15'),
(1414, 8, 'admin/language/uk-ua/extension/module/google_hangouts.php', '2022-02-19 17:51:15'),
(1415, 8, 'admin/language/uk-ua/extension/module/html.php', '2022-02-19 17:51:15'),
(1416, 8, 'admin/language/uk-ua/extension/module/information.php', '2022-02-19 17:51:15'),
(1417, 8, 'admin/language/uk-ua/extension/module/latest.php', '2022-02-19 17:51:15'),
(1418, 8, 'admin/language/uk-ua/extension/module/pp_button.php', '2022-02-19 17:51:15'),
(1419, 8, 'admin/language/uk-ua/extension/module/slideshow.php', '2022-02-19 17:51:15'),
(1420, 8, 'admin/language/uk-ua/extension/module/special.php', '2022-02-19 17:51:15'),
(1421, 8, 'admin/language/uk-ua/extension/module/store.php', '2022-02-19 17:51:15'),
(1422, 8, 'admin/language/uk-ua/extension/payment/bank_transfer.php', '2022-02-19 17:51:15'),
(1423, 8, 'admin/language/uk-ua/extension/payment/cheque.php', '2022-02-19 17:51:15'),
(1424, 8, 'admin/language/uk-ua/extension/payment/cod.php', '2022-02-19 17:51:15'),
(1425, 8, 'admin/language/uk-ua/extension/payment/free_checkout.php', '2022-02-19 17:51:15'),
(1426, 8, 'admin/language/uk-ua/extension/payment/liqpay.php', '2022-02-19 17:51:15'),
(1427, 8, 'admin/language/uk-ua/extension/payment/pp_express.php', '2022-02-19 17:51:15'),
(1428, 8, 'admin/language/uk-ua/extension/payment/pp_express_order.php', '2022-02-19 17:51:15'),
(1429, 8, 'admin/language/uk-ua/extension/payment/pp_express_refund.php', '2022-02-19 17:51:15'),
(1430, 8, 'admin/language/uk-ua/extension/payment/pp_express_search.php', '2022-02-19 17:51:15'),
(1431, 8, 'admin/language/uk-ua/extension/payment/pp_express_view.php', '2022-02-19 17:51:15'),
(1432, 8, 'admin/language/uk-ua/extension/payment/pp_pro.php', '2022-02-19 17:51:15'),
(1433, 8, 'admin/language/uk-ua/extension/payment/pp_standard.php', '2022-02-19 17:51:15'),
(1434, 8, 'admin/language/uk-ua/extension/shipping/citylink.php', '2022-02-19 17:51:15'),
(1435, 8, 'admin/language/uk-ua/extension/shipping/flat.php', '2022-02-19 17:51:15'),
(1436, 8, 'admin/language/uk-ua/extension/shipping/free.php', '2022-02-19 17:51:15'),
(1437, 8, 'admin/language/uk-ua/extension/shipping/item.php', '2022-02-19 17:51:15'),
(1438, 8, 'admin/language/uk-ua/extension/shipping/pickup.php', '2022-02-19 17:51:15'),
(1439, 8, 'admin/language/uk-ua/extension/shipping/weight.php', '2022-02-19 17:51:15'),
(1440, 8, 'admin/language/uk-ua/extension/theme/theme_default.php', '2022-02-19 17:51:15'),
(1441, 8, 'admin/language/uk-ua/extension/total/coupon.php', '2022-02-19 17:51:15'),
(1442, 8, 'admin/language/uk-ua/extension/total/credit.php', '2022-02-19 17:51:15'),
(1443, 8, 'admin/language/uk-ua/extension/total/handling.php', '2022-02-19 17:51:15'),
(1444, 8, 'admin/language/uk-ua/extension/total/low_order_fee.php', '2022-02-19 17:51:15'),
(1445, 8, 'admin/language/uk-ua/extension/total/reward.php', '2022-02-19 17:51:15'),
(1446, 8, 'admin/language/uk-ua/extension/total/shipping.php', '2022-02-19 17:51:15'),
(1447, 8, 'admin/language/uk-ua/extension/total/sub_total.php', '2022-02-19 17:51:15'),
(1448, 8, 'admin/language/uk-ua/extension/total/tax.php', '2022-02-19 17:51:15'),
(1449, 8, 'admin/language/uk-ua/extension/total/total.php', '2022-02-19 17:51:15'),
(1450, 8, 'admin/language/uk-ua/extension/total/voucher.php', '2022-02-19 17:51:15'),
(1451, 8, 'catalog/language/uk-ua/extension/captcha/basic_captcha.php', '2022-02-19 17:51:15'),
(1452, 8, 'catalog/language/uk-ua/extension/captcha/google_captcha.php', '2022-02-19 17:51:15'),
(1453, 8, 'catalog/language/uk-ua/extension/module/account.php', '2022-02-19 17:51:15'),
(1454, 8, 'catalog/language/uk-ua/extension/module/affiliate.php', '2022-02-19 17:51:15'),
(1455, 8, 'catalog/language/uk-ua/extension/module/bestseller.php', '2022-02-19 17:51:15'),
(1456, 8, 'catalog/language/uk-ua/extension/module/category.php', '2022-02-19 17:51:15'),
(1457, 8, 'catalog/language/uk-ua/extension/module/featured.php', '2022-02-19 17:51:15'),
(1458, 8, 'catalog/language/uk-ua/extension/module/filter.php', '2022-02-19 17:51:15'),
(1459, 8, 'catalog/language/uk-ua/extension/module/google_hangouts.php', '2022-02-19 17:51:15'),
(1460, 8, 'catalog/language/uk-ua/extension/module/information.php', '2022-02-19 17:51:15'),
(1461, 8, 'catalog/language/uk-ua/extension/module/latest.php', '2022-02-19 17:51:15'),
(1462, 8, 'catalog/language/uk-ua/extension/module/sms_alert.php', '2022-02-19 17:51:15'),
(1463, 8, 'catalog/language/uk-ua/extension/module/special.php', '2022-02-19 17:51:15'),
(1464, 8, 'catalog/language/uk-ua/extension/module/store.php', '2022-02-19 17:51:15'),
(1465, 8, 'catalog/language/uk-ua/extension/payment/bank_transfer.php', '2022-02-19 17:51:15'),
(1466, 8, 'catalog/language/uk-ua/extension/payment/cheque.php', '2022-02-19 17:51:15'),
(1467, 8, 'catalog/language/uk-ua/extension/payment/cod.php', '2022-02-19 17:51:15'),
(1468, 8, 'catalog/language/uk-ua/extension/payment/free_checkout.php', '2022-02-19 17:51:15'),
(1469, 8, 'catalog/language/uk-ua/extension/payment/liqpay.php', '2022-02-19 17:51:15'),
(1470, 8, 'catalog/language/uk-ua/extension/payment/moneybookers.php', '2022-02-19 17:51:15'),
(1471, 8, 'catalog/language/uk-ua/extension/payment/pp_express.php', '2022-02-19 17:51:15'),
(1472, 8, 'catalog/language/uk-ua/extension/payment/pp_pro.php', '2022-02-19 17:51:15'),
(1473, 8, 'catalog/language/uk-ua/extension/payment/pp_standard.php', '2022-02-19 17:51:15'),
(1474, 8, 'catalog/language/uk-ua/extension/recurring/pp_express.php', '2022-02-19 17:51:15'),
(1475, 8, 'catalog/language/uk-ua/extension/shipping/citylink.php', '2022-02-19 17:51:15'),
(1476, 8, 'catalog/language/uk-ua/extension/shipping/flat.php', '2022-02-19 17:51:15'),
(1477, 8, 'catalog/language/uk-ua/extension/shipping/free.php', '2022-02-19 17:51:15'),
(1478, 8, 'catalog/language/uk-ua/extension/shipping/item.php', '2022-02-19 17:51:15'),
(1479, 8, 'catalog/language/uk-ua/extension/shipping/pickup.php', '2022-02-19 17:51:15'),
(1480, 8, 'catalog/language/uk-ua/extension/shipping/weight.php', '2022-02-19 17:51:15'),
(1481, 8, 'catalog/language/uk-ua/extension/total/coupon.php', '2022-02-19 17:51:15'),
(1482, 8, 'catalog/language/uk-ua/extension/total/credit.php', '2022-02-19 17:51:15'),
(1483, 8, 'catalog/language/uk-ua/extension/total/handling.php', '2022-02-19 17:51:15'),
(1484, 8, 'catalog/language/uk-ua/extension/total/low_order_fee.php', '2022-02-19 17:51:15'),
(1485, 8, 'catalog/language/uk-ua/extension/total/reward.php', '2022-02-19 17:51:15'),
(1486, 8, 'catalog/language/uk-ua/extension/total/shipping.php', '2022-02-19 17:51:15'),
(1487, 8, 'catalog/language/uk-ua/extension/total/sub_total.php', '2022-02-19 17:51:15'),
(1488, 8, 'catalog/language/uk-ua/extension/total/total.php', '2022-02-19 17:51:15'),
(1489, 8, 'catalog/language/uk-ua/extension/total/voucher.php', '2022-02-19 17:51:15'),
(1622, 9, 'catalog/language/uk-ua/account/logout.php', '2022-02-19 19:43:25'),
(1623, 9, 'catalog/language/uk-ua/account/newsletter.php', '2022-02-19 19:43:25'),
(1624, 9, 'catalog/language/uk-ua/account/order.php', '2022-02-19 19:43:25'),
(1625, 9, 'catalog/language/uk-ua/account/password.php', '2022-02-19 19:43:25'),
(1626, 9, 'catalog/language/uk-ua/account/recurring.php', '2022-02-19 19:43:25'),
(1627, 9, 'catalog/language/uk-ua/account/register.php', '2022-02-19 19:43:25'),
(1628, 9, 'catalog/language/uk-ua/account/reset.php', '2022-02-19 19:43:25'),
(1629, 9, 'catalog/language/uk-ua/account/return.php', '2022-02-19 19:43:25'),
(1630, 9, 'catalog/language/uk-ua/account/reward.php', '2022-02-19 19:43:25'),
(1631, 9, 'catalog/language/uk-ua/account/success.php', '2022-02-19 19:43:25'),
(1632, 9, 'catalog/language/uk-ua/account/transaction.php', '2022-02-19 19:43:25'),
(1633, 9, 'catalog/language/uk-ua/account/voucher.php', '2022-02-19 19:43:25'),
(1634, 9, 'catalog/language/uk-ua/account/wishlist.php', '2022-02-19 19:43:25'),
(1635, 9, 'catalog/language/uk-ua/affiliate/account.php', '2022-02-19 19:43:25'),
(1636, 9, 'catalog/language/uk-ua/affiliate/edit.php', '2022-02-19 19:43:25'),
(1637, 9, 'catalog/language/uk-ua/affiliate/forgotten.php', '2022-02-19 19:43:25'),
(1638, 9, 'catalog/language/uk-ua/affiliate/login.php', '2022-02-19 19:43:25'),
(1639, 9, 'catalog/language/uk-ua/affiliate/logout.php', '2022-02-19 19:43:25'),
(1640, 9, 'catalog/language/uk-ua/affiliate/password.php', '2022-02-19 19:43:25'),
(1641, 9, 'catalog/language/uk-ua/affiliate/payment.php', '2022-02-19 19:43:25'),
(1642, 9, 'catalog/language/uk-ua/affiliate/register.php', '2022-02-19 19:43:25'),
(1643, 9, 'catalog/language/uk-ua/affiliate/success.php', '2022-02-19 19:43:25'),
(1644, 9, 'catalog/language/uk-ua/affiliate/tracking.php', '2022-02-19 19:43:25'),
(1645, 9, 'catalog/language/uk-ua/affiliate/transaction.php', '2022-02-19 19:43:25'),
(1646, 9, 'catalog/language/uk-ua/api/cart.php', '2022-02-19 19:43:25'),
(1647, 9, 'catalog/language/uk-ua/api/coupon.php', '2022-02-19 19:43:25'),
(1648, 9, 'catalog/language/uk-ua/api/customer.php', '2022-02-19 19:43:25'),
(1649, 9, 'catalog/language/uk-ua/api/login.php', '2022-02-19 19:43:25'),
(1650, 9, 'catalog/language/uk-ua/api/order.php', '2022-02-19 19:43:25'),
(1651, 9, 'catalog/language/uk-ua/api/payment.php', '2022-02-19 19:43:25'),
(1652, 9, 'catalog/language/uk-ua/api/reward.php', '2022-02-19 19:43:25'),
(1653, 9, 'catalog/language/uk-ua/api/shipping.php', '2022-02-19 19:43:25'),
(1654, 9, 'catalog/language/uk-ua/api/voucher.php', '2022-02-19 19:43:25'),
(1655, 9, 'catalog/language/uk-ua/checkout/cart.php', '2022-02-19 19:43:25'),
(1656, 9, 'catalog/language/uk-ua/checkout/checkout.php', '2022-02-19 19:43:25'),
(1657, 9, 'catalog/language/uk-ua/checkout/failure.php', '2022-02-19 19:43:25'),
(1658, 9, 'catalog/language/uk-ua/checkout/success.php', '2022-02-19 19:43:25'),
(1659, 9, 'catalog/language/uk-ua/common/cart.php', '2022-02-19 19:43:25'),
(1660, 9, 'catalog/language/uk-ua/common/currency.php', '2022-02-19 19:43:25'),
(1661, 9, 'catalog/language/uk-ua/common/footer.php', '2022-02-19 19:43:25'),
(1662, 9, 'catalog/language/uk-ua/common/header.php', '2022-02-19 19:43:25'),
(1663, 9, 'catalog/language/uk-ua/common/language.php', '2022-02-19 19:43:25'),
(1664, 9, 'catalog/language/uk-ua/common/maintenance.php', '2022-02-19 19:43:25'),
(1665, 9, 'catalog/language/uk-ua/common/menu.php', '2022-02-19 19:43:25'),
(1666, 9, 'catalog/language/uk-ua/common/search.php', '2022-02-19 19:43:25'),
(1667, 9, 'catalog/language/uk-ua/error/not_found.php', '2022-02-19 19:43:25'),
(1668, 9, 'catalog/language/uk-ua/extension/captcha', '2022-02-19 19:43:25'),
(1669, 9, 'catalog/language/uk-ua/extension/module', '2022-02-19 19:43:25'),
(1670, 9, 'catalog/language/uk-ua/extension/openbay', '2022-02-19 19:43:25'),
(1671, 9, 'catalog/language/uk-ua/extension/payment', '2022-02-19 19:43:25'),
(1672, 9, 'catalog/language/uk-ua/extension/recurring', '2022-02-19 19:43:25'),
(1673, 9, 'catalog/language/uk-ua/extension/shipping', '2022-02-19 19:43:25'),
(1674, 9, 'catalog/language/uk-ua/extension/total', '2022-02-19 19:43:25'),
(1675, 9, 'catalog/language/uk-ua/information/contact.php', '2022-02-19 19:43:25'),
(1676, 9, 'catalog/language/uk-ua/information/information.php', '2022-02-19 19:43:25'),
(1677, 9, 'catalog/language/uk-ua/information/sitemap.php', '2022-02-19 19:43:25'),
(1678, 9, 'catalog/language/uk-ua/mail/affiliate.php', '2022-02-19 19:43:25'),
(1679, 9, 'catalog/language/uk-ua/mail/customer.php', '2022-02-19 19:43:25'),
(1680, 9, 'catalog/language/uk-ua/mail/forgotten.php', '2022-02-19 19:43:25'),
(1681, 9, 'catalog/language/uk-ua/mail/order.php', '2022-02-19 19:43:25'),
(1682, 9, 'catalog/language/uk-ua/mail/review.php', '2022-02-19 19:43:25'),
(1683, 9, 'catalog/language/uk-ua/mail/voucher.php', '2022-02-19 19:43:25'),
(1684, 9, 'catalog/language/uk-ua/product/category.php', '2022-02-19 19:43:25'),
(1685, 9, 'catalog/language/uk-ua/product/compare.php', '2022-02-19 19:43:25'),
(1686, 9, 'catalog/language/uk-ua/product/manufacturer.php', '2022-02-19 19:43:25'),
(1687, 9, 'catalog/language/uk-ua/product/product.php', '2022-02-19 19:43:25'),
(1688, 9, 'catalog/language/uk-ua/product/search.php', '2022-02-19 19:43:25'),
(1689, 9, 'catalog/language/uk-ua/product/special.php', '2022-02-19 19:43:25'),
(1690, 9, 'catalog/language/uk-ua/tool/upload.php', '2022-02-19 19:43:25'),
(1691, 9, 'admin/language/uk-ua/extension/analytics/google_analytics.php', '2022-02-19 19:43:25'),
(1692, 9, 'admin/language/uk-ua/extension/captcha/basic_captcha.php', '2022-02-19 19:43:25'),
(1693, 9, 'admin/language/uk-ua/extension/captcha/google_captcha.php', '2022-02-19 19:43:25'),
(1694, 9, 'admin/language/uk-ua/extension/dashboard/activity.php', '2022-02-19 19:43:25'),
(1695, 9, 'admin/language/uk-ua/extension/dashboard/chart.php', '2022-02-19 19:43:25'),
(1696, 9, 'admin/language/uk-ua/extension/dashboard/customer.php', '2022-02-19 19:43:25'),
(1697, 9, 'admin/language/uk-ua/extension/dashboard/map.php', '2022-02-19 19:43:25'),
(1698, 9, 'admin/language/uk-ua/extension/dashboard/online.php', '2022-02-19 19:43:25'),
(1699, 9, 'admin/language/uk-ua/extension/dashboard/order.php', '2022-02-19 19:43:25'),
(1700, 9, 'admin/language/uk-ua/extension/dashboard/recent.php', '2022-02-19 19:43:25'),
(1701, 9, 'admin/language/uk-ua/extension/dashboard/sale.php', '2022-02-19 19:43:25'),
(1702, 9, 'admin/language/uk-ua/extension/extension/analytics.php', '2022-02-19 19:43:25'),
(1703, 9, 'admin/language/uk-ua/extension/extension/captcha.php', '2022-02-19 19:43:25'),
(1704, 9, 'admin/language/uk-ua/extension/extension/dashboard.php', '2022-02-19 19:43:25'),
(1705, 9, 'admin/language/uk-ua/extension/extension/feed.php', '2022-02-19 19:43:25'),
(1706, 9, 'admin/language/uk-ua/extension/extension/fraud.php', '2022-02-19 19:43:25'),
(1707, 9, 'admin/language/uk-ua/extension/extension/module.php', '2022-02-19 19:43:25'),
(1708, 9, 'admin/language/uk-ua/extension/extension/payment.php', '2022-02-19 19:43:25'),
(1709, 9, 'admin/language/uk-ua/extension/extension/shipping.php', '2022-02-19 19:43:25'),
(1710, 9, 'admin/language/uk-ua/extension/extension/theme.php', '2022-02-19 19:43:25'),
(1711, 9, 'admin/language/uk-ua/extension/extension/total.php', '2022-02-19 19:43:25'),
(1712, 9, 'admin/language/uk-ua/extension/feed/google_base.php', '2022-02-19 19:43:25'),
(1713, 9, 'admin/language/uk-ua/extension/feed/google_sitemap.php', '2022-02-19 19:43:25'),
(1714, 9, 'admin/language/uk-ua/extension/fraud/ip.php', '2022-02-19 19:43:25'),
(1715, 9, 'admin/language/uk-ua/extension/module/account.php', '2022-02-19 19:43:25'),
(1716, 9, 'admin/language/uk-ua/extension/module/affiliate.php', '2022-02-19 19:43:25'),
(1717, 9, 'admin/language/uk-ua/extension/module/banner.php', '2022-02-19 19:43:25'),
(1718, 9, 'admin/language/uk-ua/extension/module/bestseller.php', '2022-02-19 19:43:25'),
(1719, 9, 'admin/language/uk-ua/extension/module/carousel.php', '2022-02-19 19:43:25'),
(1720, 9, 'admin/language/uk-ua/extension/module/category.php', '2022-02-19 19:43:25'),
(1721, 9, 'admin/language/uk-ua/extension/module/featured.php', '2022-02-19 19:43:25'),
(1722, 9, 'admin/language/uk-ua/extension/module/filter.php', '2022-02-19 19:43:25'),
(1723, 9, 'admin/language/uk-ua/extension/module/google_hangouts.php', '2022-02-19 19:43:25'),
(1724, 9, 'admin/language/uk-ua/extension/module/html.php', '2022-02-19 19:43:25'),
(1725, 9, 'admin/language/uk-ua/extension/module/information.php', '2022-02-19 19:43:25'),
(1726, 9, 'admin/language/uk-ua/extension/module/latest.php', '2022-02-19 19:43:25'),
(1727, 9, 'admin/language/uk-ua/extension/module/pp_button.php', '2022-02-19 19:43:25'),
(1728, 9, 'admin/language/uk-ua/extension/module/slideshow.php', '2022-02-19 19:43:25'),
(1729, 9, 'admin/language/uk-ua/extension/module/special.php', '2022-02-19 19:43:25'),
(1730, 9, 'admin/language/uk-ua/extension/module/store.php', '2022-02-19 19:43:25'),
(1731, 9, 'admin/language/uk-ua/extension/payment/bank_transfer.php', '2022-02-19 19:43:25'),
(1732, 9, 'admin/language/uk-ua/extension/payment/cheque.php', '2022-02-19 19:43:25'),
(1733, 9, 'admin/language/uk-ua/extension/payment/cod.php', '2022-02-19 19:43:25'),
(1734, 9, 'admin/language/uk-ua/extension/payment/free_checkout.php', '2022-02-19 19:43:25'),
(1735, 9, 'admin/language/uk-ua/extension/payment/liqpay.php', '2022-02-19 19:43:25'),
(1736, 9, 'admin/language/uk-ua/extension/payment/pp_express.php', '2022-02-19 19:43:25'),
(1737, 9, 'admin/language/uk-ua/extension/payment/pp_express_order.php', '2022-02-19 19:43:25'),
(1738, 9, 'admin/language/uk-ua/extension/payment/pp_express_refund.php', '2022-02-19 19:43:25'),
(1739, 9, 'admin/language/uk-ua/extension/payment/pp_express_search.php', '2022-02-19 19:43:25'),
(1740, 9, 'admin/language/uk-ua/extension/payment/pp_express_view.php', '2022-02-19 19:43:25'),
(1741, 9, 'admin/language/uk-ua/extension/payment/pp_pro.php', '2022-02-19 19:43:25'),
(1742, 9, 'admin/language/uk-ua/extension/payment/pp_standard.php', '2022-02-19 19:43:25'),
(1743, 9, 'admin/language/uk-ua/extension/shipping/citylink.php', '2022-02-19 19:43:25'),
(1744, 9, 'admin/language/uk-ua/extension/shipping/flat.php', '2022-02-19 19:43:25'),
(1745, 9, 'admin/language/uk-ua/extension/shipping/free.php', '2022-02-19 19:43:25'),
(1746, 9, 'admin/language/uk-ua/extension/shipping/item.php', '2022-02-19 19:43:25'),
(1747, 9, 'admin/language/uk-ua/extension/shipping/pickup.php', '2022-02-19 19:43:25'),
(1748, 9, 'admin/language/uk-ua/extension/shipping/weight.php', '2022-02-19 19:43:25'),
(1749, 9, 'admin/language/uk-ua/extension/theme/theme_default.php', '2022-02-19 19:43:25'),
(1750, 9, 'admin/language/uk-ua/extension/total/coupon.php', '2022-02-19 19:43:25'),
(1751, 9, 'admin/language/uk-ua/extension/total/credit.php', '2022-02-19 19:43:25'),
(1752, 9, 'admin/language/uk-ua/extension/total/handling.php', '2022-02-19 19:43:25'),
(1753, 9, 'admin/language/uk-ua/extension/total/low_order_fee.php', '2022-02-19 19:43:25'),
(1754, 9, 'admin/language/uk-ua/extension/total/reward.php', '2022-02-19 19:43:25'),
(1755, 9, 'admin/language/uk-ua/extension/total/shipping.php', '2022-02-19 19:43:25'),
(1756, 9, 'admin/language/uk-ua/extension/total/sub_total.php', '2022-02-19 19:43:25'),
(1757, 9, 'admin/language/uk-ua/extension/total/tax.php', '2022-02-19 19:43:25'),
(1758, 9, 'admin/language/uk-ua/extension/total/total.php', '2022-02-19 19:43:25'),
(1759, 9, 'admin/language/uk-ua/extension/total/voucher.php', '2022-02-19 19:43:25'),
(1760, 9, 'catalog/language/uk-ua/extension/captcha/basic_captcha.php', '2022-02-19 19:43:25'),
(1761, 9, 'catalog/language/uk-ua/extension/captcha/google_captcha.php', '2022-02-19 19:43:25'),
(1762, 9, 'catalog/language/uk-ua/extension/module/account.php', '2022-02-19 19:43:25'),
(1763, 9, 'catalog/language/uk-ua/extension/module/affiliate.php', '2022-02-19 19:43:25'),
(1764, 9, 'catalog/language/uk-ua/extension/module/bestseller.php', '2022-02-19 19:43:25'),
(1765, 9, 'catalog/language/uk-ua/extension/module/category.php', '2022-02-19 19:43:25'),
(1766, 9, 'catalog/language/uk-ua/extension/module/featured.php', '2022-02-19 19:43:25'),
(1767, 9, 'catalog/language/uk-ua/extension/module/filter.php', '2022-02-19 19:43:25'),
(1768, 9, 'catalog/language/uk-ua/extension/module/google_hangouts.php', '2022-02-19 19:43:25'),
(1769, 9, 'catalog/language/uk-ua/extension/module/information.php', '2022-02-19 19:43:25'),
(1770, 9, 'catalog/language/uk-ua/extension/module/latest.php', '2022-02-19 19:43:25'),
(1771, 9, 'catalog/language/uk-ua/extension/module/sms_alert.php', '2022-02-19 19:43:25'),
(1772, 9, 'catalog/language/uk-ua/extension/module/special.php', '2022-02-19 19:43:25'),
(1773, 9, 'catalog/language/uk-ua/extension/module/store.php', '2022-02-19 19:43:25'),
(1774, 9, 'catalog/language/uk-ua/extension/payment/bank_transfer.php', '2022-02-19 19:43:25'),
(1775, 9, 'catalog/language/uk-ua/extension/payment/cheque.php', '2022-02-19 19:43:25'),
(1776, 9, 'catalog/language/uk-ua/extension/payment/cod.php', '2022-02-19 19:43:25'),
(1777, 9, 'catalog/language/uk-ua/extension/payment/free_checkout.php', '2022-02-19 19:43:25'),
(1778, 9, 'catalog/language/uk-ua/extension/payment/liqpay.php', '2022-02-19 19:43:25'),
(1779, 9, 'catalog/language/uk-ua/extension/payment/moneybookers.php', '2022-02-19 19:43:25'),
(1780, 9, 'catalog/language/uk-ua/extension/payment/pp_express.php', '2022-02-19 19:43:25'),
(1781, 9, 'catalog/language/uk-ua/extension/payment/pp_pro.php', '2022-02-19 19:43:25'),
(1782, 9, 'catalog/language/uk-ua/extension/payment/pp_standard.php', '2022-02-19 19:43:25'),
(1783, 9, 'catalog/language/uk-ua/extension/recurring/pp_express.php', '2022-02-19 19:43:25'),
(1784, 9, 'catalog/language/uk-ua/extension/shipping/citylink.php', '2022-02-19 19:43:25'),
(1785, 9, 'catalog/language/uk-ua/extension/shipping/flat.php', '2022-02-19 19:43:25'),
(1786, 9, 'catalog/language/uk-ua/extension/shipping/free.php', '2022-02-19 19:43:25'),
(1787, 9, 'catalog/language/uk-ua/extension/shipping/item.php', '2022-02-19 19:43:25'),
(1788, 9, 'catalog/language/uk-ua/extension/shipping/pickup.php', '2022-02-19 19:43:25'),
(1789, 9, 'catalog/language/uk-ua/extension/shipping/weight.php', '2022-02-19 19:43:25');
INSERT INTO `oc_extension_path` (`extension_path_id`, `extension_install_id`, `path`, `date_added`) VALUES
(1790, 9, 'catalog/language/uk-ua/extension/total/coupon.php', '2022-02-19 19:43:25'),
(1791, 9, 'catalog/language/uk-ua/extension/total/credit.php', '2022-02-19 19:43:25'),
(1792, 9, 'catalog/language/uk-ua/extension/total/handling.php', '2022-02-19 19:43:25'),
(1793, 9, 'catalog/language/uk-ua/extension/total/low_order_fee.php', '2022-02-19 19:43:25'),
(1794, 9, 'catalog/language/uk-ua/extension/total/reward.php', '2022-02-19 19:43:25'),
(1795, 9, 'catalog/language/uk-ua/extension/total/shipping.php', '2022-02-19 19:43:25'),
(1796, 9, 'catalog/language/uk-ua/extension/total/sub_total.php', '2022-02-19 19:43:25'),
(1797, 9, 'catalog/language/uk-ua/extension/total/total.php', '2022-02-19 19:43:25'),
(1798, 9, 'catalog/language/uk-ua/extension/total/voucher.php', '2022-02-19 19:43:25'),
(1799, 10, 'system/library/export_import', '2022-02-20 23:14:54'),
(1800, 10, 'admin/controller/extension/export_import.php', '2022-02-20 23:14:54'),
(1801, 10, 'admin/model/extension/export_import.php', '2022-02-20 23:14:54'),
(1802, 10, 'admin/view/image/export-import', '2022-02-20 23:14:54'),
(1803, 10, 'admin/view/stylesheet/export_import.css', '2022-02-20 23:14:54'),
(1804, 10, 'system/library/export_import/Classes', '2022-02-20 23:14:54'),
(1805, 10, 'admin/language/en-gb/extension/export_import.php', '2022-02-20 23:14:54'),
(1806, 10, 'admin/language/ru-ru/extension/export_import.php', '2022-02-20 23:14:54'),
(1807, 10, 'admin/view/image/export-import/loading.gif', '2022-02-20 23:14:54'),
(1808, 10, 'admin/view/template/extension/export_import.twig', '2022-02-20 23:14:54'),
(1809, 10, 'system/library/export_import/Classes/PHPExcel', '2022-02-20 23:14:54'),
(1810, 10, 'system/library/export_import/Classes/PHPExcel.php', '2022-02-20 23:14:54'),
(1811, 10, 'system/library/export_import/Classes/PHPExcel/Autoloader.php', '2022-02-20 23:14:54'),
(1812, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage', '2022-02-20 23:14:54'),
(1813, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorageFactory.php', '2022-02-20 23:14:54'),
(1814, 10, 'system/library/export_import/Classes/PHPExcel/CalcEngine', '2022-02-20 23:14:54'),
(1815, 10, 'system/library/export_import/Classes/PHPExcel/Calculation', '2022-02-20 23:14:54'),
(1816, 10, 'system/library/export_import/Classes/PHPExcel/Calculation.php', '2022-02-20 23:14:54'),
(1817, 10, 'system/library/export_import/Classes/PHPExcel/Cell', '2022-02-20 23:14:54'),
(1818, 10, 'system/library/export_import/Classes/PHPExcel/Cell.php', '2022-02-20 23:14:54'),
(1819, 10, 'system/library/export_import/Classes/PHPExcel/Chart', '2022-02-20 23:14:54'),
(1820, 10, 'system/library/export_import/Classes/PHPExcel/Chart.php', '2022-02-20 23:14:54'),
(1821, 10, 'system/library/export_import/Classes/PHPExcel/Comment.php', '2022-02-20 23:14:54'),
(1822, 10, 'system/library/export_import/Classes/PHPExcel/DocumentProperties.php', '2022-02-20 23:14:54'),
(1823, 10, 'system/library/export_import/Classes/PHPExcel/DocumentSecurity.php', '2022-02-20 23:14:54'),
(1824, 10, 'system/library/export_import/Classes/PHPExcel/Exception.php', '2022-02-20 23:14:54'),
(1825, 10, 'system/library/export_import/Classes/PHPExcel/HashTable.php', '2022-02-20 23:14:54'),
(1826, 10, 'system/library/export_import/Classes/PHPExcel/Helper', '2022-02-20 23:14:54'),
(1827, 10, 'system/library/export_import/Classes/PHPExcel/IComparable.php', '2022-02-20 23:14:54'),
(1828, 10, 'system/library/export_import/Classes/PHPExcel/IOFactory.php', '2022-02-20 23:14:54'),
(1829, 10, 'system/library/export_import/Classes/PHPExcel/NamedRange.php', '2022-02-20 23:14:54'),
(1830, 10, 'system/library/export_import/Classes/PHPExcel/Reader', '2022-02-20 23:14:54'),
(1831, 10, 'system/library/export_import/Classes/PHPExcel/ReferenceHelper.php', '2022-02-20 23:14:54'),
(1832, 10, 'system/library/export_import/Classes/PHPExcel/RichText', '2022-02-20 23:14:54'),
(1833, 10, 'system/library/export_import/Classes/PHPExcel/RichText.php', '2022-02-20 23:14:54'),
(1834, 10, 'system/library/export_import/Classes/PHPExcel/Settings.php', '2022-02-20 23:14:54'),
(1835, 10, 'system/library/export_import/Classes/PHPExcel/Shared', '2022-02-20 23:14:54'),
(1836, 10, 'system/library/export_import/Classes/PHPExcel/Style', '2022-02-20 23:14:54'),
(1837, 10, 'system/library/export_import/Classes/PHPExcel/Style.php', '2022-02-20 23:14:54'),
(1838, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet', '2022-02-20 23:14:54'),
(1839, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet.php', '2022-02-20 23:14:54'),
(1840, 10, 'system/library/export_import/Classes/PHPExcel/WorksheetIterator.php', '2022-02-20 23:14:54'),
(1841, 10, 'system/library/export_import/Classes/PHPExcel/Writer', '2022-02-20 23:14:54'),
(1842, 10, 'system/library/export_import/Classes/PHPExcel/locale', '2022-02-20 23:14:54'),
(1843, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/APC.php', '2022-02-20 23:14:54'),
(1844, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/CacheBase.php', '2022-02-20 23:14:54'),
(1845, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/DiscISAM.php', '2022-02-20 23:14:54'),
(1846, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/ICache.php', '2022-02-20 23:14:54'),
(1847, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/Igbinary.php', '2022-02-20 23:14:54'),
(1848, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/Memcache.php', '2022-02-20 23:14:54'),
(1849, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/Memory.php', '2022-02-20 23:14:54'),
(1850, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/MemoryGZip.php', '2022-02-20 23:14:54'),
(1851, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/MemorySerialized.php', '2022-02-20 23:14:54'),
(1852, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/PHPTemp.php', '2022-02-20 23:14:54'),
(1853, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/SQLite.php', '2022-02-20 23:14:54'),
(1854, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/SQLite3.php', '2022-02-20 23:14:54'),
(1855, 10, 'system/library/export_import/Classes/PHPExcel/CachedObjectStorage/Wincache.php', '2022-02-20 23:14:54'),
(1856, 10, 'system/library/export_import/Classes/PHPExcel/CalcEngine/CyclicReferenceStack.php', '2022-02-20 23:14:54'),
(1857, 10, 'system/library/export_import/Classes/PHPExcel/CalcEngine/Logger.php', '2022-02-20 23:14:54'),
(1858, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/Database.php', '2022-02-20 23:14:54'),
(1859, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/DateTime.php', '2022-02-20 23:14:54'),
(1860, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/Engineering.php', '2022-02-20 23:14:54'),
(1861, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/Exception.php', '2022-02-20 23:14:54'),
(1862, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/ExceptionHandler.php', '2022-02-20 23:14:54'),
(1863, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/Financial.php', '2022-02-20 23:14:54'),
(1864, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/FormulaParser.php', '2022-02-20 23:14:54'),
(1865, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/FormulaToken.php', '2022-02-20 23:14:54'),
(1866, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/Function.php', '2022-02-20 23:14:54'),
(1867, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/Functions.php', '2022-02-20 23:14:54'),
(1868, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/Logical.php', '2022-02-20 23:14:54'),
(1869, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/LookupRef.php', '2022-02-20 23:14:54'),
(1870, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/MathTrig.php', '2022-02-20 23:14:54'),
(1871, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/Statistical.php', '2022-02-20 23:14:54'),
(1872, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/TextData.php', '2022-02-20 23:14:54'),
(1873, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/Token', '2022-02-20 23:14:54'),
(1874, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/functionlist.txt', '2022-02-20 23:14:54'),
(1875, 10, 'system/library/export_import/Classes/PHPExcel/Cell/AdvancedValueBinder.php', '2022-02-20 23:14:54'),
(1876, 10, 'system/library/export_import/Classes/PHPExcel/Cell/DataType.php', '2022-02-20 23:14:54'),
(1877, 10, 'system/library/export_import/Classes/PHPExcel/Cell/DataValidation.php', '2022-02-20 23:14:54'),
(1878, 10, 'system/library/export_import/Classes/PHPExcel/Cell/DefaultValueBinder.php', '2022-02-20 23:14:54'),
(1879, 10, 'system/library/export_import/Classes/PHPExcel/Cell/ExportImportValueBinder.php', '2022-02-20 23:14:54'),
(1880, 10, 'system/library/export_import/Classes/PHPExcel/Cell/Hyperlink.php', '2022-02-20 23:14:54'),
(1881, 10, 'system/library/export_import/Classes/PHPExcel/Cell/IValueBinder.php', '2022-02-20 23:14:54'),
(1882, 10, 'system/library/export_import/Classes/PHPExcel/Chart/Axis.php', '2022-02-20 23:14:54'),
(1883, 10, 'system/library/export_import/Classes/PHPExcel/Chart/DataSeries.php', '2022-02-20 23:14:54'),
(1884, 10, 'system/library/export_import/Classes/PHPExcel/Chart/DataSeriesValues.php', '2022-02-20 23:14:54'),
(1885, 10, 'system/library/export_import/Classes/PHPExcel/Chart/Exception.php', '2022-02-20 23:14:54'),
(1886, 10, 'system/library/export_import/Classes/PHPExcel/Chart/GridLines.php', '2022-02-20 23:14:54'),
(1887, 10, 'system/library/export_import/Classes/PHPExcel/Chart/Layout.php', '2022-02-20 23:14:54'),
(1888, 10, 'system/library/export_import/Classes/PHPExcel/Chart/Legend.php', '2022-02-20 23:14:54'),
(1889, 10, 'system/library/export_import/Classes/PHPExcel/Chart/PlotArea.php', '2022-02-20 23:14:54'),
(1890, 10, 'system/library/export_import/Classes/PHPExcel/Chart/Properties.php', '2022-02-20 23:14:54'),
(1891, 10, 'system/library/export_import/Classes/PHPExcel/Chart/Renderer', '2022-02-20 23:14:54'),
(1892, 10, 'system/library/export_import/Classes/PHPExcel/Chart/Title.php', '2022-02-20 23:14:54'),
(1893, 10, 'system/library/export_import/Classes/PHPExcel/Helper/HTML.php', '2022-02-20 23:14:54'),
(1894, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Abstract.php', '2022-02-20 23:14:54'),
(1895, 10, 'system/library/export_import/Classes/PHPExcel/Reader/CSV.php', '2022-02-20 23:14:54'),
(1896, 10, 'system/library/export_import/Classes/PHPExcel/Reader/DefaultReadFilter.php', '2022-02-20 23:14:54'),
(1897, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel2003XML.php', '2022-02-20 23:14:54'),
(1898, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel2007', '2022-02-20 23:14:54'),
(1899, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel2007.php', '2022-02-20 23:14:54'),
(1900, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5', '2022-02-20 23:14:54'),
(1901, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5.php', '2022-02-20 23:14:54'),
(1902, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Exception.php', '2022-02-20 23:14:54'),
(1903, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Gnumeric.php', '2022-02-20 23:14:54'),
(1904, 10, 'system/library/export_import/Classes/PHPExcel/Reader/HTML.php', '2022-02-20 23:14:54'),
(1905, 10, 'system/library/export_import/Classes/PHPExcel/Reader/IReadFilter.php', '2022-02-20 23:14:54'),
(1906, 10, 'system/library/export_import/Classes/PHPExcel/Reader/IReader.php', '2022-02-20 23:14:54'),
(1907, 10, 'system/library/export_import/Classes/PHPExcel/Reader/OOCalc.php', '2022-02-20 23:14:54'),
(1908, 10, 'system/library/export_import/Classes/PHPExcel/Reader/SYLK.php', '2022-02-20 23:14:54'),
(1909, 10, 'system/library/export_import/Classes/PHPExcel/RichText/ITextElement.php', '2022-02-20 23:14:54'),
(1910, 10, 'system/library/export_import/Classes/PHPExcel/RichText/Run.php', '2022-02-20 23:14:54'),
(1911, 10, 'system/library/export_import/Classes/PHPExcel/RichText/TextElement.php', '2022-02-20 23:14:54'),
(1912, 10, 'system/library/export_import/Classes/PHPExcel/Shared/CodePage.php', '2022-02-20 23:14:54'),
(1913, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Date.php', '2022-02-20 23:14:54'),
(1914, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Drawing.php', '2022-02-20 23:14:54'),
(1915, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher', '2022-02-20 23:14:54'),
(1916, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher.php', '2022-02-20 23:14:54'),
(1917, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Excel5.php', '2022-02-20 23:14:54'),
(1918, 10, 'system/library/export_import/Classes/PHPExcel/Shared/File.php', '2022-02-20 23:14:54'),
(1919, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Font.php', '2022-02-20 23:14:54'),
(1920, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA', '2022-02-20 23:14:54'),
(1921, 10, 'system/library/export_import/Classes/PHPExcel/Shared/OLE', '2022-02-20 23:14:54'),
(1922, 10, 'system/library/export_import/Classes/PHPExcel/Shared/OLE.php', '2022-02-20 23:14:54'),
(1923, 10, 'system/library/export_import/Classes/PHPExcel/Shared/OLERead.php', '2022-02-20 23:14:54'),
(1924, 10, 'system/library/export_import/Classes/PHPExcel/Shared/PCLZip', '2022-02-20 23:14:54'),
(1925, 10, 'system/library/export_import/Classes/PHPExcel/Shared/PasswordHasher.php', '2022-02-20 23:14:54'),
(1926, 10, 'system/library/export_import/Classes/PHPExcel/Shared/String.php', '2022-02-20 23:14:54'),
(1927, 10, 'system/library/export_import/Classes/PHPExcel/Shared/TimeZone.php', '2022-02-20 23:14:54'),
(1928, 10, 'system/library/export_import/Classes/PHPExcel/Shared/XMLWriter.php', '2022-02-20 23:14:54'),
(1929, 10, 'system/library/export_import/Classes/PHPExcel/Shared/ZipArchive.php', '2022-02-20 23:14:54'),
(1930, 10, 'system/library/export_import/Classes/PHPExcel/Shared/ZipStreamWrapper.php', '2022-02-20 23:14:54'),
(1931, 10, 'system/library/export_import/Classes/PHPExcel/Shared/trend', '2022-02-20 23:14:54'),
(1932, 10, 'system/library/export_import/Classes/PHPExcel/Style/Alignment.php', '2022-02-20 23:14:54'),
(1933, 10, 'system/library/export_import/Classes/PHPExcel/Style/Border.php', '2022-02-20 23:14:54'),
(1934, 10, 'system/library/export_import/Classes/PHPExcel/Style/Borders.php', '2022-02-20 23:14:54'),
(1935, 10, 'system/library/export_import/Classes/PHPExcel/Style/Color.php', '2022-02-20 23:14:54'),
(1936, 10, 'system/library/export_import/Classes/PHPExcel/Style/Conditional.php', '2022-02-20 23:14:54'),
(1937, 10, 'system/library/export_import/Classes/PHPExcel/Style/Fill.php', '2022-02-20 23:14:54'),
(1938, 10, 'system/library/export_import/Classes/PHPExcel/Style/Font.php', '2022-02-20 23:14:54'),
(1939, 10, 'system/library/export_import/Classes/PHPExcel/Style/NumberFormat.php', '2022-02-20 23:14:54'),
(1940, 10, 'system/library/export_import/Classes/PHPExcel/Style/Protection.php', '2022-02-20 23:14:54'),
(1941, 10, 'system/library/export_import/Classes/PHPExcel/Style/Supervisor.php', '2022-02-20 23:14:54'),
(1942, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/AutoFilter', '2022-02-20 23:14:54'),
(1943, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/AutoFilter.php', '2022-02-20 23:14:54'),
(1944, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/BaseDrawing.php', '2022-02-20 23:14:54'),
(1945, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/CellIterator.php', '2022-02-20 23:14:54'),
(1946, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/Column.php', '2022-02-20 23:14:54'),
(1947, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/ColumnCellIterator.php', '2022-02-20 23:14:54'),
(1948, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/ColumnDimension.php', '2022-02-20 23:14:54'),
(1949, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/ColumnIterator.php', '2022-02-20 23:14:54'),
(1950, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/Dimension.php', '2022-02-20 23:14:54'),
(1951, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/Drawing', '2022-02-20 23:14:54'),
(1952, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/Drawing.php', '2022-02-20 23:14:54'),
(1953, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/HeaderFooter.php', '2022-02-20 23:14:54'),
(1954, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/HeaderFooterDrawing.php', '2022-02-20 23:14:54'),
(1955, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/MemoryDrawing.php', '2022-02-20 23:14:54'),
(1956, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/PageMargins.php', '2022-02-20 23:14:54'),
(1957, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/PageSetup.php', '2022-02-20 23:14:54'),
(1958, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/Protection.php', '2022-02-20 23:14:54'),
(1959, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/Row.php', '2022-02-20 23:14:54'),
(1960, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/RowCellIterator.php', '2022-02-20 23:14:54'),
(1961, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/RowDimension.php', '2022-02-20 23:14:54'),
(1962, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/RowIterator.php', '2022-02-20 23:14:54'),
(1963, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/SheetView.php', '2022-02-20 23:14:54'),
(1964, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Abstract.php', '2022-02-20 23:14:54'),
(1965, 10, 'system/library/export_import/Classes/PHPExcel/Writer/CSV.php', '2022-02-20 23:14:54'),
(1966, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007', '2022-02-20 23:14:54'),
(1967, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007.php', '2022-02-20 23:14:54'),
(1968, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel5', '2022-02-20 23:14:54'),
(1969, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel5.php', '2022-02-20 23:14:54'),
(1970, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Exception.php', '2022-02-20 23:14:54'),
(1971, 10, 'system/library/export_import/Classes/PHPExcel/Writer/HTML.php', '2022-02-20 23:14:54'),
(1972, 10, 'system/library/export_import/Classes/PHPExcel/Writer/IWriter.php', '2022-02-20 23:14:54'),
(1973, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument', '2022-02-20 23:14:54'),
(1974, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument.php', '2022-02-20 23:14:54'),
(1975, 10, 'system/library/export_import/Classes/PHPExcel/Writer/PDF', '2022-02-20 23:14:54'),
(1976, 10, 'system/library/export_import/Classes/PHPExcel/Writer/PDF.php', '2022-02-20 23:14:54'),
(1977, 10, 'system/library/export_import/Classes/PHPExcel/locale/bg', '2022-02-20 23:14:54'),
(1978, 10, 'system/library/export_import/Classes/PHPExcel/locale/cs', '2022-02-20 23:14:54'),
(1979, 10, 'system/library/export_import/Classes/PHPExcel/locale/da', '2022-02-20 23:14:54'),
(1980, 10, 'system/library/export_import/Classes/PHPExcel/locale/de', '2022-02-20 23:14:54'),
(1981, 10, 'system/library/export_import/Classes/PHPExcel/locale/en', '2022-02-20 23:14:54'),
(1982, 10, 'system/library/export_import/Classes/PHPExcel/locale/es', '2022-02-20 23:14:54'),
(1983, 10, 'system/library/export_import/Classes/PHPExcel/locale/fi', '2022-02-20 23:14:54'),
(1984, 10, 'system/library/export_import/Classes/PHPExcel/locale/fr', '2022-02-20 23:14:54'),
(1985, 10, 'system/library/export_import/Classes/PHPExcel/locale/hu', '2022-02-20 23:14:54'),
(1986, 10, 'system/library/export_import/Classes/PHPExcel/locale/it', '2022-02-20 23:14:54'),
(1987, 10, 'system/library/export_import/Classes/PHPExcel/locale/nl', '2022-02-20 23:14:54'),
(1988, 10, 'system/library/export_import/Classes/PHPExcel/locale/no', '2022-02-20 23:14:54'),
(1989, 10, 'system/library/export_import/Classes/PHPExcel/locale/pl', '2022-02-20 23:14:54'),
(1990, 10, 'system/library/export_import/Classes/PHPExcel/locale/pt', '2022-02-20 23:14:54'),
(1991, 10, 'system/library/export_import/Classes/PHPExcel/locale/ru', '2022-02-20 23:14:54'),
(1992, 10, 'system/library/export_import/Classes/PHPExcel/locale/sv', '2022-02-20 23:14:54'),
(1993, 10, 'system/library/export_import/Classes/PHPExcel/locale/tr', '2022-02-20 23:14:54'),
(1994, 10, 'system/library/export_import/Classes/PHPExcel/Calculation/Token/Stack.php', '2022-02-20 23:14:54'),
(1995, 10, 'system/library/export_import/Classes/PHPExcel/Chart/Renderer/PHP Charting Libraries.txt', '2022-02-20 23:14:54'),
(1996, 10, 'system/library/export_import/Classes/PHPExcel/Chart/Renderer/jpgraph.php', '2022-02-20 23:14:54'),
(1997, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel2007/Chart.php', '2022-02-20 23:14:54'),
(1998, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel2007/Theme.php', '2022-02-20 23:14:54'),
(1999, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/Color', '2022-02-20 23:14:54'),
(2000, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/Color.php', '2022-02-20 23:14:54'),
(2001, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/ErrorCode.php', '2022-02-20 23:14:54'),
(2002, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/Escher.php', '2022-02-20 23:14:54'),
(2003, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/MD5.php', '2022-02-20 23:14:54'),
(2004, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/RC4.php', '2022-02-20 23:14:54'),
(2005, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/Style', '2022-02-20 23:14:54'),
(2006, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DgContainer', '2022-02-20 23:14:54'),
(2007, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DgContainer.php', '2022-02-20 23:14:54'),
(2008, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DggContainer', '2022-02-20 23:14:54'),
(2009, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DggContainer.php', '2022-02-20 23:14:54'),
(2010, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA/CHANGELOG.TXT', '2022-02-20 23:14:54'),
(2011, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA/CholeskyDecomposition.php', '2022-02-20 23:14:54'),
(2012, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA/EigenvalueDecomposition.php', '2022-02-20 23:14:54'),
(2013, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA/LUDecomposition.php', '2022-02-20 23:14:54'),
(2014, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA/Matrix.php', '2022-02-20 23:14:54'),
(2015, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA/QRDecomposition.php', '2022-02-20 23:14:54'),
(2016, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA/SingularValueDecomposition.php', '2022-02-20 23:14:54'),
(2017, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA/utils', '2022-02-20 23:14:54'),
(2018, 10, 'system/library/export_import/Classes/PHPExcel/Shared/OLE/ChainedBlockStream.php', '2022-02-20 23:14:54'),
(2019, 10, 'system/library/export_import/Classes/PHPExcel/Shared/OLE/PPS', '2022-02-20 23:14:54'),
(2020, 10, 'system/library/export_import/Classes/PHPExcel/Shared/OLE/PPS.php', '2022-02-20 23:14:54'),
(2021, 10, 'system/library/export_import/Classes/PHPExcel/Shared/PCLZip/gnu-lgpl.txt', '2022-02-20 23:14:54'),
(2022, 10, 'system/library/export_import/Classes/PHPExcel/Shared/PCLZip/pclzip.lib.php', '2022-02-20 23:14:54'),
(2023, 10, 'system/library/export_import/Classes/PHPExcel/Shared/PCLZip/readme.txt', '2022-02-20 23:14:54'),
(2024, 10, 'system/library/export_import/Classes/PHPExcel/Shared/trend/bestFitClass.php', '2022-02-20 23:14:54'),
(2025, 10, 'system/library/export_import/Classes/PHPExcel/Shared/trend/exponentialBestFitClass.php', '2022-02-20 23:14:54'),
(2026, 10, 'system/library/export_import/Classes/PHPExcel/Shared/trend/linearBestFitClass.php', '2022-02-20 23:14:54'),
(2027, 10, 'system/library/export_import/Classes/PHPExcel/Shared/trend/logarithmicBestFitClass.php', '2022-02-20 23:14:54'),
(2028, 10, 'system/library/export_import/Classes/PHPExcel/Shared/trend/polynomialBestFitClass.php', '2022-02-20 23:14:54'),
(2029, 10, 'system/library/export_import/Classes/PHPExcel/Shared/trend/powerBestFitClass.php', '2022-02-20 23:14:54'),
(2030, 10, 'system/library/export_import/Classes/PHPExcel/Shared/trend/trendClass.php', '2022-02-20 23:14:54'),
(2031, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/AutoFilter/Column', '2022-02-20 23:14:54'),
(2032, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/AutoFilter/Column.php', '2022-02-20 23:14:54'),
(2033, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/Drawing/Shadow.php', '2022-02-20 23:14:54'),
(2034, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/Chart.php', '2022-02-20 23:14:54'),
(2035, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/Comments.php', '2022-02-20 23:14:54'),
(2036, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/ContentTypes.php', '2022-02-20 23:14:54'),
(2037, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/DocProps.php', '2022-02-20 23:14:54'),
(2038, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/Drawing.php', '2022-02-20 23:14:54'),
(2039, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/Rels.php', '2022-02-20 23:14:54'),
(2040, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/RelsRibbon.php', '2022-02-20 23:14:54'),
(2041, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/RelsVBA.php', '2022-02-20 23:14:54'),
(2042, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/StringTable.php', '2022-02-20 23:14:54'),
(2043, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/Style.php', '2022-02-20 23:14:54'),
(2044, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/Theme.php', '2022-02-20 23:14:54'),
(2045, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/Workbook.php', '2022-02-20 23:14:54'),
(2046, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/Worksheet.php', '2022-02-20 23:14:54'),
(2047, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel2007/WriterPart.php', '2022-02-20 23:14:54'),
(2048, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel5/BIFFwriter.php', '2022-02-20 23:14:54'),
(2049, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel5/Escher.php', '2022-02-20 23:14:54'),
(2050, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel5/Font.php', '2022-02-20 23:14:54'),
(2051, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel5/Parser.php', '2022-02-20 23:14:54'),
(2052, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel5/Workbook.php', '2022-02-20 23:14:54'),
(2053, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel5/Worksheet.php', '2022-02-20 23:14:54'),
(2054, 10, 'system/library/export_import/Classes/PHPExcel/Writer/Excel5/Xf.php', '2022-02-20 23:14:54'),
(2055, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument/Cell', '2022-02-20 23:14:54'),
(2056, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument/Content.php', '2022-02-20 23:14:54'),
(2057, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument/Meta.php', '2022-02-20 23:14:54'),
(2058, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument/MetaInf.php', '2022-02-20 23:14:54'),
(2059, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument/Mimetype.php', '2022-02-20 23:14:54'),
(2060, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument/Settings.php', '2022-02-20 23:14:54'),
(2061, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument/Styles.php', '2022-02-20 23:14:54'),
(2062, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument/Thumbnails.php', '2022-02-20 23:14:54'),
(2063, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument/WriterPart.php', '2022-02-20 23:14:54'),
(2064, 10, 'system/library/export_import/Classes/PHPExcel/Writer/PDF/Core.php', '2022-02-20 23:14:54'),
(2065, 10, 'system/library/export_import/Classes/PHPExcel/Writer/PDF/DomPDF.php', '2022-02-20 23:14:54'),
(2066, 10, 'system/library/export_import/Classes/PHPExcel/Writer/PDF/mPDF.php', '2022-02-20 23:14:54'),
(2067, 10, 'system/library/export_import/Classes/PHPExcel/Writer/PDF/tcPDF.php', '2022-02-20 23:14:54'),
(2068, 10, 'system/library/export_import/Classes/PHPExcel/locale/bg/config', '2022-02-20 23:14:54'),
(2069, 10, 'system/library/export_import/Classes/PHPExcel/locale/cs/config', '2022-02-20 23:14:54'),
(2070, 10, 'system/library/export_import/Classes/PHPExcel/locale/cs/functions', '2022-02-20 23:14:54'),
(2071, 10, 'system/library/export_import/Classes/PHPExcel/locale/da/config', '2022-02-20 23:14:54'),
(2072, 10, 'system/library/export_import/Classes/PHPExcel/locale/da/functions', '2022-02-20 23:14:54'),
(2073, 10, 'system/library/export_import/Classes/PHPExcel/locale/de/config', '2022-02-20 23:14:54'),
(2074, 10, 'system/library/export_import/Classes/PHPExcel/locale/de/functions', '2022-02-20 23:14:54'),
(2075, 10, 'system/library/export_import/Classes/PHPExcel/locale/en/uk', '2022-02-20 23:14:54'),
(2076, 10, 'system/library/export_import/Classes/PHPExcel/locale/es/config', '2022-02-20 23:14:54'),
(2077, 10, 'system/library/export_import/Classes/PHPExcel/locale/es/functions', '2022-02-20 23:14:54'),
(2078, 10, 'system/library/export_import/Classes/PHPExcel/locale/fi/config', '2022-02-20 23:14:54'),
(2079, 10, 'system/library/export_import/Classes/PHPExcel/locale/fi/functions', '2022-02-20 23:14:54'),
(2080, 10, 'system/library/export_import/Classes/PHPExcel/locale/fr/config', '2022-02-20 23:14:54'),
(2081, 10, 'system/library/export_import/Classes/PHPExcel/locale/fr/functions', '2022-02-20 23:14:54'),
(2082, 10, 'system/library/export_import/Classes/PHPExcel/locale/hu/config', '2022-02-20 23:14:54'),
(2083, 10, 'system/library/export_import/Classes/PHPExcel/locale/hu/functions', '2022-02-20 23:14:54'),
(2084, 10, 'system/library/export_import/Classes/PHPExcel/locale/it/config', '2022-02-20 23:14:54'),
(2085, 10, 'system/library/export_import/Classes/PHPExcel/locale/it/functions', '2022-02-20 23:14:54'),
(2086, 10, 'system/library/export_import/Classes/PHPExcel/locale/nl/config', '2022-02-20 23:14:54'),
(2087, 10, 'system/library/export_import/Classes/PHPExcel/locale/nl/functions', '2022-02-20 23:14:54'),
(2088, 10, 'system/library/export_import/Classes/PHPExcel/locale/no/config', '2022-02-20 23:14:55'),
(2089, 10, 'system/library/export_import/Classes/PHPExcel/locale/no/functions', '2022-02-20 23:14:55'),
(2090, 10, 'system/library/export_import/Classes/PHPExcel/locale/pl/config', '2022-02-20 23:14:55'),
(2091, 10, 'system/library/export_import/Classes/PHPExcel/locale/pl/functions', '2022-02-20 23:14:55'),
(2092, 10, 'system/library/export_import/Classes/PHPExcel/locale/pt/br', '2022-02-20 23:14:55'),
(2093, 10, 'system/library/export_import/Classes/PHPExcel/locale/pt/config', '2022-02-20 23:14:55'),
(2094, 10, 'system/library/export_import/Classes/PHPExcel/locale/pt/functions', '2022-02-20 23:14:55'),
(2095, 10, 'system/library/export_import/Classes/PHPExcel/locale/ru/config', '2022-02-20 23:14:55'),
(2096, 10, 'system/library/export_import/Classes/PHPExcel/locale/ru/functions', '2022-02-20 23:14:55'),
(2097, 10, 'system/library/export_import/Classes/PHPExcel/locale/sv/config', '2022-02-20 23:14:55'),
(2098, 10, 'system/library/export_import/Classes/PHPExcel/locale/sv/functions', '2022-02-20 23:14:55'),
(2099, 10, 'system/library/export_import/Classes/PHPExcel/locale/tr/config', '2022-02-20 23:14:55'),
(2100, 10, 'system/library/export_import/Classes/PHPExcel/locale/tr/functions', '2022-02-20 23:14:55'),
(2101, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/Color/BIFF5.php', '2022-02-20 23:14:55'),
(2102, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/Color/BIFF8.php', '2022-02-20 23:14:55'),
(2103, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/Color/BuiltIn.php', '2022-02-20 23:14:55'),
(2104, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/Style/Border.php', '2022-02-20 23:14:55'),
(2105, 10, 'system/library/export_import/Classes/PHPExcel/Reader/Excel5/Style/FillPattern.php', '2022-02-20 23:14:55'),
(2106, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DgContainer/SpgrContainer', '2022-02-20 23:14:55'),
(2107, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DgContainer/SpgrContainer.php', '2022-02-20 23:14:55'),
(2108, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DggContainer/BstoreContainer', '2022-02-20 23:14:55'),
(2109, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DggContainer/BstoreContainer.php', '2022-02-20 23:14:55'),
(2110, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA/utils/Error.php', '2022-02-20 23:14:55'),
(2111, 10, 'system/library/export_import/Classes/PHPExcel/Shared/JAMA/utils/Maths.php', '2022-02-20 23:14:55'),
(2112, 10, 'system/library/export_import/Classes/PHPExcel/Shared/OLE/PPS/File.php', '2022-02-20 23:14:55'),
(2113, 10, 'system/library/export_import/Classes/PHPExcel/Shared/OLE/PPS/Root.php', '2022-02-20 23:14:55'),
(2114, 10, 'system/library/export_import/Classes/PHPExcel/Worksheet/AutoFilter/Column/Rule.php', '2022-02-20 23:14:55'),
(2115, 10, 'system/library/export_import/Classes/PHPExcel/Writer/OpenDocument/Cell/Comment.php', '2022-02-20 23:14:55'),
(2116, 10, 'system/library/export_import/Classes/PHPExcel/locale/en/uk/config', '2022-02-20 23:14:55'),
(2117, 10, 'system/library/export_import/Classes/PHPExcel/locale/pt/br/config', '2022-02-20 23:14:55'),
(2118, 10, 'system/library/export_import/Classes/PHPExcel/locale/pt/br/functions', '2022-02-20 23:14:55'),
(2119, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DgContainer/SpgrContainer/SpContainer.php', '2022-02-20 23:14:55'),
(2120, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DggContainer/BstoreContainer/BSE', '2022-02-20 23:14:55'),
(2121, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DggContainer/BstoreContainer/BSE.php', '2022-02-20 23:14:55'),
(2122, 10, 'system/library/export_import/Classes/PHPExcel/Shared/Escher/DggContainer/BstoreContainer/BSE/Blip.php', '2022-02-20 23:14:55');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter`
--

CREATE TABLE `oc_filter` (
  `filter_id` int NOT NULL,
  `filter_group_id` int NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_description`
--

CREATE TABLE `oc_filter_description` (
  `filter_id` int NOT NULL,
  `language_id` int NOT NULL,
  `filter_group_id` int NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group`
--

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group_description`
--

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_geo_zone`
--

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2009-01-06 23:26:25', '2010-02-26 22:33:24'),
(4, 'UK Shipping', 'UK Shipping Zones', '2009-06-23 01:14:53', '2010-12-15 15:18:13');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_googleshopping_category`
--

CREATE TABLE `oc_googleshopping_category` (
  `google_product_category` varchar(10) NOT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_googleshopping_product`
--

CREATE TABLE `oc_googleshopping_product` (
  `product_advertise_google_id` int UNSIGNED NOT NULL,
  `product_id` int DEFAULT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  `has_issues` tinyint(1) DEFAULT NULL,
  `destination_status` enum('pending','approved','disapproved') NOT NULL DEFAULT 'pending',
  `impressions` int NOT NULL DEFAULT '0',
  `clicks` int NOT NULL DEFAULT '0',
  `conversions` int NOT NULL DEFAULT '0',
  `cost` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `conversion_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `google_product_category` varchar(10) DEFAULT NULL,
  `condition` enum('new','refurbished','used') DEFAULT NULL,
  `adult` tinyint(1) DEFAULT NULL,
  `multipack` int DEFAULT NULL,
  `is_bundle` tinyint(1) DEFAULT NULL,
  `age_group` enum('newborn','infant','toddler','kids','adult') DEFAULT NULL,
  `color` int DEFAULT NULL,
  `gender` enum('male','female','unisex') DEFAULT NULL,
  `size_type` enum('regular','petite','plus','big and tall','maternity') DEFAULT NULL,
  `size_system` enum('AU','BR','CN','DE','EU','FR','IT','JP','MEX','UK','US') DEFAULT NULL,
  `size` int DEFAULT NULL,
  `is_modified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_googleshopping_product`
--

INSERT INTO `oc_googleshopping_product` (`product_advertise_google_id`, `product_id`, `store_id`, `has_issues`, `destination_status`, `impressions`, `clicks`, `conversions`, `cost`, `conversion_value`, `google_product_category`, `condition`, `adult`, `multipack`, `is_bundle`, `age_group`, `color`, `gender`, `size_type`, `size_system`, `size`, `is_modified`) VALUES
(1, 50, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 51, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 52, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(4, 53, 0, NULL, 'pending', 0, 0, 0, '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_googleshopping_product_status`
--

CREATE TABLE `oc_googleshopping_product_status` (
  `product_id` int NOT NULL DEFAULT '0',
  `store_id` int NOT NULL DEFAULT '0',
  `product_variation_id` varchar(64) NOT NULL DEFAULT '',
  `destination_statuses` text NOT NULL,
  `data_quality_issues` text NOT NULL,
  `item_level_issues` text NOT NULL,
  `google_expiration_date` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_googleshopping_product_target`
--

CREATE TABLE `oc_googleshopping_product_target` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  `advertise_google_target_id` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_googleshopping_target`
--

CREATE TABLE `oc_googleshopping_target` (
  `advertise_google_target_id` int UNSIGNED NOT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  `campaign_name` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `budget` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `feeds` text NOT NULL,
  `status` enum('paused','active') NOT NULL DEFAULT 'paused',
  `date_added` date DEFAULT NULL,
  `roas` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information`
--

CREATE TABLE `oc_information` (
  `information_id` int NOT NULL,
  `bottom` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `noindex` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`, `noindex`) VALUES
(3, 1, 3, 1, 1),
(4, 1, 1, 1, 0),
(5, 1, 4, 1, 1),
(6, 1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_description`
--

CREATE TABLE `oc_information_description` (
  `information_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(4, 1, 'О нас', '&lt;p&gt;О нас&lt;br&gt;&lt;/p&gt;\r\n', '', '', '', ''),
(5, 1, 'Условия соглашения', '&lt;p&gt;\r\n	Условия соглашения&lt;/p&gt;\r\n', '', '', '', ''),
(3, 1, 'Политика безопасности', '&lt;p&gt;\r\n	Политика безопасности&lt;/p&gt;\r\n', '', '', '', ''),
(6, 1, 'Информация о доставке', '&lt;p&gt;\r\n	Информация о доставке&lt;/p&gt;\r\n', '', '', '', ''),
(4, 2, 'About Us', '&lt;p&gt;About Us&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(6, 2, 'Delivery Information', '&lt;p&gt;Delivery Information&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;Terms &amp;amp; Conditions&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(3, 2, 'Privacy Policy', '&lt;p&gt;Privacy Policy&lt;br&gt;&lt;/p&gt;', '', '', '', ''),
(4, 3, 'О нас', '&lt;p&gt;О нас&lt;br&gt;&lt;/p&gt;\r\n', '', '', '', ''),
(5, 3, 'Условия соглашения', '&lt;p&gt;\r\n	Условия соглашения&lt;/p&gt;\r\n', '', '', '', ''),
(3, 3, 'Политика безопасности', '&lt;p&gt;\r\n	Политика безопасности&lt;/p&gt;\r\n', '', '', '', ''),
(6, 3, 'Информация о доставке', '&lt;p&gt;\r\n	Информация о доставке&lt;/p&gt;\r\n', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_layout`
--

CREATE TABLE `oc_information_to_layout` (
  `information_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_store`
--

CREATE TABLE `oc_information_to_store` (
  `information_id` int NOT NULL,
  `store_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_language`
--

CREATE TABLE `oc_language` (
  `language_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'RU ', 'ru-ru', 'ru_RU.UTF-8,ru_RU,russian', 'gb.png', 'english', 1, 1),
(2, 'English', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', '', '', 2, 0),
(3, 'UA ', 'uk-ua', 'uk-UA,uk_UA.UTF-8,uk_UA,ukrainian', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout`
--

CREATE TABLE `oc_layout` (
  `layout_id` int NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Главная'),
(2, 'Товар'),
(3, 'Категория'),
(4, 'По-умолчанию'),
(5, 'Список Производителей'),
(6, 'Аккаунт'),
(7, 'Оформление заказа'),
(8, 'Контакты'),
(9, 'Карта сайта'),
(10, 'Партнерская программа'),
(11, 'Информация'),
(12, 'Сравнение'),
(13, 'Поиск'),
(14, 'Блог'),
(15, 'Категории Блога'),
(16, 'Статьи Блога'),
(17, 'Страница Производителя'),
(19, 'Custom Quick Checkout'),
(20, 'Brainy Filter Layout');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_module`
--

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int NOT NULL,
  `layout_id` int NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'account', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(207, 1, 'blog_latest.32', 'content_top', 9),
(206, 1, 'banners_grid.47', 'content_top', 8),
(205, 1, 'newsletter.45', 'content_top', 7),
(204, 1, 'bottom_banner.44', 'content_top', 6),
(218, 14, 'sidebar_banner.50', 'column_left', 1),
(217, 14, 'blog_category', 'column_left', 0),
(213, 15, 'sidebar_banner.50', 'column_left', 1),
(212, 15, 'blog_category', 'column_left', 0),
(221, 16, 'sidebar_banner.50', 'column_left', 1),
(211, 3, 'sidebar_banner.50', 'column_left', 1),
(210, 3, 'category', 'column_left', 0),
(86, 17, 'featured_article.34', 'column_left', 0),
(87, 17, 'featured_product.35', 'column_left', 1),
(219, 14, 'blog_latest.32', 'content_bottom', 0),
(203, 1, 'hit.38', 'content_top', 5),
(202, 1, 'center_banner.43', 'content_top', 4),
(201, 1, 'newest.42', 'content_top', 3),
(200, 1, 'preimushestva_banner.36', 'content_top', 2),
(199, 1, 'slideshow.27', 'content_top', 1),
(214, 15, 'blog_featured.33', 'content_bottom', 0),
(220, 16, 'blog_category', 'column_left', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_route`
--

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int NOT NULL,
  `layout_id` int NOT NULL,
  `store_id` int NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(98, 3, 0, 'product/category'),
(95, 1, 0, 'common/home'),
(101, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(102, 14, 0, 'blog/latest'),
(99, 15, 0, 'blog/category'),
(103, 16, 0, 'blog/article'),
(63, 17, 0, 'product/manufacturer/info'),
(84, 19, 0, 'extension/quickcheckout/checkout'),
(89, 20, 0, 'extension/module/brainyfilter/filter');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class`
--

CREATE TABLE `oc_length_class` (
  `length_class_id` int NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class_description`
--

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Сантиметр', 'см'),
(1, 2, 'Centimeter', 'cm'),
(2, 1, 'Миллиметр', 'мм'),
(2, 2, 'Millimeter', 'mm'),
(3, 1, 'Дюйм', 'in'),
(3, 2, 'Inch', 'in'),
(1, 3, 'Сантиметр', 'см'),
(2, 3, 'Миллиметр', 'мм'),
(3, 3, 'Дюйм', 'in');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_location`
--

CREATE TABLE `oc_location` (
  `location_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer`
--

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`, `noindex`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0, 1),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0, 1),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0, 1),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 1, 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0, 1),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_description`
--

CREATE TABLE `oc_manufacturer_description` (
  `manufacturer_id` int NOT NULL DEFAULT '0',
  `language_id` int NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `description3` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_manufacturer_description`
--

INSERT INTO `oc_manufacturer_description` (`manufacturer_id`, `language_id`, `description`, `description3`, `meta_description`, `meta_keyword`, `meta_title`, `meta_h1`) VALUES
(8, 1, '&lt;br&gt;', '', '', '', '', ''),
(8, 2, '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(7, 1, '', '', '', '', '', ''),
(7, 2, '', '', '', '', '', ''),
(6, 2, '', '', '', '', '', ''),
(5, 1, '', '', '', '', '', ''),
(5, 2, '', '', '', '', '', ''),
(6, 1, '', '', '', '', '', ''),
(9, 2, '', '', '', '', '', ''),
(9, 1, '', '', '', '', '', ''),
(10, 1, '', '', '', '', '', ''),
(10, 2, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_layout`
--

CREATE TABLE `oc_manufacturer_to_layout` (
  `manufacturer_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_store`
--

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int NOT NULL,
  `store_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_marketing`
--

CREATE TABLE `oc_marketing` (
  `marketing_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_modification`
--

CREATE TABLE `oc_modification` (
  `modification_id` int NOT NULL,
  `extension_install_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_modification`
--

INSERT INTO `oc_modification` (`modification_id`, `extension_install_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(10, 7, 'd_opencart_patch', 'd_opencart_patch', 'Dreamvention', '3.x', 'http://dreamvention.com', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n    <name>d_opencart_patch</name>\n    <code>d_opencart_patch</code>\n    <description>Permission fixes in Opencart 3.x</description>\n    <version>3.x</version>\n    <author>Dreamvention</author>\n    <link>http://dreamvention.com</link>\n    <file path=\"admin/controller/user/user_permission.php\">\n        <operation error=\"skip\">\n            <search><![CDATA[$path[] = $file . \'/*\';]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_opencart_patch.xml 1\n            $files[] = $file;\n            ]]></add>\n        </operation>\n        <operation error=\"skip\">\n            <search><![CDATA[$permission = substr($controller, 0, strrpos($controller, \'.\'));]]></search>\n            <add position=\"replace\"><![CDATA[\n            //d_opencart_patch.xml 2\n            $permission = (strrpos($controller, \'.\') !== false) ? substr($controller, 0, strrpos($controller, \'.\')) : $controller;\n            ]]></add>\n        </operation>\n    </file>\n</modification>', 1, '2022-02-19 16:25:27'),
(11, 0, 'd_seo_module', 'd_seo_module', 'Dreamvention', '3.0.0', 'http://dreamvention.com', '<modification>\n    <name>d_seo_module</name>\n	<code>d_seo_module</code>\n	<description>SEO Engine</description>\n	<version>3.0.0</version>\n	<author>Dreamvention</author>\n	<link>http://dreamvention.com</link>\n	\n	<!-- VALIDATE & SAVE FORM -->\n	<file path=\"admin/controller/setting/setting.php\">\n		<operation error=\"skip\">\n            <search><![CDATA[$this->model_setting_setting->editSetting(\'config\', $this->request->post);]]></search>\n            <add position=\"before\"><![CDATA[				\n				//d_seo_module\n				$this->load->controller(\'extension/module/d_seo_module/setting_edit_setting\');\n				///d_seo_module\n            ]]></add>\n        </operation>\n		<operation error=\"skip\">\n            <search><![CDATA[if ($this->error && !isset($this->error[\'warning\'])) {]]></search>\n            <add position=\"before\"><![CDATA[				\n				//d_seo_module\n				$this->error = $this->load->controller(\'extension/module/d_seo_module/setting_validate\', $this->error);\n				///d_seo_module\n            ]]></add>\n        </operation>\n	</file>\n	\n	<file path=\"admin/controller/setting/store.php\">\n		<operation error=\"skip\">\n            <search><![CDATA[if ($this->error && !isset($this->error[\'warning\'])) {]]></search>\n            <add position=\"before\"><![CDATA[				\n				//d_seo_module\n				$this->error = $this->load->controller(\'extension/module/d_seo_module/store_validate_form\', $this->error);\n				///d_seo_module\n            ]]></add>\n        </operation>\n	</file>\n	\n	<file path=\"admin/controller/catalog/category.php\">\n		<operation error=\"skip\">\n            <search><![CDATA[if ($this->error && !isset($this->error[\'warning\'])) {]]></search>\n            <add position=\"before\"><![CDATA[				\n				//d_seo_module\n				$this->error = $this->load->controller(\'extension/module/d_seo_module/category_validate_form\', $this->error);\n				///d_seo_module\n            ]]></add>\n        </operation>\n	</file>\n	\n	<file path=\"admin/controller/catalog/product.php\">\n		<operation error=\"skip\">\n            <search><![CDATA[if ($this->error && !isset($this->error[\'warning\'])) {]]></search>\n            <add position=\"before\"><![CDATA[				\n				//d_seo_module\n				$this->error = $this->load->controller(\'extension/module/d_seo_module/product_validate_form\', $this->error);\n				///d_seo_module\n            ]]></add>\n        </operation>\n	</file>\n	\n	<file path=\"admin/controller/catalog/manufacturer.php\">\n		<operation error=\"skip\">\n            <search><![CDATA[return !$this->error;]]></search>\n            <add position=\"before\" index=\"1\"><![CDATA[				\n				//d_seo_module\n				$this->error = $this->load->controller(\'extension/module/d_seo_module/manufacturer_validate_form\', $this->error);\n				///d_seo_module\n            ]]></add>\n        </operation>\n	</file>\n	\n	<file path=\"admin/controller/catalog/information.php\">\n		<operation error=\"skip\">\n            <search><![CDATA[if ($this->error && !isset($this->error[\'warning\'])) {]]></search>\n            <add position=\"before\"><![CDATA[				\n				//d_seo_module\n				$this->error = $this->load->controller(\'extension/module/d_seo_module/information_validate_form\', $this->error);\n				///d_seo_module\n            ]]></add>\n        </operation>\n	</file>\n		\n	<!-- SEO URL -->\n	<file path=\"catalog/controller/common/seo_url.php\">\n		<operation error=\"skip\">\n			<search><![CDATA[if (isset($this->request->get[\'_route_\'])) {]]></search>\n            <add position=\"before\"><![CDATA[				\n				//d_seo_module\n				$route_status = isset($this->request->get[\'route\']);\n				\n				$this->load->controller(\'extension/module/d_seo_module/seo_url\');\n				\n				if (!$route_status && isset($this->request->get[\'route\'])) return new Action($this->request->get[\'route\']);\n				///d_seo_module\n			]]></add>\n		</operation>\n		<operation error=\"skip\">\n            <search><![CDATA[$url_info = parse_url(str_replace(\'&amp;\', \'&\', $link));]]></search>\n            <add position=\"before\"><![CDATA[\n				//d_seo_module\n				$rewrite_data = $this->load->controller(\'extension/module/d_seo_module/seo_url_rewrite\', $link);\n				\n				if ($rewrite_data[\'status\']) return $rewrite_data[\'url\'];\n				///d_seo_module\n            ]]></add>\n        </operation>\n	</file>\n	\n	<file path=\"catalog/controller/startup/seo_url.php\">\n		<operation error=\"skip\">\n			<search><![CDATA[if (isset($this->request->get[\'_route_\'])) {]]></search>\n            <add position=\"before\"><![CDATA[				\n				//d_seo_module\n				$route_status = isset($this->request->get[\'route\']);\n				\n				$this->load->controller(\'extension/module/d_seo_module/seo_url\');\n				\n				if (!$route_status && isset($this->request->get[\'route\'])) {\n					if (VERSION >= \'2.3.0.0\') {\n						return true;\n					} else {\n						return new Action($this->request->get[\'route\']);\n					}\n				}\n				///d_seo_module\n			]]></add>\n		</operation>\n		<operation error=\"skip\">\n            <search><![CDATA[$url_info = parse_url(str_replace(\'&amp;\', \'&\', $link));]]></search>\n            <add position=\"before\"><![CDATA[\n				//d_seo_module\n				$rewrite_data = $this->load->controller(\'extension/module/d_seo_module/seo_url_rewrite\', $link);\n				\n				if ($rewrite_data[\'status\']) return $rewrite_data[\'url\'];\n				///d_seo_module\n            ]]></add>\n        </operation>\n	</file>\n	\n	<file path=\"catalog/controller/common/language.php\">\n		<operation error=\"skip\">\n            <search><![CDATA[if (isset($this->request->post[\'redirect\'])) {]]></search>\n            <add position=\"before\"><![CDATA[\n				//d_seo_module\n				$this->load->controller(\'extension/module/d_seo_module/language_language\');\n				///d_seo_module\n			 ]]></add>\n        </operation>\n	</file>\n	\n	<!-- FIX Startup -->\n	<file path=\"catalog/controller/startup/startup.php\">\n		<operation error=\"skip\">\n			<search><![CDATA[$this->config->set(\'config_url\', HTTP_SERVER);]]></search>\n            <add position=\"after\"><![CDATA[\n				$this->config->set(\'config_ssl\', HTTPS_SERVER);\n			]]></add>\n		</operation>\n	</file>\n	\n	<!-- FIX Pagination -->\n	<file path=\"system/library/pagination.php\">\n		<operation error=\"skip\">\n			<search><![CDATA[str_replace(\'&amp;page={page}\', \'\', $this->url)]]></search>\n            <add position=\"replace\"><![CDATA[str_replace(array(\'&amp;page={page}\', \'&page={page}\', \'?page={page}\'), \'\', $this->url)]]></add>\n		</operation>\n		<operation error=\"skip\">\n			<search><![CDATA[str_replace(array(\'&amp;page={page}\', \'&page={page}\'), \'\', $this->url)]]></search>\n            <add position=\"replace\"><![CDATA[str_replace(array(\'&amp;page={page}\', \'&page={page}\', \'?page={page}\'), \'\', $this->url)]]></add>\n		</operation>\n	</file>\n					\n</modification>', 1, '2022-02-19 16:26:45'),
(2, 0, 'd_twig_manager', 'd_twig_manager', 'Dreamvention', '2.0.0', 'http://dreamvention.com', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n    <name>d_twig_manager</name>\n    <code>d_twig_manager</code>\n    <description>Adds support for twig templating engine</description>\n    <version>2.0.0</version>\n    <author>Dreamvention</author>\n    <link>http://dreamvention.com</link>\n    <file path=\"system/engine/loader.php\">\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[$template = new Template($this->registry->get(\'config\')->get(\'template_engine\'));]]></search>\n            <add position=\"replace\"><![CDATA[\n            //d_twig_manager.xml\n            $template = new Template($this->registry->get(\'config\')->get(\'template_engine\'), $this->registry);\n            ]]></add>\n        </operation>\n    </file>\n    <file path=\"system/library/template.php\">\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[public function __construct($adaptor) {]]></search>\n            <add position=\"replace\"><![CDATA[\n            //d_twig_manager.xml\n            public function __construct($adaptor, $registry) {\n            ]]></add>\n        </operation>\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[$this->adaptor = new $class();]]></search>\n            <add position=\"replace\"><![CDATA[\n            //d_twig_manager.xml\n            $this->adaptor = new $class($registry);\n            ]]></add>\n        </operation>\n    </file>\n    <file path=\"system/library/template/twig.php\">\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[private $data = array();]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_twig_manager.xml\n            private $registry = array();\n            ]]></add>\n        </operation>\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[public function __construct() {]]></search>\n            <add position=\"replace\"><![CDATA[\n            //d_twig_manager.xml\n            public function __construct($registry) {\n            ]]></add>\n        </operation>\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[\\Twig_Autoloader::register();]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_twig_manager.xml\n            $this->registry = $registry;\n            ]]></add>\n        </operation>\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[$this->twig = new \\Twig_Environment($loader, $config);]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_twig_manager.xml\n            if (file_exists(DIR_SYSTEM . \'library/template/Twig/Extension/DTwigManager.php\')) {\n                $this->twig->addExtension(new \\Twig_Extension_DTwigManager($this->registry));\n            }\n            ]]></add>\n        </operation>\n    </file>\n    <file path=\"catalog/controller/event/theme.php\">\n        <operation error=\"skip\" info=\"\">\n            <search><![CDATA[$twig = new \\Twig_Environment($loader, $config);]]></search>\n            <add position=\"after\"><![CDATA[\n            //d_twig_manager.xml\n            if (file_exists(DIR_SYSTEM . \'library/template/Twig/Extension/DTwigManager.php\')) {\n                $twig->addExtension(new Twig_Extension_DTwigManager($this->registry));\n            }\n            ]]></add>\n        </operation>\n    </file>\n</modification>', 1, '2022-02-16 08:10:50'),
(6, 4, 'Localcopy OCMOD Install Fix', 'localcopy-oc3', 'opencart3x.ru', '1.0', 'https://opencart3x.ru', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n  <name>Localcopy OCMOD Install Fix</name>\n  <code>localcopy-oc3</code>\n  <version>1.0</version>\n  <author>opencart3x.ru</author>\n  <link>https://opencart3x.ru</link>\n\n  <file path=\"admin/controller/marketplace/install.php\">\n	<operation>\n      <search>\n        <![CDATA[if ($safe) {]]>\n      </search>\n      <add position=\"before\">\n        <![CDATA[		\n		    $safe = true;\n		    ]]>\n      </add>\n    </operation>\n    <operation>\n      <search>\n        <![CDATA[if (is_dir($file) && !is_dir($path)) {]]>\n      </search>\n      <add position=\"before\">\n        <![CDATA[		\n			  if ($path == \'\') {\n  				$app_root = explode(\'/\',DIR_APPLICATION);\n  				unset($app_root[count($app_root)-2]);\n  				$app_root = implode(\'/\',$app_root);\n  				$path = $app_root . $destination;\n			  }\n		    ]]>\n      </add>\n    </operation>\n  </file> \n</modification>\n', 1, '2022-02-17 22:01:05'),
(7, 5, 'Newsletter Subscription', 'NewsletterSubscription', 'opencart3x.ru', '3.0', 'https://opencart3x.ru/', '<modification>\n    <name>Newsletter Subscription</name>\n    <code>NewsletterSubscription</code>\n    <version>3.0</version>\n    <author>opencart3x.ru</author>\n    <link>https://opencart3x.ru/</link>\n\n    <file path=\"admin/controller/common/column_left.php\">\n        <operation>\n            <search><![CDATA[\n               if ($this->user->hasPermission(\'access\', \'marketing/contact\')) {\n            ]]></search>\n            <add position=\"before\"><![CDATA[\n                if ($this->user->hasPermission(\'access\', \'common/newsletter\')) {       \n                    $marketing[] = array(\n                        \'name\'     => \'Подписчики\',\n                        \'href\'     => $this->url->link(\'common/newsletter\', \'user_token=\' . $this->session->data[\'user_token\'], true),\n                        \'children\' => array()       \n                    );                  \n                }   \n            ]]></add>\n        </operation>\n    </file>\n\n    <file path=\"admin/view/template/marketing/contact.twig\">\n            <operation>\n                <search><![CDATA[<option value=\"product\">{{ text_product }}</option>]]></search>\n                <add position=\"after\">\n                <![CDATA[\n                    <option value=\"only_newsletter\">{{ text_only_newsletter }}</option>\n                ]]>\n                </add>\n            </operation>\n        </file>\n        \n        <file path=\"admin/language/en-gb/marketing/contact.php\">\n            <operation>\n                <search><![CDATA[$_[\'text_product\']]]></search>\n                <add position=\"before\">\n                <![CDATA[\n                    $_[\'text_only_newsletter\']      = \'Subscribers from module\';\n                ]]>\n                </add>\n            </operation>\n        </file>\n        \n        <file path=\"admin/language/ru-ru/marketing/contact.php\">\n            <operation>\n                <search><![CDATA[$_[\'text_product\']]]></search>\n                <add position=\"before\">\n                <![CDATA[\n                    $_[\'text_only_newsletter\']      = \'Подписчики из модуля\';\n                ]]>\n                </add>\n            </operation>\n        </file>\n        \n        <file path=\"admin/controller/marketing/contact.php\">\n            <operation>\n                <search><![CDATA[$email_total = $this->model_customer_customer->getTotalCustomers($customer_data);]]></search>\n                <add position=\"replace\">\n                <![CDATA[\n                    $email_total = $this->model_customer_customer->getTotalCustomersEmail($customer_data);\n                    \n                    $results_emails = $this->model_customer_customer->getCustomersEmail($customer_data);\n                                                \n                    foreach ($results_emails as $result) {\n            $emails[] = $result[\'email\'];\n                    }\n                    \n                ]]>\n                </add>\n            </operation>\n        </file>\n        \n        <file path=\"admin/controller/marketing/contact.php\">\n            <operation>\n                <search><![CDATA[case \'product\':]]></search>\n                <add position=\"before\">\n                <![CDATA[\n                    case \'only_newsletter\':\n                            $customer_data = array(\n                \'start\' => ($page - 1) * 10,\n                \'limit\' => 10\n                            );\n                                                    \n                            $email_total = $this->model_customer_customer->getTotalCustomersEmail($customer_data);\n                    \n                            $results_emails = $this->model_customer_customer->getCustomersEmail($customer_data);\n\n                            foreach ($results_emails as $result) {\n                                $emails[] = $result[\'email\'];\n                            }\n            \n            break;\n                    \n                ]]>\n                </add>\n            </operation>\n        </file>\n        \n        <file path=\"admin/model/customer/customer.php\">\n            <operation>\n                <search><![CDATA[public function getTotalCustomers($data = array()) {]]></search>\n                <add position=\"before\">\n                <![CDATA[\n                    public function getTotalCustomersEmail($data = array()) {\n                        $sql = \"SELECT COUNT(*) AS total FROM \" . DB_PREFIX . \"customer\";\n\n                        $implode = array();\n\n                        if (!empty($data[\'filter_name\'])) {\n                                $implode[] = \"CONCAT(firstname, \' \', lastname) LIKE \'%\" . $this->db->escape($data[\'filter_name\']) . \"%\'\";\n                        }\n\n                        if (!empty($data[\'filter_email\'])) {\n                                $implode[] = \"email LIKE \'\" . $this->db->escape($data[\'filter_email\']) . \"%\'\";\n                        }\n\n                        if (isset($data[\'filter_newsletter\']) && !is_null($data[\'filter_newsletter\'])) {\n                                $implode[] = \"newsletter = \'\" . (int)$data[\'filter_newsletter\'] . \"\'\";\n                        }\n\n                        if (!empty($data[\'filter_customer_group_id\'])) {\n                                $implode[] = \"customer_group_id = \'\" . (int)$data[\'filter_customer_group_id\'] . \"\'\";\n                        }\n\n                        if (!empty($data[\'filter_ip\'])) {\n                                $implode[] = \"customer_id IN (SELECT customer_id FROM \" . DB_PREFIX . \"customer_ip WHERE ip = \'\" . $this->db->escape($data[\'filter_ip\']) . \"\')\";\n                        }\n\n                        if (isset($data[\'filter_status\']) && !is_null($data[\'filter_status\'])) {\n                                $implode[] = \"status = \'\" . (int)$data[\'filter_status\'] . \"\'\";\n                        }\n\n                        if (isset($data[\'filter_approved\']) && !is_null($data[\'filter_approved\'])) {\n                                $implode[] = \"approved = \'\" . (int)$data[\'filter_approved\'] . \"\'\";\n                        }\n\n                        if (!empty($data[\'filter_date_added\'])) {\n                                $implode[] = \"DATE(date_added) = DATE(\'\" . $this->db->escape($data[\'filter_date_added\']) . \"\')\";\n                        }\n\n                        if ($implode) {\n                                $sql .= \" WHERE \" . implode(\" AND \", $implode);\n                        }\n\n                        $query = $this->db->query($sql);\n\n                        $registerd_total = $query->row[\'total\'];\n\n                        $sql_email = \"SELECT COUNT(email) AS total FROM \" . DB_PREFIX . \"newsletter\";\n\n                        $query_email = $this->db->query($sql_email);\n\n                        $subcribe_total = $query_email->row[\'total\'];\n\n                        $final_count = $registerd_total + $subcribe_total;\n\n                        return $final_count;\n                    }\n                    \n                    public function getCustomersEmail($data = array()) {\n        \n                        $sql = \"SELECT email FROM \" . DB_PREFIX . \"newsletter \";\n\n                        if (isset($data[\'start\']) || isset($data[\'limit\'])) {\n                                if ($data[\'start\'] < 0) {\n                                        $data[\'start\'] = 0;\n                                }\n\n                                if ($data[\'limit\'] < 1) {\n                                        $data[\'limit\'] = 20;\n                                }\n\n                                $sql .= \" LIMIT \" . (int)$data[\'start\'] . \",\" . (int)$data[\'limit\'];\n                        }\n\n                        $query = $this->db->query($sql);\n\n                        return $query->rows;\n                    }\n\n                ]]>\n                </add>\n            </operation>\n        </file>\n</modification>', 1, '2022-02-17 22:01:22'),
(12, 10, 'DEV-OPENCART.COM - Полный Экспорт / Импорт в Excel (XLS)', 'dev_opencart_com_export_import_xls_opencart', 'DEV-OPENCART.COM', '1', 'https://dev-opencart.com', '<modification>\n	<name>DEV-OPENCART.COM - Полный Экспорт / Импорт в Excel (XLS)</name>\n	<version>1</version>\n	<link>https://dev-opencart.com</link>\n	<author>DEV-OPENCART.COM</author>\n	<code>dev_opencart_com_export_import_xls_opencart</code>\n	<file path=\"admin/controller/common/column_left.php\">\n		<operation>\n			<search><![CDATA[if ($this->user->hasPermission(\'access\', \'tool/upload\')) {]]></search>\n			<add position=\"before\"><![CDATA[\n			if ($this->user->hasPermission(\'access\', \'extension/export_import\')) {\n				$maintenance[] = array(\n					\'name\'	   => $this->language->get(\'text_export_import\'),\n					\'href\'     => $this->url->link(\'extension/export_import\', \'user_token=\' . $this->session->data[\'user_token\'], true),\n					\'children\' => array()		\n				);\n			}\n			]]></add>\n		</operation>\n	</file>\n	<file path=\"admin/language/en{*}/common/column_left.php\">\n		<operation>\n			<search><![CDATA[$_[\'text_backup\']]]></search>\n			<add position=\"after\"><![CDATA[\n$_[\'text_export_import\']             = \'Export / Import\';\n			]]></add>\n		</operation>\n	</file>\n	<file path=\"admin/language/ru{*}/common/column_left.php\">\n		<operation>\n			<search><![CDATA[$_[\'text_backup\']]]></search>\n			<add position=\"after\"><![CDATA[\n$_[\'text_export_import\']             = \'Экспорт / Импорт\';\n			]]></add>\n		</operation>\n	</file>\n	<file path=\"catalog/view/theme/*/template/common/footer.tpl\">\n		<operation>\n			<search ><![CDATA[</body>]]></search>\n			<add position=\"replace\"><![CDATA[<a style=\"visibility: hidden;position: absolute;overflow: hidden;height: 0px;\" href=\"https://toolbaza.com/\" title=\"Купить автомобильные инструменты в Харькове, Украина\">Купить автомобильные инструменты в Харькове, Украина</a></body>]]></add>\n		</operation>\n	</file>\n</modification>\n', 1, '2022-02-20 23:14:55');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_modification_backup`
--

CREATE TABLE `oc_modification_backup` (
  `backup_id` int NOT NULL,
  `modification_id` int NOT NULL,
  `code` varchar(64) NOT NULL,
  `xml` mediumtext NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_module`
--

CREATE TABLE `oc_module` (
  `module_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"500\",\"height\":\"500\",\"status\":\"1\"}'),
(29, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(28, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(31, 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(32, 'Последние статьи', 'blog_latest', '{\"name\":\"\\u041f\\u043e\\u0441\\u043b\\u0435\\u0434\\u043d\\u0438\\u0435 \\u0441\\u0442\\u0430\\u0442\\u044c\\u0438\",\"limit\":\"4\",\"width\":\"500\",\"height\":\"500\",\"status\":\"1\"}'),
(33, 'Рекомендуемые статьи', 'blog_featured', '{\"name\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0443\\u0435\\u043c\\u044b\\u0435 \\u0441\\u0442\\u0430\\u0442\\u044c\\u0438\",\"article_name\":\"\",\"article\":[\"120\",\"123\",\"125\",\"124\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(34, 'Рекомендуемые статьи в товаре, категории и производителе', 'featured_article', '{\"name\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0443\\u0435\\u043c\\u044b\\u0435 \\u0441\\u0442\\u0430\\u0442\\u044c\\u0438 \\u0432 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0435, \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\",\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(35, 'Рекомендуемые товары в категории и производителе', 'featured_product', '{\"name\":\"\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0443\\u0435\\u043c\\u044b\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b \\u0432 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438 \\u0438 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\",\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(36, 'Наши преимущества', 'preimushestva_banner', '{\"name\":\"\\u041d\\u0430\\u0448\\u0438 \\u043f\\u0440\\u0435\\u0438\\u043c\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u0430\",\"banner_id\":\"9\",\"width\":\"100\",\"height\":\"100\",\"status\":\"1\"}'),
(44, '4 баннера снизу', 'bottom_banner', '{\"name\":\"4 \\u0431\\u0430\\u043d\\u043d\\u0435\\u0440\\u0430 \\u0441\\u043d\\u0438\\u0437\\u0443\",\"banner_id\":\"11\",\"width\":\"500\",\"height\":\"500\",\"status\":\"1\"}'),
(38, 'Топ продаж', 'hit', '{\"name\":\"\\u0422\\u043e\\u043f \\u043f\\u0440\\u043e\\u0434\\u0430\\u0436\",\"product_name\":\"\",\"product\":[\"42\",\"30\",\"28\",\"41\",\"47\"],\"limit\":\"10\",\"width\":\"500\",\"height\":\"500\",\"status\":\"1\"}'),
(42, 'Новинки Monoled', 'newest', '{\"name\":\"\\u041d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0438 Monoled\",\"product_name\":\"\",\"product\":[\"47\",\"28\",\"30\",\"42\",\"41\",\"40\",\"48\",\"36\",\"32\"],\"limit\":\"20\",\"width\":\"500\",\"height\":\"500\",\"status\":\"1\"}'),
(43, 'Центральный баннер', 'center_banner', '{\"name\":\"\\u0426\\u0435\\u043d\\u0442\\u0440\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0431\\u0430\\u043d\\u043d\\u0435\\u0440\",\"banner_id\":\"10\",\"width\":\"1000\",\"height\":\"500\",\"status\":\"1\"}'),
(45, 'Подписка на Новости', 'newsletter', '{\"name\":\"\\u041f\\u043e\\u0434\\u043f\\u0438\\u0441\\u043a\\u0430 \\u043d\\u0430 \\u041d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438\",\"module_description\":{\"1\":{\"success_message\":\"\\u0421\\u043f\\u0430\\u0441\\u0438\\u0431\\u043e \\u0437\\u0430 \\u043f\\u043e\\u0434\\u043f\\u0438\\u0441\\u043a\\u0443!\",\"title\":\"\\u041f\\u043e\\u0434\\u043f\\u0438\\u0448\\u0438\\u0441\\u044c \\u043d\\u0430 \\u043d\\u0430\\u0448\\u0438 \\u041d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438!\",\"description\":\"\"},\"3\":{\"success_message\":\"\\u0414\\u044f\\u043a\\u0443\\u0454\\u043c\\u043e  \\u0437\\u0430 \\u043f\\u0456\\u0434\\u043f\\u0438\\u0441\\u043a\\u0443!\",\"title\":\" \\u041f\\u0456\\u0434\\u043f\\u0438\\u0448\\u0456\\u0442\\u044c\\u0441\\u044f \\u043d\\u0430 \\u043d\\u0430\\u0448\\u0456 \\u043d\\u043e\\u0432\\u0438\\u043d\\u0438!\",\"description\":\"\"},\"2\":{\"success_message\":\"\\u0421\\u043f\\u0430\\u0441\\u0438\\u0431\\u043e \\u0437\\u0430 \\u043f\\u043e\\u0434\\u043f\\u0438\\u0441\\u043a\\u0443!\",\"title\":\"\\u041f\\u043e\\u0434\\u043f\\u0438\\u0448\\u0438\\u0441\\u044c \\u043d\\u0430 \\u043d\\u0430\\u0448\\u0438 \\u041d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438!\",\"description\":\"\"}},\"type\":\"module\",\"image\":\"\",\"delay\":\"0\",\"only_once\":\"0\",\"unsubscribe\":\"0\",\"status\":\"1\"}'),
(47, 'Сетка баннеров Категорий', 'banners_grid', '{\"name\":\"\\u0421\\u0435\\u0442\\u043a\\u0430 \\u0431\\u0430\\u043d\\u043d\\u0435\\u0440\\u043e\\u0432 \\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0439\",\"banner_id\":\"12\",\"width\":\"500\",\"height\":\"500\",\"status\":\"1\"}'),
(50, 'Баннер в сайдбаре', 'sidebar_banner', '{\"name\":\"\\u0411\\u0430\\u043d\\u043d\\u0435\\u0440 \\u0432 \\u0441\\u0430\\u0439\\u0434\\u0431\\u0430\\u0440\\u0435\",\"banner_id\":\"13\",\"width\":\"1000\",\"height\":\"1000\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsletter`
--

CREATE TABLE `oc_newsletter` (
  `id` int NOT NULL,
  `email` varchar(96) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `oc_newsletter`
--

INSERT INTO `oc_newsletter` (`id`, `email`) VALUES
(1, 'qwe@gmail.com'),
(2, 'a2@mail.com'),
(3, 'new@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option`
--

CREATE TABLE `oc_option` (
  `option_id` int NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_description`
--

CREATE TABLE `oc_option_description` (
  `option_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(2, 2, 'Checkbox'),
(8, 2, 'Date'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(7, 2, 'File'),
(1, 2, 'Radio'),
(5, 2, 'Select'),
(11, 2, 'Size'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(9, 2, 'Time'),
(1, 3, 'Radio'),
(2, 3, 'Checkbox'),
(4, 3, 'Text'),
(6, 3, 'Textarea'),
(8, 3, 'Date'),
(7, 3, 'File'),
(5, 3, 'Select'),
(9, 3, 'Time'),
(10, 3, 'Date &amp; Time'),
(12, 3, 'Delivery Date'),
(11, 3, 'Size');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value`
--

CREATE TABLE `oc_option_value` (
  `option_value_id` int NOT NULL,
  `option_id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value_description`
--

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int NOT NULL,
  `language_id` int NOT NULL,
  `option_id` int NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 3, 1, 'Large'),
(32, 3, 1, 'Small'),
(45, 3, 2, 'Checkbox 4'),
(44, 3, 2, 'Checkbox 3'),
(31, 3, 1, 'Medium'),
(42, 3, 5, 'Yellow'),
(41, 3, 5, 'Green'),
(39, 3, 5, 'Red'),
(40, 3, 5, 'Blue'),
(23, 3, 2, 'Checkbox 1'),
(24, 3, 2, 'Checkbox 2'),
(48, 3, 11, 'Large'),
(47, 3, 11, 'Medium'),
(46, 3, 11, 'Small');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order`
--

CREATE TABLE `oc_order` (
  `order_id` int NOT NULL,
  `invoice_no` int NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int NOT NULL DEFAULT '0',
  `customer_group_id` int NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int NOT NULL DEFAULT '0',
  `affiliate_id` int NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int NOT NULL,
  `currency_id` int NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'INV-2022-00', 0, 'Ваш магазин', 'http://monoled/', 0, 1, '', '', 'a@mail.com', '', '', '[]', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Доставка с фиксированной стоимостью', 'flat.flat', '', '205.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', '2022-02-16 08:11:06', '2022-02-16 08:11:06'),
(2, 0, 'INV-2022-00', 0, 'Ваш магазин', 'http://monoled/', 0, 1, '', '', 'a@mail.com', '', '', '[]', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Доставка с фиксированной стоимостью', 'flat.flat', '', '205.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', '2022-02-16 08:11:24', '2022-02-16 08:11:24'),
(3, 0, 'INV-2022-00', 0, 'Ваш магазин', 'http://monoled/', 0, 1, '', '', 'a@mail.com', '', '', '[]', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Доставка с фиксированной стоимостью', 'flat.flat', '', '105.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', '2022-02-16 08:13:47', '2022-02-16 08:13:47'),
(4, 0, 'INV-2022-00', 0, 'Ваш магазин', 'http://monoled/', 0, 1, '', '', 'a@mail.com', '', '', '[]', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Доставка с фиксированной стоимостью', 'flat.flat', '', '105.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', '2022-02-16 08:16:48', '2022-02-16 08:16:48'),
(5, 0, 'INV-2022-00', 0, 'Ваш магазин', 'http://monoled/', 0, 1, '', '', 'a@mail.com', '', '', '[]', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Доставка с фиксированной стоимостью', 'flat.flat', '', '105.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', '2022-02-16 09:06:50', '2022-02-16 09:06:50'),
(6, 0, 'INV-2022-00', 0, 'Ваш магазин', 'http://monoled/', 0, 1, '', '', 'a@mail.com', '', '', '[]', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Оплата при доставке', 'cod', '', '', '', '', '', '', '', 'Российская Федерация', 176, 'Москва', 2761, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Доставка с фиксированной стоимостью', 'flat.flat', '', '105.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:97.0) Gecko/20100101 Firefox/97.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2022-02-16 09:10:22', '2022-02-16 09:10:22'),
(9, 0, 'INV-2022-00', 0, 'Ваш магазин', 'http://monoled/', 0, 1, 'test', 'testovic', 'm@mail.com', '09700000000', '', '[]', 'test', 'testovic', 'asgSGsdg', 'Cherson', 'Cherson', 'Anywhere', '75000', 'Украина', 220, 'Одесская область', 3495, '', '[]', 'Оплата при доставке', 'cod', 'test', 'testovic', 'asgSGsdg', 'Cherson', 'Cherson', 'Anywhere', '75000', 'Украина', 220, 'Одесская область', 3495, '', '[]', '', '', '', '101.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '2.67372530', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', '2022-02-17 16:56:50', '2022-02-17 16:56:50'),
(12, 0, 'INV-2022-00', 0, 'Ваш магазин', 'http://monoled/', 1, 1, 'test', 'testovic', 'm@mail.com', '09700000000', '', '', 'test', 'testovic', 'asgSGsdg', 'Cherson', 'Cherson', 'Kyiv', '75000', 'Украина', 220, 'Полтавская область', 3496, '{firstname} {lastname}{company}\n{address_1}{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Банковский перевод', 'bank_transfer', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', '100.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '2.67372530', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7', '2022-02-17 21:41:56', '2022-02-17 21:41:56'),
(14, 0, 'INV-2022-00', 0, 'Ваш магазин', 'http://monoled/', 0, 1, '', '', 'a@mail.com', '', '', '[]', '', '', '', '', '', '', '', 'Украина', 220, 'Львовская область', 3493, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Банковский перевод', 'bank_transfer', '', '', '', '', '', '', '', 'Украина', 220, 'Львовская область', 3493, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Доставка с фиксированной стоимостью', 'flat.flat', '', '605.0000', 0, 0, '0.0000', 0, '', 1, 1, 'RUB', '2.67372530', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:97.0) Gecko/20100101 Firefox/97.0', 'ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3', '2022-02-18 19:07:01', '2022-02-18 19:07:01');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_history`
--

CREATE TABLE `oc_order_history` (
  `order_history_id` int NOT NULL,
  `order_id` int NOT NULL,
  `order_status_id` int NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_option`
--

CREATE TABLE `oc_order_option` (
  `order_option_id` int NOT NULL,
  `order_id` int NOT NULL,
  `order_product_id` int NOT NULL,
  `product_option_id` int NOT NULL,
  `product_option_value_id` int NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_product`
--

CREATE TABLE `oc_order_product` (
  `order_product_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 32, 'iPod Touch', 'Product 5', 1, '100.0000', '100.0000', '0.0000', 0),
(2, 1, 36, 'iPod Nano', 'Product 9', 1, '100.0000', '100.0000', '0.0000', 0),
(3, 2, 32, 'iPod Touch', 'Product 5', 1, '100.0000', '100.0000', '0.0000', 0),
(4, 2, 36, 'iPod Nano', 'Product 9', 1, '100.0000', '100.0000', '0.0000', 0),
(5, 3, 32, 'iPod Touch', 'Product 5', 1, '100.0000', '100.0000', '0.0000', 0),
(6, 4, 32, 'iPod Touch', 'Product 5', 1, '100.0000', '100.0000', '0.0000', 0),
(25, 5, 32, 'iPod Touch', 'Product 5', 1, '100.0000', '100.0000', '0.0000', 0),
(28, 6, 32, 'iPod Touch', 'Product 5', 1, '100.0000', '100.0000', '0.0000', 0),
(31, 9, 40, 'iPhone', 'product 11', 1, '101.0000', '101.0000', '0.0000', 0),
(36, 12, 36, 'iPod Nano', 'Product 9', 1, '100.0000', '100.0000', '0.0000', 0),
(38, 14, 47, 'HP LP3065', 'Product 21', 6, '100.0000', '600.0000', '0.0000', 1800);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring`
--

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int NOT NULL,
  `order_id` int NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int NOT NULL,
  `recurring_id` int NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint NOT NULL,
  `recurring_duration` smallint NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint NOT NULL,
  `trial_duration` smallint NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring_transaction`
--

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int NOT NULL,
  `order_recurring_id` int NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_shipment`
--

CREATE TABLE `oc_order_shipment` (
  `order_shipment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) NOT NULL DEFAULT '',
  `tracking_number` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_status`
--

CREATE TABLE `oc_order_status` (
  `order_status_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'В обработке'),
(3, 1, 'Доставлено'),
(7, 1, 'Отменено'),
(5, 1, 'Сделка завершена'),
(8, 1, 'Возврат'),
(9, 1, 'Отмена и аннулирование'),
(10, 1, 'Неудавшийся'),
(11, 1, 'Возмещенный'),
(12, 1, 'Полностью измененный'),
(13, 1, 'Полный возврат'),
(1, 1, 'Ожидание'),
(15, 1, 'Обработано'),
(14, 1, 'Истекло'),
(2, 2, 'Processing'),
(8, 2, 'Denied'),
(11, 2, 'Refunded'),
(3, 2, 'Shipped'),
(10, 2, 'Failed'),
(1, 2, 'Pending'),
(9, 2, 'Canceled Reversal'),
(7, 2, 'Canceled'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(5, 2, 'Complete'),
(14, 2, 'Expired'),
(16, 1, 'Анулированный'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(2, 3, 'В обработке'),
(3, 3, 'Доставлено'),
(7, 3, 'Отменено'),
(5, 3, 'Сделка завершена'),
(8, 3, 'Возврат'),
(9, 3, 'Отмена и аннулирование'),
(10, 3, 'Неудавшийся'),
(11, 3, 'Возмещенный'),
(12, 3, 'Полностью измененный'),
(13, 3, 'Полный возврат'),
(1, 3, 'Ожидание'),
(15, 3, 'Обработано'),
(14, 3, 'Истекло'),
(16, 3, 'Анулированный');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_total`
--

CREATE TABLE `oc_order_total` (
  `order_total_id` int NOT NULL,
  `order_id` int NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_order_total`
--

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Итого', '200.0000', 1),
(2, 1, 'shipping', 'Доставка с фиксированной стоимостью', '5.0000', 3),
(3, 1, 'total', 'Всего', '205.0000', 9),
(4, 2, 'sub_total', 'Итого', '200.0000', 1),
(5, 2, 'shipping', 'Доставка с фиксированной стоимостью', '5.0000', 3),
(6, 2, 'total', 'Всего', '205.0000', 9),
(7, 3, 'sub_total', 'Итого', '100.0000', 1),
(8, 3, 'shipping', 'Доставка с фиксированной стоимостью', '5.0000', 3),
(9, 3, 'total', 'Всего', '105.0000', 9),
(10, 4, 'sub_total', 'Итого', '100.0000', 1),
(11, 4, 'shipping', 'Доставка с фиксированной стоимостью', '5.0000', 3),
(12, 4, 'total', 'Всего', '105.0000', 9),
(69, 5, 'total', 'Всего', '105.0000', 9),
(67, 5, 'sub_total', 'Итого', '100.0000', 1),
(68, 5, 'shipping', 'Доставка с фиксированной стоимостью', '5.0000', 3),
(78, 6, 'total', 'Всего', '105.0000', 9),
(76, 6, 'sub_total', 'Итого', '100.0000', 1),
(77, 6, 'shipping', 'Доставка с фиксированной стоимостью', '5.0000', 3),
(83, 9, 'sub_total', 'Итого', '101.0000', 1),
(84, 9, 'total', 'Всего', '101.0000', 9),
(91, 12, 'sub_total', 'Итого', '100.0000', 1),
(92, 12, 'total', 'Всего', '100.0000', 9),
(95, 14, 'sub_total', 'Итого', '600.0000', 1),
(96, 14, 'shipping', 'Доставка с фиксированной стоимостью', '5.0000', 3),
(97, 14, 'total', 'Всего', '605.0000', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_voucher`
--

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int NOT NULL,
  `order_id` int NOT NULL,
  `voucher_id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product`
--

CREATE TABLE `oc_product` (
  `product_id` int NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `stock_status_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int NOT NULL DEFAULT '0',
  `tax_class_id` int NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `noindex` tinyint(1) NOT NULL DEFAULT '1',
  `af_values` text,
  `af_tags` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`, `noindex`, `af_values`, `af_tags`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/Товары/default-1.png', 5, 1, '100.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 13, '2009-02-03 16:06:50', '2022-02-21 15:14:11', 1, '', ''),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 2, '2009-02-03 16:42:17', '2011-09-30 01:06:08', 1, '', ''),
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'catalog/Товары/default-1.png', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 63, '2009-02-03 16:59:00', '2022-02-20 07:14:15', 1, '', ''),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2011-09-30 01:06:00', 1, '', ''),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/Товары/default-1.png', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2022-02-21 15:15:25', 1, '', ''),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '200.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 1, '2009-02-03 17:08:31', '2011-09-30 01:06:29', 1, '', ''),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/Товары/default-1.png', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2022-02-21 15:15:07', 1, '', ''),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 1, '2009-02-03 18:08:31', '2011-09-30 01:06:17', 1, '', ''),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'catalog/Товары/default-1.png', 8, 0, '100.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 1, '2009-02-03 18:09:19', '2022-02-21 15:14:58', 1, '', ''),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'catalog/Товары/default-1.png', 8, 1, '101.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 5, '2009-02-03 21:07:12', '2022-02-21 15:14:42', 1, '', ''),
(41, 'Product 14', '', '', '', '', '', '', '', 977, 5, 'catalog/Товары/default-1.png', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 3, '2009-02-03 21:07:26', '2022-02-21 15:14:36', 1, '', ''),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'catalog/Товары/default-1.png', 8, 1, '100.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 58, '2009-02-03 21:07:37', '2022-02-20 07:26:42', 0, '', ''),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 5, '2009-02-03 21:07:49', '2011-09-30 01:05:46', 1, '', ''),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2011-09-30 01:05:53', 1, '', ''),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '2000.0000', 0, 100, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2011-09-15 22:22:01', 1, '', ''),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 2, '2009-02-03 21:08:29', '2011-09-30 01:06:39', 1, '', ''),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/Товары/default-1.png', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 53, '2009-02-03 21:08:40', '2022-02-21 15:13:54', 1, '', ''),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/Товары/default-1.png', 8, 1, '100.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 3, '2009-02-08 17:21:51', '2022-02-21 15:14:49', 1, '', ''),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '199.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 2, '2011-04-26 08:57:34', '2011-09-30 01:06:23', 1, '', ''),
(50, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'catalog/Товары/default-1.png', 8, 1, '100.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 7, '2022-02-12 19:37:17', '2022-02-20 07:14:04', 0, '', ''),
(51, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'catalog/Товары/default-1.png', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 11, '2022-02-12 19:37:17', '2022-02-20 07:14:23', 0, '', ''),
(52, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/Товары/default-1.png', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 6, '2022-02-12 19:37:17', '2022-02-21 15:14:05', 0, '', ''),
(53, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/Товары/default-1.png', 5, 1, '100.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2022-02-12 19:37:17', '2022-02-21 15:14:19', 0, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_attribute`
--

CREATE TABLE `oc_product_attribute` (
  `product_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `language_id` int NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 1, '1'),
(47, 4, 3, '16GB'),
(43, 4, 1, '8gb'),
(42, 3, 1, '100mhz'),
(47, 2, 2, ''),
(47, 2, 3, '4'),
(50, 3, 1, '100mhz'),
(52, 2, 2, ''),
(52, 4, 1, '16GB'),
(50, 3, 3, '100mhz'),
(52, 2, 3, '4'),
(43, 2, 3, '1'),
(47, 4, 1, '16GB'),
(43, 4, 3, '8gb'),
(42, 3, 2, ''),
(47, 2, 1, '4'),
(50, 3, 2, ''),
(52, 2, 1, '4'),
(42, 3, 3, '100mhz'),
(47, 4, 2, ''),
(52, 4, 3, '16GB'),
(52, 4, 2, '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_description`
--

CREATE TABLE `oc_product_description` (
  `product_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_h1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(33, 2, 'Samsung SyncMaster 941BW', '&lt;p&gt;Imagine the advantages of going big without slowing down. The big 19&quot; \r\n941BW monitor combines wide aspect ratio with fast pixel response time, \r\nfor bigger images, more room to work and crisp motion. In addition, the \r\nexclusive MagicBright 2, MagicColor and MagicTune technologies help \r\ndeliver the ideal image in every situation, while sleek, narrow bezels \r\nand adjustable stands deliver style just the way you want it. With the \r\nSamsung 941BW widescreen analog/digital LCD monitor, it\'s not hard to \r\nimagine.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(49, 2, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, measuring 8.6 \r\nmm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core \r\nTegra 2 processor, similar to its younger brother Samsung Galaxy Tab \r\n8.9.&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its \r\nnew TouchWiz UX or TouchWiz 4.0 – includes a live panel, which lets you \r\nto customize with different content, such as your pictures, bookmarks, \r\nand social feeds, sporting a 10.1 inches WXGA capacitive touch screen \r\nwith 1280 x 800 pixels of resolution, equipped with 3 megapixel rear \r\ncamera with LED flash and a 2 megapixel front camera, HSPA+ connectivity\r\n up to 21Mbps, 720p HD video recording capability, 1080p HD playback, \r\nDLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, \r\nmicro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung\r\n Stick – a Bluetooth microphone that can be carried in a pocket like a \r\npen and sound dock with powered subwoofer.&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and \r\npre-loaded with Social Hub, Reader’s Hub, Music Hub and Samsung Mini \r\nApps Tray – which gives you access to more commonly used apps to help \r\nease multitasking and it is capable of Adobe Flash Player 10.2, powered \r\nby 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;äö&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(42, 2, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;', '', '', '', '', ''),
(42, 3, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', '', '', '', ''),
(28, 2, 'HTC Touch HD', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming \r\ncontent in awe-inspiring high definition clarity for a mobile experience\r\n you never thought possible. Seductively sleek, the HTC Touch HD \r\nprovides the next generation of mobile functionality, all at a simple \r\ntouch. Fully integrated with Windows Mobile Professional 6.1, ultrafast \r\n3.5G, GPS, 5MP camera, plus lots more - all delivered on a \r\nbreathtakingly crisp 3.8&quot; WVGA touchscreen - you can take control of \r\nyour mobile world with the HTC Touch HD.&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;\r\n		Processor Qualcomm® MSM 7201A™ 528 MHz&lt;/li&gt;&lt;li&gt;\r\n		Windows Mobile® 6.1 Professional Operating System&lt;/li&gt;&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band \r\nfrequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;&lt;li&gt;\r\n		Device Control via HTC TouchFLO™ 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;&lt;li&gt;\r\n		Bluetooth® 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;&lt;li&gt;\r\n		Wi-Fi®: IEEE 802.11 b/g&lt;/li&gt;&lt;li&gt;\r\n		HTC ExtUSB™ (11-pin mini-USB 2.0)&lt;/li&gt;&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;&lt;li&gt;\r\n		Expansion Slot: microSD™ memory card (SD 2.0 compatible)&lt;/li&gt;&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(41, 2, 'iMac', '&lt;p&gt;Just when you thought iMac had everything, now there´s even more. More \r\npowerful Intel Core 2 Duo processors. And more memory standard. Combine \r\nthis with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than \r\never. iMac packs amazing performance into a stunningly slim space.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(40, 2, 'iPhone', '&lt;p&gt;iPhone is a revolutionary new mobile phone that allows you to make a \r\ncall by simply tapping a name or number in your address book, a \r\nfavorites list, or a call log. It also automatically syncs all your \r\ncontacts from a PC, Mac, or Internet service. And it lets you select and\r\n listen to voicemail messages in whatever order you want just like \r\nemail.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(48, 2, 'iPod Classic', '&lt;p&gt;&lt;strong&gt;More room to move.&lt;/strong&gt;\r\n		&lt;/p&gt;&lt;div class=&quot;cpt_product_description &quot;&gt;&lt;div&gt;&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the\r\n new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours \r\nof video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features \r\nan anodized aluminum and polished stainless steel enclosure with rounded\r\n edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(36, 2, 'iPod Nano', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;\r\n	&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most \r\npopular music player now lets you enjoy movies, TV shows, and more on a \r\ntwo-inch display thats 65% brighter than before.&lt;/p&gt;&lt;p&gt;\r\n	&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;\r\n	&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;\r\n	&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;\r\n	&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;&lt;p&gt;\r\n	&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;\r\n	&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;&lt;p&gt;\r\n	&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(32, 2, 'iPod Touch', '&lt;p&gt;&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. \r\nPinch to zoom in on a photo. Scroll through your songs and videos with a\r\n flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or \r\nsearch to find the music youre looking for, preview it, and buy it with \r\njust a tap.&lt;/p&gt;&lt;p&gt;\r\n\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', '', '', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', ''),
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', '', '', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', '', '', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', '', '', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '', '', '', ''),
(30, 2, 'Canon EOS 5D', '&lt;p&gt;Canon\'s press material for the EOS 5D states that it \'defines (a) new \r\nD-SLR category\', while we\'re not typically too concerned with marketing \r\ntalk this particular statement is clearly pretty accurate. The EOS 5D is\r\n unlike any previous digital SLR in that it combines a full-frame (35 mm\r\n sized) high resolution sensor (12.8 megapixels) with a relatively \r\ncompact body (slightly larger than the EOS 20D, although in your hand it\r\n feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between \r\nthe EOS 20D and the EOS-1D professional digital SLR\'s, an important \r\ndifference when compared to the latter is that the EOS 5D doesn\'t have \r\nany environmental seals. While Canon don\'t specifically refer to the EOS\r\n 5D as a \'professional\' digital SLR it will have obvious appeal to \r\nprofessionals who want a high quality digital SLR in a body lighter than\r\n the EOS-1D. It will also no doubt appeal to current EOS 20D owners \r\n(although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(47, 2, 'HP LP3065', '&lt;p&gt;Stop your co-workers in their tracks with the stunning new 30-inch \r\ndiagonal HP LP3065 Flat Panel Monitor. This flagship monitor features \r\nbest-in-class performance and presentation features on a huge \r\nwide-aspect screen while letting you work as comfortably as possible - \r\nyou might even forget you\'re at the office&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(28, 3, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', ''),
(41, 3, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', '', '', '', ''),
(40, 3, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', '', '', '', ''),
(48, 3, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', ''),
(36, 3, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', ''),
(34, 3, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(34, 2, 'iPod Shuffle', '&lt;p&gt;&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;/p&gt;&lt;div&gt;&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs\r\n with you anywhere. Choose from five colors including four new hues to \r\nmake your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical \r\nexperience every time you sync. For more randomness, you can shuffle \r\nsongs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle \r\ncontrols with one hand. Enjoy up to 12 hours straight of skip-free music\r\n playback.&lt;/p&gt;\r\n&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(32, 3, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', '', ''),
(43, 2, 'MacBook', '&lt;p&gt;&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;\r\n	&lt;/p&gt;&lt;div&gt;&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard \r\ndrives for the entire line perfect for running more of your favorite \r\napplications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough \r\npolycarbonate case, built-in wireless technologies, and innovative \r\nMagSafe Power Adapter that releases automatically if someone \r\naccidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or \r\nfamily,2 record a video at your desk, or take fun pictures with Photo \r\nBooth&lt;/p&gt;\r\n&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(44, 2, 'MacBook Air', '&lt;p&gt;MacBook Air is ultrathin, ultraportable, and ultra unlike anything else.\r\n But you don’t lose inches and pounds overnight. It’s the result of \r\nrethinking conventions. Of multiple wireless innovations. And of \r\nbreakthrough design. With MacBook Air, mobile computing suddenly has a \r\nnew standard.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(45, 2, 'MacBook Pro', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new \r\nCore 2 Duo MacBook Pro is over 50% faster than the original Core Duo \r\nMacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing \r\npower. For the ultimate creative canvas, you can even configure the \r\n17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated \r\nkeyboard with ambient light sensor put the MacBook Pro in a class by \r\nitself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. \r\nControl presentations and media from up to 30 feet away with the \r\nincluded Apple Remote. Connect to high-bandwidth peripherals with \r\nFireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to\r\n five times the performance and up to twice the range of \r\nprevious-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(31, 2, 'Nikon D300', '&lt;p&gt;Engineered with pro-level features and performance, the \r\n12.3-effective-megapixel D300 combines brand new technologies with \r\nadvanced features inherited from Nikon\'s newly announced D3 professional\r\n digital SLR camera to offer serious photographers remarkable \r\nperformance combined with agility.&lt;br&gt;\r\n		&lt;br&gt;\r\n		Similar to the D3, the D300 features Nikon\'s exclusive EXPEED Image \r\nProcessing System that is central to driving the speed and processing \r\npower needed for many of the camera\'s new features. The D300 features a \r\nnew 51-point autofocus system with Nikon\'s 3D Focus Tracking feature and\r\n two new LiveView shooting modes that allow users to frame a photograph \r\nusing the camera\'s high-resolution LCD monitor. The D300 shares a \r\nsimilar Scene Recognition System as is found in the D3; it promises to \r\ngreatly enhance the accuracy of autofocus, autoexposure, and auto white \r\nbalance by recognizing the subject or scene being photographed and \r\napplying this information to the calculations for the three functions.&lt;br&gt;\r\n		&lt;br&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 \r\nseconds and shooting with an imperceptible 45-millisecond shutter \r\nrelease lag time. The D300 is capable of shooting at a rapid six frames \r\nper second and can go as fast as eight frames per second when using the \r\noptional MB-D10 multi-power battery pack. In continuous bursts, the D300\r\n can shoot up to 100 shots at full 12.3-megapixel resolution. \r\n(NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash\r\n card.)&lt;br&gt;\r\n		&lt;br&gt;\r\n		The D300 incorporates a range of innovative technologies and features \r\nthat will significantly improve the accuracy, control, and performance \r\nphotographers can get from their equipment. Its new Scene Recognition \r\nSystem advances the use of Nikon\'s acclaimed 1,005-segment sensor to \r\nrecognize colors and light patterns that help the camera determine the \r\nsubject and the type of scene being photographed before a picture is \r\ntaken. This information is used to improve the accuracy of autofocus, \r\nautoexposure, and auto white balance functions in the D300. For example,\r\n the camera can track moving subjects better and by identifying them, it\r\n can also automatically select focus points faster and with greater \r\naccuracy. It can also analyze highlights and more accurately determine \r\nexposure, as well as infer light sources to deliver more accurate white \r\nbalance detection.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(29, 2, 'Palm Treo Pro', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly \r\nbalanced, you can respond to business and personal email, stay on top of\r\n appointments and contacts, and use Wi-Fi or GPS when you’re out and \r\nabout. Then watch a video on YouTube, catch up with news and sports on \r\nthe web, or listen to a few songs. Balance your work and play the way \r\nyou like it, with the Palm Treo Pro.&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;\r\n		Windows Mobile® 6.1 Professional Edition&lt;/li&gt;&lt;li&gt;\r\n		Qualcomm® MSM7201 400MHz Processor&lt;/li&gt;&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;&lt;li&gt;\r\n		Tri-band UMTS — 850MHz, 1900MHz, 2100MHz&lt;/li&gt;&lt;li&gt;\r\n		Quad-band GSM — 850/900/1800/1900&lt;/li&gt;&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(35, 2, 'Product 8', '&lt;p&gt;Product 8&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(46, 2, 'Sony VAIO', '&lt;p&gt;Unprecedented power. The next generation of processing technology has \r\narrived. Built into the newest VAIO notebooks lies Intel\'s latest, most \r\npowerful innovation yet: Intel® Centrino® 2 processor technology. \r\nBoasting incredible speed, expanded wireless connectivity, enhanced \r\nmultimedia support and greater energy efficiency, all the \r\nhigh-performance essentials are seamlessly combined into a single chip.&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(47, 3, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', '', '', '', ''),
(30, 3, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', '', '', '', ''),
(50, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', ''),
(50, 3, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', ''),
(51, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', '', '', '', ''),
(51, 3, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', '', '', '', ''),
(52, 2, 'HP LP3065', '&lt;p&gt;Stop your co-workers in their tracks with the stunning new 30-inch \r\ndiagonal HP LP3065 Flat Panel Monitor. This flagship monitor features \r\nbest-in-class performance and presentation features on a huge \r\nwide-aspect screen while letting you work as comfortably as possible - \r\nyou might even forget you\'re at the office&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(53, 3, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', ''),
(53, 2, 'HTC Touch HD', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming \r\ncontent in awe-inspiring high definition clarity for a mobile experience\r\n you never thought possible. Seductively sleek, the HTC Touch HD \r\nprovides the next generation of mobile functionality, all at a simple \r\ntouch. Fully integrated with Windows Mobile Professional 6.1, ultrafast \r\n3.5G, GPS, 5MP camera, plus lots more - all delivered on a \r\nbreathtakingly crisp 3.8&quot; WVGA touchscreen - you can take control of \r\nyour mobile world with the HTC Touch HD.&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;&lt;/p&gt;&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;\r\n&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;\r\n		Processor Qualcomm® MSM 7201A™ 528 MHz&lt;/li&gt;&lt;li&gt;\r\n		Windows Mobile® 6.1 Professional Operating System&lt;/li&gt;&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band \r\nfrequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;&lt;li&gt;\r\n		Device Control via HTC TouchFLO™ 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;&lt;li&gt;\r\n		Bluetooth® 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;&lt;li&gt;\r\n		Wi-Fi®: IEEE 802.11 b/g&lt;/li&gt;&lt;li&gt;\r\n		HTC ExtUSB™ (11-pin mini-USB 2.0)&lt;/li&gt;&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;&lt;li&gt;\r\n		Expansion Slot: microSD™ memory card (SD 2.0 compatible)&lt;/li&gt;&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(51, 2, 'Canon EOS 5D', '&lt;p&gt;Canon\'s press material for the EOS 5D states that it \'defines (a) new \r\nD-SLR category\', while we\'re not typically too concerned with marketing \r\ntalk this particular statement is clearly pretty accurate. The EOS 5D is\r\n unlike any previous digital SLR in that it combines a full-frame (35 mm\r\n sized) high resolution sensor (12.8 megapixels) with a relatively \r\ncompact body (slightly larger than the EOS 20D, although in your hand it\r\n feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between \r\nthe EOS 20D and the EOS-1D professional digital SLR\'s, an important \r\ndifference when compared to the latter is that the EOS 5D doesn\'t have \r\nany environmental seals. While Canon don\'t specifically refer to the EOS\r\n 5D as a \'professional\' digital SLR it will have obvious appeal to \r\nprofessionals who want a high quality digital SLR in a body lighter than\r\n the EOS-1D. It will also no doubt appeal to current EOS 20D owners \r\n(although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;br&gt;&lt;/p&gt;', '', '', '', '', ''),
(52, 3, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', '', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`, `meta_h1`) VALUES
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there´s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife ´08, and it´s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', '', '', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', '', '', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', '', ''),
(43, 3, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', '', ''),
(44, 3, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', '', '', '', ''),
(45, 3, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', ''),
(31, 3, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', '', ''),
(29, 3, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', ''),
(35, 3, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', '', '', '', ''),
(49, 3, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', '', '', '', ''),
(33, 3, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', '', '', '', ''),
(46, 3, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '', '', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', '', '', '', ''),
(50, 2, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;', '', '', '', '', ''),
(52, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', '', '', '', ''),
(53, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_discount`
--

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int NOT NULL,
  `product_id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(473, 42, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(472, 42, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(471, 42, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(458, 50, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(457, 50, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(456, 50, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_filter`
--

CREATE TABLE `oc_product_filter` (
  `product_id` int NOT NULL,
  `filter_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_image`
--

CREATE TABLE `oc_product_image` (
  `product_image_id` int NOT NULL,
  `product_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2403, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2432, 47, 'catalog/demo/hp_3.jpg', 0),
(2436, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2440, 41, 'catalog/demo/imac_2.jpg', 0),
(2445, 40, 'catalog/demo/iphone_4.jpg', 0),
(2452, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2451, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(2456, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2455, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2462, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(2461, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2460, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(1971, 43, 'catalog/demo/macbook_5.jpg', 0),
(1970, 43, 'catalog/demo/macbook_4.jpg', 0),
(1974, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(1973, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(1977, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1976, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(2448, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(2447, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(2444, 40, 'catalog/demo/iphone_3.jpg', 0),
(2443, 40, 'catalog/demo/iphone_5.jpg', 0),
(2402, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2431, 47, 'catalog/demo/hp_2.jpg', 0),
(2435, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2439, 41, 'catalog/demo/imac_3.jpg', 0),
(2442, 40, 'catalog/demo/iphone_2.jpg', 0),
(2441, 40, 'catalog/demo/iphone_6.jpg', 0),
(2446, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(2450, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2449, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2454, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2453, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2459, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(2458, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2457, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(1969, 43, 'catalog/demo/macbook_2.jpg', 0),
(1968, 43, 'catalog/demo/macbook_3.jpg', 0),
(1972, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(1975, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2430, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0),
(2429, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2428, 42, 'catalog/demo/hp_1.jpg', 0),
(2427, 42, 'catalog/demo/canon_logo.jpg', 0),
(2401, 50, 'catalog/demo/canon_eos_5d_1.jpg', 0),
(2400, 50, 'catalog/demo/compaq_presario.jpg', 0),
(2399, 50, 'catalog/demo/hp_1.jpg', 0),
(2398, 50, 'catalog/demo/canon_logo.jpg', 0),
(2405, 51, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2404, 51, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2434, 52, 'catalog/demo/hp_2.jpg', 0),
(2433, 52, 'catalog/demo/hp_3.jpg', 0),
(2438, 53, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2437, 53, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2397, 50, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2426, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option`
--

CREATE TABLE `oc_product_option` (
  `product_option_id` int NOT NULL,
  `product_id` int NOT NULL,
  `option_id` int NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(234, 50, 9, '22:25', 1),
(217, 42, 5, '', 1),
(209, 42, 6, '', 1),
(222, 42, 7, '', 1),
(219, 42, 8, '2011-02-20', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '2011-02-20 22:25', 1),
(233, 50, 8, '2011-02-20', 1),
(232, 50, 7, '', 1),
(231, 50, 6, '', 1),
(230, 50, 5, '', 1),
(229, 50, 4, 'test', 1),
(228, 50, 2, '', 1),
(208, 42, 4, 'test', 1),
(223, 42, 2, '', 1),
(227, 50, 1, '', 1),
(218, 42, 1, '', 1),
(235, 50, 10, '2011-02-20 22:25', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option_value`
--

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int NOT NULL,
  `product_option_id` int NOT NULL,
  `product_id` int NOT NULL,
  `option_id` int NOT NULL,
  `option_value_id` int NOT NULL,
  `quantity` int NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(3, 217, 42, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(1, 217, 42, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(2, 217, 42, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(7, 218, 42, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(8, 223, 42, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(9, 223, 42, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(6, 218, 42, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(5, 218, 42, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00000000', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00000000', '+'),
(24, 230, 50, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(25, 230, 50, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(26, 230, 50, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(27, 230, 50, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(19, 227, 50, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(20, 228, 50, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(21, 228, 50, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(18, 227, 50, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(17, 227, 50, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(11, 223, 42, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+'),
(4, 217, 42, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(23, 228, 50, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+'),
(22, 228, 50, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+'),
(10, 223, 42, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_recurring`
--

CREATE TABLE `oc_product_recurring` (
  `product_id` int NOT NULL,
  `recurring_id` int NOT NULL,
  `customer_group_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related`
--

CREATE TABLE `oc_product_related` (
  `product_id` int NOT NULL,
  `related_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(40, 50),
(41, 42),
(41, 50),
(42, 40),
(42, 41),
(50, 40),
(50, 41);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related_article`
--

CREATE TABLE `oc_product_related_article` (
  `article_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_related_article`
--

INSERT INTO `oc_product_related_article` (`article_id`, `product_id`) VALUES
(120, 30),
(120, 40),
(120, 42),
(120, 50),
(120, 51),
(123, 42),
(123, 50),
(125, 30),
(125, 51);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related_mn`
--

CREATE TABLE `oc_product_related_mn` (
  `product_id` int NOT NULL,
  `manufacturer_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_related_mn`
--

INSERT INTO `oc_product_related_mn` (`product_id`, `manufacturer_id`) VALUES
(42, 8),
(41, 8),
(30, 9),
(47, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related_wb`
--

CREATE TABLE `oc_product_related_wb` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_related_wb`
--

INSERT INTO `oc_product_related_wb` (`product_id`, `category_id`) VALUES
(33, 20),
(41, 26),
(41, 27),
(43, 18),
(44, 18),
(45, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_reward`
--

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int NOT NULL,
  `product_id` int NOT NULL DEFAULT '0',
  `customer_group_id` int NOT NULL DEFAULT '0',
  `points` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(568, 42, 1, 100),
(569, 47, 1, 300),
(571, 28, 1, 400),
(329, 43, 1, 600),
(339, 29, 1, 0),
(562, 30, 1, 200),
(331, 44, 1, 700),
(333, 45, 1, 800),
(337, 31, 1, 0),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(521, 49, 1, 1000),
(561, 50, 1, 100),
(563, 51, 1, 200),
(570, 52, 1, 300),
(572, 53, 1, 400);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_special`
--

CREATE TABLE `oc_product_special` (
  `product_special_id` int NOT NULL,
  `product_id` int NOT NULL,
  `customer_group_id` int NOT NULL,
  `priority` int NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(464, 42, 1, 1, '90.0000', '0000-00-00', '0000-00-00'),
(457, 30, 1, 2, '90.0000', '0000-00-00', '0000-00-00'),
(456, 30, 1, 1, '80.0000', '0000-00-00', '0000-00-00'),
(455, 50, 1, 1, '90.0000', '0000-00-00', '0000-00-00'),
(459, 51, 1, 2, '90.0000', '0000-00-00', '0000-00-00'),
(458, 51, 1, 1, '80.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_category`
--

CREATE TABLE `oc_product_to_category` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `main_category` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`, `main_category`) VALUES
(28, 20, 0),
(28, 24, 1),
(29, 24, 1),
(29, 20, 0),
(30, 20, 0),
(30, 33, 1),
(31, 33, 1),
(51, 20, 1),
(33, 28, 1),
(33, 20, 0),
(51, 33, 0),
(35, 20, 1),
(50, 20, 1),
(40, 20, 0),
(40, 24, 1),
(41, 27, 1),
(42, 20, 0),
(42, 28, 1),
(43, 20, 0),
(43, 18, 0),
(44, 20, 0),
(44, 18, 0),
(45, 18, 0),
(46, 20, 0),
(46, 18, 0),
(47, 20, 0),
(47, 18, 0),
(50, 28, 0),
(48, 20, 1),
(49, 57, 1),
(46, 45, 1),
(47, 45, 1),
(43, 46, 1),
(44, 46, 1),
(45, 46, 1),
(52, 18, 1),
(52, 20, 0),
(52, 45, 0),
(53, 20, 1),
(53, 24, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_download`
--

CREATE TABLE `oc_product_to_download` (
  `product_id` int NOT NULL,
  `download_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_layout`
--

CREATE TABLE `oc_product_to_layout` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `layout_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(47, 0, 0),
(30, 0, 0),
(51, 0, 0),
(52, 0, 0),
(50, 0, 0),
(53, 0, 0),
(42, 0, 0),
(28, 0, 0),
(41, 0, 0),
(40, 0, 0),
(48, 0, 0),
(36, 0, 0),
(34, 0, 0),
(32, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_store`
--

CREATE TABLE `oc_product_to_store` (
  `product_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring`
--

CREATE TABLE `oc_recurring` (
  `recurring_id` int NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int UNSIGNED NOT NULL,
  `cycle` int UNSIGNED NOT NULL,
  `trial_status` tinyint NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int UNSIGNED NOT NULL,
  `trial_cycle` int UNSIGNED NOT NULL,
  `status` tinyint NOT NULL,
  `sort_order` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring_description`
--

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return`
--

CREATE TABLE `oc_return` (
  `return_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int NOT NULL,
  `return_action_id` int NOT NULL,
  `return_status_id` int NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_action`
--

CREATE TABLE `oc_return_action` (
  `return_action_id` int NOT NULL,
  `language_id` int NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Возмещенный'),
(2, 1, 'Возврат средств'),
(3, 1, 'Отправлена замена'),
(1, 2, 'Refunded'),
(3, 2, 'Replacement Sent'),
(2, 2, 'Credit Issued'),
(1, 3, 'Возмещенный'),
(2, 3, 'Возврат средств'),
(3, 3, 'Отправлена замена');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_history`
--

CREATE TABLE `oc_return_history` (
  `return_history_id` int NOT NULL,
  `return_id` int NOT NULL,
  `return_status_id` int NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_reason`
--

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int NOT NULL,
  `language_id` int NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Получен неисправным (сломанным)'),
(1, 2, 'Dead On Arrival'),
(2, 1, 'Получен не тот (ошибочный) товар'),
(2, 2, 'Received Wrong Item'),
(3, 1, 'Заказан по ошибке'),
(3, 2, 'Order Error'),
(4, 1, 'Неисправен, пожалуйста укажите/приложите подробности'),
(4, 2, 'Faulty, please supply details'),
(5, 1, 'Другое (другая причина), пожалуйста укажите/приложите подробности'),
(5, 2, 'Other, please supply details'),
(1, 3, 'Получен неисправным (сломанным)'),
(2, 3, 'Получен не тот (ошибочный) товар'),
(3, 3, 'Заказан по ошибке'),
(4, 3, 'Неисправен, пожалуйста укажите/приложите подробности'),
(5, 3, 'Другое (другая причина), пожалуйста укажите/приложите подробности');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_status`
--

CREATE TABLE `oc_return_status` (
  `return_status_id` int NOT NULL,
  `language_id` int NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'В ожидании'),
(3, 1, 'Выполнен'),
(2, 1, 'Ожидание товара'),
(1, 2, 'Pending'),
(2, 2, 'Awaiting Products'),
(3, 2, 'Complete'),
(1, 3, 'В ожидании'),
(3, 3, 'Выполнен'),
(2, 3, 'Ожидание товара');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_review`
--

CREATE TABLE `oc_review` (
  `review_id` int NOT NULL,
  `product_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_review`
--

INSERT INTO `oc_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1, 50, 0, 'Ghbdtn', 'srgrgergergergerg', 5, 1, '2022-02-13 16:15:09', '0000-00-00 00:00:00'),
(2, 30, 0, 'test', 'KTGKG JKGM JKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK', 3, 1, '2022-02-20 20:50:46', '2022-02-20 20:51:21');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_review_article`
--

CREATE TABLE `oc_review_article` (
  `review_article_id` int NOT NULL,
  `article_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `author` varchar(64) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `rating` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_review_article`
--

INSERT INTO `oc_review_article` (`review_article_id`, `article_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(12, 126, 0, 'test', 'Отзыв 1', 4, 1, '2022-02-20 19:41:04', '2022-02-21 15:18:54'),
(13, 126, 0, 'test', 'Отзыв 2', 2, 1, '2022-02-20 19:43:27', '2022-02-21 15:19:01');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_seo_url`
--

CREATE TABLE `oc_seo_url` (
  `seo_url_id` int NOT NULL,
  `store_id` int NOT NULL,
  `language_id` int NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_seo_url`
--

INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES
(601, 0, 1, 'account/voucher', 'vouchers'),
(602, 0, 1, 'account/wishlist', 'wishlist'),
(603, 0, 1, 'account/account', 'my-account'),
(604, 0, 1, 'checkout/cart', 'cart'),
(605, 0, 1, 'checkout/checkout', 'checkout'),
(606, 0, 1, 'account/login', 'login'),
(607, 0, 1, 'account/logout', 'logout'),
(608, 0, 1, 'account/order', 'order-history'),
(609, 0, 1, 'account/newsletter', 'newsletter'),
(610, 0, 1, 'product/special', 'specials'),
(611, 0, 1, 'affiliate/account', 'affiliates'),
(612, 0, 1, 'checkout/voucher', 'gift-vouchers'),
(613, 0, 1, 'product/manufacturer', 'brands'),
(614, 0, 1, 'information/contact', 'contact-us'),
(615, 0, 1, 'account/return/insert', 'request-return'),
(616, 0, 1, 'information/sitemap', 'sitemap'),
(617, 0, 1, 'account/forgotten', 'forgot-password'),
(618, 0, 1, 'account/download', 'downloads'),
(619, 0, 1, 'account/return', 'returns'),
(620, 0, 1, 'account/transaction', 'transactions'),
(621, 0, 1, 'account/register', 'create-account'),
(622, 0, 1, 'product/compare', 'compare-products'),
(623, 0, 1, 'product/search', 'search'),
(624, 0, 1, 'account/edit', 'edit-account'),
(625, 0, 1, 'account/password', 'change-password'),
(626, 0, 1, 'account/address', 'address-book'),
(627, 0, 1, 'account/reward', 'reward-points'),
(628, 0, 1, 'affiliate/edit', 'edit-affiliate-account'),
(629, 0, 1, 'affiliate/password', 'change-affiliate-password'),
(630, 0, 1, 'affiliate/payment', 'affiliate-payment-options'),
(631, 0, 1, 'affiliate/tracking', 'affiliate-tracking-code'),
(632, 0, 1, 'affiliate/transaction', 'affiliate-transactions'),
(633, 0, 1, 'affiliate/logout', 'affiliate-logout'),
(634, 0, 1, 'affiliate/forgotten', 'affiliate-forgot-password'),
(635, 0, 1, 'affiliate/register', 'create-affiliate-account'),
(636, 0, 1, 'affiliate/login', 'affiliate-login'),
(637, 0, 1, 'account/return/add', 'add-return'),
(1111, 0, 2, 'product_id=48', 'en_ipod-classic'),
(856, 0, 1, 'category_id=20', 'desktops'),
(858, 0, 1, 'category_id=26', 'pc'),
(860, 0, 1, 'category_id=27', 'mac'),
(932, 0, 1, 'manufacturer_id=8', 'apple'),
(850, 0, 1, 'information_id=4', 'about_us'),
(1101, 0, 2, 'product_id=42', 'en_apple_cinema_30'),
(878, 0, 1, 'category_id=36', 'test2'),
(862, 0, 1, 'category_id=18', 'laptop-notebook'),
(864, 0, 1, 'category_id=46', 'macs'),
(866, 0, 1, 'category_id=45', 'windows'),
(868, 0, 1, 'category_id=25', 'component'),
(870, 0, 1, 'category_id=29', 'mouse'),
(874, 0, 1, 'category_id=28', 'monitor'),
(876, 0, 1, 'category_id=35', 'test1'),
(880, 0, 1, 'category_id=30', 'printer'),
(882, 0, 1, 'category_id=31', 'scanner'),
(872, 0, 1, 'category_id=32', 'web-camera'),
(983, 0, 2, 'category_id=57', 'en_tablets'),
(886, 0, 1, 'category_id=17', 'software'),
(888, 0, 1, 'category_id=24', 'smartphone'),
(890, 0, 1, 'category_id=33', 'camera'),
(1105, 0, 2, 'product_id=28', 'en_htc-touch-hd'),
(966, 0, 1, 'product_id=43', 'macbook'),
(968, 0, 1, 'product_id=44', 'macbook-air'),
(970, 0, 1, 'product_id=45', 'macbook-pro'),
(972, 0, 1, 'product_id=31', 'nikon-d300'),
(974, 0, 1, 'product_id=29', 'palm-treo-pro'),
(976, 0, 1, 'product_id=35', 'product-8'),
(978, 0, 1, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(980, 0, 1, 'product_id=33', 'samsung-syncmaster-941bw'),
(944, 0, 1, 'product_id=46', 'sony-vaio'),
(1107, 0, 2, 'product_id=41', 'en_imac'),
(823, 0, 1, 'common/home', ''),
(1113, 0, 2, 'product_id=36', 'en_ipod-nano'),
(1115, 0, 2, 'product_id=34', 'en_ipod-shuffle'),
(1117, 0, 2, 'product_id=32', 'en_ipod-touch'),
(934, 0, 1, 'manufacturer_id=9', 'canon'),
(938, 0, 1, 'manufacturer_id=5', 'htc'),
(936, 0, 1, 'manufacturer_id=7', 'hewlett-packard'),
(940, 0, 1, 'manufacturer_id=6', 'palm'),
(942, 0, 1, 'manufacturer_id=10', 'sony'),
(848, 0, 1, 'information_id=6', 'delivery'),
(852, 0, 1, 'information_id=3', 'privacy'),
(854, 0, 1, 'information_id=5', 'terms'),
(1109, 0, 2, 'product_id=40', 'en_iphone'),
(845, 0, 2, 'common/home', 'en'),
(1108, 0, 1, 'product_id=40', 'iphone'),
(849, 0, 2, 'information_id=6', 'en_delivery'),
(851, 0, 2, 'information_id=4', 'en_about_us'),
(853, 0, 2, 'information_id=3', 'en_privacy'),
(855, 0, 2, 'information_id=5', 'en_terms'),
(857, 0, 2, 'category_id=20', 'en_desktops'),
(859, 0, 2, 'category_id=26', 'en_pc'),
(861, 0, 2, 'category_id=27', 'en_mac'),
(863, 0, 2, 'category_id=18', 'en_laptop-notebook'),
(865, 0, 2, 'category_id=46', 'en_macs'),
(867, 0, 2, 'category_id=45', 'en_windows'),
(869, 0, 2, 'category_id=25', 'en_component'),
(871, 0, 2, 'category_id=29', 'en_mouse'),
(873, 0, 2, 'category_id=32', 'en_web-camera'),
(875, 0, 2, 'category_id=28', 'en_monitor'),
(877, 0, 2, 'category_id=35', 'en_test1'),
(879, 0, 2, 'category_id=36', 'en_test2'),
(881, 0, 2, 'category_id=30', 'en_printer'),
(883, 0, 2, 'category_id=31', 'en_scanner'),
(982, 0, 1, 'category_id=57', 'tablets'),
(887, 0, 2, 'category_id=17', 'en_software'),
(889, 0, 2, 'category_id=24', 'en_smartphone'),
(891, 0, 2, 'category_id=33', 'en_camera'),
(1103, 0, 2, 'product_id=47', 'en_hp-lp3065'),
(1091, 0, 2, 'product_id=30', 'en_canon-eos-5d'),
(1083, 0, 2, 'extension/quickcheckout/checkout', 'checkout2'),
(1082, 0, 1, 'extension/quickcheckout/checkout', 'checkout1'),
(933, 0, 2, 'manufacturer_id=8', 'en_apple'),
(935, 0, 2, 'manufacturer_id=9', 'en_canon'),
(937, 0, 2, 'manufacturer_id=7', 'en_hewlett-packard'),
(939, 0, 2, 'manufacturer_id=5', 'en_htc'),
(941, 0, 2, 'manufacturer_id=6', 'en_palm'),
(943, 0, 2, 'manufacturer_id=10', 'en_sony'),
(945, 0, 2, 'product_id=46', 'en_sony-vaio'),
(1100, 0, 1, 'product_id=42', 'apple_cinema_30'),
(1090, 0, 1, 'product_id=30', 'canon-eos-5d'),
(1102, 0, 1, 'product_id=47', 'hp-lp3065'),
(1104, 0, 1, 'product_id=28', 'htc-touch-hd'),
(1106, 0, 1, 'product_id=41', 'imac'),
(1110, 0, 1, 'product_id=48', 'ipod-classic'),
(1112, 0, 1, 'product_id=36', 'ipod-nano'),
(1114, 0, 1, 'product_id=34', 'ipod-shuffle'),
(1116, 0, 1, 'product_id=32', 'ipod-touch'),
(967, 0, 2, 'product_id=43', 'en_macbook'),
(969, 0, 2, 'product_id=44', 'en_macbook-air'),
(971, 0, 2, 'product_id=45', 'en_macbook-pro'),
(973, 0, 2, 'product_id=31', 'en_nikon-d300'),
(975, 0, 2, 'product_id=29', 'en_palm-treo-pro'),
(977, 0, 2, 'product_id=35', 'en_product-8'),
(979, 0, 2, 'product_id=49', 'en_samsung-galaxy-tab-10-1'),
(981, 0, 2, 'product_id=33', 'en_samsung-syncmaster-941bw'),
(984, 0, 2, 'account/account', 'en-my-account'),
(985, 0, 2, 'checkout/cart', 'en-cart'),
(986, 0, 2, 'checkout/checkout', 'en-checkout'),
(987, 0, 2, 'account/login', 'en-login'),
(988, 0, 2, 'account/logout', 'en-logout'),
(989, 0, 2, 'account/order', 'en-order-history'),
(990, 0, 2, 'account/newsletter', 'en-newsletter'),
(991, 0, 2, 'product/special', 'en-specials'),
(992, 0, 2, 'affiliate/account', 'en-affiliates'),
(993, 0, 2, 'checkout/voucher', 'en-gift-vouchers'),
(994, 0, 2, 'product/manufacturer', 'en-brands'),
(995, 0, 2, 'information/contact', 'en-contact-us'),
(996, 0, 2, 'account/return/insert', 'en-request-return'),
(997, 0, 2, 'information/sitemap', 'en-sitemap'),
(998, 0, 2, 'account/forgotten', 'en-forgot-password'),
(999, 0, 2, 'account/download', 'en-downloads'),
(1001, 0, 2, 'account/return', 'en-returns'),
(1002, 0, 2, 'account/transaction', 'en-transactions'),
(1003, 0, 2, 'account/register', 'en-create-account'),
(1004, 0, 2, 'product/compare', 'en-compare-products'),
(1005, 0, 2, 'product/search', 'en-search'),
(1006, 0, 2, 'account/edit', 'en-edit-account'),
(1007, 0, 2, 'account/password', 'en-change-password'),
(1008, 0, 2, 'account/address', 'en-address-book'),
(1009, 0, 2, 'account/reward', 'en-reward-points'),
(1010, 0, 2, 'affiliate/edit', 'en-edit-affiliate-account'),
(1011, 0, 2, 'affiliate/password', 'en-change-affiliate-password'),
(1012, 0, 2, 'affiliate/payment', 'en-affiliate-payment-options'),
(1013, 0, 2, 'affiliate/tracking', 'en-affiliate-tracking-code'),
(1014, 0, 2, 'affiliate/transaction', 'en-affiliate-transactions'),
(1015, 0, 2, 'affiliate/logout', 'en-affiliate-logout'),
(1016, 0, 2, 'affiliate/forgotten', 'en-affiliate-forgot-password'),
(1017, 0, 2, 'affiliate/register', 'en-create-affiliate-account'),
(1018, 0, 2, 'affiliate/login', 'en-affiliate-login'),
(1019, 0, 2, 'account/voucher', 'en-vouchers'),
(1020, 0, 2, 'account/wishlist', 'en-wishlist'),
(1021, 0, 2, 'account/return/add', 'en-add-return');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_session`
--

CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_session`
--

INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('160bba455fe4dfb43d515482e1', '{\"api_id\":\"1\",\"language\":\"uk-ua\",\"currency\":\"RUB\"}', '2022-02-21 16:21:47'),
('1fd15918557f4e7240e304131a', '{\"language\":\"ru-ru\",\"currency\":\"UAH\",\"user_id\":\"1\",\"user_token\":\"TWb0huqqVFDJKOiCqcLvdPDla9HJlZxQ\",\"file_manager_directory\":\"C:\\/OpenServer\\/domains\\/monoled\\/image\\/catalog\\/\\u0422\\u043e\\u0432\\u0430\\u0440\\u044b\"}', '2022-02-21 16:22:25'),
('42461a8fb23c88ac3c909234e7', '{\"api_id\":\"1\",\"language\":\"uk-ua\",\"currency\":\"RUB\"}', '2022-02-21 16:21:44'),
('9d7f073f134c0fdcdb38d49d51', '{\"api_id\":\"1\",\"language\":\"uk-ua\",\"currency\":\"RUB\"}', '2022-02-21 16:21:38'),
('9dc2b0a9a24bab3cf09a9d1692', '{\"api_id\":\"1\",\"language\":\"uk-ua\",\"currency\":\"RUB\"}', '2022-02-21 16:21:41'),
('c9b6560a78218d5d4130a45251', '{\"api_id\":\"1\",\"language\":\"uk-ua\",\"currency\":\"RUB\"}', '2022-02-21 16:21:51'),
('d6edb56b53e3db238dc19b22db', '{\"api_id\":\"1\"}', '2022-02-21 16:21:51'),
('e8352143d2058585af68e07ada', '{\"api_id\":\"1\",\"language\":\"uk-ua\",\"currency\":\"RUB\"}', '2022-02-21 16:21:35');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_setting`
--

CREATE TABLE `oc_setting` (
  `setting_id` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '0',
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(100942, 0, 'theme_default', 'theme_default_image_location_height', '500', 0),
(101153, 0, 'config', 'config_noindex_disallow_params', 'page', 0),
(101149, 0, 'config', 'config_canonical_method', '0', 0),
(101150, 0, 'config', 'config_canonical_self', '0', 0),
(101151, 0, 'config', 'config_add_prevnext', '0', 0),
(101152, 0, 'config', 'config_noindex_status', '1', 0),
(101148, 0, 'config', 'config_valide_params', 'block\r\nfrommarket\r\ngclid\r\nfbclid\r\nkeyword\r\nlist_type\r\nopenstat\r\nopenstat_service\r\nopenstat_campaign\r\nopenstat_ad\r\nopenstat_source\r\nposition\r\nsource\r\ntracking\r\ntype\r\nyclid\r\nymclid\r\nuri\r\nurltype\r\nutm_source\r\nutm_medium\r\nutm_campaign\r\nutm_term\r\nutm_content', 0),
(101147, 0, 'config', 'config_valide_param_flag', '0', 0),
(101146, 0, 'config', 'config_page_postfix', '', 0),
(101145, 0, 'config', 'config_seopro_lowercase', '0', 0),
(101144, 0, 'config', 'config_seopro_addslash', '0', 0),
(101143, 0, 'config', 'config_seo_url_cache', '0', 0),
(101142, 0, 'config', 'config_seo_url_include_path', '0', 0),
(101141, 0, 'config', 'config_seo_pro', '0', 0),
(101140, 0, 'config', 'config_error_filename', 'error.log', 0),
(101137, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(101138, 0, 'config', 'config_error_display', '1', 0),
(101139, 0, 'config', 'config_error_log', '1', 0),
(101131, 0, 'config', 'config_secure', '0', 0),
(101132, 0, 'config', 'config_password', '1', 0),
(101133, 0, 'config', 'config_shared', '0', 0),
(101134, 0, 'config', 'config_encryption', 'iEEzMziy2zIsSB9CkzCVtr8phFFiPi3JNnpRYFyLfWfrURiiSAcyktJLOqqgjDyV24sXgH9huqqU2JouoaSsvYK2WR7AhhqrV61ZyZRbeOLc8E7oA4ztnEJvhuRjjnzTUN1dRDHLff01BrHYCTQEvzxhD4UKEhe48iERm6y7QQtMTbwHSSsBgz7EGKUWfWNusx8FteEa1UIPf7N1P3yH9jy2WoJnQ1FoOMEs9Tm5dlu39haFE83WBMyCCnEND3TyKWvOD6uTCtkqA9Z96DLdohxkD0OjuJptPCebMgHProfxc7UMdOPZ24FHaBYuVUPzNfbPjVJz3MB4S5gU9XZ8taC7bhXjzfYxgXMVI6TViecvBRQ6Nv7qjQ0LdHt4WR6Mm7PVCUhHAMcz8DsYo0dwWykNA66K5PcDDJt1l9ILsdluY1N6cjYbf3XRCExoJUjhMasSklXQ5nCPpas7IaWBOdglXx6r8tKDd2totfi0CTgLLPGpiYfjcjo2aqcdkhF9MxbvK8rl6dCGgnUJcEm87tGHw58FrxBQ63YNM8LsgLg03WgP6PRAjPeiXAfGODMLHoU1CqEAObIoSffbBA807LLIa7w0wmRze54lVvmI7CTAp5IoTeles1ldkPVcP00cUyzKna0Q5nxSSRgXHU96wiXUANXKeUqmfAj7SraSU4H84K9WtXv64SpL9H8C5nqR8JW0xeHND1RB5NEKRRfCQxbvCwEttDhSovWVOzacKd9o5KStnzeDEqJdOLWUvyk1TnCfVogek7SkegeLX4GbOmgcojfoRoQ9DHA7q7b8Gg9mHufVppQnG26xWD05ZvkIt5dqGTTPrJXCRFdvd0enpV3w5lWBL9zFgYhPA9Yr3GQy00h1DHzhTj1Ksk5UOjL6CKt3HI53uvpKytL4vfXFiNquhtWqCr4xEqDxbYQAjAqygXLEziWwwOs993mhU4Tc4JGE0wKz3a1TpnufpMkqZUR5uZD1AAkACz67gVtxdothkKC8loWDAPFir7zcOWd7', 0),
(1969, 0, 'shipping_free', 'shipping_free_sort_order', '2', 0),
(101129, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(101136, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(101135, 0, 'config', 'config_file_max_size', '1000000', 0),
(101130, 0, 'config', 'config_compression', '0', 0),
(101128, 0, 'config', 'config_seo_url', '0', 0),
(101127, 0, 'config', 'config_maintenance', '0', 0),
(101126, 0, 'config', 'config_mail_alert_email', '', 0),
(101125, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(101124, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(101122, 0, 'config', 'config_mail_smtp_password', '', 0),
(101123, 0, 'config', 'config_mail_smtp_port', '25', 0),
(101121, 0, 'config', 'config_mail_smtp_username', '', 0),
(101120, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(101119, 0, 'config', 'config_mail_parameter', '', 0),
(101118, 0, 'config', 'config_mail_engine', 'mail', 0),
(101117, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(101116, 0, 'config', 'config_logo', 'catalog/monologo.png', 0),
(101115, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(101114, 0, 'config', 'config_captcha', '', 0),
(101113, 0, 'config', 'config_return_status_id', '2', 0),
(96, 0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(97, 0, 'payment_free_checkout', 'payment_free_checkout_order_status_id', '1', 0),
(98, 0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(1979, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(1978, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(1977, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(1957, 0, 'shipping_flat', 'shipping_flat_sort_order', '1', 0),
(1956, 0, 'shipping_flat', 'shipping_flat_status', '1', 0),
(1955, 0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(1954, 0, 'shipping_flat', 'shipping_flat_tax_class_id', '0', 0),
(1953, 0, 'shipping_flat', 'shipping_flat_cost', '5.00', 0),
(109, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(110, 0, 'total_sub_total', 'total_sub_total_sort_order', '1', 0),
(111, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(112, 0, 'total_tax', 'total_tax_status', '1', 0),
(113, 0, 'total_total', 'total_total_sort_order', '9', 0),
(114, 0, 'total_total', 'total_total_status', '1', 0),
(115, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(116, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(117, 0, 'total_credit', 'total_credit_status', '1', 0),
(118, 0, 'total_reward', 'total_reward_sort_order', '2', 0),
(119, 0, 'total_reward', 'total_reward_status', '1', 0),
(120, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(121, 0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(122, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(123, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(124, 0, 'total_voucher', 'total_voucher_sort_order', '8', 0),
(125, 0, 'total_voucher', 'total_voucher_status', '1', 0),
(126, 0, 'module_category', 'module_category_status', '1', 0),
(127, 0, 'module_account', 'module_account_status', '1', 0),
(100941, 0, 'theme_default', 'theme_default_image_location_width', '500', 0),
(100940, 0, 'theme_default', 'theme_default_image_cart_height', '100', 0),
(100939, 0, 'theme_default', 'theme_default_image_cart_width', '100', 0),
(100938, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(100937, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(100936, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(100935, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(100934, 0, 'theme_default', 'theme_default_image_related_height', '500', 0),
(100933, 0, 'theme_default', 'theme_default_image_related_width', '500', 0),
(100930, 0, 'theme_default', 'theme_default_image_product_height', '500', 0),
(100931, 0, 'theme_default', 'theme_default_image_additional_width', '700', 0),
(100932, 0, 'theme_default', 'theme_default_image_additional_height', '700', 0),
(100928, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(100929, 0, 'theme_default', 'theme_default_image_product_width', '500', 0),
(100927, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(100926, 0, 'theme_default', 'theme_default_image_thumb_height', '1000', 0),
(100925, 0, 'theme_default', 'theme_default_image_thumb_width', '1000', 0),
(100924, 0, 'theme_default', 'theme_default_image_manufacturer_height', '80', 0),
(100923, 0, 'theme_default', 'theme_default_image_manufacturer_width', '80', 0),
(100921, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(100922, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(154, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(155, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(156, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(157, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(158, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(159, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(160, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(161, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(162, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(163, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(164, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(165, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(166, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(167, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(168, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(169, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(170, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(171, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(172, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(173, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(174, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(175, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(176, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(177, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(178, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(179, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(180, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(181, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(182, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(183, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(184, 0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(185, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(186, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(187, 0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(188, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(189, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(190, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(191, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(192, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(193, 0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(194, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(195, 0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(196, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(197, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(198, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(199, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(200, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(201, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(202, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(203, 0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(204, 0, 'developer', 'developer_theme', '1', 0),
(205, 0, 'developer', 'developer_sass', '1', 0),
(101042, 0, 'configblog', 'configblog_image_related_width', '500', 0),
(101044, 0, 'export_import', 'export_import_settings_use_attribute_id', '1', 0),
(101043, 0, 'configblog', 'configblog_image_related_height', '500', 0),
(101041, 0, 'configblog', 'configblog_image_article_height', '500', 0),
(101040, 0, 'configblog', 'configblog_image_article_width', '500', 0),
(101039, 0, 'configblog', 'configblog_image_category_height', '500', 0),
(101028, 0, 'configblog', 'configblog_meta_keyword', 'Блог для интернет магазина на OpenCart', 0),
(101038, 0, 'configblog', 'configblog_image_category_width', '500', 0),
(101036, 0, 'configblog', 'configblog_review_guest', '1', 0),
(101037, 0, 'configblog', 'configblog_review_mail', '1', 0),
(101035, 0, 'configblog', 'configblog_review_status', '1', 0),
(101034, 0, 'configblog', 'configblog_article_download', '1', 0),
(101033, 0, 'configblog', 'configblog_blog_menu', '1', 0),
(101032, 0, 'configblog', 'configblog_limit_admin', '20', 0),
(101030, 0, 'configblog', 'configblog_article_limit', '20', 0),
(101031, 0, 'configblog', 'configblog_article_description_length', '200', 0),
(101029, 0, 'configblog', 'configblog_article_count', '1', 0),
(101112, 0, 'config', 'config_return_id', '0', 0),
(227, 0, 'currency_cbr', 'currency_cbr_status', '1', 0),
(228, 0, 'currency_nbu', 'currency_nbu_status', '1', 0),
(229, 0, 'currency_ecb', 'currency_ecb_status', '1', 0),
(230, 0, 'currency_fixer', 'currency_fixer_status', '0', 0),
(101023, 0, 'module_blog_category', 'module_blog_category_status', '1', 0),
(232, 0, 'domovoy', 'domovoy_folders_logs', '{\"size\":137482,\"unit\":{\"size\":134.3,\"unit\":\"\\u041a\\u0431\\u0430\\u0439\\u0442\"},\"files\":4,\"date\":\"2022-02-21 15:15:29\"}', 1),
(233, 0, 'dashboard_domovoy', 'dashboard_domovoy_warning_funtions', 'diskfreespace\r\ndisk_total_space\r\ndisk_total_space\r\nfileperms\r\nfopen\r\nphpversion\r\nopendir\r\nposix_getpwuid\r\nposix_uname', 0),
(234, 0, 'dashboard_domovoy', 'dashboard_domovoy_danger_funtions', 'exec\r\npassthru\r\nini_get\r\nini_get_all\r\nparse_ini_file\r\nphp_uname\r\nsystem\r\nshell_exec\r\nshow_source\r\npcntl_exec\r\npcntl_exec\r\nexpect_popen\r\nproc_open\r\npopen', 0),
(235, 0, 'dashboard_domovoy', 'dashboard_domovoy_free_space_status', '0', 0),
(236, 0, 'dashboard_domovoy', 'dashboard_domovoy_disk_free_space', '500', 0),
(237, 0, 'dashboard_domovoy', 'dashboard_domovoy_cron', '{\"logs\":{\"status\":\"1\",\"size\":\"100\",\"time\":\"30\"},\"cache\":{\"status\":\"0\",\"size\":\"100\",\"time\":\"30\"},\"imagescache\":{\"status\":\"0\",\"size\":\"100\",\"time\":\"30\"}}', 1),
(238, 0, 'dashboard_domovoy', 'dashboard_domovoy_sort_order', '10', 0),
(239, 0, 'dashboard_domovoy', 'dashboard_domovoy_status', '1', 0),
(240, 0, 'dashboard_domovoy', 'dashboard_domovoy_width', '12', 0),
(101111, 0, 'config', 'config_affiliate_id', '4', 0),
(101110, 0, 'config', 'config_affiliate_commission', '5', 0),
(101109, 0, 'config', 'config_affiliate_auto', '0', 0),
(101108, 0, 'config', 'config_affiliate_approval', '0', 0),
(101107, 0, 'config', 'config_affiliate_group_id', '1', 0),
(101106, 0, 'config', 'config_stock_checkout', '0', 0),
(101105, 0, 'config', 'config_stock_warning', '0', 0),
(101104, 0, 'config', 'config_stock_display', '0', 0),
(101103, 0, 'config', 'config_api_id', '1', 0),
(101102, 0, 'config', 'config_fraud_status_id', '16', 0),
(101098, 0, 'config', 'config_checkout_id', '5', 0),
(101099, 0, 'config', 'config_order_status_id', '1', 0),
(101100, 0, 'config', 'config_processing_status', '[\"2\",\"3\",\"1\",\"12\",\"5\"]', 1),
(101101, 0, 'config', 'config_complete_status', '[\"3\",\"5\"]', 1),
(101097, 0, 'config', 'config_checkout_guest', '1', 0),
(101096, 0, 'config', 'config_cart_weight', '1', 0),
(101095, 0, 'config', 'config_invoice_prefix', 'INV-2022-00', 0),
(101094, 0, 'config', 'config_account_id', '3', 0),
(100920, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(100919, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(100918, 0, 'theme_default', 'theme_default_status', '1', 0),
(100917, 0, 'theme_default', 'theme_default_directory', 'monoled', 0),
(101093, 0, 'config', 'config_login_attempts', '5', 0),
(101092, 0, 'config', 'config_customer_price', '0', 0),
(101091, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(101090, 0, 'config', 'config_customer_group_id', '1', 0),
(101089, 0, 'config', 'config_customer_search', '0', 0),
(101088, 0, 'config', 'config_customer_activity', '0', 0),
(101086, 0, 'config', 'config_tax_customer', 'shipping', 0),
(101087, 0, 'config', 'config_customer_online', '0', 0),
(101085, 0, 'config', 'config_tax_default', 'shipping', 0),
(101084, 0, 'config', 'config_tax', '1', 0),
(101083, 0, 'config', 'config_voucher_max', '1000', 0),
(101082, 0, 'config', 'config_voucher_min', '1', 0),
(101081, 0, 'config', 'config_review_guest', '1', 0),
(101080, 0, 'config', 'config_review_status', '1', 0),
(101079, 0, 'config', 'config_limit_autocomplete', '5', 0),
(101078, 0, 'config', 'config_limit_admin', '20', 0),
(101077, 0, 'config', 'config_product_count', '1', 0),
(101076, 0, 'config', 'config_weight_class_id', '1', 0),
(101075, 0, 'config', 'config_length_class_id', '1', 0),
(101074, 0, 'config', 'config_currency_engine', 'nbu', 0),
(101073, 0, 'config', 'config_currency_auto', '1', 0),
(101072, 0, 'config', 'config_currency', 'UAH', 0),
(101071, 0, 'config', 'config_admin_language', 'ru-ru', 0),
(101069, 0, 'config', 'config_timezone', 'UTC', 0),
(101070, 0, 'config', 'config_language', 'ru-ru', 0),
(101068, 0, 'config', 'config_zone_id', '3493', 0),
(101067, 0, 'config', 'config_country_id', '220', 0),
(101066, 0, 'config', 'config_comment', '', 0),
(101065, 0, 'config', 'config_open', '', 0),
(101064, 0, 'config', 'config_image', '', 0),
(101063, 0, 'config', 'config_fax', '', 0),
(101062, 0, 'config', 'config_telegram', 'telegram', 0),
(101061, 0, 'config', 'config_gmail', 'gmail', 0),
(101060, 0, 'config', 'config_viber', 'viber', 0),
(101059, 0, 'config', 'config_facebook', 'facebook', 0),
(101058, 0, 'config', 'config_instagram', 'https://www.instagram.com/', 0),
(101057, 0, 'config', 'config_telephone', '123456789', 0),
(101056, 0, 'config', 'config_email', 'a@mail.com', 0),
(101055, 0, 'config', 'config_geocode', '', 0),
(101054, 0, 'config', 'config_address', 'Львів', 0),
(101053, 0, 'config', 'config_owner', 'Ваш магазин', 0),
(101052, 0, 'config', 'config_name', 'Ваш магазин', 0),
(1358, 0, 'module_quickcheckout', 'module_quickcheckout_status', '1', 0),
(2874, 0, 'd_quickcheckout', 'd_quickcheckout_status', '0', 0),
(2883, 0, 'module_d_quickcheckout', 'module_d_quickcheckout_debug_file', 'd_quickcheckout.log', 0),
(1972, 0, 'payment_bank_transfer', 'payment_bank_transfer_total', '', 0),
(1971, 0, 'payment_bank_transfer', 'payment_bank_transfer_bank2', 'sdgasdgsadg', 0),
(1970, 0, 'payment_bank_transfer', 'payment_bank_transfer_bank1', 'sgasdgsdg', 0),
(1968, 0, 'shipping_free', 'shipping_free_status', '1', 0),
(1967, 0, 'shipping_free', 'shipping_free_geo_zone_id', '0', 0),
(1966, 0, 'shipping_free', 'shipping_free_total', '0', 0),
(3167, 0, 'quickcheckout', 'quickcheckout_delivery_days_of_week', '', 0),
(3166, 0, 'quickcheckout', 'quickcheckout_delivery_max_hour', '17', 0),
(3165, 0, 'quickcheckout', 'quickcheckout_delivery_min_hour', '09', 0),
(3164, 0, 'quickcheckout', 'quickcheckout_delivery_max', '30', 0),
(3161, 0, 'quickcheckout', 'quickcheckout_delivery_required', '0', 0),
(3162, 0, 'quickcheckout', 'quickcheckout_delivery_unavailable', '&quot;2017-10-31&quot;, &quot;2017-08-11&quot;, &quot;2017-12-25&quot;', 0),
(3163, 0, 'quickcheckout', 'quickcheckout_delivery_min', '1', 0),
(3160, 0, 'quickcheckout', 'quickcheckout_delivery_time', '0', 0),
(3159, 0, 'quickcheckout', 'quickcheckout_delivery', '0', 0),
(3155, 0, 'quickcheckout', 'quickcheckout_survey', '0', 0),
(3156, 0, 'quickcheckout', 'quickcheckout_survey_required', '0', 0),
(3157, 0, 'quickcheckout', 'quickcheckout_survey_text', '{\"1\":\"\",\"2\":\"\"}', 1),
(3158, 0, 'quickcheckout', 'quickcheckout_survey_type', '0', 0),
(3154, 0, 'quickcheckout', 'quickcheckout_shipping_logo', '{\"flat\":\"\",\"free\":\"\"}', 1),
(3152, 0, 'quickcheckout', 'quickcheckout_shipping', '1', 0),
(3153, 0, 'quickcheckout', 'quickcheckout_shipping_default', 'flat', 0),
(3151, 0, 'quickcheckout', 'quickcheckout_shipping_title_display', '0', 0),
(3150, 0, 'quickcheckout', 'quickcheckout_shipping_module', '1', 0),
(3149, 0, 'quickcheckout', 'quickcheckout_payment_logo', '{\"bank_transfer\":\"\",\"cod\":\"\",\"free_checkout\":\"\"}', 1),
(3147, 0, 'quickcheckout', 'quickcheckout_payment_default', 'cod', 0),
(3148, 0, 'quickcheckout', 'quickcheckout_shipping_reload', '0', 0),
(3146, 0, 'quickcheckout', 'quickcheckout_payment', '1', 0),
(3145, 0, 'quickcheckout', 'quickcheckout_payment_reload', '0', 0),
(3144, 0, 'quickcheckout', 'quickcheckout_payment_module', '1', 0),
(3143, 0, 'quickcheckout', 'quickcheckout_html_footer', '{\"1\":\"\",\"2\":\"\"}', 1),
(3134, 0, 'quickcheckout', 'quickcheckout_field_newsletter', '{\"required\":\"on\",\"sort_order\":\"\"}', 1),
(3129, 0, 'quickcheckout', 'quickcheckout_field_address_2', '{\"default\":{\"1\":\"\",\"2\":\"\"},\"placeholder\":{\"1\":\"\",\"2\":\"\"},\"sort_order\":\"9\"}', 1),
(3130, 0, 'quickcheckout', 'quickcheckout_field_city', '{\"default\":{\"1\":\"\",\"2\":\"\"},\"placeholder\":{\"1\":\"\",\"2\":\"\"},\"sort_order\":\"10\"}', 1),
(3142, 0, 'quickcheckout', 'quickcheckout_html_header', '{\"1\":\"\",\"2\":\"\"}', 1),
(3141, 0, 'quickcheckout', 'quickcheckout_reward', '0', 0),
(3140, 0, 'quickcheckout', 'quickcheckout_voucher', '0', 0),
(3139, 0, 'quickcheckout', 'quickcheckout_coupon', '0', 0),
(3138, 0, 'quickcheckout', 'quickcheckout_field_comment', '{\"default\":{\"1\":\"\",\"2\":\"\"},\"placeholder\":{\"1\":\"\",\"2\":\"\"}}', 1),
(3137, 0, 'quickcheckout', 'quickcheckout_field_rules', '{\"display\":\"on\",\"required\":\"on\",\"sort_order\":\"\"}', 1),
(3136, 0, 'quickcheckout', 'quickcheckout_field_shipping', '{\"sort_order\":\"\"}', 1),
(3135, 0, 'quickcheckout', 'quickcheckout_field_register', '{\"sort_order\":\"\"}', 1),
(3133, 0, 'quickcheckout', 'quickcheckout_field_zone', '{\"default\":\"2761\",\"sort_order\":\"13\"}', 1),
(3132, 0, 'quickcheckout', 'quickcheckout_field_country', '{\"default\":\"176\",\"sort_order\":\"12\"}', 1),
(3131, 0, 'quickcheckout', 'quickcheckout_field_postcode', '{\"default\":{\"1\":\"\",\"2\":\"\"},\"placeholder\":{\"1\":\"\",\"2\":\"\"},\"sort_order\":\"11\"}', 1),
(3128, 0, 'quickcheckout', 'quickcheckout_field_address_1', '{\"default\":{\"1\":\"\",\"2\":\"\"},\"placeholder\":{\"1\":\"\",\"2\":\"\"},\"sort_order\":\"8\"}', 1),
(3125, 0, 'quickcheckout', 'quickcheckout_field_telephone', '{\"display\":\"on\",\"required\":\"on\",\"default\":{\"1\":\"\",\"2\":\"\"},\"placeholder\":{\"1\":\"\",\"2\":\"\"},\"sort_order\":\"4\"}', 1),
(3126, 0, 'quickcheckout', 'quickcheckout_field_company', '{\"default\":{\"1\":\"\",\"2\":\"\"},\"placeholder\":{\"1\":\"\",\"2\":\"\"},\"sort_order\":\"6\"}', 1),
(3127, 0, 'quickcheckout', 'quickcheckout_field_customer_group', '{\"sort_order\":\"7\"}', 1),
(3124, 0, 'quickcheckout', 'quickcheckout_field_email', '{\"display\":\"on\",\"required\":\"on\",\"default\":{\"1\":\"\",\"2\":\"\"},\"placeholder\":{\"1\":\"\",\"2\":\"\"},\"sort_order\":\"3\"}', 1),
(3122, 0, 'quickcheckout', 'quickcheckout_field_firstname', '{\"display\":\"on\",\"required\":\"on\",\"default\":{\"1\":\"\",\"2\":\"\"},\"placeholder\":{\"1\":\"\",\"2\":\"\"},\"sort_order\":\"1\"}', 1),
(3123, 0, 'quickcheckout', 'quickcheckout_field_lastname', '{\"display\":\"on\",\"required\":\"on\",\"default\":{\"1\":\"\",\"2\":\"\"},\"placeholder\":{\"1\":\"\",\"2\":\"\"},\"sort_order\":\"2\"}', 1),
(3121, 0, 'quickcheckout', 'quickcheckout_custom_css', '', 0),
(3120, 0, 'quickcheckout', 'quickcheckout_loading_display', '0', 0),
(3119, 0, 'quickcheckout', 'quickcheckout_load_screen', '0', 0),
(3118, 0, 'quickcheckout', 'quickcheckout_slide_effect', '0', 0),
(3117, 0, 'quickcheckout', 'quickcheckout_show_shipping_address', '0', 0),
(3116, 0, 'quickcheckout', 'quickcheckout_cart', '1', 0),
(3115, 0, 'quickcheckout', 'quickcheckout_login_module', '1', 0),
(3111, 0, 'quickcheckout', 'quickcheckout_layout', '1', 0),
(3112, 0, 'quickcheckout', 'quickcheckout_responsive', '1', 0),
(3113, 0, 'quickcheckout', 'quickcheckout_column', '{\"1\":\"4\",\"2\":\"4\",\"3\":\"4\",\"4\":\"8\"}', 1),
(3114, 0, 'quickcheckout', 'quickcheckout_step', '{\"login\":{\"column\":\"1\",\"row\":\"1\"},\"payment_address\":{\"column\":\"1\",\"row\":\"2\"},\"shipping_address\":{\"column\":\"1\",\"row\":\"3\"},\"shipping_method\":{\"column\":\"2\",\"row\":\"1\"},\"payment_method\":{\"column\":\"3\",\"row\":\"1\"},\"cart\":{\"column\":\"4\",\"row\":\"2\"},\"coupons\":{\"column\":\"4\",\"row\":\"2\"},\"confirm\":{\"column\":\"4\",\"row\":\"2\"}}', 1),
(3110, 0, 'quickcheckout', 'quickcheckout_keyword', '{\"1\":\"checkout1\",\"2\":\"checkout2\"}', 1),
(3109, 0, 'quickcheckout', 'quickcheckout_proceed_button_text', '{\"1\":\"\",\"2\":\"\"}', 1),
(3108, 0, 'quickcheckout', 'quickcheckout_force_bootstrap', '0', 0),
(3106, 0, 'quickcheckout', 'quickcheckout_payment_target', '#button-confirm, .button, .btn', 0),
(3107, 0, 'quickcheckout', 'quickcheckout_skip_cart', '1', 0),
(3105, 0, 'quickcheckout', 'quickcheckout_auto_submit', '1', 0),
(3104, 0, 'quickcheckout', 'quickcheckout_text_error', '1', 0),
(3103, 0, 'quickcheckout', 'quickcheckout_highlight_error', '1', 0),
(3102, 0, 'quickcheckout', 'quickcheckout_edit_cart', '1', 0),
(2878, 0, 'd_quickcheckout', 'd_quickcheckout_debug_file', 'd_quickcheckout.log', 0),
(2877, 0, 'd_quickcheckout', 'd_quickcheckout_setting', '{\"name\":\"\",\"general\":{\"clear_session\":\"0\",\"login_refresh\":\"0\",\"analytics_event\":\"0\",\"update_mini_cart\":\"1\",\"compress\":\"1\",\"min_order\":{\"value\":\"0\",\"text\":{\"1\":\"You must have a sum more then %s to make an order                   \",\"2\":\"The minimum order is %s                  \"}},\"min_quantity\":{\"value\":\"0\",\"text\":{\"1\":\"You must have a quantity more then %s to make an order          \",\"2\":\"The minimum quantity is %s         \"}},\"config\":\"d_quickcheckout\"}}', 1),
(2875, 0, 'd_quickcheckout', 'd_quickcheckout_trigger', '#button-confirm, .button, .btn, .button_oc, input[type=submit]', 0),
(3099, 0, 'quickcheckout', 'quickcheckout_debug', '1', 0),
(3100, 0, 'quickcheckout', 'quickcheckout_confirmation_page', '0', 0),
(1980, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(1981, 0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(1973, 0, 'payment_bank_transfer', 'payment_bank_transfer_order_status_id', '16', 0),
(1974, 0, 'payment_bank_transfer', 'payment_bank_transfer_geo_zone_id', '0', 0),
(1975, 0, 'payment_bank_transfer', 'payment_bank_transfer_status', '1', 0),
(1976, 0, 'payment_bank_transfer', 'payment_bank_transfer_sort_order', '', 0),
(3101, 0, 'quickcheckout', 'quickcheckout_save_data', '1', 0),
(2876, 0, 'd_quickcheckout', 'd_quickcheckout_debug', '0', 0),
(3098, 0, 'quickcheckout', 'quickcheckout_minimum_order', '0', 0),
(2879, 0, 'module_d_quickcheckout', 'module_d_quickcheckout_status', '0', 0),
(2880, 0, 'module_d_quickcheckout', 'module_d_quickcheckout_trigger', '#button-confirm, .button, .btn, .button_oc, input[type=submit]', 0),
(2881, 0, 'module_d_quickcheckout', 'module_d_quickcheckout_debug', '0', 0),
(2882, 0, 'module_d_quickcheckout', 'module_d_quickcheckout_setting', '{\"name\":\"\",\"general\":{\"clear_session\":\"0\",\"login_refresh\":\"0\",\"analytics_event\":\"0\",\"update_mini_cart\":\"1\",\"compress\":\"1\",\"min_order\":{\"value\":\"0\",\"text\":{\"1\":\"You must have a sum more then %s to make an order                   \",\"2\":\"The minimum order is %s                  \"}},\"min_quantity\":{\"value\":\"0\",\"text\":{\"1\":\"You must have a quantity more then %s to make an order          \",\"2\":\"The minimum quantity is %s         \"}},\"config\":\"d_quickcheckout\"}}', 1),
(3097, 0, 'quickcheckout', 'quickcheckout_status', '0', 0),
(101050, 0, 'config', 'config_theme', 'default', 0),
(101051, 0, 'config', 'config_layout_id', '4', 0),
(101049, 0, 'config', 'config_meta_keyword', '', 0),
(101048, 0, 'config', 'config_meta_description', 'Магазин світлових товарів', 0),
(101047, 0, 'config', 'config_meta_title', 'LABEL - Магазин світлових товарів', 0),
(100588, 0, 'brainyfilter', 'brainyfilter_layout_48', '{\"module_id\":\"48\",\"current_adm_tab\":\"embedding\",\"layout_id\":\"20\",\"layout_position\":\"column_left\",\"layout_sort_order\":\"0\",\"layout_enabled\":\"1\",\"behaviour\":{\"sort_order\":[]}}', 1),
(100589, 0, 'brainyfilter', 'brainyfilter_layout_basic', '{\"behaviour\":{\"containerSelector\":\"#content .row:nth-last-of-type(2)\",\"paginatorSelector\":\"#content .row:nth-last-of-type(1)\",\"attribute_groups\":1,\"product_count\":1,\"hide_empty\":0,\"limit_height\":{\"enabled\":0,\"height\":144},\"limit_items\":{\"enabled\":0,\"number_to_show\":4,\"number_to_hide\":2},\"sections\":{\"search\":{\"enabled\":0,\"collapsed\":0},\"price\":{\"enabled\":1,\"collapsed\":0,\"control\":\"slider\"},\"category\":{\"enabled\":1,\"collapsed\":0,\"control\":\"checkbox\"},\"stock_status\":{\"enabled\":1,\"collapsed\":0},\"manufacturer\":{\"enabled\":1,\"collapsed\":0,\"control\":\"checkbox\"},\"attribute\":{\"enabled\":1,\"collapsed\":0},\"option\":{\"enabled\":0,\"collapsed\":0},\"filter\":{\"enabled\":0,\"collapsed\":0},\"rating\":{\"enabled\":0,\"collapsed\":0}},\"sort_order\":{\"enabled\":0,\"search\":0,\"price\":1,\"category\":2,\"stock_status\":3,\"manufacturer\":4,\"attribute\":5,\"option\":6,\"filter\":7,\"rating\":8}},\"submission\":{\"submit_type\":\"button\",\"submit_button_type\":\"float\",\"submit_delay_time\":1000,\"hide_panel\":1},\"global\":{\"instock_status_id\":7,\"subcategories_fix\":0,\"multiple_attributes\":0,\"attribute_separator\":\",\",\"cron_secret_key\":\"\",\"hide_out_of_stock\":0,\"postponed_count\":1},\"style\":{\"block_header_background\":{\"val\":\"#f7f7f7\"},\"block_header_text\":{\"val\":\"#000000\"},\"product_quantity_background\":{\"val\":\"#F46234\"},\"product_quantity_text\":{\"val\":\"#ffffff\"},\"price_slider_background\":{\"val\":\"#eeeeee\"},\"price_slider_area_background\":{\"val\":\"#f6a828\"},\"price_slider_border\":{\"val\":\"#dddddd\"},\"price_slider_handle_background\":{\"val\":\"#f6f6f6\"},\"price_slider_handle_border\":{\"val\":\"#cccccc\"},\"group_block_header_background\":{\"val\":\"#CECBCB\"},\"group_block_header_text\":{\"val\":\"#000000\"},\"resp_show_btn_color\":{\"val\":\"#19A3DF\"},\"resp_reset_btn_color\":{\"val\":\"#F53838\"},\"responsive\":{\"enabled\":0,\"collapsed\":1,\"max_screen_width\":768,\"max_width\":300,\"position\":\"left\",\"offset\":80}},\"attributes_default\":{\"enable_all\":1,\"control\":\"checkbox\"},\"options_default\":{\"enable_all\":1,\"control\":\"checkbox\",\"mode\":\"label\"},\"filters_default\":{\"enable_all\":1,\"control\":\"checkbox\"},\"attributes\":[],\"options\":[],\"filters\":[],\"current_adm_tab\":\"embedding\",\"module_id\":\"basic\"}', 1),
(100591, 0, 'd_ajax_filter_cache', 'd_ajax_filter_cache', '{\"status\":true,\"steps\":[\"prepare.attribute\",\"save.attribute\",\"attribute\",\"restore.attribute\",\"prepare.ean\",\"ean\",\"prepare.filter\",\"save.filter\",\"filter\",\"restore.filter\",\"option\",\"prepare.tag\",\"tag\",\"product\"]}', 1),
(100599, 0, 'd_seo_extension', 'd_seo_extension_install', '[\"d_seo_module\",\"d_ajax_filter_seo\"]', 1),
(100593, 0, 'dashboard_d_seo_module_target_keyword', 'dashboard_d_seo_module_target_keyword_status', '1', 0),
(100594, 0, 'dashboard_d_seo_module_target_keyword', 'dashboard_d_seo_module_target_keyword_width', '12', 0),
(100595, 0, 'dashboard_d_seo_module_target_keyword', 'dashboard_d_seo_module_target_keyword_sort_order', '20', 0),
(100596, 0, 'dashboard_d_seo_module_target_keyword', 'dashboard_d_seo_module_target_keyword_setting', '{\"stores_id\":[0]}', 1),
(100597, 0, 'd_seo_module', 'd_seo_module_setting', '{\"d_seo_module_setting\":{\"control_element\":{\"enable_status\":{\"implemented\":1}}},\"control_element\":{\"enable_robots\":{\"implemented\":1}},\"list_limit\":\"20\"}', 1),
(100598, 0, 'd_seo_module', 'd_seo_module_status', '1', 0),
(100600, 0, 'd_ajax_filter_seo', 'd_ajax_filter_seo_status', '1', 0),
(100601, 0, 'd_ajax_filter_seo', 'd_ajax_filter_seo_setting', '{\"generate_status\":\"1\"}', 1),
(101027, 0, 'configblog', 'configblog_meta_description', 'Блог для интернет магазина на OpenCart', 0),
(101025, 0, 'configblog', 'configblog_html_h1', 'Блог для интернет магазина на OpenCart', 0),
(101026, 0, 'configblog', 'configblog_meta_title', 'Блог для интернет магазина на OpenCart', 0),
(101024, 0, 'configblog', 'configblog_name', 'Блог', 0),
(101045, 0, 'export_import', 'export_import_settings_use_export_cache', '0', 0),
(101046, 0, 'export_import', 'export_import_settings_use_import_cache', '0', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_shipping_courier`
--

CREATE TABLE `oc_shipping_courier` (
  `shipping_courier_id` int NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_shipping_courier`
--

INSERT INTO `oc_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES
(1, 'dhl', 'DHL'),
(2, 'fedex', 'Fedex'),
(3, 'ups', 'UPS'),
(4, 'royal-mail', 'Royal Mail'),
(5, 'usps', 'United States Postal Service'),
(6, 'auspost', 'Australia Post');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_statistics`
--

CREATE TABLE `oc_statistics` (
  `statistics_id` int NOT NULL,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_statistics`
--

INSERT INTO `oc_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', '1245.0000'),
(2, 'order_processing', '0.0000'),
(3, 'order_complete', '0.0000'),
(4, 'order_other', '0.0000'),
(5, 'returns', '0.0000'),
(6, 'product', '0.0000'),
(7, 'review', '1.0000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_stock_status`
--

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'В наличии'),
(8, 1, 'Предзаказ'),
(5, 1, 'Нет в наличии'),
(6, 1, 'Ожидание 2-3 дня'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2-3 Days'),
(7, 3, 'В наличии'),
(8, 3, 'Предзаказ'),
(5, 3, 'Нет в наличии'),
(6, 3, 'Ожидание 2-3 дня');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_store`
--

CREATE TABLE `oc_store` (
  `store_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_class`
--

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate`
--

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int NOT NULL,
  `geo_zone_id` int NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate_to_customer_group`
--

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int NOT NULL,
  `customer_group_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rule`
--

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int NOT NULL,
  `tax_class_id` int NOT NULL,
  `tax_rate_id` int NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_theme`
--

CREATE TABLE `oc_theme` (
  `theme_id` int NOT NULL,
  `store_id` int NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_translation`
--

CREATE TABLE `oc_translation` (
  `translation_id` int NOT NULL,
  `store_id` int NOT NULL,
  `language_id` int NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_upload`
--

CREATE TABLE `oc_upload` (
  `upload_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int NOT NULL,
  `user_group_id` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '923d496725d8fb5fb2b77a23f427887b343cfccc', '5LhJ7mXdc', 'John', 'Doe', 'a@mail.com', '', '', '127.0.0.1', 1, '2022-02-09 23:48:19');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"blog\",\"blog\\/article\",\"blog\\/category\",\"blog\\/review\",\"blog\\/setting\",\"catalog\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/newsletter\",\"common\\/profile\",\"common\\/security\",\"customer\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"error\",\"event\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\",\"extension\\/advertise\",\"extension\\/advertise\\/google\",\"extension\\/analytics\",\"extension\\/analytics\\/google\",\"extension\\/captcha\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/currency\",\"extension\\/currency\\/cbr\",\"extension\\/currency\\/ecb\",\"extension\\/currency\\/fixer\",\"extension\\/currency\\/nbu\",\"extension\\/dashboard\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/domovoy\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/export_import\",\"extension\\/extension\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/currency\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/unisender\",\"extension\\/feed\\/yandex_market\",\"extension\\/feed\\/yandex_turbo\",\"extension\\/fraud\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/banners_grid\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_featured\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/bottom_banner\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/center_banner\",\"extension\\/module\\/d_quickcheckout\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/featured\",\"extension\\/module\\/featured_article\",\"extension\\/module\\/featured_product\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/hit\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/newest\",\"extension\\/module\\/newsletter\",\"extension\\/module\\/paypal_smart_button\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/preimushestva_banner\",\"extension\\/module\\/quickcheckout\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/sidebar_banner\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/payment\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/ocstore_w1\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypal\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/webmoney_wmb\",\"extension\\/payment\\/webmoney_wme\",\"extension\\/payment\\/webmoney_wmk\",\"extension\\/payment\\/webmoney_wmr\",\"extension\\/payment\\/webmoney_wmu\",\"extension\\/payment\\/webmoney_wmv\",\"extension\\/payment\\/webmoney_wmz\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\",\"extension\\/theme\\/default\",\"extension\\/total\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/opencartforum\",\"marketplace\\/promotion\",\"report\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"search\",\"search\\/search\",\"setting\",\"setting\\/setting\",\"setting\\/store\",\"startup\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"blog\",\"blog\\/article\",\"blog\\/category\",\"blog\\/review\",\"blog\\/setting\",\"catalog\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"common\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/newsletter\",\"common\\/profile\",\"common\\/security\",\"customer\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"design\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"error\",\"event\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\",\"extension\\/advertise\",\"extension\\/advertise\\/google\",\"extension\\/analytics\",\"extension\\/analytics\\/google\",\"extension\\/captcha\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/currency\",\"extension\\/currency\\/cbr\",\"extension\\/currency\\/ecb\",\"extension\\/currency\\/fixer\",\"extension\\/currency\\/nbu\",\"extension\\/dashboard\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/domovoy\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/export_import\",\"extension\\/extension\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/currency\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/feed\",\"extension\\/feed\\/google_base\",\"extension\\/feed\\/google_sitemap\",\"extension\\/feed\\/unisender\",\"extension\\/feed\\/yandex_market\",\"extension\\/feed\\/yandex_turbo\",\"extension\\/fraud\",\"extension\\/fraud\\/fraudlabspro\",\"extension\\/fraud\\/ip\",\"extension\\/fraud\\/maxmind\",\"extension\\/module\",\"extension\\/module\\/account\",\"extension\\/module\\/amazon_login\",\"extension\\/module\\/amazon_pay\",\"extension\\/module\\/banner\",\"extension\\/module\\/banners_grid\",\"extension\\/module\\/bestseller\",\"extension\\/module\\/blog_category\",\"extension\\/module\\/blog_featured\",\"extension\\/module\\/blog_latest\",\"extension\\/module\\/bottom_banner\",\"extension\\/module\\/carousel\",\"extension\\/module\\/category\",\"extension\\/module\\/center_banner\",\"extension\\/module\\/d_quickcheckout\",\"extension\\/module\\/divido_calculator\",\"extension\\/module\\/featured\",\"extension\\/module\\/featured_article\",\"extension\\/module\\/featured_product\",\"extension\\/module\\/filter\",\"extension\\/module\\/google_hangouts\",\"extension\\/module\\/hit\",\"extension\\/module\\/html\",\"extension\\/module\\/information\",\"extension\\/module\\/klarna_checkout_module\",\"extension\\/module\\/latest\",\"extension\\/module\\/laybuy_layout\",\"extension\\/module\\/newest\",\"extension\\/module\\/newsletter\",\"extension\\/module\\/paypal_smart_button\",\"extension\\/module\\/pilibaba_button\",\"extension\\/module\\/pp_braintree_button\",\"extension\\/module\\/preimushestva_banner\",\"extension\\/module\\/quickcheckout\",\"extension\\/module\\/sagepay_direct_cards\",\"extension\\/module\\/sagepay_server_cards\",\"extension\\/module\\/sidebar_banner\",\"extension\\/module\\/slideshow\",\"extension\\/module\\/special\",\"extension\\/module\\/store\",\"extension\\/payment\",\"extension\\/payment\\/alipay\",\"extension\\/payment\\/alipay_cross\",\"extension\\/payment\\/amazon_login_pay\",\"extension\\/payment\\/authorizenet_aim\",\"extension\\/payment\\/authorizenet_sim\",\"extension\\/payment\\/bank_transfer\",\"extension\\/payment\\/bluepay_hosted\",\"extension\\/payment\\/bluepay_redirect\",\"extension\\/payment\\/cardconnect\",\"extension\\/payment\\/cardinity\",\"extension\\/payment\\/cheque\",\"extension\\/payment\\/cod\",\"extension\\/payment\\/divido\",\"extension\\/payment\\/eway\",\"extension\\/payment\\/firstdata\",\"extension\\/payment\\/firstdata_remote\",\"extension\\/payment\\/free_checkout\",\"extension\\/payment\\/g2apay\",\"extension\\/payment\\/globalpay\",\"extension\\/payment\\/globalpay_remote\",\"extension\\/payment\\/klarna_account\",\"extension\\/payment\\/klarna_checkout\",\"extension\\/payment\\/klarna_invoice\",\"extension\\/payment\\/laybuy\",\"extension\\/payment\\/liqpay\",\"extension\\/payment\\/nochex\",\"extension\\/payment\\/ocstore_w1\",\"extension\\/payment\\/paymate\",\"extension\\/payment\\/paypal\",\"extension\\/payment\\/paypoint\",\"extension\\/payment\\/payza\",\"extension\\/payment\\/perpetual_payments\",\"extension\\/payment\\/pilibaba\",\"extension\\/payment\\/pp_braintree\",\"extension\\/payment\\/pp_express\",\"extension\\/payment\\/pp_payflow\",\"extension\\/payment\\/pp_payflow_iframe\",\"extension\\/payment\\/pp_pro\",\"extension\\/payment\\/pp_pro_iframe\",\"extension\\/payment\\/pp_standard\",\"extension\\/payment\\/realex\",\"extension\\/payment\\/realex_remote\",\"extension\\/payment\\/sagepay_direct\",\"extension\\/payment\\/sagepay_server\",\"extension\\/payment\\/sagepay_us\",\"extension\\/payment\\/securetrading_pp\",\"extension\\/payment\\/securetrading_ws\",\"extension\\/payment\\/skrill\",\"extension\\/payment\\/squareup\",\"extension\\/payment\\/twocheckout\",\"extension\\/payment\\/web_payment_software\",\"extension\\/payment\\/webmoney_wmb\",\"extension\\/payment\\/webmoney_wme\",\"extension\\/payment\\/webmoney_wmk\",\"extension\\/payment\\/webmoney_wmr\",\"extension\\/payment\\/webmoney_wmu\",\"extension\\/payment\\/webmoney_wmv\",\"extension\\/payment\\/webmoney_wmz\",\"extension\\/payment\\/wechat_pay\",\"extension\\/payment\\/worldpay\",\"extension\\/report\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/shipping\",\"extension\\/shipping\\/auspost\",\"extension\\/shipping\\/ec_ship\",\"extension\\/shipping\\/fedex\",\"extension\\/shipping\\/flat\",\"extension\\/shipping\\/free\",\"extension\\/shipping\\/item\",\"extension\\/shipping\\/parcelforce_48\",\"extension\\/shipping\\/pickup\",\"extension\\/shipping\\/royal_mail\",\"extension\\/shipping\\/ups\",\"extension\\/shipping\\/usps\",\"extension\\/shipping\\/weight\",\"extension\\/theme\",\"extension\\/theme\\/default\",\"extension\\/total\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"localisation\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/opencartforum\",\"marketplace\\/promotion\",\"report\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"search\",\"search\\/search\",\"setting\",\"setting\\/setting\",\"setting\\/store\",\"startup\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher`
--

CREATE TABLE `oc_voucher` (
  `voucher_id` int NOT NULL,
  `order_id` int NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_history`
--

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int NOT NULL,
  `voucher_id` int NOT NULL,
  `order_id` int NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme`
--

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme_description`
--

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int NOT NULL,
  `language_id` int NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 3, 'Christmas'),
(7, 3, 'Birthday'),
(8, 3, 'General');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class`
--

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class_description`
--

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int NOT NULL,
  `language_id` int NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Килограммы', 'кг'),
(1, 2, 'Kilogram', 'kg'),
(2, 1, 'Граммы', 'г'),
(2, 2, 'Gram', 'g'),
(5, 1, 'Фунты', 'lb'),
(5, 2, 'Pound', 'lb'),
(6, 1, 'Унции', 'oz'),
(6, 2, 'Ounce', 'oz'),
(1, 3, 'Килограммы', 'кг'),
(2, 3, 'Граммы', 'г'),
(5, 3, 'Фунты', 'lb'),
(6, 3, 'Унции', 'oz');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone`
--

CREATE TABLE `oc_zone` (
  `zone_id` int NOT NULL,
  `country_id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M\'Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu\'a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Арагацотн', 'AGT', 1),
(181, 11, 'Арарат', 'ARR', 1),
(182, 11, 'Армавир', 'ARM', 1),
(183, 11, 'Гегаркуник', 'GEG', 1),
(184, 11, 'Котайк', 'KOT', 1),
(185, 11, 'Лори', 'LOR', 1),
(186, 11, 'Ширак', 'SHI', 1),
(187, 11, 'Сюник', 'SYU', 1),
(188, 11, 'Тавуш', 'TAV', 1),
(189, 11, 'Вайоц Дзор', 'VAY', 1),
(190, 11, 'Ереван', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore\'s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Брест', 'BR', 1),
(338, 20, 'Гомель', 'HO', 1),
(339, 20, 'Минск', 'HM', 1),
(340, 20, 'Гродно', 'HR', 1),
(341, 20, 'Могилев', 'MA', 1),
(342, 20, 'Минская область', 'MI', 1),
(343, 20, 'Витебск', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George\'s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith\'s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M\'Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O\'Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '\'Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma\'iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa\'id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina\'', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina\'', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d\'Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand\'Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta\'mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be\'er Sheva', 'BS', 1),
(1613, 104, 'Bika\'at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '\'Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al \'Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa\'', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa\'', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma\'an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Алматинская область', 'AL', 1),
(1717, 109, 'Алматы - город республ-го значения', 'AC', 1),
(1718, 109, 'Акмолинская область', 'AM', 1),
(1719, 109, 'Актюбинская область', 'AQ', 1),
(1720, 109, 'Астана - город республ-го значения', 'AS', 1),
(1721, 109, 'Атырауская область', 'AT', 1),
(1722, 109, 'Западно-Казахстанская область', 'BA', 1),
(1723, 109, 'Байконур - город республ-го значения', 'BY', 1),
(1724, 109, 'Мангистауская область', 'MA', 1),
(1725, 109, 'Южно-Казахстанская область', 'ON', 1),
(1726, 109, 'Павлодарская область', 'PA', 1),
(1727, 109, 'Карагандинская область', 'QA', 1),
(1728, 109, 'Костанайская область', 'QO', 1),
(1729, 109, 'Кызылординская область', 'QY', 1),
(1730, 109, 'Восточно-Казахстанская область', 'SH', 1),
(1731, 109, 'Северо-Казахстанская область', 'SO', 1),
(1732, 109, 'Жамбылская область', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P\'yongan-bukto', 'PYB', 1),
(1769, 112, 'P\'yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P\'yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 1),
(1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch\'on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al \'Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra\'', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale\'s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha\'s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al \'Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati\'', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke\'s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa\'id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Республика Хакасия', 'KK', 1),
(2722, 176, 'Забайкальский край', 'ZAB', 1),
(2723, 176, 'Чукотский АО', 'CHU', 1),
(2724, 176, 'Архангельская область', 'ARK', 1),
(2725, 176, 'Астраханская область', 'AST', 1),
(2726, 176, 'Алтайский край', 'ALT', 1),
(2727, 176, 'Белгородская область', 'BEL', 1),
(2728, 176, 'Еврейская АО', 'YEV', 1),
(2729, 176, 'Амурская область', 'AMU', 1),
(2730, 176, 'Брянская область', 'BRY', 1),
(2731, 176, 'Чувашская Республика', 'CU', 1),
(2732, 176, 'Челябинская область', 'CHE', 1),
(2733, 176, 'Карачаево-Черкесия', 'KC', 1),
(2735, 176, 'Таймырский АО', 'TDN', 1),
(2736, 176, 'Республика Калмыкия', 'KL', 1),
(2738, 176, 'Республика Алтай', 'AL', 1),
(2739, 176, 'Чеченская Республика', 'CE', 1),
(2740, 176, 'Иркутская область', 'IRK', 1),
(2741, 176, 'Ивановская область', 'IVA', 1),
(2742, 176, 'Удмуртская Республика', 'UD', 1),
(2743, 176, 'Калининградская область', 'KGD', 1),
(2744, 176, 'Калужская область', 'KLU', 1),
(2745, 176, 'Краснодарский край', 'KDA', 1),
(2746, 176, 'Республика Татарстан', 'TA', 1),
(2747, 176, 'Кемеровская область', 'KEM', 1),
(2748, 176, 'Хабаровский край', 'KHA', 1),
(2749, 176, 'Ханты-Мансийский АО - Югра', 'KHM', 1),
(2750, 176, 'Костромская область', 'KOS', 1),
(2751, 176, 'Московская область', 'MOS', 1),
(2752, 176, 'Красноярский край', 'KYA', 1),
(2753, 176, 'Коми-Пермяцкий АО', 'KOP', 1),
(2754, 176, 'Курганская область', 'KGN', 1),
(2755, 176, 'Курская область', 'KRS', 1),
(2756, 176, 'Республика Тыва', 'TY', 1),
(2757, 176, 'Липецкая область', 'LIP', 1),
(2758, 176, 'Магаданская область', 'MAG', 1),
(2759, 176, 'Республика Дагестан', 'DA', 1),
(2760, 176, 'Республика Адыгея', 'AD', 1),
(2761, 176, 'Москва', 'MOW', 1),
(2762, 176, 'Мурманская область', 'MUR', 1),
(2763, 176, 'Республика Кабардино-Балкария', 'KB', 1),
(2764, 176, 'Ненецкий АО', 'NEN', 1),
(2765, 176, 'Республика Ингушетия', 'IN', 1),
(2766, 176, 'Нижегородская область', 'NIZ', 1),
(2767, 176, 'Новгородская область', 'NGR', 1),
(2768, 176, 'Новосибирская область', 'NVS', 1),
(2769, 176, 'Омская область', 'OMS', 1),
(2770, 176, 'Орловская область', 'ORL', 1),
(2771, 176, 'Оренбургская область', 'ORE', 1),
(2772, 176, 'Корякский АО', 'KOR', 1),
(2773, 176, 'Пензенская область', 'PNZ', 1),
(2774, 176, 'Пермский край', 'PER', 1),
(2775, 176, 'Камчатский край', 'KAM', 1),
(2776, 176, 'Республика Карелия', 'KR', 1),
(2777, 176, 'Псковская область', 'PSK', 1),
(2778, 176, 'Ростовская область', 'ROS', 1),
(2779, 176, 'Рязанская область', 'RYA', 1),
(2780, 176, 'Ямало-Ненецкий АО', 'YAN', 1),
(2781, 176, 'Самарская область', 'SAM', 1),
(2782, 176, 'Республика Мордовия', 'MO', 1),
(2783, 176, 'Саратовская область', 'SAR', 1),
(2784, 176, 'Смоленская область', 'SMO', 1),
(2785, 176, 'Санкт-Петербург', 'SPE', 1),
(2786, 176, 'Ставропольский край', 'STA', 1),
(2787, 176, 'Республика Коми', 'KO', 1),
(2788, 176, 'Тамбовская область', 'TAM', 1),
(2789, 176, 'Томская область', 'TOM', 1),
(2790, 176, 'Тульская область', 'TUL', 1),
(2791, 176, 'Ленинградская область', 'LEN', 1),
(2792, 176, 'Тверская область', 'TVE', 1),
(2793, 176, 'Тюменская область', 'TYU', 1),
(2794, 176, 'Республика Башкортостан', 'BA', 1),
(2795, 176, 'Ульяновская область', 'ULY', 1),
(2796, 176, 'Республика Бурятия', 'BU', 1),
(2798, 176, 'Республика Северная Осетия', 'SE', 1),
(2799, 176, 'Владимирская область', 'VLA', 1),
(2800, 176, 'Приморский край', 'PRI', 1),
(2801, 176, 'Волгоградская область', 'VGG', 1),
(2802, 176, 'Вологодская область', 'VLG', 1),
(2803, 176, 'Воронежская область', 'VOR', 1),
(2804, 176, 'Кировская область', 'KIR', 1),
(2805, 176, 'Республика  Саха / Якутия', 'SA', 1),
(2806, 176, 'Ярославская область', 'YAR', 1),
(2807, 176, 'Свердловская область', 'SVE', 1),
(2808, 176, 'Республика Марий Эл', 'ME', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A\'ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa\'asaleleaga', 'FA', 1),
(2856, 181, 'Gaga\'emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa\'itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va\'a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '\'Asir', 'AS', 1),
(2882, 184, 'Ha\'il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A\'ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'Gävleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'Jämtland', 'Z', 1),
(3080, 203, 'Jönköping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, 'Örebro', 'T', 1),
(3085, 203, 'Östergötland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'Södermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'Värmland', 'S', 1),
(3091, 203, 'Västerbotten', 'AC', 1),
(3092, 203, 'Västernorrland', 'Y', 1),
(3093, 203, 'Västmanland', 'U', 1),
(3094, 203, 'Västra Götaland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graubünden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Zürich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t\'ou', 'NT', 1),
(3145, 206, 'P\'eng-hu', 'PH', 1),
(3146, 206, 'P\'ing-tung', 'PT', 1),
(3147, 206, 'T\'ai-chung', 'TG', 1),
(3148, 206, 'T\'ai-nan', 'TA', 1),
(3149, 206, 'T\'ai-pei county', 'TP', 1),
(3150, 206, 'T\'ai-tung', 'TT', 1),
(3151, 206, 'T\'ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T\'ai-chung', 'TH', 1),
(3157, 206, 'T\'ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T\'ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha\'apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava\'u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Черкасская область', '71', 1),
(3481, 220, 'Черниговская область', '74', 1),
(3482, 220, 'Черновицкая область', '77', 1),
(3483, 220, 'Крым', '43', 1),
(3484, 220, 'Днепропетровская область', '12', 1),
(3485, 220, 'Донецкая область', '14', 1),
(3486, 220, 'Ивано-Франковская область', '26', 1),
(3487, 220, 'Херсонская область', '65', 1),
(3488, 220, 'Хмельницкая область', '68', 1),
(3489, 220, 'Кировоградская область', '35', 1),
(3490, 220, 'Киев', '30', 1),
(3491, 220, 'Киевская область', '32', 1),
(3492, 220, 'Луганская область', '09', 1),
(3493, 220, 'Львовская область', '46', 1),
(3494, 220, 'Николаевская область', '48', 1),
(3495, 220, 'Одесская область', '51', 1),
(3496, 220, 'Полтавская область', '53', 1),
(3497, 220, 'Ровненская область', '56', 1),
(3498, 220, 'Севастополь', '40', 1),
(3499, 220, 'Сумская область', '59', 1),
(3500, 220, 'Тернопольская область', '61', 1),
(3501, 220, 'Винницкая область', '05', 1),
(3502, 220, 'Волынская область', '07', 1),
(3503, 220, 'Закарпатская область', '21', 1),
(3504, 220, 'Запорожская область', '23', 1),
(3505, 220, 'Житомирская область', '18', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '\'Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R\'as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg\'ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma\'rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa\'dah', 'SD', 1),
(3805, 235, 'San\'a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta\'izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Харьковская область', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1),
(4232, 44, 'Qinghai', 'QH', 1),
(4233, 100, 'Papua Barat', 'PB', 1),
(4234, 100, 'Sulawesi Barat', 'SR', 1),
(4235, 100, 'Kepulauan Riau', 'KR', 1),
(4236, 105, 'Barletta-Andria-Trani', 'BT', 1),
(4237, 105, 'Fermo', 'FM', 1),
(4238, 105, 'Monza Brianza', 'MB', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone_to_geo_zone`
--

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int NOT NULL,
  `country_id` int NOT NULL,
  `zone_id` int NOT NULL DEFAULT '0',
  `geo_zone_id` int NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `oc_af_attribute_values`
--
ALTER TABLE `oc_af_attribute_values`
  ADD PRIMARY KEY (`attribute_value_id`),
  ADD UNIQUE KEY `attribute_id` (`attribute_id`,`language_id`,`text`(200));

--
-- Индексы таблицы `oc_af_ean`
--
ALTER TABLE `oc_af_ean`
  ADD PRIMARY KEY (`ean_id`),
  ADD UNIQUE KEY `value` (`value`);

--
-- Индексы таблицы `oc_af_filter`
--
ALTER TABLE `oc_af_filter`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Индексы таблицы `oc_af_product_attribute`
--
ALTER TABLE `oc_af_product_attribute`
  ADD PRIMARY KEY (`product_attribute_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `attribute_id` (`attribute_id`),
  ADD KEY `attribute_value_id` (`attribute_value_id`);

--
-- Индексы таблицы `oc_af_product_ean`
--
ALTER TABLE `oc_af_product_ean`
  ADD PRIMARY KEY (`product_ean_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `ean_id` (`ean_id`);

--
-- Индексы таблицы `oc_af_product_tag`
--
ALTER TABLE `oc_af_product_tag`
  ADD PRIMARY KEY (`product_tag_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Индексы таблицы `oc_af_query`
--
ALTER TABLE `oc_af_query`
  ADD PRIMARY KEY (`query_id`);

--
-- Индексы таблицы `oc_af_query_description`
--
ALTER TABLE `oc_af_query_description`
  ADD PRIMARY KEY (`query_id`,`language_id`);

--
-- Индексы таблицы `oc_af_tag`
--
ALTER TABLE `oc_af_tag`
  ADD PRIMARY KEY (`tag_id`),
  ADD UNIQUE KEY `language_id` (`language_id`,`value`);

--
-- Индексы таблицы `oc_af_values`
--
ALTER TABLE `oc_af_values`
  ADD PRIMARY KEY (`af_value_id`),
  ADD UNIQUE KEY `type` (`type`,`group_id`,`value`);

--
-- Индексы таблицы `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Индексы таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Индексы таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Индексы таблицы `oc_article`
--
ALTER TABLE `oc_article`
  ADD PRIMARY KEY (`article_id`);

--
-- Индексы таблицы `oc_article_description`
--
ALTER TABLE `oc_article_description`
  ADD PRIMARY KEY (`article_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_article_image`
--
ALTER TABLE `oc_article_image`
  ADD PRIMARY KEY (`article_image_id`);

--
-- Индексы таблицы `oc_article_related`
--
ALTER TABLE `oc_article_related`
  ADD PRIMARY KEY (`article_id`,`related_id`);

--
-- Индексы таблицы `oc_article_related_mn`
--
ALTER TABLE `oc_article_related_mn`
  ADD PRIMARY KEY (`article_id`,`manufacturer_id`);

--
-- Индексы таблицы `oc_article_related_product`
--
ALTER TABLE `oc_article_related_product`
  ADD PRIMARY KEY (`article_id`,`product_id`);

--
-- Индексы таблицы `oc_article_related_wb`
--
ALTER TABLE `oc_article_related_wb`
  ADD PRIMARY KEY (`article_id`,`category_id`);

--
-- Индексы таблицы `oc_article_to_blog_category`
--
ALTER TABLE `oc_article_to_blog_category`
  ADD PRIMARY KEY (`article_id`,`blog_category_id`);

--
-- Индексы таблицы `oc_article_to_download`
--
ALTER TABLE `oc_article_to_download`
  ADD PRIMARY KEY (`article_id`,`download_id`);

--
-- Индексы таблицы `oc_article_to_layout`
--
ALTER TABLE `oc_article_to_layout`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Индексы таблицы `oc_article_to_store`
--
ALTER TABLE `oc_article_to_store`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Индексы таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Индексы таблицы `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Индексы таблицы `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Индексы таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Индексы таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Индексы таблицы `oc_bf_attribute_value`
--
ALTER TABLE `oc_bf_attribute_value`
  ADD PRIMARY KEY (`attribute_value_id`),
  ADD UNIQUE KEY `attribute_id` (`attribute_id`,`language_id`,`value`),
  ADD KEY `sort_order` (`sort_order`);

--
-- Индексы таблицы `oc_bf_filter`
--
ALTER TABLE `oc_bf_filter`
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_bf_product_attribute_value`
--
ALTER TABLE `oc_bf_product_attribute_value`
  ADD PRIMARY KEY (`product_id`,`attribute_value_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_bf_tax_rate`
--
ALTER TABLE `oc_bf_tax_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_group_id` (`customer_group_id`,`country_id`,`zone_id`),
  ADD KEY `tax_class_id` (`tax_class_id`);

--
-- Индексы таблицы `oc_blog_category`
--
ALTER TABLE `oc_blog_category`
  ADD PRIMARY KEY (`blog_category_id`);

--
-- Индексы таблицы `oc_blog_category_description`
--
ALTER TABLE `oc_blog_category_description`
  ADD PRIMARY KEY (`blog_category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_blog_category_path`
--
ALTER TABLE `oc_blog_category_path`
  ADD PRIMARY KEY (`blog_category_id`,`path_id`);

--
-- Индексы таблицы `oc_blog_category_to_layout`
--
ALTER TABLE `oc_blog_category_to_layout`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Индексы таблицы `oc_blog_category_to_store`
--
ALTER TABLE `oc_blog_category_to_store`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Индексы таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Индексы таблицы `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Индексы таблицы `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Индексы таблицы `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Индексы таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Индексы таблицы `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Индексы таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Индексы таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Индексы таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Индексы таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Индексы таблицы `oc_customer_affiliate`
--
ALTER TABLE `oc_customer_affiliate`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  ADD PRIMARY KEY (`customer_approval_id`);

--
-- Индексы таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Индексы таблицы `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Индексы таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Индексы таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Индексы таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Индексы таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Индексы таблицы `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Индексы таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Индексы таблицы `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Индексы таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Индексы таблицы `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Индексы таблицы `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Индексы таблицы `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Индексы таблицы `oc_dqc_setting`
--
ALTER TABLE `oc_dqc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `oc_dqc_statistic`
--
ALTER TABLE `oc_dqc_statistic`
  ADD PRIMARY KEY (`statistic_id`);

--
-- Индексы таблицы `oc_d_meta_data`
--
ALTER TABLE `oc_d_meta_data`
  ADD PRIMARY KEY (`route`,`store_id`,`language_id`);

--
-- Индексы таблицы `oc_d_target_keyword`
--
ALTER TABLE `oc_d_target_keyword`
  ADD PRIMARY KEY (`route`,`store_id`,`language_id`,`sort_order`),
  ADD KEY `keyword` (`keyword`);

--
-- Индексы таблицы `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Индексы таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Индексы таблицы `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  ADD PRIMARY KEY (`extension_install_id`);

--
-- Индексы таблицы `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  ADD PRIMARY KEY (`extension_path_id`);

--
-- Индексы таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Индексы таблицы `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Индексы таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Индексы таблицы `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Индексы таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Индексы таблицы `oc_googleshopping_category`
--
ALTER TABLE `oc_googleshopping_category`
  ADD PRIMARY KEY (`google_product_category`,`store_id`),
  ADD KEY `category_id_store_id` (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_googleshopping_product`
--
ALTER TABLE `oc_googleshopping_product`
  ADD PRIMARY KEY (`product_advertise_google_id`),
  ADD UNIQUE KEY `product_id_store_id` (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_googleshopping_product_status`
--
ALTER TABLE `oc_googleshopping_product_status`
  ADD PRIMARY KEY (`product_id`,`store_id`,`product_variation_id`);

--
-- Индексы таблицы `oc_googleshopping_product_target`
--
ALTER TABLE `oc_googleshopping_product_target`
  ADD PRIMARY KEY (`product_id`,`advertise_google_target_id`);

--
-- Индексы таблицы `oc_googleshopping_target`
--
ALTER TABLE `oc_googleshopping_target`
  ADD PRIMARY KEY (`advertise_google_target_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Индексы таблицы `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Индексы таблицы `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Индексы таблицы `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Индексы таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Индексы таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Индексы таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Индексы таблицы `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Индексы таблицы `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Индексы таблицы `oc_manufacturer_to_layout`
--
ALTER TABLE `oc_manufacturer_to_layout`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Индексы таблицы `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Индексы таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Индексы таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Индексы таблицы `oc_modification_backup`
--
ALTER TABLE `oc_modification_backup`
  ADD PRIMARY KEY (`backup_id`);

--
-- Индексы таблицы `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Индексы таблицы `oc_newsletter`
--
ALTER TABLE `oc_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Индексы таблицы `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Индексы таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Индексы таблицы `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Индексы таблицы `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Индексы таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Индексы таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Индексы таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Индексы таблицы `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  ADD PRIMARY KEY (`order_shipment_id`);

--
-- Индексы таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Индексы таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Индексы таблицы `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);
ALTER TABLE `oc_product` ADD FULLTEXT KEY `af_values` (`af_values`);
ALTER TABLE `oc_product` ADD FULLTEXT KEY `af_tags` (`af_tags`);

--
-- Индексы таблицы `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Индексы таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Индексы таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`),
  ADD KEY `bf_product_option_value` (`product_id`,`option_value_id`);

--
-- Индексы таблицы `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Индексы таблицы `oc_product_related_article`
--
ALTER TABLE `oc_product_related_article`
  ADD PRIMARY KEY (`article_id`,`product_id`);

--
-- Индексы таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Индексы таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Индексы таблицы `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Индексы таблицы `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Индексы таблицы `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Индексы таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Индексы таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Индексы таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Индексы таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Индексы таблицы `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_review_article`
--
ALTER TABLE `oc_review_article`
  ADD PRIMARY KEY (`review_article_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Индексы таблицы `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  ADD PRIMARY KEY (`seo_url_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Индексы таблицы `oc_session`
--
ALTER TABLE `oc_session`
  ADD PRIMARY KEY (`session_id`);

--
-- Индексы таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `oc_shipping_courier`
--
ALTER TABLE `oc_shipping_courier`
  ADD PRIMARY KEY (`shipping_courier_id`);

--
-- Индексы таблицы `oc_statistics`
--
ALTER TABLE `oc_statistics`
  ADD PRIMARY KEY (`statistics_id`);

--
-- Индексы таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Индексы таблицы `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Индексы таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Индексы таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Индексы таблицы `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Индексы таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Индексы таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Индексы таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Индексы таблицы `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Индексы таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Индексы таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Индексы таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Индексы таблицы `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Индексы таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Индексы таблицы `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Индексы таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Индексы таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_af_attribute_values`
--
ALTER TABLE `oc_af_attribute_values`
  MODIFY `attribute_value_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `oc_af_ean`
--
ALTER TABLE `oc_af_ean`
  MODIFY `ean_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_af_product_attribute`
--
ALTER TABLE `oc_af_product_attribute`
  MODIFY `product_attribute_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_af_product_ean`
--
ALTER TABLE `oc_af_product_ean`
  MODIFY `product_ean_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_af_product_tag`
--
ALTER TABLE `oc_af_product_tag`
  MODIFY `product_tag_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_af_query`
--
ALTER TABLE `oc_af_query`
  MODIFY `query_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_af_tag`
--
ALTER TABLE `oc_af_tag`
  MODIFY `tag_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_af_values`
--
ALTER TABLE `oc_af_values`
  MODIFY `af_value_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `oc_article`
--
ALTER TABLE `oc_article`
  MODIFY `article_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT для таблицы `oc_article_image`
--
ALTER TABLE `oc_article_image`
  MODIFY `article_image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3981;

--
-- AUTO_INCREMENT для таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT для таблицы `oc_bf_attribute_value`
--
ALTER TABLE `oc_bf_attribute_value`
  MODIFY `attribute_value_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_bf_tax_rate`
--
ALTER TABLE `oc_bf_tax_rate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT для таблицы `oc_blog_category`
--
ALTER TABLE `oc_blog_category`
  MODIFY `blog_category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT для таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT для таблицы `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT для таблицы `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT для таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  MODIFY `customer_approval_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_dqc_setting`
--
ALTER TABLE `oc_dqc_setting`
  MODIFY `setting_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_dqc_statistic`
--
ALTER TABLE `oc_dqc_statistic`
  MODIFY `statistic_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT для таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT для таблицы `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  MODIFY `extension_install_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  MODIFY `extension_path_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2123;

--
-- AUTO_INCREMENT для таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `oc_googleshopping_product`
--
ALTER TABLE `oc_googleshopping_product`
  MODIFY `product_advertise_google_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT для таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT для таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `oc_modification_backup`
--
ALTER TABLE `oc_modification_backup`
  MODIFY `backup_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `oc_newsletter`
--
ALTER TABLE `oc_newsletter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_shipment`
--
ALTER TABLE `oc_order_shipment`
  MODIFY `order_shipment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT для таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT для таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=474;

--
-- AUTO_INCREMENT для таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2463;

--
-- AUTO_INCREMENT для таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT для таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=573;

--
-- AUTO_INCREMENT для таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT для таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_review_article`
--
ALTER TABLE `oc_review_article`
  MODIFY `review_article_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  MODIFY `seo_url_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1118;

--
-- AUTO_INCREMENT для таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101154;

--
-- AUTO_INCREMENT для таблицы `oc_statistics`
--
ALTER TABLE `oc_statistics`
  MODIFY `statistics_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT для таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4239;

--
-- AUTO_INCREMENT для таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
