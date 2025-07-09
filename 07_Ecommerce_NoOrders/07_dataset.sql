
-- Şema oluşturuluyor
CREATE SCHEMA s07;

-- Müşteri tablosu
CREATE TABLE s07.Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    City VARCHAR(50),
    RegistrationDate DATE NOT NULL
);

-- Sipariş tablosu
CREATE TABLE s07.Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL CHECK (TotalAmount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES s07.Customers(CustomerID)
);

-- Müşteri verileri
INSERT INTO s07.Customers VALUES
(1, 'Ali Yılmaz', 'ali@example.com', 'İstanbul', '2025-06-15'),
(2, 'Ayşe Demir', 'ayse@example.com', 'Ankara', '2025-06-20'),
(3, 'Mehmet Kaya', 'mehmet@example.com', 'İzmir', '2025-07-01'),
(4, 'Zeynep Koç', 'zeynep@example.com', 'Bursa', '2025-06-25'),
(5, 'Canan Aydın', 'canan@example.com', 'Antalya', '2025-06-30'),
(6, 'Emre Şahin', 'emre@example.com', 'İstanbul', '2025-07-05'),
(7, 'Deniz Arslan', 'deniz@example.com', 'Adana', '2025-07-07'),
(8, 'Büşra Güneş', 'busra@example.com', 'Konya', '2025-07-03'),
(9, 'Murat Öz', 'murat@example.com', 'Eskişehir', '2025-07-02'),
(10, 'Hatice Kurt', 'hatice@example.com', 'Samsun', '2025-07-06');

-- Sipariş verileri (bazı müşteriler hiç sipariş vermemiştir)
INSERT INTO s07.Orders VALUES
(101, 1, '2025-07-01', 250.00),
(102, 2, '2025-07-02', 120.50),
(103, 4, '2025-07-04', 320.75),
(104, 6, '2025-07-05', 85.00),
(105, 8, '2025-07-06', 150.90);
