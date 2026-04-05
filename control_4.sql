-- [1] Разница времени прибытия и отправления для рейсов из Ростова
SELECT 
    town_to,
    TIMEDIFF(time_in, time_out) AS time_diff
FROM Trip
WHERE town_from = 'Rostov';

-- [2] Самый старший член семьи
SELECT member_name
FROM FamilyMembers
ORDER BY birthday ASC
LIMIT 1;

-- [3] Пассажиры с самым коротким именем
SELECT *
FROM Passenger
WHERE LENGTH(name) = (SELECT MIN(LENGTH(name)) FROM Passenger);

-- [4] Сумма расходов на образование по каждому члену семьи
SELECT 
    member_name,
    SUM(amount * unit_price) AS educations
FROM FamilyMembers
JOIN Payments ON family_member = member_id
JOIN Goods ON good_id = good
JOIN GoodTypes ON good_type_id = type
WHERE good_type_name = 'education'
GROUP BY member_name;

-- [5] Годы рождения членов семьи
SELECT YEAR(birthday) AS ages
FROM FamilyMembers;

-- [6] Количество занятий у учителя Krylov 3 сентября 2019 года
SELECT COUNT(s.id) AS count
FROM Schedule s
JOIN Subject sub ON s.subject_id = sub.id
JOIN Teacher t ON s.teacher_id = t.id
WHERE t.last_name = 'Krylov'
  AND DAY(s.date) = 3
  AND MONTH(s.date) = 9
  AND YEAR(s.date) = 2019;

-- [7] Количество учеников в каждом классе (по убыванию)
SELECT 
    c.name,
    COUNT(sic.student) AS amount
FROM Student_in_class sic
JOIN Class c ON sic.class = c.id
GROUP BY c.name
ORDER BY amount DESC;

-- [8] Сдвинуть время начала и окончания пар на 30 минут
UPDATE Timepair
SET 
    start_pair = TIMESTAMPADD(MINUTE, 30, start_pair),
    end_pair = TIMESTAMPADD(MINUTE, 30, end_pair);

-- [9] Комнаты с нечётным количеством бронирований
SELECT 
    r.id,
    COUNT(res.id) AS amount
FROM Rooms r
JOIN Reservations res ON r.id = res.room_id
GROUP BY r.id
HAVING COUNT(res.id) % 2 != 0;