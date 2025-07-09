
-- Şema oluşturuluyor
CREATE SCHEMA s09;

-- Araçlar tablosu
CREATE TABLE s09.Cars (
    CarID INT PRIMARY KEY,
    Model VARCHAR(100) NOT NULL,
    Plate VARCHAR(20) NOT NULL UNIQUE,
    Kilometer NVARCHAR(50) NOT NULL -- Sayı ama string girilmiş olabilir
);

-- Veri ekleme (bazı değerler sayı formatında ama karakter şeklinde)
INSERT INTO s09.Cars VALUES
(1, 'Renault Clio', '34ABC123', '48000'),
(2, 'Fiat Egea', '06XYZ789', '52000'),
(3, 'Toyota Corolla', '35MTR345', '49999'),
(4, 'Ford Focus', '16BUR890', '50001'),
(5, 'Volkswagen Golf', '34GOLF67', '47000'),
(6, 'Peugeot 301', '01ADN101', '49.999'),
(7, 'Opel Astra', '34OPL222', '48000 KM'),
(8, 'Hyundai i20', '07ANT333', '49000'),
(9, 'Honda Civic', '42KNY987', 'NaN'),
(10, 'Citroen C-Elysee', '10BAL543', '49500');
