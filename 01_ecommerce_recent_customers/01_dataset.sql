DROP TABLE s01.Cities

CREATE SCHEMA s01;

-- Şehirler tablosu
CREATE TABLE s01.Cities (
    CityID INT IDENTITY(1,1) PRIMARY KEY,
    CityName VARCHAR(100) NOT NULL UNIQUE
);

-- Müşteriler tablosu
CREATE TABLE s01.Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    RegistrationDate DATE NOT NULL CHECK (RegistrationDate >= '2000-01-01'),
    CityID INT FOREIGN KEY REFERENCES s01.Cities(CityID)
);

-- Ürünler tablosu
CREATE TABLE s01.Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    StockQuantity INT NOT NULL DEFAULT 0 CHECK (StockQuantity >= 0),
    IsActive BIT NOT NULL DEFAULT 1
);

-- Siparişler tablosu
CREATE TABLE s01.Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL FOREIGN KEY REFERENCES s01.Customers(CustomerID),
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0)
);

-- Sipariş detayları tablosu
CREATE TABLE s01.OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL FOREIGN KEY REFERENCES s01.Orders(OrderID),
    ProductID INT NOT NULL FOREIGN KEY REFERENCES s01.Products(ProductID),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0)
);

-- Şehir verileri
INSERT INTO s01.Cities (CityName) VALUES
('İstanbul'), ('Ankara'), ('İzmir'), ('Bursa'), ('Antalya');

-- Müşteri verileri (bazıları son 7 günde kayıtlı)
INSERT INTO s01.Customers (FirstName, LastName, Email, RegistrationDate, CityID) VALUES
('Ayşe', 'Yılmaz', 'ayse.yilmaz@example.com', CAST(GETDATE() AS DATE), 1),
('Mehmet', 'Demir', 'mehmet.demir@example.com', CAST(GETDATE()-1 AS DATE), 2),
('Elif', 'Kaya', 'elif.kaya@example.com', CAST(GETDATE()-2 AS DATE), 3),
('Ahmet', 'Şahin', 'ahmet.sahin@example.com', CAST(GETDATE()-5 AS DATE), 4),
('Zeynep', 'Çelik', 'zeynep.celik@example.com', CAST(GETDATE()-6 AS DATE), 1),
('Ali', 'Koç', 'ali.koc@example.com', CAST(GETDATE()-7 AS DATE), 2),
('Fatma', 'Aslan', 'fatma.aslan@example.com', CAST(GETDATE()-8 AS DATE), 3),
('Burak', 'Yıldız', 'burak.yildiz@example.com', '2023-12-25', 1),
('Derya', 'Güneş', 'derya.gunes@example.com', '2023-10-01', 4),
('Can', 'Aydın', 'can.aydin@example.com', '2022-09-12', 5);

-- Ürün verileri
INSERT INTO s01.Products (ProductName, Price, StockQuantity, IsActive) VALUES
('Laptop', 15000.00, 12, 1),
('Telefon', 8000.00, 35, 1),
('Kulaklık', 450.00, 100, 1),
('Klavye', 250.00, 60, 1),
('Mouse', 150.00, 80, 1),
('Monitör', 2300.00, 15, 1),
('Webcam', 600.00, 20, 1),
('Yazıcı', 1800.00, 10, 1),
('Tablet', 5000.00, 18, 1),
('Akıllı Saat', 1200.00, 50, 1);

-- Siparişler
INSERT INTO s01.Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, CAST(GETDATE()-1 AS DATE), 8300.00),
(2, CAST(GETDATE()-3 AS DATE), 9450.00),
(3, CAST(GETDATE()-5 AS DATE), 690.00),
(4, CAST(GETDATE()-10 AS DATE), 2300.00),
(5, CAST(GETDATE()-15 AS DATE), 5000.00);

-- Sipariş detayları
INSERT INTO s01.OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 2, 1, 8000.00),
(1, 5, 2, 150.00),
(2, 1, 1, 15000.00),
(2, 4, 1, 250.00),
(3, 3, 3, 230.00),
(4, 6, 1, 2300.00),
(5, 9, 1, 5000.00);


