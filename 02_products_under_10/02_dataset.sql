CREATE SCHEMA s02;

-- Kategoriler tablosu
CREATE TABLE s02.Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Ürünler tablosu
CREATE TABLE s02.Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    StockQuantity INT NOT NULL DEFAULT 0 CHECK (StockQuantity >= 0),
    IsActive BIT NOT NULL DEFAULT 1,
    CategoryID INT FOREIGN KEY REFERENCES s02.Categories(CategoryID)
);

-- Kategori verileri
INSERT INTO s02.Categories (CategoryName) VALUES
('Elektronik'), ('Kitap'), ('Giyim'), ('Ev & Yaþam'), ('Oyuncak');

-- Ürün verileri (çeþitli fiyat aralýklarýnda)
INSERT INTO s02.Products (ProductName, Price, StockQuantity, IsActive, CategoryID) VALUES
('USB Kablo', 4.99, 120, 1, 1),
('Kablosuz Mouse', 11.50, 80, 1, 1),
('Roman - Simyacý', 6.75, 60, 1, 2),
('Defter Seti', 3.90, 200, 1, 2),
('T-Shirt (Beyaz)', 9.99, 100, 1, 3),
('Sweatshirt', 29.90, 45, 1, 3),
('Bambu Kesme Tahtasý', 7.25, 150, 1, 4),
('Yastýk Kýlýfý Seti', 8.80, 70, 1, 4),
('Peluþ Oyuncak Ayý', 18.00, 30, 1, 5),
('Mini Puzzle 100 parça', 5.50, 90, 1, 5),
('Bluetooth Hoparlör', 22.90, 40, 1, 1),
('Çocuk Kitabý - Renkleri Öðreniyorum', 2.99, 75, 1, 2),
('Kadýn Çorap (3’lü)', 4.49, 180, 1, 3),
('Dekoratif Mum', 9.50, 60, 1, 4),
('Ahþap Yapboz Seti', 13.99, 25, 1, 5),
('Spiral Not Defteri', 1.99, 210, 1, 2),
('Bebek Tulum', 12.50, 35, 1, 3),
('Organizer Kutusu', 6.00, 95, 1, 4),
('Oyuncak Araba', 9.00, 40, 1, 5),
('Gece Lambasý', 14.75, 55, 1, 1);

INSERT INTO s02.Products (ProductName, Price, StockQuantity, IsActive, CategoryID)
VALUES ('Kategorisiz Ürün', 5.99, 10, 1, NULL);

INSERT INTO s02.Categories (CategoryName)
VALUES ('Boþ Kategori');


