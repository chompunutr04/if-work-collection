-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2025 at 09:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if_work_collection`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `dept_code` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `dept_name`, `dept_code`, `created_at`, `updated_at`) VALUES
(1, 'กลุ่มงานสนับสนุนการพัฒนาศักยภาพนิสิตเพื่อการแข่งขัน', 'STUDENT_DE', '2025-07-20 07:13:00', '2025-07-20 07:13:00'),
(2, 'กลุ่มงานสนับสนุนการบริหารงานและการบริการวิชาการมุ่งสู่ความเป็นเลิศ', 'EXCELLENCE', '2025-07-20 07:13:00', '2025-07-20 07:13:00'),
(3, 'กลุ่มงานสนับสนุนการบริหารสินทรัพย์เน้นหลักประสิทธิผลและความคุ้มค่า', 'ASSET_EFF', '2025-07-20 07:13:00', '2025-07-20 07:13:00'),
(4, 'กลุ่มงานสนับสนุนการบริหารระบบโครงสร้างพื้นฐานเพื่อสร้างระบบปฏิบัติการรองรับการเรียนการสอน และการดำเน', 'INFRA_OPS', '2025-07-20 07:13:00', '2025-07-20 07:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `position_code` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position_name`, `position_code`, `created_at`, `updated_at`) VALUES
(1, 'นักวิเคราะห์นโยบายและแผน', 'PLAN', '2025-07-20 07:21:30', '2025-07-20 07:21:30'),
(2, 'นักวิจัย', 'RES', '2025-07-20 07:21:30', '2025-07-20 07:21:30'),
(3, 'นักวิชาการพัสดุ', 'SUPPLY', '2025-07-20 07:21:30', '2025-07-20 07:21:30'),
(4, 'นักวิชาการคอมพิวเตอร์', 'COM', '2025-07-20 07:21:30', '2025-07-20 07:21:30'),
(5, 'นักวิชาการศึกษา', 'EDU', '2025-07-20 07:21:30', '2025-07-20 07:21:30'),
(6, 'เจ้าหน้าที่บริหารงานทั่วไป', 'GEN', '2025-07-20 07:21:30', '2025-07-20 07:21:30'),
(7, 'นักวิชาการเงินและบัญชี', 'ACC', '2025-07-20 07:21:30', '2025-07-20 07:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_title` varchar(200) NOT NULL,
  `task_description` text NOT NULL,
  `task_category_id` int(11) NOT NULL,
  `task_status_id` int(11) NOT NULL DEFAULT 1,
  `assigned_by` varchar(100) DEFAULT NULL,
  `date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `attachment_path` varchar(500) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_categories`
--

CREATE TABLE `task_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_categories`
--

INSERT INTO `task_categories` (`id`, `category_name`, `category_code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'งานตาม KPI', 'KPI', 'งานที่เกี่ยวข้องกับตัวชี้วัดหลัก', '2025-07-20 07:21:53', '2025-07-20 07:21:53'),
(2, 'งานตาม JD', 'JD', 'งานประจำตามคำอธิบายลักษณะงาน', '2025-07-20 07:21:53', '2025-07-20 07:21:53'),
(3, 'งานที่ได้รับมอบหมาย', 'ASSIGNED', 'งานพิเศษที่ได้รับมอบหมายจากผู้อื่น', '2025-07-20 07:21:53', '2025-07-20 07:21:53'),
(4, 'งานตามยุทธศาสตร์', 'STRATEGY', 'งานที่เกี่ยวข้องกับแผนยุทธศาสตร์องค์กร', '2025-07-20 07:21:53', '2025-07-20 07:21:53'),
(5, 'งานตามแผนความเสี่ยง', 'RISK', 'งานที่เกี่ยวข้องกับการบริหารจัดการความเสี่ยง', '2025-07-20 07:21:53', '2025-07-20 07:21:53'),
(6, 'งานแผนซื้อจ้าง', 'PROCUREMENT', 'งานที่เกี่ยวข้องกับการจัดซื้อจัดจ้าง', '2025-07-20 07:21:53', '2025-07-20 07:21:53');

-- --------------------------------------------------------

--
-- Table structure for table `task_status`
--

CREATE TABLE `task_status` (
  `id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `status_code` varchar(20) NOT NULL,
  `color_code` varchar(7) DEFAULT '#000000',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_status`
--

INSERT INTO `task_status` (`id`, `status_name`, `status_code`, `color_code`, `created_at`, `updated_at`) VALUES
(1, 'รอดำเนินการ', 'PENDING', '#ffc107', '2025-07-20 07:22:14', '2025-07-20 07:22:14'),
(2, 'อยู่ระหว่างดำเนินการ', 'IN_PROGRESS', '#17a2b8', '2025-07-20 07:22:14', '2025-07-20 07:22:14'),
(3, 'ดำเนินการแล้ว', 'COMPLETED', '#28a745', '2025-07-20 07:22:14', '2025-07-20 07:22:14'),
(4, 'ยกเลิก', 'CANCELLED', '#dc3545', '2025-07-20 07:22:14', '2025-07-20 07:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `role` enum('employee','supervisor','hr','admin') DEFAULT 'employee',
  `phone` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `username`, `email`, `password`, `first_name`, `last_name`, `department_id`, `position_id`, `role`, `phone`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN001', 'admin', 'admin@company.com', '$2a$10$vI8aWBnW3fID.ZQ4/zo1G.q1lRps.9cGLcZEiGDMVr5yUP1KUOYTa', 'ผู้ดูแล', 'ระบบ', 2, 1, 'admin', NULL, 1, '2025-07-20 07:25:29', '2025-07-20 07:25:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dept_code` (`dept_code`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `position_code` (`position_code`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `task_category_id` (`task_category_id`),
  ADD KEY `task_status_id` (`task_status_id`);

--
-- Indexes for table `task_categories`
--
ALTER TABLE `task_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_code` (`category_code`);

--
-- Indexes for table `task_status`
--
ALTER TABLE `task_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_code` (`status_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `position_id` (`position_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_categories`
--
ALTER TABLE `task_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `task_status`
--
ALTER TABLE `task_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`task_category_id`) REFERENCES `task_categories` (`id`),
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`task_status_id`) REFERENCES `task_status` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
