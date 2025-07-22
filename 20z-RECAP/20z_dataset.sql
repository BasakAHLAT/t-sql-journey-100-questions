-- Şema
CREATE SCHEMA s20zrecap;
GO

-- Customers
CREATE TABLE s20zrecap.Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    RegistrationDate DATE
);

-- Orders
CREATE TABLE s20zrecap.Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES s20zrecap.Customers(CustomerID),
    OrderDate DATE
);

-- Products
CREATE TABLE s20zrecap.Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT
);

-- Categories
CREATE TABLE s20zrecap.Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- OrderDetails
CREATE TABLE s20zrecap.OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES s20zrecap.Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES s20zrecap.Products(ProductID),
    Quantity INT
);

-- Subscriptions
CREATE TABLE s20zrecap.Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES s20zrecap.Customers(CustomerID),
    EndDate DATE
);

-- Veriler
INSERT INTO s20zrecap.Customers VALUES
(1, 'Ahmet Yılmaz', 'ahmet@example.com', DATEADD(DAY, -10, GETDATE())),
(2, 'Ayşe Demir', 'ayse@example.com', DATEADD(DAY, -5, GETDATE())),
(3, 'Mehmet Kaya', 'mehmet@example.com', DATEADD(DAY, -35, GETDATE())),
(4, 'Zeynep Gül', 'zeynep@example.com', DATEADD(DAY, -2, GETDATE())),
(5, 'Ali Vural', 'ali@example.com', DATEADD(DAY, -20, GETDATE()));

INSERT INTO s20zrecap.Orders VALUES
(101, 2, DATEADD(DAY, -3, GETDATE())),
(102, 2, DATEADD(DAY, -1, GETDATE())),
(103, 3, DATEADD(DAY, -20, GETDATE())),
(104, 4, DATEADD(DAY, -1, GETDATE())),
(105, 5, DATEADD(DAY, -10, GETDATE()));

INSERT INTO s20zrecap.Products VALUES
(201, 'Laptop', 1),
(202, 'Mouse', NULL),
(203, 'Tablet', 2),
(204, 'Telefon', 1),
(205, 'Klavye', NULL);

INSERT INTO s20zrecap.Categories VALUES
(1, 'Elektronik'),
(2, 'Aksesuar');

INSERT INTO s20zrecap.OrderDetails VALUES
(301, 101, 201, 1),
(302, 101, 202, 2),
(303, 102, 203, 1),
(304, 104, 204, 1),
(305, 105, 205, 1);

INSERT INTO s20zrecap.Subscriptions VALUES
(1, 2, DATEADD(DAY, 15, GETDATE())),
(2, 3, DATEADD(DAY, -5, GETDATE())),
(3, 4, DATEADD(DAY, 3, GETDATE())),
(4, 5, DATEADD(DAY, -1, GETDATE()));
