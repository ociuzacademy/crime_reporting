-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2022 at 11:20 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_crime`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(25, 'Can add tbl_ user', 7, 'add_tbl_user'),
(26, 'Can change tbl_ user', 7, 'change_tbl_user'),
(27, 'Can delete tbl_ user', 7, 'delete_tbl_user'),
(28, 'Can view tbl_ user', 7, 'view_tbl_user'),
(29, 'Can add tbl_ police', 8, 'add_tbl_police'),
(30, 'Can change tbl_ police', 8, 'change_tbl_police'),
(31, 'Can delete tbl_ police', 8, 'delete_tbl_police'),
(32, 'Can view tbl_ police', 8, 'view_tbl_police'),
(33, 'Can add tbl_ catagory', 9, 'add_tbl_catagory'),
(34, 'Can change tbl_ catagory', 9, 'change_tbl_catagory'),
(35, 'Can delete tbl_ catagory', 9, 'delete_tbl_catagory'),
(36, 'Can view tbl_ catagory', 9, 'view_tbl_catagory'),
(37, 'Can add tbl_ lawyer', 10, 'add_tbl_lawyer'),
(38, 'Can change tbl_ lawyer', 10, 'change_tbl_lawyer'),
(39, 'Can delete tbl_ lawyer', 10, 'delete_tbl_lawyer'),
(40, 'Can view tbl_ lawyer', 10, 'view_tbl_lawyer'),
(41, 'Can add tbl_ complaint', 11, 'add_tbl_complaint'),
(42, 'Can change tbl_ complaint', 11, 'change_tbl_complaint'),
(43, 'Can delete tbl_ complaint', 11, 'delete_tbl_complaint'),
(44, 'Can view tbl_ complaint', 11, 'view_tbl_complaint'),
(45, 'Can add tbl_ booking', 12, 'add_tbl_booking'),
(46, 'Can change tbl_ booking', 12, 'change_tbl_booking'),
(47, 'Can delete tbl_ booking', 12, 'delete_tbl_booking'),
(48, 'Can view tbl_ booking', 12, 'view_tbl_booking'),
(49, 'Can add tbl_ feedback', 13, 'add_tbl_feedback'),
(50, 'Can change tbl_ feedback', 13, 'change_tbl_feedback'),
(51, 'Can delete tbl_ feedback', 13, 'delete_tbl_feedback'),
(52, 'Can view tbl_ feedback', 13, 'view_tbl_feedback'),
(53, 'Can add tbl_fir', 14, 'add_tbl_fir'),
(54, 'Can change tbl_fir', 14, 'change_tbl_fir'),
(55, 'Can delete tbl_fir', 14, 'delete_tbl_fir'),
(56, 'Can view tbl_fir', 14, 'view_tbl_fir');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crimeapp_tbl_booking`
--

