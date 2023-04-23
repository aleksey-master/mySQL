DROP SCHEMA IF EXISTS sem_3;
CREATE SCHEMA IF NOT EXISTS sem_3;

USE sem_3;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

ALTER TABLE staff
MODIFY post VARCHAR(30);

INSERT INTO `staff` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);


DROP TABLE IF EXISTS activity_staff;
CREATE TABLE IF NOT EXISTS `activity_staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`staff_id` INT,
FOREIGN KEY(staff_id) REFERENCES staff(id),
`date_activity` DATE,
`count_pages` INT
);

INSERT `activity_staff` (`staff_id`, `date_activity`, `count_pages`)
VALUES
(1,'2022-01-01',250),
(2,'2022-01-01',220),
(3,'2022-01-01',170),
(1,'2022-01-02',100),
(2,'2022-01-01',220),
(3,'2022-01-01',300),
(7,'2022-01-01',350),
(1,'2022-01-03',168),
(2,'2022-01-03',62),
(3,'2022-01-03',84);


SELECT * 
FROM staff;

 
 # Домашнее задание
 
# Выведите среднюю заработную плату по должностям, которая составляет более 30000
SELECT post, AVG(salary)
FROM staff
GROUP BY post
HAVING AVG(salary) > 30000;

# Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT salary, id
FROM staff
ORDER BY salary DESC; 

SELECT salary, id
FROM staff
ORDER BY salary; 

# выведите 5 максимальных заработных плат (salary)
SELECT DISTINCT (salary)
FROM staff
LIMIT 5;

# посчитайте суммарную зарплату по каждой специальности
SELECT post, COUNT(*), SUM(salary) 
FROM staff
GROUP BY post;

# найдите количество сотрудников со специальностью "Рабочий" в возрасте от 24 до 49 лет включительно
SELECT post, COUNT(seniority)
FROM staff
WHERE post = "Рабочий"
ORDER BY seniority;

SELECT COUNT(seniority), name_age
FROM
(SELECT seniority,
CASE
WHEN age between 24 AND 49 THEN "от 24 до 49"
END AS name_age
FROM staff) AS lists
GROUP BY name_age;

SELECT COUNT(seniority), name_age
FROM
(SELECT seniority,
CASE
WHEN age between 24 AND 49 THEN "от 24 до 49"
END AS name_age
FROM staff) AS lists
GROUP BY name_age;

# найдите количество специальностей
SELECT COUNT(DISTINCT post) AS 'Количество специальностей'
FROM staff;

# выведите специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post, AVG(age) 
FROM staff
GROUP BY post
HAVING AVG(age) <30; 