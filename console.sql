create database rh;

use rh;

CREATE TABLE `employee` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `employee` (`name`, `email`) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Brown', 'bob.brown@example.com'),
('Charlie Davis', 'charlie.davis@example.com'),
('Emily White', 'emily.white@example.com'),
('George Miller', 'george.miller@example.com'),
('Hannah Wilson', 'hannah.wilson@example.com'),
('Ivy Moore', 'ivy.moore@example.com'),
('Jack Taylor', 'jack.taylor@example.com');

select * from employee;

CREATE TABLE `salary` (
    `id` int(11) NOT NULL,
    `value` decimal(10,0) NOT NULL,
    `payment_date` date NOT NULL,
    `employee_id` int(11) NOT NULL,
    KEY `employee_id` (`employee_id`),
    CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
);

INSERT INTO `salary` (`id`, `value`, `payment_date`, `employee_id`) VALUES
(1, 3000, '2024-06-15', 1),
(2, 3200, '2024-06-15', 2),
(3, 3500, '2024-06-15', 3),
(4, 2800, '2024-06-15', 4),
(5, 3100, '2024-06-15', 5),
(6, 3400, '2024-06-15', 6),
(7, 3000, '2024-06-15', 7),
(8, 3300, '2024-06-15', 8),
(9, 3600, '2024-06-15', 9),
(10, 2900, '2024-06-15', 10),

(11, 3000, '2024-07-15', 1),
(12, 3200, '2024-07-15', 2),
(13, 3500, '2024-07-15', 3),
(14, 2800, '2024-07-15', 4),
(15, 3100, '2024-07-15', 5),
(16, 3400, '2024-07-15', 6),
(17, 3000, '2024-07-15', 7),
(18, 3300, '2024-07-15', 8),
(19, 3600, '2024-07-15', 9),
(20, 2900, '2024-07-15', 10),

(21, 3000, '2024-08-15', 1),
(22, 3200, '2024-08-15', 2),
(23, 3500, '2024-08-15', 3),
(24, 2800, '2024-08-15', 4),
(25, 3100, '2024-08-15', 5),
(26, 3400, '2024-08-15', 6),
(27, 3000, '2024-08-15', 7),
(28, 3300, '2024-08-15', 8),
(29, 3600, '2024-08-15', 9),
(30, 2900, '2024-08-15', 10);

select * from salary;

SELECT e.id, e.name, AVG(s.value) AS avg_salary
FROM employee e
         JOIN salary s ON e.id = s.employee_id
WHERE s.payment_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY e.id, e.name
ORDER BY avg_salary DESC
LIMIT 3;