CREATE TABLE `crimeapp_tbl_booking` (
  `id` bigint(20) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `link` varchar(300) NOT NULL,
  `lawyer_id_id` bigint(20) DEFAULT NULL,
  `user_id_id` bigint(20) DEFAULT NULL,
  `apply_date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crimeapp_tbl_booking`
--

INSERT INTO `crimeapp_tbl_booking` (`id`, `date`, `time`, `status`, `link`, `lawyer_id_id`, `user_id_id`, `apply_date`) VALUES
(1, '2021-12-15', '11.00AM-12.00PM', 'Approved', 'https://meet.google.com/jvp-ozuy-nnm', 2, 5, '2021-12-10'),
(2, '2021-12-17', '10.00AM-11.00AM', 'Approved', 'https://meet.google.com/jvp-ozuy-nnm?pli=1', 2, 5, '2021-12-10'),
(3, '2021-12-15', '1.00PM-2.00PM', 'Rejected', '', 2, 5, '2021-12-11'),
(4, '2021-12-17', '9.00AM-10.00AM', 'Requested', '', 2, 5, '2021-12-11'),
(5, '2021-12-15', '9.00AM-10.00AM', 'Requested', '', 1, 5, '2021-12-14'),
(7, '2022-01-13', '11.00AM-12.00PM', 'Requested', '', 2, 5, '2022-01-05'),
(8, '2022-04-08', '9.00AM-10.00AM', 'Requested', '', 2, 5, '2022-04-05');

-- --------------------------------------------------------

--
-- Table structure for table `crimeapp_tbl_catagory`
--

CREATE TABLE `crimeapp_tbl_catagory` (
  `id` bigint(20) NOT NULL,
  `Cat_Name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crimeapp_tbl_complaint`
--

CREATE TABLE `crimeapp_tbl_complaint` (
  `id` bigint(20) NOT NULL,
  `police_station_name` varchar(300) NOT NULL,
  `petitioner_name` varchar(300) NOT NULL,
  `petitioner_id` varchar(300) NOT NULL,
  `petitioner_id_no` varchar(300) NOT NULL,
  `petitioner_phone` varchar(300) NOT NULL,
  `petitioner_email` varchar(300) NOT NULL,
  `petitioner_address` varchar(300) NOT NULL,
  `date_of_issue` varchar(300) NOT NULL,
  `subject` varchar(300) NOT NULL,
  `description` varchar(300) NOT NULL,
  `pic_complaint` varchar(100) NOT NULL,
  `police_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL,
  `petitioner_district` varchar(300) NOT NULL,
  `petitioner_pin` varchar(300) NOT NULL,
  `petitioner_state` varchar(300) NOT NULL,
  `status` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crimeapp_tbl_complaint`
--

INSERT INTO `crimeapp_tbl_complaint` (`id`, `police_station_name`, `petitioner_name`, `petitioner_id`, `petitioner_id_no`, `petitioner_phone`, `petitioner_email`, `petitioner_address`, `date_of_issue`, `subject`, `description`, `pic_complaint`, `police_id_id`, `user_id_id`, `petitioner_district`, `petitioner_pin`, `petitioner_state`, `status`) VALUES
(1, 'VADANAPPALLY POLICE STATION', 'amal', 'Adhar Card', '122454587877', '9847704855', 'amal@gmail.com', 'Njattuvettty House', '2021-12-10', ' Regarding harassment of street dogs', 'fdsfsdf gf frg gr rteg', 'complaint/download.jpg', 3, 5, '', '', '', 'Report Submitted'),
(2, 'VADANAPPALLY POLICE STATION', 'amitha', 'Adhar Card', '122454587877', '9847704855', 'ammitha@gmail.com', 'Njattuvettty House', '2021-12-10', 'hello ', 'sedferf tr et r', 'complaint/5_eYXp29l.jpg', 3, 5, 'Thrissur', '', 'kerala', 'Investigation Finished'),
(3, 'VADANAPPALLY POLICE STATION', 'liyat', 'Pan Card', '122454587877', '7555555555', 'liyat@gmail.com', 'Njattuvettty House', '2021-12-11', 'salary cut', 'i \'m curently working in a  software firm as software developer. They deduct my salary withour any reason.', 'complaint/corona.jpg', 3, 5, 'Thrissur', '', 'kerala', 'Report Submitted'),
(4, 'VADANAPPALLY POLICE STATION', 'gfhhdf', 'Pan Card', 'hhfdhd', '6666666666', 'amal@gmail.com', 'ggdhf', '2021-12-14', 'hfghf', 'tfyhry', 'complaint/aa.jpg', 3, 5, 'hfghfh', '', 'hhfgh', 'Report Submitted');

-- --------------------------------------------------------

--
-- Table structure for table `crimeapp_tbl_feedback`
--

CREATE TABLE `crimeapp_tbl_feedback` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `message` varchar(30) NOT NULL,
  `lawyer_id_id` bigint(20) DEFAULT NULL,
  `police_id_id` bigint(20) DEFAULT NULL,
  `user_id_id` bigint(20) DEFAULT NULL,
  `lawyer_name` varchar(30) NOT NULL,
  `station_name` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crimeapp_tbl_feedback`
--

INSERT INTO `crimeapp_tbl_feedback` (`id`, `name`, `email`, `message`, `lawyer_id_id`, `police_id_id`, `user_id_id`, `lawyer_name`, `station_name`, `user_name`) VALUES
(2, 'binitha', 'binitha@gmail.com', 'cgdfgf fgd ghdf hfd', 2, NULL, 5, 'Anwar', '', ''),
(15, 'jkhj', 'geetha@gmail.com', 'jjhj', NULL, NULL, NULL, '', '', ''),
(16, 'binitha', 'binitha@gmail.com', 'jkjkjkjk', NULL, 3, 5, '', 'VADANAPPALLY POLICE STATION', ''),
(17, 'binitha', 'binitha@gmail.com', 'jkjkjkjk', 2, NULL, 5, 'Anwar', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `crimeapp_tbl_fir`
--

CREATE TABLE `crimeapp_tbl_fir` (
  `id` bigint(20) NOT NULL,
  `fir_number` varchar(30) NOT NULL,
  `fir_off_name` varchar(30) NOT NULL,
  `fir_date` varchar(30) NOT NULL,
  `fir_evidence` varchar(300) NOT NULL,
  `fir_findings` varchar(300) NOT NULL,
  `fir_pic` varchar(100) NOT NULL,
  `complaint_id_id` bigint(20) DEFAULT NULL,
  `police_id_id` bigint(20) DEFAULT NULL,
  `user_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crimeapp_tbl_fir`
--

INSERT INTO `crimeapp_tbl_fir` (`id`, `fir_number`, `fir_off_name`, `fir_date`, `fir_evidence`, `fir_findings`, `fir_pic`, `complaint_id_id`, `police_id_id`, `user_id_id`) VALUES
(1, '121fdssf', 'girish', '2021-12-16', 'f d gg d', ' g dg', 'FIR/5.jpg', 3, 3, 5),
(2, 'dfcghfdhf', 'ghfghfh', '2021-12-09', 'vgfdg dfgdg dg', 'dg dgd g', 'FIR/5_9YIpShs.jpg', 3, 3, 5),
(3, 'hfytry', 'ryyryr', '2021-12-25', 'ytyr', 'ytyr', 'FIR/about.jpg', 1, 3, 5),
(5, '5758', 'girish', '2022-01-12', 'gfftfgggh', 'ghghgg', 'FIR/bbb.drawio_1_1.png', 4, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `crimeapp_tbl_lawyer`
--

CREATE TABLE `crimeapp_tbl_lawyer` (
  `id` bigint(20) NOT NULL,
  `Lw_Fname` varchar(300) NOT NULL,
  `Lw_Lname` varchar(300) NOT NULL,
  `Lw_Image` varchar(100) NOT NULL,
  `Lw_Phone` varchar(300) NOT NULL,
  `Lw_Pin` varchar(300) NOT NULL,
  `Lw_Email` varchar(300) NOT NULL,
  `Lw_Pswd` varchar(300) NOT NULL,
  `Lw_Address` varchar(300) NOT NULL,
  `Lw_State` varchar(300) NOT NULL,
  `Lw_District` varchar(300) NOT NULL,
  `Lw_Proof` varchar(300) NOT NULL,
  `Lw_ProofNo` varchar(300) NOT NULL,
  `Lw_Status` varchar(300) NOT NULL,
  `Lw_EnrollNo` varchar(300) NOT NULL,
  `Lw_Catgry` varchar(300) NOT NULL,
  `Lw_Fees` varchar(300) NOT NULL,
  `Lw_Time` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crimeapp_tbl_lawyer`
--

INSERT INTO `crimeapp_tbl_lawyer` (`id`, `Lw_Fname`, `Lw_Lname`, `Lw_Image`, `Lw_Phone`, `Lw_Pin`, `Lw_Email`, `Lw_Pswd`, `Lw_Address`, `Lw_State`, `Lw_District`, `Lw_Proof`, `Lw_ProofNo`, `Lw_Status`, `Lw_EnrollNo`, `Lw_Catgry`, `Lw_Fees`, `Lw_Time`) VALUES
(1, 'John', 'vijayakumar', 'lawyer/aa.jpg', '9847070320', '680596', 'admin@gmail.com', '123', 'ambalath', 'Meghalaya', 'West Garo Hills', 'Pan Card', '12546454', 'Rejected', '2175757', '', '', ''),
(2, 'Anwar', 'Rasheed', 'lawyer/John.jpg', '9878887770', '5544', 'anwar@gmail.com', '123', 'Anwar manzil', 'Madya Pradesh', 'Guna', 'Adhar Card', '12546454', 'Approved', '454654', 'Divorce,Civil case', '550', '4.00PM-5.00PM'),
(3, 'loknath', 'shameer', 'lawyer/5.jpg', '2457277578', '680596', 'vindujavij@gmail.com', '123', 'ambalath', 'Chhattisgarh', 'Kondagaon', 'Pan Card', '12546454', 'Approved', '454654', 'ghfghgfhfhf', '3', ''),
(4, 'sona', 'vijayakumar', 'lawyer/download.jpg', '9847070320', '680596', 'vvv@gmail.com', '123', 'kunnumal', 'Manipur', 'Tamenglong', 'Pan Card', '12546454', 'Approved', '454654', '', '800', ''),
(5, 'fdeertre', 'terte', 'lawyer/download_1.jpg', '5555555555', 'terte', 'tata@gmail.com', '123', 'tret', 'Andra Pradesh', 'Anantapur', 'Pan Card', 'retet', 'Rejected', '454654', '', '', ''),
(6, 'hghrthy', 'vijayakumar', 'lawyer/corona.jpg', '9847070320', '680596', 'rvs@gmail.com', '789', 'ambalath', 'Bihar', 'Araria', 'Pan Card', '12546454', 'Rejected', '454654', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `crimeapp_tbl_police`
--

CREATE TABLE `crimeapp_tbl_police` (
  `id` bigint(20) NOT NULL,
  `Plc_Name` varchar(300) NOT NULL,
  `Plc_District` varchar(300) NOT NULL,
  `Plc_State` varchar(300) NOT NULL,
  `Plc_Pin` varchar(300) NOT NULL,
  `Plc_Number` varchar(300) NOT NULL,
  `Plc_Email` varchar(300) NOT NULL,
  `Plc_Password` varchar(300) NOT NULL,
  `Plc_Type` varchar(300) NOT NULL,
  `Plc_Image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crimeapp_tbl_police`
--

INSERT INTO `crimeapp_tbl_police` (`id`, `Plc_Name`, `Plc_District`, `Plc_State`, `Plc_Pin`, `Plc_Number`, `Plc_Email`, `Plc_Password`, `Plc_Type`, `Plc_Image`) VALUES
(3, 'VADANAPPALLY POLICE STATION', 'Thrissur', 'Kerala', '680569', '9847070328', 'vindujavijayakumar@gmail.com', '123', 'Police', '');

-- --------------------------------------------------------

--
-- Table structure for table `crimeapp_tbl_user`
--

CREATE TABLE `crimeapp_tbl_user` (
  `id` bigint(20) NOT NULL,
  `User_Name` varchar(300) NOT NULL,
  `User_Password` varchar(50) NOT NULL,
  `User_Email` varchar(300) NOT NULL,
  `User_Address` varchar(300) NOT NULL,
  `User_District` varchar(20) NOT NULL,
  `User_Phone` varchar(20) NOT NULL,
  `User_Type` varchar(20) NOT NULL,
  `User_PIN` varchar(20) NOT NULL,
  `User_Proof` varchar(20) NOT NULL,
  `User_Proof_Number` varchar(20) NOT NULL,
  `User_State` varchar(20) NOT NULL,
  `User_Image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crimeapp_tbl_user`
--

INSERT INTO `crimeapp_tbl_user` (`id`, `User_Name`, `User_Password`, `User_Email`, `User_Address`, `User_District`, `User_Phone`, `User_Type`, `User_PIN`, `User_Proof`, `User_Proof_Number`, `User_State`, `User_Image`) VALUES
(1, 'Admin ', '123', 'admin@gmail.com', 'Heaven', 'Thrissur', '9847070320', 'Admin', '680569', '', '', '', ''),
(5, 'binitha', '123', 'binitha@gmail.com', 'fdfdoimolimli', 'Guntur', '9988988778', 'User', '680569', 'Pan Card', '121245445', 'Andra Pradesh', 'user/aa_sCaZ3Mx.jpg'),
(6, 'fgdhhfdgh', 'hfhdh', '', 'hfhdh', 'Banka', '8888888888', 'User', 'fhdhdf', 'Select ID Proof', 'hfdhdhd', 'Bihar', 'user/about.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'crimeApp', 'tbl_booking'),
(9, 'crimeApp', 'tbl_catagory'),
(11, 'crimeApp', 'tbl_complaint'),
(13, 'crimeApp', 'tbl_feedback'),
(14, 'crimeApp', 'tbl_fir'),
(10, 'crimeApp', 'tbl_lawyer'),
(8, 'crimeApp', 'tbl_police'),
(7, 'crimeApp', 'tbl_user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-12-03 08:39:35.223584'),
(2, 'auth', '0001_initial', '2021-12-03 08:39:55.930769'),
(3, 'admin', '0001_initial', '2021-12-03 08:39:59.913997'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-12-03 08:39:59.939998'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-12-03 08:39:59.966000'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-12-03 08:40:00.633038'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-12-03 08:40:01.784104'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-12-03 08:40:01.905111'),
(9, 'auth', '0004_alter_user_username_opts', '2021-12-03 08:40:01.962114'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-12-03 08:40:03.353193'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-12-03 08:40:03.546204'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-12-03 08:40:04.756274'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-12-03 08:40:08.135467'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-12-03 08:40:08.865509'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-12-03 08:40:16.335936'),
(16, 'auth', '0011_update_proxy_permissions', '2021-12-03 08:40:16.701957'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-12-03 08:40:17.663012'),
(18, 'sessions', '0001_initial', '2021-12-03 08:40:25.010432'),
(19, 'crimeApp', '0001_initial', '2021-12-03 09:46:19.941641'),
(20, 'crimeApp', '0002_tbl_police', '2021-12-08 07:10:52.497840'),
(21, 'crimeApp', '0003_tbl_catagory', '2021-12-08 08:50:00.002017'),
(22, 'crimeApp', '0004_tbl_lawyer', '2021-12-08 09:51:54.328465'),
(23, 'crimeApp', '0005_auto_20211208_1626', '2021-12-08 10:56:37.492569'),
(24, 'crimeApp', '0006_rename_user_status_tbl_user_user_pin', '2021-12-08 11:00:03.857372'),
(25, 'crimeApp', '0007_tbl_complaint', '2021-12-10 06:19:14.180155'),
(26, 'crimeApp', '0008_auto_20211210_1305', '2021-12-10 07:35:29.376841'),
(27, 'crimeApp', '0009_remove_tbl_complaint_lawyer_id', '2021-12-10 08:31:19.729471'),
(28, 'crimeApp', '0010_auto_20211210_1518', '2021-12-10 09:48:52.692605'),
(29, 'crimeApp', '0011_tbl_booking', '2021-12-10 10:24:39.183377'),
(30, 'crimeApp', '0012_tbl_booking_apply_date', '2021-12-10 10:34:59.412852'),
(31, 'crimeApp', '0013_alter_tbl_booking_link', '2021-12-11 05:30:44.893673'),
(32, 'crimeApp', '0014_tbl_feedback', '2021-12-11 06:23:39.947275'),
(33, 'crimeApp', '0015_auto_20211211_1201', '2021-12-11 06:31:45.652056'),
(34, 'crimeApp', '0016_tbl_complaint_status', '2021-12-11 09:41:10.327078'),
(35, 'crimeApp', '0017_tbl_fir', '2021-12-13 05:07:44.859972'),
(36, 'crimeApp', '0018_auto_20211213_1126', '2021-12-13 05:56:38.830786');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('a8yzjjm2bc4np4yenlnt12bkhtzsrgis', 'e30:1n51NB:8GogRgrcwMAx8d7oH9q3cxHQrW5Ds204chmyHmsgK7A', '2022-01-19 08:10:17.781676'),
('ge9blc869e6zerlw6n4xarosxa4rtlh6', 'eyJpZCI6MX0:1mx648:9cTSLhfBi3sNrP8VukKUUIIt04CPOeGiv3f3_gt2tys', '2021-12-28 11:33:52.020187'),
('je2ghv52k0vult6c2qkk7rzqvbxqan0b', 'e30:1mt6cT:SR8uwS4mEvKmctnHZDmTYo8546B1rMqQbgXY3BgkbnY', '2021-12-17 11:20:49.286909'),
('jjke1j6tnoeb91etdgndk61m5avex3d6', 'e30:1mxR1h:pldphw69o8d0UlEqAm2qHcsygKsQRCNYLDrS9f15s6k', '2021-12-29 09:56:45.922386'),
('l271uq59amfkujj3a7mxur2khv9dc89z', 'e30:1nbfKQ:TM2qCdyUDBFENr0GbeInyE7r_1lYtHBhscXC3bdNWwM', '2022-04-19 09:18:22.818684'),
('wtox5qv8o724yppthk06f7bn38cfqs8w', 'eyJpZCI6NX0:1mvv8c:i2R_qhBARF0zJmnrgnIAGoM1r_btiwSvOiScn3qWR3E', '2021-12-25 05:41:38.133036');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `crimeapp_tbl_booking`
--
ALTER TABLE `crimeapp_tbl_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crimeApp_tbl_booking_lawyer_id_id_50cc6a3e_fk_crimeApp_` (`lawyer_id_id`),
  ADD KEY `crimeApp_tbl_booking_user_id_id_dbea83d2_fk_crimeApp_tbl_user_id` (`user_id_id`);

--
-- Indexes for table `crimeapp_tbl_catagory`
--
ALTER TABLE `crimeapp_tbl_catagory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crimeapp_tbl_complaint`
--
ALTER TABLE `crimeapp_tbl_complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crimeApp_tbl_complai_police_id_id_ae80febc_fk_crimeApp_` (`police_id_id`),
  ADD KEY `crimeApp_tbl_complai_user_id_id_c85d3eca_fk_crimeApp_` (`user_id_id`);

--
-- Indexes for table `crimeapp_tbl_feedback`
--
ALTER TABLE `crimeapp_tbl_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crimeApp_tbl_feedbac_lawyer_id_id_63b61285_fk_crimeApp_` (`lawyer_id_id`),
  ADD KEY `crimeApp_tbl_feedbac_police_id_id_35285282_fk_crimeApp_` (`police_id_id`),
  ADD KEY `crimeApp_tbl_feedbac_user_id_id_915179d6_fk_crimeApp_` (`user_id_id`);

--
-- Indexes for table `crimeapp_tbl_fir`
--
ALTER TABLE `crimeapp_tbl_fir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crimeApp_tbl_fir_complaint_id_id_fc4d2ed5_fk_crimeApp_` (`complaint_id_id`),
  ADD KEY `crimeApp_tbl_fir_police_id_id_68678ca4_fk_crimeApp_tbl_police_id` (`police_id_id`),
  ADD KEY `crimeApp_tbl_fir_user_id_id_3ba86561_fk_crimeApp_tbl_user_id` (`user_id_id`);

--
-- Indexes for table `crimeapp_tbl_lawyer`
--
ALTER TABLE `crimeapp_tbl_lawyer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crimeapp_tbl_police`
--
ALTER TABLE `crimeapp_tbl_police`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crimeapp_tbl_user`
--
ALTER TABLE `crimeapp_tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crimeapp_tbl_booking`
--
ALTER TABLE `crimeapp_tbl_booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `crimeapp_tbl_catagory`
--
ALTER TABLE `crimeapp_tbl_catagory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crimeapp_tbl_complaint`
--
ALTER TABLE `crimeapp_tbl_complaint`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `crimeapp_tbl_feedback`
--
ALTER TABLE `crimeapp_tbl_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `crimeapp_tbl_fir`
--
ALTER TABLE `crimeapp_tbl_fir`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `crimeapp_tbl_lawyer`
--
ALTER TABLE `crimeapp_tbl_lawyer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `crimeapp_tbl_police`
--
ALTER TABLE `crimeapp_tbl_police`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `crimeapp_tbl_user`
--
ALTER TABLE `crimeapp_tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `crimeapp_tbl_booking`
--
ALTER TABLE `crimeapp_tbl_booking`
  ADD CONSTRAINT `crimeApp_tbl_booking_lawyer_id_id_50cc6a3e_fk_crimeApp_` FOREIGN KEY (`lawyer_id_id`) REFERENCES `crimeapp_tbl_lawyer` (`id`),
  ADD CONSTRAINT `crimeApp_tbl_booking_user_id_id_dbea83d2_fk_crimeApp_tbl_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `crimeapp_tbl_user` (`id`);

--
-- Constraints for table `crimeapp_tbl_complaint`
--
ALTER TABLE `crimeapp_tbl_complaint`
  ADD CONSTRAINT `crimeApp_tbl_complai_police_id_id_ae80febc_fk_crimeApp_` FOREIGN KEY (`police_id_id`) REFERENCES `crimeapp_tbl_police` (`id`),
  ADD CONSTRAINT `crimeApp_tbl_complai_user_id_id_c85d3eca_fk_crimeApp_` FOREIGN KEY (`user_id_id`) REFERENCES `crimeapp_tbl_user` (`id`);

--
-- Constraints for table `crimeapp_tbl_feedback`
--
ALTER TABLE `crimeapp_tbl_feedback`
  ADD CONSTRAINT `crimeApp_tbl_feedbac_lawyer_id_id_63b61285_fk_crimeApp_` FOREIGN KEY (`lawyer_id_id`) REFERENCES `crimeapp_tbl_lawyer` (`id`),
  ADD CONSTRAINT `crimeApp_tbl_feedbac_police_id_id_35285282_fk_crimeApp_` FOREIGN KEY (`police_id_id`) REFERENCES `crimeapp_tbl_police` (`id`),
  ADD CONSTRAINT `crimeApp_tbl_feedbac_user_id_id_915179d6_fk_crimeApp_` FOREIGN KEY (`user_id_id`) REFERENCES `crimeapp_tbl_user` (`id`);

--
-- Constraints for table `crimeapp_tbl_fir`
--
ALTER TABLE `crimeapp_tbl_fir`
  ADD CONSTRAINT `crimeApp_tbl_fir_complaint_id_id_fc4d2ed5_fk_crimeApp_` FOREIGN KEY (`complaint_id_id`) REFERENCES `crimeapp_tbl_complaint` (`id`),
  ADD CONSTRAINT `crimeApp_tbl_fir_police_id_id_68678ca4_fk_crimeApp_tbl_police_id` FOREIGN KEY (`police_id_id`) REFERENCES `crimeapp_tbl_police` (`id`),
  ADD CONSTRAINT `crimeApp_tbl_fir_user_id_id_3ba86561_fk_crimeApp_tbl_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `crimeapp_tbl_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
