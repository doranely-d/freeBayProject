-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2022 a las 05:20:15
-- Versión del servidor: 10.5.12-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u314659280_freebay`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apirest_role`
--

CREATE TABLE `apirest_role` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `modified_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `apirest_role`
--

INSERT INTO `apirest_role` (`id`, `name`, `created_at`, `modified_at`) VALUES
(1, 'ROL_VENDEDOR', '2022-03-22', '2022-03-22'),
(2, 'ROL_COMPORADOR', '2022-03-22', '2022-03-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apirest_user`
--

CREATE TABLE `apirest_user` (
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` int(11) NOT NULL,
  `first_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` date DEFAULT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date DEFAULT NULL,
  `modified_at` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `apirest_user`
--

INSERT INTO `apirest_user` (`last_login`, `is_superuser`, `username`, `is_staff`, `date_joined`, `id`, `first_name`, `last_name`, `email`, `age`, `password`, `gender`, `created_at`, `modified_at`, `is_active`, `role_id`) VALUES
('2022-03-24 17:48:07.320621', 1, 'adminfreebay', 1, '2022-03-23 00:44:18.386457', 1, 'admin', 'admin', 'adminfreebay@gmail.com', '2022-03-15', 'pbkdf2_sha256$320000$HsspMFM5VpMOwIlbWygoSZ$QYMPoB360r/Ae8vIb8GhH25FF6NezYfB80OafHrmeYk=', '', '2022-03-22', '2022-03-22', 1, 1),
(NULL, 0, 'usercomprador1', 0, '2022-03-24 17:53:25.000000', 2, 'Comprador', 'Vega', 'usercomprador1@gmail.com', NULL, 'pbkdf2_sha256$320000$Ylmcec8cihTASj6eNqypSQ$U3S79ZneMM4FM4T+kfGLrxrlKAJQu39DDOgecu2x6wM=', 'Hombre', '2022-03-24', NULL, 1, 2),
(NULL, 0, 'uservendedor1', 0, '2022-03-24 17:53:25.000000', 3, 'uservendedor1', 'uservendedor1', 'uservendedor1@gmail.com', NULL, 'Userdfsdor11526*/', 'Mujer', '2022-03-24', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apirest_user_groups`
--

CREATE TABLE `apirest_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apirest_user_user_permissions`
--

CREATE TABLE `apirest_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `auth_permission`
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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add Token', 6, 'add_token'),
(22, 'Can change Token', 6, 'change_token'),
(23, 'Can delete Token', 6, 'delete_token'),
(24, 'Can view Token', 6, 'view_token'),
(25, 'Can add token', 7, 'add_tokenproxy'),
(26, 'Can change token', 7, 'change_tokenproxy'),
(27, 'Can delete token', 7, 'delete_tokenproxy'),
(28, 'Can view token', 7, 'view_tokenproxy'),
(29, 'Can add role', 8, 'add_role'),
(30, 'Can change role', 8, 'change_role'),
(31, 'Can delete role', 8, 'delete_role'),
(32, 'Can view role', 8, 'view_role'),
(33, 'Can add user', 9, 'add_user'),
(34, 'Can change user', 9, 'change_user'),
(35, 'Can delete user', 9, 'delete_user'),
(36, 'Can view user', 9, 'view_user'),
(37, 'Can add cart', 10, 'add_cart'),
(38, 'Can change cart', 10, 'change_cart'),
(39, 'Can delete cart', 10, 'delete_cart'),
(40, 'Can view cart', 10, 'view_cart'),
(41, 'Can add product', 11, 'add_product'),
(42, 'Can change product', 11, 'change_product'),
(43, 'Can delete product', 11, 'delete_product'),
(44, 'Can view product', 11, 'view_product'),
(45, 'Can add cart item', 12, 'add_cartitem'),
(46, 'Can change cart item', 12, 'change_cartitem'),
(47, 'Can delete cart item', 12, 'delete_cartitem'),
(48, 'Can view cart item', 12, 'view_cartitem'),
(49, 'Can add order detail', 13, 'add_orderdetail'),
(50, 'Can change order detail', 13, 'change_orderdetail'),
(51, 'Can delete order detail', 13, 'delete_orderdetail'),
(52, 'Can view order detail', 13, 'view_orderdetail'),
(53, 'Can add order', 14, 'add_order'),
(54, 'Can change order', 14, 'change_order'),
(55, 'Can delete order', 14, 'delete_order'),
(56, 'Can view order', 14, 'view_order');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_cart`
--

CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL,
  `total` double NOT NULL,
  `total_qty` int(10) UNSIGNED NOT NULL CHECK (`total_qty` >= 0),
  `created_at` date NOT NULL,
  `modified_at` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cart_cart`
--

INSERT INTO `cart_cart` (`id`, `total`, `total_qty`, `created_at`, `modified_at`, `user_id`) VALUES
(1, 1000, 5, '2022-03-22', '2022-03-22', 1),
(2, 500, 5, '2022-03-24', '2022-03-22', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_cartitem`
--

CREATE TABLE `cart_cartitem` (
  `id` bigint(20) NOT NULL,
  `qty` int(10) UNSIGNED DEFAULT NULL CHECK (`qty` >= 0),
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_order`
--

CREATE TABLE `cart_order` (
  `id` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `total_qty` int(10) UNSIGNED DEFAULT NULL,
  `created_at` date NOT NULL,
  `modified_at` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cart_order`
--

INSERT INTO `cart_order` (`id`, `total`, `total_qty`, `created_at`, `modified_at`, `user_id`) VALUES
(1, 500, 5, '2022-03-22', '2022-03-22', 1),
(2, 52245, 10, '2022-03-24', NULL, 1),
(3, 566, 12, '2022-03-24', NULL, 1),
(4, 555, 57, '2022-03-24', NULL, 1),
(5, 154224, 25, '2022-03-24', NULL, 1),
(9, NULL, NULL, '2022-03-24', NULL, NULL),
(11, NULL, NULL, '2022-03-24', NULL, NULL),
(12, NULL, NULL, '2022-03-24', NULL, NULL),
(13, NULL, NULL, '2022-03-24', NULL, NULL),
(14, NULL, NULL, '2022-03-24', NULL, NULL),
(15, NULL, NULL, '2022-03-24', NULL, NULL),
(16, NULL, NULL, '2022-03-24', NULL, NULL),
(17, NULL, NULL, '2022-03-24', NULL, NULL),
(18, NULL, NULL, '2022-03-24', NULL, NULL),
(19, NULL, NULL, '2022-03-24', NULL, NULL),
(20, NULL, NULL, '2022-03-24', NULL, NULL),
(21, NULL, NULL, '2022-03-24', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_orderdetail`
--

CREATE TABLE `cart_orderdetail` (
  `id` bigint(20) NOT NULL,
  `qty` int(10) UNSIGNED DEFAULT NULL CHECK (`qty` >= 0),
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_product`
--

CREATE TABLE `cart_product` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL CHECK (`qty` >= 0),
  `url_image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `modified_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cart_product`
--

INSERT INTO `cart_product` (`id`, `name`, `price`, `qty`, `url_image`, `created_at`, `modified_at`) VALUES
(2, 'Pantalla Smart TV 40\" Sansui Mod SMX40P28NF Android', 6019, 25, 'pantallas40.webp', '2022-03-22', '2022-03-22'),
(3, 'Pantalla Sansui 32 Pulgadas SmartTV', 15000, 30, 'pantalla32.webp', '2022-03-22', '2022-03-22'),
(4, 'Panasonic Audífonos RP-HF300E-P, Alámbrico, 3.5mm, Rosa/Blanco', 599, 40, 'audifonosp.webp', '2022-03-22', '2022-03-22'),
(5, 'AUDIFONOS IN EAR DISEÑO SPORT AJUSTABLE COLOR VIOLETA RP-HS34PP-V', 399, 40, 'audifonoslila.webp', '2022-03-22', '2022-03-22'),
(6, 'Pantalla 40\" Hisense LED 4052H3D FULL HD', 25412, 110, 'pantalla40.webp', '2022-03-22', '2022-03-22'),
(7, 'Pantalla Smart TV 70\" Sansui Mod SMX40P28NF Android', 6019, 25, 'pantallas40.webp', '2022-03-22', '2022-03-22'),
(8, 'Pantalla Sansung 50 Pulgadas SmartTV', 15000, 30, 'pantalla32.webp', '2022-03-22', '2022-03-22'),
(9, 'Panasonic Audífonos RP-HF300E-P, Alámbrico, 3.5mm, Rosa/Blanco', 599, 40, 'audifonosp.webp', '2022-03-22', '2022-03-22'),
(10, 'AUDIFONOS IN EAR DISEÑO SPORT AJUSTABLE COLOR VIOLETA RP-HS34PP-V', 399, 40, 'audifonoslila.webp', '2022-03-22', '2022-03-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-03-24 17:53:26.072119', '2', 'usercomprador1', 1, '[{\"added\": {}}]', 9, 1),
(2, '2022-03-24 17:54:11.269028', '2', 'usercomprador1', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email\"]}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'apirest', 'role'),
(9, 'apirest', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(6, 'authtoken', 'token'),
(7, 'authtoken', 'tokenproxy'),
(10, 'cart', 'cart'),
(12, 'cart', 'cartitem'),
(14, 'cart', 'order'),
(13, 'cart', 'orderdetail'),
(11, 'cart', 'product'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-03-24 16:09:14.111731'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-03-24 16:09:16.159215'),
(3, 'auth', '0001_initial', '2022-03-24 16:09:20.124255'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-03-24 16:09:20.967269'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-03-24 16:09:21.498394'),
(6, 'auth', '0004_alter_user_username_opts', '2022-03-24 16:09:22.051521'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-03-24 16:09:22.594455'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-03-24 16:09:23.129555'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-03-24 16:09:23.776376'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-03-24 16:09:24.416832'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-03-24 16:09:24.953965'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-03-24 16:09:25.852131'),
(13, 'auth', '0011_update_proxy_permissions', '2022-03-24 16:09:27.217445'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-03-24 16:09:27.767844'),
(15, 'apirest', '0001_initial', '2022-03-24 16:09:32.731127'),
(16, 'admin', '0001_initial', '2022-03-24 16:09:34.639707'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-03-24 16:09:35.177171'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-24 16:09:35.723922'),
(19, 'authtoken', '0001_initial', '2022-03-24 16:09:36.886535'),
(20, 'authtoken', '0002_auto_20160226_1747', '2022-03-24 16:09:37.443804'),
(21, 'authtoken', '0003_tokenproxy', '2022-03-24 16:09:37.969392'),
(22, 'cart', '0001_initial', '2022-03-24 16:09:41.095914'),
(23, 'sessions', '0001_initial', '2022-03-24 16:09:42.443118'),
(24, 'cart', '0002_order_orderdetail', '2022-03-24 16:45:09.255180'),
(25, 'cart', '0003_alter_order_total', '2022-03-24 16:51:16.037672'),
(26, 'cart', '0004_alter_order_modified_at_alter_order_total_qty', '2022-03-24 16:52:22.106543'),
(27, 'apirest', '0002_alter_user_age', '2022-03-24 17:52:02.246684'),
(28, 'apirest', '0003_alter_user_modified_at', '2022-03-24 17:53:03.247693'),
(29, 'cart', '0005_alter_cartitem_cart_alter_cartitem_product', '2022-03-24 20:59:08.589451'),
(30, 'cart', '0005_alter_order_user', '2022-03-25 04:30:30.929070');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apirest_role`
--
ALTER TABLE `apirest_role`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `apirest_user`
--
ALTER TABLE `apirest_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password` (`password`),
  ADD KEY `apirest_user_role_id_ec295729_fk_apirest_role_id` (`role_id`);

--
-- Indices de la tabla `apirest_user_groups`
--
ALTER TABLE `apirest_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apirest_user_groups_user_id_group_id_4aaaaf94_uniq` (`user_id`,`group_id`),
  ADD KEY `apirest_user_groups_group_id_fc814977_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `apirest_user_user_permissions`
--
ALTER TABLE `apirest_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apirest_user_user_permis_user_id_permission_id_a243043d_uniq` (`user_id`,`permission_id`),
  ADD KEY `apirest_user_user_pe_permission_id_bfb6eefb_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_cart_user_id_9b4220b9_fk_apirest_user_id` (`user_id`);

--
-- Indices de la tabla `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` (`cart_id`),
  ADD KEY `cart_cartitem_product_id_b24e265a_fk_cart_product_id` (`product_id`);

--
-- Indices de la tabla `cart_order`
--
ALTER TABLE `cart_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_order_user_id_279b5d53_fk_apirest_user_id` (`user_id`);

--
-- Indices de la tabla `cart_orderdetail`
--
ALTER TABLE `cart_orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_orderdetail_order_id_de39f513_fk_cart_order_id` (`order_id`),
  ADD KEY `cart_orderdetail_product_id_8719498a_fk_cart_product_id` (`product_id`);

--
-- Indices de la tabla `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_apirest_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apirest_role`
--
ALTER TABLE `apirest_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `apirest_user`
--
ALTER TABLE `apirest_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `apirest_user_groups`
--
ALTER TABLE `apirest_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apirest_user_user_permissions`
--
ALTER TABLE `apirest_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `cart_cart`
--
ALTER TABLE `cart_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `cart_order`
--
ALTER TABLE `cart_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `cart_orderdetail`
--
ALTER TABLE `cart_orderdetail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apirest_user`
--
ALTER TABLE `apirest_user`
  ADD CONSTRAINT `apirest_user_role_id_ec295729_fk_apirest_role_id` FOREIGN KEY (`role_id`) REFERENCES `apirest_role` (`id`);

--
-- Filtros para la tabla `apirest_user_groups`
--
ALTER TABLE `apirest_user_groups`
  ADD CONSTRAINT `apirest_user_groups_group_id_fc814977_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `apirest_user_groups_user_id_433efb99_fk_apirest_user_id` FOREIGN KEY (`user_id`) REFERENCES `apirest_user` (`id`);

--
-- Filtros para la tabla `apirest_user_user_permissions`
--
ALTER TABLE `apirest_user_user_permissions`
  ADD CONSTRAINT `apirest_user_user_pe_permission_id_bfb6eefb_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `apirest_user_user_pe_user_id_49e0cf9d_fk_apirest_u` FOREIGN KEY (`user_id`) REFERENCES `apirest_user` (`id`);

--
-- Filtros para la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_apirest_user_id` FOREIGN KEY (`user_id`) REFERENCES `apirest_user` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD CONSTRAINT `cart_cart_user_id_9b4220b9_fk_apirest_user_id` FOREIGN KEY (`user_id`) REFERENCES `apirest_user` (`id`);

--
-- Filtros para la tabla `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  ADD CONSTRAINT `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`),
  ADD CONSTRAINT `cart_cartitem_product_id_b24e265a_fk_cart_product_id` FOREIGN KEY (`product_id`) REFERENCES `cart_product` (`id`);

--
-- Filtros para la tabla `cart_order`
--
ALTER TABLE `cart_order`
  ADD CONSTRAINT `cart_order_user_id_279b5d53_fk_apirest_user_id` FOREIGN KEY (`user_id`) REFERENCES `apirest_user` (`id`);

--
-- Filtros para la tabla `cart_orderdetail`
--
ALTER TABLE `cart_orderdetail`
  ADD CONSTRAINT `cart_orderdetail_order_id_de39f513_fk_cart_order_id` FOREIGN KEY (`order_id`) REFERENCES `cart_order` (`id`),
  ADD CONSTRAINT `cart_orderdetail_product_id_8719498a_fk_cart_product_id` FOREIGN KEY (`product_id`) REFERENCES `cart_product` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_apirest_user_id` FOREIGN KEY (`user_id`) REFERENCES `apirest_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
