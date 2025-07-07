-- Kategoriler tablosu
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- �r�nler tablosu
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    StockQuantity INT NOT NULL DEFAULT 0 CHECK (StockQuantity >= 0),
    IsActive BIT NOT NULL DEFAULT 1,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
);

-- Kategori verileri
INSERT INTO Categories (CategoryName) VALUES
('Elektronik'), ('Kitap'), ('Giyim'), ('Ev & Ya�am'), ('Oyuncak');

-- �r�n verileri (�e�itli fiyat aral�klar�nda)
INSERT INTO Products (ProductName, Price, StockQuantity, IsActive, CategoryID) VALUES
('USB Kablo', 4.99, 120, 1, 1),
('Kablosuz Mouse', 11.50, 80, 1, 1),
('Roman - Simyac�', 6.75, 60, 1, 2),
('Defter Seti', 3.90, 200, 1, 2),
('T-Shirt (Beyaz)', 9.99, 100, 1, 3),
('Sweatshirt', 29.90, 45, 1, 3),
('Bambu Kesme Tahtas�', 7.25, 150, 1, 4),
('Yast�k K�l�f� Seti', 8.80, 70, 1, 4),
('Pelu� Oyuncak Ay�', 18.00, 30, 1, 5),
('Mini Puzzle 100 par�a', 5.50, 90, 1, 5),
('Bluetooth Hoparl�r', 22.90, 40, 1, 1),
('�ocuk Kitab� - Renkleri ��reniyorum', 2.99, 75, 1, 2),
('Kad�n �orap (3�l�)', 4.49, 180, 1, 3),
('Dekoratif Mum', 9.50, 60, 1, 4),
('Ah�ap Yapboz Seti', 13.99, 25, 1, 5),
('Spiral Not Defteri', 1.99, 210, 1, 2),
('Bebek Tulum', 12.50, 35, 1, 3),
('Organizer Kutusu', 6.00, 95, 1, 4),
('Oyuncak Araba', 9.00, 40, 1, 5),
('Gece Lambas�', 14.75, 55, 1, 1);
