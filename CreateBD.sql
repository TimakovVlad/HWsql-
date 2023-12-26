-- Создание таблиц
CREATE TABLE Жанры (
    Жанр_id INT PRIMARY KEY,
    Название VARCHAR(255) NOT NULL
);

CREATE TABLE Исполнители (
    Исполнитель_id INT PRIMARY KEY,
    Имя VARCHAR(255) NOT NULL
);

CREATE TABLE ИсполнителиЖанры (
    Исполнитель_id INT,
    Жанр_id INT,
    FOREIGN KEY (Исполнитель_id) REFERENCES Исполнители (Исполнитель_id),
    FOREIGN KEY (Жанр_id) REFERENCES Жанры (Жанр_id),
    PRIMARY KEY (Исполнитель_id, Жанр_id)
);

CREATE TABLE Альбомы (
    Альбом_id INT PRIMARY KEY,
    Название VARCHAR(255) NOT NULL,
    ГодВыпуска INT NOT NULL
);

CREATE TABLE ИсполнителиАльбомы (
    Исполнитель_id INT,
    Альбом_id INT,
    FOREIGN KEY (Исполнитель_id) REFERENCES Исполнители (Исполнитель_id),
    FOREIGN KEY (Альбом_id) REFERENCES Альбомы (Альбом_id),
    PRIMARY KEY (Исполнитель_id, Альбом_id)
);

CREATE TABLE Треки (
    Трек_id INT PRIMARY KEY,
    Название VARCHAR(255) NOT NULL,
    Длительность INT NOT NULL,
    Альбом_id INT,
    FOREIGN KEY (Альбом_id) REFERENCES Альбомы (Альбом_id)
);

CREATE TABLE Сборники (
    Сборник_id INT PRIMARY KEY,
    Название VARCHAR(255) NOT NULL,
    ГодВыпуска INT NOT NULL
);

CREATE TABLE ТрекиВСборниках (
    Сборник_id INT,
    Трек_id INT,
    FOREIGN KEY (Сборник_id) REFERENCES Сборники (Сборник_id),
    FOREIGN KEY (Трек_id) REFERENCES Треки (Трек_id),
    PRIMARY KEY (Сборник_id, Трек_id)
);
