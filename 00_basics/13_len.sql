-- 12_len.sql – LEN() Fonksiyonu Örnekleri

-- 1. Müşteri adlarının uzunluğunu getir
SELECT FirstName, LEN(FirstName) AS AdUzunlugu
FROM s0.Customers;

-- 2. E-posta adresi 20 karakterden uzun olan müşteriler
SELECT Email, LEN(Email) AS EmailUzunlugu
FROM s0.Customers
WHERE LEN(Email) > 20;

-- 3. Ürün isimlerinin uzunluklarını listele
SELECT ProductName, LEN(ProductName) AS IsimUzunlugu
FROM s0.Products;

-- 4. Kitap başlığı 30 karakterden kısa olanlar
SELECT Title, LEN(Title) AS BaslikUzunlugu
FROM s0.Books
WHERE LEN(Title) < 30;

-- 5. Pozisyon adlarının uzunluklarını göster
SELECT Position, LEN(Position) AS PozisyonUzunlugu
FROM s0.Employees;

-- 6. Departman adlarını uzunluklarına göre sırala
SELECT DepartmentName, LEN(DepartmentName) AS Uzunluk
FROM s0.Departments
ORDER BY LEN(DepartmentName) DESC;

-- 7. Çalışan tam adı uzunluğu
SELECT FirstName + ' ' + LastName AS TamAd, LEN(FirstName + ' ' + LastName) AS KarakterSayisi
FROM s0.Employees;

-- 8. 15 karakterden uzun ürün isimlerini listele
SELECT ProductName, LEN(ProductName) AS Uzunluk
FROM s0.Products
WHERE LEN(ProductName) > 15;

-- 9. Etkinlik ismi boş olmayan kayıtları göster
SELECT EventName, LEN(EventName) AS IsimUzunlugu
FROM s0.Events
WHERE LEN(EventName) IS NOT NULL;

-- 10. Ortalama kitap adı uzunluğu
SELECT AVG(LEN(Title)) AS OrtalamaBaslikUzunlugu
FROM s0.Books;