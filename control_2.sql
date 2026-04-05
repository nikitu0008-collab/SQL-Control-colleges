-- Task 1: книги автора 'Лев Толстой'
SELECT b.*
FROM books b
JOIN authors a ON b.author_id = a.id
WHERE a.first_name = 'Лев' AND a.last_name = 'Толстой';

-- Task 2: читатель с email 'petrova@example.com'
SELECT reader_id, first_name
FROM readers
WHERE email = 'petrova@example.com';

-- Task 3: книги, название которых начинается с 'Учебник '
SELECT book_id
FROM books
WHERE title LIKE 'Учебник %';

-- Task 4: общее количество книг
SELECT COUNT(book_id) AS total_books
FROM books;

-- Task 5: количество книг жанра 'Роман'
SELECT COUNT(book_id) AS romance_books
FROM books
WHERE genre = 'Роман';

-- Task 6: статус возврата книги (по полю return_date)
SELECT 
    book_id,
    IF(return_date IS NULL, 'Не возвращена', 'Возвращена') AS return_status
FROM book_loans;

-- Task 7: фамилии авторов, содержащие букву 'о' (иначе 'Не содержит букву 0')
SELECT 
    IF(last_name LIKE '%о%', last_name, 'Не содержит букву 0') AS processed_last_name
FROM authors;

-- Task 8: количество книг, взятых читателем с reader_id = 1
SELECT COUNT(b.book_id) AS books_borrowed
FROM books b
JOIN book_loans bl ON b.book_id = bl.book_id
WHERE bl.reader_id = 1;

-- Task 9: книги, изданные в 1949 году
SELECT book_id
FROM books
WHERE year_published = 1949;

-- Task 10: увеличить количество доступных копий книги '1984' на 1
UPDATE books
SET available_copies = available_copies + 1
WHERE title = '1984';

-- Task 11: обновить email читателя 'Иван Иванов'
UPDATE readers
SET email = 'ivan.new@example.com'
WHERE first_name = 'Иван' AND last_name = 'Иванов';

-- Task 12: количество уникальных авторов
SELECT COUNT(DISTINCT author) AS unique_authors
FROM books;