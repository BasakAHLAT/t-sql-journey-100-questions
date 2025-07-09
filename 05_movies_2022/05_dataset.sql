CREATE SCHEMA s05;

-- Tablo: Directors
CREATE TABLE Directors (
    DirectorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Tablo: Movies
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    ReleaseYear INT NOT NULL CHECK (ReleaseYear >= 1900),
    DirectorID INT,
    FOREIGN KEY (DirectorID) REFERENCES Directors(DirectorID)
);

-- Örnek veriler: Directors
INSERT INTO Directors (DirectorID, Name) VALUES
(1, 'Denis Villeneuve'),
(2, 'Greta Gerwig'),
(3, 'Christopher Nolan'),
(4, 'Jordan Peele'),
(5, 'Jane Campion'),
(6, 'Baz Luhrmann'),
(7, 'Ruben Östlund'),
(8, 'Ryusuke Hamaguchi'),
(9, 'Park Chan-wook'),
(10, 'Steven Spielberg');

-- Örnek veriler: Movies
INSERT INTO Movies (MovieID, Title, ReleaseYear, DirectorID) VALUES
(1, 'Dune: Part One', 2021, 1),
(2, 'Dune: Part Two', 2022, 1),
(3, 'Barbie', 2023, 2),
(4, 'Oppenheimer', 2023, 3),
(5, 'Nope', 2022, 4),
(6, 'The Power of the Dog', 2021, 5),
(7, 'Elvis', 2022, 6),
(8, 'Triangle of Sadness', 2022, 7),
(9, 'Drive My Car', 2021, 8),
(10, 'Decision to Leave', 2022, 9),
(11, 'The Fabelmans', 2022, 10),
(12, 'Tenet', 2020, 3);