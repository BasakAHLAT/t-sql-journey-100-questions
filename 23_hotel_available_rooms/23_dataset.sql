
-- Şema oluştur
CREATE SCHEMA s23;
GO

-- Odalar tablosu
CREATE TABLE s23.Rooms (
    RoomID INT PRIMARY KEY,
    RoomNumber VARCHAR(10) NOT NULL,
    RoomType VARCHAR(50) NOT NULL,
    Capacity INT CHECK (Capacity > 0)
);

-- Rezervasyonlar tablosu
CREATE TABLE s23.Reservations (
    ReservationID INT PRIMARY KEY,
    RoomID INT NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    FOREIGN KEY (RoomID) REFERENCES s23.Rooms(RoomID)
);

-- Oda verileri
INSERT INTO s23.Rooms VALUES
(1, '101', 'Tek Kişilik', 1),
(2, '102', 'Çift Kişilik', 2),
(3, '103', 'Aile Odası', 4),
(4, '104', 'Tek Kişilik', 1),
(5, '105', 'Çift Kişilik', 2),
(6, '106', 'Süit', 3),
(7, '107', 'Aile Odası', 5),
(8, '108', 'Tek Kişilik', 1),
(9, '109', 'Çift Kişilik', 2),
(10, '110', 'Süit', 3);

-- Rezervasyon verileri
INSERT INTO s23.Reservations VALUES
(201, 1, '2025-08-01', '2025-08-05'),
(202, 2, '2025-08-03', '2025-08-10'),
(203, 3, '2025-08-05', '2025-08-08'),
(204, 4, '2025-08-02', '2025-08-04'),
(205, 6, '2025-08-04', '2025-08-07'),
(206, 7, '2025-08-01', '2025-08-06'),
(207, 9, '2025-08-03', '2025-08-05');
