-- 10_groupby.sql – GROUP BY Kullanımı Örnekleri

-- 1. Her kategoride kaç ürün olduğunu say
SELECT CategoryID, COUNT(*) AS UrunSayisi
FROM s0.Products
GROUP BY CategoryID;

-- 2. Her departmandaki çalışan sayısını bul
SELECT DepartmentID, COUNT(*) AS CalisanSayisi
FROM s0.Employees
GROUP BY DepartmentID;

-- 3. Her müşteri için sipariş adedini getir
SELECT CustomerID, COUNT(*) AS SiparisSayisi
FROM s0.Orders
GROUP BY CustomerID;

-- 4. Her müşterinin toplam ödeme tutarını göster
SELECT CustomerID, SUM(Amount) AS ToplamOdeme
FROM s0.Payments
GROUP BY CustomerID;

-- 5. Her etkinlik türüne göre etkinlik sayısını listele
SELECT EventType, COUNT(*) AS EtkinlikSayisi
FROM s0.Events
GROUP BY EventType;

-- 6. Kitap yazarlarına göre kitap sayısını hesapla
SELECT AuthorID, COUNT(*) AS KitapSayisi
FROM s0.Books
GROUP BY AuthorID;

-- 7. Çalışan pozisyonlarına göre ortalama maaş hesapla
SELECT Position, AVG(Salary) AS OrtalamaMaas
FROM s0.Employees
GROUP BY Position;

-- 8. Abonelik planlarına göre müşteri sayısını say
SELECT PlanType, COUNT(*) AS MusteriSayisi
FROM s0.Subscriptions
GROUP BY PlanType;

-- 9. Her gün yapılan ödeme sayısını bul
SELECT CONVERT(DATE, PaymentDate) AS OdemeTarihi, COUNT(*) AS OdemeSayisi
FROM s0.Payments
GROUP BY CONVERT(DATE, PaymentDate);

-- 10. Her ürün için ortalama fiyatı listele (ürün ID bazlı, örnek amaçlı)
SELECT ProductID, AVG(Price) AS OrtalamaFiyat
FROM s0.Products
GROUP BY ProductID;