-- Названия альбомов, в которых представлены исполнители более чем одного жанра
SELECT DISTINCT Альбомы.Название
FROM Альбомы
JOIN ИсполнителиАльбомы ON Альбомы.Альбом_id = ИсполнителиАльбомы.Альбом_id
JOIN ИсполнителиЖанры ON ИсполнителиАльбомы.Исполнитель_id = ИсполнителиЖанры.Исполнитель_id
GROUP BY Альбомы.Альбом_id, Альбомы.Название
HAVING COUNT(DISTINCT ИсполнителиЖанры.Жанр_id) > 1;

-- Наименования треков, которые не включены в сборники
SELECT Треки.Название
FROM Треки
LEFT JOIN ТрекиВСборниках ON Треки.Трек_id = ТрекиВСборниках.Трек_id
WHERE ТрекиВСборниках.Трек_id IS NULL;

-- Исполнитель или исполнители, записавшие самый короткий по продолжительности трек
SELECT Исполнители.Имя AS Исполнитель, Треки.Длительность AS Длительность_трека
FROM Исполнители
JOIN ИсполнителиАльбомы ON Исполнители.Исполнитель_id = ИсполнителиАльбомы.Исполнитель_id
JOIN Альбомы ON ИсполнителиАльбомы.Альбом_id = Альбомы.Альбом_id
JOIN Треки ON Альбомы.Альбом_id = Треки.Альбом_id
WHERE Треки.Длительность = (SELECT MIN(Длительность) FROM Треки);

-- Названия альбомов, содержащих наименьшее количество треков
SELECT Альбомы.Название AS Название_альбома, COUNT(Треки.Трек_id) AS Количество_треков
FROM Альбомы
LEFT JOIN Треки ON Альбомы.Альбом_id = Треки.Альбом_id
GROUP BY Альбомы.Альбом_id, Альбомы.Название
HAVING COUNT(Треки.Трек_id) = (
    SELECT COUNT(Треки.Трек_id)
    FROM Альбомы
    LEFT JOIN Треки ON Альбомы.Альбом_id = Треки.Альбом_id
    GROUP BY Альбомы.Альбом_id
    ORDER BY COUNT(Треки.Трек_id)
    LIMIT 1
);

