
-- Şema oluştur
CREATE SCHEMA s21;
GO

-- Yazarlar tablosu
CREATE TABLE s21.Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL
);

-- Yazılar tablosu
CREATE TABLE s21.Posts (
    PostID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    PublishDate DATE NOT NULL,
    AuthorID INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES s21.Authors(AuthorID)
);

-- Etiketler tablosu
CREATE TABLE s21.Tags (
    TagID INT PRIMARY KEY,
    TagName VARCHAR(50) NOT NULL
);

-- PostTag eşleştirme tablosu (çok-çok ilişki)
CREATE TABLE s21.PostTags (
    PostID INT NOT NULL,
    TagID INT NOT NULL,
    PRIMARY KEY (PostID, TagID),
    FOREIGN KEY (PostID) REFERENCES s21.Posts(PostID),
    FOREIGN KEY (TagID) REFERENCES s21.Tags(TagID)
);

-- Yazarlar
INSERT INTO s21.Authors VALUES
(1, 'Ali Yılmaz'),
(2, 'Zeynep Demir'),
(3, 'Mert Kaya'),
(4, 'Selin Çelik');

-- Yazılar
INSERT INTO s21.Posts VALUES
(1, 'SQL Join Türleri', '2025-07-01', 1),
(2, 'Python ile Web Scraping', '2025-06-15', 2),
(3, 'SQL Performance Tuning', '2025-07-10', 1),
(4, 'JavaScript Temelleri', '2025-05-20', 3),
(5, 'Veri Modelleme Nedir?', '2025-07-05', 4),
(6, 'SQL View Kullanımı', '2025-07-12', 2),
(7, 'HTML ve CSS', '2025-04-18', 3);

-- Etiketler
INSERT INTO s21.Tags VALUES
(1, 'SQL'),
(2, 'Python'),
(3, 'JavaScript'),
(4, 'Web'),
(5, 'Veri');

-- PostTags
INSERT INTO s21.PostTags VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 5),
(6, 1),
(6, 5),
(7, 3),
(7, 4);
