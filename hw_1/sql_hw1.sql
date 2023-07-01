-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. 
CREATE DATABASE IF NOT EXISTS sql_hw1;

USE sql_hw1

CREATE TABLE telephon(
    Id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ProductName VARCHAR(45) NOT NULL,
    Manufacturer VARCHAR(45) NULL,
    ProductCount INT NULL,
    Price INT NULL);
    
INSERT INTO telephon(ProductName, Manufacturer, ProductCount, Price)
VALUES 
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 
SELECT ProductName, Manufacturer, Price
FROM telephon
WHERE ProductCount > 2;

-- 3. Выведите весь ассортимент товаров марки "Samsung"
SELECT *
FROM telephon
WHERE Manufacturer = 'Samsung';

-- 4.1 Товары, в которых есть упоминание "Iphone"    
SELECT *
FROM telephon
WHERE ProductName LIKE '%Iphone%';

-- 4.2 Товары, в которых есть упоминание "Samsung"
SELECT *
FROM telephon
WHERE ProductName LIKE '%Samsung%';

-- 4.3 Товары, в которых есть ЦИФРА "8"  
SELECT *
FROM telephon
WHERE ProductName LIKE "%8%";