-- Şema oluşturuluyor
CREATE SCHEMA s14;
GO

-- Departmanlar tablosu
CREATE TABLE s14.Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Pozisyonlar tablosu
CREATE TABLE s14.Positions (
    PositionID INT PRIMARY KEY,
    PositionTitle VARCHAR(100) NOT NULL
);

-- Çalışanlar tablosu
CREATE TABLE s14.Employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    PositionID INT NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    FOREIGN KEY (DepartmentID) REFERENCES s14.Departments(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES s14.Positions(PositionID)
);

-- Departman verileri
INSERT INTO s14.Departments VALUES
(1, 'Satış'),
(2, 'Pazarlama'),
(3, 'İK'),
(4, 'Finans'),
(5, 'BT');

-- Pozisyon verileri
INSERT INTO s14.Positions VALUES
(1, 'Satış Temsilcisi'),
(2, 'Satış Müdürü'),
(3, 'Pazarlama Uzmanı'),
(4, 'İK Uzmanı'),
(5, 'Yazılım Geliştirici'),
(6, 'Finansal Analist');

-- Çalışan verileri
INSERT INTO s14.Employees VALUES
(101, 'Ayşe Yılmaz', 1, 1, 19000.00),
(102, 'Mehmet Demir', 1, 2, 24000.00),
(103, 'Zeynep Kara', 1, 1, 21000.00),
(104, 'Ali Can', 2, 3, 23000.00),
(105, 'Deniz Güneş', 3, 4, 20000.00),
(106, 'Elif Şahin', 4, 6, 27000.00),
(107, 'Ahmet Kaya', 5, 5, 25000.00),
(108, 'Fatma Aydın', 1, 1, 18000.00),
(109, 'Murat Koç', 1, 2, 19500.00),
(110, 'Emine Öz', 2, 3, 22000.00),
(111, 'Burak Yıldız', 1, 1, 19999.99);