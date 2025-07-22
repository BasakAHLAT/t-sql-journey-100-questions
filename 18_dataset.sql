-- Şema oluşturuluyor
CREATE SCHEMA s18;
GO

-- Şehirler tablosu
CREATE TABLE s18.Cities (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(100) NOT NULL
);

-- Uçuşlar tablosu
CREATE TABLE s18.Flights (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(10) NOT NULL,
    DepartureTime DATETIME NOT NULL,
    ArrivalCityID INT NOT NULL,
    FOREIGN KEY (ArrivalCityID) REFERENCES s18.Cities(CityID)
);

-- Şehir verileri
INSERT INTO s18.Cities VALUES
(1, 'İstanbul'),
(2, 'Ankara'),
(3, 'İzmir'),
(4, 'Antalya'),
(5, 'Trabzon');

-- Uçuş verileri
-- Yarınki uçuşlar
INSERT INTO s18.Flights VALUES
(301, 'TK301', DATEADD(HOUR, 8, DATEADD(DAY, 1, CAST(GETDATE() AS DATETIME))), 2),
(302, 'TK302', DATEADD(HOUR, 14, DATEADD(DAY, 1, CAST(GETDATE() AS DATETIME))), 3),
(303, 'TK303', DATEADD(HOUR, 21, DATEADD(DAY, 1, CAST(GETDATE() AS DATETIME))), 5);

-- Bugünkü uçuş
INSERT INTO s18.Flights VALUES
(304, 'TK304', DATEADD(HOUR, 9, CAST(GETDATE() AS DATETIME)), 1);

-- Geçmiş uçuş
INSERT INTO s18.Flights VALUES
(305, 'TK305', DATEADD(HOUR, 10, DATEADD(DAY, -1, CAST(GETDATE() AS DATETIME))), 4);