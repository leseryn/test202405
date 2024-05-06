# https://dbdiagram.io/d/Course_enrollment-6638ce0a9e85a46d5519dd49
CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL comment '登入帳號',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL comment '密碼',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL comment '姓名',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL comment '信箱',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL comment '電話',
  `role` tinyint(3) COLLATE utf8mb4_unicode_ci NOT NULL comment '角色 1: student;2: lecturer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP comment '創建時間',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_account_unique` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP comment '創建時間',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新時間',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_tokens_token_unique` (`token`),
  UNIQUE KEY `access_tokens_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `semesters` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `year` YEAR NOT NULL comment '學期年份', 
  `semester` tinyint(3) NOT NULL comment '學期', 
  PRIMARY KEY (`id`),
  UNIQUE KEY `semesters_year_semester`(`year`,`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abstract` text NULL COLLATE utf8mb4_unicode_ci comment '課程簡介', 
  `credit` tinyint(3) NOT NULL comment '課程學分', 
  `lecturer_id` bigint UNSIGNED NOT NULL comment '講師id',
  `start_time` time NOT NULL comment '上課開始時間',
  `end_time` time NOT NULL comment '上課結束時間', 
  `class_day` tinyint(3) NOT NULL comment '上課日', 
  `semester_id` bigint UNSIGNED NOT NULL comment '學期id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP comment '創建時間',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '更新時間',
  PRIMARY KEY (`id`),
  FOREIGN KEY `courses_lecturer_id_users_id`(`lecturer_id`) REFERENCES `users`(`id`),
  FOREIGN KEY `courses_semester_id_semesters_id`(`semester_id`) REFERENCES `semesters`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `enrollments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` bigint UNSIGNED NOT NULL comment '課程學期id',
  `student_id` bigint UNSIGNED NOT NULL comment '學生id',
  PRIMARY KEY (`id`),
  FOREIGN KEY `enrollments_course_id_courses_id`(`course_id`) REFERENCES `courses`(`id`),
  FOREIGN KEY `enrollments_student_id_users_id`(`student_id`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

