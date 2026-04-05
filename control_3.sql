-- Владельцы
CREATE TABLE `Owners` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `full_name` VARCHAR(128) NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL UNIQUE,
    `birth` DATE NOT NULL
);

-- Питомцы
CREATE TABLE `Pets` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `type` VARCHAR(50) NOT NULL,
    `birth` DATE,
    `owner_id` INT NOT NULL,
    FOREIGN KEY (`owner_id`) REFERENCES `Owners`(`id`)
);

-- Приёмы (создаётся перед Doctors)
CREATE TABLE `Appointments` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `reason` TEXT,
    `pet_id` INT NOT NULL,
    FOREIGN KEY (`pet_id`) REFERENCES `Pets`(`id`)
);

-- Врачи
CREATE TABLE `Doctors` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `full_name` VARCHAR(128) NOT NULL,
    `specialization` VARCHAR(100) NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL UNIQUE,
    `appointment_id` INT NULL,   -- может быть NULL
    FOREIGN KEY (`appointment_id`) REFERENCES `Appointments`(`id`)
);

-- Медицинские карты
CREATE TABLE `MedicalRecords` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `description` TEXT,
    `record_status` VARCHAR(128) NOT NULL,
    `appointment_id` INT NOT NULL,
    FOREIGN KEY (`appointment_id`) REFERENCES `Appointments`(`id`)
);

-- Процедуры
CREATE TABLE `Procedures` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL UNIQUE,
    `description` TEXT,
    `price` DECIMAL(10,2) NOT NULL,
    `appointment_id` INT NULL,
    FOREIGN KEY (`appointment_id`) REFERENCES `Appointments`(`id`)
);

-- Лекарства
CREATE TABLE `Medicines` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL UNIQUE,
    `description` TEXT NOT NULL,
    `price` DECIMAL(10,2) NOT NULL,
    `amount` INT NOT NULL
);

-- Поставщики
CREATE TABLE `Suppliers` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL UNIQUE,
    `phone_number` VARCHAR(20)
);

-- Заказы лекарств
CREATE TABLE `Orders` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `date` DATE NOT NULL,
    `status` VARCHAR(128),
    `supplier_id` INT NOT NULL,
    FOREIGN KEY (`supplier_id`) REFERENCES `Suppliers`(`id`)
);

-- Связь заказов и лекарств
CREATE TABLE `OrderMedicines` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT NOT NULL,
    `medicine_id` INT NOT NULL,
    FOREIGN KEY (`order_id`) REFERENCES `Orders`(`id`),
    FOREIGN KEY (`medicine_id`) REFERENCES `Medicines`(`id`)
);
INSERT INTO Owners (full_name, phone_number, birth) VALUES
('Горыныч Дракон Петрович', '+7(666)666-66-66', '1985-03-15'),  
('Бабушка Нюра "Когти"', '+7(922)322-22-22', '1990-07-22'),      
('Сидор "Спойлер" Кузьмич', '+7(903)133-37-77', '1978-11-05'),  
('Козявкина Лена "Фу"', '+7(904)569-08-08', '1982-09-30'),       
('Жорик Вареник', '+7(905)228-22-80', '1995-12-12');            

INSERT INTO Pets (name, type, birth, owner_id) VALUES
('Бармалей', 'Кот-террорист', '2021-05-10', 1),
('Шаурма', 'Собака-еда', '2019-08-22', 1),
('Кефир', 'Попугай-алкоголик', '2022-01-15', 2),
('Пельмешек', 'Кот-диванный', '2020-11-05', 2),
('Бетмен', 'Собака-супергерой', '2018-03-01', 3),
('Снежок 2.0', 'Хорек-киборг', '2023-06-20', 4),
('Тортилла', 'Рептилия-пенсионер', '2015-09-12', 4);

INSERT INTO Doctors (full_name, specialization, phone_number) VALUES
('Айболит Супер-пупер', 'Терапевт (и немного экстрасенс)', '+7(916)133-33-33'),
('Ветрова Мария "Бензопила"', 'Хирург (любит джаз)', '+7(926)228-14-88'),
('Зубной Зубыч Зубов', 'Стоматолог (зуб за зуб)', '+7(999)999-99-99'),
('Орлова Света "Короста"', 'Дерматолог (чешет за обе щеки)', '+7(977)777-77-77'),
('Когтев Сан Саныч', 'Ортопед (иногда кусается)', '+7(925)555-55-55');

