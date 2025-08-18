
-- Şema oluştur
CREATE SCHEMA s24;
GO

-- Gönüllüler tablosu
CREATE TABLE s24.Volunteers (
    VolunteerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Etkinlikler tablosu
CREATE TABLE s24.Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    Theme VARCHAR(50)
);

-- Gönüllü etkinlik eşleşme tablosu
CREATE TABLE s24.VolunteerEvents (
    VolunteerID INT,
    EventID INT,
    PRIMARY KEY (VolunteerID, EventID),
    FOREIGN KEY (VolunteerID) REFERENCES s24.Volunteers(VolunteerID),
    FOREIGN KEY (EventID) REFERENCES s24.Events(EventID)
);

-- Gönüllü verileri
INSERT INTO s24.Volunteers VALUES
(1, 'Ali', 'Yılmaz'),
(2, 'Zeynep', 'Demir'),
(3, 'Mehmet', 'Kaya'),
(4, 'Elif', 'Çelik'),
(5, 'Ahmet', 'Gür'),
(6, 'Ayşe', 'Toprak');

-- Etkinlik verileri
INSERT INTO s24.Events VALUES
(101, 'Sağlıklı Yaşam Fuarı', 'Sağlık'),
(102, 'Kitap Bağışı Kampanyası', 'Eğitim'),
(103, 'Aşı Bilinçlendirme', 'Sağlık'),
(104, 'Geri Dönüşüm Atölyesi', 'Çevre'),
(105, 'Kan Bağışı Etkinliği', 'Sağlık'),
(106, 'Mentorluk Programı', 'Eğitim');

-- Gönüllü etkinlik eşleşmeleri
INSERT INTO s24.VolunteerEvents VALUES
(1, 101),
(1, 103),
(2, 102),
(2, 105),
(3, 103),
(3, 104),
(3, 105),
(4, 101),
(4, 105),
(5, 106),
(6, 103),
(6, 105);
