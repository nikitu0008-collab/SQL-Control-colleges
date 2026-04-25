--1--
SELECT name 
FROM Passenger
ORDER BY name ASC;

--2--
SELECT Company.name, COUNT(*) AS couns
FROM Company
JOIN Trip ON Trip.company = Company.id
GROUP BY Company.id, Company.name;

--3--
SELECT a.name, COUNT(f.flight_id) AS flight_count
FROM airlines a
JOIN flights f ON a.airline_id = f.airline_id
GROUP BY a.airline_id, a.name
HAVING COUNT(f.flight_id) > 5;

--4--
SELECT id
FROM Trip
WHERE TIMEDIFF(time_out, time_in) > '05:00:00';

--5--
SELECT Goods.good_name
FROM Goods
JOIN Payments ON Payments.good = Goods.good_id
GROUP BY Goods.good_name
HAVING COUNT(*) > 3;

--6--
SELECT MONTH(date) AS month, SUM(amount * unit_price) AS cost
FROM Payments
WHERE YEAR(Payments.date) = 2006
GROUP BY MONTH(date);

--7--
SELECT
    T.first_name,
    T.middle_name,
    T.last_name,
    COUNT(DISTINCT Sch.subject) AS num_subjects
FROM
    Teacher T
JOIN
    Schedule Sch ON Sch.teacher = T.id
GROUP BY
    T.id, T.first_name, T.middle_name, T.last_name
HAVING
    COUNT(DISTINCT Sch.subject) > 1
ORDER BY num_subjects ASC;

--8--
SELECT (amount * unit_price) AS costs
FROM Payments 
ORDER BY costs DESC 
LIMIT 5;

--9--
SELECT Subject.name
FROM Subject
JOIN Schedule ON Schedule.subject = Subject.id
JOIN Teacher ON Teacher.id = Schedule.teacher
GROUP BY Subject.id, Subject.name
HAVING COUNT(DISTINCT Teacher.id) = 1;

--10--
SELECT classroom
FROM Schedule
GROUP BY classroom
ORDER BY COUNT(*) DESC
LIMIT 1;