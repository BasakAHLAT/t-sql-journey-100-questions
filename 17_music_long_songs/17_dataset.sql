-- Şema oluşturuluyor
CREATE SCHEMA s17;
GO

-- Sanatçılar tablosu
CREATE TABLE s17.Artists (
    ArtistID INT PRIMARY KEY,
    ArtistName VARCHAR(100) NOT NULL
);

-- Şarkılar tablosu
CREATE TABLE s17.Songs (
    SongID INT PRIMARY KEY,
    SongName VARCHAR(150) NOT NULL,
    ArtistID INT NOT NULL,
    DurationInSeconds INT CHECK (DurationInSeconds > 0),
    ReleaseDate DATE,
    FOREIGN KEY (ArtistID) REFERENCES s17.Artists(ArtistID)
);

-- Sanatçı verileri
INSERT INTO s17.Artists VALUES
(1, 'Ezgi Aksoy'),
(2, 'Ali Yıldırım'),
(3, 'Bahar Güneş'),
(4, 'Murat Aslan'),
(5, 'Deniz Demir');

-- Şarkı verileri
INSERT INTO s17.Songs VALUES
(101, 'Gece Yolculuğu', 1, 290, '2023-05-01'),
(102, 'Son Söz', 2, 185, '2022-12-12'),
(103, 'Beklenmedik An', 3, 312, '2024-03-20'),
(104, 'Düşler Ülkesi', 1, 420, '2021-07-15'),
(105, 'Geri Dön', 4, 175, '2020-01-01'),
(106, 'Uyanış', 2, 305, '2023-11-11'),
(107, 'Kaybolan Yıllar', 5, 125, '2022-06-06'),
(108, 'Sessizlik', 3, 310, '2023-08-18'),
(109, 'Derin Nefes', 4, 450, '2023-01-30'),
(110, 'Yeni Gün', 5, 90, '2024-06-10');