
-- Şema oluşturuluyor
CREATE SCHEMA s06;

-- Yazarlar tablosu
CREATE TABLE s06.Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL
);

-- Kategoriler tablosu
CREATE TABLE s06.Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

-- Kitaplar tablosu
CREATE TABLE s06.Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT NOT NULL,
    CategoryID INT NOT NULL,
    PageCount INT NOT NULL CHECK (PageCount > 0),
    FOREIGN KEY (AuthorID) REFERENCES s06.Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES s06.Categories(CategoryID)
);

-- Yazar verileri
INSERT INTO s06.Authors VALUES
(1, 'Orhan Pamuk'),
(2, 'Elif Şafak'),
(3, 'George Orwell'),
(4, 'J.K. Rowling'),
(5, 'Ahmet Ümit'),
(6, 'Fyodor Dostoyevski'),
(7, 'Sabahattin Ali'),
(8, 'Yuval Noah Harari'),
(9, 'Franz Kafka'),
(10, 'Jane Austen');

-- Kategori verileri
INSERT INTO s06.Categories VALUES
(1, 'Roman'),
(2, 'Tarih'),
(3, 'Bilim'),
(4, 'Felsefe'),
(5, 'Klasik');

-- Kitap verileri
INSERT INTO s06.Books VALUES
(1, 'Beyaz Kale', 1, 1, 208),
(2, 'Aşk', 2, 1, 354),
(3, '1984', 3, 1, 328),
(4, 'Harry Potter ve Zümrüdüanka Yoldaşlığı', 4, 1, 870),
(5, 'Kavim', 5, 1, 560),
(6, 'Suç ve Ceza', 6, 5, 672),
(7, 'Kürk Mantolu Madonna', 7, 1, 160),
(8, 'Sapiens', 8, 3, 512),
(9, 'Dava', 9, 5, 240),
(10, 'Aşk ve Gurur', 10, 5, 432),
(11, 'Anna Karenina', 6, 5, 864),
(12, 'Hayvan Çiftliği', 3, 1, 112),
(13, '21. Yüzyıl için 21 Ders', 8, 3, 448),
(14, 'Karamazov Kardeşler', 6, 5, 1024);
