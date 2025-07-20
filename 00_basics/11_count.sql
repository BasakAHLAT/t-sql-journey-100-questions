-- 10_count.sql – COUNT() Fonksiyonu Örnekleri

-- 1. Sistemdeki toplam müşteri sayısı
SELECT COUNT(*) AS ToplamMusteri
FROM s0.Customers;

-- 2. Stokta ürünü olan ürün sayısı
SELECT COUNT(*) AS StoktaUrun
FROM s0.Products
WHERE Stock > 0;

-- 3. Hiç sipariş verilmemiş müşteri sayısı
SELECT COUNT(*) AS SiparisVermemisMusteri
FROM s0.Customers c
LEFT JOIN s0.Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- 4. Her müşterinin verdiği sipariş sayısı
SELECT CustomerID, COUNT(*) AS SiparisSayisi
FROM s0.Orders
GROUP BY CustomerID;

-- 5. Her kategorideki ürün sayısı
SELECT CategoryID, COUNT(*) AS UrunSayisi
FROM s0.Products
GROUP BY CategoryID;

-- 6. Boş olmayan e-posta sayısı
SELECT COUNT(Email) AS GecerliEmailSayisi
FROM s0.Customers;

-- 7. Her departmandaki çalışan sayısı
SELECT DepartmentID, COUNT(*) AS CalisanSayisi
FROM s0.Employees
GROUP BY DepartmentID;

-- 8. Bugün yapılan ödeme sayısı
SELECT COUNT(*) AS BugunkuOdemeSayisi
FROM s0.Payments
WHERE CONVERT(DATE, PaymentDate) = CONVERT(DATE, GETDATE());

-- 9. Yayınlanmış kitap sayısı
SELECT COUNT(*) AS KitapSayisi
FROM s0.Books;

-- 10. Abonelik planına göre müşteri sayısı
SELECT PlanType, COUNT(*) AS MusteriSayisi
FROM s0.Subscriptions
GROUP BY PlanType;