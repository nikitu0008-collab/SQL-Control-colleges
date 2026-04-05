-- Таблица заказов
CREATE TABLE `orders` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `number_order` INT NOT NULL,
    `client` VARCHAR(100) NOT NULL,
    `dostavka` VARCHAR(100) NOT NULL,
    `tovar` VARCHAR(100) NOT NULL
);

-- Таблица товаров
CREATE TABLE `tovar` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `category` VARCHAR(100) NOT NULL,
    `price` INT NOT NULL
);

-- Таблица категорий
CREATE TABLE `category` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL
);

-- Таблица доставки
CREATE TABLE `dostavka` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `number_dostavka` INT NOT NULL,
    `gorod_dostavka` VARCHAR(100) NOT NULL,
    `adres` VARCHAR(100) NOT NULL
);

-- Таблица заказчиков
CREATE TABLE `zakazcik` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `customer_number` INT NOT NULL,
    `fio` VARCHAR(100) NOT NULL,
    `gmail` VARCHAR(100) NOT NULL
);