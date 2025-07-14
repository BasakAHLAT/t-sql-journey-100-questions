-- Şema oluşturuluyor
CREATE SCHEMA s13;
GO

-- Şehirler tablosu
CREATE TABLE s13.Cities (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(100) NOT NULL
);

-- Oteller tablosu
CREATE TABLE s13.Hotels (
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(150) NOT NULL,
    CityID INT NOT NULL,
    Rating DECIMAL(2,1) CHECK (Rating BETWEEN 0 AND 5),
    FOREIGN KEY (CityID) REFERENCES s13.Cities(CityID)
);

-- Yorumlar tablosu
CREATE TABLE s13.Reviews (
    ReviewID INT PRIMARY KEY,
    HotelID INT NOT NULL,
    ReviewText VARCHAR(MAX),
    ReviewDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (HotelID) REFERENCES s13.Hotels(HotelID)
);

-- Şehir verileri
INSERT INTO s13.Cities VALUES
(1, 'İstanbul'),
(2, 'Ankara'),
(3, 'İzmir'),
(4, 'Antalya'),
(5, 'Bursa');

-- Otel verileri
INSERT INTO s13.Hotels VALUES
(101, 'Sea Breeze Resort', 4, 4.5),
(102, 'City Central Hotel', 1, 4.1),
(103, 'Mountain Lodge', 2, 3.9),
(104, 'Urban Stay', 3, 4.2),
(105, 'Coastal Inn', 4, 4.8),
(106, 'Old Town Hotel', 1, 3.7),
(107, 'Forest Escape', 5, 4.3),
(108, 'Budget Bliss', 2, 3.5),
(109, 'Grand Palace', 3, 4.6),
(110, 'Comfort Zone', 5, 4.0);

-- Yorum verileri
INSERT INTO s13.Reviews VALUES
(1, 101, 'Excellent view and breakfast!', '2024-06-01'),
(2, 101, 'Nice location, rooms were clean.', '2024-06-03'),
(3, 102, 'Helpful staff and central location.', '2024-06-05'),
(4, 102, 'A bit noisy but overall good.', '2024-06-06'),
(5, 104, 'Amazing service and spa.', '2024-06-10'),
(6, 104, 'Room service could be improved.', '2024-06-11'),
(7, 105, 'Best experience ever!', '2024-06-15'),
(8, 105, 'Perfect for family vacation.', '2024-06-17'),
(9, 107, 'Hidden gem with nature all around.', '2024-06-20'),
(10, 109, 'Luxurious and stylish interior.', '2024-06-25'),
(11, 109, 'Top notch food and comfort.', '2024-06-26');