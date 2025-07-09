
-- Şema oluşturuluyor
CREATE SCHEMA s08;

-- Bölgeler tablosu
CREATE TABLE s08.Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(100) NOT NULL
);

-- Mağaza yöneticileri tablosu
CREATE TABLE s08.Managers (
    ManagerID INT PRIMARY KEY,
    ManagerName VARCHAR(100) NOT NULL
);

-- Mağazalar tablosu
CREATE TABLE s08.Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    RegionID INT NOT NULL,
    ManagerID INT NOT NULL,
    FOREIGN KEY (RegionID) REFERENCES s08.Regions(RegionID),
    FOREIGN KEY (ManagerID) REFERENCES s08.Managers(ManagerID)
);

-- Region verileri
INSERT INTO s08.Regions VALUES
(1, 'Marmara'),
(2, 'Ege'),
(3, 'Akdeniz'),
(4, 'Karadeniz'),
(5, 'İç Anadolu');

-- Manager verileri
INSERT INTO s08.Managers VALUES
(1, 'Ali Yılmaz'),
(2, 'Ayşe Demir'),
(3, 'Mehmet Kaya'),
(4, 'Zeynep Koç'),
(5, 'Emre Şahin'),
(6, 'Büşra Güneş');

-- Store verileri
INSERT INTO s08.Stores VALUES
(1, 'İstanbul Forum AVM', 'İstanbul', 1, 1),
(2, 'Cevahir Mağaza', 'İstanbul', 1, 2),
(3, 'Ege Park', 'İzmir', 2, 3),
(4, 'TerraCity Mağaza', 'Antalya', 3, 4),
(5, 'Panora AVM', 'Ankara', 5, 5),
(6, 'Marmara Park', 'İstanbul', 1, 6),
(7, 'Karadeniz Center', 'Samsun', 4, 1),
(8, 'Agora AVM', 'İzmir', 2, 2),
(9, 'İstanbul City Center', 'İstanbul', 1, 3),
(10, 'Bursa AVM', 'Bursa', 1, 4);
