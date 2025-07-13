-- Şema oluşturuluyor
CREATE SCHEMA s11;
GO

-- Users tablosu
CREATE TABLE s11.Users (
    UserID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);
GO

-- Events tablosu
CREATE TABLE s11.Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(200) NOT NULL,
    EventDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    Description TEXT,
    OrganizerID INT,
    FOREIGN KEY (OrganizerID) REFERENCES s11.Users(UserID)
);
GO

-- Kullanıcı verileri
INSERT INTO s11.Users (UserID, FullName, Email) VALUES
(1, 'Ahmet Yılmaz', 'ahmet@example.com'),
(2, 'Zeynep Kara', 'zeynep@example.com'),
(3, 'Mehmet Demir', 'mehmet@example.com'),
(4, 'Elif Şahin', 'elif@example.com'),
(5, 'Ali Vural', 'ali@example.com');

-- Etkinlik verileri
INSERT INTO s11.Events (EventID, EventName, EventDate, StartTime, Description, OrganizerID) VALUES
(101, 'Veritabanı Temelleri', CAST(GETDATE() AS DATE), '10:00', 'Bu etkinlikte veritabanı kavramları ele alınacaktır.', 1),
(102, 'Web Geliştirme', CAST(GETDATE() AS DATE), '13:00', 'HTML, CSS, JavaScript anlatılacaktır.', 2),
(103, 'Veritabanı Optimizasyonu', CAST(GETDATE() AS DATE), '15:30', 'Veritabanı sorgularının performansı artırılacak.', 3),
(104, 'Mobil Uygulama Geliştirme', DATEADD(DAY, 1, CAST(GETDATE() AS DATE)), '11:00', 'Android ve iOS temelleri.', 4),
(105, 'Yapay Zeka 101', DATEADD(DAY, -1, CAST(GETDATE() AS DATE)), '09:00', 'Makine öğrenmesi giriş.', 5),
(106, 'Veri Bilimi Paneli', CAST(GETDATE() AS DATE), '17:00', 'Python ile veri analizi.', 2);