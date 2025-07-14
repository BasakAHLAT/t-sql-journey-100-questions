-- Şema oluşturuluyor
CREATE SCHEMA s15;
GO

-- Kullanıcılar tablosu
CREATE TABLE s15.Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL
);

-- Abonelikler tablosu
CREATE TABLE s15.Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    UserID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    IsActive BIT DEFAULT 1,
    FOREIGN KEY (UserID) REFERENCES s15.Users(UserID)
);

-- Kullanıcı verileri
INSERT INTO s15.Users VALUES
(1, 'ayse.kara'),
(2, 'mehmet.demir'),
(3, 'zeynep.yildiz'),
(4, 'ali.kaya'),
(5, 'fatma.turan'),
(6, 'burak.gul'),
(7, 'emre.oz'),
(8, 'naz.kilic'),
(9, 'deniz.tas'),
(10, 'seda.keskin');

-- Abonelik verileri
INSERT INTO s15.Subscriptions VALUES
(101, 1, '2024-01-01', DATEADD(DAY, 5, CAST(GETDATE() AS DATE)), 1),
(102, 2, '2024-02-15', DATEADD(DAY, 30, CAST(GETDATE() AS DATE)), 1),
(103, 3, '2024-03-01', DATEADD(DAY, 45, CAST(GETDATE() AS DATE)), 1),
(104, 4, '2024-01-20', DATEADD(DAY, 0, CAST(GETDATE() AS DATE)), 1),
(105, 5, '2023-12-01', DATEADD(DAY, -5, CAST(GETDATE() AS DATE)), 0),
(106, 6, '2024-06-01', DATEADD(DAY, 10, CAST(GETDATE() AS DATE)), 1),
(107, 7, '2024-04-01', DATEADD(DAY, 60, CAST(GETDATE() AS DATE)), 1),
(108, 8, '2024-05-01', DATEADD(DAY, 29, CAST(GETDATE() AS DATE)), 1),
(109, 9, '2024-03-15', DATEADD(DAY, 31, CAST(GETDATE() AS DATE)), 1),
(110, 10, '2024-07-01', DATEADD(DAY, 1, CAST(GETDATE() AS DATE)), 1);