CREATE SCHEMA s03;

-- 1. Departmanlar tablosu
CREATE TABLE s03.Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL
);

-- 2. Pozisyonlar tablosu
CREATE TABLE s03.Positions (
    PositionID INT PRIMARY KEY IDENTITY(1,1),
    PositionTitle VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES s03.Departments(DepartmentID)
);

-- 3. Çalýþanlar tablosu
CREATE TABLE s03.Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    HireDate DATE NOT NULL,
    BirthDate DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    PositionID INT NOT NULL,
    IsActive BIT DEFAULT 1,
    FOREIGN KEY (PositionID) REFERENCES s03.Positions(PositionID)
);

-- Departman verileri
INSERT INTO s03.Departments (DepartmentName) VALUES
('Ýnsan Kaynaklarý'),
('Satýþ'),
('Yazýlým Geliþtirme'),
('Finans'),
('Pazarlama');

-- Pozisyon verileri
INSERT INTO s03.Positions (PositionTitle, DepartmentID) VALUES
('ÝK Uzmaný', 1),
('Satýþ Temsilcisi', 2),
('Yazýlým Geliþtirici', 3),
('Finans Analisti', 4),
('Pazarlama Uzmaný', 5),
('Kýdemli Geliþtirici', 3),
('Muhasebeci', 4),
('Satýþ Müdürü', 2),
('ÝK Müdürü', 1),
('Dijital Pazarlama Uzmaný', 5);

-- Çalýþan verileri
INSERT INTO s03.Employees (FirstName, LastName, Email, HireDate, BirthDate, Gender, PositionID, IsActive) VALUES
('Ayþe', 'Yýlmaz', 'ayse.yilmaz@example.com', '2025-01-10', '1992-03-14', 'F', 1, 1),
('Mehmet', 'Demir', 'mehmet.demir@example.com', '2025-03-22', '1989-07-08', 'M', 2, 1),
('Zeynep', 'Kaya', 'zeynep.kaya@example.com', '2024-12-01', '1995-11-23', 'F', 3, 1),
('Ali', 'Koç', 'ali.koc@example.com', '2025-06-30', '1990-02-11', 'M', 4, 1),
('Elif', 'Þahin', 'elif.sahin@example.com', '2025-02-18', '1993-09-30', 'F', 5, 1),
('Burak', 'Arslan', 'burak.arslan@example.com', '2025-08-05', '1987-06-17', 'M', 6, 1),
('Ceren', 'Aydýn', 'ceren.aydin@example.com', '2023-10-15', '1996-01-22', 'F', 7, 1),
('Emre', 'Yýldýz', 'emre.yildiz@example.com', '2025-04-09', '1994-12-12', 'M', 8, 1),
('Gamze', 'Çelik', 'gamze.celik@example.com', '2025-12-15', '1991-04-19', 'F', 9, 1),
('Hakan', 'Öztürk', 'hakan.ozturk@example.com', '2025-07-01', '1988-10-10', 'M', 10, 1),
('Nazlý', 'Er', 'nazli.er@example.com', '2024-06-30', '1992-08-08', 'F', 2, 1),
('Kerem', 'Deniz', 'kerem.deniz@example.com', '2025-01-02', '1995-05-05', 'M', 3, 1),
('Sibel', 'Yavuz', 'sibel.yavuz@example.com', '2025-09-09', '1985-11-11', 'F', 5, 1),
('Tolga', 'Aksu', 'tolga.aksu@example.com', '2025-11-30', '1990-03-25', 'M', 4, 1),
('Gül', 'Tan', 'gul.tan@example.com', '2025-05-15', '1993-12-03', 'F', 1, 1),
('Barýþ', 'Bozkurt', 'baris.bozkurt@example.com', '2025-10-01', '1991-07-20', 'M', 6, 1),
('Merve', 'Aslan', 'merve.aslan@example.com', '2025-03-05', '1990-09-12', 'F', 3, 1),
('Deniz', 'Uçar', 'deniz.ucar@example.com', '2022-08-10', '1988-04-02', 'F', 8, 1),
('Onur', 'Kara', 'onur.kara@example.com', '2025-06-01', '1989-01-01', 'M', 7, 1),
('Selin', 'Duman', 'selin.duman@example.com', '2025-07-20', '1994-02-28', 'F', 10, 1);