INSERT INTO Appointments (reason, pet_id) VALUES
('Плановый осмотр', 1),
('Хромота на заднюю лапу', 2),
('Чистка перьев', 3),
('Сильный зуд', 4),
('Вакцинация', 5),
('Зубной камень', 1),
('Вялость и плохой аппетит', 6),
('Трещина панциря', 7),
('Боль в лапе', 5),
('Контрольный осмотр после травмы', 2),
('Повторный прием по поводу аллергии', 4),
('Травма крыла', 3);

INSERT INTO MedicalRecords (description, record_status, appointment_id) VALUES
('Животное здорово, рекомендован ежегодный осмотр', 'Завершен', 1),
('Диагностирован ушиб, рекомендован покой', 'Завершен', 2),
('Перья почищены, паразитов не обнаружено', 'Завершен', 3),
('Аллергическая реакция на корм, назначена диета', 'Завершен', 4),
('Вакцинация проведена, повтор через год', 'Завершен', 5),
('Рекомендована профессиональная чистка зубов', 'Завершен', 6),
('Назначен курс витаминов', 'Завершен', 7),
('Обработано антисептиком, динамика положительная', 'Завершен', 8),
('Ушиб мягких тканей, назначен покой', 'Завершен', 9),
('Восстановление идет хорошо', 'В процессе', 10),
('Ожидает приема', 'Запланирован', 11),
('Требуется рентген', 'Запланирован', 12);

INSERT INTO Procedures (name, description, price, appointment_id) VALUES
('Осмотр терапевта', 'Первичный осмотр животного', 1000.00, 1),
('Вакцинация комплексная', 'Прививка от основных заболеваний', 2500.00, 5),
('Чипирование', 'Установка микрочипа', 1500.00, NULL),
('Анализ крови', 'Общий клинический анализ крови', 1200.00, 2),
('УЗИ брюшной полости', 'Ультразвуковое исследование', 2000.00, NULL),
('Рентген конечностей', 'Снимок лапы или позвоночника', 1800.00, 9),
('Чистка зубов', 'Санация ротовой полости', 3000.00, 6),
('Кастрация кота', 'Хирургическое вмешательство', 3500.00, NULL),
('Обработка от паразитов', 'Капли на холку', 500.00, 4),
('Стрижка когтей', 'Гигиеническая стрижка когтей', 400.00, 2);

INSERT INTO Medicines (name, description, price, amount) VALUES
('Амоксициллин', 'Антибиотик широкого спектра', 450.00, 10),
('Мелоксикам', 'Противовоспалительное средство', 350.00, 50),
('Омепразол', 'Для лечения язвы желудка', 300.00, 5),
('Адвокат для кошек', 'Капли от паразитов', 550.00, 15),
('Симпарика для собак', 'Таблетки от клещей', 1200.00, 8),
('Роял Канин Гастро', 'Лечебный корм', 850.00, 3),
('Физраствор', '0.9% натрия хлорид', 100.00, 20),
('Глюкоза 5%', 'Раствор для инфузий', 120.00, 12),
('Цефтриаксон', 'Антибиотик цефалоспоринового ряда', 200.00, 25),
('Преднизолон', 'Гормональное средство', 280.00, 7),
('Диазепам', 'Седативное средство', 450.00, 4),
('Витам', 'Витаминный комплекс', 320.00, 30),
('Хлоргексидин', 'Антисептический раствор', 90.00, 6),
('Гемобаланс', 'Кровоостанавливающее средство', 520.00, 9),
('Лиарсин', 'Гепатопротектор', 430.00, 11);

INSERT INTO Suppliers (name, phone_number) VALUES
('ВетФарм', '+7(910)101-01-01'),
('ЗооЗдрав', '+7(920)202-02-02');

INSERT INTO Orders (date, status, supplier_id) VALUES
('2024-01-15', 'Получен', 1),
('2024-01-28', 'В пути', 1),
('2024-02-05', 'Заказан', 2);

INSERT INTO OrderMedicines (order_id, medicine_id) VALUES
(1, 1), (1, 4), (1, 9),
(2, 2), (2, 5), (2, 10),
(3, 3), (3, 6), (3, 7), (3, 8);