-- Şema oluşturuluyor
CREATE SCHEMA s20;
GO

-- Hastalar tablosu
CREATE TABLE s20.Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL
);

-- Doktorlar tablosu
CREATE TABLE s20.Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL
);

-- Randevular tablosu
CREATE TABLE s20.Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentTime DATETIME NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES s20.Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES s20.Doctors(DoctorID)
);

-- Hasta verileri
INSERT INTO s20.Patients VALUES
(1, 'Ahmet Yılmaz'),
(2, 'Ayşe Demir'),
(3, 'Mehmet Çelik'),
(4, 'Zeynep Güneş'),
(5, 'Fatma Aslan');

-- Doktor verileri
INSERT INTO s20.Doctors VALUES
(1, 'Dr. Emre Kaya'),
(2, 'Dr. Elif Öztürk'),
(3, 'Dr. Hasan Koç'),
(4, 'Dr. Merve Aksoy');

-- Randevu verileri (bazıları bugün, bazıları başka günlerde)
INSERT INTO s20.Appointments VALUES
(101, 1, 1, DATEADD(HOUR, 9, CAST(GETDATE() AS DATETIME))),     -- bugün
(102, 2, 2, DATEADD(HOUR, 14, CAST(GETDATE() AS DATETIME))),    -- bugün
(103, 3, 3, DATEADD(DAY, 1, CAST(GETDATE() AS DATETIME))),      -- yarın
(104, 4, 4, DATEADD(DAY, -1, CAST(GETDATE() AS DATETIME))),     -- dün
(105, 5, 1, DATEADD(HOUR, 16, CAST(GETDATE() AS DATETIME)));    -- bugün