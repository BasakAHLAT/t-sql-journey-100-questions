-- 02_dateadd.sql – DATEADD() Fonksiyonu Örnekleri (Güncellenmiş)

-- 1. Son 7 günde kayıt olan müşterileri getir
SELECT *
FROM s0.Customers
WHERE RegisteredAt >= DATEADD(DAY, -7, GETDATE());

-- 2. 2025-01-01 tarihinden sonraki 1 ayda oluşturulan siparişleri listele
SELECT *
FROM s0.Orders
WHERE OrderDate BETWEEN '2025-01-01' AND DATEADD(MONTH, 1, '2025-01-01');

-- 3. 2024-12-01 sonrası 7 gün içinde gerçekleşecek etkinlikleri bul
SELECT *
FROM s0.Events
WHERE EventDate BETWEEN '2024-12-01' AND DATEADD(DAY, 7, '2024-12-01');

-- 4. 3 ay önce işe alınan çalışanları filtrele
SELECT *
FROM s0.Employees
WHERE HireDate <= DATEADD(MONTH, -3, '2025-07-01');

-- 5. Önümüzdeki 10 gün içinde biten abonelikleri getir
SELECT *
FROM s0.Subscriptions
WHERE EndDate BETWEEN GETDATE() AND DATEADD(DAY, 10, GETDATE());

-- 6. 2025-07-14 12:00 itibariyle son 6 saatte yapılan ödemeler
SELECT *
FROM s0.Payments
WHERE PaymentDate >= DATEADD(HOUR, -6, '2025-07-14 12:00:00');

-- 7. 2022-01-01 tarihinden 1 yıl önce yayınlanmış kitapları getir
SELECT *
FROM s0.Books
WHERE PublishedDate < DATEADD(YEAR, -1, '2023-01-01');

-- 8. 2025-07-01 sonrası 5 gün içinde gerçekleşecek uçuşlar
SELECT *
FROM s0.Flights
WHERE DepartureTime BETWEEN '2025-07-01' AND DATEADD(DAY, 5, '2025-07-01');

-- 9. Çalışanların işe alım tarihine göre 1 yıl sonraki değerlendirme tarihini hesapla
SELECT FirstName, LastName, HireDate,
       DATEADD(YEAR, 1, HireDate) AS DeğerlendirmeTarihi
FROM s0.Employees;

-- 10. Test verisi ekleme – bugünden 3 gün sonrası tarihli
-- INSERT INTO s0.Customers (CustomerID, FirstName, LastName, Email, RegisteredAt, MembershipType)
-- VALUES (999, 'Zaman', 'Testi', 'zaman@example.com', DATEADD(DAY, 3, GETDATE()), 'Basic');