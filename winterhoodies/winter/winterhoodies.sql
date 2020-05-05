-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 04, 2020 at 05:09 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `winterhoodies`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product'),
(29, 'Can add orders', 8, 'add_orders'),
(30, 'Can change orders', 8, 'change_orders'),
(31, 'Can delete orders', 8, 'delete_orders'),
(32, 'Can view orders', 8, 'view_orders'),
(33, 'Can add message', 9, 'add_message'),
(34, 'Can change message', 9, 'change_message'),
(35, 'Can delete message', 9, 'delete_message'),
(36, 'Can view message', 9, 'view_message'),
(37, 'Can add order status', 10, 'add_orderstatus'),
(38, 'Can change order status', 10, 'change_orderstatus'),
(39, 'Can delete order status', 10, 'delete_orderstatus'),
(40, 'Can view order status', 10, 'view_orderstatus');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$Qehi87yWNSyR$zaqLuEkIzAUhFZBruUvG+06fgmrcGFNoDybBApXBxCs=', '2020-04-30 07:38:08.089717', 1, 'avi', '', '', '', 1, 1, '2020-04-29 18:32:35.483811');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-04-29 18:37:07.261644', '1', 'test', 1, '[{\"added\": {}}]', 7, 1),
(2, '2020-04-30 06:00:20.281189', '1', 'ADIDAS', 2, '[{\"changed\": {\"fields\": [\"Product name\", \"Price\", \"Tagline\", \"Desc\", \"Image\", \"Subimg1\", \"Subimg2\", \"Subimg3\", \"Subimg4\"]}}]', 7, 1),
(3, '2020-04-30 06:07:55.723877', '2', 'H&M', 1, '[{\"added\": {}}]', 7, 1),
(4, '2020-04-30 06:11:25.678203', '3', 'Campus Sutra', 1, '[{\"added\": {}}]', 7, 1),
(5, '2020-04-30 06:14:35.831032', '4', 'Kook N Keech', 1, '[{\"added\": {}}]', 7, 1),
(6, '2020-04-30 06:17:28.978868', '5', 'Tokyo Talkies', 1, '[{\"added\": {}}]', 7, 1),
(7, '2020-04-30 06:21:25.449083', '6', 'Belle Fille', 1, '[{\"added\": {}}]', 7, 1),
(8, '2020-04-30 06:31:48.477311', '7', 'DressBerry', 1, '[{\"added\": {}}]', 7, 1),
(9, '2020-05-02 20:12:54.325899', '17', 'Orders object (17)', 3, '', 8, 1),
(10, '2020-05-02 20:12:54.404861', '16', 'Orders object (16)', 3, '', 8, 1),
(11, '2020-05-02 20:12:54.407906', '15', 'Orders object (15)', 3, '', 8, 1),
(12, '2020-05-02 20:12:54.410894', '14', 'Orders object (14)', 3, '', 8, 1),
(13, '2020-05-02 20:12:54.412884', '13', 'Orders object (13)', 3, '', 8, 1),
(14, '2020-05-02 20:12:54.414837', '12', 'Orders object (12)', 3, '', 8, 1),
(15, '2020-05-02 20:12:54.416827', '11', 'Orders object (11)', 3, '', 8, 1),
(16, '2020-05-02 20:12:54.419878', '10', 'Orders object (10)', 3, '', 8, 1),
(17, '2020-05-02 20:12:54.422814', '9', 'Orders object (9)', 3, '', 8, 1),
(18, '2020-05-02 20:12:54.424881', '8', 'Orders object (8)', 3, '', 8, 1),
(19, '2020-05-02 20:12:54.426800', '7', 'Orders object (7)', 3, '', 8, 1),
(20, '2020-05-02 20:12:54.429181', '6', 'Orders object (6)', 3, '', 8, 1),
(21, '2020-05-02 20:12:54.431283', '5', 'Orders object (5)', 3, '', 8, 1),
(22, '2020-05-02 20:12:54.433849', '4', 'Orders object (4)', 3, '', 8, 1),
(23, '2020-05-02 20:12:54.435776', '3', 'Orders object (3)', 3, '', 8, 1),
(24, '2020-05-02 20:12:54.438195', '2', 'Orders object (2)', 3, '', 8, 1),
(25, '2020-05-02 20:12:54.440809', '1', 'Orders object (1)', 3, '', 8, 1),
(26, '2020-05-02 21:59:58.267675', '18', 'Orders object (18)', 2, '[{\"changed\": {\"fields\": [\"Items json\", \"State\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'shop', 'product'),
(8, 'shop', 'orders'),
(9, 'shop', 'message'),
(10, 'shop', 'orderstatus');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-04-29 06:50:04.727420'),
(2, 'auth', '0001_initial', '2020-04-29 06:50:05.134482'),
(3, 'admin', '0001_initial', '2020-04-29 06:50:06.937363'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-04-29 06:50:07.391843'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-04-29 06:50:07.421760'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-04-29 06:50:07.705247'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-04-29 06:50:07.810516'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-04-29 06:50:07.931459'),
(9, 'auth', '0004_alter_user_username_opts', '2020-04-29 06:50:07.955164'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-04-29 06:50:08.088307'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-04-29 06:50:08.094315'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-04-29 06:50:08.123944'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-04-29 06:50:08.245401'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-04-29 06:50:08.476472'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-04-29 06:50:08.598118'),
(16, 'auth', '0011_update_proxy_permissions', '2020-04-29 06:50:08.628802'),
(17, 'sessions', '0001_initial', '2020-04-29 06:50:08.692022'),
(18, 'shop', '0001_initial', '2020-04-29 18:05:04.593287'),
(19, 'shop', '0002_auto_20200430_1105', '2020-04-30 05:36:30.767131'),
(20, 'shop', '0003_product_tagline', '2020-04-30 05:51:20.771289'),
(21, 'shop', '0004_orders', '2020-05-02 07:08:39.122933'),
(22, 'shop', '0005_auto_20200503_1726', '2020-05-03 11:59:01.709735'),
(23, 'shop', '0006_orders_items_json', '2020-05-03 11:59:01.879353'),
(24, 'shop', '0007_auto_20200503_1735', '2020-05-03 12:05:43.221097'),
(25, 'shop', '0008_message', '2020-05-04 05:50:55.315708'),
(26, 'shop', '0009_orderstatus', '2020-05-04 07:39:03.309847');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('khfk2scetqjzg9o70whwk6815wcnk2fg', 'OTI4MzhlNzVkY2E5NmNlOWEwYmRkNjEwOGQ2NGE1MGQ0OTE4OGM1MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzOTZlMzUxOWVkM2E1NDAzYzFiODc1MGY1MjM2NWUzYjZmZDE1Mjc4In0=', '2020-05-14 07:38:08.090714');

-- --------------------------------------------------------

--
-- Table structure for table `shop_message`
--

DROP TABLE IF EXISTS `shop_message`;
CREATE TABLE IF NOT EXISTS `shop_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `message` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_message`
--

INSERT INTO `shop_message` (`id`, `name`, `email`, `message`) VALUES
(1, 'Abhay Raj', 'rajsinghabhay54@gmail.com', 'default'),
(2, 'Abhay Raj', 'rajsinghabhay54@gmail.com', 'message nhi dalenge mera marji\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `shop_orders`
--

DROP TABLE IF EXISTS `shop_orders`;
CREATE TABLE IF NOT EXISTS `shop_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(90) NOT NULL,
  `lname` varchar(90) NOT NULL,
  `branch` varchar(90) NOT NULL,
  `reg_id` varchar(90) NOT NULL,
  `mobno` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `amount` int(11) NOT NULL,
  `items_json` varchar(4000) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_orders`
--

INSERT INTO `shop_orders` (`order_id`, `fname`, `lname`, `branch`, `reg_id`, `mobno`, `email`, `address`, `city`, `zip_code`, `state`, `comment`, `amount`, `items_json`) VALUES
(1, 'Abhay', 'Raj', 'CSE', '', '8540986656', 'rajsinghabhay54@gmail.com', 'Address1 Address 2', 'Rajgir', '803116', 'Bihar', 'No Comments', 1278, '{\"pr6-l-black\":[\"/media/shop/themes/images/21_D2tPUHi.jpg\",\"Belle Fille\",2,639,\"Large\",\"Black\",6,\"lblack\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `shop_orderstatus`
--

DROP TABLE IF EXISTS `shop_orderstatus`;
CREATE TABLE IF NOT EXISTS `shop_orderstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(1000) NOT NULL,
  `orderstatus` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_orderstatus`
--

INSERT INTO `shop_orderstatus` (`id`, `orderid`, `orderstatus`) VALUES
(1, '1', 'Order Recieved just now and sent for packing.');

-- --------------------------------------------------------

--
-- Table structure for table `shop_product`
--

DROP TABLE IF EXISTS `shop_product`;
CREATE TABLE IF NOT EXISTS `shop_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(75) NOT NULL,
  `price` int(11) NOT NULL,
  `desc` varchar(2000) NOT NULL,
  `image` varchar(100) NOT NULL,
  `lblack` int(11) NOT NULL,
  `lblue` int(11) NOT NULL,
  `mblack` int(11) NOT NULL,
  `mblue` int(11) NOT NULL,
  `sblack` int(11) NOT NULL,
  `sblue` int(11) NOT NULL,
  `subimg1` varchar(100) NOT NULL,
  `subimg2` varchar(100) NOT NULL,
  `subimg3` varchar(100) NOT NULL,
  `subimg4` varchar(100) NOT NULL,
  `xlblack` int(11) NOT NULL,
  `xlblue` int(11) NOT NULL,
  `tagline` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_product`
--

INSERT INTO `shop_product` (`id`, `product_name`, `price`, `desc`, `image`, `lblack`, `lblue`, `mblack`, `mblue`, `sblack`, `sblue`, `subimg1`, `subimg2`, `subimg3`, `subimg4`, `xlblack`, `xlblue`, `tagline`) VALUES
(1, 'ADIDAS', 1819, 'A soft layer to zip up over your workout wear. Designed to look good heading to the gym or just hanging out, this men\'s hoodie is made in soft cotton blend and recycled polyester fabric. Features front zip pockets with adidas performance logo on the chest.', 'shop/themes/images/1_YfLtEYh.jpg', 9, 7, 4, 3, 9, 5, 'shop/themes/images/1_TFiTVSr.jpg', 'shop/themes/images/2_p39s6t5.jpg', 'shop/themes/images/3_UqISutw.jpg', 'shop/themes/images/4_mxzwyPS.jpg', 1, 1, 'Men Black Solid MH Plain FZ Hooded Sweatshirt'),
(2, 'H&M', 1499, 'Long-sleeved sweatshirt fabric with a lined drawstring hood, kangaroo pocket and ribbing at the cuffs and hem. Soft brushed inside.', 'shop/themes/images/5_PAbT4Wf.jpg', 10, 11, 10, 10, 11, 11, 'shop/themes/images/5_drao4gw.jpg', 'shop/themes/images/6_n1BuMlU.jpg', 'shop/themes/images/7_7Fx8gVr.jpg', 'shop/themes/images/8_O7SYTO8.jpg', 1, 1, 'Men Pink Solid Hooded Sweatshirt'),
(3, 'Campus Sutra', 799, 'Grey and Black colourblocked sweatshirt, has a hood, one pocket, long sleeves, straight hem', 'shop/themes/images/9_RfR8NSv.jpg', 9, 12, 12, 12, 11, 12, 'shop/themes/images/9_1H6uwYb.jpg', 'shop/themes/images/10_6UNVnnH.jpg', 'shop/themes/images/11_a85Kn4n.jpg', 'shop/themes/images/12_7Q7y39a.jpg', 1, 1, 'Men Black & Grey Colourblocked Hooded Sweatshirt'),
(4, 'Kook N Keech', 879, 'White and black colourblocked sweatshirt, has a hood, long sleeves, straight hem', 'shop/themes/images/13_H38awjk.jpg', 10, 13, 13, 13, 13, 13, 'shop/themes/images/13_d6M1Ne1.jpg', 'shop/themes/images/14_wpyRSFp.jpg', 'shop/themes/images/15_p52SEfe.jpg', 'shop/themes/images/16_Y6AEnVf.jpg', 1, 1, 'Men White & Black Colourblocked Hooded Sweatshirt'),
(5, 'Tokyo Talkies', 472, 'Black printed sweatshirt, has a hood, long sleeves, straight hem', 'shop/themes/images/17_735hI0Y.jpg', 14, 13, 12, 14, 14, 14, 'shop/themes/images/17_O7I9AZc.jpg', 'shop/themes/images/18_eAtGzD2.jpg', 'shop/themes/images/19_9riTnF4.jpg', 'shop/themes/images/20_1InE3CY.jpg', 1, 1, 'Women Black Printed Hooded Sweatshirt'),
(6, 'Belle Fille', 639, 'Navy blue sweatshirt, has an attached hood, long raglan sleeves, a zip closure on the front, two zip pockets', 'shop/themes/images/21_D2tPUHi.jpg', 13, 15, 15, 15, 14, 15, 'shop/themes/images/21_i9poaAe.jpg', 'shop/themes/images/22_O9bj6Le.jpg', 'shop/themes/images/23_p7FwYJt.jpg', 'shop/themes/images/24_RNe8oCa.jpg', 1, 1, 'Navy Hooded Sweatshirt'),
(7, 'DressBerry', 849, 'Blue, off-white and black colourblocked front-open sweatshirt, has a hood, two pockets, long sleeves, zip closure, straight hem', 'shop/themes/images/25_bBePuzv.jpg', 8, 14, 16, 14, 16, 16, 'shop/themes/images/25_JJEJolH.jpg', 'shop/themes/images/26_y710w3v.jpg', 'shop/themes/images/27_4f9Qape.jpg', 'shop/themes/images/28_uLO2zER.jpg', 1, 1, 'Women Blue & Off-White Colourblocked Hooded Front-Open Sweatshirt');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
