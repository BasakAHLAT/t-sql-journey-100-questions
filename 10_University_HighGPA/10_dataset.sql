
-- Şema oluşturuluyor
CREATE SCHEMA s10;

-- Danışmanlar tablosu
CREATE TABLE s10.Advisors (
    AdvisorID INT PRIMARY KEY,
    AdvisorName VARCHAR(100) NOT NULL
);

-- Bölümler tablosu
CREATE TABLE s10.Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Öğrenciler tablosu
CREATE TABLE s10.Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    AdvisorID INT NOT NULL,
    GPA DECIMAL(3,2) CHECK (GPA >= 0 AND GPA <= 4),
    FOREIGN KEY (DepartmentID) REFERENCES s10.Departments(DepartmentID),
    FOREIGN KEY (AdvisorID) REFERENCES s10.Advisors(AdvisorID)
);

-- Danışman verileri
INSERT INTO s10.Advisors VALUES
(1, 'Prof. Dr. Ayşe Yıldız'),
(2, 'Doç. Dr. Mehmet Can'),
(3, 'Dr. Öğr. Üyesi Elif Demir'),
(4, 'Prof. Dr. Cemal Tunç'),
(5, 'Doç. Dr. Aslı Güneş');

-- Bölüm verileri
INSERT INTO s10.Departments VALUES
(1, 'Bilgisayar Mühendisliği'),
(2, 'Elektrik-Elektronik Mühendisliği'),
(3, 'Makine Mühendisliği'),
(4, 'Endüstri Mühendisliği'),
(5, 'İşletme');

-- Öğrenci verileri
INSERT INTO s10.Students VALUES
(101, 'Ali Vural', 1, 1, 3.75),
(102, 'Ayşe Demir', 2, 2, 3.40),
(103, 'Mehmet Kaya', 3, 3, 3.90),
(104, 'Zeynep Koç', 1, 1, 2.85),
(105, 'Canan Aydın', 4, 4, 3.60),
(106, 'Emre Şahin', 5, 5, 3.20),
(107, 'Deniz Arslan', 2, 2, 3.55),
(108, 'Büşra Güneş', 1, 1, 4.00),
(109, 'Murat Öz', 3, 3, 2.95),
(110, 'Hatice Kurt', 4, 4, 3.80);
