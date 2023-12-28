-- Название и продолжительность самого продолжительного трека
SELECT Название, Длительность
FROM Треки
WHERE Длительность = (SELECT MAX(Длительность) FROM Треки);

-- Название трека, продолжительность которого не менее 3,5 минут
SELECT Название, Длительность
FROM Треки
WHERE Длительность >= 210; -- Переводим 3.5 минуты в секунды

-- Названия сборников, вышедших за период с 2018 по 2020 год включительно
SELECT Название, ГодВыпуска
FROM Сборники
WHERE ГодВыпуска BETWEEN 2018 AND 2020;

--Исполнители, чье имя состоит из одного слова
SELECT Имя
FROM Исполнители
WHERE Имя NOT LIKE '% %';

--Название трека, содержащее слово «мой» или «мой»
SELECT Название
FROM Треки
WHERE LOWER(Название) LIKE '%мой%';
