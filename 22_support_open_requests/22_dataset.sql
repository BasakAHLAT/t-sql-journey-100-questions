
-- Şema oluştur
CREATE SCHEMA s22;
GO

-- Kullanıcılar tablosu
CREATE TABLE s22.Users (
    UserID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- Destek talepleri tablosu
CREATE TABLE s22.SupportRequests (
    RequestID INT PRIMARY KEY,
    UserID INT NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('açık', 'kapalı', 'beklemede')),
    CreatedAt DATETIME NOT NULL,
    UpdatedAt DATETIME,
    Subject VARCHAR(200),
    FOREIGN KEY (UserID) REFERENCES s22.Users(UserID)
);

-- Kullanıcı verileri
INSERT INTO s22.Users VALUES
(1, 'Ali Vural', 'ali.vural@example.com'),
(2, 'Zeynep Yılmaz', 'zeynep.yilmaz@example.com'),
(3, 'Mehmet Karaca', 'mehmet.karaca@example.com'),
(4, 'Elif Deniz', 'elif.deniz@example.com'),
(5, 'Ayşe Gür', 'ayse.gur@example.com');

-- Destek talepleri verileri
INSERT INTO s22.SupportRequests VALUES
(1001, 1, 'açık', '2025-07-25 10:30:00', '2025-07-30 14:00:00', 'Veritabanı bağlantı sorunu'),
(1002, 2, 'kapalı', '2025-07-20 08:15:00', '2025-07-21 09:00:00', 'Şifre sıfırlama'),
(1003, 3, 'açık', '2025-07-28 16:20:00', NULL, 'Yedekleme hatası'),
(1004, 1, 'beklemede', '2025-07-18 11:45:00', '2025-07-20 13:00:00', 'Yetki problemi'),
(1005, 4, 'açık', '2025-07-29 09:00:00', '2025-07-31 10:00:00', 'Performans düşüşü'),
(1006, 5, 'kapalı', '2025-07-26 14:10:00', '2025-07-27 08:00:00', 'Hesap kilitlendi'),
(1007, 2, 'açık', '2025-07-30 15:30:00', '2025-07-31 09:30:00', 'API erişim sorunu'),
(1008, 3, 'beklemede', '2025-07-17 12:00:00', '2025-07-19 10:00:00', 'Raporlama hatası'),
(1009, 4, 'açık', '2025-07-31 11:00:00', NULL, 'Sunucu gecikmesi'),
(1010, 1, 'kapalı', '2025-07-16 10:00:00', '2025-07-17 11:00:00', 'İzin talebi');
