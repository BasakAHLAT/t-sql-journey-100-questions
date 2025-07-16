-- 05_as.sql – AS (Alias) Kullanımı Örnekleri

-- 1. FirstName sütununu 'Ad' olarak adlandır
SELECT FirstName AS Ad
FROM s0.Customers;

-- 2. Maaş bilgilerini 'AylikMaas' adıyla göster
SELECT Salary AS AylikMaas
FROM s0.Employees;

-- 3. Yıllık maaşı hesaplayıp 'YillikMaas' adını ver
SELECT FirstName, Salary, Salary * 12 AS YillikMaas
FROM s0.Employees;

-- 4. Siparişleri 'o', müşterileri 'c' olarak adlandır
SELECT o.OrderID, c.FirstName
FROM s0.Orders AS o
JOIN s0.Customers AS c ON o.CustomerID = c.CustomerID;

-- 5. JOIN işlemi sırasında kısa alias kullanımı
SELECT o.OrderID AS SiparisID, c.FirstName AS MusteriAd
FROM s0.Orders o
JOIN s0.Customers c ON o.CustomerID = c.CustomerID;

-- 6. Ad ve soyadı birleştirip 'TamAd' olarak adlandır
SELECT FirstName + ' ' + LastName AS TamAd
FROM s0.Employees;

-- 7. Sipariş tutarına vergi ekleyip alias ver
SELECT OrderID, TotalAmount, TotalAmount * 1.18 AS VergiliTutar
FROM s0.Orders;

-- 8. Sadece tarih bilgisi çıkarıp alias ile adlandır
SELECT CAST(OrderDate AS DATE) AS SadeceTarih
FROM s0.Orders;

-- 9. Müşteri sayısını say ve alias ver
SELECT COUNT(*) AS MusteriSayisi
FROM s0.Customers;

-- 10. Uzun sütunları sadeleştirerek alias kullan
SELECT p.ProductName AS UrunAdi, p.Price AS Fiyat
FROM s0.Products p;