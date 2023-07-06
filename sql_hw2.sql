-- 1.Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

DROP DATABASE IF EXISTS sql_hw2;
CREATE DATABASE IF NOT EXISTS sql_hw2;

USE sql_hw2;

CREATE TABLE IF not exists sales
( id INT primary key auto_increment,
 order_date DATE NOT NULL,
 count_product INT NOT NULL);
 
 INSERT INTO sales (order_date, count_product)
 VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);


/* 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300, 
используя функцию IF */

SELECT 
id,
IF(count_product < 100, "Маленький заказ", 
    IF(count_product >=100 AND count_product <=300, "Средний заказ",
        IF(count_product >300, "Большой заказ", "Неопределено"))) AS "Тип заказа"
FROM sales;

/* 3.Создайте таблицу “orders”, заполните ее значениями. 
Покажите “полный” статус заказа, используя оператор CASE */

CREATE TABLE if not exists orders
( id INT primary key auto_increment,
 employee_id VARCHAR(10) NOT NULL,
 amount DOUBLE NOT NULL,
 order_status VARCHAR(10) NOT NULL);

 INSERT INTO orders (employee_id, amount, order_status)
 VALUES
('s03', 15.00, "OPEN"),
('e01', 25.50, "OPEN"),
('e05', 100.70, "CLOSED"),
('e02', 22.18, "OPEN"),
('e04', 9.50, "CANCELLED");
 
SELECT
id, employee_id, amount,
CASE 
    WHEN order_status = 'CLOSED' THEN 'Order is closed'
    WHEN order_status = 'OPEN' THEN 'Order is opened'
    ELSE 'Order is canceled'
END AS full_order_status
FROM orders;    