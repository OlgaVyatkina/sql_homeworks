CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW cars_view AS
SELECT *
FROM cars
WHERE cost < 25000;

SELECT *
FROM cars_view;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW cars_view AS
SELECT * 
FROM cars
WHERE cost < 30000;

SELECT * 
FROM cars_view;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW cars_view2 AS
SELECT *
FROM cars
WHERE name IN ("Skoda", "Audi");

SELECT *
FROM cars_view2;


-- Доп задания:
-- 1* Получить ранжированный список автомобилей по цене в порядке возрастания
SELECT name, cost,
ROW_NUMBER() OVER (ORDER BY cost) AS `row_number`
FROM cars;

-- 2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость
SELECT  name, cost,
DENSE_RANK() OVER(ORDER BY cost DESC) AS `rank`
FROM cars
ORDER BY `rank`
LIMIT 3;

SELECT `rank`, name, cost, 
SUM(cost) OVER() AS `total_sum`
FROM cars;

-- 3* Получить список автомобилей, у которых цена больше предыдущей цены
SELECT *
FROM cars;

CREATE OR REPLACE VIEW cars_with_lags AS 
SELECT name, cost,
LAG(cost) OVER() AS lag_cost
FROM cars;

SELECT *
FROM cars_with_lags;

SELECT name,cost
FROM cars_with_lags
WHERE cost>lag_cost;

-- 4* Получить список автомобилей, у которых цена меньше следующей цены
CREATE OR REPLACE VIEW cars_with_leads AS 
SELECT name, cost, 
LEAD(cost) OVER() AS lead_cost
FROM cars;

SELECT *
FROM cars_with_leads;

SELECT name,cost
FROM cars_with_leads
WHERE cost<lead_cost;

/*
5*Получить список автомобилей, отсортированный по возрастанию цены,
 и добавить столбец со значением разницы между текущей ценой и ценой следующего автомобиля
*/
SELECT id, name, cost, 
(LEAD(cost) OVER())-cost AS diff_cost
FROM cars
ORDER BY cost;

