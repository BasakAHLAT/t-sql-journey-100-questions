-- 11_avg.sql – AVG() Fonksiyonu Örnekleri

-- 1. Ürün fiyatlarının ortalamasını hesapla
SELECT AVG(Price) AS OrtalamaFiyat
FROM s0.Products;

-- 2. Çalışan maaşlarının ortalamasını al
SELECT AVG(Salary) AS OrtalamaMaas
FROM s0.Employees;

-- 3. Ödeme tutarlarının ortalamasını bul
SELECT AVG(Amount) AS OrtalamaOdemeTutari
FROM s0.Payments;

-- 4. Her pozisyon için ortalama maaş
SELECT Position, AVG(Salary) AS OrtalamaMaas
FROM s0.Employees
GROUP BY Position;

-- 5. Her kategori için ortalama ürün fiyatı
SELECT CategoryID, AVG(Price) AS OrtalamaKategoriFiyati
FROM s0.Products
GROUP BY CategoryID;

-- 6. Her müşteri için ortalama ödeme tutarı
SELECT CustomerID, AVG(Amount) AS OrtalamaOdeme
FROM s0.Payments
GROUP BY CustomerID;

-- 7. Kitapların ortalama sayfa sayısı
SELECT AVG(PageCount) AS OrtalamaSayfa
FROM s0.Books;

-- 8. Aylık ortalama ödeme (yıl-ay gruplama ile)
SELECT FORMAT(PaymentDate, 'yyyy-MM') AS Ay, AVG(Amount) AS AylikOrtalama
FROM s0.Payments
GROUP BY FORMAT(PaymentDate, 'yyyy-MM');

-- 9. Etkinliklerin günlük ortalama adedi (varsayım amaçlı)
SELECT COUNT(*) * 1.0 / COUNT(DISTINCT EventDate) AS GunlukOrtalamaEtkinlik
FROM s0.Events;

-- 10. Departman bazında ortalama maaş
SELECT DepartmentID, AVG(Salary) AS OrtalamaMaas
FROM s0.Employees
GROUP BY DepartmentID;