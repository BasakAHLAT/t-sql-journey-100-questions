-- �nsan Kaynaklar� Sistemi Veritaban� Test Verisi � 2025 ��e Al�m Verisi

-- 1. Departmanlar tablosu
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL
);

-- 2. Pozisyonlar tablosu
CREATE TABLE Positions (
    PositionID INT PRIMARY KEY IDENTITY(1,1),
    PositionTitle VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 3. �al��anlar tablosu
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    HireDate DATE NOT NULL,
    BirthDate DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    PositionID INT NOT NULL,
    IsActive BIT DEFAULT 1,
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);

-- Departman verileri
INSERT INTO Departments (DepartmentName) VALUES
('�nsan Kaynaklar�'),
('Sat��'),
('Yaz�l�m Geli�tirme'),
('Finans'),
('Pazarlama');

-- Pozisyon verileri
INSERT INTO Positions (PositionTitle, DepartmentID) VALUES
('�K Uzman�', 1),
('Sat�� Temsilcisi', 2),
('Yaz�l�m Geli�tirici', 3),
('Finans Analisti', 4),
('Pazarlama Uzman�', 5),
('K�demli Geli�tirici', 3),
('Muhasebeci', 4),
('Sat�� M�d�r�', 2),
('�K M�d�r�', 1),
('Dijital Pazarlama Uzman�', 5);

-- �al��an verileri
INSERT INTO Employees (FirstName, LastName, Email, HireDate, BirthDate, Gender, PositionID, IsActive) VALUES
('Ay�e', 'Y�lmaz', 'ayse.yilmaz@example.com', '2025-01-10', '1992-03-14', 'F', 1, 1),
('Mehmet', 'Demir', 'mehmet.demir@example.com', '2025-03-22', '1989-07-08', 'M', 2, 1),
('Zeynep', 'Kaya', 'zeynep.kaya@example.com', '2024-12-01', '1995-11-23', 'F', 3, 1),
('Ali', 'Ko�', 'ali.koc@example.com', '2025-06-30', '1990-02-11', 'M', 4, 1),
('Elif', '�ahin', 'elif.sahin@example.com', '2025-02-18', '1993-09-30', 'F', 5, 1),
('Burak', 'Arslan', 'burak.arslan@example.com', '2025-08-05', '1987-06-17', 'M', 6, 1),
('Ceren', 'Ayd�n', 'ceren.aydin@example.com', '2023-10-15', '1996-01-22', 'F', 7, 1),
('Emre', 'Y�ld�z', 'emre.yildiz@example.com', '2025-04-09', '1994-12-12', 'M', 8, 1),
('Gamze', '�elik', 'gamze.celik@example.com', '2025-12-15', '1991-04-19', 'F', 9, 1),
('Hakan', '�zt�rk', 'hakan.ozturk@example.com', '2025-07-01', '1988-10-10', 'M', 10, 1),
('Nazl�', 'Er', 'nazli.er@example.com', '2024-06-30', '1992-08-08', 'F', 2, 1),
('Kerem', 'Deniz', 'kerem.deniz@example.com', '2025-01-02', '1995-05-05', 'M', 3, 1),
('Sibel', 'Yavuz', 'sibel.yavuz@example.com', '2025-09-09', '1985-11-11', 'F', 5, 1),
('Tolga', 'Aksu', 'tolga.aksu@example.com', '2025-11-30', '1990-03-25', 'M', 4, 1),
('G�l', 'Tan', 'gul.tan@example.com', '2025-05-15', '1993-12-03', 'F', 1, 1),
('Bar��', 'Bozkurt', 'baris.bozkurt@example.com', '2025-10-01', '1991-07-20', 'M', 6, 1),
('Merve', 'Aslan', 'merve.aslan@example.com', '2025-03-05', '1990-09-12', 'F', 3, 1),
('Deniz', 'U�ar', 'deniz.ucar@example.com', '2022-08-10', '1988-04-02', 'F', 8, 1),
('Onur', 'Kara', 'onur.kara@example.com', '2025-06-01', '1989-01-01', 'M', 7, 1),
('Selin', 'Duman', 'selin.duman@example.com', '2025-07-20', '1994-02-28', 'F', 10, 1);