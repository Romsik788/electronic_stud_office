-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 14 2021 г., 20:22
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `electronic_student_office`
--

-- --------------------------------------------------------

--
-- Структура таблицы `appraisals`
--

CREATE TABLE `appraisals` (
  `id` bigint UNSIGNED NOT NULL,
  `description` varchar(100) NOT NULL,
  `appraisal` int NOT NULL,
  `date` date NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `appraisals`
--

INSERT INTO `appraisals` (`id`, `description`, `appraisal`, `date`, `subject_id`) VALUES
(1, 'Лабораторна робота №1', 100, '2021-10-12', 1),
(2, 'Лабораторна робота №2', 90, '2021-10-19', 1),
(3, 'Лабораторна робота №3', 95, '2021-10-11', 2),
(4, 'Тест №3', 98, '2021-10-18', 2),
(5, 'Лабораторна робота №5', 90, '2021-10-26', 2),
(6, 'Лабораторна робота №6', 98, '2021-10-28', 2),
(7, 'Лабораторна робота №7', 85, '2021-10-06', 3),
(8, 'Тест №1', 98, '2021-10-04', 4),
(9, 'Лабораторна робота №1', 100, '2021-10-19', 4),
(10, 'Тест №2', 98, '2021-10-28', 4),
(11, 'Лабораторна робота №2', 83, '2021-10-20', 5),
(12, 'Тест №3', 95, '2021-10-22', 5),
(13, 'Тест №4', 95, '2021-10-04', 6),
(14, 'Лабораторна робота №3', 90, '2021-10-05', 7),
(15, 'Лабораторна робота №4', 95, '2021-10-12', 7),
(16, 'Лабораторна робота №3', 98, '2021-10-19', 7),
(17, 'Тест №1', 85, '2021-10-06', 8),
(18, 'Лабораторна робота №3', 95, '2021-10-13', 8),
(19, 'Лабораторна робота №4', 75, '2021-09-27', 9),
(20, 'Лабораторна робота №1', 84, '2021-09-30', 9),
(21, 'Тетс №2', 98, '2021-10-01', 9),
(22, 'Тест №1', 95, '2021-10-07', 9),
(23, 'Тест №2', 95, '2021-10-06', 10),
(24, 'Лабораторна робота №2', 83, '2021-10-13', 10),
(25, 'Лабораторна робота №3', 98, '2021-10-26', 12),
(26, 'Лабораторна робота №4', 67, '2021-10-28', 13),
(27, 'Тест №2', 86, '2021-10-15', 13),
(28, 'Тест №2', 90, '2021-10-21', 13),
(29, 'Лабораторна робота №1', 100, '2021-10-29', 14);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `auth_permission`
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
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'bcrypt$$2b$12$pPfDeqN/NAkjFdI1G0krzu73UKxPZQJ.wyItSK.hKB3K2Ns2z2kAK', '2021-11-12 13:24:07.237982', 1, 'admin', '', '', 'romamalenko241@gmail.com', 1, 1, '2021-11-11 08:21:19.512167'),
(5, 'bcrypt$$2b$12$fYEZ1iZ7EJp2sf41p2IIvuAMkR/RuUyRpjsYjESNTMoijV50kH7Jm', '2021-11-13 14:36:44.552675', 0, 'Romsik788', '', '', 'a_nasa@ukr.net', 0, 1, '2021-11-13 14:36:42.278538');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-11-11 11:01:51.506850', '2', 'Romsik788', 1, '[{\"added\": {}}]', 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'main', 'group'),
(7, 'main', 'student'),
(9, 'main', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-11-11 08:19:41.638440'),
(2, 'auth', '0001_initial', '2021-11-11 08:19:55.340311'),
(3, 'admin', '0001_initial', '2021-11-11 08:19:57.082164'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-11-11 08:19:57.144127'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-11-11 08:19:57.173107'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-11-11 08:19:58.631280'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-11-11 08:19:59.286284'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-11-11 08:19:59.394265'),
(9, 'auth', '0004_alter_user_username_opts', '2021-11-11 08:19:59.424275'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-11-11 08:20:00.440314'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-11-11 08:20:00.459302'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-11-11 08:20:00.494329'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-11-11 08:20:02.179243'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-11-11 08:20:03.872214'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-11-11 08:20:04.360911'),
(16, 'auth', '0011_update_proxy_permissions', '2021-11-11 08:20:04.451856'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-11-11 08:20:06.308160'),
(18, 'sessions', '0001_initial', '2021-11-11 08:20:06.891205');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0dcajshapdjlpe95ijx8b1j521h9p4q8', '.eJxVjMEOwiAQRP-FsyHIQls8evcbyC67SNXQpLQn47_bJj1oMqd5b-atIq5LiWuTOY6sLsqr029HmJ5Sd8APrPdJp6ku80h6V_RBm75NLK_r4f4dFGxlW-fe--ATiGHqw9lgBnESEnomkx2RBTCBE1k00KHv8hbJg4NBrACrzxf6xziU:1mlu96:3SaRMICIuzfHRLImWW_KbAmLnh1iNdMJqaGtHAwurhg', '2021-11-27 14:36:44.586421'),
('aim4ghkve11yprf3qk4jaav6fzrqypqs', '.eJxVjMsOwiAQRf-FtSE8BhCX7vsNZIBBqgaS0q6M_65NutDtPefcFwu4rTVsg5YwZ3Zhip1-t4jpQW0H-Y7t1nnqbV3myHeFH3TwqWd6Xg_376DiqN_agRdnoZCK18IYDxSxkPOE2trsLWijHFkBJibnNEjUWKCQJ12kBMveH8u2N1c:1mlBLI:NB1WTw9DIFl9tzFqjFVkrPhOAZf1wvNd-AW1wIlVQ5s', '2021-11-25 14:46:20.471243');

-- --------------------------------------------------------

--
-- Структура таблицы `facultys`
--

CREATE TABLE `facultys` (
  `id` bigint UNSIGNED NOT NULL,
  `faculty_name` varchar(100) NOT NULL,
  `groups_count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `facultys`
--

INSERT INTO `facultys` (`id`, `faculty_name`, `groups_count`) VALUES
(1, 'ННІ ЕІТ', 2),
(2, 'ННІ МІТТ', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `student_count` int NOT NULL,
  `id_faculty` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `student_count`, `id_faculty`) VALUES
(1, 'KI-202', 3, 1),
(2, 'КI-201', 3, 1),
(3, 'АТ-211', 2, 2),
(4, 'АТ-201', 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'Admin', NULL),
(2, 'Teacher', NULL),
(3, 'Student', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles_users`
--

CREATE TABLE `roles_users` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES
(1, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `id` bigint UNSIGNED NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `course` int NOT NULL,
  `budget` tinyint(1) NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `identification_code` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`id`, `student_name`, `course`, `budget`, `group_id`, `user_id`, `phone`, `identification_code`) VALUES
(1, 'Маленко. Р.А.', 2, 1, 1, 5, '+380951344662', 31478056),
(2, 'Піпкун М.О.', 2, 1, 1, NULL, '+380934010519', 78943245),
(3, 'Удовенко Є. О.', 2, 1, 1, NULL, '+380142344534', 23498577),
(4, 'Васильчук М. А.', 2, 0, 2, NULL, '+380256245234', 87123457),
(5, 'Гнатюк Ю. П.', 2, 0, 2, NULL, '+380645645362', 34897690),
(6, 'Василенко М. В.', 3, 1, 3, NULL, '+380123543455', 23489756),
(7, 'Полегешко А. В.', 1, 1, 3, NULL, '+380345245344', 14782334),
(8, 'Лисенко К. А.', 2, 0, 4, NULL, '+380123454512', 98123645),
(9, 'Шевчук А. Є.', 2, 0, 4, NULL, '+380423412342', 12347895);

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `id` bigint UNSIGNED NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `apprailsals_count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`id`, `subject_name`, `student_id`, `apprailsals_count`) VALUES
(1, 'Організація баз даних', 1, 2),
(2, 'ООП', 1, 4),
(3, 'КЛ та ОС', 2, 1),
(4, 'Системне програмування', 3, 3),
(5, 'СОКІ', 3, 2),
(6, 'Метрологія КІ', 4, 1),
(7, 'Фізичне виховання', 5, 3),
(8, 'Історія укр. культури', 5, 2),
(9, 'Фізика', 6, 4),
(10, 'Історія України', 6, 2),
(11, 'Вища математика', 7, 0),
(12, 'Основи проектування', 8, 1),
(13, 'Технології машинобудування', 9, 3),
(14, 'Метрологія АТ', 9, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `faculty_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `teacher_subject`
--

CREATE TABLE `teacher_subject` (
  `teacher_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `login` varchar(64) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `email`, `phone`, `password`, `login`, `last_login`) VALUES
(1, '123@gmail.com', '+380951344662', '$2b$10$YVzoIWWLJ2U5BSMM3nxc7ur4PWF6AvRZ8b5f2EwWuEBbI.NWiRLZK', '123', '2021-11-11 10:27:53.067882'),
(2, 'foo@gmail.com', '+380731848044', '$2b$10$Ac/rCoEueR4xzvc1Bt.wmOB7ELy33hCW2NhBC9eE/0gW8qS53RZbG', 'olya_nazarenko', NULL),
(3, '784@gmail.com', '', '784', '784', NULL),
(4, 'foo@gmail.com', '+380671635354', '$2b$10$YVzoIWWLJ2U5BSMM3nxc7ur4PWF6AvRZ8b5f2EwWuEBbI.NWiRLZK', 'ghfh', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `appraisals`
--
ALTER TABLE `appraisals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индексы таблицы `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индексы таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индексы таблицы `facultys`
--
ALTER TABLE `facultys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_faculty` (`id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_faculty` (`id_faculty`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `roles_users`
--
ALTER TABLE `roles_users`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`) USING BTREE;

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `student_ibfk_1` (`group_id`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_faculty` (`faculty_id`);

--
-- Индексы таблицы `teacher_subject`
--
ALTER TABLE `teacher_subject`
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `appraisals`
--
ALTER TABLE `appraisals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `facultys`
--
ALTER TABLE `facultys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `appraisals`
--
ALTER TABLE `appraisals`
  ADD CONSTRAINT `appraisals_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`id_faculty`) REFERENCES `facultys` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `roles_users` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_users_gdfgdf` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `facultys` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `teacher_subject`
--
ALTER TABLE `teacher_subject`
  ADD CONSTRAINT `teacher_subject_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `teacher_subject_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
