-- 04_joins.sql – JOIN Kullanımı (30 Farklı Örnek)

-- 1. INNER JOIN: Siparişler ile müşterileri eşleştir
SELECT o.OrderID, c.FirstName, c.LastName
FROM s0.Orders o
INNER JOIN s0.Customers c ON o.CustomerID = c.CustomerID;

-- 2. LEFT JOIN: Siparişi olmayan müşterileri de dahil et
SELECT c.FirstName, o.OrderID
FROM s0.Customers c
LEFT JOIN s0.Orders o ON c.CustomerID = o.CustomerID;

-- 3. RIGHT JOIN: Departmanı olmayan çalışanları kontrol et
SELECT d.DepartmentName, e.FirstName
FROM s0.Employees e
RIGHT JOIN s0.Departments d ON e.DepartmentID = d.DepartmentID;

-- 4. FULL JOIN: Müşteri-ödeme tüm eşleşme ve eksikleri getir
SELECT c.FirstName, p.Amount
FROM s0.Customers c
FULL JOIN s0.Payments p ON c.CustomerID = p.CustomerID;

-- 5. CROSS JOIN: Tüm kategori-ürün kombinasyonları
SELECT p.ProductName, c.CategoryName
FROM s0.Products p
CROSS JOIN s0.Categories c;

-- 6. INNER JOIN: Kitaplar ve yazarlar
SELECT b.Title, a.FirstName + ' ' + a.LastName AS Author
FROM s0.Books b
INNER JOIN s0.Authors a ON b.AuthorID = a.AuthorID;

-- 7. INNER JOIN: Abonelik ve müşteri bilgisi
SELECT s.PlanType, c.FirstName
FROM s0.Subscriptions s
JOIN s0.Customers c ON s.CustomerID = c.CustomerID;

-- 8. LEFT JOIN: Ödemesi olmayan müşterileri bul
SELECT c.CustomerID, c.FirstName
FROM s0.Customers c
LEFT JOIN s0.Payments p ON c.CustomerID = p.CustomerID
WHERE p.PaymentID IS NULL;

-- 9. LEFT JOIN: Departmanı olmayan çalışanlar
SELECT e.FirstName, d.DepartmentName
FROM s0.Employees e
LEFT JOIN s0.Departments d ON e.DepartmentID = d.DepartmentID;

-- 10. INNER JOIN: Sipariş ve müşteri şehir filtreli (hayali)
-- (Varsayım: Customers tablosunda şehir bilgisi olsaydı)
-- SELECT o.OrderID, c.FirstName
-- FROM s0.Orders o
-- JOIN s0.Customers c ON o.CustomerID = c.CustomerID
-- WHERE c.City = 'Istanbul';

-- 11. JOIN + GROUP BY: Müşterilere göre sipariş sayısı
SELECT c.FirstName, COUNT(o.OrderID) AS OrderCount
FROM s0.Customers c
LEFT JOIN s0.Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName;

-- 12. JOIN + WHERE: Son 30 gün içinde sipariş vermiş müşteriler
SELECT DISTINCT c.FirstName
FROM s0.Customers c
JOIN s0.Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= DATEADD(DAY, -30, GETDATE());

-- 13. JOIN ile kitap ve yazar eşleşmesi + filtre
SELECT b.Title, a.FirstName
FROM s0.Books b
JOIN s0.Authors a ON b.AuthorID = a.AuthorID
WHERE b.PageCount > 300;

-- 14. JOIN: Uçuşları olan şehirler (Departure ve Arrival)
SELECT f.FlightNumber, f.Departure, f.Arrival
FROM s0.Flights f;

-- 15. JOIN: Etkinlik türü ve konumu birlikte göster
SELECT EventName, Location, EventType
FROM s0.Events;

-- 16. LEFT JOIN: Ödeme yapılmamış abonelikler
SELECT s.SubscriptionID, p.PaymentID
FROM s0.Subscriptions s
LEFT JOIN s0.Payments p ON s.CustomerID = p.CustomerID
WHERE p.PaymentID IS NULL;

-- 17. INNER JOIN: Siparişler ve ürünler (varsayımsal eşleşme)
-- SELECT o.OrderID, p.ProductName
-- FROM s0.Orders o
-- JOIN s0.Products p ON o.ProductID = p.ProductID;

-- 18. FULL JOIN: Çalışan ve departman kombinasyonu
SELECT e.FirstName, d.DepartmentName
FROM s0.Employees e
FULL JOIN s0.Departments d ON e.DepartmentID = d.DepartmentID;

-- 19. CROSS JOIN: Abonelik türü ve plan kombinasyonları
SELECT c.MembershipType, s.PlanType
FROM s0.Customers c
CROSS JOIN s0.Subscriptions s;

-- 20. JOIN: Kitap yayım tarihi ile yazar doğum yılı
SELECT b.Title, a.BirthYear, b.PublishedDate
FROM s0.Books b
JOIN s0.Authors a ON b.AuthorID = a.AuthorID;

-- 21. LEFT JOIN: Ödeme yapılan müşteri adları
SELECT p.Amount, c.FirstName
FROM s0.Payments p
LEFT JOIN s0.Customers c ON p.CustomerID = c.CustomerID;

-- 22. LEFT JOIN: Boş stoklu ürünleri bul
SELECT p.ProductName, p.Stock, c.CategoryName
FROM s0.Products p
LEFT JOIN s0.Categories c ON p.CategoryID = c.CategoryID
WHERE p.Stock = 0;

-- 23. INNER JOIN: Etkinliklere göre filtreli liste
SELECT EventName, EventDate
FROM s0.Events
WHERE EventType = 'Workshop';

-- 24. LEFT JOIN: Ödeme olmayan kayıtlar
SELECT c.CustomerID, c.FirstName
FROM s0.Customers c
LEFT JOIN s0.Payments p ON c.CustomerID = p.CustomerID
WHERE p.PaymentID IS NULL;

-- 25. JOIN: Her uçuş için sabit verilerle eşleştirme (örnek)
-- CROSS JOIN uyarısı
SELECT f.FlightNumber, e.EventType
FROM s0.Flights f
CROSS JOIN s0.Events e;

-- 26. LEFT JOIN: Departmanı olmayan çalışan sayısı
SELECT COUNT(*) AS DepartmansizCalisan
FROM s0.Employees e
LEFT JOIN s0.Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- 27. JOIN + WHERE: Abonelik bitişi geçenler
SELECT s.SubscriptionID, s.EndDate
FROM s0.Subscriptions s
WHERE s.EndDate < GETDATE();

-- 28. JOIN: Etkinliklerin tarih sırasına göre listesi
SELECT EventName, EventDate
FROM s0.Events
ORDER BY EventDate DESC;

-- 29. JOIN: Çalışan – Departman – Pozisyon eşleşmesi
SELECT e.FirstName, e.Position, d.DepartmentName
FROM s0.Employees e
LEFT JOIN s0.Departments d ON e.DepartmentID = d.DepartmentID;

-- 30. JOIN: Her müşterinin toplam ödeme miktarı
SELECT c.FirstName, SUM(p.Amount) AS TotalPaid
FROM s0.Customers c
LEFT JOIN s0.Payments p ON c.CustomerID = p.CustomerID
GROUP BY c.FirstName;