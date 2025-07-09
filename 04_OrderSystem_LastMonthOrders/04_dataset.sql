CREATE SCHEMA s04;

-- Customers tablosu
CREATE TABLE s04.Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    RegisterDate DATE NOT NULL
);

-- Orders tablosu
CREATE TABLE s04.Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) CHECK (TotalAmount >= 0),
    Status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES s04.Customers(CustomerID)
);

-- Customers verisi
INSERT INTO s04.Customers VALUES
(1, 'Ayþe Yýlmaz', 'ayse@example.com', '2024-11-02'),
(2, 'Mehmet Demir', 'mehmet@example.com', '2025-01-10'),
(3, 'Zeynep Koç', 'zeynep@example.com', '2024-12-25'),
(4, 'Ali Can', 'ali@example.com', '2025-06-01'),
(5, 'Elif Arslan', 'elif@example.com', '2024-07-10');

-- Orders verisi
INSERT INTO s04.Orders VALUES
(101, 1, '2025-05-10', 120.50, 'Delivered'),
(102, 2, '2025-06-15', 75.00, 'Cancelled'),
(103, 3, '2025-06-20', 200.00, 'Delivered'),
(104, 4, '2025-07-01', 450.90, 'Pending'),
(105, 2, '2025-07-05', 300.00, 'Shipped'),
(106, 5, '2025-06-10', 20.00, 'Delivered'),
(107, 4, '2025-07-08', 80.00, 'Processing'),
(108, 1, '2025-07-09', 150.00, 'Delivered'),
(109, 3, '2025-05-01', 220.00, 'Delivered'),
(110, 5, '2025-07-07', 90.00, 'Delivered');
