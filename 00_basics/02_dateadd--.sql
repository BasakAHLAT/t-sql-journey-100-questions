-- 02_dateadd.sql – DATEADD() Fonksiyonu Örnekleri

-- 1. Son 7 günde kayıt olan müşterileri getir
SELECT *
FROM s0.Customers
WHERE RegisteredAt >= DATEADD(DAY, -7, GETDATE());

-- 2. Son 1 ayda oluşturulan siparişleri listele
SELECT *
FROM s0.Orders
WHERE OrderDate >= DATEADD(MONTH, -1, GETDATE());

-- 3. Gelecek hafta başlayacak etkinlikleri bul
SELECT *
FROM s0.Events
WHERE EventDate BETWEEN DATEADD(DAY, 1, GETDATE()) AND DATEADD(DAY, 7, GETDATE());

-- 4. 3 ay önce işe alınan çalışanları filtrele
SELECT *
FROM s0.Employees
WHERE HireDate <= DATEADD(MONTH, -3, GETDATE());

-- 5. Önümüzdeki 10 gün içinde biten abonelikleri bul
SELECT *
FROM s0.Subscriptions
WHERE EndDate BETWEEN GETDATE() AND DATEADD(DAY, 10, GETDATE());

-- 6. Son 6 saatte yapılan ödemeleri göster
SELECT *
FROM s0.Payments
WHERE PaymentDate >= DATEADD(HOUR, -6, GETDATE());

-- 7. 1 yıl önce yayınlanmış kitapları getir
SELECT *
FROM s0.Books
WHERE PublishedDate BETWEEN DATEADD(YEAR, -1, GETDATE()) AND GETDATE();

-- 8. Uçuşların 5 gün içinde gerçekleşecek olanlarını getir
SELECT *
FROM s0.Flights
WHERE DepartureTime BETWEEN GETDATE() AND DATEADD(DAY, 5, GETDATE());

-- 9. Çalışanların işe giriş tarihiyle şimdiki tarih arasında yıl farkını hesapla
SELECT EmployeeID, FirstName, LastName, HireDate,
       DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWorked
FROM s0.Employees;

-- 10. Yeni müşteri verisi eklerken gelecekteki kayıt tarihi (örnek test verisi)
-- INSERT INTO s0.Customers (CustomerID, FirstName, LastName, Email, RegisteredAt, MembershipType)
-- VALUES (999, 'Test', 'Future', 'future@example.com', DATEADD(DAY, 5, GETDATE()), 'Basic');
