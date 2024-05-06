
INSERT INTO `users` (`account`, `password`, `name`, `email`, `phone`, `role`, `created_at`, `updated_at`)
VALUES
('lecturer1', 'password1', 'John Doe', 'john.doe@example.com', '123456789', 2, NOW(), NOW()),
('lecturer2', 'password2', 'Jane Smith', 'jane.smith@example.com', '987654321', 2, NOW(), NOW()),
('lecturer3', 'password3', 'Michael Johnson', 'michael.johnson@example.com', '456789123', 2, NOW(), NOW());


INSERT INTO `semesters` (`year`, `semester`)
VALUES
(2023, 1),
(2023, 2),
(2024, 1);


INSERT INTO `courses` (`name`, `abstract`, `credit`, `lecturer_id`, `start_time`, `end_time`, `class_day`, `semester_id`, `created_at`, `updated_at`)
VALUES
('Course A', 'This is course A.', 3, 1, '09:00:00', '12:00:00', 1, 1, NOW(), NOW()),
('Course B', 'This is course B.', 2, 2, '13:00:00', '16:00:00', 2, 2, NOW(), NOW()),
('Course C', 'This is course C.', 4, 3, '10:00:00', '13:00:00', 3, 3, NOW(), NOW()),
('Course D', 'This is course D.', 3, 1, '09:00:00', '12:00:00', 2, 1, NOW(), NOW()),
('Course E', 'This is course E.', 2, 2, '13:00:00', '16:00:00', 4, 2, NOW(), NOW()),
('Course F', 'This is course F.', 4, 3, '10:00:00', '13:00:00', 5, 3, NOW(), NOW()),
('Course G', 'This is course G.', 3, 1, '09:00:00', '12:00:00', 3, 1, NOW(), NOW()),
('Course H', 'This is course H.', 2, 2, '13:00:00', '16:00:00', 1, 2, NOW(), NOW()),
('Course I', 'This is course I.', 4, 3, '10:00:00', '13:00:00', 2, 3, NOW(), NOW()),
('Course J', 'This is course J.', 3, 1, '09:00:00', '12:00:00', 4, 1, NOW(), NOW());
