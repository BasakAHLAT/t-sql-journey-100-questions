-- Şema oluşturuluyor
CREATE SCHEMA s12;
GO

-- Kategoriler tablosu
CREATE TABLE s12.Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);
GO

-- Ürünler tablosu
CREATE TABLE s12.Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    StockQuantity INT,
    LastStockUpdate DATE,
    FOREIGN KEY (CategoryID) REFERENCES s12.Categories(CategoryID),
    CHECK (StockQuantity >= 0 OR StockQuantity IS NULL)
);
GO

-- Kategori verileri
INSERT INTO s12.Categories (CategoryID, CategoryName) VALUES
(1, 'Elektronik'),
(2, 'Kitap'),
(3, 'Ev Eşyası'),
(4, 'Gıda'),
(5, 'Kırtasiye');

-- Ürün verileri
INSERT INTO s12.Products (ProductID, ProductName, CategoryID, StockQuantity, LastStockUpdate) VALUES
(101, 'Kablosuz Mouse', 1, 15, '2025-07-01'),
(102, 'HDMI Kablo', 1, 0, '2025-07-12'),
(103, 'Veritabanı Kitabı', 2, NULL, '2025-07-10'),
(104, 'Python Kitabı', 2, 4, '2025-06-25'),
(105, 'Blender', 3, 0, '2025-07-09'),
(106, 'Çamaşır Sepeti', 3, 3, '2025-07-08'),
(107, 'Makarna', 4, NULL, '2025-07-12'),
(108, 'Süt', 4, 0, '2025-07-11'),
(109, 'Defter', 5, 8, '2025-07-10'),
(110, 'Kalem', 5, NULL, '2025-07-02'),
(111, 'Buzdolabı', 1, NULL, NULL),
(112, 'Masa Lambası', 1, 0, NULL);