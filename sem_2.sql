DROP SCHEMA IF EXISTS sem_2;
CREATE SCHEMA IF NOT EXISTS sem_2;
USE sem_2;

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES
('2022-01-01', '156'),
('2022-01-02', '180'),
('2022-01-03', '21'),
('2022-01-04', '124'),
('2022-01-05', '341');

SELECT *FROM sales; 

SELECT  if(0<100, 'YES', 'NO') AS RESULT;

SELECT
id,
order_date,
count_product, 
if(count_product < 100, 'Маленький заказ',
if(count_product >=100 AND count_product < 300, 'Средний заказ',
if(count_product >300, 'Большой заказ', '')))
AS 'Тип заказа'
FROM sales;

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id TEXT,
amount INT,
order_status TEXT
);

SELECT * FROM orders;

INSERT INTO orders (employee_id, amount, order_status)
VALUES
("e03", "15.00", "OPEN"),
("e01", "25.50", "OPEN"),
("05", "100.70", "CLOSED"),
("02", "22.18", "OPEN"),
("04", "9.50", "CANCELLED");

SELECT *FROM orders;

ALTER TABLE orders
ADD full_order_status TEXT;

SELECT *FROM orders;

SELECT order_status, full_order_status,
CASE
WHEN order_status = 'OPEN' THEN 'Order is open state'
WHEN order_status = 'CLOSED' THEN 'Order is closed'
ELSE 'Order is cancelled'
END
FROM orders;













