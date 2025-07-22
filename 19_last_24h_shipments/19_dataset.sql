-- Şema oluşturuluyor
CREATE SCHEMA s19;
GO

-- Göndericiler tablosu
CREATE TABLE s19.Senders (
    SenderID INT PRIMARY KEY,
    SenderName VARCHAR(100) NOT NULL
);

-- Kargolar tablosu
CREATE TABLE s19.Packages (
    PackageID INT PRIMARY KEY,
    TrackingNumber VARCHAR(50) NOT NULL,
    SenderID INT NOT NULL,
    SentDate DATETIME NOT NULL,
    FOREIGN KEY (SenderID) REFERENCES s19.Senders(SenderID)
);

-- Gönderici verileri
INSERT INTO s19.Senders VALUES
(1, 'Ayşe Demir'),
(2, 'Mehmet Yıldız'),
(3, 'Zeynep Çelik'),
(4, 'Ali Korkmaz'),
(5, 'Fatma Güneş');

-- Kargo verileri
INSERT INTO s19.Packages VALUES
(201, 'TRK2024001', 1, DATEADD(HOUR, -2, GETDATE())),
(202, 'TRK2024002', 2, DATEADD(HOUR, -10, GETDATE())),
(203, 'TRK2024003', 3, DATEADD(HOUR, -26, GETDATE())),
(204, 'TRK2024004', 4, DATEADD(HOUR, -23, GETDATE())),
(205, 'TRK2024005', 5, DATEADD(HOUR, -50, GETDATE())),
(206, 'TRK2024006', 1, DATEADD(HOUR, -1, GETDATE())),
(207, 'TRK2024007', 2, DATEADD(HOUR, -3, GETDATE())),
(208, 'TRK2024008', 3, DATEADD(HOUR, -100, GETDATE())),
(209, 'TRK2024009', 4, DATEADD(HOUR, -22, GETDATE())),
(210, 'TRK2024010', 5, DATEADD(MINUTE, -30, GETDATE()));